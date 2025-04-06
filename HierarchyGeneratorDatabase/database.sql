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
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 2", 5, '2025-03-22 14:31:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 3", 7, '2025-03-22 14:32:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 4", 9, '2025-03-22 14:33:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 5", 1, '2025-03-22 14:34:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 6", 5, '2025-03-22 14:35:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 7", 7, '2025-03-22 14:36:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 8", 9, '2025-03-22 14:37:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 9", 1, '2025-03-22 14:20:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 10", 5, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 11", 7, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 12", 9, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 13", 1, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 14", 5, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 15", 7, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 16", 9, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 17", 1, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 18", 5, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 19", 7, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 20", 5, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 21", 7, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 22", 9, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 23", 1, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 24", 5, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 25", 7, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 26", 9, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 27", 1, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 28", 5, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 29", 7, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 30", 9, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 31", 7, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 32", 9, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 33", 1, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 34", 5, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 35", 7, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 36", 9, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 37", 1, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 38", 5, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 39", 7, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 40", 9, '2025-03-22 14:30:00', '2025-03-22 14:30:00', "TODO");


commit;