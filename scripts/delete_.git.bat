@echo off
set "scriptDir=%~dp0"

for %%i in ("%scriptDir%..") do set "root=%%~fi"

if not exist "%root%/vimrc" (
    echo NOT in vimdir !!!
    exit /b 1
)

REM DELETE .git
if exist "%root%/.git" (
    echo DELETE %root%/.git
    rd /s /q "%root%/.git"
)

REM DELETE plugged/*/*.git
if exist "%root%/plugged" (
    for /d %%d in ("%root%\plugged\*") do (
        if exist "%%d/.git" (
            echo DELETE %%d/.git
            rd /s /q "%%d/.git"
        )
    )
)

pause
