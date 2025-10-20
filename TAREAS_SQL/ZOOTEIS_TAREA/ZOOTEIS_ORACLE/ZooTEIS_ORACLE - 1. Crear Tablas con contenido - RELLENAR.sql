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


INSERT INTO Especie     VALUES    (  1, 'Panthera leo',             'Le�n',                         'El le�n es un mam�fero carn�voro de la familia de los felinos. Vive en manadas y es conocido por su melena.',                                                          12,  190, '' );
INSERT INTO Especie     VALUES    (  2, 'Elephas maximus',          'Elefante Asi�tico',            'El elefante asi�tico es el mam�fero terrestre m�s grande de Asia. Es conocido por sus grandes orejas y trompa.',                                                       60, 5000, '' );
INSERT INTO Especie     VALUES    (  3, 'Vulpes vulpes',            'Zorro Rojo',                   'El zorro rojo es un mam�fero carn�voro de la familia Canidae. Tiene un pelaje rojizo y una cola esponjosa.',                                                            5,    7, '' );
INSERT INTO Especie     VALUES    (  4, 'Phyllobates terribilis',   'Rana Flecha Dorada',           'La rana flecha dorada es conocida por su brillante color dorado y su toxicidad. Habita en la selva amaz�nica.',                                                         3, 0.02, '' );
INSERT INTO Especie     VALUES    (  5, 'Giraffa camelopardalis',   'Jirafa',                       'La jirafa es un mam�fero artiod�ctilo de cuello largo. Es conocida por su distintivo patr�n de manchas en la piel.',                                                   25,  900, '' );
INSERT INTO Especie     VALUES    (  6, 'Canis lupus',              'Lobo Gris',                    'El lobo gris es un carn�voro salvaje que vive en manadas. Tiene un papel importante en muchas culturas.',                                                               8,   40, '' );
INSERT INTO Especie     VALUES    (  7, 'Pongo pygmaeus',           'Orangut�n',                    'El orangut�n es un simio que habita en las selvas de Borneo y Sumatra. Son conocidos por su inteligencia y habilidades de herramientas.',                              30,   80, '' );
INSERT INTO Especie     VALUES    (  8, 'Panthera tigris',          'Tigre',                        'El tigre es el felino m�s grande del mundo. Tiene un pelaje anaranjado con rayas negras y es un depredador solitario.',                                                15,  300, '' );
INSERT INTO Especie     VALUES    (  9, 'Gorilla gorilla',          'Gorila de Monta�a',            'El gorila de monta�a es una especie de primate que habita en las monta�as de �frica Central. Son los primates m�s grandes del mundo.',                                 35,  180, '' );
INSERT INTO Especie     VALUES    ( 10, 'Puma concolor',            'Puma',                         'El puma es un felino nativo de Am�rica. Tambi�n se le conoce como le�n de monta�a o le�n de Am�rica.',                                                                 12,   70, '' );
INSERT INTO Especie     VALUES    ( 11, 'Dendrobates azureus',      'Rana Flecha Azul',             'La rana flecha azul es conocida por su llamativo color azul. Es nativa de las selvas tropicales de Am�rica del Sur.',                                                   5, 0.03, '' );
INSERT INTO Especie     VALUES    ( 12, 'Ailuropoda melanoleuca',   'Panda Gigante',                'El panda gigante es un oso nativo de China. Se alimenta principalmente de bamb� y es conocido por su pelaje blanco y negro.',                                          20,  120, '' );
INSERT INTO Especie     VALUES    ( 13, 'Hippopotamus amphibius',   'Hipop�tamo',                   'El hipop�tamo es un gran mam�fero herb�voro semiacu�tico nativo de �frica. Es conocido por su tama�o y agresividad.',                                                  40, 1500, '' );
INSERT INTO Especie     VALUES    ( 14, 'Dromaius novaehollandiae', 'Em�',                          'El em� es un ave nativa de Australia. Es el ave no voladora m�s grande y conocido por su velocidad al correr.',                                                        10,   45, '' );
INSERT INTO Especie     VALUES    ( 15, 'Vombatus ursinus',         'Wombat Com�n',                 'El wombat com�n es un marsupial nativo de Australia. Es conocido por su apariencia robusta y comportamiento excavador.',                                               15,   35, '' );
INSERT INTO Especie     VALUES    ( 16, 'Ceratotherium simum',      'Rinoceronte Blanco',           'El rinoceronte blanco es un gran mam�fero herb�voro con un cuerno distintivo en su nariz. Es originario de �frica.',                                                   40, 2300, '' );
INSERT INTO Especie     VALUES    ( 17, 'Macropus rufus',           'Canguro Rojo',                 'El canguro rojo es el marsupial m�s grande y es nativo de Australia. Es conocido por su saltos largos y poderosas patas traseras.',                                     6,   85, '' );
INSERT INTO Especie     VALUES    ( 18, 'Cygnus atratus',           'Cisne Negro',                  'El cisne negro es un ave acu�tica nativa de Australia. Es conocido por su plumaje negro y cuello largo.',                                                              15,    8, '' );
INSERT INTO Especie     VALUES    ( 19, 'Felis catus',              'Gato Dom�stico',               'El gato dom�stico es un peque�o mam�fero carn�voro que ha sido domesticado como mascota. Viene en diversas razas y colores.',                                          15,    4, '' );
INSERT INTO Especie     VALUES    ( 20, 'Haliaeetus leucocephalus', '�guila Calva',                 'El �guila calva es un ave rapaz nativa de Am�rica del Norte. Es conocida por su cabeza blanca y fuertes garras.',                                                      20,    6, '' );
INSERT INTO Especie     VALUES    ( 21, 'Ara ararauna',             'Guacamayo Azul y Amarillo',    'El guacamayo azul y amarillo es una especie de loro colorido nativo de Am�rica del Sur. Es conocido por sus plumas brillantes.',                                       50,    1, '' );
INSERT INTO Especie     VALUES    ( 22, 'Orcinus orca',             'Orca',                         'La orca, tambi�n conocida como ballena asesina, es un mam�fero marino inteligente y depredador. Es conocida por su coloraci�n distintiva y comportamiento social.',    50, 9000, '' );
INSERT INTO Especie     VALUES    ( 23, 'Hylobates lar',            'Gib�n',                        'El gib�n es un primate nativo del sudeste asi�tico. Se caracteriza por su canto mel�dico y su habilidad para moverse r�pidamente entre los �rboles.',                  25,    7, '' );
INSERT INTO Especie     VALUES    ( 24, 'Pan troglodytes',          'Chimpanc�',                    'El chimpanc� es un gran simio que habita en las selvas de �frica. Es conocido por su inteligencia y comportamiento social complejo.',                                  40,   70, '' );
INSERT INTO Especie     VALUES    ( 25, 'Camelus dromedarius',      'Camello',                      'El camello es un mam�fero herb�voro adaptado a vivir en regiones des�rticas. Es conocido por su capacidad para almacenar agua en su joroba.',                          25,  600, '' );
INSERT INTO Especie     VALUES    ( 26, 'Equus zebra',              'Cebra',                        'La cebra es un mam�fero herb�voro de �frica conocido por sus rayas blancas y negras. Es un miembro de la familia de los �quidos.',                                     25,  400, '' );
INSERT INTO Especie     VALUES    ( 27, 'Lynx pardinus',            'Lince Ib�rico',                'El lince ib�rico es un felino en peligro cr�tico de extinci�n. Habita en la pen�nsula ib�rica y se caracteriza por sus manchas en el pelaje.',                         10,   15, '' );
INSERT INTO Especie     VALUES    ( 28, 'Panthera pardus',          'Leopardo',                     'El leopardo es un gran felino que se encuentra en diversas regiones de �frica y Asia. Es conocido por su agilidad y habilidad para trepar �rboles.',                   12,   60, '' );
INSERT INTO Especie     VALUES    ( 29, 'Eudyptula minor',          'Ping�ino Azul',                'El ping�ino azul es una especie de ping�ino peque�o que habita en las costas de Australia y Nueva Zelanda. Tiene un plumaje azul y blanco.',                            7,    1, '' );
INSERT INTO Especie     VALUES    ( 30, 'Oryx gazella',             '�rix',                         'El �rix es un ant�lope que vive en regiones des�rticas de �frica. Tiene cuernos largos y rectos, adaptados para la supervivencia en ambientes secos.',                 15,  200, '' );
INSERT INTO Especie     VALUES    ( 31, 'Panthera onca',            'Jaguar',                       'El jaguar es un felino grande que habita en las selvas de Am�rica. Es conocido por su fuerza y es el tercer felino m�s grande del mundo.',                             12,  100, '' );
INSERT INTO Especie     VALUES    ( 32, 'Canis simensis',           'Lobo Et�ope',                  'El lobo et�ope es un lobo salvaje end�mico de las monta�as de Etiop�a. Es el lobo m�s raro y en peligro cr�tico de extinci�n.',                                         8,   20, '' );
INSERT INTO Especie     VALUES    ( 33, 'Acinonyx jubatus',         'Guepardo',                     'El guepardo es un felino r�pido y �gil que se encuentra en las sabanas africanas. Es el animal terrestre m�s r�pido y se distingue por sus manchas.',                  10,   65, '' );
INSERT INTO Especie     VALUES    ( 34, 'Pseudoryx nghetinhensis',  'Saola',                        'El saola es un bovino raro que habita en la regi�n monta�osa entre Vietnam y Laos. Es conocido como el "unicornio asi�tico" debido a sus cuernos largos y delgados.',  15,  300, '' );
INSERT INTO Especie     VALUES    ( 35, 'Ailurus fulgens',          'Mapache Rojo',                 'El mapache rojo es un mam�fero peque�o que habita en el sureste asi�tico. Se caracteriza por su pelaje rojizo y anillos alrededor de la cola.',                         8,    5, '' );
INSERT INTO Especie     VALUES    ( 36, 'Crocodylus porosus',       'Cocodrilo de Agua Salada',     'El cocodrilo de agua salada es el cocodrilo m�s grande y agresivo. Se encuentra en zonas de agua salada en el sudeste asi�tico y Australia.',                          70, 1000, '' );
INSERT INTO Especie     VALUES    ( 37, 'Chelonia mydas',           'Tortuga Verde',                'La tortuga verde es una tortuga marina que se encuentra en oc�anos tropicales y subtropicales. Es conocida por su caparaz�n en forma de coraz�n.',                     80,  200, '' );
INSERT INTO Especie     VALUES    ( 38, 'Phocoena phocoena',        'Marsopa Com�n',                'La marsopa com�n es un peque�o cet�ceo que habita en aguas fr�as y templadas. Se encuentra en el Atl�ntico y el Pac�fico norte.',                                      15,   70, '' );
INSERT INTO Especie     VALUES    ( 39, 'Melursus ursinus',         'Oso Labiado',                  'El oso labiado es un oso de pelaje negro y labios blancos. Se encuentra en el subcontinente indio y es conocido por su dieta de insectos.',                            25,  140, '' );
INSERT INTO Especie     VALUES    ( 40, 'Carcharodon carcharias',   'Gran Tibur�n Blanco',          'El gran tibur�n blanco es uno de los mayores depredadores marinos. Se encuentra en aguas costeras de todo el mundo y es conocido por su tama�o y ferocidad.',          70, 2000, '' );
INSERT INTO Especie     VALUES    ( 41, 'Echidna',                  'Equidna',                      'El equidna es un mam�fero monotremado que se encuentra en Australia y Nueva Guinea. Es conocido por sus espinas y su lengua pegajosa para atrapar insectos.',          15,    5, '' );
INSERT INTO Especie     VALUES    ( 42, 'Glaucidium perlatum',      'Mochuelo Perlado',             'El mochuelo perlado es una especie de b�ho peque�o que se encuentra en Am�rica Central y Am�rica del Sur. Tiene un plumaje con manchas perladas.',                      5,  0.2, '' );
INSERT INTO Especie     VALUES    ( 43, 'Harpia harpyja',           '�guila Harp�a',                'El �guila harp�a es una de las aves de presa m�s grandes del mundo. Se encuentra en las selvas tropicales de Am�rica del Sur y es conocida por su tama�o imponente.',  25,    9, '' );
INSERT INTO Especie     VALUES    ( 44, 'Manis javanica',           'Pangol�n de Java',             'El pangol�n de Java es una especie de pangol�n que se encuentra en Indonesia y Malasia. Es conocido por sus escamas y su capacidad para enrollarse en una bola.',      20,    8, '' );
INSERT INTO Especie     VALUES    ( 45, 'Ursus arctos horribilis',  'Oso Grizzly',                  'El oso grizzly es una subespecie del oso pardo que se encuentra en Norteam�rica. Es conocido por su gran tama�o y fuerza.',                                            25,  400, '' );

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


