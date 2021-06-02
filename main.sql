
CREATE TABLE Zeitzone(
  zeitzone_id serial,
  zeit varchar(3),
  name varchar(25),
  PRIMARY KEY(zeitzone_id)
)

CREATE TABLE Meer(
  meer_id serial,
  name varchar(30),
  PRIMARY KEY(meer_id)
)

CREATE TABLE Ethnizitaet(
  ethnizitaet_id serial,
  name varchar(30),
  PRIMARY KEY(ethnizitaet_id)
)

CREATE TABLE Sprache(
  sprache_id serial,
  name varchar(30),
  PRIMARY KEY(sprache_id)
)

CREATE TABLE Militaerbuendnis(
  militaerbuendnis_id serial,
  name varchar(30),
  PRIMARY KEY(militaerbuendnis_id)
)

CREATE TABLE Halbkugel(
  halbkugel_id serial,
  name varchar(25),
  PRIMARY KEY(halbkugel_id)
)

CREATE TABLE Staatsform (
  staatsform_id serial,
  name varchar(30),
  PRIMARY KEY(staatsform_id)
)

CREATE TABLE Waehrung(
  waehrung_id serial,
  name varchar(20),
  wert float,
  PRIMARY KEY(waehrung_id)
)

CREATE TABLE Religion(
  religion_id serial,
  name varchar(30),
  PRIMARY KEY(religion_id)
)

CREATE TABLE Klima(
  klima_id serial,
  name varchar(40),
  PRIMARY KEY(klima_id)
)

CREATE TABLE Kontinent(
  kontinent_id serial,
  name varchar(20),
  PRIMARY KEY(kontinent_id)
)

CREATE TABLE Land (
  land_id serial,
  name varchar(30),
  population int,
  flaeche int,
  durchschnittseinkommen float,
  entwicklung float,
  staatsform_id BIGINT UNSIGNED,
  waehrung_id bigint unsigned,
  sprache_id bigint unsigned,
  religion_id bigint unsigned,
  ethnizitaet_id bigint unsigned,
  halbkugel_id bigint unsigned,
  klima_id bigint unsigned,
  militaerbuendnis_id bigint unsigned,
  kontinent_id bigint unsigned,
  PRIMARY KEY(land_id),
  FOREIGN KEY(staatsform_id)
  REFERENCES Staatsform(staatsform_id),
  FOREIGN KEY(waehrung_id)
  REFERENCES Waehrung(waehrung_id),
  FOREIGN KEY(sprache_id)
  REFERENCES Sprache(sprache_id),
  FOREIGN KEY(religion_id)
  REFERENCES Religion(religion_id),
  FOREIGN KEY(ethnizitaet_id)
  REFERENCES Ethnizitaet(ethnizitaet_id),
  FOREIGN KEY(halbkugel_id)
  REFERENCES Halbkugel(halbkugel_id),
  FOREIGN KEY(klima_id)
  REFERENCES Klima(klima_id),
  FOREIGN KEY(militaerbuendnis_id)
  REFERENCES Militaerbuendnis(militaerbuendnis_id),
  FOREIGN KEY(kontinent_id)
  REFERENCES Kontinent(kontinent_id)
)



CREATE TABLE Land_Meer(
  land_meer_id serial,
  land_id bigint unsigned not null,
  meer_id bigint unsigned not null,
  FOREIGN KEY(land_id) REFERENCES Land(land_id),
  FOREIGN KEY(meer_id) REFERENCES Meer(meer_id),
  PRIMARY KEY(land_meer_id)
)

CREATE TABLE Zeit_Land(
  zeit_land_id serial,
  land_id bigint unsigned NOT NULL,
  zeitzone_id bigint unsigned NOT NULL,
  FOREIGN KEY(land_id) REFERENCES Land(land_id),
  FOREIGN KEY(zeitzone_id) REFERENCES Zeitzone(zeitzone_id),
  PRIMARY KEY(zeit_land_id)
)

CREATE TABLE Stadt (
  stadt_id serial,
  name varchar(40),
  population int,
  flaeche int,
  isHauptstadt boolean,
  land_id bigint unsigned not null,
  PRIMARY KEY(stadt_id),
  FOREIGN KEY(land_id) REFERENCES Land(land_id)
)

