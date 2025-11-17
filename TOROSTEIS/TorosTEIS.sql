--	1.-CREAMOS LA BASE DE DATOS COMPROBANDO QUE NO EXISTE PREMIAMENTE:
--	2.-CON LA CODIFICACIÓN PARA EL CASTELLANO:

CREATE DATABASE IF NOT EXISTS TorosTEIS
CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;

--	3.-INDICAMOS QUE SE VA A A UTILIZAR ESPECÍFICAMENTE ESTA BASE DE DATOS:

USE TorosTEIS;


--	4.-ELIMINAMOS POR PRECAUCIÓN, POR SI EXISTIESEN, LAS TABLAS QUE VAMOS A CREAR
--      EN ORDEN INVERSO AL DE CREACIÓN.

DROP TABLE IF EXISTS TORERO_CORRIDA;
DROP TABLE IF EXISTS TORO_CORRIDA;
DROP TABLE IF EXISTS TORO_GANADERIA;
DROP TABLE IF EXISTS CORRIDA;
DROP TABLE IF EXISTS TORERO;
DROP TABLE IF EXISTS TORO;
DROP TABLE IF EXISTS APODERADO;
DROP TABLE IF EXISTS GANADERIA;
DROP TABLE IF EXISTS FERIA;
DROP TABLE IF EXISTS PLAZA;

--  5.-CREAMOS LAS TABLAS QUE NOS INIDICA EL ENUNCIADO:

CREATE TABLE FERIA (
  id_feria                INT,
  nombre_feria            VARCHAR(30),
  motivo                  VARCHAR(30),
  fecha_inicio            DATE,
  fecha_fin               DATE

);
CREATE TABLE PLAZA (
  id_plaza                INT,
  nombre_plaza            VARCHAR(30),
  direccion_plz           VARCHAR(30),
  fecha_creacion          DATE,
  otros_datos             VARCHAR(100)
);
CREATE TABLE GANADERIA (
  id_ganaderia            INT,
  nombre_gan              VARCHAR(30),
  ubicacion_gan           VARCHAR(20)
);
CREATE TABLE TORO (
  id_toro                 INT,        
  nombre_toro             VARCHAR(30),
  fecha_nacimiento        DATE,
  peso                    DECIMAL(5,2),
  color                   VARCHAR(20)
);
CREATE TABLE TORERO (
  id_torero               INT,
  nombre_torero           VARCHAR(30),
  apodo                   VARCHAR(30),
  fecha_estreno           DATE,
  otros_datos_torero      VARCHAR(100),
  id_apoderado            INT
);
CREATE TABLE APODERADO (
  id_apoderado            INT,
  nombre_apoderado        VARCHAR(30),
  telefono                VARCHAR(20)
);
CREATE TABLE CORRIDA (
  id_corrida              INT,
  fecha_corrida           DATE,
  hora_corrida           TIME,
  algunos_datos_interes   VARCHAR(100),
  id_feria                INT,
  id_plaza                INT

);

-- DEFINIMOS TORERO_CORRIDA COMO TABLA INTERMEDIA PARA INCLUIR LOS TOREROS
--  QUE PARTICIPAN EN UNA CORRIDA.

CREATE TABLE TORERO_CORRIDA (
  id_torero_corrida       INT,
  id_torero               INT,
  num_torero              INT,
  num_orejas              INT,
  id_corrida              INT
);

-- DEFINIMOS TORO_CORRIDA COMO TABLA INTERMEDIA PARA AGRUPAR A LOS TOROS QUE SE
-- INCLUYEN EN UNA CORRIDA.

CREATE TABLE TORO_CORRIDA (
  id_toro_corrida       INT,
  id_toro                 INT,
  id_corrida              INT
);

-- DEFINIMOS TORO_GANADERIA COMO TABLA INTERMEDIA PARA AGRUPAR A LOS TOROS QUE SE
-- PERTENECEN A UNA GANADERÍA.

CREATE TABLE TORO_GANADERIA (
  id_toro_ganaderia       INT,
  id_toro                 INT,
  fecha_alta              DATE,
  id_ganaderia            INT

);

-- 6.-MODIFICAMOS LAS TABLAS PARA AÑADIR LOS TIPOS DE DATO PARA LOS ATRIBUTOS:

/*DROP TABLE IF EXISTS TORO_GANADERIA;
DROP TABLE IF EXISTS TORO_CORRIDA;
DROP TABLE IF EXISTS TORERO_CORRIDA;
DROP TABLE IF EXISTS CORRIDA;
DROP TABLE IF EXISTS APODERADO;
DROP TABLE IF EXISTS TORERO;
DROP TABLE IF EXISTS TORO;
DROP TABLE IF EXISTS GANADERIA;
DROP TABLE IF EXISTS PLAZA;
DROP TABLE IF EXISTS FERIA;*/