INSERT INTO Habitat     VALUES (  1, 'Selva Tropical',      'Densa',    'Tropical', 'Continentes: Am�rica, �frica y Asia' );
INSERT INTO Habitat     VALUES (  2, 'Desierto',            'Escasa',   '�rtido',   'Continentes: Am�rica y �frica' );
INSERT INTO Habitat     VALUES (  3, 'Sabana',              'Media',    'Tropical', 'Continente: �frica' );
INSERT INTO Habitat     VALUES (  4, 'Tundra',              'Baja',     'Fr�o',     'Continentes: Europa, Asia y Norteam�rica' );
INSERT INTO Habitat     VALUES (  5, 'Bosque templado',     'Media',    'Templado', 'Continentes: Europa y Asia' );
INSERT INTO Habitat     VALUES (  6, 'Manglar',             'Media',    'H�medo',   'Continente: Am�rica' );
INSERT INTO Habitat     VALUES (  7, 'Bosque Boreal',       'Densa',    'Fr�o',     'Continentes: Europa y Norteam�rica' );
INSERT INTO Habitat     VALUES (  8, 'Arrecife',            'Escasa',   'C�lido',   'Continente: Ocean�a' );
INSERT INTO Habitat     VALUES (  9, 'Humedal',             'Media',    'H�meda',   'Continentes: Am�rica y �frica' );
INSERT INTO Habitat     VALUES ( 10, 'Bosque de Con�feras', 'Densa',    'Fr�o',     'Continentes: Europa y Norteam�rica' );
INSERT INTO Habitat     VALUES ( 11, 'Pantano',             'Escasa',   'Templado', 'Continentes: Am�rica y Asia' );
INSERT INTO Habitat     VALUES ( 12, 'Monta�a',             'Escasa',   'Fr�o',     'Continentes: Europa, Asia y Norteam�rica' );
INSERT INTO Habitat     VALUES ( 13, 'Bosque de Niebla',    'Densa',    'H�medo',   'Continentes: Am�rica' );
INSERT INTO Habitat     VALUES ( 14, 'Taiga',               'Baja',     'Fr�o',     'Continentes: Europa y Norteam�rica' );
INSERT INTO Habitat     VALUES ( 15, 'Desierto de Altitud', 'Escasa',   'Fr�o',     'Continente: Am�rica' );

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


