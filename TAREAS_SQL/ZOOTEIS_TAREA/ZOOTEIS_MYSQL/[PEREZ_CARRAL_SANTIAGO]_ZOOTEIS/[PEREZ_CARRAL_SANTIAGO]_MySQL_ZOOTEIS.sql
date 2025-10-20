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
	CREATE TABLE ESPECIE (
		idEspecie					INT NOT NULL,
        NombreCientifico			VARCHAR(50) NOT NULL,
        NombreEspañol				VARCHAR(50) NOT NULL,
        Descripcion					VARCHAR(200) NOT NULL,
        EdadPromedio				INT NOT NULL,
        PesoPromedio				DECIMAL(6,2) NOT NULL,
        OtrosDatosEspecie			VARCHAR(200) NOT NULL,
        
        CONSTRAINT PK_idEspecie		PRIMARY KEY ( idEspecie )
    );

INSERT INTO ESPECIE     VALUES    (  1, 'Panthera leo',             'León',                         'El león es un mamífero carnívoro de la familia de los felinos. VIVE en manadas y es conocido por su melena.',                                                          12,  190, '' );
INSERT INTO ESPECIE     VALUES    (  2, 'Elephas maximus',          'Elefante Asiático',            'El elefante asiático es el mamífero terrestre más grande de Asia. Es conocido por sus grandes orejas y trompa.',                                                       60, 5000, '' );
INSERT INTO ESPECIE     VALUES    (  3, 'Vulpes vulpes',            'Zorro Rojo',                   'El zorro rojo es un mamífero carnívoro de la familia Canidae. Tiene un pelaje rojizo y una cola esponjosa.',                                                            5,    7, '' );
INSERT INTO ESPECIE     VALUES    (  4, 'Phyllobates terribilis',   'Rana Flecha Dorada',           'La rana flecha dorada es conocida por su brillante color dorado y su toxicidad. Habita en la selva amazónica.',                                                         3, 0.02, '' );
INSERT INTO ESPECIE     VALUES    (  5, 'Giraffa camelopardalis',   'Jirafa',                       'La jirafa es un mamífero artiodáctilo de cuello largo. Es conocida por su distintivo patrón de manchas en la piel.',                                                   25,  900, '' );
INSERT INTO ESPECIE     VALUES    (  6, 'Canis lupus',              'Lobo Gris',                    'El lobo gris es un carnívoro salvaje que VIVE en manadas. Tiene un papel importante en muchas culturas.',                                                               8,   40, '' );
INSERT INTO ESPECIE     VALUES    (  7, 'Pongo pygmaeus',           'Orangután',                    'El orangután es un simio que habita en las selvas de Borneo y Sumatra. Son conocidos por su inteligencia y habilidades de herramientas.',                              30,   80, '' );
INSERT INTO ESPECIE     VALUES    (  8, 'Panthera tigris',          'Tigre',                        'El tigre es el felino más grande del mundo. Tiene un pelaje anaranjado con rayas negras y es un depredador solitario.',                                                15,  300, '' );
INSERT INTO ESPECIE     VALUES    (  9, 'Gorilla gorilla',          'Gorila de Montaña',            'El gorila de montaña es una ESPECIE de primate que habita en las montañas de África Central. Son los primates más grandes del mundo.',                                 35,  180, '' );
INSERT INTO ESPECIE     VALUES    ( 10, 'Puma concolor',            'Puma',                         'El puma es un felino nativo de América. También se le conoce como león de montaña o león de América.',                                                                 12,   70, '' );
INSERT INTO ESPECIE     VALUES    ( 11, 'Dendrobates azureus',      'Rana Flecha Azul',             'La rana flecha azul es conocida por su llamativo color azul. Es nativa de las selvas tropicales de América del Sur.',                                                   5, 0.03, '' );
INSERT INTO ESPECIE     VALUES    ( 12, 'Ailuropoda melanoleuca',   'Panda Gigante',                'El panda gigante es un oso nativo de China. Se alimenta principalmente de bambú y es conocido por su pelaje blanco y negro.',                                          20,  120, '' );
INSERT INTO ESPECIE     VALUES    ( 13, 'Hippopotamus amphibius',   'Hipopótamo',                   'El hipopótamo es un gran mamífero herbívoro semiacuático nativo de África. Es conocido por su tamaño y agresividad.',                                                  40, 1500, '' );
INSERT INTO ESPECIE     VALUES    ( 14, 'Dromaius novaehollandiae', 'Emú',                          'El emú es un ave nativa de Australia. Es el ave no voladora más grande y conocido por su velocidad al correr.',                                                        10,   45, '' );
INSERT INTO ESPECIE     VALUES    ( 15, 'Vombatus ursinus',         'Wombat Común',                 'El wombat común es un marsupial nativo de Australia. Es conocido por su apariencia robusta y comportamiento excavador.',                                               15,   35, '' );
INSERT INTO ESPECIE     VALUES    ( 16, 'Ceratotherium simum',      'Rinoceronte Blanco',           'El rinoceronte blanco es un gran mamífero herbívoro con un cuerno distintivo en su nariz. Es originario de África.',                                                   40, 2300, '' );
INSERT INTO ESPECIE     VALUES    ( 17, 'Macropus rufus',           'Canguro Rojo',                 'El canguro rojo es el marsupial más grande y es nativo de Australia. Es conocido por su saltos largos y poderosas patas traseras.',                                     6,   85, '' );
INSERT INTO ESPECIE     VALUES    ( 18, 'Cygnus atratus',           'Cisne Negro',                  'El cisne negro es un ave acuática nativa de Australia. Es conocido por su plumaje negro y cuello largo.',                                                              15,    8, '' );
INSERT INTO ESPECIE     VALUES    ( 19, 'Felis catus',              'Gato Doméstico',               'El gato doméstico es un pequeño mamífero carnívoro que ha sido domesticado como mascota. Viene en diversas razas y colores.',                                          15,    4, '' );
INSERT INTO ESPECIE     VALUES    ( 20, 'Haliaeetus leucocephalus', 'Águila Calva',                 'El águila calva es un ave rapaz nativa de América del Norte. Es conocida por su cabeza blanca y fuertes garras.',                                                      20,    6, '' );
INSERT INTO ESPECIE     VALUES    ( 21, 'Ara ararauna',             'Guacamayo Azul y Amarillo',    'El guacamayo azul y amarillo es una ESPECIE de loro colorido nativo de América del Sur. Es conocido por sus plumas brillantes.',                                       50,    1, '' );
INSERT INTO ESPECIE     VALUES    ( 22, 'Orcinus orca',             'Orca',                         'La orca, también conocida como ballena asesina, es un mamífero marino inteligente y depredador. Es conocida por su coloración distintiva y comportamiento social.',    50, 9000, '' );
INSERT INTO ESPECIE     VALUES    ( 23, 'Hylobates lar',            'Gibón',                        'El gibón es un primate nativo del sudeste asiático. Se caracteriza por su canto melódico y su habilidad para moverse rápidamente entre los árboles.',                  25,    7, '' );
INSERT INTO ESPECIE     VALUES    ( 24, 'Pan troglodytes',          'Chimpancé',                    'El chimpancé es un gran simio que habita en las selvas de África. Es conocido por su inteligencia y comportamiento social complejo.',                                  40,   70, '' );
INSERT INTO ESPECIE     VALUES    ( 25, 'Camelus dromedarius',      'Camello',                      'El camello es un mamífero herbívoro adaptado a vivir en regiones desérticas. Es conocido por su capacidad para almacenar agua en su joroba.',                          25,  600, '' );
INSERT INTO ESPECIE     VALUES    ( 26, 'Equus zebra',              'Cebra',                        'La cebra es un mamífero herbívoro de África conocido por sus rayas blancas y negras. Es un miembro de la familia de los équidos.',                                     25,  400, '' );
INSERT INTO ESPECIE     VALUES    ( 27, 'Lynx pardinus',            'Lince Ibérico',                'El lince ibérico es un felino en peligro crítico de extinción. Habita en la península ibérica y se caracteriza por sus manchas en el pelaje.',                         10,   15, '' );
INSERT INTO ESPECIE     VALUES    ( 28, 'Panthera pardus',          'Leopardo',                     'El leopardo es un gran felino que se encuentra en diversas regiones de África y Asia. Es conocido por su agilidad y habilidad para trepar árboles.',                   12,   60, '' );
INSERT INTO ESPECIE     VALUES    ( 29, 'Eudyptula minor',          'Pingüino Azul',                'El pingüino azul es una ESPECIE de pingüino pequeño que habita en las costas de Australia y Nueva Zelanda. Tiene un plumaje azul y blanco.',                            7,    1, '' );
INSERT INTO ESPECIE     VALUES    ( 30, 'Oryx gazella',             'Órix',                         'El órix es un antílope que VIVE en regiones desérticas de África. Tiene cuernos largos y rectos, adaptados para la super VIVEncia en ambientes secos.',                 15,  200, '' );
INSERT INTO ESPECIE     VALUES    ( 31, 'Panthera onca',            'Jaguar',                       'El jaguar es un felino grande que habita en las selvas de América. Es conocido por su fuerza y es el tercer felino más grande del mundo.',                             12,  100, '' );
INSERT INTO ESPECIE     VALUES    ( 32, 'Canis simensis',           'Lobo Etíope',                  'El lobo etíope es un lobo salvaje endémico de las montañas de Etiopía. Es el lobo más raro y en peligro crítico de extinción.',                                         8,   20, '' );
INSERT INTO ESPECIE     VALUES    ( 33, 'Acinonyx jubatus',         'Guepardo',                     'El guepardo es un felino rápido y ágil que se encuentra en las sabanas africanas. Es el animal terrestre más rápido y se distingue por sus manchas.',                  10,   65, '' );
INSERT INTO ESPECIE     VALUES    ( 34, 'Pseudoryx nghetinhensis',  'Saola',                        'El saola es un bovino raro que habita en la región montañosa entre Vietnam y Laos. Es conocido como el "unicornio asiático" debido a sus cuernos largos y delgados.',  15,  300, '' );
INSERT INTO ESPECIE     VALUES    ( 35, 'Ailurus fulgens',          'Mapache Rojo',                 'El mapache rojo es un mamífero pequeño que habita en el sureste asiático. Se caracteriza por su pelaje rojizo y anillos alrededor de la cola.',                         8,    5, '' );
INSERT INTO ESPECIE     VALUES    ( 36, 'Crocodylus porosus',       'Cocodrilo de Agua Salada',     'El cocodrilo de agua salada es el cocodrilo más grande y agresivo. Se encuentra en zonas de agua salada en el sudeste asiático y Australia.',                          70, 1000, '' );
INSERT INTO ESPECIE     VALUES    ( 37, 'Chelonia mydas',           'Tortuga Verde',                'La tortuga verde es una tortuga marina que se encuentra en océanos tropicales y subtropicales. Es conocida por su caparazón en forma de corazón.',                     80,  200, '' );
INSERT INTO ESPECIE     VALUES    ( 38, 'Phocoena phocoena',        'Marsopa Común',                'La marsopa común es un pequeño cetáceo que habita en aguas frías y templadas. Se encuentra en el Atlántico y el Pacífico norte.',                                      15,   70, '' );
INSERT INTO ESPECIE     VALUES    ( 39, 'Melursus ursinus',         'Oso Labiado',                  'El oso labiado es un oso de pelaje negro y labios blancos. Se encuentra en el subcontinente indio y es conocido por su dieta de insectos.',                            25,  140, '' );
INSERT INTO ESPECIE     VALUES    ( 40, 'Carcharodon carcharias',   'Gran Tiburón Blanco',          'El gran tiburón blanco es uno de los mayores depredadores marinos. Se encuentra en aguas costeras de todo el mundo y es conocido por su tamaño y ferocidad.',          70, 2000, '' );
INSERT INTO ESPECIE     VALUES    ( 41, 'Echidna',                  'Equidna',                      'El equidna es un mamífero monotremado que se encuentra en Australia y Nueva Guinea. Es conocido por sus espinas y su lengua pegajosa para atrapar insectos.',          15,    5, '' );
INSERT INTO ESPECIE     VALUES    ( 42, 'Glaucidium perlatum',      'Mochuelo Perlado',             'El mochuelo perlado es una ESPECIE de búho pequeño que se encuentra en América Central y América del Sur. Tiene un plumaje con manchas perladas.',                      5,  0.2, '' );
INSERT INTO ESPECIE     VALUES    ( 43, 'Harpia harpyja',           'Águila Harpía',                'El águila harpía es una de las aves de presa más grandes del mundo. Se encuentra en las selvas tropicales de América del Sur y es conocida por su tamaño imponente.',  25,    9, '' );
INSERT INTO ESPECIE     VALUES    ( 44, 'Manis javanica',           'Pangolín de Java',             'El pangolín de Java es una ESPECIE de pangolín que se encuentra en Indonesia y Malasia. Es conocido por sus escamas y su capacidad para enrollarse en una bola.',      20,    8, '' );
INSERT INTO ESPECIE     VALUES    ( 45, 'Ursus arctos horribilis',  'Oso Grizzly',                  'El oso grizzly es una subespecie del oso pardo que se encuentra en Norteamérica. Es conocido por su gran tamaño y fuerza.',                                            25,  400, '' );
--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA HABITAT
--
--      id HABITAT              valor numérico de 5 dígitos
--      Nombre HABITAT          cadena de texto de  50 caracteres, no nulo
--      Vegetacion             cadena de texto de 200 caracteres, no nulo
--      Clima                  cadena de texto de  50 caracteres, no nulo
--      OtrosDatos HABITAT      cadena de texto de 200 caracteres
--
--      Clave primaria          id HABITAT
--------------------------------------------------------------------------------------------

	CREATE TABLE HABITAT (
    
		idHabitat					INT NOT NULL,
        NombreHabitat				VARCHAR(50) NOT NULL,
        Vegetacion					VARCHAR(200) NOT NULL,
        Clima						VARCHAR(50) NOT NULL,
        OtrosDatosHabitat			VARCHAR(200) NULL,
        
        CONSTRAINT PK_id_Habitat		PRIMARY KEY ( idHabitat )
    );

