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

insert into Hierarchies (Name, NumberOfNodes, CreatedDate, LastModified, Status) values
("Acme Corp Global Operations", 5, '2025-03-11 08:15:00', '2025-03-23 09:45:00', "CREATED"),
("Zenith Financial Holdings Org Chart", 4, '2025-03-12 12:05:00', '2025-03-24 15:20:00', "CREATED"),
("BlueNova Technologies Division Structure", 3, '2025-03-13 14:25:00', '2025-03-25 18:30:00', "CREATED"),
("Summit Energy Corporate Hierarchy", 6, '2025-03-14 09:00:00', '2025-03-26 11:15:00', "CREATED"),
("Nimbus Retail Group Organization", 2, '2025-03-15 07:45:00', '2025-03-27 10:00:00', "CREATED"),
("Vertex Pharmaceuticals Leadership Tree", 3, '2025-03-16 11:10:00', '2025-03-28 13:50:00', "CREATED"),
("Orion Logistics Regional Model", 4, '2025-03-17 15:35:00', '2025-03-29 17:05:00', "CREATED"),
("BrightPath Media Structure", 5, '2025-03-18 16:40:00', '2025-03-30 20:30:00', "CREATED"),
("Ironclad Manufacturing Layers", 2, '2025-03-19 08:55:00', '2025-03-31 09:15:00', "CREATED"),
("Silverline Insurance Company Org Map", 3, '2025-03-20 13:10:00', '2025-04-01 14:30:00', "CREATED"),
("Pulse Health Systems Network", 4, '2025-03-21 09:20:00', '2025-04-02 10:40:00', "CREATED"),
("Everest Consulting Firm Structure", 2, '2025-03-22 10:50:00', '2025-04-03 12:10:00', "CREATED"),
("Lumen Cybersecurity Operational Layers", 5, '2025-03-23 12:00:00', '2025-04-04 13:30:00', "CREATED"),
("Crestfield Hospitality Group Hierarchy", 3, '2025-03-24 15:15:00', '2025-04-05 16:40:00', "CREATED"),
("Oakridge Automotive Global Org", 4, '2025-03-25 17:05:00', '2025-04-06 19:20:00', "CREATED"),
("Horizon Real Estate Management Structure", 2, '2025-03-26 14:55:00', '2025-04-07 15:30:00', "CREATED"),
("Nova Aerospace Corporate Tree", 3, '2025-03-27 09:40:00', '2025-04-08 11:25:00', "CREATED"),
("Redspire Entertainment Holdings Org", 5, '2025-03-28 10:20:00', '2025-04-09 12:10:00', "CREATED"),
("Pinevale Food & Beverage Organization", 3, '2025-03-29 14:00:00', '2025-04-10 15:00:00', "CREATED"),
("Helios Mining Group Structure", 2, '2025-03-30 13:25:00', '2025-04-11 17:45:00', "CREATED"),
("Stellar Finance Group Framework", 4, '2025-03-31 11:15:00', '2025-04-12 12:30:00', "CREATED"),
("Apex Legal Advisory Layers", 2, '2025-04-01 08:00:00', '2025-04-13 10:20:00', "CREATED"),
("MarbleTech Software Leadership Tree", 3, '2025-04-02 10:35:00', '2025-04-14 12:50:00', "CREATED"),
("Sable Communications Operational Structure", 2, '2025-04-03 13:50:00', '2025-04-15 15:30:00', "CREATED"),
("Northstar Oil & Gas Org Map", 4, '2025-04-04 09:25:00', '2025-04-16 11:00:00', "CREATED"),
("Avalon Biotech Corporate Framework", 3, '2025-04-05 12:45:00', '2025-04-17 13:20:00', "CREATED"),
("Cinder Financial Services Layers", 2, '2025-04-06 14:20:00', '2025-04-18 16:40:00', "CREATED"),
("Vantage Telecom Company Org", 4, '2025-04-07 11:30:00', '2025-04-19 13:50:00', "CREATED"),
("IronPeak Engineering Group Structure", 2, '2025-04-08 10:10:00', '2025-04-20 11:15:00', "CREATED"),
("Greenmont Agriculture Hierarchy", 1, '2025-04-09 07:50:00', '2025-04-21 09:10:00', "CREATED"),
("Echo Investments Holdings Model", 3, '2025-04-10 09:05:00', '2025-04-22 11:30:00', "CREATED"),
("Silverhawk Logistics Org Tree", 2, '2025-04-11 13:00:00', '2025-04-23 14:50:00', "CREATED"),
("Stratus Cloud Computing Layers", 4, '2025-04-12 15:20:00', '2025-04-24 17:40:00', "CREATED"),
("Unity Consumer Goods Holdings", 3, '2025-04-13 09:35:00', '2025-04-25 10:50:00', "CREATED"),
("Evergreen Environmental Solutions Org", 5, '2025-04-14 11:15:00', '2025-04-26 13:30:00', "CREATED"),
("Aether Aviation Corp Structure", 2, '2025-04-15 08:25:00', '2025-04-27 09:45:00', "CREATED"),
("Cascade Apparel Group Hierarchy", 4, '2025-04-16 10:45:00', '2025-04-28 12:15:00', "CREATED"),
("Luminary Pharma Company Org", 3, '2025-04-17 14:00:00', '2025-04-29 15:10:00', "CREATED"),
("Summit Financial Advisors Layers", 2, '2025-04-18 09:50:00', '2025-04-30 11:35:00', "CREATED"),
("Goldcrest Metals Corp Structure", 6, '2025-04-19 07:30:00', '2025-05-01 09:10:00', "CREATED"),
("Cobalt Industrial Holdings Org", 4, '2025-04-20 12:15:00', '2025-05-02 13:40:00', "CREATED"),
("Beacon Venture Partners Framework", 3, '2025-04-21 14:10:00', '2025-05-03 16:20:00', "CREATED"),
("Arcadia Green Energy Group Tree", 2, '2025-04-22 10:05:00', '2025-05-04 12:30:00', "CREATED"),
("Harbor Shipping & Transport Layers", 1, '2025-04-23 15:30:00', '2025-05-05 18:10:00', "CREATED"),
("Atlas Payment Solutions Org Map", 3, '2025-04-24 11:40:00', '2025-05-06 13:20:00', "CREATED"),
("Brightline Construction Corp Structure", 4, '2025-04-25 09:15:00', '2025-05-07 10:40:00', "CREATED"),
("Vertex CyberTech Holdings", 2, '2025-04-26 12:25:00', '2025-05-08 14:50:00', "CREATED"),
("Phoenix Capital Partners Org Tree", 5, '2025-04-27 08:40:00', '2025-05-09 10:00:00', "CREATED"),
("Cloudspire Data Systems Structure", 3, '2025-04-28 14:30:00', '2025-05-10 16:45:00', "CREATED");



commit;