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

insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 1", 1, '2025-03-10 10:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 2", 5, '2025-03-10 10:31:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 3", 7, '2025-03-10 10:32:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 4", 9, '2025-03-10 10:33:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 5", 1, '2025-03-10 10:34:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 6", 5, '2025-03-10 10:35:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 7", 7, '2025-03-10 10:36:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 8", 9, '2025-03-10 14:37:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 9", 1, '2025-03-10 14:20:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 10", 5, '2025-03-11 09:20:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 11", 7, '2025-03-11 09:30:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 12", 9, '2025-03-11 09:40:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 13", 1, '2025-03-11 09:50:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 14", 5, '2025-03-11 09:30:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 15", 7, '2025-03-11 11:30:10', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 16", 9, '2025-03-11 12:30:20', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 17", 1, '2025-03-11 12:30:30', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 18", 5, '2025-03-11 12:30:40', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 19", 7, '2025-03-11 12:30:50', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 20", 5, '2025-03-12 12:31:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 21", 7, '2025-03-12 12:32:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 22", 9, '2025-03-12 12:33:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 23", 1, '2025-03-12 13:34:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 24", 5, '2025-03-12 13:35:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 25", 7, '2025-03-12 13:36:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 26", 9, '2025-03-12 13:37:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 27", 1, '2025-03-12 13:38:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 28", 5, '2025-03-12 13:39:00', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 29", 7, '2025-03-12 13:40:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 30", 9, '2025-03-12 13:50:00', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 31", 7, '2025-03-12 14:30:10', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 32", 9, '2025-03-13 14:30:20', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 33", 1, '2025-03-13 14:30:30', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 34", 5, '2025-03-13 14:30:40', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 35", 7, '2025-03-13 14:31:00', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 36", 9, '2025-03-13 15:31:10', '2025-03-22 14:30:00', "TODO");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 37", 1, '2025-03-13 15:32:01', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 38", 5, '2025-03-13 15:30:02', '2025-03-22 14:30:00', "PROCESSING");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 39", 7, '2025-03-13 15:30:03', '2025-03-22 14:30:00', "CREATED");
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values ("Hierarchy 40", 9, '2025-03-13 15:30:04', '2025-03-22 14:30:00', "TODO");


commit;