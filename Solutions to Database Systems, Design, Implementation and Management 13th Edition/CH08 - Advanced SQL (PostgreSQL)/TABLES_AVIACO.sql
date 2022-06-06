CREATE TABLE EMPLOYEE (
EMP_NUM NUMERIC(3,0) PRIMARY KEY,
EMP_TITLE VARCHAR(5),
EMP_LNAME VARCHAR(25) NOT NULL,
EMP_FNAME VARCHAR(25) NOT NULL,
EMP_INITIAL CHAR(1),
EMP_DOB DATE NOT NULL,
EMP_HIRE_DATE DATE NOT NULL
);

CREATE TABLE CUSTOMER (
CUS_CODE NUMERIC(5,0) PRIMARY KEY,
CUS_LNAME VARCHAR(25) NOT NULL,
CUS_FNAME VARCHAR(25) NOT NULL,
CUS_INITIAL CHAR(1),
CUS_AREACODE CHAR(3),
CUS_PHONE VARCHAR(10),
CUS_BALANCE NUMERIC(11,2) DEFAULT 0.00
);

CREATE TABLE RATING (
RTG_CODE VARCHAR(7) PRIMARY KEY,
RTG_NAME VARCHAR(50) NOT NULL
);

CREATE TABLE MODEL (
MOD_CODE VARCHAR(10) PRIMARY KEY,
MOD_MANUFACTURER VARCHAR(35) NOT NULL,
MOD_NAME VARCHAR(25) NOT NULL,
MOD_SEATS NUMERIC(3,0) NOT NULL,
MOD_CHG_MILE NUMERIC(5,2) NOT NULL
);

CREATE TABLE PILOT (
EMP_NUM NUMERIC(3,0) REFERENCES EMPLOYEE (EMP_NUM),
PL_LICENSE VARCHAR(4),
PL_RATINGS VARCHAR(50),
PL_MED_TYPE NUMERIC(1,0),
PL_MED_DATE DATE,
PL_PT135_DATE DATE
);

CREATE TABLE AIRCRAFT (
AC_NUMBER VARCHAR(7) PRIMARY KEY,
MOD_CODE VARCHAR(10) REFERENCES MODEL (MOD_CODE),
AC_TTAF NUMERIC(9,1) NOT NULL,
AC_TTEL NUMERIC(9,1) NOT NULL,
AC_TTER NUMERIC(9,1) NOT NULL
);

CREATE TABLE EARNEDRATING (
EMP_NUM NUMERIC(3,0) REFERENCES EMPLOYEE (EMP_NUM),
RTG_CODE VARCHAR(7) REFERENCES RATING (RTG_CODE),
EARNRTG_DATE DATE NOT NULL,
PRIMARY KEY (EMP_NUM, RTG_CODE)
);

CREATE TABLE CHARTER (
CHAR_TRIP NUMERIC(5,0) PRIMARY KEY,
CHAR_DATE DATE NOT NULL,
AC_NUMBER VARCHAR(7) REFERENCES AIRCRAFT (AC_NUMBER),
CHAR_DESTINATION CHAR(3) NOT NULL,
CHAR_DISTANCE NUMERIC(6,0) NOT NULL,
CHAR_HOURS_FLOWN NUMERIC(3,1),
CHAR_HOURS_WAIT NUMERIC(3,1),
CHAR_FUEL_GALLONS NUMERIC(6,1),
CHAR_OIL_QTS NUMERIC(1,0),
CUS_CODE NUMERIC(5,0) REFERENCES CUSTOMER (CUS_CODE)
);

CREATE TABLE CREW (
CHAR_TRIP NUMERIC(5,0) REFERENCES CHARTER (CHAR_TRIP),
EMP_NUM NUMERIC(3,0)  REFERENCES EMPLOYEE (EMP_NUM),
CREW_JOB VARCHAR(25) NOT NULL,
PRIMARY KEY (CHAR_TRIP, EMP_NUM)
);

