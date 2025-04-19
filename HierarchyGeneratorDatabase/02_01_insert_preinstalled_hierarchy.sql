use hierarchy_generator;

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

commit;