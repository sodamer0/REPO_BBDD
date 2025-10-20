-------------------------------------------------------------------------------------------
--	EJERCICIO1: CREAR BASE DE DATOS Y TABLAS SEGÚN LOS DETALLES DADOS:
--------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------
--	CREACIÓN Y USO DE LA BASE DE DATOS 'ConcelloTEIS'
--------------------------------------------------------------------------------------------
DROP DATABASE IF EXISTS ConcelloTEIS;
CREATE DATABASE 		ConcelloTEIS
CHARACTER SET	utf32
COLLATE			utf32_spanish2_ci;
USE 			ConcelloTEIS;

-------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA 'DEPTO' /Contiene información de los departamentos de la empresa/
-------------------------------------------------------------------------------------------
--		Depto 					Numérico de 4 dígitos.
--		Sigla 					Cadena de texto de 4 caracteres
--		Nome 					Cadena de texto de 20 caracteres
--		Ciudad 					Cadena de texto de 30 caracteres
--		Pais 					Cadena de texto de 30 caracteres
--		Tf 						Cadena de texto de 15 caracteres
--		SupJer 					Numérico de 4 dígitos
--------------------------------------------------------------------------------------------

CREATE TABLE DEPTO (
    Depto 						INT,
    Sigla 						VARCHAR(4),
    Nome 						VARCHAR(20),
    Ciudad 						VARCHAR(30),
    Pais 						VARCHAR(30),
    Tf 							VARCHAR(15),
    SupJer 						INT
);

-------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA 'EMPLE' /Contiene información de los empleados/
--------------------------------------------------------------------------------------------
--		Emp 					Numérico de 3 dígitos.
--		Nome 					Cadena de texto de 30 caracteres
--		Apel1 					Cadena de texto de 30 caracteres
--		Apel2 					Cadena de texto de 30 caracteres
--		Sal						Valor numérico de 4 dígitos de parte entera y 2 para la 'parte decimal'
--		FecInc					Fecha

--------------------------------------------------------------------------------------------

CREATE TABLE EMPLE (
    Emp 						INT,
    Nome 						VARCHAR(30),
    Apel1 						VARCHAR(30),
    Apel2						VARCHAR(30),
    Sal 						DECIMAL(6,2),
    FecInc 						DATE
);

-------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA 'ASIGN'  /Contiene información de asignaciones de empleados a departamentos/
--------------------------------------------------------------------------------------------
--		CodAsi 					Numérico de 4 dígitos.
--		Emp						Numérico de 3 dígitos.
--		Dpto 					Numérico de 4 dígitos.
--		FecAsi 					Fecha
--		FecCan					Fecha
-------------------------------------------------------------------------------------------

CREATE TABLE ASIGN (
    CodAsi 						INT,
    Emp 						INT,
    Dpto 						INT,
    FecAsi 						DATE,
    FecCan 						DATE
);

-------------------------------------------------------------------------------------------
--	EJERCICIO2-A
--------------------------------------------------------------------------------------------
--	--2A-I CREA CLAVE PRIMARIAS:
--    • En la tabla DEPTO:  'depto'
--    • En la tabla EMPLE: 'emp'
--    • En la tabla ASIGN:   'codAsi'
--------------------------------------------------------------------------------------------
ALTER TABLE DEPTO 		ADD CONSTRAINT PK_depto PRIMARY KEY (Depto);

ALTER TABLE EMPLE		ADD CONSTRAINT PK_emple PRIMARY KEY (Emp);

ALTER TABLE ASIGN		ADD CONSTRAINT PK_asign PRIMARY KEY (CodAsi);

--------------------------------------------------------------------------------------------

--   --2A-II CREA 'CLAVES FORÁNEAS':
--    • En la tabla DEPTO:  'supJer' a la tabla DEPTO
--    • En la tabla ASIGN:   'emp' a la tabla EMPLE
--						    'dpto' a la tabla DEPTO
--------------------------------------------------------------------------------------------
ALTER TABLE DEPTO
ADD CONSTRAINT FK_depto_SupJer		FOREIGN KEY ( SupJer )		REFERENCES DEPTO ( Depto )
ON DELETE SET NULL
ON UPDATE CASCADE;
 
ALTER TABLE ASIGN
ADD CONSTRAINT FK_asign_Emp 		FOREIGN KEY ( Emp )			REFERENCES EMPLE ( Emp )
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE ASIGN
ADD CONSTRAINT FK_asign_Dpto 		FOREIGN KEY ( Dpto )		REFERENCES DEPTO ( Depto )
ON DELETE CASCADE
ON UPDATE CASCADE;



--------------------------------------------------------------------------------------------
 
--	--2A-III CREA RESTRICCIONES DE VALORES NO NULOS:
--  • En la tabla DEPTO:    sigla, nome, pais
--	• En la tabla EMPLE:   nome, Apel1, FecInc
--  • En la tabla ASIGN:    emp, dpto, FecAsi
--------------------------------------------------------------------------------------------
 
 -- Restricciones NOT NULL en la tabla depto
 
ALTER TABLE DEPTO		MODIFY Sigla 		VARCHAR(4) NOT NULL;

ALTER TABLE DEPTO		MODIFY Nome 		VARCHAR(20) NOT NULL;

ALTER TABLE DEPTO		MODIFY Pais 		VARCHAR(30) NOT NULL;

-- Restricciones NOT NULL en la tabla emple
ALTER TABLE EMPLE		MODIFY Nome 		VARCHAR(30) NOT NULL;

