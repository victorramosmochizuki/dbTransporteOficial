CREATE DATABASE dbTRANSPORTE_Oficial

USE dbTRANSPORTE_Oficial;

CREATE TABLE UBIGEO
(
	CODUBI CHAR (6),
    NOMDEPA VARCHAR(50),
    NOMPROV VARCHAR (50),
    NOMDIST VARCHAR (50),
    CONSTRAINT CODUBI_PK PRIMARY KEY (CODUBI)
);

CREATE TABLE CLIENTE
(
	CODCLI CHAR(3),
    NOMCLI VARCHAR (50),
    APECLI VARCHAR (50),
    DNICLI CHAR (8),
    CORCLI VARCHAR (50),
    CELCLI CHAR (9),
    CODUBI CHAR (6),
    CONSTRAINT CODCLI_PK PRIMARY KEY (CODCLI)
);

CREATE TABLE MARCA
(
	CODMAR CHAR(3),
    NOMMAR VARCHAR (45),
    MODMAR VARCHAR (50),
    CONSTRAINT CODMAR_PK PRIMARY KEY (CODMAR) 
);

CREATE TABLE BUS
(
	CODBUS CHAR (3),
    CANTASI CHAR (2),
    CODMAR CHAR (3),
    CONSTRAINT CODBUS_PK PRIMARY KEY (CODBUS) 
);

CREATE TABLE PUESTO
(
	CODPUES CHAR (3),
    NOMPUES VARCHAR (60),
    AREPUES VARCHAR (50),
    CONSTRAINT CODPUES_PK PRIMARY KEY (CODPUES)
);

CREATE TABLE VENDEDOR
(
	CODVEN CHAR (3),
    NOMVEN VARCHAR (50),
    APEVEN VARCHAR (50),
    DNIVEN CHAR (8),
    CELVEN CHAR(9),
    SUEVEN INT,
    CODUBI CHAR (6),
    CODPUES CHAR (3),
    CONSTRAINT CODVEN_PK PRIMARY KEY (CODVEN)
);


CREATE TABLE BOLETA 
(
	CODBOL CHAR (7),
    FECBOL DATE,
	CODCLI CHAR (3),
    CODVEN CHAR (3),
    PREBOL INT,
    NUMASI char (2),
    CODDES CHAR (3),
    CONSTRAINT CODBOL_PK PRIMARY KEY (CODBOL)
);

CREATE TABLE DESTINO
(
	CODDES CHAR (3),
    NOMSAL VARCHAR(50),
	NOMLLE VARCHAR (50),
    CONSTRAINT CODDES_PK PRIMARY KEY (CODDES)
);

CREATE TABLE CONDUCTOR
(
	CODCON CHAR (3),
    NOMCON VARCHAR(50),
	APECON VARCHAR (50),
    DNICON CHAR (8),
    CELCON CHAR (9),
    CODUBI CHAR (6),
    CODPUES CHAR (3),
    SUECON INT,
    CONSTRAINT CODCON_PK PRIMARY KEY (CODCON)
);

CREATE TABLE DETALLE_BUS 
(
	CODDETBUS int,
	CODCON char (3),
    CODBUS CHAR (7),
    CONSTRAINT CODDETBUS_PK PRIMARY KEY (CODDETBUS)
);


-- Creando mis relaciones

ALTER TABLE CLIENTE
ADD CONSTRAINT UBIGEO_CLIENTE_CODUBI
FOREIGN KEY (CODUBI) REFERENCES UBIGEO (CODUBI);

ALTER TABLE VENDEDOR
ADD CONSTRAINT UBIGEO_VENDEDOR_CODUBI
FOREIGN KEY (CODUBI) REFERENCES UBIGEO (CODUBI);

ALTER TABLE BUS
ADD CONSTRAINT MARCA_BUS_CODMAR
FOREIGN KEY (CODMAR) REFERENCES MARCA (CODMAR);

ALTER TABLE VENDEDOR
ADD CONSTRAINT PUESTO_VENDEDOR_CODPUES
FOREIGN KEY (CODPUES) REFERENCES PUESTO (CODPUES);

ALTER TABLE BOLETA
ADD CONSTRAINT CLIENTE_BOLETA_CODCLI
FOREIGN KEY (CODCLI) REFERENCES CLIENTE (CODCLI);

ALTER TABLE BOLETA
ADD CONSTRAINT VENDEDOR_BOLETA_CODVEN
FOREIGN KEY (CODVEN) REFERENCES VENDEDOR (CODVEN);

