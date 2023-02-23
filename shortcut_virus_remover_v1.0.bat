@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:-------------------------------------- 
    color 6
    echo ------------------------------------
    echo        shortcut virus remover
    echo ------------------------------------
    echo [1] Unhide folders and files hidden by shortcut virus
    echo [2] exit
    choice /C:12345 /N 
    set sv=%errorlevel%
    if %sv%==1 (call :svr)
    if %sv%==2 (call :ex)
:svr
    attrib -s -r -h *.* /s /d /l⁠ 
    color 2
    echo files and folders are revealed ... delete the files that are suspicious
    dir
:ex
    cls
    color 4
    pause
    exit


