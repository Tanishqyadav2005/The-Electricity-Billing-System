@echo off
REM Electricity Billing System - Run Script for Windows
REM This script compiles and runs the application

echo ==========================================
echo Electricity Billing System
echo ==========================================
echo.

REM Check if Maven is installed
where mvn >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Error: Maven is not installed or not in PATH
    echo Please install Maven: https://maven.apache.org/install.html
    echo.
    echo Alternatively, you can run manually:
    echo 1. Compile: javac -cp "rs2xml.jar;mysql-connector-j-8.x.x.jar" src\electricity\billing\system\*.java
    echo 2. Run: java -cp ".;rs2xml.jar;mysql-connector-j-8.x.x.jar" electricity.billing.system.Splash
    pause
    exit /b 1
)

REM Check if MySQL is running (optional check)
echo Checking database configuration...
if exist "src\db.properties" (
    echo Found db.properties
) else (
    echo Warning: db.properties not found. Using default database settings.
)

echo.
echo Building project with Maven...
call mvn clean compile

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo Build failed! Please check the errors above.
    pause
    exit /b 1
)

echo.
echo Starting application...
echo.
call mvn exec:java

pause