ALTER TABLE EMPLE		MODIFY Apel1 		VARCHAR(30) NOT NULL;

ALTER TABLE EMPLE		MODIFY FecInc 		DATE NOT NULL;

-- Restricciones NOT NULL en la tabla asign
ALTER TABLE ASIGN		MODIFY Emp 			INT NOT NULL;

ALTER TABLE ASIGN		MODIFY Dpto 		INT NOT NULL;

ALTER TABLE ASIGN		MODIFY FecAsi 		DATE NOT NULL;

--------------------------------------------------------------------------------------------
--	--2A-IV MODIFICA TIPOS DE DATOS:
--	• En la tabla EMPLE: cambia el tipo de datos de 'Sal' a 'entero de 5 dígitos'
--------------------------------------------------------------------------------------------

ALTER TABLE emple		MODIFY Sal 			INT;

--------------------------------------------------------------------------------------------
-- 2A-V CREA RESTRICCIONES DE COMPARACIÓN:
--	• En la tabla DEPTO:  'sigla', 'nome', 'ciudad', 'pais' -> 'No pueden quedar vacíos'
--	• En la tabla EMPLE:  'nome', 'Apel1', 'sal'            -> 'No pueden quedar vacíos'
--                                                 'sal'      -> 'No puede ser negativo ni nulo'                                               No puede ser negativo ni nulo
--------------------------------------------------------------------------------------------

-- Restricciones CHECK en la tabla depto: no pueden quedar vacíos
ALTER TABLE DEPTO		ADD CONSTRAINT CHK_depto_Sigla 		CHECK ( Sigla <> '' );

ALTER TABLE DEPTO		ADD CONSTRAINT CHK_depto_Nome 		CHECK (Nome <> '');

ALTER TABLE DEPTO		ADD CONSTRAINT CHK_depto_Ciudad 	CHECK ( Ciudad <> '' OR Ciudad IS NULL );

ALTER TABLE DEPTO		ADD CONSTRAINT CHK_depto_Pais 		CHECK ( Pais <> '' );

-- Restricciones CHECK en la tabla emple: no pueden quedar vacíos
ALTER TABLE EMPLE		ADD CONSTRAINT CHK_emple_Nome 		CHECK ( Nome <> '' );

ALTER TABLE EMPLE		ADD CONSTRAINT CHK_emple_Apel1 		CHECK ( Apel1 <> '' );

ALTER TABLE EMPLE		ADD CONSTRAINT CHK_emple_Sal 		CHECK ( Sal IS NOT NULL AND Sal >= 0 );

--------------------------------------------------------------------------------------------
--    2A-VI CAMBIA UN ATRIBUTO DE TABLA:
--	• Mueve el atributo 'Sal' a la tabla ASIGN para que sea más significativo.
--------------------------------------------------------------------------------------------

-- Añadir columna Sal a la tabla ASIGN
ALTER TABLE ASIGN		ADD COLUMN Sal 						INT;

-- Agregar restricción CHECK para Sal en ASIGN
ALTER TABLE ASIGN		ADD CONSTRAINT CHK_asign_Sal 	CHECK ( Sal IS NOT NULL AND Sal >= 0 );

-- Eliminar la restricción CHECK que ya no aplica
ALTER TABLE EMPLE		DROP CHECK CHK_emple_Sal;

-- Eliminar columna Sal de la tabla EMPLE
ALTER TABLE EMPLE		DROP COLUMN Sal;

--------------------------------------------------------------------------------------------
--    --2A-VII CREA RESTRICCIONES DE CAMBIO DE NOMBRE:
--    • Cambia el nombre de la tabla DEPTO por DEPARTAMENTO, EMPLE por EMPLEADO, y, ASIGN por ASIGNACION.
--    • Cambia el nombre de la clave primaria de la tabla DEPARTAMENTO por 'Dpto'.
--    • Cambia el nombre de la 'clave foránea' de la tabla ASIGNACION por 'Empleado'.
--------------------------------------------------------------------------------------------

RENAME TABLE DEPTO TO DEPARTAMENTO;

RENAME TABLE EMPLE TO EMPLEADO;

RENAME TABLE ASIGN TO ASIGNACION;

ALTER TABLE DEPARTAMENTO	CHANGE Depto Dpto 		INT NOT NULL;

ALTER TABLE ASIGNACION		CHANGE Emp Empleado 	INT NOT NULL;

--------------------------------------------------------------------------------------------
--	--2A-VIII CREA RESTRICCIONES DE ACCESO RÁPIDO A TODAS LAS TABLAS EN FUNCIÓN DE
--		ALGÚN ATRIBUTO 'NO PRIMO'.
--------------------------------------------------------------------------------------------

-- Índice en la tabla Departamento por Nome
CREATE INDEX IDX_Departamento_Nome ON Departamento(Nome);

-- Índice en la tabla Departamento por Ciudad
CREATE INDEX IDX_Departamento_Ciudad ON Departamento(Ciudad);

-- Índice en la tabla Empleado por Nome
CREATE INDEX IDX_Empleado_Nome ON Empleado(Nome);

-- Índice en la tabla Empleado por Apel1
CREATE INDEX IDX_Empleado_Apel1 ON Empleado(Apel1);

-- Índice en la tabla Asignacion por FecAsi
CREATE INDEX IDX_Asignacion_FecAsi ON Asignacion(FecAsi);

--------------------------------------------------------------------------------------------
