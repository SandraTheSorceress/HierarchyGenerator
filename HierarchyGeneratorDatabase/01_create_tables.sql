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