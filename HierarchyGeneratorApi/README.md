# Hierarchy Generator API

## For Development

### Generate SQL files from Entity Model

## For Development

### Generate SQL Files from Entity Model

Run the following commands to create a `migration.sql` file:

    dotnet ef migrations add InitialMigration

    dotnet ef migrations script -o migration.sql

Use the generated `migration.sql` to update `../HierarchyGeneratorDatabase/database.sql`, which is used to create the database Docker image.