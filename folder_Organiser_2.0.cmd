@ECHO OFF
title Folder Sorter  script by Astatine & color 2

call:choices
REM Choices -- for choosing the options
:choices
        cls
    color 4
    echo            .            _ 
    echo            .          /   \
    echo            .          \ _ / 
    timeout /t 1 /nobreak>nul && cls      
    color c       
    echo            .                _
    echo            .            _ /   \
    echo            .          /   \ _ /
    echo            .          \ _ / 
    timeout /t 1 /nobreak>nul && cls   
    color e          
    echo            .                _
    echo            .            _ /   \ _
    echo            .          /   \ _ /   \
    echo            .          \ _ /   \ _ /
    timeout /t 1 /nobreak>nul && cls  
    color 6           
    echo            .                _
    echo            .            _ /   \ _
    echo            .          /   \ _ /   \
    echo            .          \ _ /   \ _ /
    echo            .                  /   \
    echo            .                  \ _ /
    timeout /t 1 /nobreak>nul && cls   
    color 2          
    echo            .                _
    echo            .            _ /   \ _
    echo            .          /   \ _ /   \
    echo            .          \ _ /   \ _ /
    echo            .                _ /   \
    echo            .              /   \ _ /
    echo            .              \ _ /
    timeout /t 1 /nobreak>nul && cls   
    color a          
    echo            .                _
    echo            .            _ /   \ _
    echo            .          /   \ _ /   \
    echo            .          \ _ /   \ _ /
    echo            .          /   \ _ /   \
    echo            .          \ _ /   \ _ /
    echo            .              \ _ /
    timeout /t 1 /nobreak>nul && cls   
    color f 
    timeout /t 1 /nobreak>nul && cls   
    cls
    echo ===============================================================================
    echo .
    echo .                _          [1] Create Bulk Folders
    echo .            _ /   \ _      
    echo .          /   \ _ /   \    [2] Automatically create folder based on extensions
    echo .          \ _ /   \ _ /    
    echo .          /   \ _ /   \    [3] Autocreate and sort files 
    echo .          \ _ /   \ _ /    
    echo .              \ _ /        [4] Exit
    echo .                                 
    echo ===============================================================================
    choice /C:1234 /N 
    set sv=%errorlevel%
    if %sv%==1 (call:folder_creation_manual)
    if %sv%==2 (call:folder_creation_automatic)
    if %sv%==3 (call:folder_creation_automatic && call:sorting_protocol)
    if %sv%==4 (exit)
    exit

REM Manual Folder Creation Functions
:folder_creation_manual
    title Folder Creation tool
    cls
    color 6
    SET /P UserInput=Please Enter Number of folders to be created : 
    IF %UserInput% EQU 0 GOTO E_INVALIDINPUT

    SET /A UserInputVal="%UserInput%"*1
    IF %UserInputVal% GTR 0 GOTO sa
    IF %UserInputVal% EQU 0 GOTO EOF

:E_INVALIDINPUT
    ECHO Invalid user input
 
:EOF
    color 4
    echo Given value is not a number.... program is exitting 
    timeout /t 5 /nobreak
    exit

:sa
    md folder0
    set /a var=0

:start
    set /a var=var+1
    if %var% equ %UserInputVal% goto ends
    md folder%var%
    goto start

:ends
    echo %var% folders created.
    pause
    exit
REM Auto Folder Creation Functions
:folder_creation_automatic
    title Folder Creation
    REM DESKTOP Files
    if exist *.lnk md "de\shortcuts"
    if exist *.rar md "compressedfiles\rar"
    if exist *.zip md "compressedfiles\zip"
    if exist *.7z md "compressedfiles\7z"
    if exist *.iso md "compressedfiles\iso"
    if exist *.exe md "compressedfiles\executable"

    REM Scripts
    if exist *.bat md "scripts\bat"
    if exist *.vbs md "scripts\vbs"
    if exist *.sh md "scripts\sh"

    REM Word formats
    if exist *.docx md "documents\Word Document"
    if exist *.rtf md "documents\rich text format"
    if exist *.txt md "documents\plain text"
    if exist *.pdf md "documents\pdf"

    REM Excel formats

    if exist *.xlsx md "Spreadsheet\Excel Workbook"
    if exist *.csv md "Spreadsheet\comma seperated values"

    REM Powerpoint formats

    if exist *.pp* md "Presentation\Powerpoint presentation"

    REM Database formats

    if exist *.accdb md "Database\Access 2016"
    if exist *.mdb md "Database\Access 2003"


    REM Openoffice Documents

    if exist *.odt md "Openoffice\Open document Word"
    if exist *.ods md "Openoffice\Open document spreadsheet"
    if exist *.odp md "Openoffice\Open document powerpoint"

    REM coding

    if exist *.c md "Programming\C Programs"
    if exist *.cpp md "Programming\C++ Programs"
    if exist *.java md "Programming\Java Programs"
    if exist *.py md "Programming\Python Programs"
    if exist *.sql md "Programming\Database Query"
    if exist *.cs md "Programming\C# programs"
    if exist *.c# md "Programming\C# programs"

    REM Web development

    if exist *.html md "Web Development"
    if exist *.js md "Web Development"
    if exist *.php md "Web Development"
    if exist *.css md "Web Development"

    REM Media file

    if exist *.jpg md "Media\Pictures\Jpeg"
    if exist *.png md "Media\Pictures\png"
    if exist *.img md  "Media\Pictures\img"
    if exist *.jpeg md "Media\Pictures\Jpeg"
    if exist *.gif md "Media\Pictures\gif"
    if exist *.tif md "Media\Pictures\tif"
    if exist *.bmp md "Media\Pictures\bmp"

    REM Adobe Files

    if exist *.psd md "adobe\Photoshop"
    if exist *.cdr md "adobe\Coreldraw"
    if exist *.imd md "adobe\Photoshop"
    if exist *.pm* md "adobe\Pagemaker"

