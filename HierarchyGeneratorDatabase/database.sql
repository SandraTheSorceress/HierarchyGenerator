CREATE DATABASE hierarchy_generator;

use hierarchy_generator;

CREATE TABLE Hierarchies (
    Id int NOT NULL AUTO_INCREMENT,
    Name longtext CHARACTER SET utf8mb4 NOT NULL,
    NumberOfNodes int NOT NULL,
    CreatedDate datetime NOT NULL,
    LastModified datetime NOT NULL,
    CONSTRAINT PK_Hierarchies PRIMARY KEY (Id)
) CHARACTER SET=utf8mb4;

insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified) values ("Hierarchy 1", 1, '2025-03-22 14:30:00', '2025-03-22 14:30:00');
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified) values ("Hierarchy 2", 5, '2025-03-22 14:30:00', '2025-03-22 14:30:00');
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified) values ("Hierarchy 3", 7, '2025-03-22 14:30:00', '2025-03-22 14:30:00');
insert into hierarchies (Name, NumberOfNodes, CreatedDate, LastModified) values ("Hierarchy 4", 9, '2025-03-22 14:30:00', '2025-03-22 14:30:00');

commit;