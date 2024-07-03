@rem Script di auto start di Emacs su Windows
@rem https://stackoverflow.com/questions/19047442/my-batch-file-keeps-looping-but-why

@echo off
where /q emacs
if %errorlevel% equ 0 (
   start /B emacs --daemon
)