ALTER TABLE DETALLE_BUS
ADD CONSTRAINT BUS_DETALLE_BUS_CODBUS
FOREIGN KEY (CODBUS) REFERENCES BUS (CODBUS);

ALTER TABLE CONDUCTOR
ADD CONSTRAINT UBIGEO_CONDUCTOR_CODUBI
FOREIGN KEY (CODUBI) REFERENCES UBIGEO (CODUBI);

ALTER TABLE CONDUCTOR
ADD CONSTRAINT PUESTO_CONDUCTOR_CODPUES
FOREIGN KEY (CODPUES) REFERENCES PUESTO (CODPUES);

ALTER TABLE DETALLE_BUS
ADD CONSTRAINT CONDUCTOR_DETALLE_BUS_CODCON
FOREIGN KEY (CODCON) REFERENCES CONDUCTOR (CODCON);

ALTER TABLE BOLETA
ADD CONSTRAINT DESTINO_BOLETA_CODDES
FOREIGN KEY (CODDES) REFERENCES DESTINO (CODDES);

-- Añadiendo Registros

INSERT INTO UBIGEO
	(CODUBI,NOMDEPA,NOMPROV,NOMDIST)
VALUES
	("140406","Lima","Cañete","Imperial"),
	("100301","Ica","Nazca","Nazca"),
    ("100401","Ica","Pisco","Pisco"),
    ("100101","ica","Ica","Ica"),
    ("100201","Ica","Chincha","Chincha alta"),
    ("100203","Ica","Chincha","Chincha baja"),
    ("140458","Lima","Cañete","San Vicente"),
	("150801","Lima","Cañete","Cerro azul"),
    ("180451","Lima","Cañete","QUILMANA"),
    ("109181","Lima","Cañete","SAN LUIS");
    
INSERT INTO CLIENTE
	(CODCLI, NOMCLI, APECLI, DNICLI, CORCLI, CELCLI, CODUBI)
VALUES
	("001", "Alex", "Ferro", "56463827", "Alex34@hotmail.com", "944648376","140406"),
    ("002", "Esteban", "Lopez","49583849", "Esteblo@hotmail.com", "948362852","100301"),
    ("003", "Luciano", "Espinoza","87968594", "Luka@gmail.com", "954246865","100101"),
    ("004", "Mia", "Rodriguez","48526498", "Mi2000@hotmail.com", "943758493","100401"),
    ("005", "Fernanda", "Guerra", "85868584", "FEGUERRA12@gmail.com", "936475847","100203"),
    ("006", "Jhordan", "Kelvin", "83655743", "KELVINJUNIOR1@gmail.com", "948356484","100201"),
    ("007", "Juan", "Perez", "56463827", "Juancito45@hotmail.com", "948954225","150801"),
    ("008", "Miguel", "Casas","49583849", "Miguelito45@hotmail.com", "975684267","140458"),
    ("009", "Jaime", "Gonsalez","87968594", "Jaimito98@gmail.com", "936485175","109181"),
    ("010", "Luis", "Canales","48526498", "Luis21@hotmail.com", "945478227","180451");

INSERT INTO MARCA
	(CODMAR, NOMMAR, MODMAR)
VALUES
	("M01", "Mercedes - Benz", "GLA"),
    ("M02", "Hyundai", "Venue"),
	("M03", "Volvo", "V40"),
    ("M04", "Toyota", "Auris"),
    ("M05", "Hyundai", "Bayon"),
	("M06", "Volkswagen", "Golf"),
    ("M07", "Hyundai", "Nexo"),
    ("M08", "Hyundai", "Genesis"),
	("M09", "Toyota", "Hilux"),
    ("M10", "Hyundai", "Kona");

INSERT INTO BUS
	(CODBUS, CANTASI, CODMAR)
VALUES
	("B01", "35", "M01"),
    ("B02", "33", "M03"),
    ("B03", "27", "M02"),
    ("B04", "34", "M07"),
    ("B05", "38", "M04"),
    ("B06", "35", "M05"),
    ("B07", "40", "M06"),
    ("B08", "25", "M09"),
    ("B09", "15", "M10"),
    ("B10", "30", "M08");

INSERT INTO PUESTO
	(CODPUES, NOMPUES)
VALUES
	("P01", "Administracion"),
    ("P02", "Ventanilla"),
    ("P03", "Limpieza"),
    ("P04", "Cajero"),
    ("P05", "Seguridad"),
    ("P06", "Administracion de baños"),
    ("P07", "Ayudantes"),
    ("P08", "Guias"),
    ("P09", "Atencion en el Quiosco"),
    ("P10", "Gerencia");
    
