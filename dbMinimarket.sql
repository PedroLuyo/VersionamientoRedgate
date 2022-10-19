		Use master;
		DROP DATABASE IF EXISTS dbMinimarket ;

CREATE DATABASE dbMinimarket
GO

USE dbMinimarket
GO


--Creamos la tabla VENTA_DETALLE
DROP TABLE IF EXISTS VENTA_DETALLE ;
CREATE TABLE VENTA_DETALLE
(
	IDVENTDET int IDENTITY (1,1),
	IDVENT int,
	CODPRO char(6),
	CANTVENTDET INT
	CONSTRAINT IDVENTDET_PK PRIMARY KEY (IDVENTDET)
)
GO

--Creamos la tabla VENTA
	DROP TABLE IF EXISTS VENTA ;
CREATE TABLE VENTA
(
	IDVENT int IDENTITY (1,1),
	FECVENT date,
	CODVEND char(6),
	CODCLI char(6),
	TIPVENT CHAR(1)
	CONSTRAINT IDVENT_PK PRIMARY KEY (IDVENT)
)
GO

--Creamos la tabla CLIENTE
DROP TABLE IF EXISTS CLIENTE ;
CREATE TABLE CLIENTE
(
	CODCLI char(6),
	DNICLI char(8),
	NOMCLI varchar(40),
	APECLI varchar(80),
	CELCLI char(9),
	EMACLI varchar(50),
	FECNACCLI date,
	UBICLI char(6)
	CONSTRAINT CODCLI_PK PRIMARY KEY (CODCLI)
)
GO

--Creamos la tabla PRODUCTO
DROP TABLE IF EXISTS PRODUCTO ;
CREATE TABLE PRODUCTO
(
	CODPRO char(6),
	NOMPRO varchar(50),
	PREPRO decimal(8,2),
	STOCKPRO int
	CONSTRAINT CODPRO_PK PRIMARY KEY (CODPRO)
)
GO

--Creamos la tabla VENDEDOR
DROP TABLE IF EXISTS VENDEDOR ;
CREATE TABLE VENDEDOR
(
	CODVEND char(6),
	NOMVEND varchar(50),
	APEVEND varchar(80),
	DNIVEND char(8),
	CELVEND char(9),
	DOMVEND varchar(80),
	UBIVEND char(6)
	CONSTRAINT CODVEND_PK PRIMARY KEY (CODVEND)
)
GO

--Creamos la tabla UBIGEO
	DROP TABLE IF EXISTS UBIGEO ;
CREATE TABLE UBIGEO
(
	CODUBI char(6),
	DEPUBI varchar(80),
	PROVUBI varchar(80),
	DISTUBI varchar(80)
	CONSTRAINT CODUBI_PK PRIMARY KEY (CODUBI)
)
GO

--Relaciones

ALTER TABLE CLIENTE
	ADD CONSTRAINT CLIENTE_UBIGEO FOREIGN KEY (UBICLI) REFERENCES UBIGEO (CODUBI)
GO

ALTER TABLE VENDEDOR
	ADD CONSTRAINT VENDEDOR_UBIGEO FOREIGN KEY (UBIVEND) REFERENCES UBIGEO (CODUBI)
GO

ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY (CODCLI) REFERENCES CLIENTE (CODCLI)
GO

ALTER TABLE VENTA
	ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY (CODVEND) REFERENCES VENDEDOR (CODVEND)
GO

ALTER TABLE VENTA_DETALLE
	ADD CONSTRAINT VENTA_DETALLE_PRODUCTO FOREIGN KEY (CODPRO) REFERENCES PRODUCTO (CODPRO)
GO

ALTER TABLE VENTA_DETALLE
	ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY (IDVENT) REFERENCES VENTA (IDVENT)
GO


SELECT 
	fk.name [Constraint],
    OBJECT_NAME(fk.parent_object_id) [Tabla],
    COL_NAME(fc.parent_object_id,fc.parent_column_id) [Columna],
    OBJECT_NAME (fk.referenced_object_id) AS [Tabla base],
    COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS [Columna de tabla base (PK)]
FROM 
	sys.foreign_keys fk
	INNER JOIN sys.foreign_key_columns fc ON (fk.OBJECT_ID = fc.constraint_object_id)