INSERT INTO EMPLOYEE VALUES
  (100,	'Mr.',	'Kolmycz',		'George',	'D',	'1945-6-15',	'1985-3-15'),
  (101,	'Ms.',	'Lewis',		'Rhonda',	'G',	'1965-3-19',	'1986-4-25'),
  (102,	'Mr.',	'VanDam',		'Rhett',	'',		'1958-11-14',	'1990-12-20'),
  (103,	'Ms.',	'Jones',		'Anne',		'M',	'1974-10-16',	'1994-8-28'),
  (104,	'Mr.',	'Lange',		'John',		'P',	'1971-11-8',	'1994-10-20'),
  (105,	'Mr.',	'Williams',		'Robert',	'D',	'1975-3-14',	'1998-11-8'),
  (106,	'Mrs.',	'Duzak',		'Jeanine',	'K',	'1968-2-12',	'1989-1-5'),
  (107,	'Mr.',	'Diante',		'Jorge',	'D',	'1974-8-21',	'1994-7-2'),
  (108,	'Mr.',	'Wiesenbach',	'Paul',		'R',	'1966-2-14',	'1992-11-18'),
  (109,	'Mr.',	'Smith',		'George',	'K',	'1961-6-18',	'1989-4-14'),
  (110,	'Mrs.',	'Genkazi',		'Leighla',	'W',	'1970-5-19',	'1990-12-1');

INSERT INTO CUSTOMER VALUES
  (10010, 'Ramas',		'Alfred',	'A',	'615',	'844-2573', 	0),
  (10011, 'Dunne',		'Leona',	'K',	'713',	'894-1238', 	0),
  (10012, 'Smith',		'Kathy',	'W',	'615',	'894-2285', 	896.54),
  (10013, 'Olowski',	'Paul',		'F',	'615',	'894-2180', 	1285.19),
  (10014, 'Orlando',	'Myron',	'',		'615',	'222-1672', 	673.21),
  (10015, 'O''Brian',	'Amy',		'B',	'713',	'442-3381', 	1014.56),
  (10016, 'Brown',		'James',	'G',	'615',	'297-1228', 	0),
  (10017, 'Williams',	'George',	'',		'615',	'290-2556', 	0),
  (10018, 'Farriss',	'Anne',		'G',	'713',	'382-7185', 	0),
  (10019, 'Smith',	'Olette',		'K',	'615',	'297-3809', 	453.98);

 INSERT INTO RATING VALUES
   ('CFI',		'Certified Flight Instructor'),
   ('CFII',		'Certified Flight Instructor, Instrument'),
   ('INSTR',	'Instrument'),
   ('MEL',		'Multiengine Land'),
   ('SEL', 		'Single Engine, Land'),
   ('SES', 		'Single Engine, Sea');

 INSERT INTO MODEL VALUES
   ('C-90A',	'Beechcraft', 	'KingAir', 				8, 	2.67),
   ('PA23-250',	'Piper',		'Aztec', 				6, 	1.93),
   ('PA31-350',	'Piper',		'Navajo Chieftain',		10,	2.35);

 INSERT INTO PILOT VALUES
 	(101, 'ATP', 'ATP/SEL/MEL/INSTR/CFII', 		1, '20-Jan-08', '11-Jan-08'),
 	(104, 'ATP', 'ATP/SEL/MEL/INSTR', 			1, '18-Dec-07', '17-Jan-08'),
 	(105, 'COM', 'COMM/SEL/MEL/INSTR/CFI', 		2, '05-Jan-08', '02-Jan-08'),
 	(106, 'COM', 'COMM/SEL/MEL/INSTR', 			2, '10-Dec-07', '02-Feb-08'),
 	(109, 'COM', 'ATP/SEL/MEL/SES/INSTR/CFII', 	1, '22-Jan-08', '15-Jan-08');

 INSERT INTO AIRCRAFT VALUES
   ('1484P', 'PA23-250', 	1833.1, 	1833.1, 	101.8),
   ('2289L', 'C-90A', 		4243.8, 	768.9, 		1123.4),
   ('2778V', 'PA31-350', 	7992.9, 	1513.1, 	789.5),
   ('4278Y', 'PA31-350', 	2147.3, 	622.1, 		243.2);

 INSERT INTO EARNEDRATING VALUES
   (101, 	'CFI', 		'18-Feb-98'),
   (101, 	'CFII', 	'15_Dec-05'),
   (101, 	'INSTR', 	'08-Nov-93'),
   (101, 	'MEL', 		'23-Jun-94'),
   (101, 	'SEL', 		'21-Apr-93'),
   (104, 	'INSTR', 	'15-Jul-96'),
   (104, 	'MEL', 		'29-Jan-97'),
   (104, 	'SEL', 		'12-Mar-95'),
   (105, 	'CFI', 		'18-Nov-97'),
   (105, 	'INSTR', 	'17-Apr-95'),
   (105, 	'MEL', 		'12-Aug-95'),
   (105, 	'SEL', 		'23-Sep-94'),
   (106, 	'MEL', 		'02-Apr-96'),
   (106, 	'SEL', 		'10-Mar-94'),
   (109, 	'CFI', 		'05-Nov-98'),
   (109, 	'CFII', 	'21-Jun-03'),
   (109, 	'INSTR',	'23-Jul-96'),
   (109, 	'MEL', 		'15-Mar-97'),
   (109, 	'SEL', 		'05-Feb-96'),
   (109, 	'SES', 		'12-Mar-96');

