@echo off
docker-compose -f docker-compose-dev.yml up -d

if %ERRORLEVEL% EQU 0 (
    echo --------------------------------------
    echo Hierarchy Generator started successfully!
    echo Open your browser and go to: http://localhost:8080
    echo --------------------------------------
) else (
    echo --------------------------------------
    echo Failed to start Hierarchy Generator.
    echo Please check the error messages above.
    echo --------------------------------------
)