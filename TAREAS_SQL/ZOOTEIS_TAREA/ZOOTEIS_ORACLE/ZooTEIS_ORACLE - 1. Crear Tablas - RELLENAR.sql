--------------------------------------------------------------------------------------------
--	CREACION Y USO DE LA BASE DE DATOS 'ZooTEIS'
--------------------------------------------------------------------------------------------
-- Nos conectamos como Administradores
CONN SYS AS SYSDBA;

-- Creamos al usuario c##ZooTEIS y le concedemos los permisos
DROP USER  	c##ZooTEIS CASCADE;
CREATE USER	c##ZooTEIS IDENTIFIED BY abc
            DEFAULT TABLESPACE      USERS
            QUOTA   UNLIMITED ON    USERS;
GRANT CONNECT, RESOURCE, DBA  TO c##ZooTEIS;

-- Nos conectamos con el nombre del nuevo usuario
CONN c##ZooTEIS/abc;
show user;

--------------------------------------------------------------------------------------------
--	ELIMINACI�N DE LAS TABLAS POR SI EXISTIESEN Y PUDIESEN GENERAR ERRORES
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--	CREACI�N DE LA TABLA ESPECIE
--
--      idEspecie               valor num�rico de 4 d�gitos
--      NombreCientifico        cadena de texto de  50 caracteres, no nulo
--      NombreEspa�ol           cadena de texto de  50 caracteres, no nulo
--      Descripcion             cadena de texto de 200 caracteres, no nula
--      EdadPromedio            valor num�rico de 3 d�gitos, no nulo
--      PesoPromedio            valor num�rico de 3 d�gitos y 2 decimales, no nulo
--      OtrosDatosEspecio       cadena de texto de 200 caracteres
--
--      Clave primaria          idEspecie
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--	CREACI�N DE LA TABLA HABITAT
--
--      idHabitat              valor num�rico de 5 d�gitos
--      NombreHabitat          cadena de texto de  50 caracteres, no nulo
--      Vegetacion             cadena de texto de 200 caracteres, no nulo
--      Clima                  cadena de texto de  50 caracteres, no nulo
--      OtrosDatosHabitat      cadena de texto de 200 caracteres
--
--      Clave primaria          idHabitat
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--	CREACI�N DE LA TABLA GUIA
--
--      idGuia                valor num�rico de 3 d�gitos
--      NombreGuia            cadena de texto de  30 caracteres, no nulo
--      ApellidosGuia         cadena de texto de  60 caracteres, no nulo
--      DireccionGuia         cadena de texto de 200 caracteres, no nulo
--      TelefonoGuia          cadena de texto de  12 caracteres, no nulo
--      ContratacionGuia      tipo fecha, no nulo
--      OtrosDatosGuia        cadena de texto de 200 caracteres
--
--      Clave primaria          idGuia
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--	CREACI�N DE LA TABLA CUIDADOR
--
--      idCuidador            valor num�rico de 3 d�gitos
--      NombreCuidador        cadena de texto de  30 caracteres, no nulo
--      ApellidosCuidador     cadena de texto de  60 caracteres, no nulo
--      DireccionCuidador     cadena de texto de 200 caracteres, no nulo
--      TelefonoCuidador      cadena de texto de  12 caracteres, no nulo
--      ContratacionCuidador  tipo fecha, no nulo
--      OtrosDatosCuidador    cadena de texto de 200 caracteres
--
--      Clave primaria          idCuidador
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--	CREACI�N DE LA TABLA ITINERARIO
--
--      idItinerario          valor num�rico de 3 d�gitos
--      NombreItinerario      cadena de texto de 50 caracteres, no nulo
--      Guia                  valor num�rico de 3 d�gitos, clave for�nea a la tabla Guia
--      HoraInicio            tipo timestamp, no nulo
--      Duracion              valor num�rico de 3 d�gitos, no nulo
--      Longitud              valor num�rico de 3 d�gitos, no nulo
--      MaxVisitantes         valor num�rico de 2 d�gitos, no nulo
--      OtrosDatosItinerario  cadena de texto de 200 caracteres, opcional
--
--      Clave primaria          idItinerario
--	Clave for�nea		Guia 			a la tabla Guia
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--	CREACI�N DE LA TABLA VIVE
--
--      idVive                valor num�rico de 4 d�gitos
--      Especie               valor num�rico de 4 d�gitos, clave for�nea a la tabla Especie
--      Habitat               valor num�rico de 5 d�gitos, clave for�nea a la tabla Habitat
--      Peligrosidad          valor num�rico de 2 d�gitos, no nulo
--      OtrosDatosVive        cadena de texto de 200 caracteres
--
--      Clave primaria          idVive
--	Clave for�nea		Especie		a la tabla Especie
--	Clave for�nea		Habitat		a la tabla Habitat
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--	CREACI�N DE LA TABLA ATIENDE
--
--      idAtiende             valor num�rico de 8 d�gitos
--      Especie               valor num�rico de 4 d�gitos, clave for�nea a la tabla Especie
--      Cuidador              valor num�rico de 3 d�gitos, clave for�nea a la tabla Cuidador
--      Fecha                 tipo fecha, no nulo
--      Incidencia            cadena de texto de 200 caracteres, no nulo
--      OtrosDatosAtencion    cadena de texto de 200 caracteres
--
--      Clave primaria          idAtiende
--	Clave for�nea		Especie		a la tabla Especie
--	Clave for�nea		Cuidador	a la tabla Cuidador
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--	CREACI�N DE LA TABLA RECORRE
--
--      idRecorre             valor num�rico de 3 d�gitos
--      Itinerario            valor num�rico de 3 d�gitos, clave for�nea a la tabla Itinerario
--      Habitat               valor num�rico de 5 d�gitos, clave for�nea a la tabla Habitat
--      Fecha                 tipo fecha, no nulo
--      Incidencias           cadena de texto de 200 caracteres
--      OtrosDatosRecorre     cadena de texto de 200 caracteres
--
--      Clave primaria          idRecorre
--	Clave for�nea		Itinerario	a la tabla Itinerario
--	Clave for�nea		Habitat		a la tabla Habitat
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------

