CREATE TABLE CUSTOMER (
CUS_CODE NUMERIC(5,0) PRIMARY KEY,
CUS_LNAME VARCHAR(25) NOT NULL,
CUS_FNAME VARCHAR(25) NOT NULL,
CUS_INITIAL CHAR(1),
CUS_AREACODE CHAR(3),
CUS_PHONE CHAR(8),
CUS_BALANCE NUMERIC(15,2) DEFAULT 0.00
);

CREATE TABLE VENDOR (
V_CODE NUMERIC(5,0) PRIMARY KEY,
V_NAME VARCHAR(30) NOT NULL,
V_CONTACT VARCHAR(25) NOT NULL,
V_AREACODE CHAR(3),
V_PHONE CHAR(8),
V_STATE CHAR(2),
V_ORDER CHAR(1)
);

CREATE TABLE PRODUCT (
P_CODE VARCHAR(10) PRIMARY KEY,
P_DESCRIPT VARCHAR(50) NOT NULL,
P_INDATE DATE,
P_QOH NUMERIC(6,0) DEFAULT 0,
P_MIN NUMERIC(6,0) DEFAULT 0,
P_PRICE NUMERIC(15,2) DEFAULT 0.00,
P_DISCOUNT NUMERIC(4,2),
V_CODE NUMERIC(5,0) REFERENCES VENDOR (V_CODE),
CONSTRAINT positive_qoh CHECK (P_QOH >= 0)
);

CREATE TABLE INVOICE (
INV_NUMBER NUMERIC(4,0) PRIMARY KEY,
CUS_CODE NUMERIC(5,0) REFERENCES CUSTOMER (CUS_CODE),
INV_DATE DATE NOT NULL,
INV_SUBTOTAL NUMERIC(8,2) DEFAULT 0.00,
INV_TAX NUMERIC(6,2) GENERATED ALWAYS AS (INV_SUBTOTAL * 0.08) STORED,
INV_TOTAL NUMERIC(9,2) GENERATED ALWAYS AS (INV_SUBTOTAL * 1.08) STORED
);

CREATE TABLE LINE (
INV_NUMBER NUMERIC(4,0) REFERENCES INVOICE (INV_NUMBER),
LINE_NUMBER NUMERIC(5,0) NOT NULL,
P_CODE VARCHAR(10) REFERENCES PRODUCT (P_CODE),
LINE_UNITS NUMERIC(5,0) NOT NULL,
LINE_PRICE NUMERIC(6,2) NOT NULL,
LINE_TOTAL NUMERIC(9,2) GENERATED ALWAYS AS (LINE_UNITS * LINE_PRICE) STORED,
PRIMARY KEY (INV_NUMBER, LINE_NUMBER)
);

INSERT INTO CUSTOMER VALUES(10010,'Ramas'   ,'Alfred','A' ,'615','844-2573',0);
INSERT INTO CUSTOMER VALUES(10011,'Dunne'   ,'Leona' ,'K' ,'713','894-1238',0);
INSERT INTO CUSTOMER VALUES(10012,'Smith'   ,'Kathy' ,'W' ,'615','894-2285',345.86);
INSERT INTO CUSTOMER VALUES(10013,'Olowski' ,'Paul'  ,'F' ,'615','894-2180',536.75);
INSERT INTO CUSTOMER VALUES(10014,'Orlando' ,'Myron' ,NULL,'615','222-1672',0);
INSERT INTO CUSTOMER VALUES(10015,'O''Brian','Amy'   ,'B' ,'713','442-3381',0);
INSERT INTO CUSTOMER VALUES(10016,'Brown'   ,'James' ,'G' ,'615','297-1228',221.19);
INSERT INTO CUSTOMER VALUES(10017,'Williams','George',NULL,'615','290-2556',768.93);
INSERT INTO CUSTOMER VALUES(10018,'Farriss' ,'Anne'  ,'G' ,'713','382-7185',216.55);
INSERT INTO CUSTOMER VALUES(10019,'Smith'   ,'Olette','K' ,'615','297-3809',0);

