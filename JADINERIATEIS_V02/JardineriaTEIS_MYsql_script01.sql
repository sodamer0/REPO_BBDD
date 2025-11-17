--	1.-CREAMOS LA TABLA COMPROBANDO QUE NO EXISTE PREMIAMENTE:

CREATE DATABASE IF NOT EXISTS JardineriaTEIS;

--	2.-CON LA CODIFICACIÓN PARA EL CASTELLANO:

	CHARACTER SET			utf32
	COLLATE					utf32_spanish2_ci;

--	3.-INDICAMOS QUE SE VA A A UTILIZAR ESPECÍFICAMENTE ESTA BASE DE DATOS:

USE JardineriaTEIS;


--	4.-ELIMINAMOS POR PRECAUCIÓN, POR SI EXISTIESEN, LAS TABLAS QUE VAMOS A CREAR: 

DROP TABLE IF EXISTS PAGO;
DROP TABLE IF EXISTS DETALLE_PRODUCTO;
DROP TABLE IF EXISTS PRODUCTO;
DROP TABLE IF EXISTS PEDIDO;
DROP TABLE IF EXISTS CLIENTE;
DROP TABLE IF EXISTS GAMA_PRODUCTO;
DROP TABLE IF EXISTS EMPLEADO;
DROP TABLE IF EXISTS OFICINA;

--	5.-CREAMOS LAS TABLAS CON SUS ATRIBUTOS EN BASE AL ENUNCIADO:

CREATE TABLE OFICINA (

	id_oficina				INT,
	ciudad						VARCHAR(30),
	pais							VARCHAR(30),
	region						VARCHAR(30),
	codigo_postal			VARCHAR(10),
	tel_contacto			VARCHAR(30),
	direccion_ofic 		VARCHAR(50)

);

CREATE TABLE EMPLEADO (

	id_empleado				INT,
	nombre_emp				VARCHAR(30),
	apellidos_emp			VARCHAR(30),
	extension					VARCHAR(20),
	email							VARCHAR(30),
	id_oficina 				INT,
	id_jefe						INT,
	puesto						VARCHAR(20)

);

CREATE TABLE GAMA_PRODUCTO (

	id_gama						INT,
	descripcion				VARCHAR(200),
	descripcion_html	VARCHAR(200),
	imagen						VARCHAR(200)

);

CREATE TABLE CLIENTE (

	id_cliente				INT,
	nombre_clie				VARCHAR(20),
	contacto_clie			VARCHAR(20),
	telefono_clie			VARCHAR(20),
	fax_clie					VARCHAR(20),
	direccion_clie		VARCHAR(30),
	ciudad_clie				VARCHAR(20),
	region_clie				VARCHAR(20),
	pais_clie					VARCHAR(20),
	cp_clie						VARCHAR(10),
	id_empleado				INT,
	lim_credito				DECIMAL(10, 2)

);

CREATE TABLE PEDIDO (

	id_pedido					INT,
	id_cliente				INT,
	fecha_pedido			DATE,
	fecha_entrega			DATE,
	fecha_recepcion		DATE,
	estado_pedido			VARCHAR(20),
	comentario				VARCHAR(200)

);

CREATE TABLE PRODUCTO (

	id_producto				INT,
	nombre_producto		VARCHAR(100),
	id_gama						INT,
	proveedor					VARCHAR(30),
	descripcion				VARCHAR(200),
	stock							INT,
	pvp_proveedor			DECIMAL(10, 2),
	precio_venta			DECIMAL(10, 2)

);

CREATE TABLE DETALLE_PRODUCTO (

	id_detalle_producto		INT,
	id_producto						INT,
	id_pedido							INT,
	cantidad							INT,
	pvp_venta 						DECIMAL(10, 2),
	linea_pedido					INT

);

CREATE TABLE PAGO (
	
	id_pago						INT,
	id_cliente				INT,
	cod_transaccion		INT,
	metodo_pago				VARCHAR(10),
	fecha_pago				DATE,
	importe						DECIMAL(10, 2)

);


--	6.-MODIFICAMOS LAS TABLAS PARA CREAR SUS CLAVES PRIMARIAS:

ALTER TABLE OFICINA ADD CONSTRAINT PK_Oficina PRIMARY KEY (id_oficina);

ALTER TABLE EMPLEADO ADD CONSTRAINT PK_Empleado PRIMARY KEY (id_empleado);

