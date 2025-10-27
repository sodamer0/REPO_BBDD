--------------------------------------------------------------------------------------------
--	CREACION Y USO DE LA BASE DE DATOS 'RestauranteTEIS'
--------------------------------------------------------------------------------------------
-- Nos conectamos como Administradores

-- Creamos al usuario c##RestauranteTEIS y le concedemos los permisos

-- Nos conectamos con el nombre del nuevo usuario

--------------------------------------------------------------------------------------------
--	ELIMINACIÓN DE LAS TABLAS POR SI EXISTIESEN Y PUDIESEN GENERAR ERRORES
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA Restaurante
--
--      id_restaurante          valor numérico de 4 dígitos
--      nombre        		cadena de texto de  50 caracteres, no nulo
--      direccion             	cadena de texto de 100 caracteres, no nula
--      telefono       		cadena de texto de  15 caracteres
--
--      Clave primaria          id_restaurante
--------------------------------------------------------------------------------------------
	CREATE TABLE Restaurante (
		id_restaurante					INT,
        nombre							VARCHAR(50),
        direccion						VARCHAR(100),
        telefono						VARCHAR(15)
    );
--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA Cliente
--
--      id_cliente          	valor numérico de 4 dígitos
--      nombre        		cadena de texto de  50 caracteres, no nulo
--      email             	cadena de texto de  50 caracteres, no nula
--      telefono       		cadena de texto de  15 caracteres
--
--      Clave primaria          id_cliente
--------------------------------------------------------------------------------------------
	CREATE TABLE Cliente (
		id_cliente						INT,
        nombre							VARCHAR(50),
        email							VARCHAR(50),
        telefono						VARCHAR(15)
    );

--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA Mesa
--
--      id_mesa          	valor numérico de 4 dígitos
--      capacidad      		valor numérico de 2 dígitos
--      ubicacion           cadena de texto de  50 caracteres
--
--      Clave primaria          id_mesa
--------------------------------------------------------------------------------------------
	CREATE TABLE Mesa (
		id_mesa							INT,
        capacidad						INT,
        ubicacion						VARCHAR(50)
    );
--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA Pedido
--
--      id_pedido          	valor numérico de 6 dígitos
--      id_cliente      	valor numérico de 4 dígitos
--      fecha_pedido        fecha
--      estado 				cadena de texto de  20 caracteres
--
--      Clave primaria      id_pedido
--		Clave foranea		id_pedido	a 	Cliente( id_cliente )
--------------------------------------------------------------------------------------------
	CREATE TABLE Pedido (
		id_pedido						INT,
        id_cliente						INT,
        fecha_pedido					DATE,
        estado							VARCHAR(20)
    );

--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA DetallePedido
--
--      id_detalle          	valor numérico de 8 dígitos
--      id_pedido      		valor numérico de 6 dígitos
--      id_plato             	valor numérico de 2 dígitos
--      cantidad       		valor numérico de 3 dígitos
--
--      Clave primaria          id_detalle
--		Clave foránea			id_pedido	a 	Pedido( id_pedido )
--------------------------------------------------------------------------------------------
	CREATE TABLE DetallePedido (
		id_detalle						INT,
        id_pedido						INT,
        id_plato						INT,
        cantidad						INT
    );

--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA Plato
--
--      id_plato          	valor numérico de 2 dígitos
--      nombre      		cadena de texto de  50 caracteres
--      tipo             	cadena de texto de  30 caracteres
--      cantidad       		valor numérico de 6 dígitos, siendo 2 la parte decimal
--
--      Clave primaria          id_plato
--------------------------------------------------------------------------------------------
	CREATE TABLE Plato (
    id_plato							INT,
    nombre								VARCHAR(50),
    tipo								VARCHAR(30),
    cantidad							DECIMAL(4, 2)
    );

--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA Reserva
--
--      id_reserva          	valor numérico de 7 dígitos
--      id_cliente      	valor numérico de 4 dígitos
--      fecha_reerva            fecha
--      cantidad_personas	valor numérico de 3 dígitos
--		mesa_preferida		valor numérico de 3 dígitos
--		observaciones		cadena de texto de 200 caracteres
--
--      Clave primaria          id_reserva
--		Clave foránea			id_pedido	a 	Pedido	( id_pedido )
--------------------------------------------------------------------------------------------
	CREATE TABLE Reserva (
		id_reserva						INT,
        id_cliente						INT,
        fecha_reserva					DATE,
        cantidad_personas				INT,
        mesa_preferida					INT,
        observaciones					VARCHAR(200)        
    );

--------------------------------------------------------------------------------------------
-- 1. Creación de las claves primarias
--------------------------------------------------------------------------------------------

		ALTER TABLE Restaurante 
			ADD CONSTRAINT PK_Restaurante_idRestaurante 	PRIMARY KEY ( id_restaurante );
        
        ALTER TABLE Cliente 
			ADD CONSTRAINT PK_Cliente_idCliente				PRIMARY KEY ( id_cliente );
            
		ALTER TABLE Mesa
			ADD CONSTRAINT PK_Mesa_idMesa					PRIMARY KEY ( id_mesa );
            
		ALTER TABLE Pedido
			ADD CONSTRAINT PK_Pedido_idPedido				PRIMARY KEY ( id_pedido );
            
		ALTER TABLE Detallepedido							
			ADD CONSTRAINT PK_Detallepedido_idDetalle		PRIMARY KEY ( id_detalle );
            
		ALTER TABLE Plato
			ADD CONSTRAINT PK_Plato_idPlato					PRIMARY KEY ( id_plato );
            
		ALTER TABLE Reserva
			ADD CONSTRAINT PK_Reserva_idReserva				PRIMARY KEY ( id_reserva );
            
		
--------------------------------------------------------------------------------------------
-- 2. Creación de las claves foráneas
--------------------------------------------------------------------------------------------

		ALTER TABLE Restaurante
			ADD CONSTRAINT FK_idPedido_restaurante	FOREIGN KEY ( id_pedido )	REFERENCES	Pedido	( id_pedido );
            
		ALTER TABLE Pedido
			ADD CONSTRAINT FK_idCliente_pedido		FOREIGN KEY ( id_cliente ) 	REFERENCES	Restaurante	( id_Cliente );
            
		ALTER TABLE Detallepedido
			ADD CONSTRAINT FK_idPedido_detalle		FOREIGN KEY ( id_pedido )	REFERENCES	Pedido	( id_Pedido );
            
		ALTER TABLE Reserva
			ADD CONSTRAINT FK_idPedido_reserva		FOREIGN KEY ( id_pedido )	REFERENCES	Pedido	( id_Pedido );
            
		ALTER TABLE



--------------------------------------------------------------------------------------------
-- 3. Creación de las claves de valores únicos
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- 4. Creación de restricciones de valores no nulos
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- 5. Creación de restricicones de valores por defecto
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- 6. Creación de restricciones de comparación 
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- 7. Cambio de nombres de las claves primarias (sin '_')
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
-- 8. Añadir un campo masInformación a las tablas Mesa y Pedido
--------------------------------------------------------------------------------------------
