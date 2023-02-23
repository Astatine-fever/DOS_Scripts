@ECHO OFF
title folder optimisation script by Astatine
color 2
echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'               `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  
echo $$$$$$$$$$$$$$$$$$$$$$$$$$$$'                   `$$$$$$$$$$$$$$$$$$$$$$$$$$$$
echo $$$'`$$$$$$$$$$$$$'`$$$$$$!                       !$$$$$$'`$$$$$$$$$$$$$'`$$$
echo $$$$  $$$$$$$$$$$  $$$$$$$                         $$$$$$$  $$$$$$$$$$$  $$$$
echo $$$$. `$' \' \$`  $$$$$$$!                         !$$$$$$$  '$/ `/ `$' .$$$$
echo $$$$$. !\  i  i .$$$$$$$$                           $$$$$$$$. i  i  /! .$$$$$
echo $$$$$$   `--`--.$$$$$$$$$                           $$$$$$$$$.--'--'   $$$$$$
echo $$$$$$L        `$$$$$^^$$$                            $$^^$$$$$'        J$$$$$$
echo $$$$$$$.   .'   ""~   $$$    $.                 .$  $$$   ~""   `.   .$$$$$$$
echo $$$$$$$$.  ;      .e$$$$$!    $$.             .$$  !$$$$$e,      ;  .$$$$$$$$
echo $$$$$$$$$   `.$$$$$$$$$$$$     $$$.         .$$$   $$$$$$$$$$$$.'   $$$$$$$$$
echo $$$$$$$$    .$$$$$$$$$$$$$!     $$`$$$$$$$$'$$    !$$$$$$$$$$$$$.    $$$$$$$$
echo $$$$$$$     $$$$$$$$$$$$$$$$.    $    $$    $   .$$$$$$$$$$$$$$$$     $$$$$$$
echo                                  $    $$    $
echo                                  $.   $$   .$
echo                                  `$        $'
echo                                   `$$$$$$$$'

echo ===============================================================================

echo                    [1] Manually add Folder
echo                    [2] Automatically create folder based on extensions
echo                    [3] Autosort Files (Select only if you created folders)
echo                    [4] Autocreate and sort files 
echo                    [5] Exit

echo ===============================================================================
choice /C:12345 /N 
set sv=%errorlevel%
if %sv%==1 (call :man_folder_creation)
if %sv%==2 (call :auto_fol_create)
if %sv%==3 (call :auto_fol_sort)
if %sv%==4 (call :auto_folder_manager)
if %sv%==5 (call :q)

set /a var=0
REM Folder Creating Subfunction Function
:auto_folder_create
    
    REM DESKTOP Files
    if exist *.lnk md shortcuts
    if exist *.exe md execu
    if exist *.rar md compressedfiles\rar
    if exist *.zip md compressedfiles\zip
    if exist *.7z md compressedfiles\7z

    REM Word formats
    if exist *.docx md "documents\Word Document"
    if exist *.rtf md "documents\rich text format"
    if exist *.txt md "documents\plain text"
    if exist *.pdf md documents\pdf

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

    REM Media file

    if exist *.jpg md Media\Pictures\Jpeg
    if exist *.png md Media\Pictures\png
    if exist *.img md  Media\Pictures\img
    if exist *.jpeg md Media\Pictures\Jpeg
    if exist *.gif md Media\Pictures\gif
    if exist *.tif md Media\Pictures\tif
    if exist *.bmp md Media\Pictures\bmp


    REM Adobe Files

    if exist *.psd md adobe\Photoshop
    if exist *.cdr md adobe\Coreldraw
    if exist *.imd md adobe\Photoshop
    if exist *.pm* md adobe\Pagemaker