INSERT INTO HABITAT     VALUES (  1, 'Selva Tropical',      'Densa',    'Tropical', 'Continentes: América, África y Asia' );
INSERT INTO HABITAT     VALUES (  2, 'Desierto',            'Escasa',   'Ártido',   'Continentes: América y África' );
INSERT INTO HABITAT     VALUES (  3, 'Sabana',              'Media',    'Tropical', 'Continente: África' );
INSERT INTO HABITAT     VALUES (  4, 'Tundra',              'Baja',     'Frío',     'Continentes: Europa, Asia y Norteamérica' );
INSERT INTO HABITAT     VALUES (  5, 'Bosque templado',     'Media',    'Templado', 'Continentes: Europa y Asia' );
INSERT INTO HABITAT     VALUES (  6, 'Manglar',             'Media',    'Húmedo',   'Continente: América' );
INSERT INTO HABITAT     VALUES (  7, 'Bosque Boreal',       'Densa',    'Frío',     'Continentes: Europa y Norteamérica' );
INSERT INTO HABITAT     VALUES (  8, 'Arrecife',            'Escasa',   'Cálido',   'Continente: Oceanía' );
INSERT INTO HABITAT     VALUES (  9, 'Humedal',             'Media',    'Húmeda',   'Continentes: América y África' );
INSERT INTO HABITAT     VALUES ( 10, 'Bosque de Coníferas', 'Densa',    'Frío',     'Continentes: Europa y Norteamérica' );
INSERT INTO HABITAT     VALUES ( 11, 'Pantano',             'Escasa',   'Templado', 'Continentes: América y Asia' );
INSERT INTO HABITAT     VALUES ( 12, 'Montaña',             'Escasa',   'Frío',     'Continentes: Europa, Asia y Norteamérica' );
INSERT INTO HABITAT     VALUES ( 13, 'Bosque de Niebla',    'Densa',    'Húmedo',   'Continentes: América' );
INSERT INTO HABITAT     VALUES ( 14, 'Taiga',               'Baja',     'Frío',     'Continentes: Europa y Norteamérica' );
INSERT INTO HABITAT     VALUES ( 15, 'Desierto de Altitud', 'Escasa',   'Frío',     'Continente: América' );

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


	CREATE TABLE GUIA (
    
		idGuia						INT NOT NULL,
        NombreGuia					VARCHAR(30) NOT NULL,
        ApellidosGuia				VARCHAR(60) NOT NULL,
        DireccionGuia				VARCHAR(200) NOT NULL,
        TelefonoGuia				VARCHAR(12) NOT NULL,
        ContratacionGuia			DATE NOT NULL,
        OtrosDatosGuia				VARCHAR(200) NULL,
    
		CONSTRAINT PK_idGuia	PRIMARY KEY ( idGuia )
    );

