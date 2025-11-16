--------------------------------------------------------------------------------------------
--	CREACION Y USO DE LA BASE DE DATOS 'RestauranteTEIS'
--------------------------------------------------------------------------------------------

-- TAREAS A REALIZAR:
--    1. Añadir nuevas columnas: d
--        ◦ En la tabla Cliente: id_cliente_referencia como Cliente que lo ha referenciado.
--        ◦ En las tablas Mesa y Pedido: masInformacion con un tamaño máximo de 200 caracteres
--           y pudiendo quedar vacíos
--    2. Creación de Claves Primarias a cada tabla.
--    3. Creación de Claves Foráneas de conexión entre tablas.
--   4. Creación de restricciones de valor único, al menos, tres atributos con valores únicos.
--    5. Creación de restricciones de valores no nulos, al menos, un atributo en cada tabla
--        que no pueda ser nulo.
--    6. Creación de restricciones de valores por defecto, en cada tabla, al menos, un atributo
--      debe tomar un valor por defecto.
--    7. Creación de restricciones de comparación, en cada tabla, al menos, un atributo debe
--       satisfacer una restricción en valor.
--    8. Elimina en las claves primarias el carácter ‘_’, sólo en el nombre del atributo.

--------------------------------------------------------------------------------------------

	DROP DATABASE IF EXISTS RestauranteTEIS;
    CREATE DATABASE 		RestauranteTEIS
		CHARACTER SET			utf32
		COLLATE					utf32_spanish2_ci;
    USE						RestauranteTEIS;
    
--------------------------------------------------------------------------------------------
-- Nos conectamos como Administradores
--------------------------------------------------------------------------------------------
-- Creamos al usuario c##RestauranteTEIS y le concedemos los permisos
--------------------------------------------------------------------------------------------
-- Nos conectamos con el nombre del nuevo usuario
--------------------------------------------------------------------------------------------
-- Estos tres pasos se ejecutarían por terminal y en Workbench.

-- # Conexión como root (-u root) y ejecución de comandos SQL (-e)

--    mysql -u root -p

--    CREATE USER 'RestauranteTEIS'@'localhost' IDENTIFIED BY 'abc';
    
--    GRANT ALL PRIVILEGES ON RestauranteTEIS.* TO 'RestauranteTEIS'@'localhost';
    
--   FLUSH PRIVILEGES;

-- # Después en Workbench se configuraría la conexión:

--   Connection Name: RestauranteTEIS_Local

--   Hostname: 127.0.0.1 o localhost.

--    Port: 3306 (el puerto predeterminado de MySQL).

--    Username: RestauranteTEIS.

--    Password: 'abc'.


--------------------------------------------------------------------------------------------
--	ELIMINACIÓN DE LAS TABLAS POR SI EXISTIESEN Y PUDIESEN GENERAR ERRORES
--------------------------------------------------------------------------------------------
   
	DROP TABLE IF EXISTS DETALLEPEDIDO;
	DROP TABLE IF EXISTS PEDIDO;
	DROP TABLE IF EXISTS RESERVA;
	DROP TABLE IF EXISTS PLATO;
	DROP TABLE IF EXISTS MESA;
	DROP TABLE IF EXISTS CLIENTE;
	DROP TABLE IF EXISTS RESTAURANTE;

--------------------------------------------------------------------------------------------
--	--1-CREACIÓN DE LA TABLA Restaurante
--
--      id_restaurante          valor numérico de 4 dígitos
--      nombre        			cadena de texto de  50 caracteres, no nulo
--      direccion             	cadena de texto de 100 caracteres, no nula
--      telefono       			cadena de texto de  15 caracteres
--
--      Clave primaria          id_restaurante
--------------------------------------------------------------------------------------------
	CREATE TABLE RESTAURANTE (
		id_Restaurante				INT,
        nombre						VARCHAR( 50 ),
        direccion					VARCHAR( 100 ),
        telefono					VARCHAR( 15 )		

    );
--------------------------------------------------------------------------------------------
--		-- 2-CREACIÓN DE LA TABLA Cliente
--
--      id_cliente          	valor numérico de 4 dígitos
--      nombre        		cadena de texto de  50 caracteres, no nulo
--      email             	cadena de texto de  50 caracteres, no nula
--      telefono       		cadena de texto de  15 caracteres
--      clienteRef			valor numérico de 4 dígitos
--
--      Clave primaria          id_cliente
--------------------------------------------------------------------------------------------
	CREATE TABLE CLIENTE (
		id_Cliente					INT,
        nombre						VARCHAR ( 50 ),
        email						VARCHAR ( 100 ),
        telefono					VARCHAR ( 15 )

    );

