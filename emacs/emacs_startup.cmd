@echo off
rem Script di auto start di Emacs su Windows
rem https://stackoverflow.com/questions/19047442/my-batch-file-keeps-looping-but-why

where /q runemacs
if %errorlevel% equ 0 (
    start /B runemacs --daemon >nul 2>&1
)
exit 0