INSERT INTO GUIA    VALUES    (  1, 'Luis',     'Martínez',     'Calle Principal 23',   '123456789', '2021-12-01', '' );
INSERT INTO GUIA    VALUES    (  2, 'Cristina', 'Gómez',        'Avenida Central 51',   '987654321', '2022-01-15', '' );
INSERT INTO GUIA    VALUES    (  3, 'Roberto',  'Fernández',    'Calle Secundaria 7',   '654321987', '2021-11-05', '' );
INSERT INTO GUIA    VALUES    (  4, 'Isabel',   'Sánchez',      'Avenida Soleada 23',   '456789012', '2022-02-20', '' );
INSERT INTO GUIA    VALUES    (  5, 'Pablo',    'Rodríguez',    'Calle Tranquila 7',    '321098765', '2021-10-08', '' );
INSERT INTO GUIA    VALUES    (  6, 'Laura',    'López',        'Avenida Céntrica 10',  '789012345', '2022-04-18', '' );
INSERT INTO GUIA    VALUES    (  7, 'Sergio',   'Torres',       'Calle Serena 13',      '210987654', '2021-09-25', '' );
INSERT INTO GUIA    VALUES    (  8, 'Elena',    'García',       'Avenida Tranquila 5',  '876543210', '2022-05-12', '' );
INSERT INTO GUIA    VALUES    (  9, 'Juan',     'Hernández',    'Calle Sombría 9',      '543210987', '2021-08-03', '' );
INSERT INTO GUIA    VALUES    ( 10, 'Marta',    'Díaz',         'Avenida Central 3',    '109876543', '2022-06-22', '' );


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



	CREATE TABLE CUIDADOR (
    
		idCuidador					INT NOT NULL,
        NombreCuidador				VARCHAR(30) NOT NULL,
        ApellidosCuidador			VARCHAR(60) NOT NULL,
        DireccionCuidador			VARCHAR(200) NOT NULL,
        TelefonoCuidador			VARCHAR(12) NOT NULL,
        ContratacionCuidador		DATE NOT NULL,
        OtrosDatosCuidador			VARCHAR(200) NULL,
    
		CONSTRAINT PK_idCuidador	PRIMARY KEY ( idCuidador )
    );

