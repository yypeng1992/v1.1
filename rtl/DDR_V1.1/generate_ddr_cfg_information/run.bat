@echo off
:sr_head
color 2
echo.
echo.
title generate DDR cfg information
echo   Do you want to generate DDR cfg info?
echo ========================================
echo               1: YES
echo               2: NO
echo.
echo   Please input number 1 or 2 to select..
echo.
echo ========================================
echo.
echo.
set /p select=Press input number and then press key "ENTER":
if "%select%"=="1" (goto sr_grant)
if "%select%"=="2" (goto sr_exit)
pause
goto sr_head

:sr_grant
perl ddr_cfg_info_generator.pl
echo.
cls
echo.
echo ======DDR cfg information generate done======
echo.
goto sr_head

:sr_exit
exit