ALTER TABLE GAMA_PRODUCTO ADD CONSTRAINT PK_Gama_Producto PRIMARY KEY (id_gama);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_Cliente PRIMARY KEY (id_cliente);

ALTER TABLE PEDIDO ADD CONSTRAINT PK_Pedido PRIMARY KEY (id_pedido);

ALTER TABLE PRODUCTO ADD CONSTRAINT PK_Producto PRIMARY KEY (id_producto);

ALTER TABLE DETALLE_PRODUCTO ADD CONSTRAINT PK_Detalle_Producto PRIMARY KEY (id_detalle_producto);

ALTER TABLE PAGO ADD CONSTRAINT PK_Pago PRIMARY KEY (id_pago);


--	7.-MODIFICAMOS LAS TABLAS PARA CREAR SUS CLAVES FORÁNEAS:

--	FKs QUE REFERENCIAN A OFICINA:

ALTER TABLE EMPLEADO
	ADD CONSTRAINT FK_Empleado_Oficina
	FOREIGN KEY ( id_oficina ) REFERENCES OFICINA ( id_oficina )
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

--	FKs QUE REFERENCIAN A EMPLEADO:
	
	-- RELACIÓN RECURSIVA..., EL EMPLEADO PUEDE TENER UN JEFE QUE TB SERÍA EMPLEADO.
ALTER TABLE EMPLEADO
	ADD CONSTRAINT FK_Empleado_Jefe
	FOREIGN KEY ( id_jefe ) REFERENCES EMPLEADO ( id_empleado )
	ON DELETE SET NULL
	ON UPDATE CASCADE;

ALTER TABLE CLIENTE
	ADD CONSTRAINT FK_Cliente_Empleado
	FOREIGN KEY ( id_empleado ) REFERENCES EMPLEADO ( id_empleado )
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

--	FKs QUE REFERENCIAN A PRODUCTO:

ALTER TABLE	DETALLE_PRODUCTO
	ADD CONSTRAINT FK_Detalle_Producto_Producto
	FOREIGN KEY ( id_producto ) REFERENCES PRODUCTO ( id_producto )
	ON DELETE RESTRICT
	ON UPDATE CASCADE;
	
--	FKs QUE REFERENCIAN A PEDIDO:

ALTER TABLE	DETALLE_PRODUCTO
	ADD CONSTRAINT FK_Detalle_Producto_Pedido
	FOREIGN KEY ( id_pedido ) REFERENCES PEDIDO ( id_pedido )
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

--	FKs QUE REFERENCIAN A GAMA_PRODUCTO:

ALTER TABLE	PRODUCTO
	ADD CONSTRAINT FK_Producto_Gama_Producto
	FOREIGN KEY ( id_gama ) REFERENCES GAMA_PRODUCTO ( id_gama )
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

--	FKs QUE REFERENCIAN A CLIENTE:

ALTER TABLE PEDIDO
	ADD CONSTRAINT FK_Pedido_Cliente
	FOREIGN KEY ( id_cliente ) REFERENCES CLIENTE ( id_cliente )
	ON DELETE RESTRICT
	ON UPDATE CASCADE;

ALTER TABLE PAGO
	ADD CONSTRAINT FK_Pago_Cliente
	FOREIGN KEY ( id_cliente ) REFERENCES CLIENTE ( id_cliente )
	ON DELETE RESTRICT
	ON UPDATE CASCADE;


--------------------------------------------------------------------------------------------
-- 8. Creación de restricciones de valores no nulos
--------------------------------------------------------------------------------------------

-- OFICINA
ALTER TABLE OFICINA		MODIFY 		id_oficina 			INT 					NOT NULL;
ALTER TABLE OFICINA		MODIFY 		ciudad					VARCHAR(30) 	NOT NULL;
ALTER TABLE OFICINA 	MODIFY 		pais 						VARCHAR(30) 	NOT NULL;
ALTER TABLE OFICINA 	MODIFY 		region					VARCHAR(15)		NULL;
ALTER TABLE OFICINA 	MODIFY 		codigo_postal 	VARCHAR(20) 	NULL;
ALTER TABLE OFICINA 	MODIFY 		tel_contacto		VARCHAR(30)		NOT NULL;
ALTER TABLE OFICINA 	MODIFY		direccion_ofic	VARCHAR(50)		NOT NULL;

