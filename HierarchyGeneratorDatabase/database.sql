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