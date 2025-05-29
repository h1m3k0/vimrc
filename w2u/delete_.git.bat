@echo off

if not exist ../vimrc (
    echo NOT in vimdir/w2u !!!
    exit /b 1
)

REM DELETE .git
if exist ../.git (
    rd /s /q "../.git"
)

REM DELETE plugged/*/*.git 
if exist ../plugged (
    for /d %%d in ("../plugged/*") do (
        if exist "../plugged/%%d/.git" (
            rd /s /q "../plugged/%%d/.git"
        )
    )
)
