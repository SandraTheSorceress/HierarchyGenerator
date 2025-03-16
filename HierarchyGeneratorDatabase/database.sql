	CREATE DATABASE hierarchy_generator;

	use hierarchy_generator;

	create table hierarchy (
	id int PRIMARY KEY,
	name text,
	numberOfNodes int,
	createdDate DATETIME,
	lastModified DATETIME
	);

	insert into hierarchy values (1, "Hierarch 1", 1, '2025-03-16 14:30:00', '2025-03-16 14:30:00');
	insert into hierarchy values (2, "Hierarch 2",5, '2025-03-16 14:30:00', '2025-03-16 14:30:00');
	insert into hierarchy values (3, "Hierarch 3",7, '2025-03-16 14:30:00', '2025-03-16 14:30:00');
	insert into hierarchy values (4, "Hierarch 4", 9, '2025-03-16 14:30:00', '2025-03-16 14:30:00');

	commit;