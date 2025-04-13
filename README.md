# Hierarchy Generator

## How to start the application

Run the following command in this folder:

    docker-compose up -d

Open [Hierarchy Generator App](http://localhost:8080)

Backend is available here: [API Swagger](http://localhost:1337/swagger/index.html)

## How to stop the application?

    docker-compose down

## For development
This script builds images from the code and starts the containers:

    dev_run.bat

This script stops and removes the containers, along with associated images and volumes:

    dev_stop.bat

## More documentation

[High-level architectural design](./documentation/high-level-arch-design/README.md)

[About the frontend](./HierarchyGeneratorClient/README.md)

[About the UI design](./documentation/ui-design/README.md)

[About the API design](./documentation/api-design/README.md)

[About the database design](./HierarchyGeneratorDatabase/README.md)