INSERT INTO CUIDADOR    VALUES    (  1, 'Juan',         'Gómez',        'Calle Principal 13',   '123456789', '2022-01-10', '' );
INSERT INTO CUIDADOR    VALUES    (  2, 'María',        'Fernández',    'Avenida Central 56',   '987654321', '2021-11-15', '' );
INSERT INTO CUIDADOR    VALUES    (  3, 'Pedro',        'Martínez',     'Calle Secundaria 89',  '654321987', '2022-03-05', '' );
INSERT INTO CUIDADOR    VALUES    (  4, 'Laura',        'Sánchez',      'Calle Tranquila 23',   '456789012', '2022-02-20', '' );
INSERT INTO CUIDADOR    VALUES    (  5, 'Carlos',       'Rodríguez',    'Avenida Soleada 5',    '321098765', '2021-10-08', '' );
INSERT INTO CUIDADOR    VALUES    (  6, 'Ana',          'López',        'Calle Sombría 89',     '789012345', '2022-04-18', '' );
INSERT INTO CUIDADOR    VALUES    (  7, 'Miguel',       'Torres',       'Avenida Céntrica 12',  '210987654', '2021-12-25', '' );
INSERT INTO CUIDADOR    VALUES    (  8, 'Isabel',       'García',       'Calle Serena 58',      '876543210', '2022-01-30', '' );
INSERT INTO CUIDADOR    VALUES    (  9, 'Fernando',     'Hernández',    'Avenida Tranquila 92', '543210987', '2022-05-12', '' );
INSERT INTO CUIDADOR    VALUES    ( 10, 'Carmen',       'Díaz',         'Calle Principal 36',   '109876543', '2021-09-03', '' );
INSERT INTO CUIDADOR    VALUES    ( 11, 'Javier',       'Pérez',        'Avenida Central 70',   '234567890', '2022-06-08', '' );
INSERT INTO CUIDADOR    VALUES    ( 12, 'Sara',         'Gutiérrez',    'Calle Soleada 15',     '678901234', '2021-08-17', '' );
INSERT INTO CUIDADOR    VALUES    ( 13, 'Alejandro',    'Ruiz',         'Avenida Secundaria 6', '123456789', '2022-07-22', '' );
INSERT INTO CUIDADOR    VALUES    ( 14, 'Elena',        'Molina',       'Calle Serena 14',      '567890123', '2021-07-01', '' );
INSERT INTO CUIDADOR    VALUES    ( 15, 'Raúl',         'Santos',       'Avenida Principal 56', '890123456', '2022-08-31', '' );
INSERT INTO CUIDADOR    VALUES    ( 16, 'Patricia',     'Ortega',       'Calle Tranquila 23',   '234567890', '2021-06-14', '' );
INSERT INTO CUIDADOR    VALUES    ( 17, 'Francisco',    'Flores',       'Avenida Céntrica 7',   '678901234', '2022-09-25', '' );
INSERT INTO CUIDADOR    VALUES    ( 18, 'Lucía',        'Vega',         'Calle Soleada 123',    '102345678', '2021-05-06', '' );
INSERT INTO CUIDADOR    VALUES    ( 19, 'Daniel',       'Castro',       'Avenida Central 84',   '456789012', '2022-10-18', '' );
INSERT INTO CUIDADOR    VALUES    ( 20, 'Natalia',      'Cabrera',      'Calle Principal 34',   '890123456', '2021-04-09', '' );
--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA ITINERARIO
--
--      idItinerario          valor numérico de 3 dígitos
--      NombreItinerario      cadena de texto de 50 caracteres, no nulo
--    	Guia                  valor numérico de 3 dígitos, clave foránea a la tabla GUIA
--      HoraInicio            tipo timestamp, no nulo
--      Duracion              valor numérico de 3 dígitos, no nulo
--      Longitud              valor numérico de 3 dígitos, no nulo
--      MaxVisitantes         valor numérico de 2 dígitos, no nulo
--      OtrosDatosItinerario  cadena de texto de 200 caracteres, opcional
--
--      Clave primaria          idItinerario
--		Clave foránea			Guia 			a la tabla GUIA
--------------------------------------------------------------------------------------------

	CREATE TABLE ITINERARIO (
		
        idItinerario				INT NOT NULL,
        NombreItinerario			VARCHAR(50) NOT NULL,
		Guia						INT NOT NULL,
        HoraInicio					TIME NOT NULL,
        Duracion					INT NOT NULL,
        Longitud					INT NOT NULL,
        MaxVisitantes				INT NOT NULL,
        OtrosDatosItinerario		VARCHAR(200) NULL,
        
        CONSTRAINT	PK_idItinerario		PRIMARY KEY ( idItinerario ),
        CONSTRAINT 	FK_Itinerario_Guia	FOREIGN KEY ( Guia ) REFERENCES GUIA ( idGuia )
	);

INSERT INTO ITINERARIO  VALUES  (  1, 'Itinerario  1',  1, '09:00:00', 2, 54, 30, '' );
INSERT INTO ITINERARIO  VALUES  (  2, 'Itinerario  2',  2, '10:30:00', 3, 82, 45, '' );
INSERT INTO ITINERARIO  VALUES  (  3, 'Itinerario  3',  3, '12:00:00', 1, 35, 20, '' );
INSERT INTO ITINERARIO  VALUES  (  4, 'Itinerario  4',  4, '14:00:00', 2, 68, 40, '' );
INSERT INTO ITINERARIO  VALUES  (  5, 'Itinerario  5', 10, '15:30:00', 1, 42, 25, '' );
INSERT INTO ITINERARIO  VALUES  (  6, 'Itinerario  6',  7, '17:00:00', 2, 75, 35, '' );
INSERT INTO ITINERARIO  VALUES  (  7, 'Itinerario  7',  8, '09:30:00', 2, 60, 30, '' );
INSERT INTO ITINERARIO  VALUES  (  8, 'Itinerario  8',  1, '11:00:00', 3, 91, 50, '' );
INSERT INTO ITINERARIO  VALUES  (  9, 'Itinerario  9',  2, '13:00:00', 1, 48, 25, '' );
INSERT INTO ITINERARIO  VALUES  ( 10, 'Itinerario 10',  5, '15:00:00', 2, 72, 40, '' );
INSERT INTO ITINERARIO  VALUES  ( 11, 'Itinerario 11',  6, '16:30:00', 1, 55, 30, '' );
INSERT INTO ITINERARIO  VALUES  ( 12, 'Itinerario 12',  7, '18:00:00', 2, 80, 45, '' );
INSERT INTO ITINERARIO  VALUES  ( 13, 'Itinerario 13',  2, '10:00:00', 1, 40, 20, '' );
INSERT INTO ITINERARIO  VALUES  ( 14, 'Itinerario 14',  6, '12:30:00', 3, 95, 55, '' );
INSERT INTO ITINERARIO  VALUES  ( 15, 'Itinerario 15', 10, '14:30:00', 2, 65, 35, '' );

