CREATE DATABASE hierarchy_generator CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

use hierarchy_generator;
CREATE TABLE `Hierarchies` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Name` longtext CHARACTER SET utf8mb4 NOT NULL,
    `CreatedDate` datetime(6) NOT NULL,
    `LastModified` datetime(6) NOT NULL,
    CONSTRAINT `PK_Hierarchies` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `L1` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `NodeId` int NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NOT NULL,
    `HierarchyId` int NOT NULL,
    CONSTRAINT `PK_L1` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_L1_Hierarchies_HierarchyId` FOREIGN KEY (`HierarchyId`) REFERENCES `Hierarchies` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `L1Contact` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Name` longtext CHARACTER SET utf8mb4 NOT NULL,
    `L1Id` int NOT NULL,
    CONSTRAINT `PK_L1Contact` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_L1Contact_L1_L1Id` FOREIGN KEY (`L1Id`) REFERENCES `L1` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `L2` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `NodeId` int NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NOT NULL,
    `L1Id` int NOT NULL,
    CONSTRAINT `PK_L2` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_L2_L1_L1Id` FOREIGN KEY (`L1Id`) REFERENCES `L1` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `L2Contact` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Name` longtext CHARACTER SET utf8mb4 NOT NULL,
    `L2Id` int NOT NULL,
    CONSTRAINT `PK_L2Contact` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_L2Contact_L2_L2Id` FOREIGN KEY (`L2Id`) REFERENCES `L2` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `L3` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `NodeId` int NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NOT NULL,
    `L2Id` int NOT NULL,
    CONSTRAINT `PK_L3` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_L3_L2_L2Id` FOREIGN KEY (`L2Id`) REFERENCES `L2` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `L3Contact` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Name` longtext CHARACTER SET utf8mb4 NOT NULL,
    `L3Id` int NOT NULL,
    CONSTRAINT `PK_L3Contact` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_L3Contact_L3_L3Id` FOREIGN KEY (`L3Id`) REFERENCES `L3` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `L4` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `NodeId` int NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NOT NULL,
    `L3Id` int NOT NULL,
    CONSTRAINT `PK_L4` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_L4_L3_L3Id` FOREIGN KEY (`L3Id`) REFERENCES `L3` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `L4Contact` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Name` longtext CHARACTER SET utf8mb4 NOT NULL,
    `L4Id` int NOT NULL,
    CONSTRAINT `PK_L4Contact` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_L4Contact_L4_L4Id` FOREIGN KEY (`L4Id`) REFERENCES `L4` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `L5` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `NodeId` int NOT NULL,
    `Name` longtext CHARACTER SET utf8mb4 NOT NULL,
    `L4Id` int NOT NULL,
    CONSTRAINT `PK_L5` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_L5_L4_L4Id` FOREIGN KEY (`L4Id`) REFERENCES `L4` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `L5Contact` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Name` longtext CHARACTER SET utf8mb4 NOT NULL,
    `L5Id` int NOT NULL,
    CONSTRAINT `PK_L5Contact` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_L5Contact_L5_L5Id` FOREIGN KEY (`L5Id`) REFERENCES `L5` (`Id`) ON DELETE CASCADE
) CHARACTER SET=utf8mb4;