INSERT INTO VENDOR VALUES(21225,'Bryson, Inc.'    ,'Smithson','615','223-3234','TN','Y');
INSERT INTO VENDOR VALUES(21226,'SuperLoo, Inc.'  ,'Flushing','904','215-8995','FL','N');
INSERT INTO VENDOR VALUES(21231,'D&E Supply'      ,'Singh'   ,'615','228-3245','TN','Y');
INSERT INTO VENDOR VALUES(21344,'Gomez Bros.'     ,'Ortega'  ,'615','889-2546','KY','N');
INSERT INTO VENDOR VALUES(22567,'Dome Supply'     ,'Smith'   ,'901','678-1419','GA','N');
INSERT INTO VENDOR VALUES(23119,'Randsets Ltd.'   ,'Anderson','901','678-3998','GA','Y');
INSERT INTO VENDOR VALUES(24004,'Brackman Bros.'  ,'Browning','615','228-1410','TN','N');
INSERT INTO VENDOR VALUES(24288,'ORDVA, Inc.'     ,'Hakford' ,'615','898-1234','TN','Y');
INSERT INTO VENDOR VALUES(25443,'B&K, Inc.'       ,'Smith'   ,'904','227-0093','FL','N');
INSERT INTO VENDOR VALUES(25501,'Damal Supplies'  ,'Smythe'  ,'615','890-3529','TN','N');
INSERT INTO VENDOR VALUES(25595,'Rubicon Systems' ,'Orton'   ,'904','456-0092','FL','Y');

INSERT INTO PRODUCT VALUES('11QER/31','Power painter, 15 psi., 3-nozzle'     ,'03-NOV-2017',  8,  5,109.99,0.00,25595);
INSERT INTO PRODUCT VALUES('13-Q2/P2','7.25-in. pwr. saw blade'              ,'13-DEC-2017', 32, 15, 14.99,0.05,21344);
INSERT INTO PRODUCT VALUES('14-Q1/L3','9.00-in. pwr. saw blade'              ,'13-NOV-2017', 18, 12, 17.49,0.00,21344);
INSERT INTO PRODUCT VALUES('1546-QQ2','Hrd. cloth, 1/4-in., 2x50'            ,'15-JAN-2018', 15,  8, 39.95,0.00,23119);
INSERT INTO PRODUCT VALUES('1558-QW1','Hrd. cloth, 1/2-in., 3x50'            ,'15-JAN-2018', 23,  5, 43.99,0.00,23119);
INSERT INTO PRODUCT VALUES('2232/QTY','B&D jigsaw, 12-in. blade'             ,'30-DEC-2017',  8,  5,109.92,0.05,24288);
INSERT INTO PRODUCT VALUES('2232/QWE','B&D jigsaw, 8-in. blade'              ,'24-DEC-2017',  6,  5, 99.87,0.05,24288);
INSERT INTO PRODUCT VALUES('2238/QPD','B&D cordless drill, 1/2-in.'          ,'20-JAN-2018', 12,  5, 38.95,0.05,25595);
INSERT INTO PRODUCT VALUES('23109-HB','Claw hammer'                          ,'20-JAN-2018', 23, 10,  9.95,0.10,21225);
INSERT INTO PRODUCT VALUES('23114-AA','Sledge hammer, 12 lb.'                ,'02-JAN-2018',  8,  5, 14.40,0.05,NULL );
INSERT INTO PRODUCT VALUES('54778-2T','Rat-tail file, 1/8-in. fine'          ,'15-DEC-2017', 43, 20,  4.99,0.00,21344);
INSERT INTO PRODUCT VALUES('89-WRE-Q','Hicut chain saw, 16 in.'              ,'07-FEB-2018', 11,  5,256.99,0.05,24288);
INSERT INTO PRODUCT VALUES('PVC23DRT','PVC pipe, 3.5-in., 8-ft'              ,'20-FEB-2018',188, 75,  5.87,0.00,NULL );
INSERT INTO PRODUCT VALUES('SM-18277','1.25-in. metal screw, 25'             ,'01-MAR-2018',172, 75,  6.99,0.00,21225);
INSERT INTO PRODUCT VALUES('SW-23116','2.5-in. wd. screw, 50'                ,'24-FEB-2018',237,100,  8.45,0.00,21231);
INSERT INTO PRODUCT VALUES('WR3/TT3' ,'Steel matting, 4''x8''x1/6", .5" mesh','17-JAN-2018', 18,  5,119.95,0.10,25595);