GO


INSERT INTO UBIGEO
(CODUBI, DEPUBI, PROVUBI, DISTUBI)
VALUES
('140401', 'Lima', 'Cañete', 'San Vicente de Cañete'),
('140402', 'Lima', 'Cañete', 'Calango'),
('140403', 'Lima', 'Cañete', 'Cerro Azul'),
('140404', 'Lima', 'Cañete', 'Coayllo'),
('140405', 'Lima', 'Cañete', 'Chilca'),
('140406', 'Lima', 'Cañete', 'Imperial'),
('140407', 'Lima', 'Cañete', 'Lunahuaná'),
('140408', 'Lima', 'Cañete', 'Mala'),
('140409', 'Lima', 'Cañete', 'Nuevo Imperial'),
('140410', 'Lima', 'Cañete', 'Pacarán'),
('140411', 'Lima', 'Cañete', 'Quilmaná'),
('140412', 'Lima', 'Cañete', 'San Antonio'),
('140413', 'Lima', 'Cañete', 'San Luis'),
('140414', 'Lima', 'Cañete', 'Santa Cruz de Flores'),
('140415', 'Lima', 'Cañete', 'Zúñiga'),
('140416', 'Lima', 'Cañete', 'Asia')
GO

SELECT * FROM UBIGEO
GO

SET DATEFORMAT dmy;

INSERT INTO CLIENTE
(CODCLI, DNICLI, NOMCLI, APECLI, CELCLI, EMACLI, FECNACCLI, UBICLI)
VALUES
('C00001','45781233','Alicia','García Campos','929185236','agarcia@gmail.com','01/01/1977','140409'),
('C00002','15487922','Juana','Ávila Chumpitaz','923568741','javila@gmail.com','15/07/1980','140402'),
('C00003','15253588','Oscar','Coronado Vásquez','932615478','ocoronado@gmail.com','12/06/1975','140403'),
('C00004','85213566','Luis','Barrios Palomino','932817645','lbarrios@outlook.com','24/03/1981','140409'),
('C00005','15482566','María','Tarazona Mendoza','978400123','mtarazona@outlook.com','16/08/1975','140407'),
('C00006','15428211','Pedro','Sánchez Dávila','941533268','psanchez@yahoo.com','10/09/1970','140402'),
('C00007','47129533','Aldo','Torres Zavala','958866221','atorres@yahoo.com','20/02/1980','140405'),
('C00008','48171533','Fiorella','Monteza Alzamora','992255441','fmonteza@gmail.com','30/04/1979','140408'),
('C00009','15429866','Gloria','Linares Rodríguez','954415950','glinares@hotmail.com','23/09/1981','140403'),
('C00010','85251592','Esperanza','Stark Parker','901133258','estark@yahoo.com','24/10/1978','140405')
GO

SELECT * FROM CLIENTE
GO

INSERT INTO VENDEDOR
(CODVEND, NOMVEND, APEVEND, DNIVEND, CELVEND, DOMVEND, UBIVEND)
VALUES
('V00001','Alberto','Solano Pariona','77889955','99845632','Av. Miraflores','140405'),
('V00002','Ana','Enriquez Flores','22116633','978848551','Calle Los Libertadores','140407'),
('V00003','Carolina','Rojas Urrutia','66771144','916431258','Jr. José Olaya','140402')
GO

INSERT INTO PRODUCTO
(CODPRO, NOMPRO, PREPRO, STOCKPRO)
VALUES
('P00001', 'Arroz', 4.50, 50),
('P00002', 'Azúcar', 3.50, 60),
('P00003', 'Fideos', 2.80, 50),
('P00004', 'Leche', 5.20, 90),
('P00005', 'Yogurt', 7.50, 30),
('P00006', 'Café', 2.00, 25),
('P00007', 'Aceite', 7.50, 90),
('P00008', 'Harina', 3.30, 45),
('P00009', 'Atún', 6.00, 35),
('P00010', 'Frejoles', 4.70, 40)
GO

SELECT * FROM PRODUCTO
GO

SET DATEFORMAT dmy
GO

INSERT INTO VENTA
(FECVENT, CODVEND, CODCLI, TIPVENT)
VALUES
('01/12/2021','V00002','C00001','D')
GO