--------------------------------------------------------------------------------------------
--	--3-CREACIÓN DE LA TABLA Mesa
--
--      id_mesa          	valor numérico de 4 dígitos
--      capacidad      		valor numérico de 2 dígitos
--      ubicacion           cadena de texto de  50 caracteres
--      masInformacion		cadena de texto de 200 caracteres
--
--      Clave primaria          id_mesa
--------------------------------------------------------------------------------------------
	CREATE TABLE MESA (
		id_Mesa						INT,
        id_Restaurante				INT,
        capacidad					INT,
        ubicacion					VARCHAR ( 50 )
        
    );

--------------------------------------------------------------------------------------------
--	--4-CREACIÓN DE LA TABLA Pedido
--
--      id_pedido          	valor numérico de 6 dígitos
--      id_cliente      	valor numérico de 4 dígitos
--      fecha_pedido           	fecha
--      estado 				cadena de texto de  20 caracteres
--
--      Clave primaria          id_pedido
--		Clave foranea			id_cliente	a 	Cliente( id_cliente )
--------------------------------------------------------------------------------------------
	CREATE TABLE PEDIDO (
		id_Pedido					INT,
        id_Cliente					INT,
        fecha_pedido				DATE,
        estado						VARCHAR ( 20 )

    );

--------------------------------------------------------------------------------------------
--	--5-CREACIÓN DE LA TABLA DetallePedido
--
--      id_detalle          	valor numérico de 8 dígitos
--      id_pedido      		valor numérico de 6 dígitos
--      id_plato             	valor numérico de 2 dígitos
--      cantidad       		valor numérico de 3 dígitos
--
--      Clave primaria          id_cliente
--		Clave foránea			id_pedido	a 	Pedido( id_pedido )
--		Clave foránea			id_plato	a 	Plato( id_plato )
--------------------------------------------------------------------------------------------
	CREATE TABLE DETALLEPEDIDO (
		id_Detalle					INT,
        id_Pedido					INT,
        id_Plato					INT,
        cantidad					DECIMAL ( 4, 2 )	
        
	);

--------------------------------------------------------------------------------------------
--	--6-CREACIÓN DE LA TABLA Plato
--
--      id_plato          	valor numérico de 2 dígitos
--      nombre      		cadena de texto de  50 caracteres
--      tipo             	cadena de texto de  30 caracteres
--      cantidad       		valor numérico de 6 dígitos, siendo 2 la parte decimal
--
--      Clave primaria          id_plato
--------------------------------------------------------------------------------------------
	CREATE TABLE PLATO (
		id_Plato					INT,
        nombre						VARCHAR ( 50 ),
        tipo						VARCHAR ( 30 ),
        cantidad					DECIMAL ( 4, 2 )	

    );

--------------------------------------------------------------------------------------------
--	--7-CREACIÓN DE LA TABLA Reserva
--
--      id_reserva          	valor numérico de 7 dígitos
--      id_cliente      		valor numérico de 4 dígitos
--      fecha_reserva           fecha
--      cantidad_personas		valor numérico de 3 dígitos
--		mesa_preferida			valor numérico de 3 dígitos
--		observaciones			cadena de texto de 200 caracteres
--
--      Clave primaria          id_reserva
--		Clave foránea			id_cliente	a 	Cliente( id_cliente )
--------------------------------------------------------------------------------------------
	CREATE TABLE RESERVA (
		id_Reserva					INT,
        id_Cliente					INT,
        fecha_reserva				DATE,
        cantidad_personas			INT,
        mesa_preferida				INT,
        observaciones				VARCHAR ( 200 )
    
    );
--------------------------------------------------------------------------------------------
-- 1. Añadir nuevas columnas (una vez ya creadas las tablas)
--------------------------------------------------------------------------------------------

--   1.A.- En la tabla CLIENTE: id_Cliente_Referencia como Cliente que lo ha referenciado.

ALTER TABLE CLIENTE 
	ADD COLUMN	id_Cliente_Referencia	INT;