--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA VIVE
--
--      id VIVE                valor numérico de 4 dígitos
--      ESPECIE               valor numérico de 4 dígitos, clave foránea a la tabla ESPECIE
--      HABITAT               valor numérico de 5 dígitos, clave foránea a la tabla HABITAT
--      Peligrosidad          valor numérico de 2 dígitos, no nulo
--      OtrosDatos VIVE        cadena de texto de 200 caracteres
--
--      Clave primaria          id VIVE
--		Clave foránea		Especie		a la tabla ESPECIE
--		Clave foránea		 HABITAT		a la tabla HABITAT
--------------------------------------------------------------------------------------------

	CREATE TABLE VIVE (
    
		idVive						INT NOT NULL,
        Especie						INT NOT NULL,
        Habitat						INT NOT NULL,
        Peligrosidad				INT NOT NULL,
        OtrosDatosVive				VARCHAR(200) NULL,
    
		CONSTRAINT PK_idVive			PRIMARY KEY ( idVive ),
		CONSTRAINT FK_Vive_Especie		FOREIGN KEY ( Especie ) REFERENCES ESPECIE ( idEspecie ),
		CONSTRAINT FK_Vive_Habitat		FOREIGN KEY ( Habitat ) REFERENCES HABITAT ( idHabitat )
    
    );

