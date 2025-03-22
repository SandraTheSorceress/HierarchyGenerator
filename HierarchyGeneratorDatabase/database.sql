	CREATE DATABASE hierarchy_generator;

	use hierarchy_generator;

	create table hierarchies (
	id int PRIMARY KEY,
	name text,
	numberOfNodes int,
	createdDate DATETIME,
	lastModified DATETIME
	);

	insert into hierarchies values (1, "Hierarchy 1", 1, '2025-03-22 14:30:00', '2025-03-22 14:30:00');
	insert into hierarchies values (2, "Hierarchy 2",5, '2025-03-22 14:30:00', '2025-03-22 14:30:00');
	insert into hierarchies values (3, "Hierarchy 3",7, '2025-03-22 14:30:00', '2025-03-22 14:30:00');
	insert into hierarchies values (4, "Hierarchy 4", 9, '2025-03-22 14:30:00', '2025-03-22 14:30:00');

	commit;