-- EMPLEADO
ALTER TABLE EMPLEADO		MODIFY 		id_empleado 		INT 					NOT NULL;
ALTER TABLE EMPLEADO		MODIFY 		nombre_emp			VARCHAR(30) 	NOT NULL;
ALTER TABLE EMPLEADO 	  MODIFY 		apellidos_emp		VARCHAR(30) 	NOT NULL;
ALTER TABLE EMPLEADO 	  MODIFY 		extension				VARCHAR(20)		NULL;
ALTER TABLE EMPLEADO 	  MODIFY 		email 					VARCHAR(30) 	NOT NULL;
ALTER TABLE EMPLEADO 	  MODIFY 		id_oficina			INT		NOT NULL;
ALTER TABLE EMPLEADO 	  MODIFY		id_jefe					INT						NULL;
ALTER TABLE EMPLEADO 	  MODIFY		puesto					VARCHAR(20)		NOT NULL;


-- GAMA_PRODUCTO
ALTER TABLE GAMA_PRODUCTO		MODIFY	id_gama						INT						NOT NULL;
ALTER TABLE GAMA_PRODUCTO		MODIFY	descripcion				VARCHAR(200)	NOT NULL;
ALTER TABLE GAMA_PRODUCTO		MODIFY	descripcion_html	VARCHAR(200)	NULL;
ALTER TABLE GAMA_PRODUCTO		MODIFY	imagen						VARCHAR(200)	NULL;


-- CLIENTE
ALTER TABLE	CLIENTE		MODIFY	id_cliente			INT							NOT NULL;
ALTER TABLE CLIENTE		MODIFY	nombre_clie			VARCHAR(20)			NOT NULL;
ALTER TABLE CLIENTE		MODIFY	contacto_clie		VARCHAR(20)			NULL;
ALTER TABLE CLIENTE		MODIFY	telefono_clie		VARCHAR(20)			NOT NULL;
ALTER TABLE CLIENTE		MODIFY	fax_clie				VARCHAR(20)			NULL;
ALTER TABLE CLIENTE		MODIFY	direccion_clie	VARCHAR(30)			NOT NULL;
ALTER TABLE CLIENTE		MODIFY	ciudad_clie			VARCHAR(20)			NOT NULL;
ALTER TABLE CLIENTE		MODIFY	region_clie			VARCHAR(20)			NULL;
ALTER TABLE CLIENTE		MODIFY	pais_clie				VARCHAR(20)			NOT NULL;
ALTER TABLE CLIENTE		MODIFY	cp_clie					VARCHAR(10)			NULL;
ALTER TABLE CLIENTE		MODIFY	id_empleado			INT							NOT NULL;
ALTER TABLE CLIENTE		MODIFY	lim_credito			DECIMAL(10, 2)	NOT NULL;


-- PEDIDO
ALTER TABLE	PEDIDO		MODIFY	id_pedido				INT						NOT NULL;
ALTER TABLE	PEDIDO		MODIFY	id_cliente			INT						NOT NULL;
ALTER TABLE PEDIDO		MODIFY	fecha_pedido		DATE					NOT NULL;
ALTER TABLE	PEDIDO		MODIFY	fecha_entrega		DATE					NULL;
ALTER TABLE	PEDIDO		MODIFY	fecha_recepcion	DATE					NULL;
ALTER TABLE	PEDIDO		MODIFY	estado_pedido		VARCHAR(20)		NOT NULL;
ALTER TABLE	PEDIDO		MODIFY	comentario			VARCHAR(200)	NULL;


-- PRODUCTO
ALTER TABLE PRODUCTO    MODIFY  id_producto       INT             NOT NULL;
ALTER TABLE PRODUCTO    MODIFY  nombre_producto   VARCHAR(100)    NOT NULL;
ALTER TABLE PRODUCTO    MODIFY  id_gama           INT             NOT NULL;
ALTER TABLE PRODUCTO    MODIFY  proveedor					VARCHAR(30)     NULL;
ALTER TABLE PRODUCTO    MODIFY  descripcion				VARCHAR(200)    NULL;
ALTER TABLE PRODUCTO    MODIFY  stock							INT             NOT NULL;
ALTER TABLE PRODUCTO    MODIFY  pvp_proveedor			DECIMAL(10, 2)  NULL;
ALTER TABLE PRODUCTO    MODIFY  precio_venta			DECIMAL(10, 2)  NOT NULL;