--   1.B.- En las tablas MESA Y PEDIDO: masInformacion,
--   con un tamaño máximo de 200 caracteres y pudiendo quedar vacío.

ALTER TABLE MESA
	ADD COLUMN	 masInformacion			VARCHAR ( 200 )		NULL;
    
ALTER TABLE PEDIDO
	ADD COLUMN	 masInformacion			VARCHAR ( 200 )		NULL;

--------------------------------------------------------------------------------------------
-- 2. Creación de las claves primarias
--------------------------------------------------------------------------------------------

ALTER TABLE RESTAURANTE
    ADD CONSTRAINT PK_Restaurante PRIMARY KEY ( id_Restaurante );
ALTER TABLE CLIENTE
    ADD CONSTRAINT PK_Cliente PRIMARY KEY ( id_Cliente );
ALTER TABLE MESA
    ADD CONSTRAINT PK_Mesa PRIMARY KEY ( id_Mesa );
ALTER TABLE PEDIDO
ADD CONSTRAINT PK_Pedido PRIMARY KEY ( id_Pedido );
ALTER TABLE DETALLEPEDIDO
    ADD CONSTRAINT PK_Detalle PRIMARY KEY ( id_Pedido );    
ALTER TABLE PLATO
    ADD CONSTRAINT PK_Plato PRIMARY KEY ( id_Plato );    
ALTER TABLE RESERVA
    ADD CONSTRAINT PK_Reserva PRIMARY KEY ( id_Reserva );    
    
--------------------------------------------------------------------------------------------
-- 3. Creación de las claves foráneas
--------------------------------------------------------------------------------------------
ALTER TABLE CLIENTE
    ADD CONSTRAINT FK_Cliente_Referencia
    FOREIGN KEY ( id_Cliente_Referencia ) REFERENCES CLIENTE( id_Cliente )
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

ALTER TABLE PEDIDO
    ADD CONSTRAINT FK_Pedido_Cliente 
    FOREIGN KEY ( id_Cliente ) REFERENCES CLIENTE( id_Cliente )
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

ALTER TABLE DETALLEPEDIDO
    ADD CONSTRAINT FK_Detalle_Plato 
    FOREIGN KEY (id_Plato) REFERENCES PLATO( id_Plato )
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

ALTER TABLE DETALLEPEDIDO
    ADD CONSTRAINT FK_Detalle_Pedido
    FOREIGN KEY ( id_Pedido ) REFERENCES PEDIDO( id_Pedido )
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE RESERVA
    ADD CONSTRAINT FK_Reserva_Cliente 
    FOREIGN KEY ( id_Cliente ) REFERENCES CLIENTE( id_Cliente )
    ON DELETE RESTRICT
    ON UPDATE CASCADE;
    
ALTER TABLE RESERVA
    ADD CONSTRAINT FK_Reserva_Mesa 
    FOREIGN KEY ( mesa_preferida ) REFERENCES MESA( id_Mesa )
    ON DELETE RESTRICT
    ON UPDATE CASCADE;
    
ALTER TABLE MESA
    ADD CONSTRAINT FK_Mesa_Restaurante
    FOREIGN KEY ( id_Restaurante ) REFERENCES RESTAURANTE( id_Restaurante )
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

--------------------------------------------------------------------------------------------
-- 4. Creación de las claves de valores únicos
--------------------------------------------------------------------------------------------

ALTER TABLE RESTAURANTE
    ADD CONSTRAINT UK_Restaurante_Nombre	UNIQUE ( nombre );
    
ALTER TABLE RESTAURANTE
	ADD CONSTRAINT UK_Restaurante_Telefono	UNIQUE ( telefono );
    
ALTER TABLE CLIENTE
	ADD CONSTRAINT UK_Cliente_Nombre		UNIQUE ( nombre );
    
ALTER TABLE CLIENTE
	ADD CONSTRAINT UK_Cliente_Email			UNIQUE ( email );
    
ALTER TABLE CLIENTE
	ADD CONSTRAINT UK_Cliente_Telefono		UNIQUE ( telefono );
    
ALTER TABLE PLATO
	ADD CONSTRAINT UK_Plato_Nombre			UNIQUE ( nombre );
    
--------------------------------------------------------------------------------------------
-- 5. Creación de restricciones de valores no nulos
--------------------------------------------------------------------------------------------

