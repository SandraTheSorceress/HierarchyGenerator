# Hierarchy Generator

## How to start the application

Run the following command in this folder:

    docker-compose up -d

Open [Hierarchy Generator App](http://localhost:8080)

Backend is available here: [API Swagger](http://localhost:1337/swagger/index.html)

Interact with the LLM via Docker using the following command:

    docker-compose exec llm ollama run phi3:mini

## How to stop the application?

    docker-compose down

**Note that database files are persisted on disk inside the folder `HierarchyGenerator\HierarchyGeneratorDatabase\data`** .

## More documentation

[High-level architectural design](./documentation/high-level-arch-design/README.md)

[About the frontend](./HierarchyGeneratorClient/README.md)

[About the UI design](./documentation/ui-design/README.md)

[About the API design](./documentation/api-design/README.md)

[About the database](./HierarchyGeneratorDatabase/README.md)