--  DETALLE_PRODUCTO
ALTER TABLE DETALLE_PRODUCTO    MODIFY 	id_detalle_producto		INT             NOT NULL;
ALTER TABLE DETALLE_PRODUCTO    MODIFY  id_producto						INT             NOT NULL;
ALTER TABLE DETALLE_PRODUCTO    MODIFY  id_pedido							INT             NOT NULL;
ALTER TABLE DETALLE_PRODUCTO    MODIFY  cantidad							INT             NOT NULL;
ALTER TABLE DETALLE_PRODUCTO    MODIFY  pvp_venta 						DECIMAL(10, 2)  NOT NULL;
ALTER TABLE DETALLE_PRODUCTO    MODIFY  linea_pedido					INT             NOT NULL;


-- PAGO
ALTER TABLE PAGO    MODIFY	id_pago						INT             NOT NULL;
ALTER TABLE PAGO    MODIFY	id_cliente				INT             NOT NULL;
ALTER TABLE PAGO    MODIFY	cod_transaccion		INT             NOT NULL;
ALTER TABLE PAGO    MODIFY  metodo_pago				VARCHAR(10)     NOT NULL;
ALTER TABLE PAGO    MODIFY	fecha_pago				DATE            NOT NULL;
ALTER TABLE PAGO    MODIFY	importe						DECIMAL(10, 2)  NOT NULL;


--------------------------------------------------------------------------------------------
-- 9. Creación de restricciones de valores únicos
--------------------------------------------------------------------------------------------

ALTER TABLE OFICINA   ADD CONSTRAINT  UK_Oficina_Tel_contacto   UNIQUE    (tel_contacto);
ALTER TABLE EMPLEADO  ADD CONSTRAINT  UK_Empleado_Email       UNIQUE    (email);


--------------------------------------------------------------------------------------------
-- 10. Creación de restricciones de valores por defecto
--------------------------------------------------------------------------------------------

ALTER TABLE PEDIDO            MODIFY  COLUMN  fecha_pedido    DATE          DEFAULT   (CURDATE());
ALTER TABLE PEDIDO            MODIFY  COLUMN  estado_pedido   VARCHAR(20)   DEFAULT 'Pendiente';
ALTER TABLE CLIENTE           MODIFY  COLUMN  nombre_clie     VARCHAR(20)   DEFAULT 'Invitado';
ALTER TABLE DETALLE_PRODUCTO  MODIFY  COLUMN  cantidad        INT           DEFAULT 1;
ALTER TABLE DETALLE_PRODUCTO  MODIFY  COLUMN  linea_pedido    INT           DEFAULT 1;
ALTER TABLE PRODUCTO          MODIFY  COLUMN  stock           INT           DEFAULT 0;
ALTER TABLE PAGO              MODIFY  COLUMN  metodo_pago     VARCHAR(10)   DEFAULT 'Giro bancario';


--------------------------------------------------------------------------------------------
-- 11. Creación de restricciones de valores por comparación.
--------------------------------------------------------------------------------------------

ALTER TABLE OFICINA   ADD CONSTRAINT  CHK_Oficina_Id            CHECK (id_oficina > 0);
ALTER TABLE EMPLEADO  ADD CONSTRAINT  CHK_Empleado_Email        CHECK (email LIKE '%_@_%._%');
ALTER TABLE PEDIDO    ADD CONSTRAINT  CHK_Estado_Pedido         CHECK (estado_pedido IN ( 'Pendiente', 'En preparación', 'Servido', 'Cancelado' ));
ALTER TABLE PAGO      ADD CONSTRAINT  CHK_Pago_Metodo           CHECK (metodo_pago IN ('Efectivo', 'Tarjeta', 'Transferencia', 'Giro bancario'));
ALTER TABLE CLIENTE   ADD CONSTRAINT  CHK_Cliente_Telefono      CHECK (telefono_clie  REGEXP '^[6789][0-9]{8}$');
ALTER TABLE PRODUCTO  ADD CONSTRAINT  CHK_Producto_Precio_Venta CHECK (precio_venta > 0);
ALTER TABLE PEDIDO    ADD CONSTRAINT  CHK_Pedido_Fechas         CHECK ( (fecha_entrega IS NULL OR fecha_entrega >= fecha_pedido) AND (fecha_recepcion IS NULL OR fecha_recepcion >= fecha_pedido) );
ALTER TABLE PRODUCTO  ADD CONSTRAINT  CHK_Producto_Precios      CHECK (precio_venta >= pvp_proveedor);

--------------------------------------------------------------------------------------------
-- 12. Eliminar en los nombres de columna el carácter '_'.
--------------------------------------------------------------------------------------------