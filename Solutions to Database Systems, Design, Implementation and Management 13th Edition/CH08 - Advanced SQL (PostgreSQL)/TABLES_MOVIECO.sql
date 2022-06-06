CREATE TABLE MEMBERSHIP (
MEM_NUM INTEGER GENERATED BY DEFAULT AS IDENTITY (START 102 INCREMENT 1) PRIMARY KEY,
MEM_FNAME VARCHAR(25) NOT NULL,
MEM_LNAME VARCHAR(25) NOT NULL,
MEM_STREET VARCHAR(50),
MEM_CITY VARCHAR(25),
MEM_STATE CHAR(2),
MEM_ZIP CHAR(6),
MEM_BALANCE INTEGER DEFAULT 0
);

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

CREATE TABLE RENTAL (
RENT_NUM INTEGER GENERATED BY DEFAULT AS IDENTITY (START 1001 INCREMENT 1) PRIMARY KEY,
RENT_DATE DATE NOT NULL,
MEM_NUM INTEGER REFERENCES MEMBERSHIP (MEM_NUM) NOT NULL
);

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

CREATE TABLE PRICE (
PRICE_CODE INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
PRICE_DESCRIPTION VARCHAR(50),
PRICE_RENTFEE NUMERIC(3,1) NOT NULL,
PRICE_DAILYLATEFEE NUMERIC(3,1) NOT NULL
);

INSERT INTO PRICE (PRICE_DESCRIPTION, PRICE_RENTFEE, PRICE_DAILYATEFEE) VALUES
	('Standard', 		2, 		1),
	('New Release', 	3.5, 	3),
	('Discount', 		1.5, 	1),
	('Weekly Special', 	1, 		0.5);

CREATE TABLE MOVIE (
MOVIE_NUM INTEGER GENERATED BY DEFAULT AS IDENTITY (START 1234) PRIMARY KEY,
MOVIE_TITLE VARCHAR(50) NOT NULL,
MOVIE_YEAR NUMERIC(4,0),
MOVIE_COST NUMERIC(5,2) NOT NULL,
MOVIE_GENRE VARCHAR(30),
PRICE_CODE INTEGER REFERENCES PRICE (PRICE_CODE)
);

INSERT INTO MOVIE (MOVIE_NUM, MOVIE_TITLE, MOVIE_YEAR, MOVIE_COST, MOVIE_GENRE, PRICE_CODE) VALUES
	(1234, 'The Cesar Family Christmas', 	2009, 39.95, 'FAMILY', 	2),
	(1235, 'Smokey Mountain Wildlife', 		2006, 59.95, 'ACTION', 	1),
	(1236, 'Richard Goodhope', 				2010, 59.95, 'DRAMA', 	2),
	(1237, 'Beatnik Fever', 				2009, 29.95, 'COMEDY', 	2),
	(1238, 'Constant Companion', 			2010, 89.95, 'DRAMA', 	NULL),
	(1239, 'Where Hope Dies', 				2000, 25.49, 'DRAMA', 	3),
	(1245, 'Time to Burn', 					2007, 45.49, 'ACTION', 	1),
	(1246, 'What He Doesn''t Know', 		2008, 58.29, 'COMEDY', 	1);

CREATE TABLE VIDEO (
VID_NUM INTEGER CHECK (VID_NUM > 9999) PRIMARY KEY,
VID_INDATE DATE,
MOVIE_NUM INTEGER REFERENCES MOVIE (MOVIE_NUM) NOT NULL
);

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

CREATE TABLE DETAILRENTAL (
RENT_NUM INTEGER REFERENCES RENTAL (RENT_NUM),
VID_NUM INTEGER REFERENCES VIDEO (VID_NUM),
DETAIL_FEE NUMERIC(3,1) NOT NULL,
DETAIL_DUEDATE DATE DEFAULT (CURRENT_DATE + 7),
DETAIL_RETURNDATE DATE,
DETAIL_DAILYLATEFEE NUMERIC(3,1),
PRIMARY KEY (RENT_NUM, VID_NUM)
);

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

ALTER TABLE DETAILRENTAL
ADD COLUMN DETAIL_DAYS_LATE NUMERIC(3,0);

ALTER TABLE DETAILRENTAL
ALTER COLUMN DETAIL_RETURNDATE TYPE TIMESTAMP ('YYYY-MM-DD HH12:MI:SS AM');
UPDATE DETAILRENTAL
SET DETAIL_RETURNDATE = DETAIL_RETURNDATE + INTERVAL '10H'
		WHERE RENT_NUM = 1001 AND VID_NUM IN (34342, 34366);
UPDATE DETAILRENTAL
SET DETAIL_RETURNDATE = DETAIL_RETURNDATE + INTERVAL '11H30M'
		WHERE RENT_NUM = 1001 AND VID_NUM IN (61353);
UPDATE DETAILRENTAL
SET DETAIL_RETURNDATE = DETAIL_RETURNDATE + INTERVAL '15H30'
		WHERE RENT_NUM = 1002 AND VID_NUM IN (59237);
UPDATE DETAILRENTAL
SET DETAIL_RETURNDATE = DETAIL_RETURNDATE + INTERVAL '16H'
		WHERE RENT_NUM = 1003;
UPDATE DETAILRENTAL
SET DETAIL_RETURNDATE = DETAIL_RETURNDATE + INTERVAL '9H'
		WHERE RENT_NUM = 1004;
UPDATE DETAILRENTAL
SET DETAIL_RETURNDATE = DETAIL_RETURNDATE + INTERVAL '12H30M'
		WHERE RENT_NUM = 1005;
UPDATE DETAILRENTAL
SET DETAIL_RETURNDATE = DETAIL_RETURNDATE + INTERVAL '22H15M'
		WHERE RENT_NUM = 1006 AND VID_NUM IN (34366);
UPDATE DETAILRENTAL
SET DETAIL_RETURNDATE = DETAIL_RETURNDATE + INTERVAL '21H30M'
		WHERE RENT_NUM = 1008;

ALTER TABLE VIDEO
ADD COLUMN VID_STATUS VARCHAR(4) CHECK (VID_STATUS IN ('IN', 'OUT', 'LOST')) DEFAULT 'IN';

ALTER TABLE PRICE
ADD COLUMN PRICE_RENTDAYS NUMERIC(2,0) NOT NULL DEFAULT 3;