-- RESTAURANTE
ALTER TABLE RESTAURANTE		MODIFY 		id_Restaurante 		INT 			NOT NULL;
ALTER TABLE RESTAURANTE 	MODIFY 		nombre 				VARCHAR( 50 ) 	NOT NULL;
ALTER TABLE RESTAURANTE 	MODIFY 		direccion 			VARCHAR( 100 ) 	NOT NULL;
ALTER TABLE RESTAURANTE 	MODIFY 		telefono			VARCHAR( 15 )	NOT NULL;

-- CLIENTE
ALTER TABLE CLIENTE			MODIFY 		id_Cliente 			INT 			NOT NULL;
ALTER TABLE CLIENTE			MODIFY 		nombre 				VARCHAR( 50 ) 	NOT NULL;
ALTER TABLE CLIENTE 		MODIFY 		email 				VARCHAR( 100 ) 	NOT NULL;

-- MESA
ALTER TABLE MESA 			MODIFY 		id_Mesa 			INT 			NOT NULL;
ALTER TABLE MESA			MODIFY 		id_Restaurante 		INT 			NOT NULL;
ALTER TABLE MESA 			MODIFY 		capacidad 			INT 			NOT NULL;
ALTER TABLE MESA 			MODIFY 		ubicacion 			VARCHAR( 50 ) 	NOT NULL;


-- PEDIDO
ALTER TABLE PEDIDO 			MODIFY 		id_Pedido 			INT 			NOT NULL;
ALTER TABLE PEDIDO 			MODIFY 		id_Cliente 			INT 			NOT NULL;
ALTER TABLE PEDIDO 			MODIFY 		fecha_pedido 		DATE 			NOT NULL;
ALTER TABLE PEDIDO 			MODIFY 		estado 				VARCHAR( 20 ) 	NOT NULL;

-- DETALLEPEDIDO
ALTER TABLE DETALLEPEDIDO 	MODIFY 		id_Detalle 			INT 			NOT NULL;
ALTER TABLE DETALLEPEDIDO 	MODIFY 		id_Pedido 			INT 			NOT NULL;
ALTER TABLE DETALLEPEDIDO 	MODIFY 		id_Plato 			INT 			NOT NULL;
ALTER TABLE DETALLEPEDIDO 	MODIFY 		cantidad 			DECIMAL(4,2) 	NOT NULL;

-- PLATO
ALTER TABLE PLATO 			MODIFY 		id_Plato 			INT 			NOT NULL;
ALTER TABLE PLATO 			MODIFY 		nombre 				VARCHAR( 50 ) 	NOT NULL;
ALTER TABLE PLATO 			MODIFY 		tipo 				VARCHAR( 30 ) 	NOT NULL;


-- RESERVA
ALTER TABLE RESERVA 		MODIFY 		id_Reserva 			INT 			NOT NULL;
ALTER TABLE RESERVA 		MODIFY 		id_Cliente 			INT 			NOT NULL;
ALTER TABLE RESERVA 		MODIFY 		fecha_reserva 		DATE 			NOT NULL;
ALTER TABLE RESERVA 		MODIFY 		cantidad_personas 	INT 			NOT NULL;


--------------------------------------------------------------------------------------------
-- 6. Creación de restricciones de valores por defecto
--------------------------------------------------------------------------------------------

-- RESTAURANTE
ALTER TABLE RESTAURANTE 	ALTER		nombre				SET DEFAULT			'EL Teistaurante';
ALTER TABLE RESTAURANTE 	ALTER		telefono			SET DEFAULT			'886666666';

-- CLIENTE
ALTER TABLE CLIENTE 		ALTER 		nombre 				SET DEFAULT 		'Invitado';

-- PEDIDO
ALTER TABLE PEDIDO 			ALTER 		fecha_pedido		SET DEFAULT 		(CURRENT_DATE);
ALTER TABLE PEDIDO 			ALTER 		estado 				SET DEFAULT 		'Pendiente';

-- DETALLEPEDIDO
ALTER TABLE DETALLEPEDIDO 	ALTER 		cantidad 			SET DEFAULT 		1.00;

-- MESA
ALTER TABLE MESA		 	ALTER 		capacidad 			SET DEFAULT 		4;