CREATE TABLE `NamePhonemes` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Theme` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Category` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Position` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Value` longtext CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK_NamePhonemes` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `NameAdjectives` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Theme` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Category` longtext CHARACTER SET utf8mb4 NOT NULL,
    `NodeLevel` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Value` longtext CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK_NamePhonemes` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE TABLE `NameTitles` (
    `Id` int NOT NULL AUTO_INCREMENT,
    `Theme` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Category` longtext CHARACTER SET utf8mb4 NOT NULL,
    `NodeLevel` longtext CHARACTER SET utf8mb4 NOT NULL,
    `Value` longtext CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK_NamePhonemes` PRIMARY KEY (`Id`)
) CHARACTER SET=utf8mb4;

CREATE INDEX `IX_L1_HierarchyId` ON `L1` (`HierarchyId`);

CREATE INDEX `IX_L1Contact_L1Id` ON `L1Contact` (`L1Id`);

CREATE INDEX `IX_L2_L1Id` ON `L2` (`L1Id`);

CREATE INDEX `IX_L2Contact_L2Id` ON `L2Contact` (`L2Id`);

CREATE INDEX `IX_L3_L2Id` ON `L3` (`L2Id`);

CREATE INDEX `IX_L3Contact_L3Id` ON `L3Contact` (`L3Id`);

CREATE INDEX `IX_L4_L3Id` ON `L4` (`L3Id`);

CREATE INDEX `IX_L4Contact_L4Id` ON `L4Contact` (`L4Id`);

CREATE INDEX `IX_L5_L4Id` ON `L5` (`L4Id`);

CREATE INDEX `IX_L5Contact_L5Id` ON `L5Contact` (`L5Id`);

/*
	Country Hierarchies
*/

insert into Hierarchies (Id, Name, CreatedDate, LastModified) values
(1, "Nordic Escape", '2025-04-17 08:15:00', '2025-04-17 09:45:00');
insert into L1(Id, NodeId, Name, HierarchyId) values (1, 1, 'Sweden', 1);
insert into L1(Id, NodeId, Name, HierarchyId) values (2, 2, 'Norway', 1);
insert into L1(Id, NodeId, Name, HierarchyId) values (3, 3, 'Denmark', 1);

insert into L1Contact(Name, L1Id) values ('Swedish King', 1);
insert into L1Contact(Name, L1Id) values ('Swedish Queen', 1);
insert into L1Contact(Name, L1Id) values ('Danish Queen', 3);

insert into L2(Id, NodeId, Name, L1Id) values (1, 4, 'Stockholm', 1);
insert into L2(Id, NodeId, Name, L1Id) values (2, 5, 'Copenhagen', 3);

insert into L3(Id, NodeId, Name, L2Id) values (1, 6, 'Haninge', 1);
insert into L3(Id, NodeId, Name, L2Id) values (2, 7, 'Järfälla', 1);

insert into L3Contact(Name, L3Id) values ('Alexandra', 2);

insert into L4(Id, NodeId, Name, L3Id) values (1, 8, 'Viksjö', 2);
insert into L4(Id, NodeId, Name, L3Id) values (2, 9, 'Jakobsberg', 2);


insert into L5(Id, NodeId, Name, L4Id) values (1, 10, 'Veckovägen', 2);
insert into L5(Id, NodeId, Name, L4Id) values (2, 11, 'Axvägen', 1);
insert into L5(Id, NodeId, Name, L4Id) values (3, 12, 'Stråvägen', 1);

insert into L5Contact(Name, L5Id) values ('Eidemiller', 3);
insert into L5Contact(Name, L5Id) values ('Isaksson', 2);

/*
  Global Healthcare Network
*/

insert into Hierarchies (Id, Name, CreatedDate, LastModified) values
(102, "Global Healthcare Network", '2025-04-16 10:30:00', '2025-04-16 16:00:00');

insert into L1(Id, NodeId, Name, HierarchyId) values (104, 1, 'North America', 102);
insert into L1(Id, NodeId, Name, HierarchyId) values (105, 2, 'Europe', 102);
insert into L1(Id, NodeId, Name, HierarchyId) values (106, 3, 'Asia', 102);

insert into L2(Id, NodeId, Name, L1Id) values (103, 4, 'USA', 104);
insert into L2(Id, NodeId, Name, L1Id) values (104, 5, 'Canada', 104);
insert into L2(Id, NodeId, Name, L1Id) values (105, 6, 'Germany', 105);
insert into L2(Id, NodeId, Name, L1Id) values (106, 7, 'Japan', 106);

insert into L3(Id, NodeId, Name, L2Id) values (103, 8, 'California', 103);
insert into L3(Id, NodeId, Name, L2Id) values (104, 9, 'Ontario', 104);
insert into L3(Id, NodeId, Name, L2Id) values (105, 10, 'Bavaria', 105);
insert into L3(Id, NodeId, Name, L2Id) values (106, 11, 'Tokyo Prefecture', 106);

insert into L4(Id, NodeId, Name, L3Id) values (103, 12, 'Los Angeles', 103);
insert into L4(Id, NodeId, Name, L3Id) values (104, 13, 'Toronto', 104);
insert into L4(Id, NodeId, Name, L3Id) values (105, 14, 'Munich', 105);
insert into L4(Id, NodeId, Name, L3Id) values (106, 15, 'Tokyo', 106);

insert into L5(Id, NodeId, Name, L4Id) values (104, 28, 'Sunset Medical Center', 103);
insert into L5(Id, NodeId, Name, L4Id) values (105, 29, 'Toronto General', 104);
insert into L5(Id, NodeId, Name, L4Id) values (106, 30, 'Munich Care', 105);
insert into L5(Id, NodeId, Name, L4Id) values (107, 31, 'Tokyo Wellness Clinic', 106);

insert into L5Contact(Name, L5Id) values ('Dr. Alice Monroe', 104);
insert into L5Contact(Name, L5Id) values ('Dr. Hiroshi Tanaka', 107);
insert into L5Contact(Name, L5Id) values ('Nurse Julia Stein', 106);

commit;


/** Theme Fantasy **/
/** Starting phonemes for places **/
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Ar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Thal');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Vor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Kael');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Al');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Riv');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Toran');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Valth');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'El');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Zar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Cor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Syl');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Dra');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Ith');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Mord');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Ner');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Rha');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Lor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Hald');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Fael');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Vyr');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Kal');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Ber');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Zeth');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Eld');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Gor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Tir');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Sal');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Rys');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Fenn');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Khor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Dyl');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Shal');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Ryn');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Oran');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Cail');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Zel');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Vael');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Ald');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Thir');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Fel');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Lorn');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Vren');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Glan');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Nir');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Tor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Aran');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Jor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Harn');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Myl');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Ari');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Var');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Kiel');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Dren');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Sil');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Dorn');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Har');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Alth');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Elor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Raen');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Vorth');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Tarn');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Khal');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Ral');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Hran');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Sith');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Mel');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Dorin');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Vath');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Frel');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Kel');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Marth');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Bryn');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Lir');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Draen');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Thar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Sian');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Rein');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Kor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Dros');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Viran');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Far');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Krin');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Lar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Jol');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Bhal');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Fal');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Vin');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'STARTING', 'Mal');
/* Middle phonemes */
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'en');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'or');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ai');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ul');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ol');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'an');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'el');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ir');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'al');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'il');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'yn');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'er');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ur');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'om');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'es');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'as');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'os');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ew');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'oy');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ay');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ee');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'au');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'oo');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ei');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ua');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ou');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ia');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ie');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ae');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ea');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ya');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'yo');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'zu');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ze');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'za');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'zi');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ri');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ka');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'li');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'mi');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'on');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'in');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ian');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'eil');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ail');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'et');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'at');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ot');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'io');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ui');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'oi');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'MIDDLE', 'ra');
/* Ending phones */
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'dor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'heim');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'spire');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'thal');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'drak');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'orim');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'dun');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'ril');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'sor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'gor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'nath');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'ilith');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'mar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'morn');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'ros');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'dar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'tar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'vel');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'lon');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'thar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'resh');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'vorn');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'lith');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'ir');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'sair');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'din');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'aric');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'mith');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'sil');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'ran');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'thos');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'gar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'shar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'tash');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'raen');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'lore');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'han');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'torr');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'bael');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'rak');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'win');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'aeon');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'val');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'ris');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'bri');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'zan');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'all');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'kael');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'sol');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'len');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'mir');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'lor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'zael');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'dol');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'shin');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'kan');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'rin');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'san');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'tor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'hal');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'lar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'dir');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'nor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'ven');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'lir');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'mor');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'kar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'nar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'sar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'dal');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'zir');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'ray');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'vear');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'zel');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'ryl');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'vil');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'ser');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'tol');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'zar');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'nel');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'hel');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'ral');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'mon');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'sel');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'dan');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'kel');
INSERT INTO NamePhonemes (Theme, Category, Position, Value) VALUES ('FANTASY', 'PLACE', 'ENDING', 'rol');
/*
 Adjectives
*/
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Aarakocra');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Aetherial');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Ancient One');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Ancient');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Ancientwood');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Arcane');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Arcani');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Ashen');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Ashenborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Astral');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Bane');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Beastkin');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Beastly');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Bitter');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Blackened');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Blessed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Blood Elf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Blood-soaked');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Bloodclad');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Bloodthirsty');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Boundless');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Bountiful');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Briar');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Brimstone');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Cavernous');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Celestial');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Celestian');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Chivalrous');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Cinder');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Cloud Giant');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Crimson');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Cursed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Dark Elf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Dark');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Darkwood');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Demonborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Demonic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Dhampir');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Diamond');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Divine');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Djinn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Doomclad');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Doomed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Doomstruck');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Draconic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Dragon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Dragonborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Dread');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Dreadwrought');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Drow');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Dwarven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Eclipsed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Efreeti');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Eldritch');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Elemental');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Enchanted');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Endless');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Enduring');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Epic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Eternal');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Ether-bound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Ethereal');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Fabled');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Feathered');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Felborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Feral');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Fey');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Feytouched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Fiendish');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Fierce');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Fiery');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Fire Elf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Fire Giant');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Flame-born');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Flame-touched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Flameclad');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Flamelit');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Forgotten');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Forsaken');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Frost Elf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Frost Giant');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Frost-bound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Frost-wrought');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Frostbitten');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Frosted');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Frostforged');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Frozen');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Ghoul');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Glacial');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Glistening');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Glittering');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Gloomclad');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Glooming');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Glorious');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Gnomish');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Goblin');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Golden');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Grand');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Gravebound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Grim');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Halfling');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Hallowed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Haunted');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Haunting');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Hellfire');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Hill Dwarf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Hill Giant');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Hobgoblin');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Human');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Illustrious');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Imposing');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Indomitable');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Infernal');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Infinite');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Ironblood');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Ironclad');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Kobold');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Legendary');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Lichborne');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Lifeless');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Luminous');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Majestic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Merfolk');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Mighty');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Minotaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Mist-shrouded');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Misty');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Moon Elf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Moonlit');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Moonshrouded');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Mountain Dwarf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Mournful');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Mysterious');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Mystic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Necrid');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Noble');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Oblivion');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Obsidian');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Ogre');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Omen');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Ominous');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Orcish');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Petrified');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Planar');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Powerful');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Primal');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Radiant');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Raging');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Raven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Relentless');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Resilient');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Resplendent');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Revenant');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Revered');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Royal');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Runeborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Runic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Rustic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Sable');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Sacred');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Sand Elf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Satyr');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Searing');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Seaswept');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Seraphic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Serene');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Shade');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Shadow');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Shadowed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Shadowkin');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Shadowmourn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Shattered');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Shining');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Silent');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Silver-touched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Silverclad');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Silvered');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Silvershade');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Skyfolk');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Snowborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Sovereign');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Spectral');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Starlit');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Starry');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Starspawn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Steel-wrought');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Stone Dwarf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Stoneborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Stonekin');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Storm Giant');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Storm-wrought');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Stormborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Stormtouched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Stormy');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Sun Elf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Sun-kissed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Sunlit');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Sunshadowed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Sylvan');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Tangled');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Terror-wrought');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Thornborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Thunderscourged');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Thunderstruck');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Tidal');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Tideborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Tiefling');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Timeless');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Titanic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Torn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Triton');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Trollkin');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Twilight');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Twinkling');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Twisting');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Unbroken');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Unconquered');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Undead');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Unfathomable');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Unholy');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Unrivaled');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Unseen');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Unyielding');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Vampiric');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Vast');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Venerated');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Vengeful');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Venomous');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Violet');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Voidborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Voidwalker');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Whispering');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Wicked');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Wild');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Windborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Windborne');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Wisp');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Witchborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Wondrous');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Wood Elf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Wraith');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Wrathful');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Wyrm');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Wyrmclad');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'Wyrmgold');
/* Titles */
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'realm of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'kingdom of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'dominion of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'empire of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'sovereignty of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L1', 'lands of');

commit;

/*
 L2 Titles
*/
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'highlands of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'valleys of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'forests of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'steppes of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'plains of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'moorlands of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'peninsula of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'glacierfields of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'iceflats of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'provinces of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'marches of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'baronies of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'duchies of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'territories of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'dominions of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'prefectures of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'clanslands of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'tribelands of');
/*
L2 Adjectives
*/
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Aetherbound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Ancestral');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Arcane');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Ashwing');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Blighted');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Bloodsworn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Bonecarved');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Bramblebright');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Broodmarked');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Burrowfolk');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Celestial');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Celestine');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Crowned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Cryptsworn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Cursed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Deathsworn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Deepdelved');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Deeprooted');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Draconic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Dreaded');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Dwarven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Eldritch');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Elvish');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Emberbeard');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Emberborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Emberlit');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Enigmatic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Eternal');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Ethereal');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Ferocious');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Feyborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Flame-touched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Forgebound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Forgotten');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Forsaken');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Frozen');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Gilded');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Glacial');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Gnomish');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Graveborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Grimeclad');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Halfling');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Hallowed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Hearthbound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Hollow');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Hollowblood');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Howling');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Imperial');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Ironveined');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Lanternlit');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Leafbound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Lichbound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Mawkin');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Misty');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Mithrilborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Moonborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Moonlit');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Noble');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Obsidian');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Orcish');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Paleborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Radiant');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Ravaged');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Savage');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Scalebound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Scorched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Shadowed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Shattered');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Shrouded');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Silvered');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Skymarked');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Sovereign');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Starborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Starbound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Starkind');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Stonehewn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Storm-swept');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Sun-bleached');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Sylvan');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Thorned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Tidal');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Timeless');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Tinkered');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Tunnelcarved');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Tusktide');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Twilight-kissed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Umbral');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Untamed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Veiled');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Verdant');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Voidkissed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'War-torn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Warborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Whispering');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Whistleleaf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Wind-carved');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Wyrm-ridden');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L2', 'Wyrmblood');

commit;

/*
L3 title 
*/
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'city of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'town of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'village of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'keep of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'outpost of');
/*
L3 adjectives
*/
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ancient Oracle’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ancient Singer’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Anvilborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Arcane Owl');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Arcane Spiral');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Arcanist’s Wake');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ash-Born');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ash-Crowned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ash-Stained');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ash-Tongued');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ashen Vow');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Astral-Crowned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Axebitten');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Barreldelver’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Battle-Cursed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Blackblood');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Blackstone');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Blacktongue');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Blacktooth');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Bladeshorn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Blight-Touched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Blightborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Blistered Iron');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Blood-Eyed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Blood-Touched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Bloodbraid');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Blooddrinker’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Bloodmarked Warrior');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Blooming Thistle');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Bone-Cracked');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Bone-Torched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Bonefire’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Bonehowler’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Brimstone-Crowned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Broken Fang');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Broken Sword');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Bronzebeard’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Brute-Wrought');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Burning Covenant');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Burnt-Earth');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Celestial Seal');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Chainbound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Chainbound Flame');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Charnel Warden’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Chieftain’s Wrath');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Chronoglyph');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Chronomancer’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Cinder-Eyed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Cloaked Star');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Coalhearted');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Copper-Browed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Corpse-Splitter’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Cracked Helm');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Cragborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Crimson Grave');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Crimson Pact');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Crown of Thorns');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Crowned Anvil');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Crystal Veil');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Crystal-Spined');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Curse-Marked');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Daggermaw');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Dark Promise');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Death-Tide');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Deathchant');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Deep-Hammered');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Deep-Warded');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Deepdelver’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Demon’s Grin');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Desecrator’s Mark');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Doomchant');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Dread Sorcerer’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Dread-Eyed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Dream-Linked');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Dreaming Star');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Dreamthorn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Duskborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Dust-Warded');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Earthblooded');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Elderscribed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ember-Crowned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ember-Eyed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ember-Wreathed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Emberglyph');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Enchanted Lantern');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ether-Sung');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ethereal Bloom');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Featherquill’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Fey-Whisper');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Fire-Anointed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Fire-Braided');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Fire-Eyed Giant');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Fire-Lashed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Flamebrand');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Flaybrand');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Forge-Kissed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Forgefather’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Forgotten Wraith');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Frostjaw');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Gemcarver’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Gentle Deer');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Gilded Antler');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Gilded Page');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Glimmering Spirit');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Goldbound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Golden Sunbeam');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Goldvein');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Gravetusk');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Greathammer');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Grim Raven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Grime-Clad');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Grimoire-Keeper’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Grudgebearer’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Hammerdeep');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Hammerthane');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Hate-Wrought');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Haunted Widow’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Hearth-Hollowed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Hellborne');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Hellfire’s Whisper');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Helmcarver’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Hexcarved');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Hollow-Eyed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Horn-Crowned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Howling Fang');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Illusion-Braided');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Infernal Eye');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ink-Stained');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Iron Wolf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Iron-Burnt');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ironflame');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ironforged');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ironjaw');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Lava-Bathed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Leaf-Kissed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Lore-Bound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Loreforged');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Magma-Blooded');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Malice-Forged');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Mawscarred');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Mindpiercer’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Mirror-Wrought');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Misty Hill');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Mithril-Clad');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Moon-Hallowed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Moon-Scribed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Moon-Warped');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Moonlit Sage');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Mossy Elm');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Nightwhispered');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Oath-Shattered');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Oathbound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Oathbreaker’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Oracle’s Ash');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ore-Drinker’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Oreheart’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Pale Moon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Pickhand’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Quiet Shepherd’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Quill-Bent');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Rageforged');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Ravager’s Grin');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Razorbound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Red-Eyed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Red-Eyed Horns');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Red-Fanged');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Red-Vein');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Riftborn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Rockrooted');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Rotfang');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Rune-Sealed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Rune-etched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Runemarked');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Rustfang');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Rustling Willow');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Sapphire Archer’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Scarhound’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Scarred Tusker’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Scary Vampire');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Scorch-Cursed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Screaming Flame');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Scroll-Kissed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Shadow-Cloaked');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Shieldwright’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Shrieking Maw');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Sigil-Spun');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Silver Flame');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Silverveined');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Sin-Eater’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Singing River');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Sinshackled');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Skarr-Blessed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Skullhammer');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Slaughtermark');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Soft Wind');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Soulflayer’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Spellbound Wind');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Spellburned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Spellmarked');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Spiral-Eyed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Splitbone');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Staff-Bearer’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Starcaller’s Echo');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Starlight Wanderer’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Starlit Arcanum');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Starroot');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Starwoven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Steel-Sung');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Stonefather’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Stonethrone’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Storm-Hammered');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Stoutshield');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Sweet Clover');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'The Broken Sigil');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'The Fallen Seal');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Thirsting Flame');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Thorn-Crowned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Thunderhide');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Thundersteel');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Time-Bound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Timelost');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Tome-Cracked');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Tuskbound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Twilight Glyph');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Vault of Thought');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Vault-Keeper’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Vilebrand');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Void-Inked');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Voidbound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Wand-Touched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Wandering Candle');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Wandering Fey');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Wandering Sigil');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Wandlight');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'War-Cursed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Warborn Forger');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Warhowler’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Warmaw');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Warp-Fanged');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Warpainted');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Warpfire’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Whispering Ember');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Whispering Ghoul');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Whispering Tome');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Wither-Soaked');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Woe-Wrapped');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Woundtaker');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L3', 'Wrathcloaked');

/*
L4 titles
*/

INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'neighbourhood of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'quarter of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'enclave of');
INSERT INTO `NameTitles` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'sector of');

/*
L4 adjectives
*/
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Amber-Moonlit Dreaming-Leaf Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Amber-Touched Moonlit Sylvan');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Arcane-Fern Crystal-Bloomed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Ash-Scarred Flesh-Worn Necropolis');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Ashen Wolfclaw Moonrise');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Ashen-Clawed Thunder-Bound Orc');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blackened-Hoofed Skull-Touched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Eaten Ruin-Marked Undead');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Forged Iron-Horned Battle');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Frosted Soul-Devoured Undying');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Howled Lunar Claw');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Laced Steel-Backed Warlord');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Marked Steel-Fanged Warlord');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Mist Skull-Ravaged Orc');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Roared Grass-Stride Warrior');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Roared Iron-Tusked Warlord');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Scented Lupine Howl');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Scented War-Scarred Orc');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Soaked Lupine Night-Bound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Spattered Iron-Fanged War');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Stained Skull-Touched Battle');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Tainted Bone-Crawled Undead');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Blood-Torn Savage-Fanged War');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Bloodied-Claw Iron-Fanged Warlord');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Bloodlust Nightfang Moonlit');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Bloodmoon Lupine-Frosted Dark');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Bone-Crafted Thunder-Skinned War');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Bone-Crowned Shadow-Whispered Necrotic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Bone-Crushed Steel-Blooded Beast');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Bone-Cursed Flame-Born Warlord');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Bone-Horned Thunder-Roared Orc');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Bone-Misted Veil-Cursed Necrotic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Bone-Ravaged Thunder-Clawed Orc');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Bone-Touched Fire-Bound Warlord');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Celestial Crystal-Sheened Unicorn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Celestial Glimmering Unicorn-Crowned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Celestial Horn-Touched Enchanted');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Celestial Unicorn-Woven Moonlit');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Celestial-Aurora Leaf-Marked Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Celestial-Moon-Glazed Sylvan Grove');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Coral-Misted Siren’s Dream');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Coral-Scented Seafoam Haven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Crystal-Bloomed Sylvan-Harmony Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Crystal-Bound Ocean’s Whisper');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Crystal-Crested Siren Song');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Crystal-Horned Leaf-Bound Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Crystal-Horned Starlight Faewood');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Crystal-Laden Abyssal Tide');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Crystal-Mane Twilight-Radiant');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Crystal-Moonlit Sylvan-Bloom');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Crystal-Moonlit Sylvan-Touched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Dark-Borne Death-Spire Shadow');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Dark-Cloaked Bone-Shrieking Undying');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Dark-Soaked Flesh-Bound Grave');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Dark-Soul Blood-Drained Undead');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Dawn-Blessed Hoof-Roared');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Dawn-Soaked Grass-Hoofed Wanderer');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Death-Bloomed Forgotten-Rune Undead');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Death-Scented Hollow-Breath Necrotic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Death-Soaked Cursed-Torn Necrotic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Death-Torn Grave-Howled Necropolis');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Death-Touched Ashen-Breath Wraith');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Deep-Crested Tranquil Wave');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Deep-Sung Saltwater');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Deepwater Serenade Pearl-Bound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Dew-Crowned Sunlight-Elven Grove');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Dream-Crafted Unicorn’s Light');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Dream-Echoed Crystal-Hoofed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Dreamstone Moon-Touched Silver');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Dreamwhisper Horned Crystal-Bloom');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Dust-Born Flame-Whispered Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Dust-Torn Wind-Roamed Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Earth-Marked Hoof-Touched Wild');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Earth-Shaped Horn-Raised Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Earthbound Thunder-Mane Herd');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Ember-Hearted Hoof-Touched Nomad');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Eternal-Bone Plague-Soaked Undead');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Eternal-Cursed Wraith-Bound Death');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Ethereal Silverlight Horn-Crested');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Ethereal-Crafted Sunlit Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Ever-Flowing Crystal-Lined Moon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Evergreen Moon-Crafted Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Fae-Bloomed Dew-Drenched Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Faeblossom Horned Dream-Dusted');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Faewood Horned Glimmering Unicorn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Faewood-Blessed Goldenleaf Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Faewood-Embrace Wind-Dusted Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Faewood-Washed Moonlit Dream');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Faewood-Whispered Radiant-Moon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Fangclaw Night-Shattered Moon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Feral-Crowned Iron-Blooded Warlord');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Fire-Cracked Bone-Roared Orc');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Fire-Hearted Thunder-Roamed Warrior');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Fire-Raged Skull-Fisted War');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Fire-Scorched Bone-Cracked War');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Fire-Wrought Skull-Blooded War');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Flame-Bound Skull-Splintered Orc');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Flame-Scarred Ravage-Blooded Orc');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Flame-Touched Earth-Sworn Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Flame-Woven Grass-Roamed Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Flesh-Bound Moon-Cursed Undead');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Flesh-Hungering Dark-Blooded Undying');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Flesh-Shriek Rot-Silenced Necropolis');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Forest-Hushed Fire-Hearted Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Forgotten-Whispered Rot-Soaked Undead');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Frost-Horned Savage Fang');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Frost-Marked Shifting Wolf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Fullmoon Howl-Born Shadowfang');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Fullmoon Warden-Guarded Wild');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Fullmoon Wulfkin Shroud');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Gale-Blessed Fire-Crafted Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Gale-Touched Hoofed-Wild Running');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Galloping-Hoof Moonlit Thunder-');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Glimmering Faewood Crystal-Crowned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Glimmering Faewood Horned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Glimmering Hoof-Touched Dream');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Glimmering Moon-Pool Silverleaf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Glimmering Seafoam Dream-Laced');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Glittering Abyss-Touched Siren');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Glittering Guarded Reef');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Glowing Crystal-Pure Unicorn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Gore-Blooded Stone-Hewn Orc');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Grass-Blessed Hoof-Crafted Warrior');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Grass-Echoed Thunder-Marked Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Grass-Marked Galloping-Mane Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Grave-Drenched Moonlit-Silence Undying');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Grave-Hollowed Veil-Worn Undying');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Hoof-Bound Spirit-Roamed Herd');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Hoof-Dusted Clan-Held Wild');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Hoof-Risen Wild-Marked Herd');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Hoof-Roamed Star-Marked Warrior');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Hoof-Stormed Wild-Hearted Nomad');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Horn-Raised Galloping-Sun Herd');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Horn-Roared Storm-Soaked Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Horned Celestial Dream-Sung');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Horned-Bound Earth-Touched Galloping');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Howl-Frosted Silverclaw Wolf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Howl-Touched Savage Lupine');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Howling Beast-Soul Bloodmoon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Howling Hunter´s Bloodstorm');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Howling Wolf-Born Moonstone');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Howling Wolf-Touched Bloodmoon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Iridescent Shell-Tide Dream');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Iron-Backed Blood-Crushed Battle');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Iron-Backed Savage-Horned Orc');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Iron-Blooded Warlord-Guarded');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Iron-Clad Beast-Born Warlord');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Iron-Cleaved Bone-Worn Warlord');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Iron-Fisted Bone-Torn Battle');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Iron-Footed Herd-Touched Wild');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Iron-Hearted Skull-Touched Battle');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Iron-Roared Beast-Blooded Forge');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Iron-Spiked Bone-Horned War');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Iron-Wrought Bone-Marked Warlord');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Leaf-Touched Silver-Streaked Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Luminous Faewood Moonbeam');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Luminous Moon-Horned Starflare');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Luminous Wind-Blessed Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Lunar-Wolf Fang-Storm');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Lupine Fangshadow Frostbite');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Lupine Hunter´s Wolfhowl');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Lush-Grove Moon-Touched Radiance');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Lush-Rose Sylvan-Dream Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Midnight Howled Fang-Torn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Midnight Moonshadow Lupine');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Midnight Wolf-Hunted Savage');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Mist-Kissed Starweave Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moon-Crested Sea-Glimmering');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moon-Frosted Night-Wolf Howl');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moon-Frosted Sylvan-Woven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moon-Hallowed Howling Beast');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moon-Kissed Hoof-Wrought Herd');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moon-Kissed Stardust-Glowing');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moon-Shadowed Howl-Bound Claw');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moon-Touched Arcane-Woven Sylvan');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moon-Touched Celestial Hoof');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moonblessed Faewood Crystal-Crowned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moonlight-Horned Luminous Twilight');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moonlit Coral-Hearted Pearl');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moonlit Crystal-Hoofed Starlight');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moonlit Crystal-Horned Dream');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moonlit Fang-Walkers Bloodmoon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moonlit Hoof-Bound Warrior’s');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moonlit Horn-Woven Faewood');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moonlit Nightwolf Blood-Howl');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moonlit Ocean-Touched Reef');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moonlit Savage Pack');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moonlit Silverwood-Echoed Star');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moonshard Ocean-Crowned Coral');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Moonstone-Glowed Silverleaf-Walked');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Necrotic-Hollow Plague-Born Grave');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Night-Blood Moon-Fanged Wolf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Night-Bound Fang-Howled Lupine');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Night-Frosted Wolf-Torn Fullmoon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Night-Hunted Crimson Fang');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Night-Risen Rot-Skulled Undead');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Night-Shrouded Wolfmoon Dawn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Night-Touched Bone-Eater Undying');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Night-Walked Grave-Eater Undead');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Ocean-Blessed Sunken Reef');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Ocean-Bound Coral-Breathing');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Ocean-Echoed Crystal-Winged');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Ocean-Frosted Dream-Bound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Ocean-Kissed Moonstone Reef');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Pearl-Crowned Moonlit Wave');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Pearl-Touched Ocean-Hearted');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Pearl-Touched Ocean-Winged');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Pearl-Touched Whispering Wave');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Plague-Touched Bone-Crushed Shadow');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Pure Horned Star-Touched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Purelight Horn-Crafted Dream');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Puremoon Crystal-Horned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Radiant Dream-Echoed Horn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Radiant Horn-Touched Silverbeam');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Radiant Horn-Whispered Moonbeam');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Radiant Horned Stardust-Sheen');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Radiant Moon-Touched Starfall');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Radiant-Glade Wind-Washed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Radiant-Horned Golden-Touched Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Radiant-Whispered Silver-Grove');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Roaring-Hoofed Dawn-Rising Warrior');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Rot-Ravaged Shade-Drained');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Rot-Ravaged Wraith-Bound Shadow');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Rotting-Soul Cursed-Screams Necropolis');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Salt-Blessed Shimmering Pearl');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Salt-Soaked Tranquil Abyss');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Sapphire-Hued Mermaid’s Whisper');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Savage Moon-Wolf Shard');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Savage-Born Bone-Cracked War');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Savage-Hearted Iron-Bound War');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Savage-Raised Bone-Skinned Orc');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Sea-Born Crystal-Tide');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Sea-Born Iridescent Shell');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Sea-Kissed Crystal-Bound Moon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Seabreeze-Scented Moon-Kissed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Seawind-Whispered Luminous Pearl');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shadow-Bound Fang-Scarred Wolf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shadow-Haunted Grave-Stained Wraith');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shadow-Howled Wolfpack Night');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shadow-Mist Bone-Eaten Necrotic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shadow-Wrapped Spirit-Drained Necrotic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shattered-Flesh Night-Touched Necrotic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shattered-Soul Grave-Swallowed Night');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shattered-Soul Silent-Hunger Undead');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shattered-Whispered Grave-Torn Undying');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shell-Bound Ocean-Kissed Pearl');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shimmering Crystal-Glowed Unicorn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shimmering Horned Moonstone');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shimmering Tide-Mist Coral');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shimmering Wave-Touched Crystal');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shining Crystal-Glazed Unicorn-Crowned');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Shining Hoofed Crystal-Bound');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silent-Bane Ashen-Roamed Dead');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silent-Hunger Flesh-Cursed Necrotic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silent-Mist Broken-Soul Necropolis');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silver-Bloomed Dew-Scented Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silver-Bloomed Glade-Woven Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silver-Clawed Midnight Howl');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silver-Finned Moonlit Tide');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silver-Hoofed Moonlit Whispering');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silver-Horned Star-Glowed Unicorn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silver-Horned Twilight-Bloomed Unicorn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silver-Leafed Fae-Touched Grove');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silver-Mane Moonlit Dreamstone');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silver-Moonlit Dream-Echoed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silver-Scented Darkfang Howl');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silver-Touched Blood-Torn Wolf');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silver-Touched Dreamstone Unicorn');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silverfang Nightclaw Blood');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silverfang Shadow-Bound Moon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Silverleaf-Walked Starlight-Dream Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Siren-Sung Tidal Moon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Skull-Blooded Iron-Wrought War');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Skull-Bound Iron-Cracked Battle');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Skull-Crushed Blood-Roared Beast');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Skull-Frosted Blood-Chilled Specter');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Sky-High Herd-Marked Thunder');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Soul-Bound Corpse-Screamed Nightfall');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Soul-Drenched Phantom-Bound Death');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Soul-Eater Silent-Cloaked Necrotic');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Soul-Scorned Flesh-Torn Wraith');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Spirit-Horned Storm-Roamed Warrior');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Star-Flecked Sapphire Deep');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Star-Kissed Crystal-Hoofed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Star-Kissed Grass-Horned Warrior');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Star-Lit Shimmering Ocean');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Star-Sprinkled Ancient-Oak Whispering');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Stardust-Touched Silver Hoof');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Starlight-Pure Unicorn-Blessed');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Starlight-Touched Faewood Radiance');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Starlight-Washed Crystal-Leaf Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Starlit Horned Faewood Dream');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Starlit-Mystic Silver-Drenched');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Starry-Touched Silver-Leaf Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Steel-Clad Thunder-Fanged War');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Stone-Fist Blood-Torn Beast');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Stone-Fisted Blood-Horned Battle');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Stone-Raised Blood-Bound Warchief');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Stone-Torn Blood-Wrought Beast');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Stone-Wild Thunder-Bound Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Stone-Wrought Horn-Roared Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Storm-Chased Swift-Hoofed Nomad');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Storm-Shadowed Earthbound Herd-Mane');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Storm-Touched Hoof-Sworn Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Storm-Whipped Horned-Warrior Herd');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Sun-Drenched Hoof-Bound Plains');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Sun-Horned Galloping-Earth Warrior');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Sun-Kissed Arcane-Leaf Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Sun-Kissed Meadow-Bound Galloping');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Sun-Kissed Verdant-Grove Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Sunken Coral-Sheened Wave');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Sunken Shell-Whispered Dream');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Sylvan-Sung Silver-Pool');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Thunder-Blooded Flame-Forged War');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Thunder-Bound Bone-Ravaged Orc');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Thunder-Fist Iron-Torn War');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Thunder-Lashed Herd-Bound Galloping');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Thunder-Roamed Earth-Blessed Galloping');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Tidal-Whispered Deepwater Pearl');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Tide-Bound Serpent-Song');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Tranquil Deepwater Dream-Wave');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Tranquil Star-Sheened Coral');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Twilight Glimmering Horned Stardust');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Twilight Moonbeam Unicorn’s Grace');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Twilight-Glimmering Star-Leaf Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Twilight-Glowing Emerald-Woven Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Twilight-Misted Star-Horned Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Undying-Bone Soul-Weeping Shadow');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Veil-Torn Bone-Crafted Undying');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wave-Touched Ocean-Crowned Dream');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Whispering Grove-Hearted Silvermoon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Whispering Ocean-Tide Star');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Whispering Tide-Crystal Coral');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Whispering-Moon Crystal-Crafted Elven');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Whispering-Wind Grave-Touched Specter');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wildflower-Blanketed Starbound Grove');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wind-Crafted Stone-Roamed Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wind-Forged Galloping-Mane Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wind-Horned Herd-Crafted Centaur');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wind-Roared Blood-Rustled Warrior');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wind-Swept Plains-Rider Clan');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wolf-Bound Dark-Sky Fullmoon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wolf-Bound Silent Nightfall');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wolf-Crowned Shadow-Hunters Fullmoon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wolf-Kissed Silverstorm Fullmoon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wolf-Marked Shadow-Wolf Night');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wolf-Touched Darkfang Moon');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wolf-Touched Twilight Shadow');
INSERT INTO `NameAdjectives` (`Theme`, `Category`, `NodeLevel`, `Value`) VALUES ('FANTASY', 'PLACE', 'L4', 'Wraith-Touched Moon-Swallowed Necropolis');

commit;