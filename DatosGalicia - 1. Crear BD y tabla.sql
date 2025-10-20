#--------------------------------------------------
#	CREAMOS LA BASE DE DATOS DatosGalicia
#--------------------------------------------------
DROP	DATABASE	IF EXISTS	DatosGalicia;
CREATE 	DATABASE				DatosGalicia;
USE								DatosGalicia;

#--------------------------------------------------
#	CREAMOS LA TABLA DatosGalicia
#--------------------------------------------------
CREATE TABLE	DatosGalicia(
	idDatosGalicia		INT	AUTO_INCREMENT	PRIMARY KEY,
    Provincia			VARCHAR( 20 ),
    Comarca				VARCHAR( 30 ),
    Concello			VARCHAR( 30 ),
    Superficie			FLOAT,
    Mujeres				INT,
    Hombres				INT
);