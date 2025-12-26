

#define _GATANPLUGIN_USES_LIBRARY_VERSION 2
#include "DMPlugInBasic.h"

#define _GATANPLUGIN_USE_CLASS_PLUGINMAIN
#include "DMPlugInMain.h"

using namespace Gatan;

#include <windows.h>
#include <Lmcons.h>

DM_StringToken_1Ref SpGetUsername( void )
{
	DM::String str;
	
	PLUG_IN_ENTRY
	
	DWORD size = UNLEN + 1;
	char username[ UNLEN + 1 ];
	GetUserName( username, &size );
	
	str = DM::String( username );

	PLUG_IN_EXIT

	return str.release();
}

class SeriesPlugin : public Gatan::PlugIn::PlugInMain
{
	virtual void Start();
	virtual void Run();
	virtual void Cleanup();
	virtual void End();

	typedef std::vector<DM::Function> FunctionList;
	typedef FunctionList::iterator functionPtr;
	FunctionList fFunctionList;
};

///
/// This is called when the plugin is loaded.  Whenever DM is
/// launched, it calls 'Start' for each installed plug-in.
/// When it is called, there is no guarantee that any given
/// plugin has already been loaded, so the code should not
/// rely on scripts installed from other plugins.  The primary
/// use is to install script functions.
///
void SeriesPlugin::Start()
{
	fFunctionList.push_back( AddFunction( 0, "dm_string SpGetUsername( void )", 3, (void *) SpGetUsername ) );
}

///
/// This is called when the plugin is loaded, after the 'Start' method.
/// Whenever DM is launched, it calls the 'Run' method for
/// each installed plugin after the 'Start' method has been called
/// for all such plugins and all script packages have been installed.
/// Thus it is ok to use script functions provided by other plugins.
///
void SeriesPlugin::Run()
{
	DM::Window results = DM::GetResultsWindow( true );
	PlugIn::gResultOut << "Initializing Series Plugin..." << std::endl;
}

///
/// This is called when the plugin is unloaded.  Whenever DM is
/// shut down, the 'Cleanup' method is called for all installed plugins
/// before script packages are uninstalled and before the 'End'
/// method is called for any plugin.  Thus, script functions provided
/// by other plugins are still available.  This method should release
/// resources allocated by 'Run'.
///
void SeriesPlugin::Cleanup()
{
	FunctionList::const_iterator functionPtr;

	for(	functionPtr = fFunctionList.begin(); 
			functionPtr != fFunctionList.end(); 
			++functionPtr )
	{
		RemoveFunction( *functionPtr );
	}
}

///
/// This is called when the plugin is unloaded.  Whenever DM is shut
/// down, the 'End' method is called for all installed plugins after
/// all script packages have been unloaded, and other installed plugins
/// may have already been completely unloaded, so the code should not
/// rely on scripts installed from other plugins.  This method should
/// release resources allocated by 'Start', and in particular should
/// uninstall all installed script functions.
///
void SeriesPlugin::End()
{
}

SeriesPlugin gSeriesPlugin;