INSERT INTO VENDEDOR
	(CODVEN, NOMVEN, APEVEN, DNIVEN, CELVEN, SUEVEN, CODUBI, CODPUES)
VALUES
	("E01", "Enrique", "Canales", "44774274", "987473878", "1800", "100201", "P02"),
    ("E02", "Laura", "Valdez", "74351685", "949647324", "2500", "100101", "P01"),
    ("E03", "Lucas", "Rodriguez", "67845452", "983473847", "1150", "100203", "P03"),
    ("E04", "Mariano", "Torres", "83436758", "946762346", "1300", "100401", "P04"),
    ("E05", "Mariela", "Cardenas", "94457487", "948473820", "1050", "100301", "P08"),
	("E06", "Nayelhi", "Caceres", "74738674", "969473807", "1800", "150801", "P05"),
    ("E07", "Lesly", "De la Cruz", "84734594", "947947364", "1100", "140406", "P07"),
    ("E08", "Milagros", "Navarro", "62237594", "987973847", "1300", "100203", "P09"),
    ("E09", "Jose", "Ramirez", "43436588", "947162946", "1080", "180451", "P06"),
    ("E10", "Julissa", "Marquez", "76452687", "966742820", "2800", "109181", "P10");
    
INSERT INTO DESTINO
	(CODDES, NOMSAL, NOMLLE)
VALUES
	("001", "Cañete", "Chincha"),
    ("002", "Lima", "Pisco"),
    ("003", "Cañete", "Ica"),
    ("004", "Lima", "Cañete"),
    ("005", "Lima", "CHINCHA"),
    ("006", "Cañete", "Pisco"),
    ("007", "Chincha", "Ica"),
    ("008", "Cañete", "Nazca"),
    ("009", "Pisco", "Ica"),
    ("010", "Lima", "Ica");
    
INSERT INTO BOLETA
	(CODBOL, FECBOL, CODCLI, CODVEN, PREBOL, NUMASI, CODDES)
VALUES
	("0000001", '20-12-22', "001", "E01", "8", "8", "009"),
	("0000002", '20-12-22', "002", "E08", "20", "7", "007"),
    ("0000003", '20-12-23', "003", "E04", "15", "3", "001"),
    ("0000004", '20-12-25', "004", "E01", "15", "4", "010"),
    ("0000005", '20-12-26', "005", "E09", "18", "5", "002"),
    ("0000006", '20-12-28', "006", "E01", "12", "6", "004"),
    ("0000007", '21-01-09', "007", "E08", "20", "15", "005"),
	("0000008", '21-01-14', "008", "E04", "8", "18", "003"),
    ("0000009", '21-01-10', "009", "E09", "8", "24", "008"),
    ("0000010", '21-01-12', "010", "E01", "25", "16", "006");
    

INSERT INTO CONDUCTOR
	(CODCON, NOMCON, APECON, DNICON, CELCON, CODUBI, CODPUES, SUECON)
VALUES
	("001", "Francisco", "De la Cruz", "56463827", "954858924","140406", "P06", "3200"),
    ("002", "Pablo", "Campos", "76575849", "964852347", "100301", "P06", "3500"),
    ("003", "Mario", "Espinoza","75462853", "965751295", "100101", "P06", "3800"),
    ("004", "Jesus", "Rodriguez", "74268445", "964831956", "100401", "P06", "4100"),
    ("005", "Fernando", "Guerra", "69851525", "967814865", "100203", "P06", "2800"),
    ("006", "Miguel", "Kelvin", "45622178", "955642255", "100201", "P06", "3400"),
    ("007", "Juan", "Canales", "95485324", "965758495", "150801", "P06", "3650"),
    ("008", "Carlos", "Guerra","45213878", "985452169", "140458", "P06", "3950"),
    ("009", "Jaime", "Gonsalez", "96478261", "965748521", "109181", "P06", "2950"),
    ("010", "Luis", "Canales", "48526498", "945546572", "180451", "P06", "3300");
    

INSERT INTO DETALLE_BUS
	(CODDETBUS, CODCON, CODBUS)
VALUES
	("01", "001", "B08"),
	("02", "007", "B05"),
    ("03", "003", "B03"),
    ("04", "004", "B07"),
    ("05", "009", "B06"),
    ("06", "002", "B09"),
    ("07", "006", "B02"),
	("08", "008", "B04"),
    ("09", "010", "B01"),
    ("10", "005", "B10");