REM Auto Folder Creation and sorting
:sorting_protocol
    title Organise Files based on extensions 
    color 3
    cls && color 4
    @echo off
    REM DESKTOP Files
    if exist *.lnk move *.lnk "shortcuts"
    if exist *.exe move *.exe "executables"
    if exist *.rar move *.rar "compressedfiles\rar"
    if exist *.zip move *.zip "compressedfiles\zip"
    if exist *.7z move *.7z "compressedfiles\7z"
    if exist *.iso move *.iso "compressedfiles\iso"
    if exist *.exe move *.exe "compressedfiles\executable"


    REM Word formats

    if exist *.docx move *.docx "documents\Word Document"
    if exist *.doc move *.doc "documents\Word Document 2003"
    if exist *.rtf move *.rtf  "documents\rich text format"
    if exist *.txt move *.txt  "documents\plain text"
    if exist *.pdf move *.pdf  "documents\pdf"

    REM Excel formats

    if exist *.xlsx move *.xlsx "Spreadsheet\Excel Workbook"
    if exist *.csv move *.csv "Spreadsheet\comma seperated values"

    REM Powerpoint formats

    if exist *.pp* move *.pp* "Presentation\Powerpoint presentation"

    REM Database formats

    if exist *.mdb move *.mdb "Database\Access 2003"
    if exist *.accdb move *.accdb "Database\Access 2016"

    REM Openoffice Documents

    if exist *.odt move "Openoffice\Open document Word"
    if exist *.ods move "Openoffice\Open document spreadsheet"
    if exist *.odp move "Openoffice\Open document powerpoint"

    REM coding

    if exist *.c move *.c "Programming\C Programs"
    if exist *.cpp move *.cpp "Programming\C++ Programs"
    if exist *.java move *.java "Programming\Java Programs"
    if exist *.py move *.py "Programming\Python Programs"
    if exist *.sql move *.sql "Programming\Database Query"
    if exist *.cs move *.cs "Programming\C# programs"
    if exist *.c# move *.c# "Programming\C# programs"
    
    REM Web development

    if exist *.css move *.css "Web Development"
    if exist *.html move *.html "Web Development"
    if exist *.js move *.js "Web Development"
    if exist *.php move *.php "Web Development"

    REM Pictures
  
    if exist *.jpg move *.jpg "Media\Pictures\Jpeg"
    if exist *.png move *.png "Media\Pictures\png"
    if exist *.img move *.img "Media\Pictures\img"
    if exist *.jpeg move *.jpeg "Media\Pictures\Jpeg"
    if exist *.gif move *.gif "Media\Pictures\gif"
    if exist *.bmp move *.bmp "Media\Pictures\bmp"
    if exist *.tif move *.tif "Media\Pictures\tif"

    REM Audio

    if exist *.mp3 move *.mp3 "Media\Audio\mp3_files"
    if exist *.ogg move *.ogg "Media\Audio\ogg_files"
    if exist *.m4a move *.m4a "Media\Audio\m4a_files"
    if exist *.wma move *.wma "Media\Audio\wma_files"

    REM Video

    if exist *.mp4 move *.mp4 "Media\Video\mp4_files"
    if exist *.flv move *.flv "Media\Video\flv_files"
    if exist *.avi move *.avi "Media\Video\avi_files"
    if exist *.mkv move *.mkv "Media\Video\mkv_files"
    if exist *.mov move *.mov "Media\Video\mov_files"
    if exist *.webm move *.webm "Media\Video\webm_files"

    REM Adobe Files

    if exist *.psd move *.psd "adobe\Photoshop"
    if exist *.cdr move *.cdr "adobe\Coreldraw"
    if exist *.imd move *.imd "adobe\Photoshop"
    if exist *.pm* move *.pm* "adobe\Pagemaker"

    REM Scripts
    if exist *.sh move *.sh "scripts\sh"
    if exist *.vbs move *.vbs "scripts\vbs"
    if exist *.bat move *.bat "scripts\bat"
    
    @echo OFF
    cls && color 4
    echo    [------------------------]  && color c
    timeout /t 1 /nobreak>nul && cls
    echo    [=====-------------------] && color 6
    timeout /t 1 /nobreak>nul && cls
    echo    [==============----------] && color e
    timeout /t 1 /nobreak>nul && cls
    echo    [===================-----] && color 2
    timeout /t 1 /nobreak>nul && cls
    echo    [========================] && color a
    timeout /t 2 /nobreak>nul && color f
    cls && echo files sorted
    timeout /t 2 /nobreak>nul && color f    
    exit
    