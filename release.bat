docker build -t alexandraisaksson/hierarchy-generator-database:latest HierarchyGeneratorDatabase
docker build -t alexandraisaksson/hierarchy-generator-api:latest HierarchyGeneratorApi
docker build -t alexandraisaksson/hierarchy-generator-client:latest HierarchyGeneratorClient

docker push alexandraisaksson/hierarchy-generator-database:latest
docker push alexandraisaksson/hierarchy-generator-api:latest
docker push alexandraisaksson/hierarchy-generator-client:latest