-- RESERVA
ALTER TABLE RESERVA 		ALTER 		fecha_reserva 		SET DEFAULT 		(CURRENT_DATE);
ALTER TABLE RESERVA			ALTER		cantidad_personas 	SET DEFAULT			2;

-- PLATO
ALTER TABLE	PLATO			ALTER		tipo				SET DEFAULT			'Principal';

--------------------------------------------------------------------------------------------
-- 7. Creación de restricciones de comparación 
--------------------------------------------------------------------------------------------

-- CLIENTE: el campo 'email' se puede validar, para evitar errores

ALTER TABLE RESTAURANTE 
	ADD CONSTRAINT CHK_Restaurante_ID 		CHECK ( id_Restaurante > 0 );

ALTER TABLE CLIENTE 
	ADD CONSTRAINT	CHK_Cliente_Email		CHECK	( email LIKE '%@%' );

-- MESA: La 'capacidad' debe ser positiva y tener un límite de comensales.
ALTER TABLE MESA
	ADD CONSTRAINT	CHK_Mesa_Capacidad		CHECK	( capacidad > 0 AND capacidad <=10 );

-- PEDIDO: el 'estado' de un pedido es fundamental
ALTER TABLE PEDIDO
	ADD CONSTRAINT	CHK_Pedido_Estado		CHECK	( estado IN ( 'Pendiente', 'En preparación', 'Servido', 'Cancelado' ) );
    
-- DETALLEPEDIDO: la 'cantidad' deberá ser mayor que cero
ALTER TABLE DETALLEPEDIDO
	ADD CONSTRAINT	CHK_Detalle_Cantidad	CHECK	( cantidad > 0 );
    
-- PEDIDO: la 'cantidad' deberá ser mayor que cero
ALTER TABLE PLATO 
	ADD CONSTRAINT CHK_Plato_Cantidad 		CHECK 	( cantidad >= 0 );

-- RESERVA: cantidad_personas debe ser positiva y tener un límite.
ALTER TABLE RESERVA
	ADD CONSTRAINT	CHK_Reserva_Personas	CHECK	( cantidad_personas > 0 AND cantidad_personas <=20 );

--------------------------------------------------------------------------------------------
-- 8. Elimina en las claves primarias el carácter ‘_’, sólo en el nombre del atributo.
--------------------------------------------------------------------------------------------
-- Eliminar en primer lugar las FKs dependientes de PKs a modificar (sino no se pueden eliminar las PKs)
ALTER TABLE CLIENTE
	DROP FOREIGN KEY	FK_Cliente_Referencia;

ALTER TABLE PEDIDO
	DROP FOREIGN KEY	FK_Pedido_Cliente;

ALTER TABLE DETALLEPEDIDO
	DROP FOREIGN KEY	FK_Detalle_Pedido;
    
ALTER TABLE DETALLEPEDIDO
	DROP FOREIGN KEY	FK_Detalle_Plato;
    
ALTER TABLE RESERVA
	DROP FOREIGN KEY	FK_Reserva_Cliente;
    
ALTER TABLE RESERVA
	DROP FOREIGN KEY	FK_Reserva_Mesa;
    
ALTER TABLE MESA
	DROP FOREIGN KEY	FK_Mesa_Restaurante;
    
-- Ahora se pueden borrar las PKs

ALTER TABLE RESTAURANTE DROP PRIMARY KEY;

ALTER TABLE CLIENTE DROP PRIMARY KEY;

ALTER TABLE MESA DROP PRIMARY KEY;

ALTER TABLE PEDIDO DROP PRIMARY KEY;

ALTER TABLE DETALLEPEDIDO DROP PRIMARY KEY;

ALTER TABLE PLATO DROP PRIMARY KEY;

ALTER TABLE RESERVA DROP PRIMARY KEY;

-- También es necesario eliminar los CHECKS que referencien columnas que vamos a renombrar.

ALTER TABLE RESTAURANTE DROP CONSTRAINT CHK_Restaurante_ID;


-- Una vez hecho esto, ya se pueden modificar las columnas con clave primaria, ya se les aplican los valores no nulos