CREATE TABLE Distrikte(
  distrikte_id serial,
  name varchar(25),
  land_id bigint unsigned NOT NULL,
  FOREIGN KEY(land_id) REFERENCES Land(land_id)
)

INSERT INTO Zeitzone (zeit, name) VALUES ('International Date Line West', 'UTC-12'), ('-','UTC−11'),('Hawaii-Aleutian Standard Time', 'UTC-10'),
('-', 'UTC-9.30'), ('Alaska Standard Time','UTC−9'), ('Pacific Standard Time','UTC−8'), ('Mountain Standard Time', 'UTC-7'), ('Central Standard Time', 'UTC-6'),
('Eastern Standard Time', 'UTC-5'), ('Atlantic Standard Time', 'UTC-4'), ('Newfoundland Standard Time','UTC-3.30'), ('-','UTC−3'), ('-','UTC-2'), ('-','UTC-1'),
('West European Time','UTC-0'), ('Central European Time','UTC+1'), ('East European Time','UTC+2'), ('Baghdad Time','UTC+3'), ('Iran Time','UTC+3.30'),
('-','UTC+4'), ('-','UTC+4.30'), ('-','UTC+5'), ('Indian Standard Time','UTC+5.30'), ('-','UTC+5.45'), ('-','UTC+6'), ('-','UTC+6.30'), ('Indochina Time','UTC+7'), ('Indochina Time','UTC+8'),
('Korea Standard Time','UTC+9'), ('Australian Central Standard Time','UTC+9.30n'), ('Australian Eastern Standard Time','UTC+10'), ('-','UTC+10.30'), ('Norfolk Time','UTC+11'), ('International Date Line East','UTC+12h');

INSERT INTO Meer (name) VALUES ('Arktischer Ozean'), ('Atlantischer Ozean'), ('Indischer Ozean'), ('Pazifischer Ozean'), ('Südlicher Ozean');

INSERT INTO Ethnizitaet (name) VALUES('arabischer Abstammung'), ('europäischer Abstammung'), ('asiatischer Abstammung'), ('afrikanischer Abstammung');

INSERT INTO Sprache (name) VALUES('Dari'), ('Englisch'), ('Deutsch'),
('Niederländisch'), ('Portugiesisch'), ('Französisch'), ('Mandarin'),
('Spanisch'), ('Dänisch'), ('Arabisch'), ('Griechisch'), ('Hindi'),
('Persisch'), ('Irisch'), ('Italienisch'), ('Japanisch'),('Koreanisch'),
('Norwegisch'), ('Urdu'), ('Polnisch'), ('Russisch'),
('Schwedisch'), ('Thailändisch'), ('Türkisch');

INSERT INTO Militaerbuendnis (name) VALUES('Nato'), ('Europäische Union'), ('Westafrikanische Wirtschaftsgemeinschaft'),
('Islamische Militärkoalition') ,('Keines');

INSERT INTO Halbkugel (name) VALUES('Nordhalbkugel'), ('Südhalbkugel'), ('Äquator');

INSERT INTO Staatsform (name) VALUES('präsidentielle Republik'), ('föderale parlamentarische Monarchie'), ('semipräsidentiell-parlamentarische Republik'),
('parlamentarische Monarchie'), ('Volksrepublik mit Einparteiensystem'), ('Republik mit Einparteiensystem'), ('semipräsidentielle Republik'),
('parlamentarische Republik'), ('Allparteienregierung'), ('Bundesrepublik mit einem „Souveränen Rat“ aus Militär und Zivilisten'),
('föderale Republik mit Direktorialsystem'), ('Konstitutionelle Monarchie'), ('föderale präsidentielle Republik');

