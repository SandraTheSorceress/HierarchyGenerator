use hierarchy_generator;

insert into Hierarchies (Id, Name, CreatedByName, CreatedByEmail, CreatedDate, LastModified) values
(102, "Global Healthcare Network", 'System', 'system@hierarchygenerator.com', '2025-04-16 10:30:00', '2025-04-16 16:00:00');

insert into L1(Id, NodeId, Name, HierarchyId) values (104, 1, 'North America',102);
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