INSERT INTO Guia    VALUES    (  1, 'Luis',     'Mart�nez',     'Calle Principal 23',   '123456789', TO_DATE( '2021-12-01', 'YYYY-MM-DD' ), '' );
INSERT INTO Guia    VALUES    (  2, 'Cristina', 'G�mez',        'Avenida Central 51',   '987654321', TO_DATE( '2022-01-15', 'YYYY-MM-DD' ), '' );
INSERT INTO Guia    VALUES    (  3, 'Roberto',  'Fern�ndez',    'Calle Secundaria 7',   '654321987', TO_DATE( '2021-11-05', 'YYYY-MM-DD' ), '' );
INSERT INTO Guia    VALUES    (  4, 'Isabel',   'S�nchez',      'Avenida Soleada 23',   '456789012', TO_DATE( '2022-02-20', 'YYYY-MM-DD' ), '' );
INSERT INTO Guia    VALUES    (  5, 'Pablo',    'Rodr�guez',    'Calle Tranquila 7',    '321098765', TO_DATE( '2021-10-08', 'YYYY-MM-DD' ), '' );
INSERT INTO Guia    VALUES    (  6, 'Laura',    'L�pez',        'Avenida C�ntrica 10',  '789012345', TO_DATE( '2022-04-18', 'YYYY-MM-DD' ), '' );
INSERT INTO Guia    VALUES    (  7, 'Sergio',   'Torres',       'Calle Serena 13',      '210987654', TO_DATE( '2021-09-25', 'YYYY-MM-DD' ), '' );
INSERT INTO Guia    VALUES    (  8, 'Elena',    'Garc�a',       'Avenida Tranquila 5',  '876543210', TO_DATE( '2022-05-12', 'YYYY-MM-DD' ), '' );
INSERT INTO Guia    VALUES    (  9, 'Juan',     'Hern�ndez',    'Calle Sombr�a 9',      '543210987', TO_DATE( '2021-08-03', 'YYYY-MM-DD' ), '' );
INSERT INTO Guia    VALUES    ( 10, 'Marta',    'D�az',         'Avenida Central 3',    '109876543', TO_DATE( '2022-06-22', 'YYYY-MM-DD' ), '' );

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