INSERT INTO VIVE    VALUES  (   1,  1,  5, 3, '' );
INSERT INTO VIVE    VALUES  (   2,  2,  7, 1, '' );
INSERT INTO VIVE    VALUES  (   3,  3,  2, 5, '' );
INSERT INTO VIVE    VALUES  (   4,  4,  1, 7, '' );
INSERT INTO VIVE    VALUES  (   5,  5,  9, 8, '' );
INSERT INTO VIVE    VALUES  (   6,  6, 10, 2, '' );
INSERT INTO VIVE    VALUES  (   7,  7,  8, 3, '' );
INSERT INTO VIVE    VALUES  (   8,  8,  3, 1, '' );
INSERT INTO VIVE    VALUES  (   9,  9,  4, 0, '' );
INSERT INTO VIVE    VALUES  (  10, 10,  6, 3, '' );
INSERT INTO VIVE    VALUES  (  11, 11,  1, 0, '' );
INSERT INTO VIVE    VALUES  (  12, 12,  2, 3, '' );
INSERT INTO VIVE    VALUES  (  13, 13,  3, 2, '' );
INSERT INTO VIVE    VALUES  (  14, 14,  4, 1, '' );
INSERT INTO VIVE    VALUES  (  15, 15,  5, 1, '' );
INSERT INTO VIVE    VALUES  (  16, 16,  6, 1, '' );
INSERT INTO VIVE    VALUES  (  17, 17,  7, 3, '' );
INSERT INTO VIVE    VALUES  (  18, 18,  8, 3, '' );
INSERT INTO VIVE    VALUES  (  19, 19,  9, 4, '' );
INSERT INTO VIVE    VALUES  (  20, 20, 10, 6, '' );
INSERT INTO VIVE    VALUES  (  21, 21, 11, 0, '' );
INSERT INTO VIVE    VALUES  (  22, 22, 12, 9, '' );
INSERT INTO VIVE    VALUES  (  23, 23, 13, 3, '' );
INSERT INTO VIVE    VALUES  (  24, 24, 14, 8, '' );
INSERT INTO VIVE    VALUES  (  25, 25, 15, 5, '' );
INSERT INTO VIVE    VALUES  (  26, 26,  6, 4, '' );
INSERT INTO VIVE    VALUES  (  27, 27,  4, 2, '' );
INSERT INTO VIVE    VALUES  (  28, 28, 10, 1, '' );
INSERT INTO VIVE    VALUES  (  29, 29, 11, 3, '' );
INSERT INTO VIVE    VALUES  (  30, 30, 10, 6, '' );
INSERT INTO VIVE    VALUES  (  31, 31,  1, 6, '' );
INSERT INTO VIVE    VALUES  (  32, 32,  2, 3, '' );
INSERT INTO VIVE    VALUES  (  33, 33,  3, 8, '' );
INSERT INTO VIVE    VALUES  (  34, 34,  4, 9, '' );
INSERT INTO VIVE    VALUES  (  35, 35,  5, 3, '' );
INSERT INTO VIVE    VALUES  (  36, 36,  6, 1, '' );
INSERT INTO VIVE    VALUES  (  37, 37,  7, 0, '' );
INSERT INTO VIVE    VALUES  (  38, 38,  8, 2, '' );
INSERT INTO VIVE    VALUES  (  39, 39,  9, 3, '' );
INSERT INTO VIVE    VALUES  (  40, 40, 10, 2, '' );
INSERT INTO VIVE    VALUES  (  41, 41, 11, 2, '' );
INSERT INTO VIVE    VALUES  (  42, 42, 12, 1, '' );
INSERT INTO VIVE    VALUES  (  43, 43, 13, 7, '' );
INSERT INTO VIVE    VALUES  (  44, 44, 14, 5, '' );
INSERT INTO VIVE    VALUES  (  45, 45, 15, 3, '' );
INSERT INTO VIVE    VALUES  (  46,  1,  6, 9, '' );
INSERT INTO VIVE    VALUES  (  47,  2,  8, 8, '' );
INSERT INTO VIVE    VALUES  (  48,  3,  6, 8, '' );
INSERT INTO VIVE    VALUES  (  49,  4,  6, 7, '' );
INSERT INTO VIVE    VALUES  (  50,  5,  2, 3, '' );
INSERT INTO VIVE    VALUES  (  51,  6,  1, 2, '' );
INSERT INTO VIVE    VALUES  (  52,  7,  2, 3, '' );
INSERT INTO VIVE    VALUES  (  53,  8,  8, 1, '' );
INSERT INTO VIVE    VALUES  (  54, 13,  4, 1, '' );
INSERT INTO VIVE    VALUES  (  55, 10,  5, 1, '' );
INSERT INTO VIVE    VALUES  (  56, 11,  6, 2, '' );
INSERT INTO VIVE    VALUES  (  57, 12,  7, 9, '' );
INSERT INTO VIVE    VALUES  (  58, 13,  8, 9, '' );
INSERT INTO VIVE    VALUES  (  59, 14,  9, 0, '' );
INSERT INTO VIVE    VALUES  (  60, 15, 10, 1, '' );
INSERT INTO VIVE    VALUES  (  61, 16, 11, 3, '' );
INSERT INTO VIVE    VALUES  (  62, 17, 12, 4, '' );
INSERT INTO VIVE    VALUES  (  63, 18, 13, 5, '' );
INSERT INTO VIVE    VALUES  (  64, 19, 14, 5, '' );
INSERT INTO VIVE    VALUES  (  65, 20, 15, 5, '' );
INSERT INTO VIVE    VALUES  (  66, 21,  2, 3, '' );
INSERT INTO VIVE    VALUES  (  67, 22,  1, 7, '' );
INSERT INTO VIVE    VALUES  (  68, 23,  7, 7, '' );
INSERT INTO VIVE    VALUES  (  69, 24,  9, 3, '' );
INSERT INTO VIVE    VALUES  (  70, 25,  2, 7, '' );
INSERT INTO VIVE    VALUES  (  71, 26,  1, 6, '' );
INSERT INTO VIVE    VALUES  (  72, 27,  2, 5, '' );
INSERT INTO VIVE    VALUES  (  73, 28,  3, 8, '' );
INSERT INTO VIVE    VALUES  (  74, 29,  4, 9, '' );
INSERT INTO VIVE    VALUES  (  75, 30,  5, 2, '' );
INSERT INTO VIVE    VALUES  (  76, 31,  6, 2, '' );
INSERT INTO VIVE    VALUES  (  77, 32,  7, 1, '' );
INSERT INTO VIVE    VALUES  (  78, 33,  8, 1, '' );
INSERT INTO VIVE    VALUES  (  79, 34,  9, 3, '' );
INSERT INTO VIVE    VALUES  (  80, 35, 10, 4, '' );
INSERT INTO VIVE    VALUES  (  81, 36, 11, 5, '' );
INSERT INTO VIVE    VALUES  (  82, 37, 12, 7, '' );
INSERT INTO VIVE    VALUES  (  83, 38, 13, 6, '' );
INSERT INTO VIVE    VALUES  (  84, 39, 14, 8, '' );
INSERT INTO VIVE    VALUES  (  85, 40, 15, 5, '' );
INSERT INTO VIVE    VALUES  (  86, 41, 13, 3, '' );
INSERT INTO VIVE    VALUES  (  87, 42, 14, 3, '' );
INSERT INTO VIVE    VALUES  (  88, 43, 10, 4, '' );
INSERT INTO VIVE    VALUES  (  89, 44,  2, 5, '' );
INSERT INTO VIVE    VALUES  (  90, 45,  5, 5, '' );
INSERT INTO VIVE    VALUES  (  91,  1,  9, 7, '' );
INSERT INTO VIVE    VALUES  (  92,  2, 15, 2, '' );
INSERT INTO VIVE    VALUES  (  93,  3, 13, 2, '' );
INSERT INTO VIVE    VALUES  (  94,  4,  8, 1, '' );
INSERT INTO VIVE    VALUES  (  95,  5,  7, 1, '' );
INSERT INTO VIVE    VALUES  (  96,  6,  2, 1, '' );
INSERT INTO VIVE    VALUES  (  97,  7,  6, 0, '' );
INSERT INTO VIVE    VALUES  (  98,  8, 11, 0, '' );
INSERT INTO VIVE    VALUES  (  99,  9, 15, 9, '' );
INSERT INTO VIVE    VALUES  ( 100, 10, 13, 3, '' );
--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA ATIENDE
--
--      idATIENDE             valor numérico de 8 dígitos
--      ESPECIE               valor numérico de 4 dígitos, clave foránea a la tabla ESPECIE
--      CUIDADOR              valor numérico de 3 dígitos, clave foránea a la tabla CUIDADOR
--      Fecha                 tipo fecha, no nulo
--      Incidencia            cadena de texto de 200 caracteres, no nulo
--      OtrosDatosAtencion    cadena de texto de 200 caracteres
--
--      Clave primaria          idATIENDE
--		Clave foránea		Especie		a la tabla ESPECIE
--		Clave foránea		Cuidador	a la tabla CUIDADOR
--------------------------------------------------------------------------------------------

	CREATE TABLE ATIENDE (
    
		idAtiende					INT NOT NULL,
        Especie						INT NOT NULL,
        Cuidador					INT NOT NULL,
        Fecha						DATE NOT NULL,
        Incidencia					VARCHAR(200) NOT NULL,
        OtrosDatosAtencion			VARCHAR(200) NULL,
    
		CONSTRAINT PK_idAtiende		PRIMARY KEY ( idAtiende ),
        CONSTRAINT FK_ATIENDE_Especie			FOREIGN KEY ( Especie ) REFERENCES ESPECIE ( idEspecie ),
        CONSTRAINT FK_ATIENDE_Cuidador			FOREIGN KEY ( Cuidador ) REFERENCES CUIDADOR ( idCuidador )
        
	);