REM Folder Organising SubFunction
:auto_folder_sort
    title Organise Files based on extensions 
    color 3
    cls
    REM DESKTOP Files
    if exist *.lnk move *.lnk shortcuts
    if exist *.exe move *.exe executables
    if exist *.rar move *.rar compressedfiles\rar
    if exist *.zip move *.zip compressedfiles\zip
    if exist *.7z move *.7z compressedfiles\7z

    REM Word formats

    if exist *.docx move *.docx "documents\Word Document"
    if exist *.doc move *.doc "documents\Word Document 2003"
    if exist *.rtf move *.rtf  "documents\rich text format"
    if exist *.txt move *.txt  "documents\plain text"
    if exist *.pdf move *.pdf  documents\pdf


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

    if exist *.html md "Web Development"
    if exist *.js md "Web Development"
    if exist *.php md "Web Development"
    if exist *.css md "Web Development"


    if exist *.css move *.css "Web Development"
    if exist *.html move *.html "Web Development"
    if exist *.js move *.js "Web Development"
    if exist *.php move *.php "Web Development"

    REM Media file

    if exist *.jpg md Media\Pictures\Jpeg
    if exist *.png md Media\Pictures\png
    if exist *.img md  Media\Pictures\img
    if exist *.jpeg md Media\Pictures\Jpeg
    if exist *.gif md Media\Pictures\gif
    if exist *.tif md Media\Pictures\tif
    if exist *.bmp md Media\Pictures\bmp

    if exist *.mp3 md Media\Audio\mp3_files
    if exist *.ogg md Media\Audio\ogg_files
    if exist *.m4a md Media\Audio\m4a_files
    if exist *.wma md Media\Audio\wma_files


    if exist *.mp4 md Media\Video\mp4_files
    if exist *.flv md Media\Video\flv_files
    if exist *.avi md Media\Video\avi_files
    if exist *.mkv md Media\Video\mkv_files
    if exist *.mov md Media\Video\mov_files
    if exist *.webm md Media\Video\webm_files


    if exist *.jpg move *.jpg Media\Pictures\Jpeg
    if exist *.png move *.png Media\Pictures\png
    if exist *.img move *.img Media\Pictures\img
    if exist *.jpeg move *.jpeg Media\Pictures\Jpeg
    if exist *.gif move *.gif Media\Pictures\gif
    if exist *.bmp move *.bmp Media\Pictures\bmp
    if exist *.tif move *.tif Media\Pictures\tif

    if exist *.mp3 move *.mp3 Media\Audio\mp3_files
    if exist *.ogg move *.ogg Media\Audio\ogg_files
    if exist *.m4a move *.m4a Media\Audio\m4a_files
    if exist *.wma move *.wma Media\Audio\wma_files


    if exist *.mp4 move *.mp4 Media\Video\mp4_files
    if exist *.flv move *.flv Media\Video\flv_files
    if exist *.avi move *.avi Media\Video\avi_files
    if exist *.mkv move *.mkv Media\Video\mkv_files
    if exist *.mov move *.mov Media\Video\mov_files
    if exist *.webm move *.webm Media\Video\webm_files

    REM Adobe Files

    if exist *.psd move *.psd adobe\Photoshop
    if exist *.cdr move *.cdr adobe\Coreldraw
    if exist *.imd move *.imd adobe\Photoshop
    if exist *.pm* move *.pm* adobe\Pagemaker

    if exist *.bat md documents\script
    if exist *.bat move *.bat documents\script
    
REM Folder Manager Function
:auto_folder_manager
    call :auto_fol_create
    call :auto_fol_sort
    exit
REM Folder Creating Functions
:auto_fol_create
    title Create Folder based on extensions 
    color 3
    cls
    echo creating folders....
    call :auto_folder_create
    timeout /t 5 /nobreak
    exit

REM Folder Creating Functions
:auto_fol_sort
    color 4
    title Organise Files based on extensions 
    cls
    echo Make sure you created folders or run step 2 before proceeding
    pause
    echo sorting files....
    call :auto_folder_sort
    echo files sorted ....
    exit

REM Manual Folder Creation Functions
:man_folder_creation
    title Folder Creation tool
    cls
    color 6
    SET /P UserInput=Please Enter Number of folders to be created : 
    IF %UserInput% EQU 0 GOTO E_INVALIDINPUT

    SET /A UserInputVal="%UserInput%"*1
    IF %UserInputVal% GTR 0 ECHO "%UserInputVal%" Folders to be created 
    IF %UserInputVal% EQU 0 GOTO EOF

REM Exit point functions
:E_INVALIDINPUT
    ECHO Invalid user input
 
:EOF
    color 4
    echo Given value is not a number.... program is exitting 
    timeout /t 5 /nobreak
    exit

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

:q
    cls
    exit