INSERT INTO Cuidador    VALUES    (  1, 'Juan',         'G�mez',        'Calle Principal 13',   '123456789', TO_DATE( '2022-01-10', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    (  2, 'Mar�a',        'Fern�ndez',    'Avenida Central 56',   '987654321', TO_DATE( '2021-11-15', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    (  3, 'Pedro',        'Mart�nez',     'Calle Secundaria 89',  '654321987', TO_DATE( '2022-03-05', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    (  4, 'Laura',        'S�nchez',      'Calle Tranquila 23',   '456789012', TO_DATE( '2022-02-20', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    (  5, 'Carlos',       'Rodr�guez',    'Avenida Soleada 5',    '321098765', TO_DATE( '2021-10-08', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    (  6, 'Ana',          'L�pez',        'Calle Sombr�a 89',     '789012345', TO_DATE( '2022-04-18', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    (  7, 'Miguel',       'Torres',       'Avenida C�ntrica 12',  '210987654', TO_DATE( '2021-12-25', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    (  8, 'Isabel',       'Garc�a',       'Calle Serena 58',      '876543210', TO_DATE( '2022-01-30', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    (  9, 'Fernando',     'Hern�ndez',    'Avenida Tranquila 92', '543210987', TO_DATE( '2022-05-12', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    ( 10, 'Carmen',       'D�az',         'Calle Principal 36',   '109876543', TO_DATE( '2021-09-03', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    ( 11, 'Javier',       'P�rez',        'Avenida Central 70',   '234567890', TO_DATE( '2022-06-08', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    ( 12, 'Sara',         'Guti�rrez',    'Calle Soleada 15',     '678901234', TO_DATE( '2021-08-17', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    ( 13, 'Alejandro',    'Ruiz',         'Avenida Secundaria 6', '123456789', TO_DATE( '2022-07-22', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    ( 14, 'Elena',        'Molina',       'Calle Serena 14',      '567890123', TO_DATE( '2021-07-01', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    ( 15, 'Ra�l',         'Santos',       'Avenida Principal 56', '890123456', TO_DATE( '2022-08-31', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    ( 16, 'Patricia',     'Ortega',       'Calle Tranquila 23',   '234567890', TO_DATE( '2021-06-14', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    ( 17, 'Francisco',    'Flores',       'Avenida C�ntrica 7',   '678901234', TO_DATE( '2022-09-25', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    ( 18, 'Luc�a',        'Vega',         'Calle Soleada 123',    '102345678', TO_DATE( '2021-05-06', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    ( 19, 'Daniel',       'Castro',       'Avenida Central 84',   '456789012', TO_DATE( '2022-10-18', 'YYYY-MM-DD' ), '' );
INSERT INTO Cuidador    VALUES    ( 20, 'Natalia',      'Cabrera',      'Calle Principal 34',   '890123456', TO_DATE( '2021-04-09', 'YYYY-MM-DD' ), '' );
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


INSERT INTO Itinerario  VALUES  (  1, 'Itinerario  1',  1, TO_DATE( '09:00:00', 'HH24:MI:SS' ), 2, 54, 30, '' );
INSERT INTO Itinerario  VALUES  (  2, 'Itinerario  2',  2, TO_DATE( '10:30:00', 'HH24:MI:SS' ), 3, 82, 45, '' );
INSERT INTO Itinerario  VALUES  (  3, 'Itinerario  3',  3, TO_DATE( '12:00:00', 'HH24:MI:SS' ), 1, 35, 20, '' );
INSERT INTO Itinerario  VALUES  (  4, 'Itinerario  4',  4, TO_DATE( '14:00:00', 'HH24:MI:SS' ), 2, 68, 40, '' );
INSERT INTO Itinerario  VALUES  (  5, 'Itinerario  5', 10, TO_DATE( '15:30:00', 'HH24:MI:SS' ), 1, 42, 25, '' );
INSERT INTO Itinerario  VALUES  (  6, 'Itinerario  6',  7, TO_DATE( '17:00:00', 'HH24:MI:SS' ), 2, 75, 35, '' );
INSERT INTO Itinerario  VALUES  (  7, 'Itinerario  7',  8, TO_DATE( '09:30:00', 'HH24:MI:SS' ), 2, 60, 30, '' );
INSERT INTO Itinerario  VALUES  (  8, 'Itinerario  8',  1, TO_DATE( '11:00:00', 'HH24:MI:SS' ), 3, 91, 50, '' );
INSERT INTO Itinerario  VALUES  (  9, 'Itinerario  9',  2, TO_DATE( '13:00:00', 'HH24:MI:SS' ), 1, 48, 25, '' );
INSERT INTO Itinerario  VALUES  ( 10, 'Itinerario 10',  5, TO_DATE( '15:00:00', 'HH24:MI:SS' ), 2, 72, 40, '' );
INSERT INTO Itinerario  VALUES  ( 11, 'Itinerario 11',  6, TO_DATE( '16:30:00', 'HH24:MI:SS' ), 1, 55, 30, '' );
INSERT INTO Itinerario  VALUES  ( 12, 'Itinerario 12',  7, TO_DATE( '18:00:00', 'HH24:MI:SS' ), 2, 80, 45, '' );
INSERT INTO Itinerario  VALUES  ( 13, 'Itinerario 13',  2, TO_DATE( '10:00:00', 'HH24:MI:SS' ), 1, 40, 20, '' );
INSERT INTO Itinerario  VALUES  ( 14, 'Itinerario 14',  6, TO_DATE( '12:30:00', 'HH24:MI:SS' ), 3, 95, 55, '' );
INSERT INTO Itinerario  VALUES  ( 15, 'Itinerario 15', 10, TO_DATE( '14:30:00', 'HH24:MI:SS' ), 2, 65, 35, '' );

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


INSERT INTO Vive    VALUES  (   1,  1,  5, 3, '' );
INSERT INTO Vive    VALUES  (   2,  2,  7, 1, '' );
INSERT INTO Vive    VALUES  (   3,  3,  2, 5, '' );
INSERT INTO Vive    VALUES  (   4,  4,  1, 7, '' );
INSERT INTO Vive    VALUES  (   5,  5,  9, 8, '' );
INSERT INTO Vive    VALUES  (   6,  6, 10, 2, '' );
INSERT INTO Vive    VALUES  (   7,  7,  8, 3, '' );
INSERT INTO Vive    VALUES  (   8,  8,  3, 1, '' );
INSERT INTO Vive    VALUES  (   9,  9,  4, 0, '' );
INSERT INTO Vive    VALUES  (  10, 10,  6, 3, '' );
INSERT INTO Vive    VALUES  (  11, 11,  1, 0, '' );
INSERT INTO Vive    VALUES  (  12, 12,  2, 3, '' );
INSERT INTO Vive    VALUES  (  13, 13,  3, 2, '' );
INSERT INTO Vive    VALUES  (  14, 14,  4, 1, '' );
INSERT INTO Vive    VALUES  (  15, 15,  5, 1, '' );
INSERT INTO Vive    VALUES  (  16, 16,  6, 1, '' );
INSERT INTO Vive    VALUES  (  17, 17,  7, 3, '' );
INSERT INTO Vive    VALUES  (  18, 18,  8, 3, '' );
INSERT INTO Vive    VALUES  (  19, 19,  9, 4, '' );
INSERT INTO Vive    VALUES  (  20, 20, 10, 6, '' );
INSERT INTO Vive    VALUES  (  21, 21, 11, 0, '' );
INSERT INTO Vive    VALUES  (  22, 22, 12, 9, '' );
INSERT INTO Vive    VALUES  (  23, 23, 13, 3, '' );
INSERT INTO Vive    VALUES  (  24, 24, 14, 8, '' );
INSERT INTO Vive    VALUES  (  25, 25, 15, 5, '' );
INSERT INTO Vive    VALUES  (  26, 26,  6, 4, '' );
INSERT INTO Vive    VALUES  (  27, 27,  4, 2, '' );
INSERT INTO Vive    VALUES  (  28, 28, 10, 1, '' );
INSERT INTO Vive    VALUES  (  29, 29, 11, 3, '' );
INSERT INTO Vive    VALUES  (  30, 30, 10, 6, '' );
INSERT INTO Vive    VALUES  (  31, 31,  1, 6, '' );
INSERT INTO Vive    VALUES  (  32, 32,  2, 3, '' );
INSERT INTO Vive    VALUES  (  33, 33,  3, 8, '' );
INSERT INTO Vive    VALUES  (  34, 34,  4, 9, '' );
INSERT INTO Vive    VALUES  (  35, 35,  5, 3, '' );
INSERT INTO Vive    VALUES  (  36, 36,  6, 1, '' );
INSERT INTO Vive    VALUES  (  37, 37,  7, 0, '' );
INSERT INTO Vive    VALUES  (  38, 38,  8, 2, '' );
INSERT INTO Vive    VALUES  (  39, 39,  9, 3, '' );
INSERT INTO Vive    VALUES  (  40, 40, 10, 2, '' );
INSERT INTO Vive    VALUES  (  41, 41, 11, 2, '' );
INSERT INTO Vive    VALUES  (  42, 42, 12, 1, '' );
INSERT INTO Vive    VALUES  (  43, 43, 13, 7, '' );
INSERT INTO Vive    VALUES  (  44, 44, 14, 5, '' );
INSERT INTO Vive    VALUES  (  45, 45, 15, 3, '' );
INSERT INTO Vive    VALUES  (  46,  1,  6, 9, '' );
INSERT INTO Vive    VALUES  (  47,  2,  8, 8, '' );
INSERT INTO Vive    VALUES  (  48,  3,  6, 8, '' );
INSERT INTO Vive    VALUES  (  49,  4,  6, 7, '' );
INSERT INTO Vive    VALUES  (  50,  5,  2, 3, '' );
INSERT INTO Vive    VALUES  (  51,  6,  1, 2, '' );
INSERT INTO Vive    VALUES  (  52,  7,  2, 3, '' );
INSERT INTO Vive    VALUES  (  53,  8,  8, 1, '' );
INSERT INTO Vive    VALUES  (  54, 13,  4, 1, '' );
INSERT INTO Vive    VALUES  (  55, 10,  5, 1, '' );
INSERT INTO Vive    VALUES  (  56, 11,  6, 2, '' );
INSERT INTO Vive    VALUES  (  57, 12,  7, 9, '' );
INSERT INTO Vive    VALUES  (  58, 13,  8, 9, '' );
INSERT INTO Vive    VALUES  (  59, 14,  9, 0, '' );
INSERT INTO Vive    VALUES  (  60, 15, 10, 1, '' );
INSERT INTO Vive    VALUES  (  61, 16, 11, 3, '' );
INSERT INTO Vive    VALUES  (  62, 17, 12, 4, '' );
INSERT INTO Vive    VALUES  (  63, 18, 13, 5, '' );
INSERT INTO Vive    VALUES  (  64, 19, 14, 5, '' );
INSERT INTO Vive    VALUES  (  65, 20, 15, 5, '' );
INSERT INTO Vive    VALUES  (  66, 21,  2, 3, '' );
INSERT INTO Vive    VALUES  (  67, 22,  1, 7, '' );
INSERT INTO Vive    VALUES  (  68, 23,  7, 7, '' );
INSERT INTO Vive    VALUES  (  69, 24,  9, 3, '' );
INSERT INTO Vive    VALUES  (  70, 25,  2, 7, '' );
INSERT INTO Vive    VALUES  (  71, 26,  1, 6, '' );
INSERT INTO Vive    VALUES  (  72, 27,  2, 5, '' );
INSERT INTO Vive    VALUES  (  73, 28,  3, 8, '' );
INSERT INTO Vive    VALUES  (  74, 29,  4, 9, '' );
INSERT INTO Vive    VALUES  (  75, 30,  5, 2, '' );
INSERT INTO Vive    VALUES  (  76, 31,  6, 2, '' );
INSERT INTO Vive    VALUES  (  77, 32,  7, 1, '' );
INSERT INTO Vive    VALUES  (  78, 33,  8, 1, '' );
INSERT INTO Vive    VALUES  (  79, 34,  9, 3, '' );
INSERT INTO Vive    VALUES  (  80, 35, 10, 4, '' );
INSERT INTO Vive    VALUES  (  81, 36, 11, 5, '' );
INSERT INTO Vive    VALUES  (  82, 37, 12, 7, '' );
INSERT INTO Vive    VALUES  (  83, 38, 13, 6, '' );
INSERT INTO Vive    VALUES  (  84, 39, 14, 8, '' );
INSERT INTO Vive    VALUES  (  85, 40, 15, 5, '' );
INSERT INTO Vive    VALUES  (  86, 41, 13, 3, '' );
INSERT INTO Vive    VALUES  (  87, 42, 14, 3, '' );
INSERT INTO Vive    VALUES  (  88, 43, 10, 4, '' );
INSERT INTO Vive    VALUES  (  89, 44,  2, 5, '' );
INSERT INTO Vive    VALUES  (  90, 45,  5, 5, '' );
INSERT INTO Vive    VALUES  (  91,  1,  9, 7, '' );
INSERT INTO Vive    VALUES  (  92,  2, 15, 2, '' );
INSERT INTO Vive    VALUES  (  93,  3, 13, 2, '' );
INSERT INTO Vive    VALUES  (  94,  4,  8, 1, '' );
INSERT INTO Vive    VALUES  (  95,  5,  7, 1, '' );
INSERT INTO Vive    VALUES  (  96,  6,  2, 1, '' );
INSERT INTO Vive    VALUES  (  97,  7,  6, 0, '' );
INSERT INTO Vive    VALUES  (  98,  8, 11, 0, '' );
INSERT INTO Vive    VALUES  (  99,  9, 15, 9, '' );
INSERT INTO Vive    VALUES  ( 100, 10, 13, 3, '' );

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


INSERT INTO Atiende VALUES (  1,  3,  7, TO_DATE( '2021-02-10', 'YYYY-MM-DD' ), 'Revisi�n general', '' );
INSERT INTO Atiende VALUES (  2,  5, 12, TO_DATE( '2021-03-22', 'YYYY-MM-DD' ), 'Herida leve en ala', '' );
INSERT INTO Atiende VALUES (  3,  8,  4, TO_DATE( '2021-05-04', 'YYYY-MM-DD' ), 'Vacunaci�n antirr�bica', '' );
INSERT INTO Atiende VALUES (  4,  2,  1, TO_DATE( '2021-06-15', 'YYYY-MM-DD' ), 'Desparasitaci�n interna', '' );
INSERT INTO Atiende VALUES (  5, 10, 18, TO_DATE( '2021-07-19', 'YYYY-MM-DD' ), 'Tratamiento ocular', '' );
INSERT INTO Atiende VALUES (  6,  7,  5, TO_DATE( '2021-08-02', 'YYYY-MM-DD' ), 'Parto asistido', '' );
INSERT INTO Atiende VALUES (  7, 12,  9, TO_DATE( '2021-09-10', 'YYYY-MM-DD' ), 'Herida en pata trasera', '' );
INSERT INTO Atiende VALUES (  8,  4, 14, TO_DATE( '2021-10-21', 'YYYY-MM-DD' ), 'Revisi�n dental', '' );
INSERT INTO Atiende VALUES (  9, 15,  2, TO_DATE( '2021-11-03', 'YYYY-MM-DD' ), 'Revisi�n general', '' );
INSERT INTO Atiende VALUES ( 10, 18,  3, TO_DATE( '2021-12-12', 'YYYY-MM-DD' ), 'Vacunaci�n refuerzo', '' );
INSERT INTO Atiende VALUES ( 11, 20,  6, TO_DATE( '2022-01-08', 'YYYY-MM-DD' ), 'Herida en cola', '' );
INSERT INTO Atiende VALUES ( 12, 22, 15, TO_DATE( '2022-02-20', 'YYYY-MM-DD' ), 'Desparasitaci�n externa', '' );
INSERT INTO Atiende VALUES ( 13, 24, 11, TO_DATE( '2022-03-18', 'YYYY-MM-DD' ), 'Revisi�n general', '' );
INSERT INTO Atiende VALUES ( 14, 26,  7, TO_DATE( '2022-04-22', 'YYYY-MM-DD' ), 'Vacunaci�n antirr�bica', '' );
INSERT INTO Atiende VALUES ( 15, 28, 13, TO_DATE( '2022-05-19', 'YYYY-MM-DD' ), 'Parto asistido', '' );
INSERT INTO Atiende VALUES ( 16, 30,  8, TO_DATE( '2022-06-10', 'YYYY-MM-DD' ), 'Herida en oreja derecha', '' );
INSERT INTO Atiende VALUES ( 17, 32, 19, TO_DATE( '2022-07-01', 'YYYY-MM-DD' ), 'Revisi�n dental', '' );
INSERT INTO Atiende VALUES ( 18, 34,  2, TO_DATE( '2022-07-25', 'YYYY-MM-DD' ), 'Revisi�n general', '' );
INSERT INTO Atiende VALUES ( 19, 36, 16, TO_DATE( '2022-08-13', 'YYYY-MM-DD' ), 'Tratamiento cut�neo', '' );
INSERT INTO Atiende VALUES ( 20, 38,  3, TO_DATE( '2022-09-07', 'YYYY-MM-DD' ), 'Desparasitaci�n', '' );
INSERT INTO Atiende VALUES ( 21, 40, 17, TO_DATE( '2022-10-01', 'YYYY-MM-DD' ), 'Vacunaci�n anual', '' );
INSERT INTO Atiende VALUES ( 22, 42, 10, TO_DATE( '2022-10-29', 'YYYY-MM-DD' ), 'Revisi�n de peso', '' );
INSERT INTO Atiende VALUES ( 23, 43,  4, TO_DATE( '2022-11-20', 'YYYY-MM-DD' ), 'Herida leve en cuello', '' );
INSERT INTO Atiende VALUES ( 24,  1, 14, TO_DATE( '2022-12-12', 'YYYY-MM-DD' ), 'Tratamiento ocular', '' );
INSERT INTO Atiende VALUES ( 25,  6,  1, TO_DATE( '2023-01-15', 'YYYY-MM-DD' ), 'Revisi�n general', '' );
INSERT INTO Atiende VALUES ( 26,  9, 12, TO_DATE( '2023-02-10', 'YYYY-MM-DD' ), 'Parto asistido', '' );
INSERT INTO Atiende VALUES ( 27, 11,  5, TO_DATE( '2023-03-06', 'YYYY-MM-DD' ), 'Vacunaci�n refuerzo', '' );
INSERT INTO Atiende VALUES ( 28, 13,  9, TO_DATE( '2023-04-01', 'YYYY-MM-DD' ), 'Desparasitaci�n interna', '' );
INSERT INTO Atiende VALUES ( 29, 16, 11, TO_DATE( '2023-04-28', 'YYYY-MM-DD' ), 'Herida leve en pata delantera', '' );
INSERT INTO Atiende VALUES ( 30, 19,  8, TO_DATE( '2023-05-23', 'YYYY-MM-DD' ), 'Tratamiento cut�neo', '' );
INSERT INTO Atiende VALUES ( 31, 21,  6, TO_DATE( '2023-06-19', 'YYYY-MM-DD' ), 'Revisi�n dental', '' );
INSERT INTO Atiende VALUES ( 32, 23,  2, TO_DATE( '2023-07-10', 'YYYY-MM-DD' ), 'Vacunaci�n antirr�bica', '' );
INSERT INTO Atiende VALUES ( 33, 25, 17, TO_DATE( '2023-08-14', 'YYYY-MM-DD' ), 'Revisi�n general', '' );
INSERT INTO Atiende VALUES ( 34, 27, 15, TO_DATE( '2023-09-09', 'YYYY-MM-DD' ), 'Quemadura leve tratada', '' );
INSERT INTO Atiende VALUES ( 35, 29, 19, TO_DATE( '2023-10-05', 'YYYY-MM-DD' ), 'Tratamiento ocular', '' );
INSERT INTO Atiende VALUES ( 36, 31,  4, TO_DATE( '2023-11-02', 'YYYY-MM-DD' ), 'Revisi�n general', '' );
INSERT INTO Atiende VALUES ( 37, 33, 13, TO_DATE( '2023-12-07', 'YYYY-MM-DD' ), 'Herida superficial', '' );
INSERT INTO Atiende VALUES ( 38, 35, 10, TO_DATE( '2024-01-20', 'YYYY-MM-DD' ), 'Desparasitaci�n', '' );
INSERT INTO Atiende VALUES ( 39, 37, 11, TO_DATE( '2024-02-15', 'YYYY-MM-DD' ), 'Vacunaci�n refuerzo', '' );
INSERT INTO Atiende VALUES ( 40, 39, 14, TO_DATE( '2024-03-09', 'YYYY-MM-DD' ), 'Tratamiento cut�neo', '' );
INSERT INTO Atiende VALUES ( 41, 41, 18, TO_DATE( '2024-04-10', 'YYYY-MM-DD' ), 'Revisi�n general', '' );
INSERT INTO Atiende VALUES ( 42, 44,  7, TO_DATE( '2024-05-14', 'YYYY-MM-DD' ), 'Parto asistido', '' );
INSERT INTO Atiende VALUES ( 43, 45,  3, TO_DATE( '2024-06-06', 'YYYY-MM-DD' ), 'Herida en costado', '' );
INSERT INTO Atiende VALUES ( 44, 17,  5, TO_DATE( '2024-07-03', 'YYYY-MM-DD' ), 'Vacunaci�n anual', '' );
INSERT INTO Atiende VALUES ( 45, 14, 16, TO_DATE( '2024-08-01', 'YYYY-MM-DD' ), 'Revisi�n general', '' );
INSERT INTO Atiende VALUES ( 46,  9,  9, TO_DATE( '2024-09-05', 'YYYY-MM-DD' ), 'Tratamiento ocular', '' );
INSERT INTO Atiende VALUES ( 47,  3, 20, TO_DATE( '2024-10-02', 'YYYY-MM-DD' ), 'Herida en cola', '' );
INSERT INTO Atiende VALUES ( 48,  5,  2, TO_DATE( '2025-02-12', 'YYYY-MM-DD' ), 'Desparasitaci�n interna', '' );
INSERT INTO Atiende VALUES ( 49,  8,  8, TO_DATE( '2025-05-09', 'YYYY-MM-DD' ), 'Revisi�n general', '' );
INSERT INTO Atiende VALUES ( 50, 12, 15, TO_DATE( '2025-07-14', 'YYYY-MM-DD' ), 'Tratamiento cut�neo', '' );
INSERT INTO Atiende VALUES ( 51, 20,  6, TO_DATE( '2025-09-28', 'YYYY-MM-DD' ), 'Vacunaci�n refuerzo', '' );


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


INSERT INTO Recorre VALUES (  1,  1,  5, TO_DATE( '2021-03-10', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES (  2,  1,  8, TO_DATE( '2021-04-15', 'YYYY-MM-DD' ), 'Retraso por lluvia', '' );
INSERT INTO Recorre VALUES (  3,  2,  3, TO_DATE( '2021-05-01', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES (  4,  2,  7, TO_DATE( '2021-06-09', 'YYYY-MM-DD' ), 'Animal fuera de vista del gu�a', '' );
INSERT INTO Recorre VALUES (  5,  3,  2, TO_DATE( '2021-07-14', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES (  6,  3, 10, TO_DATE( '2021-08-11', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES (  7,  4,  9, TO_DATE( '2021-09-18', 'YYYY-MM-DD' ), 'Reparaci�n en valla del h�bitat', '' );
INSERT INTO Recorre VALUES (  8,  4,  6, TO_DATE( '2021-10-23', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES (  9,  5, 11, TO_DATE( '2021-11-07', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 10,  5,  4, TO_DATE( '2021-12-05', 'YYYY-MM-DD' ), 'Visita reducida por lluvia', '' );
INSERT INTO Recorre VALUES ( 11,  6,  1, TO_DATE( '2022-01-09', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 12,  6, 12, TO_DATE( '2022-02-14', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 13,  7, 13, TO_DATE( '2022-03-02', 'YYYY-MM-DD' ), 'Fuga temporal de un ave', '' );
INSERT INTO Recorre VALUES ( 14,  7, 15, TO_DATE( '2022-04-18', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 15,  8,  2, TO_DATE( '2022-05-03', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 16,  8,  5, TO_DATE( '2022-05-25', 'YYYY-MM-DD' ), 'Peque�o incidente con visitante', '' );
INSERT INTO Recorre VALUES ( 17,  9,  7, TO_DATE( '2022-06-15', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 18,  9, 10, TO_DATE( '2022-07-07', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 19, 10,  4, TO_DATE( '2022-08-11', 'YYYY-MM-DD' ), 'Animal en tratamiento, h�bitat cerrado', '' );
INSERT INTO Recorre VALUES ( 20, 10,  9, TO_DATE( '2022-09-06', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 21, 11, 11, TO_DATE( '2022-10-01', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 22, 11, 14, TO_DATE( '2022-10-28', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 23, 12,  1, TO_DATE( '2022-11-25', 'YYYY-MM-DD' ), 'Revisi�n del circuito por mantenimiento', '' );
INSERT INTO Recorre VALUES ( 24, 12,  3, TO_DATE( '2022-12-20', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 25, 13,  2, TO_DATE( '2023-01-10', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 26, 13,  6, TO_DATE( '2023-02-09', 'YYYY-MM-DD' ), 'Aver�a de micr�fono del gu�a', '' );
INSERT INTO Recorre VALUES ( 27, 14, 12, TO_DATE( '2023-03-12', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 28, 14,  8, TO_DATE( '2023-04-06', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 29, 15, 15, TO_DATE( '2023-05-01', 'YYYY-MM-DD' ), 'Cierre anticipado por tormenta', '' );
INSERT INTO Recorre VALUES ( 30, 15, 13, TO_DATE( '2023-06-10', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 31,  1,  4, TO_DATE( '2023-07-15', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 32,  2,  5, TO_DATE( '2023-08-11', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 33,  3,  6, TO_DATE( '2023-09-05', 'YYYY-MM-DD' ), 'Fallo en megafon�a del recorrido', '' );
INSERT INTO Recorre VALUES ( 34,  4,  9, TO_DATE( '2023-10-09', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 35,  5, 11, TO_DATE( '2023-11-12', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 36,  6,  2, TO_DATE( '2024-01-10', 'YYYY-MM-DD' ), 'Animal escondido durante visita', '' );
INSERT INTO Recorre VALUES ( 37,  7,  7, TO_DATE( '2024-02-16', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 38,  8,  8, TO_DATE( '2024-03-11', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 39,  9,  5, TO_DATE( '2024-04-09', 'YYYY-MM-DD' ), 'Revisi�n de seguridad del h�bitat', '' );
INSERT INTO Recorre VALUES ( 40, 10, 10, TO_DATE( '2024-05-06', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 41, 11, 14, TO_DATE( '2024-06-03', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 42, 12, 15, TO_DATE( '2024-07-01', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 43, 13,  9, TO_DATE( '2024-07-29', 'YYYY-MM-DD' ), 'Retraso por grupo escolar grande', '' );
INSERT INTO Recorre VALUES ( 44, 14,  6, TO_DATE( '2024-08-20', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 45, 15, 11, TO_DATE( '2024-09-14', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 46,  1,  3, TO_DATE( '2025-01-15', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 47,  2, 10, TO_DATE( '2025-02-08', 'YYYY-MM-DD' ), 'Fallo de micr�fono del gu�a', '' );
INSERT INTO Recorre VALUES ( 48,  3,  4, TO_DATE( '2025-03-11', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 49,  4,  7, TO_DATE( '2025-04-19', 'YYYY-MM-DD' ), '', '' );
INSERT INTO Recorre VALUES ( 50,  5, 12, TO_DATE( '2025-05-22', 'YYYY-MM-DD' ), '', '' );

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
