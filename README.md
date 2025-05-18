# Hierarchy Generator

## How to start the application

Run the following command in this folder:

    docker-compose up -d

Open [Hierarchy Generator App](http://localhost:8080)

## How to stop the application?

    docker-compose down

## For development
[Swagger for the API](http://localhost:1337/swagger/index.html)

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

### How to install and start the latest version of Hierarchy Generator

> **⚠️ Warning:** This will delete all existing test data.

1. Make sure you’ve pulled the latest version of the code:

   ```bash
   git pull
   ```

2. Run the reset script for your platform:

   **macOS/Linux:**

   ```bash
   ./reset_hierarchy_generator.sh
   ```

   **Windows:**

   ```cmd
   reset_hierarchy_generator.bat
   ```