INSERT INTO INVOICE VALUES(1001,10014,'16-JAN-2018');
INSERT INTO INVOICE VALUES(1002,10011,'16-JAN-2018');
INSERT INTO INVOICE VALUES(1003,10012,'16-JAN-2018');
INSERT INTO INVOICE VALUES(1004,10011,'17-JAN-2018');
INSERT INTO INVOICE VALUES(1005,10018,'17-JAN-2018');
INSERT INTO INVOICE VALUES(1006,10014,'17-JAN-2018');
INSERT INTO INVOICE VALUES(1007,10015,'17-JAN-2018');
INSERT INTO INVOICE VALUES(1008,10011,'17-JAN-2018');

CREATE VIEW view_INV_SUBTOTAL
AS 
SELECT INV_NUMBER, SUM(LINE_TOTAL) AS INV_SUBT
	FROM LINE
	GROUP BY INV_NUMBER;

CREATE OR REPLACE FUNCTION trigger_func_update_INV_SUBTOTAL()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
AS $$
BEGIN
	UPDATE INVOICE
	SET INV_SUBTOTAL = INV_SUBT
	FROM view_INV_SUBTOTAL
	WHERE INVOICE.INV_NUMBER = view_INV_SUBTOTAL.INV_NUMBER;
	RAISE NOTICE 'trg_update_INV_SUBTOTAL was triggered';
	RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER trg_update_INV_SUBTOTAL
AFTER INSERT OR UPDATE ON LINE
FOR EACH ROW
EXECUTE PROCEDURE trigger_func_update_INV_SUBTOTAL();

INSERT INTO LINE VALUES(1001,1,'13-Q2/P2',1,14.99);
INSERT INTO LINE VALUES(1001,2,'23109-HB',1,9.95);
INSERT INTO LINE VALUES(1002,1,'54778-2T',2,4.99);
INSERT INTO LINE VALUES(1003,1,'2238/QPD',1,38.95);
INSERT INTO LINE VALUES(1003,2,'1546-QQ2',1,39.95);
INSERT INTO LINE VALUES(1003,3,'13-Q2/P2',5,14.99);
INSERT INTO LINE VALUES(1004,1,'54778-2T',3,4.99);
INSERT INTO LINE VALUES(1004,2,'23109-HB',2,9.95);
INSERT INTO LINE VALUES(1005,1,'PVC23DRT',12,5.87);
INSERT INTO LINE VALUES(1006,1,'SM-18277',3,6.99);
INSERT INTO LINE VALUES(1006,2,'2232/QTY',1,109.92);
INSERT INTO LINE VALUES(1006,3,'23109-HB',1,9.95);
INSERT INTO LINE VALUES(1006,4,'89-WRE-Q',1,256.99);
INSERT INTO LINE VALUES(1007,1,'13-Q2/P2',2,14.99);
INSERT INTO LINE VALUES(1007,2,'54778-2T',1,4.99);
INSERT INTO LINE VALUES(1008,1,'PVC23DRT',5,5.87);
INSERT INTO LINE VALUES(1008,2,'WR3/TT3',3,119.95);
INSERT INTO LINE VALUES(1008,3,'23109-HB',1,9.95);

CREATE TABLE LINEZ (
INV_NUMBER NUMERIC(4,0) REFERENCES INVOICE (INV_NUMBER),
LINE_NUMBER NUMERIC(5,0) NOT NULL,
P_CODE VARCHAR(10) REFERENCES PRODUCT (P_CODE),
LINE_UNITS NUMERIC(5,0) NOT NULL,
LINE_PRICE NUMERIC(6,2) NOT NULL,
LINE_TOTAL NUMERIC(9,2),
PRIMARY KEY (INV_NUMBER, LINE_NUMBER)
);

INSERT INTO LINEZ SELECT INV_NUMBER, LINE_NUMBER, P_CODE, LINE_UNITS, LINE_PRICE FROM LINE;

CREATE TABLE INVOICEZ (
INV_NUMBER NUMERIC(4,0) PRIMARY KEY,
CUS_CODE NUMERIC(5,0) REFERENCES CUSTOMER (CUS_CODE),
INV_DATE DATE NOT NULL,
INV_SUBTOTAL NUMERIC(8,2) DEFAULT 0.00,
INV_TAX NUMERIC(6,2),
INV_TOTAL NUMERIC(9,2)
);

INSERT INTO INVOICEZ SELECT * FROM INVOICE;