ALTER TABLE FERIA ADD CONSTRAINT PK_idFeria PRIMARY KEY (id_feria);
ALTER TABLE PLAZA ADD CONSTRAINT PK_idPlaza PRIMARY KEY (id_plaza);
ALTER TABLE GANADERIA ADD CONSTRAINT PK_idGanaderia  PRIMARY KEY (id_ganaderia);
ALTER TABLE TORO ADD CONSTRAINT PK_idToro PRIMARY KEY (id_toro);
ALTER TABLE TORERO ADD CONSTRAINT PK_idTorero PRIMARY KEY (id_torero);
ALTER TABLE APODERADO ADD CONSTRAINT PK_idApoderado PRIMARY KEY (id_apoderado);
ALTER TABLE CORRIDA ADD CONSTRAINT PK_idCorrida PRIMARY KEY (id_corrida);
ALTER TABLE TORERO_CORRIDA ADD CONSTRAINT PK_idTorero_Corrida PRIMARY KEY (id_torero_corrida);
ALTER TABLE TORO_CORRIDA ADD CONSTRAINT PK_idToro_Corrida PRIMARY KEY (id_toro_corrida);
ALTER TABLE TORO_GANADERIA ADD CONSTRAINT PK_Toro_Ganaderia PRIMARY KEY (id_Toro_Ganaderia);


--	7.-MODIFICAMOS LAS TABLAS PARA CREAR SUS CLAVES FORÁNEAS:

-- FKs QUE REFERENCIAN A FERIA:

ALTER TABLE CORRIDA 
  ADD CONSTRAINT FK_Corrida_Feria 
  FOREIGN KEY (id_feria) REFERENCES FERIA (id_feria)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

  -- FKs QUE REFERENCIAN A PLAZA:

ALTER TABLE CORRIDA 
  ADD CONSTRAINT FK_Corrida_Plaza 
  FOREIGN KEY (id_plaza) REFERENCES PLAZA (id_plaza)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

  -- FKs QUE REFERENCIAN A GANADERIA:

ALTER TABLE TORO_GANADERIA 
  ADD CONSTRAINT FK_ToroGanaderia_Ganaderia 
  FOREIGN KEY (id_ganaderia) REFERENCES GANADERIA (id_ganaderia)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

  -- FKs QUE REFERENCIAN A TORO:

ALTER TABLE TORO_CORRIDA 
  ADD CONSTRAINT FK_ToroCorrida_Toro 
  FOREIGN KEY (id_toro) REFERENCES TORO (id_toro)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

  ALTER TABLE TORO_GANADERIA 
  ADD CONSTRAINT FK_ToroGanaderia_Toro 
  FOREIGN KEY (id_toro) REFERENCES TORO (id_toro)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

    -- FKs QUE REFERENCIAN A TORERO:

ALTER TABLE TORERO_CORRIDA 
  ADD CONSTRAINT FK_ToreroCorrida_Torero 
  FOREIGN KEY (id_torero) REFERENCES TORERO (id_torero)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

    -- FKs QUE REFERENCIAN A APODERADO:

  ALTER TABLE TORERO
    ADD CONSTRAINT FK_Torero_Apoderado 
    FOREIGN KEY (id_apoderado) REFERENCES APODERADO (id_apoderado)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

    -- FKs QUE REFERENCIAN A CORRIDA:

  ALTER TABLE TORERO_CORRIDA
    ADD CONSTRAINT FK_ToreroCorrida_Corrida 
    FOREIGN KEY (id_corrida) REFERENCES CORRIDA (id_corrida)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

  ALTER TABLE TORO_CORRIDA
    ADD CONSTRAINT FK_ToroCorrida_Corrida
    FOREIGN KEY (id_corrida) REFERENCES CORRIDA (id_corrida)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;


--	8.-MODIFICAMOS LAS TABLAS PARA INTRODUCIR SUS RESTRICCIONES DE VALOR NULO:


ALTER TABLE FERIA MODIFY  id_feria                      INT           NOT NULL;
ALTER TABLE FERIA MODIFY  nombre_feria                  VARCHAR(30)   NOT NULL;
ALTER TABLE FERIA MODIFY  motivo                        VARCHAR(30)   NOT NULL;
ALTER TABLE FERIA MODIFY  fecha_inicio                  DATE          NOT NULL;
ALTER TABLE FERIA MODIFY  fecha_fin                     DATE          NOT NULL;

ALTER TABLE PLAZA MODIFY  id_plaza                      INT           NOT NULL;
ALTER TABLE PLAZA MODIFY  nombre_plaza                  VARCHAR(30)   NOT NULL;
ALTER TABLE PLAZA MODIFY  direccion_plz                 VARCHAR(30)   NOT NULL;
ALTER TABLE PLAZA MODIFY  fecha_creacion                DATE          NOT NULL;
ALTER TABLE PLAZA MODIFY  otros_datos                   VARCHAR(100)  NULL;

ALTER TABLE GANADERIA MODIFY  id_ganaderia              INT           NOT NULL;
ALTER TABLE GANADERIA MODIFY  nombre_gan                VARCHAR(30)   NOT NULL;
ALTER TABLE GANADERIA MODIFY  ubicacion_gan             VARCHAR(20)   NOT NULL;


