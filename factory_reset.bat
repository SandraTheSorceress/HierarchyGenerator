@echo off
echo --------------------------------------
echo Do you want to install and start the latest version of Hierarchy Generator?
echo Please note that this will REMOVE the existing test data.
echo Type 'yes' to proceed:
set /p user_input=

setlocal enabledelayedexpansion
set "user_input=!user_input:~0,1!"

if /I "%user_input%"=="y" (
    docker-compose down --rmi all --volumes

    docker-compose up -d

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
) else (
    echo --------------------------------------
    echo Installation and startup of the latest version of Hierarchy Generator has been canceled.
    echo Existing test data will remain intact.
    echo --------------------------------------
)

endlocal
