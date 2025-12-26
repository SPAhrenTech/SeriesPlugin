# Microsoft Developer Studio Generated NMAKE File, Based on TemplatePlugIn.dsp
!IF "$(CFG)" == ""
CFG=TemplatePlugIn - Win32 Debug
!MESSAGE No configuration specified. Defaulting to TemplatePlugIn - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "TemplatePlugIn - Win32 Release" && "$(CFG)" != "TemplatePlugIn - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "TemplatePlugIn.mak" CFG="TemplatePlugIn - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "TemplatePlugIn - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "TemplatePlugIn - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "TemplatePlugIn - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release
# Begin Custom Macros
OutDir=.\Release
# End Custom Macros

ALL : "$(OUTDIR)\TemplatePlugIn.dll"


CLEAN :
	-@erase "$(INTDIR)\TemplatePlugIn.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(OUTDIR)\TemplatePlugIn.dll"
	-@erase "$(OUTDIR)\TemplatePlugIn.exp"
	-@erase "$(OUTDIR)\TemplatePlugIn.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MT /W3 /GX /O2 /I "..\Win32\include\\" /Fp"$(INTDIR)\TemplatePlugIn.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TemplatePlugIn.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=..\Win32\lib\DMPlugInBasic.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /incremental:no /pdb:"$(OUTDIR)\TemplatePlugIn.pdb" /machine:I386 /out:"$(OUTDIR)\TemplatePlugIn.dll" /implib:"$(OUTDIR)\TemplatePlugIn.lib" 
LINK32_OBJS= \
	"$(INTDIR)\TemplatePlugIn.obj"

"$(OUTDIR)\TemplatePlugIn.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "TemplatePlugIn - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug
# Begin Custom Macros
OutDir=.\Debug
# End Custom Macros

ALL : "$(OUTDIR)\TemplatePlugIn.dll"


CLEAN :
	-@erase "$(INTDIR)\TemplatePlugIn.obj"
	-@erase "$(INTDIR)\vc60.idb"
	-@erase "$(INTDIR)\vc60.pdb"
	-@erase "$(OUTDIR)\TemplatePlugIn.dll"
	-@erase "$(OUTDIR)\TemplatePlugIn.exp"
	-@erase "$(OUTDIR)\TemplatePlugIn.ilk"
	-@erase "$(OUTDIR)\TemplatePlugIn.lib"
	-@erase "$(OUTDIR)\TemplatePlugIn.pdb"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP_PROJ=/nologo /MTd /W3 /Gm /GX /ZI /Od /I "..\Win32\include\\" /Fp"$(INTDIR)\TemplatePlugIn.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /o "NUL" /win32 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\TemplatePlugIn.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS="..\Win32\lib\DMPlugInBasic-Dbg.lib" kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /dll /incremental:yes /pdb:"$(OUTDIR)\TemplatePlugIn.pdb" /debug /machine:I386 /out:"$(OUTDIR)\TemplatePlugIn.dll" /implib:"$(OUTDIR)\TemplatePlugIn.lib" /pdbtype:sept 
LINK32_OBJS= \
	"$(INTDIR)\TemplatePlugIn.obj"

"$(OUTDIR)\TemplatePlugIn.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(INTDIR)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<


!IF "$(NO_EXTERNAL_DEPS)" != "1"
!IF EXISTS("TemplatePlugIn.dep")
!INCLUDE "TemplatePlugIn.dep"
!ELSE 
!MESSAGE Warning: cannot find "TemplatePlugIn.dep"
!ENDIF 
!ENDIF 


!IF "$(CFG)" == "TemplatePlugIn - Win32 Release" || "$(CFG)" == "TemplatePlugIn - Win32 Debug"
SOURCE=.\TemplatePlugIn.cpp

"$(INTDIR)\TemplatePlugIn.obj" : $(SOURCE) "$(INTDIR)"



!ENDIF 