ALTER TABLE TORO MODIFY  id_toro                        INT           NOT NULL;
ALTER TABLE TORO MODIFY  nombre_toro                    VARCHAR(30)   NOT NULL;
ALTER TABLE TORO MODIFY  fecha_nacimiento               DATE          NOT NULL;
ALTER TABLE TORO MODIFY  peso                           DECIMAL(5,2)  NOT NULL;
ALTER TABLE TORO MODIFY  color                          VARCHAR(20)   NOT NULL;


ALTER TABLE TORERO MODIFY  id_torero                    INT           NOT NULL;    
ALTER TABLE TORERO MODIFY  nombre_torero                VARCHAR(30)   NOT NULL;
ALTER TABLE TORERO MODIFY  apodo                        VARCHAR(30)   NOT NULL;
ALTER TABLE TORERO MODIFY  fecha_estreno                DATE          NOT NULL;
ALTER TABLE TORERO MODIFY  otros_datos_torero           VARCHAR(100)  NULL;
ALTER TABLE TORERO MODIFY  id_apoderado                 INT           NOT NULL;


ALTER TABLE APODERADO MODIFY       id_apoderado              INT           NOT NULL;
ALTER TABLE APODERADO MODIFY       nombre_apoderado          VARCHAR(30)   NOT NULL;
ALTER TABLE APODERADO MODIFY       telefono                  VARCHAR(20)   NOT NULL;


ALTER TABLE CORRIDA MODIFY         id_corrida                 INT           NOT NULL;
ALTER TABLE CORRIDA MODIFY         fecha_corrida              DATE          NOT NULL;
ALTER TABLE CORRIDA MODIFY         hora_corrida               TIME          NOT NULL;
ALTER TABLE CORRIDA MODIFY         algunos_datos_interes      VARCHAR(100)  NULL;
ALTER TABLE CORRIDA MODIFY         id_feria                   INT           NOT NULL;
ALTER TABLE CORRIDA MODIFY         id_plaza                   INT           NOT NULL;


ALTER TABLE TORERO_CORRIDA MODIFY  id_torero_corrida    INT           NOT NULL;
ALTER TABLE TORERO_CORRIDA MODIFY  id_torero            INT           NOT NULL;
ALTER TABLE TORERO_CORRIDA MODIFY  num_torero           INT           NOT NULL;
ALTER TABLE TORERO_CORRIDA MODIFY  num_orejas           INT           NOT NULL;
ALTER TABLE TORERO_CORRIDA MODIFY  id_corrida           INT           NOT NULL;


ALTER TABLE TORO_CORRIDA MODIFY    id_toro_corrida        INT           NOT NULL;
ALTER TABLE TORO_CORRIDA MODIFY    id_toro                INT           NOT NULL;
ALTER TABLE TORO_CORRIDA MODIFY    id_corrida             INT           NOT NULL;


ALTER TABLE TORO_GANADERIA MODIFY  id_toro_ganaderia    INT           NOT NULL;
ALTER TABLE TORO_GANADERIA MODIFY  id_toro              INT           NOT NULL;
ALTER TABLE TORO_GANADERIA MODIFY  fecha_alta           DATE          NOT NULL;
ALTER TABLE TORO_GANADERIA MODIFY  id_ganaderia         INT           NOT NULL;


--------------------------------------------------------------------------------------------
-- 9. Creación de restricciones de valores únicos
--------------------------------------------------------------------------------------------

-- Nombres únicos
ALTER TABLE FERIA ADD UNIQUE (nombre_feria);
ALTER TABLE PLAZA ADD UNIQUE (nombre_plaza);
ALTER TABLE GANADERIA ADD UNIQUE (nombre_gan);


--------------------------------------------------------------------------------------------
-- 10. Creación de restricciones de valores por defecto
--------------------------------------------------------------------------------------------




--------------------------------------------------------------------------------------------
-- 11. Creación de restricciones de valores por comparación.
--------------------------------------------------------------------------------------------

ALTER TABLE FERIA 
  ADD CONSTRAINT CHK_Feria_Fechas 
  CHECK (fecha_fin >= fecha_inicio);

ALTER TABLE TORO 
  ADD CONSTRAINT CHK_Toro_FechaNac 
  CHECK (fecha_nacimiento <= CURDATE());

ALTER TABLE TORERO 
  ADD CONSTRAINT CHK_Torero_Estreno 
  CHECK (fecha_estreno <= CURDATE());

ALTER TABLE TORERO_CORRIDA 
  ADD CONSTRAINT CHK_ToreroCorrida_NumTorero 
  CHECK (num_torero BETWEEN 1 AND 3);

ALTER TABLE TORERO_CORRIDA 
  ADD CONSTRAINT CHK_ToreroCorrida_Orejas 
  CHECK (num_orejas BETWEEN 0 AND 3);

ALTER TABLE APODERADO 
  ADD CONSTRAINT CHK_Apoderado_Telefono 
  CHECK (telefono REGEXP '^[0-9]{9,15}$');