ALTER TABLE RESTAURANTE 	CHANGE COLUMN id_Restaurante 			idRestaurante 		INT NOT NULL;
ALTER TABLE CLIENTE 		CHANGE COLUMN id_Cliente 				idCliente 			INT NOT NULL;
ALTER TABLE MESA 			CHANGE COLUMN id_Mesa 					idMesa 				INT NOT NULL;
ALTER TABLE PEDIDO 			CHANGE COLUMN id_Pedido 				idPedido 			INT NOT NULL;
ALTER TABLE PLATO 			CHANGE COLUMN id_Plato 					idPlato 			INT NOT NULL;
ALTER TABLE RESERVA 		CHANGE COLUMN id_Reserva 				idReserva 			INT NOT NULL;

-- Y las columnas con claves foráneas

ALTER TABLE MESA			CHANGE COLUMN id_Restaurante 			idRestaurante 		INT NOT NULL;
ALTER TABLE PEDIDO		  	CHANGE COLUMN id_Cliente 				idCliente 			INT NOT NULL;
ALTER TABLE DETALLEPEDIDO 	CHANGE COLUMN id_Pedido 				idPedido 			INT NOT NULL;
ALTER TABLE DETALLEPEDIDO 	CHANGE COLUMN id_Plato 					idPlato 			INT NOT NULL;
ALTER TABLE DETALLEPEDIDO 	CHANGE COLUMN id_Detalle 				idDetalle 			INT NOT NULL;
ALTER TABLE RESERVA 		CHANGE COLUMN id_Cliente 				idCliente 			INT NOT NULL;
ALTER TABLE RESERVA 		CHANGE COLUMN mesa_preferida 			mesaPreferida 		INT;
ALTER TABLE CLIENTE 		CHANGE COLUMN id_Cliente_Referencia 	idClienteReferencia INT;


-- Y después se pueden volver a crear las PKs

ALTER TABLE RESTAURANTE 	ADD CONSTRAINT PK_Restaurante 	PRIMARY KEY ( idRestaurante );
ALTER TABLE CLIENTE 		ADD CONSTRAINT PK_Cliente 		PRIMARY KEY ( idCliente );
ALTER TABLE MESA 			ADD CONSTRAINT PK_Mesa 			PRIMARY KEY ( idMesa );
ALTER TABLE PEDIDO 			ADD CONSTRAINT PK_Pedido 		PRIMARY KEY ( idPedido );
ALTER TABLE DETALLEPEDIDO 	ADD CONSTRAINT PK_Detalle 		PRIMARY KEY ( idDetalle );
ALTER TABLE PLATO 			ADD CONSTRAINT PK_Plato 		PRIMARY KEY ( idPlato );
ALTER TABLE RESERVA 		ADD CONSTRAINT PK_Reserva 		PRIMARY KEY ( idReserva );


-- Y también se pueden volver a crear las FKs

ALTER TABLE CLIENTE
    ADD CONSTRAINT FK_Cliente_Referencia
    FOREIGN KEY ( idClienteReferencia ) REFERENCES CLIENTE( idCliente )
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

ALTER TABLE PEDIDO
    ADD CONSTRAINT FK_Pedido_Cliente 
    FOREIGN KEY ( idCliente ) REFERENCES CLIENTE ( idCliente )
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

ALTER TABLE DETALLEPEDIDO
    ADD CONSTRAINT FK_Detalle_Plato 
    FOREIGN KEY (idPlato) REFERENCES PLATO ( idPlato )
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

ALTER TABLE DETALLEPEDIDO
    ADD CONSTRAINT FK_Detalle_Pedido
    FOREIGN KEY ( idPedido ) REFERENCES PEDIDO( idPedido )
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE RESERVA
    ADD CONSTRAINT FK_Reserva_Cliente 
    FOREIGN KEY ( idCliente ) REFERENCES CLIENTE ( idCliente )
    ON DELETE RESTRICT
    ON UPDATE CASCADE;
    
ALTER TABLE RESERVA
    ADD CONSTRAINT FK_Reserva_Mesa 
    FOREIGN KEY ( mesaPreferida ) REFERENCES MESA( idMesa )
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

ALTER TABLE MESA
    ADD CONSTRAINT FK_Mesa_Restaurante  
    FOREIGN KEY ( idRestaurante ) REFERENCES RESTAURANTE( idRestaurante )
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

--   Por último, se vueve a crear el CHECK que se borró, ahora referenciado a la columna modificada


ALTER TABLE RESTAURANTE 
	ADD CONSTRAINT CHK_Restaurante_ID 		CHECK ( idRestaurante > 0 );


--------------------------------------------------------------------------------------------