INSERT INTO ATIENDE VALUES (  1,  3,  7, '2021-02-10', 'Revisión general', '' );
INSERT INTO ATIENDE VALUES (  2,  5, 12, '2021-03-22', 'Herida leve en ala', '' );
INSERT INTO ATIENDE VALUES (  3,  8,  4, '2021-05-04', 'Vacunación antirrábica', '' );
INSERT INTO ATIENDE VALUES (  4,  2,  1, '2021-06-15', 'Desparasitación interna', '' );
INSERT INTO ATIENDE VALUES (  5, 10, 18, '2021-07-19', 'Tratamiento ocular', '' );
INSERT INTO ATIENDE VALUES (  6,  7,  5, '2021-08-02', 'Parto asistido', '' );
INSERT INTO ATIENDE VALUES (  7, 12,  9, '2021-09-10', 'Herida en pata trasera', '' );
INSERT INTO ATIENDE VALUES (  8,  4, 14, '2021-10-21', 'Revisión dental', '' );
INSERT INTO ATIENDE VALUES (  9, 15,  2, '2021-11-03', 'Revisión general', '' );
INSERT INTO ATIENDE VALUES ( 10, 18,  3, '2021-12-12', 'Vacunación refuerzo', '' );
INSERT INTO ATIENDE VALUES ( 11, 20,  6, '2022-01-08', 'Herida en cola', '' );
INSERT INTO ATIENDE VALUES ( 12, 22, 15, '2022-02-20', 'Desparasitación externa', '' );
INSERT INTO ATIENDE VALUES ( 13, 24, 11, '2022-03-18', 'Revisión general', '' );
INSERT INTO ATIENDE VALUES ( 14, 26,  7, '2022-04-22', 'Vacunación antirrábica', '' );
INSERT INTO ATIENDE VALUES ( 15, 28, 13, '2022-05-19', 'Parto asistido', '' );
INSERT INTO ATIENDE VALUES ( 16, 30,  8, '2022-06-10', 'Herida en oreja derecha', '' );
INSERT INTO ATIENDE VALUES ( 17, 32, 19, '2022-07-01', 'Revisión dental', '' );
INSERT INTO ATIENDE VALUES ( 18, 34,  2, '2022-07-25', 'Revisión general', '' );
INSERT INTO ATIENDE VALUES ( 19, 36, 16, '2022-08-13', 'Tratamiento cutáneo', '' );
INSERT INTO ATIENDE VALUES ( 20, 38,  3, '2022-09-07', 'Desparasitación', '' );
INSERT INTO ATIENDE VALUES ( 21, 40, 17, '2022-10-01', 'Vacunación anual', '' );
INSERT INTO ATIENDE VALUES ( 22, 42, 10, '2022-10-29', 'Revisión de peso', '' );
INSERT INTO ATIENDE VALUES ( 23, 43,  4, '2022-11-20', 'Herida leve en cuello', '' );
INSERT INTO ATIENDE VALUES ( 24,  1, 14, '2022-12-12', 'Tratamiento ocular', '' );
INSERT INTO ATIENDE VALUES ( 25,  6,  1, '2023-01-15', 'Revisión general', '' );
INSERT INTO ATIENDE VALUES ( 26,  9, 12, '2023-02-10', 'Parto asistido', '' );
INSERT INTO ATIENDE VALUES ( 27, 11,  5, '2023-03-06', 'Vacunación refuerzo', '' );
INSERT INTO ATIENDE VALUES ( 28, 13,  9, '2023-04-01', 'Desparasitación interna', '' );
INSERT INTO ATIENDE VALUES ( 29, 16, 11, '2023-04-28', 'Herida leve en pata delantera', '' );
INSERT INTO ATIENDE VALUES ( 30, 19,  8, '2023-05-23', 'Tratamiento cutáneo', '' );
INSERT INTO ATIENDE VALUES ( 31, 21,  6, '2023-06-19', 'Revisión dental', '' );
INSERT INTO ATIENDE VALUES ( 32, 23,  2, '2023-07-10', 'Vacunación antirrábica', '' );
INSERT INTO ATIENDE VALUES ( 33, 25, 17, '2023-08-14', 'Revisión general', '' );
INSERT INTO ATIENDE VALUES ( 34, 27, 15, '2023-09-09', 'Quemadura leve tratada', '' );
INSERT INTO ATIENDE VALUES ( 35, 29, 19, '2023-10-05', 'Tratamiento ocular', '' );
INSERT INTO ATIENDE VALUES ( 36, 31,  4, '2023-11-02', 'Revisión general', '' );
INSERT INTO ATIENDE VALUES ( 37, 33, 13, '2023-12-07', 'Herida superficial', '' );
INSERT INTO ATIENDE VALUES ( 38, 35, 10, '2024-01-20', 'Desparasitación', '' );
INSERT INTO ATIENDE VALUES ( 39, 37, 11, '2024-02-15', 'Vacunación refuerzo', '' );
INSERT INTO ATIENDE VALUES ( 40, 39, 14, '2024-03-09', 'Tratamiento cutáneo', '' );
INSERT INTO ATIENDE VALUES ( 41, 41, 18, '2024-04-10', 'Revisión general', '' );
INSERT INTO ATIENDE VALUES ( 42, 44,  7, '2024-05-14', 'Parto asistido', '' );
INSERT INTO ATIENDE VALUES ( 43, 45,  3, '2024-06-06', 'Herida en costado', '' );
INSERT INTO ATIENDE VALUES ( 44, 17,  5, '2024-07-03', 'Vacunación anual', '' );
INSERT INTO ATIENDE VALUES ( 45, 14, 16, '2024-08-01', 'Revisión general', '' );
INSERT INTO ATIENDE VALUES ( 46,  9,  9, '2024-09-05', 'Tratamiento ocular', '' );
INSERT INTO ATIENDE VALUES ( 47,  3, 20, '2024-10-02', 'Herida en cola', '' );
INSERT INTO ATIENDE VALUES ( 48,  5,  2, '2025-02-12', 'Desparasitación interna', '' );
INSERT INTO ATIENDE VALUES ( 49,  8,  8, '2025-05-09', 'Revisión general', '' );
INSERT INTO ATIENDE VALUES ( 50, 12, 15, '2025-07-14', 'Tratamiento cutáneo', '' );
INSERT INTO ATIENDE VALUES ( 51, 20,  6, '2025-09-28', 'Vacunación refuerzo', '' );
--------------------------------------------------------------------------------------------
--	CREACIÓN DE LA TABLA RECORRE
--
--      idRECORRE             valor numérico de 3 dígitos
--      ITINERARIO            valor numérico de 3 dígitos, clave foránea a la tabla ITINERARIO
--      HABITAT               valor numérico de 5 dígitos, clave foránea a la tabla HABITAT
--      Fecha                 tipo fecha, no nulo
--      Incidencias           cadena de texto de 200 caracteres
--      OtrosDatosRECORRE     cadena de texto de 200 caracteres
--
--      Clave primaria          idRECORRE
--		Clave foránea		Itinerario	a la tabla ITINERARIO
--		Clave foránea		 Habitat	a la tabla HABITAT
--------------------------------------------------------------------------------------------

	CREATE TABLE RECORRE (
    
		idRecorre					INT NOT NULL,
        Itinerario					INT NOT NULL,
        Habitat						INT NOT NULL,
        Fecha						DATE NOT NULL,
        Incidencias					VARCHAR(200) NULL,
        OtrosDatosRecorre			VARCHAR(200) NULL,
    
		CONSTRAINT PK_idRecorre				PRIMARY KEY ( idRecorre ),
		CONSTRAINT FK_Recorre_Itinerario	FOREIGN KEY ( Itinerario ) REFERENCES ITINERARIO ( idItinerario ),
		CONSTRAINT FK_Recorre_Habitat		FOREIGN KEY ( Habitat ) REFERENCES HABITAT ( idHabitat )
        
	);

