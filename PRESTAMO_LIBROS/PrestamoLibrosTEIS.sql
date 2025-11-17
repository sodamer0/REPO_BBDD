/*1.-CREAMOS LA TABLA COMPROBANDO QUE NO EXISTE PREMIAMENTE:
    CON LA CODIFICACIÓN PARA EL CASTELLANO:*/


CREATE DATABASE IF NOT EXISTS PrestamoTEIS
CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;


--	3.-INDICAMOS QUE SE VA A A UTILIZAR ESPECÍFICAMENTE ESTA BASE DE DATOS:

USE PrestamoTEIS;

--	4.-ELIMINAMOS POR PRECAUCIÓN, POR SI EXISTIESEN, LAS TABLAS QUE VAMOS A CREAR:


DROP TABLE IF EXISTS AUTOR;
DROP TABLE IF EXISTS LIBRO;
DROP TABLE IF EXISTS EJEMPLAR;
DROP TABLE IF EXISTS USUARIO;
DROP TABLE IF EXISTS APORTACION;
DROP TABLE IF EXISTS PRESTAMO;

--	5.-CREAMOS LAS TABLAS CON SUS ATRIBUTOS EN BASE AL ENUNCIADO:

CREATE TABLE AUTOR (
  id_autor                INT,
  nombre_autor            VARCHAR(30),
  apellidos_autor         VARCHAR(30),
  direccion_aut           VARCHAR(50),
  telefono1               VARCHAR(20),
  telefono2               VARCHAR(20)

);

CREATE TABLE LIBRO (
  id_libro                INT,
  titulo                  VARCHAR(50),
  editorial               VARCHAR(30),
  isbn                    VARCHAR(20),
  num_paginas             INT

);

CREATE TABLE EJEMPLAR (
  id_ejemplar             INT,
  ubicacion               VARCHAR(20),
  estado                  VARCHAR(30),
  id_libro                INT
);

CREATE TABLE USUARIO (
  id_usuario              INT,
  nombre_us               VARCHAR(30),
  apellidos_us            VARCHAR(50),
  direccion_us            VARCHAR(30),
  nif_us                  VARCHAR(20)

);

CREATE TABLE APORTACION(
  id_aportacion           INT,
  id_autor                INT,
  id_libro                INT,
  fecha_aportacion        DATE,
  aportacion              VARCHAR(30)

);

CREATE TABLE PRESTAMO (
  id_prestamo             INT,
  id_ejemplar             INT,
  id_usuario              INT,
  fecha_prestamo          DATETIME,
  fecha_devolucion        DATETIME
);


--	6.-MODIFICAMOS LOS ATRIBUTOS CON SUS RESTRICCIONES DE VALORES NO NULOS:

ALTER TABLE AUTOR MODIFY  id_autor                INT           NOT NULL;
ALTER TABLE AUTOR MODIFY  nombre_autor            VARCHAR(30)   NOT NULL;
ALTER TABLE AUTOR MODIFY  apellidos_autor         VARCHAR(30)   NOT NULL;
ALTER TABLE AUTOR MODIFY  direccion_aut           VARCHAR(50)   NOT NULL;
ALTER TABLE AUTOR MODIFY  telefono1               VARCHAR(20)   NULL;
ALTER TABLE AUTOR MODIFY  telefono2               VARCHAR(20)   NULL;


ALTER TABLE LIBRO MODIFY  id_libro                INT           NOT NULL;
ALTER TABLE LIBRO MODIFY  titulo                  VARCHAR(50)   NOT NULL;
ALTER TABLE LIBRO MODIFY  editorial               VARCHAR(30)   NOT NULL;
ALTER TABLE LIBRO MODIFY  isbn                    VARCHAR(20)   NOT NULL;
ALTER TABLE LIBRO MODIFY  num_paginas             INT           NULL;


ALTER TABLE EJEMPLAR MODIFY  id_ejemplar          INT           NOT NULL;
ALTER TABLE EJEMPLAR MODIFY  ubicacion            VARCHAR(20)   NOT NULL;
ALTER TABLE EJEMPLAR MODIFY  estado               VARCHAR(30)   NOT NULL;
ALTER TABLE EJEMPLAR MODIFY  id_libro             INT           NOT NULL;


ALTER TABLE USUARIO MODIFY  id_usuario            INT           NOT NULL;
ALTER TABLE USUARIO MODIFY  nombre_us             VARCHAR(30)   NOT NULL;
ALTER TABLE USUARIO MODIFY  apellidos_us          VARCHAR(50)   NOT NULL;
ALTER TABLE USUARIO MODIFY  direccion_us          VARCHAR(30)   NOT NULL;
ALTER TABLE USUARIO MODIFY  nif_us                VARCHAR(20)   NOT NULL;


ALTER TABLE APORTACION MODIFY  id_autor           INT           NOT NULL;
ALTER TABLE APORTACION MODIFY  id_libro           INT           NOT NULL;
ALTER TABLE APORTACION MODIFY  fecha_aportacion   DATE          NOT NULL;
ALTER TABLE APORTACION MODIFY  aportacion         VARCHAR(100)  NOT NULL;


