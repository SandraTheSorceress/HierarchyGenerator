# Hierarchy Generator

## How to start the application

Run the following command in this folder:

    docker-compose up -d

Go to [API Swagger](http://localhost:1337/swagger/index.html)

## How to stop the application?

    docker-compose down

**Note that database files are persisted on disk inside the folder `HierarchyGenerator\HierarchyGeneratorDatabase\data`** .

## More documentation

[High-level architectural design](./documentation/high-level-arch-design/README.md)

[About the frontend](./HierarchyGeneratorClient/README.md)

[About the database](./HierarchyGeneratorDatabase/README.md)