INSERT INTO Waehrung (name, wert) VALUES ('Euro', 1.15), ('Kanadischer Dollar', 0.9), ('Englischer Pfund', 1.9), ('Argentinischer Peso' 0.0095)
('Mexikanischer Peso', 0.045), ('Schweizer Franken', 1), ('Afghani', 0.011), ('Renminbi', 0.14), ('Neuseeländischer Dollar', 0.5), ('Australischer Dollar', 0.8),
('Kolumbianischer Peso',0.00024), ('Costa-Rica-Colón',0.0014), ('Kubanischer Peso', 0.037), ('Dänische Krone', 0.15), ('Ägyptisches Pfund', 0.057), ('Indische Rupie', 0.012),
('Iranischer Rial',0.000021), ('Yen', 0.0082), ('Kenia-Schilling',0.0083), ('Libyscher Dinar', 0.2), ('Naira', 0.0022), ('Nordkoreanischer Won',0.009),
('Norwegische Krone', 0.11), ('Pakistanische Rupie', 0.0058), ('Nuevo Sol', 0.23), ('Philippinischer Peso', 0.019), ('Złoty',0.24),
('Russischer Rubel', 0.012), ('Singapur-Dollar', 0.68), ('Südkoreanischer Won', 0.00080), ('Sudanesisches Pfund', 0.022),  ('Schwedische Krone', 0.11),
('Baht', 0.029), ('Türkische Lira', 0.11), ('Amerikanische Dollar', 1), ('Brasilianischer Real', 0.17) ('Cedi', 0.15792);

INSERT INTO Religion (name) VALUES('Christentum'), ('Islam'), ('Hinduismus'), ('Buddhismus'), ('Judentum'), ('Atheismus');

INSERT INTO Klima (name) VALUES('Tropen'), ('Subtropen'), ('gemässigte Zone'), ('kalte Zone');

INSERT INTO Kontinent (name) VALUES('Asien'),  ('Afrika'), ('Nordamerika'), ('Südamerika'), ('Antarktis'), ('Europa'), ('Australien');


INSERT INTO Land (name, population, flaeche, durchschnittseinkommen,
entwicklung, staatsform_id, waehrung_id, sprache_id, religion_id, ethnizitaet_id,
halbkugel_id, klima_id, militaerbuendnis_id, kontinent_id)
VALUES('Afghanistan',       38000000,   652864,   507,    0.5,    1,  7, 1, 2, 1, 1, 2, 4 , 1),
('Australien',              25000000,   7688287,  54348,  0.94,   2, 10, 2, 1, 2, 2, 2, 5, 7),
('Österreich',              8942664,    83883,    50380,  0.92,   3,  1, 3, 1, 2, 1, 3, 1, 6),
('Belgien',                 11431406,   30688,    46237,  0.93,   4,  1, 6, 1, 2, 1, 3, 1, 6),
('Brasilien',               211834000,  8515770,  8751,   0.77,   1, 37, 5, 1, 2, 3, 1, 5, 4),
('Kanada',                  38000000,   9984670,  46272,  0.93,   2,  2, 2, 1, 2, 1, 4, 1, 3),
('China',                   1411780000, 9596961,  10522,  0.76,   5,  8, 7, 4, 3, 1, 3, 5, 1),
('Kolumbien',               50300000,   1138910,  6423,   0.77,   1, 11, 8, 1, 2, 3, 1, 5, 4),
('Costa Rica',              5000000,    51100,    12244,  0.81,   1, 12, 8, 1, 2, 3, 1, 5, 4),
('Kuba',                    11239224,   109884,   7177,   0.78,   6, 13, 8, 1, 2, 1, 1, 5, 3),
('Dänemark',                5840045,    42921,    59770,  0.94,   4, 14, 9, 1, 2, 1, 3, 1, 6),
('Ägypten',                 100400000,  1001449,  3044,   0.71,   7, 15, 10, 2, 1, 1, 2, 5, 2),
('Frankreich',              67422000,   632733,   41897,  0.9,    7,  1, 6, 1, 2, 1, 3, 1, 6),
('Deutschland',             83190556,   357581,   45733,  0.95,   8,  1, 3, 1, 2, 1, 3, 1, 6),
('Indien',                  1380004000, 3287263,  1876,   0.65,   8, 16, 12, 3, 3, 1, 2, 5, 1),
('Iran',                    82900000,   1648195,  7555,   0.78,   1, 17, 13, 2, 1, 1, 3, 4, 1),
('Italien',                 60026546,   301338,   33159,  0.89,   8,  1, 15, 1, 2, 1, 3, 1, 6),
('Japan',                   125708382,  377975,   40146,  0.92,   4, 18, 16, 4, 3, 1, 3, 5, 1),
('Ghana',                   30950000,   238537,   2221,   0.611,  1, 38,  2, 1, 4, 1, 1, 6, 2),
('Libyen',                  6800000,    1775500,  6055,   0.724,  1, 20, 10, 2, 1, 1, 2, 5, 6),
('Mexico',                  27600000,   1972550,  9862,   0.779,  1,  5,  8, 1, 2, 1, 1, 5, 3),
('Neuseeland',              4900000,    268021,   41667,  0.931,  4,  9,  2, 1, 2, 2, 3, 5, 7),
('Nigeria',                 214030000,  923768,   2230,   0.539,  1, 21,  2, 2, 4, 1, 1, 3, 2),
('Nordkorea',               25549604,   120538,   783,    0.384,  5, 22, 17, 4, 3, 1, 3, 5, 1),
('Norwegen',                5391369     385207,   75294,  0.957,  4, 23, 18, 1, 2, 1, 4, 1, 6),
('Pakistan',                216600000,  796095,   1260,   0.557,  3, 24, 19, 2, 3, 1, 2, 4, 1),
('Peru',                    32500000,   1285216,  6958,   0.777,  7, 25,  8, 1, 2, 3, 1, 5, 4),
('Polen',                   37798655,   312696,   15601,  0.880,  7, 27, 20, 1, 2, 1, 3, 1, 6),
('Russland',                146877088,  17075400, 11601,  0.824,  7, 28, 21, 1, 2, 1, 4, 5, 6),
('Südkorea',                51700000,   100210,   31497,  0.916,  7, 30, 18, 6, 3, 1, 3, 5, 1),
('Spanien',                 47100000,   505970,   29993,  0.904,  4,  1,  8, 1, 2, 1, 3, 1, 6),
('Schweden',                10327589,   447435,   51404,  0.945,  4, 32, 22, 1, 2, 1, 4, 2, 6),
('Schweiz',                 8606033,    41285,    82484,  0.955, 11,  6,  3, 1, 2, 1, 3, 6, 6),
('Thailand',                69600000,   513115,   7190,   0.777, 12, 33, 23, 4, 3, 1, 1, 6, 1),
('Türkei',                  83614362,   783562,   9684,   0.820,  1, 34, 24, 2, 1, 1, 2, 1, 6),
('Vereinigtes Königreich',  66800000,   248528,   42379,  0.932,  4,  3,  2, 1, 2, 1, 3, 1, 6),
('Vereinigten Staaten',     331449281,  9525067,  65254,  0.926, 13, 35,  2, 1, 2, 1, 3, 1, 3);