ALTER TABLE PRESTAMO MODIFY  id_ejemplar          INT           NOT NULL;
ALTER TABLE PRESTAMO MODIFY  id_usuario           INT           NOT NULL;
ALTER TABLE PRESTAMO MODIFY  fecha_prestamo       DATETIME      NOT NULL;
ALTER TABLE PRESTAMO MODIFY  fecha_devolucion     DATETIME      NULL;



--	6.-MODIFICAMOS LAS TABLAS PARA CREAR SUS CLAVES PRIMARIAS:

ALTER TABLE AUTOR ADD CONSTRAINT      PK_Autor      PRIMARY KEY (id_autor);
ALTER TABLE LIBRO ADD CONSTRAINT      PK_Libro      PRIMARY KEY (id_libro);
ALTER TABLE EJEMPLAR ADD CONSTRAINT   PK_Ejemplar   PRIMARY KEY (id_ejemplar);
ALTER TABLE USUARIO ADD CONSTRAINT    PK_Usuario    PRIMARY KEY (id_usuario);
ALTER TABLE APORTACION ADD CONSTRAINT PK_Aportacion PRIMARY KEY (id_aportacion);
ALTER TABLE PRESTAMO ADD CONSTRAINT   PK_Prestamo   PRIMARY KEY (id_prestamo);


--	7.-MODIFICAMOS LAS TABLAS PARA CREAR SUS CLAVES FORÁNEAS:

--	FKs QUE REFERENCIAN A AUTOR:

ALTER TABLE APORTACION
  ADD CONSTRAINT  FK_Aportacion_Autor
  FOREIGN KEY (id_autor) REFERENCES AUTOR (id_autor);

--	FKs QUE REFERENCIAN A LIBRO:

ALTER TABLE EJEMPLAR
  ADD CONSTRAINT  FK_Ejemplar_Libro
  FOREIGN KEY (id_libro) REFERENCES LIBRO (id_libro);

ALTER TABLE APORTACION
  ADD CONSTRAINT  FK_Aportacion_Libro
  FOREIGN KEY (id_libro) REFERENCES LIBRO (id_libro);

--	FKs QUE REFERENCIAN A EJEMPLAR:

ALTER TABLE PRESTAMO
  ADD CONSTRAINT  FK_Prestamo_Ejemplar
  FOREIGN KEY (id_ejemplar) REFERENCES EJEMPLAR (id_ejemplar);

--	FKs QUE REFERENCIAN A USUARIO:

ALTER TABLE PRESTAMO
  ADD CONSTRAINT  FK_Prestamo_Usuario
  FOREIGN KEY (id_usuario) REFERENCES USUARIO (id_usuario);


--------------------------------------------------------------------------------------------
-- 9. Creación de restricciones de valores únicos
--------------------------------------------------------------------------------------------

ALTER TABLE LIBRO ADD CONSTRAINT UNIQUE  UK_Libro_Isbn (isbn);

ALTER TABLE USUARIO ADD CONSTRAINT UNIQUE UK_Usuario_Nif (nif_us);

ALTER TABLE APORTACION ADD CONSTRAINT uk_autor_libro UNIQUE (id_autor, id_libro);

--------------------------------------------------------------------------------------------
-- 10. Creación de restricciones de valores por defecto
--------------------------------------------------------------------------------------------

ALTER TABLE PRESTAMO MODIFY COLUMN fecha_prestamo DATETIME  DEFAULT CURRENT_TIMESTAMP;

--------------------------------------------------------------------------------------------
-- 11. Creación de restricciones de valores por comparación.
--------------------------------------------------------------------------------------------

-- 1. Páginas del libro deben ser positivas
ALTER TABLE LIBRO ADD CONSTRAINT CHK_Num_Paginas CHECK (num_paginas > 0);

-- 2. La fecha de devolución no puede ser anterior a la de préstamo
ALTER TABLE PRESTAMO ADD CONSTRAINT CHK_Fechas_Prestamo CHECK (fecha_devolucion IS NULL OR fecha_devolucion >= fecha_prestamo);

-- 3. Estado del ejemplar debe ser uno de los valores permitidos
ALTER TABLE EJEMPLAR ADD CONSTRAINT CHK_Ejemplar_Estado CHECK (estado IN ('Disponible', 'Prestado', 'Prestado Otra Biblioteca', 'Perdido', 'En Restauración', 'En Tránsito', 'Reservado'));

-- 4. ISBN debe tener al menos 10 caracteres (básico, no validación completa)
ALTER TABLE LIBRO ADD CONSTRAINT CHK_Isbn CHECK (CHAR_LENGTH(TRIM(isbn)) >= 10);

-- 5. NIF debe tener al menos 10 caracteres (básico, no validación completa)
ALTER TABLE USUARIO ADD CONSTRAINT CHK_Nif CHECK (nif_us REGEXP '^[0-9]{8}[A-Z]$');