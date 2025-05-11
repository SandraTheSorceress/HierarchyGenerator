#!/bin/bash

echo "--------------------------------------"
echo "Do you want to install and start the latest version of Hierarchy Generator?"
echo "Please note that this will REMOVE the existing test data."
echo "Type 'yes' to proceed, or 'no' to cancel: "
read user_input

if [[ "${user_input,,}" == "y" || "${user_input,,}" == "yes" ]]; then
    docker-compose down --rmi all --volumes

    docker-compose up -d

    if [ $? -eq 0 ]; then
        echo "--------------------------------------"
        echo "Hierarchy Generator started successfully!"
        echo "Open your browser and go to: http://localhost:8080"
        echo "--------------------------------------"
    else
        echo "--------------------------------------"
        echo "Failed to start Hierarchy Generator."
        echo "Please check the error messages above."
        echo "--------------------------------------"
    fi
else
    echo "--------------------------------------"
    echo "Installation and startup of the latest version of Hierarchy Generator has been canceled."
    echo "Existing test data will remain intact."
    echo "--------------------------------------"
fi
