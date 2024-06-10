@echo off
setlocal

if "%1"=="" (
    echo Usage: killport port_number
    exit /b 1
)

set PORT=%1

for /f "tokens=5" %%a in ('netstat -ano ^| findstr :%PORT%') do (
    echo Killing process with PID %%a using port %PORT%
    taskkill /PID %%a /F
)

endlocal