INSERT INTO CHARTER VALUES
 	(10001, '05-Feb-08', '2289L', 'ATL', 936, 	5.1, 	2.2, 	354.1, 	1, 	10011),
 	(10002, '05-Feb-08', '2778V', 'BNA', 320, 	1.6, 	0, 		72.6, 	0, 	10016),
 	(10003, '05-Feb-08', '4278Y', 'GNV', 1574, 	7.8, 	0, 		339.8, 	2, 	10014),
 	(10004, '06-Feb-08', '1484P', 'STL', 472, 	2.9, 	4.9, 	97.2, 	1, 	10019),
 	(10005, '06-Feb-08', '2289L', 'ATL', 1023,	 5.7,	 3.5,	 397.7, 2, 	10011),
 	(10006, '06-Feb-08', '4278Y', 'STL', 472,	 2.6, 	5.2, 	117.1, 	0, 	10017),
 	(10007, '06-Feb-08', '2778V', 'GNV', 1574,	 7.9, 	0, 		348.4, 	2, 	10012),
 	(10008, '07-Feb-08', '1484P', 'TYS', 644,	 4.1,	 0, 	140.6, 	1, 	10014),
 	(10009, '07-Feb-08', '2289L', 'GNV', 1574, 	6.6, 	23.4,	459.9, 	0, 	10017),
 	(10010, '07-Feb-08', '4278Y', 'ATL', 998, 	6.2, 	3.2, 	279.7, 	0 , 10016),
 	(10011, '07-Feb-08', '1484P', 'BNA', 352, 	1.9, 	5.3, 	66.4, 	1, 	10016),
 	(10012, '08-Feb-08', '2778V', 'MOB', 884, 	4.8, 	4.2, 	215.1, 	0, 	10010),
 	(10013, '08-Feb-08', '4278Y', 'TYS', 644, 	3.9, 	4.5, 	174.3, 	1, 	10011),
 	(10014, '09-Feb-08', '4278Y', 'ATL', 936, 	6.1, 	2.1, 	302.6, 	0, 	10017),
 	(10015, '09-Feb-08', '2289L', 'GNV', 1645, 	6.7, 	0, 		459.5, 	2, 	10016),
 	(10016, '09-Feb-08', '2778V', 'MQY', 312, 	1.5, 	0, 		67.2, 	0, 	10011),
 	(10017, '10-Feb-08', '1484P', 'STL', 508, 	3.1, 	0, 		105.5, 	0, 	10014),
 	(10018, '10-Feb-08', '4278Y', 'TYS', 644, 	3.8, 	4.5, 	167.4, 	0, 	10017);

INSERT INTO CREW VALUES
	(10001, 104, 'Pilot'),
	(10002, 101, 'Pilot'),
	(10003, 105, 'Pilot'),
	(10003, 109, 'Copilot'),
	(10004, 106, 'Pilot'),
	(10005, 101, 'Pilot'),
	(10006, 109, 'Pilot'),
	(10007, 104, 'Pilot'),
	(10007, 105, 'Copilot'),
	(10008, 106, 'Pilot'),
	(10009, 105, 'Pilot'),
	(10010, 108, 'Pilot'),
	(10011, 101, 'Pilot'),
	(10011, 104, 'Copilot'),
	(10012, 101, 'Pilot'),
	(10013, 105, 'Pilot'),
	(10014, 106, 'Pilot'),
	(10015, 101, 'Copilot'),
	(10015, 104, 'Pilot'),
	(10016, 105, 'Copilot'),
	(10017, 101, 'Pilot'),
	(10018, 104, 'Copilot'),
	(10018, 105, 'Pilot');
