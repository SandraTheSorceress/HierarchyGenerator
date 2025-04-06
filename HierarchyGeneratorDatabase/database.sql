CREATE DATABASE hierarchy_generator;

use hierarchy_generator;

CREATE TABLE Hierarchies (
    Id int NOT NULL AUTO_INCREMENT,
    Name longtext CHARACTER SET utf8mb4 NOT NULL,
    NumberOfNodes int NULL,
	NumberOfEndUsers int NULL,
	NumberOfAttributes int NULL,
	NumberOfContacts int NULL,
    CreatedDate datetime NOT NULL,
    LastModified datetime NOT NULL,
	Status longtext CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT PK_Hierarchies PRIMARY KEY (Id)
) CHARACTER SET=utf8mb4;

insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 1", 1, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 2", 5, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 3", 7, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 4", 9, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "TODO");

commit;