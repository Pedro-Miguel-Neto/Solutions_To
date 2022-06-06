INSERT INTO MEMBERSHIP (MEM_FNAME, MEM_LNAME, MEM_STREET, MEM_CITY, MEM_STATE, MEM_ZIP, MEM_BALANCE) VALUES
	('Tami', 	'Dawson', 	'2632 Takli Circle', 		'Norene', 		'TN', '37136', 11),
	('Curt', 	'Knight', 	'4025 Cornell Court', 		'Flatgap', 		'TN', '41219', 6),
	('Jamal', 	'Melendez', '788 East 145th Avenue', 	'Quebeck', 		'TN', '38579', 0),
	('Iva', 	'Mcclain', 	'6045 Musket Ball Circle', 	'Summit', 		'TN', '42783', 15),
	('Miranda', 'Parks', 	'4469 Maxwell Place', 		'Germantown', 	'TN', '38183', 0),
	('Rosario', 'Elliot', 	'7578 Danner Avenue', 		'Columbia', 	'TN', '38402', 5),
	('Mattie', 	'Guy', 		'4390 Evergreen Street', 	'Lily', 		'TN', '40740', 0),
	('Clint', 	'Ochoa', 	'1711 Elm Street', 			'Greeneville', 	'TN', '37745', 10),
	('Lewis', 	'Rosales', 	'4524 Southwind Circle', 	'Counce', 		'TN', '38326', 0),
	('Stacy', 	'Mann', 	'2789 East Cook Avenue', 	'Murfreesboro', 'TN', '37132', 8),
	('Luis', 	'Trujillo', '7267 Melvin Avenue', 		'Heiskell', 	'TN', '37754', 3),
	('Minnie', 	'Gonzales', '6430 Vasili Drive', 		'Williston', 	'TN', '38076', 0);

INSERT INTO RENTAL (RENT_DATE, MEM_NUM) VALUES 
	('01-MAR-18', 103),
	('01-MAR-18', 105),
	('02-MAR-18', 102),
	('02-MAR-18', 110),
	('02-MAR-18', 111),
	('02-MAR-18', 107),
	('02-MAR-18', 104),
	('03-MAR-18', 105),
	('03-MAR-18', 111);

INSERT INTO PRICE (PRICE_DESCRIPTION, PRICE_RENTFEE, PRICE_DAILYATEFEE) VALUES
	('Standard', 		2, 		1),
	('New Release', 	3.5, 	3),
	('Discount', 		1.5, 	1),
	('Weekly Special', 	1, 		0.5);

INSERT INTO MOVIE (MOVIE_NUM, MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST, MOVIE_GENRE, PRICE_CODE) VALUES
	(1234, 'The Cesar Family Christmas', 	2009, 39.95, 'FAMILY', 	2),
	(1235, 'Smokey Mountain Wildlife', 		2006, 59.95, 'ACTION', 	1),
	(1236, 'Richard Goodhope', 				2010, 59.95, 'DRAMA', 	2),
	(1237, 'Beatnik Fever', 				2009, 29.95, 'COMEDY', 	2),
	(1238, 'Constant Companion', 			2010, 89.95, 'DRAMA', 	NULL),
	(1239, 'Where Hope Dies', 				2000, 25.49, 'DRAMA', 	3),
	(1245, 'Time to Burn', 					2007, 45.49, 'ACTION', 	1),
	(1246, 'What He Doesn''t Know', 		2008, 58.29, 'COMEDY', 	1);

INSERT INTO VIDEO VALUES 
	(34341, '22-JAN-16', 1235),
	(34342, '22-JAN-16', 1235),
	(34366, '02-MAR-18', 1236),
	(34367, '02-MAR-18', 1236),
	(34368, '02-MAR-18', 1236),
	(34369, '02-MAR-18', 1236),
	(44392, '21-OCT-17', 1237),
	(44397, '21-OCT-17', 1237),
	(54321, '18-JUN-17', 1234),
	(54324, '18-JUN-17', 1234),
	(54325, '18-JUN-17', 1234),
	(59237, '14-FEB-18', 1237),
	(61353, '28-JAN-15', 1245),
	(61354, '28-JAN-15', 1245),
	(61367, '30-JUL-17', 1246),
	(61369, '30-JUL-17', 1246),
	(61388, '25-JAN-16', 1239);

INSERT INTO DETAILRENTAL VALUES 
	(1001, 34342, 2, 	'04-MAR-18', '02-MAR-18',	NULL),
	(1001, 34366, 3.5, 	'04-MAR-18', '02-MAR-18',	3),
	(1001, 61353, 2, 	'04-MAR-18', '03-MAR-18',	1),
	(1002, 59237, 3.5, 	'04-MAR-18', '04-MAR-18',	3),
	(1003, 54325, 3.5, 	'04-MAR-18', '09-MAR-18',	3),
	(1003, 61369, 2, 	'06-MAR-18', '09-MAR-18',	1),
	(1003, 61388, 0, 	'06-MAR-18', '09-MAR-18',	1),
	(1004, 34341, 2, 	'07-MAR-18', '07-MAR-18',	1),
	(1004, 34367, 3.5, 	'05-MAR-18', '07-MAR-18',	3),
	(1004, 44392, 3.5, 	'05-MAR-18', '07-MAR-18',	3),
	(1005, 34342, 2, 	'07-MAR-18', '05-MAR-18',	1),
	(1005, 44397, 3.5, 	'05-MAR-18', '05-MAR-18',	3),
	(1006, 34366, 3.5, 	'05-MAR-18', '04-MAR-18',	3),
	(1006, 61367, 2, 	'07-MAR-18', NULL,			1),
	(1007, 34368, 3.5, 	'05-MAR-18', NULL,			3),
	(1008, 34369, 3.5, 	'05-MAR-18', '05-MAR-18', 	3),
	(1009, 54324, 3.5, 	'05-MAR-18', NULL, 			3);