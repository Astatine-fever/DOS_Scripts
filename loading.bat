@echo off
:loading
    call:Stage1
    ping /n 1 /w 2000 localhost >nul
    cls
    ping /n 1 /w 4000 localhost >nul
    call:Stage2
    ping /n 1 /w 4000 localhost >nul
    cls
    ping /n 1 /w 6000 localhost >nul
    call:Stage3
    ping /n 1 /w 6000 localhost >nul
    cls
    ping /n 1 /w 8000 localhost >nul
    call:Stage4
    ping /n 1 /w 8000 localhost >nul
    cls
    ping /n 1 /w 2000 localhost >nul
    call:loading


:Stage1
    echo  .--.                         
    echo ( _.-' .-.   .-.  .-.   .''.  
    echo (  '-. '-'   '-'  '-'   '..'  
    echo  '--'                         

:Stage2
    echo       .--.                         
    echo      ( _.-' .-.  .-.    .''.  
    echo      (  '-. '-'  '-'    '..'  
    echo       '--'                         

:Stage3
    echo                  .--.                         
    echo                 ( _.-'   .''.  
    echo                 (  '-.   '..'  
    echo                  '--'                         

:Stage4
    echo                           .--.                         
    echo                          ( _.-'   
    echo                          (  '-.   
    echo                           '--'                         