INSERT INTO RECORRE VALUES (  1,  1,  5, '2021-03-10', '', '' );
INSERT INTO RECORRE VALUES (  2,  1,  8, '2021-04-15', 'Retraso por lluvia', '' );
INSERT INTO RECORRE VALUES (  3,  2,  3, '2021-05-01', '', '' );
INSERT INTO RECORRE VALUES (  4,  2,  7, '2021-06-09', 'Animal fuera de vista del guía', '' );
INSERT INTO RECORRE VALUES (  5,  3,  2, '2021-07-14', '', '' );
INSERT INTO RECORRE VALUES (  6,  3, 10, '2021-08-11', '', '' );
INSERT INTO RECORRE VALUES (  7,  4,  9, '2021-09-18', 'Reparación en valla del hábitat', '' );
INSERT INTO RECORRE VALUES (  8,  4,  6, '2021-10-23', '', '' );
INSERT INTO RECORRE VALUES (  9,  5, 11, '2021-11-07', '', '' );
INSERT INTO RECORRE VALUES ( 10,  5,  4, '2021-12-05', 'Visita reducida por lluvia', '' );
INSERT INTO RECORRE VALUES ( 11,  6,  1, '2022-01-09', '', '' );
INSERT INTO RECORRE VALUES ( 12,  6, 12, '2022-02-14', '', '' );
INSERT INTO RECORRE VALUES ( 13,  7, 13, '2022-03-02', 'Fuga temporal de un ave', '' );
INSERT INTO RECORRE VALUES ( 14,  7, 15, '2022-04-18', '', '' );
INSERT INTO RECORRE VALUES ( 15,  8,  2, '2022-05-03', '', '' );
INSERT INTO RECORRE VALUES ( 16,  8,  5, '2022-05-25', 'Pequeño incidente con visitante', '' );
INSERT INTO RECORRE VALUES ( 17,  9,  7, '2022-06-15', '', '' );
INSERT INTO RECORRE VALUES ( 18,  9, 10, '2022-07-07', '', '' );
INSERT INTO RECORRE VALUES ( 19, 10,  4, '2022-08-11', 'Animal en tratamiento, hábitat cerrado', '' );
INSERT INTO RECORRE VALUES ( 20, 10,  9, '2022-09-06', '', '' );
INSERT INTO RECORRE VALUES ( 21, 11, 11, '2022-10-01', '', '' );
INSERT INTO RECORRE VALUES ( 22, 11, 14, '2022-10-28', '', '' );
INSERT INTO RECORRE VALUES ( 23, 12,  1, '2022-11-25', 'Revisión del circuito por mantenimiento', '' );
INSERT INTO RECORRE VALUES ( 24, 12,  3, '2022-12-20', '', '' );
INSERT INTO RECORRE VALUES ( 25, 13,  2, '2023-01-10', '', '' );
INSERT INTO RECORRE VALUES ( 26, 13,  6, '2023-02-09', 'Avería de micrófono del guía', '' );
INSERT INTO RECORRE VALUES ( 27, 14, 12, '2023-03-12', '', '' );
INSERT INTO RECORRE VALUES ( 28, 14,  8, '2023-04-06', '', '' );
INSERT INTO RECORRE VALUES ( 29, 15, 15, '2023-05-01', 'Cierre anticipado por tormenta', '' );
INSERT INTO RECORRE VALUES ( 30, 15, 13, '2023-06-10', '', '' );
INSERT INTO RECORRE VALUES ( 31,  1,  4, '2023-07-15', '', '' );
INSERT INTO RECORRE VALUES ( 32,  2,  5, '2023-08-11', '', '' );
INSERT INTO RECORRE VALUES ( 33,  3,  6, '2023-09-05', 'Fallo en megafonía del recorrido', '' );
INSERT INTO RECORRE VALUES ( 34,  4,  9, '2023-10-09', '', '' );
INSERT INTO RECORRE VALUES ( 35,  5, 11, '2023-11-12', '', '' );
INSERT INTO RECORRE VALUES ( 36,  6,  2, '2024-01-10', 'Animal escondido durante visita', '' );
INSERT INTO RECORRE VALUES ( 37,  7,  7, '2024-02-16', '', '' );
INSERT INTO RECORRE VALUES ( 38,  8,  8, '2024-03-11', '', '' );
INSERT INTO RECORRE VALUES ( 39,  9,  5, '2024-04-09', 'Revisión de seguridad del hábitat', '' );
INSERT INTO RECORRE VALUES ( 40, 10, 10, '2024-05-06', '', '' );
INSERT INTO RECORRE VALUES ( 41, 11, 14, '2024-06-03', '', '' );
INSERT INTO RECORRE VALUES ( 42, 12, 15, '2024-07-01', '', '' );
INSERT INTO RECORRE VALUES ( 43, 13,  9, '2024-07-29', 'Retraso por grupo escolar grande', '' );
INSERT INTO RECORRE VALUES ( 44, 14,  6, '2024-08-20', '', '' );
INSERT INTO RECORRE VALUES ( 45, 15, 11, '2024-09-14', '', '' );
INSERT INTO RECORRE VALUES ( 46,  1,  3, '2025-01-15', '', '' );
INSERT INTO RECORRE VALUES ( 47,  2, 10, '2025-02-08', 'Fallo de micrófono del guía', '' );
INSERT INTO RECORRE VALUES ( 48,  3,  4, '2025-03-11', '', '' );
INSERT INTO RECORRE VALUES ( 49,  4,  7, '2025-04-19', '', '' );
INSERT INTO RECORRE VALUES ( 50,  5, 12, '2025-05-22', '', '' );    

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
