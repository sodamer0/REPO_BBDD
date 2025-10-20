--------------------------------------------------------------------------------------------
--	CREACIÓN Y USO DE LA BASE DE DATOS 'ZooTEIS'
--------------------------------------------------------------------------------------------
	DROP DATABASE IF EXISTS ZooTEIS;
	CREATE DATABASE 		ZooTEIS
				character set	utf32
				collate			utf32_spanish2_ci;
 	USE 			ZooTEIS;

--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA ESPECIE
--
--      idEspecie               valor numérico de 4 dígitos
--      NombreCientifico        cadena de texto de  50 caracteres, no nulo
--      NombreEspañol           cadena de texto de  50 caracteres, no nulo
--      Descripcion             cadena de texto de 200 caracteres, no nula
--      EdadPromedio            valor numérico de 3 dígitos, no nulo
--      PesoPromedio            valor numérico de 3 dígitos y 2 decimales, no nulo
--      OtrosDatosEspecio       cadena de texto de 200 caracteres
--
--      Clave primaria          idEspecie
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA HABITAT
--
--      idHabitat              valor numérico de 5 dígitos
--      NombreHabitat          cadena de texto de  50 caracteres, no nulo
--      Vegetacion             cadena de texto de 200 caracteres, no nulo
--      Clima                  cadena de texto de  50 caracteres, no nulo
--      OtrosDatosHabitat      cadena de texto de 200 caracteres
--
--      Clave primaria          idHabitat
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA GUIA
--
--      idGuia                valor numérico de 3 dígitos
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
--	CREACIÓN DE LA TABLA CUIDADOR
--
--      idCuidador            valor numérico de 3 dígitos
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
--	CREACIÓN DE LA TABLA ITINERARIO
--
--      idItinerario          valor numérico de 3 dígitos
--      NombreItinerario      cadena de texto de 50 caracteres, no nulo
--      Guia                  valor numérico de 3 dígitos, clave foránea a la tabla Guia
--      HoraInicio            tipo timestamp, no nulo
--      Duracion              valor numérico de 3 dígitos, no nulo
--      Longitud              valor numérico de 3 dígitos, no nulo
--      MaxVisitantes         valor numérico de 2 dígitos, no nulo
--      OtrosDatosItinerario  cadena de texto de 200 caracteres, opcional
--
--      Clave primaria          idItinerario
--		Clave foránea			Guia 			a la tabla Guia
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA VIVE
--
--      idVive                valor numérico de 4 dígitos
--      Especie               valor numérico de 4 dígitos, clave foránea a la tabla Especie
--      Habitat               valor numérico de 5 dígitos, clave foránea a la tabla Habitat
--      Peligrosidad          valor numérico de 2 dígitos, no nulo
--      OtrosDatosVive        cadena de texto de 200 caracteres
--
--      Clave primaria          idVive
--		Clave foránea		Especie		a la tabla Especie
--		Clave foránea		Habitat		a la tabla Habitat
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA ATIENDE
--
--      idAtiende             valor numérico de 8 dígitos
--      Especie               valor numérico de 4 dígitos, clave foránea a la tabla Especie
--      Cuidador              valor numérico de 3 dígitos, clave foránea a la tabla Cuidador
--      Fecha                 tipo fecha, no nulo
--      Incidencia            cadena de texto de 200 caracteres, no nulo
--      OtrosDatosAtencion    cadena de texto de 200 caracteres
--
--      Clave primaria          idAtiende
--		Clave foránea		Especie		a la tabla Especie
--		Clave foránea		Cuidador	a la tabla Cuidador
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA RECORRE
--
--      idRecorre             valor numérico de 3 dígitos
--      Itinerario            valor numérico de 3 dígitos, clave foránea a la tabla Itinerario
--      Habitat               valor numérico de 5 dígitos, clave foránea a la tabla Habitat
--      Fecha                 tipo fecha, no nulo
--      Incidencias           cadena de texto de 200 caracteres
--      OtrosDatosRecorre     cadena de texto de 200 caracteres
--
--      Clave primaria          idRecorre
--		Clave foránea		Itinerario	a la tabla Itinerario
--		Clave foránea		Habitat		a la tabla Habitat
--------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
