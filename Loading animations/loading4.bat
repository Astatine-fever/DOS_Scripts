@echo OFF
:test
    cls
    echo               o
    echo                   o
    echo _ 
    echo                   o
    echo               o   
    echo               o
    echo                   o
    echo _ 
    echo           o       o
    echo               o   

    timeout /t 1 /nobreak>nul && cls
call :test