INSERT INTO Land_Meer (land_id, meer_id) VALUES

INSERT INTO Zeit_Land (land_id, zeitzone_id) VALUES

INSERT INTO Stadt (name, population, flaeche, isHauptstadt ,land_id) VALUES
('Kabul', 4273156, 275, TRUE, 1), ('Herat',556205, 182, FALSE, 1) , ('Dschalalabad', 263312, 180 , FALSE , 1 ),
('Sydney',5312163,4196,FALSE, 2), ('Perth', 2085973, 6417 , FALSE, 2 ), ('Canberra', 395790,814, TRUE, 2),
('Wien',1920949,414,TRUE, 3), ('Graz',291134,127,FALSE, 3), ('Salzburg'155416,65,FALSE,3),
('Brügge',118326,138,False, 4), ('Brüssel',1210000,32,TRUE,4), ('Antwerpen',525935,204,FALSE,4),
('Brasília',2570160,5802,TRUE,5),('Rio de Janeiro',630446,1200,FALSE,5),('São Paulo', 11253503,1521,FALSE,5),
('Ottowa', 934234,2778,TRUE,6),('Toronto',2731571,630,FALSE,6),('Vancouver',631486,114,FALSE,6),
('Guangzhou',11114200,3843,FALSE,7),('Peking',21500000,16807,TRUE,7),('Shanghai',23019148,6340,FALSE,7),
('Cali',2470852,560,FALSE,8),('Bogotá',7412566,1587,TRUE,8),('Medellín',259537,1479,FALSE,8),
('San José',339588,44,TRUE,9),('Puerto Limón',61000,59,FALSE,9),('San Isidro de El General',45327,191,FALSE,9),
('Havanna',2121871,728,TRUE,10),('Santiago de Cuba',510665,1031,FALSE,10),('Baracoa',81968,974,FALSE,10),
('Kopenhagen',638117,86,TRUE,11),('Aarhus',282910,91,FALSE,11),('Aalborg',119219,139,FALSE,11),
('Gizeh',4146340,500,FALSE,12),('Kairo',9153135,606,TRUE,12),('Alexandria',5039975,1108,FALSE,12),
('Bordeaux',257068,49,FALSE,13),('Paris',2175601,105,TRUE,13),('Marseille',868277,242,FALSE,13),
('München',1484226,310,False,14),('Berlin',3669491,891,TRUE,14),('Hamburg',1851872,755,FALSE,14),
('Mumbai',15414288,603,FALSE,15),('Neu-Delhi',249998,42,TRUE,15),('Kalkutta',4486679,206,FALSE,15),
('Täbris',1558693,300,FALSE,16),('Teheran',8693706,716,TRUE,16),('Isfahan',1961260,351,FALSE,16),
('Rom',2837332,1287,TRUE,17),('Venedig',259150,414,FALSE,17),('Florenz',372038,FALSE,17),
('Tokio',9640742,628,TRUE,18),('Hiroshima',1198021,906,FALSE,18),('Kyōto',1453854,827,FALSE,18),
('Accra',2388000,185,TRUE,19),('Kumasi',2907000,254,FALSE,19),('Tamale',371351,750,FALSE,19),
('Tripolis',1780000,250,TRUE,20),('Tobruk',121052,100,FALSE,20),('Bengasi',631555,150,FALSE,20),
('Mexiko-Stadt',8918653,1495,TRUE,21),('Guadalajara',1500800,151,FALSE,21),('Mérida',830732,90,FALSE,21),
('Wellington',190959,290,TRUE,22),('Auckland',1415550,4938,FALSE,22),('Christchurch',341469,1415,FALSE,22),
('Lagos',8048430,1171,FALSE,23),('Abuja',1235880,1000,TRUE,23),('Kano',2828861,499,FALSE,23),
('Kaesong',192578,179,FALSE,24),('Pyongyang',2870000,2000,TRUE,24),('Namp’o',450723,82,FALSE,24),
('Oslo',697010,454,TRUE,25),('Bergen',285000,464,FALSE,25),('Stavanger',144147,262,FALSE,25),
('Karatschi',14910352,3527,FALSE,26),('Islamabad',1014825,906,TRUE,26),('Lahore',11126285,1772,FALSE,26),
('Arequipa',1008290,100,FALSE,27),('Lima',8574974,2670,TRUE,27),('Cusco',111930,385,FALSE,27),
('Danzig',468158,262,FALSE,28),('Warschau',1790658,517,TRUE,28),('Krakau',774839,326,FALSE,28),
('Norilsk',175365,4500,FALSE,29),('Moskau',11503501,2510,TRUE,29),('Sankt Petersburg',4879566,1431,FALSE,29),
('Seoul',9766886,605,TRUE,30),('Busan',3515439,526,FALSE,30),('Incheon',3011138,1065,FALSE,30),
('Madrid',266126,605,TRUE,31),('Barcelona',1636762,101,FALSE,31),('Sevilla',688592,141,FALSE,31),
('Uppsala',149245,43,FALSE,32),('Stockholm',949761,187,TRUE,32),('Göteborg',572799,213,FALSE,32),
('Zürich',420217,87,FALSE,33),('Bern',134591,51,TRUE,33),('Hombrechtikon',8775,12,FALSE,33),
('Phuket',335913,543,FALSE,34),('Bangkok',829117,1565,TRUE,34),('Chiang Mai',135757,456,FALSE,34),
('Ankara',5663322,25706,TRUE,35),('Istanbul',15519267,FALSE,35),('Antalya',2548308,1417,FALSE,35),
('London',8961989,1572,TRUE,36 ),('Edinburgh',524930,262,FALSE,36),('Glasgow',633120,175,FALSE,36),
('New York', 8419000, 12144, FALSE, 37 ),('Washington D.C.', 692683, 177, TRUE, 37),('Los Angeles', 3979576, 1290.6, FALSE, 37 ),

INSERT INTO Distrikte (name, land_id) VALUES ()






-- SQL ABFRAGEN

--1

--2

--3

--4
