CREATE DATABASE CRIME_DATA;
USE CRIME_DATA;


CREATE TABLE AREA_INFO
( 
	Area_code INT PRIMARY KEY,
	Area_name VARCHAR(50) NOT NULL,
	Latitude DECIMAL(6,3),
    Longitude DECIMAL(6,3)
);

CREATE TABLE VICTIM_INFO 
(	vict_id INT PRIMARY KEY,
	vict_name VARCHAR(50),
	vict_age INT,
    vict_sex CHAR(1),
	vict_descent VARCHAR(20)
);

CREATE TABLE CRIME_INFO
(
	crm_no INT PRIMARY KEY,
    Date_occ DATE,
    Time_occ TIME,
	DATE_rptd DATE,
    Crm_desc VARCHAR(100),
    Weapon_desc VARCHAR(100),
	Status_desc VARCHAR(100),
    Premis_desc VARCHAR(100),
    Location VARCHAR(100),
    Area_code INT,
	vict_id INT,
	FOREIGN KEY(Area_code) REFERENCES AREA_INFO(Area_code),
    FOREIGN KEY(vict_id) REFERENCES VICTIM_INFO(vict_id)
);


INSERT INTO AREA_INFO (Area_code, Area_name, Latitude, Longitude) VALUES
(818, 'N Hollywood', 34.21, -118.41), (747, 'Van Nuys', 34.18, -118.45),
(323, 'Wilshire', 34.03, -118.37), (424, 'Pacific', 33.98, -118.44), 
(313, 'Hollenbeck', 34.08, -118.17), (310, 'Southwest', 34.01, -118.29),
(213, 'Northeast', 34.11, -118.26), (746, 'Devonshire', 34.28, -118.52),
(819, 'Topanga', 34.15, -118.59), (738, 'Olympic', 34.07, -118.30),
(829, 'Hollywood', 34.09, -118.31), (828, 'Mission', 34.22, -118.47),
(223, 'Newton', 34.03, -118.26),  (737, 'Foothill', 34.27, -118.44),
(203, 'Rampart', 34.07, -118.26),
(212, 'Beverly Hills', 34.069, -118.405), -- this also has no crime link
(661, 'Lancaster', 34.693, -118.154); -- ths has no crime link



INSERT INTO VICTIM_INFO (vict_id, vict_name, vict_age, vict_sex, vict_descent) VALUES
(1,'John Smith',31,'M','Latin'),(2,'Michael Brown',32,'M','Latin'),(3,'David Johnson',30,'M','White'),
(4,'Emily Davis',47,'F','Asian'),(5,'James Wilson',63,'M','Latin'),(6,'Robert Taylor',35,'M','Black'),
(7,'Sarah Martinez',21,'F','Black'),(8,'Linda Garcia',14,'F','Latin'),(9,'William Anderson',43,'M','White'),
(10,'Mary Thomas',57,'F','White'),(11,'Daniel Jackson',13,'M','Latin'),(12,'Patricia White',34,'F','Asian'),
(13,'Christopher Harris',29,'M','White'),(14,'Barbara Martin',41,'F','Other'),(15,'Richard Thompson',32,'M','White'),
(16,'Susan Martinez',39,'F','Black'),(17,'Joseph Clark',26,'M','Black'),(18,'Thomas Rodriguez',21,'M','White'),
(19,'Charles Lewis',33,'M','White'),(20,'Nancy Lee',37,'F','Asian'),(21,'Karen Walker',34,'F','Latin'),
(22,'Mark Hall',28,'M','Latin'),(23,'Steven Allen',24,'M','Latin'),(24,'Paul Young',36,'M','Latin'),
(25,'Laura Hernandez',35,'F','Latin'),(26,'Kevin King',19,'M','Latin'),(27,'Brian Wright',43,'M','Latin'),
(28,'George Lopez',48,'M','Other'),(29,'Betty Hill',49,'F','Black'),(30,'Edward Scott',43,'M','Latin'),
(31,'Ronald Green',22,'F','Black'),(32,'Anthony Adams',19,'M','Latin'),(33,'Joshua Baker',39,'M','Latin'),
(34,'Margaret Gonzalez',58,'F','White'),(35,'Donald Nelson',46,'M','White'),(36,'Dorothy Carter',33,'F','Latin'),
(37,'Jason Mitchell',23,'M','Latin'),(38,'Justin Perez',21,'M','Black'),(39,'Ashley Roberts',28,'F','White'),
(40,'Andrew Turner',28,'M','Latin'),(41,'Jessica Phillips',34,'F','Other'),(42,'Amanda Campbell',18,'F','White'),
(43,'Matthew Parker',30,'M','White'),(44,'Jennifer Evans',51,'F','White'),(45,'Joshua Edwards',11,'M','Latin'),
(46,'Daniel Collins',48,'M','Latin'),(47,'Melissa Stewart',61,'F','Latin'),(48,'Ryan Sanchez',37,'M','White'),
(49,'Nicole Morris',31,'F','White'),(50,'Brandon Rogers',74,'M','White'),(51,'Samantha Reed',57,'F','Latin'),
(52,'Andrew Cook',53,'M','Latin'),(53,'Olivia Morgan',36,'F','Latin'),(54,'Ethan Bell',31,'M','Latin'),
(55,'Isabella Murphy',68,'F','Latin'),(56,'Christopher Bailey',50,'M','Latin'),(57,'Mia Rivera',39,'F','White'),
(58,'Alexander Cooper',49,'M','Other'),(59,'Grace Richardson',62,'F','Other'),(60,'Benjamin Cox',21,'F','Black'),
(61,'Victoria Howard',41,'F','Latin'),(62,'Nathan Ward',28,'M','Latin'),(63,'Hannah Torres',47,'F','White'),
(64,'Jack Peterson',37,'M','White'),(65,'Carlos Hernandez', 28, 'M', 'Latin'),(66,'Samuel Ramirez',68,'M','Black'),
(67,'Liam James',27,'M','Latin'),(68,'Chloe Watson',17,'F','Black'),(69,'Noah Brooks',47,'M','Latin'),
(70,'Evelyn Kelly',60,'F','Latin'),(71,'Logan Sanders',31,'M','Latin'),(72,'Zoe Price',52,'F','Other'),
(73,'Ella Bennett',46,'F','Latin'),(74,'Lucas Wood',29,'M','Latin'),(75,'Mason Barnes',34,'M','Latin'),
(76,'Harper Ross',50,'F','White'),(77,'Ethan Henderson',29,'M','White'),(78,'Abigail Coleman',46,'F','Black'),
(79,'Henry Jenkins',50,'M','White'),(80,'Lily Perry',53,'F','Latin'),(81,'Owen Powell',24,'F','Latin'),
(82,'Sophia Reed',33,'F','White'),(83,'Daniel Brooks',38,'M','Black'),(84,'Emma Carter',27,'F','Asian'),
(85,'Jacob Mitchell',45,'M','White'),(86,'Olivia Sanchez',31,'F','Latin'),(87,'William Turner',29,'M','White'),
(88,'Avery Collins',36,'F','Latin'),(89,'Ethan Foster',41,'M','Black'),(90,'Juan Rodriguez', 35, 'M', 'Latin'),
(91,'James Brooks',34,'M','White'),(92,'Isabella James',28,'F','Latin'),(93,'Michael Sanders',37,'M','White'),
(94,'Charlotte Gray',30,'F','Black'),(95,'Benjamin Reed',26,'M','Latin'),(96,'Amelia Watson',44,'F','White'),
(97,'Lucas Bell',39,'M','Latin'),(98,'Harper Wood',32,'F','Asian'),(99,'Henry Adams',48,'M','White'),
(100,'Lily Cooper',25,'F','Latin'),(101, 'Ava Gray',37,'F','Latin'), (102, 'Sophia Carter', 31, 'F', 'Black'),    
(103, 'Miguel Garcia', 24, 'M', 'Hispanic'), (104, 'Emily Wilson', 27, 'F', 'White'), 
(105, 'Mia Peterson',22,'F','Asian');



INSERT INTO CRIME_INFO (crm_no, Date_occ, Time_occ, DATE_rptd, Crm_desc, Weapon_desc, Status_desc, Premis_desc, Location, Area_code, vict_id) VALUES
(211507896, '2020-07-11', '07:23:00', '2021-11-04', 'THEFT OF IDENTITY', 'Metal Pipe', 'Invest Cont', 'HOUSE', 'BEEMAN AV', 818, 1),
(201516622, '2026-05-02', '14:45:00', '2026-05-02', 'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT', 'KNIFE WITH BLADE 6INCHES OR LESS', 'Invest Cont', 'SIDEWALK', 'ATOLL AV', 747, 2),
(240913563, '2026-05-02', '22:10:00', '2024-10-12', 'THEFT OF IDENTITY', 'Baseball Bat', 'Invest Cont', 'HOUSE', 'SYLVAN ST', 323, 3),
(210704711, '2026-05-02', '05:30:00', '2026-05-02', 'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)', 'Kitchen Knife', 'Invest Cont', 'STREET', 'COMEY AV', 424, 4),
(201418201, '2026-05-02', '13:15:00', '2020-03-10', 'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)', 'Hammer', 'Invest Cont', 'ALLEY', 'LA VILLA MARINA', 313, 5),
(240412063, '2020-11-11', '20:40:00', '2024-11-12', 'THEFT OF IDENTITY', 'Screwdriver', 'Invest Cont', 'APARTMENT', 'CRONUS ST', 310, 6),
(240317069, '2026-05-02', '04:55:00', '2026-05-02', 'THEFT OF IDENTITY', 'Broken Bottle', 'Invest Cont', 'HOUSE', 'W 40TH PL', 213, 7),
(201115217, '2020-07-07', '12:20:00', '2026-05-02', 'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)', 'UNKNOWN WEAPON/OTHER WEAPON', 'Adult Other', 'YARD (RESIDENTIAL/BUSINESS)', 'ACRESITE ST', 746, 8),
(241708596, '2020-02-03', '19:35:00', '2026-05-02', 'THEFT OF IDENTITY', 'Chain', 'Invest Cont', 'HOUSE', 'SIMONDS ST', 819, 9),
(242113813, '2020-01-09', '08:50:00', '2026-05-02', 'THEFT OF IDENTITY', 'Brick', 'Invest Cont', 'HOUSE', 'MARMORA ST', 738, 10),
(240605846, '2026-05-02', '16:05:00', '2024-06-02', 'CRM AGNST CHLD (13 OR UNDER) (14-15 & SUSP 10 YRS OLDER)', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Adult Arrest', 'HOUSE', 'N RIDGEWOOD PL', 829, 11),
(242014110, '2026-05-02', '23:20:00', '2026-05-02', 'THEFT OF IDENTITY', 'Rock', 'Invest Cont', 'APARTMENT', 'S ARDMORE AV', 828, 12),
(202113531, '2020-05-09', '06:35:00', '2020-06-09', 'VEHICLE - STOLEN', 'Pepper Spray', 'Adult Arrest', 'PARKING LOT', 'VANOWEN ST', 223, 13),
(201710725, '2020-02-07', '14:50:00', '2020-03-07', 'BURGLARY', 'Taser', 'Invest Cont', 'OTHER BUSINESS', 'COZYCROFT AV', 737, 14),
(201406733, '2026-05-02', '22:05:00', '2026-05-02', 'BURGLARY FROM VEHICLE', 'Stun Gun', 'Invest Cont', 'GARAGE/CARPORT', 'MOTOR AV', 203, 15),
(201405970, '2020-01-02', '05:20:00', '2020-01-02', 'THEFT PLAIN - PETTY ($950 & UNDER)', 'Bat', 'Adult Other', 'TRANSPORTATION FACILITY (AIRPORT)', 'WORLD WY', 818, 16),
(201820230, '2020-08-11', '13:35:00', '2020-08-11', 'INTIMATE PARTNER - SIMPLE ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Invest Cont', 'STREET', '108TH ST', 747, 17),
(201707577, '2026-05-02', '20:50:00', '2026-05-02', 'BATTERY - SIMPLE ASSAULT', 'UNKNOWN WEAPON/OTHER WEAPON', 'Invest Cont', 'RESTAURANT/FAST FOOD', 'DEVONSHIRE ST', 323, 18),
(201514848, '2026-05-02', '04:05:00', '2020-04-09', 'BURGLARY', 'Crowbar', 'Adult Arrest', 'APARTMENT', 'CUMPSTON ST', 424, 19),
(201405023, '2026-05-02', '12:20:00', '2026-05-02', 'BURGLARY', 'UNKNOWN WEAPON/OTHER WEAPON', 'Invest Cont', 'HOUSE', 'PURDUE AV', 313, 20),
(211306997, '2020-01-11', '19:35:00', '2021-09-03', 'THEFT PLAIN - PETTY ($950 & UNDER)', 'Axe', 'Invest Cont', 'HOUSE', 'E 18TH ST', 310, 21),
(201405778, '2026-05-02', '08:50:00', '2026-05-02', 'THEFT PLAIN - PETTY ($950 & UNDER)', 'Machete', 'Invest Cont', 'TRANSPORTATION FACILITY (AIRPORT)', 'WORLD WY', 213, 22),
(202005291, '2026-05-02', '16:05:00', '2026-05-02', 'THEFT PLAIN - PETTY ($950 & UNDER)', 'Razor Blade', 'Invest Cont', 'OTHER BUSINESS', 'WILSHIRE BL', 746, 23),
(201715737, '2026-05-02', '23:20:00', '2026-05-02', 'BURGLARY', 'Scissors', 'Invest Cont', 'HOUSE', 'VALJEAN AV', 819, 24),
(201608553, '2026-05-02', '06:35:00', '2026-05-02', 'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT', 'AIR PISTOL/REVOLVER/RIFLE/BB GUN', 'Adult Arrest', 'PARK/PLAYGROUND', 'HADDON AV', 738, 25),
(202006163, '2020-11-02', '14:50:00', '2026-05-02', 'VANDALISM - MISDEAMEANOR ($399 OR UNDER)', 'Flashlight', 'Invest Cont', 'VEHICLE, PASSENGER/TRUCK', 'WILSHIRE BL', 829, 26),
(202009677, '2026-05-02', '22:05:00', '2026-05-02', 'VEHICLE - ATTEMPT STOLEN', 'Belt', 'Invest Cont', 'STREET', 'S WILTON PL', 828, 27),
(201915689, '2026-05-02', '05:20:00', '2026-05-02', 'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)', 'Metal Pipe', 'Invest Cont', 'PARKING LOT', 'FOOTHILL BL', 223, 28),
(201918078, '2026-05-02', '13:35:00', '2026-05-02', 'ROBBERY', 'AIR PISTOL/REVOLVER/RIFLE/BB GUN', 'Invest Cont', 'PARKING LOT', 'N SEPULVEDA BL', 737, 29),
(202013248, '2020-09-08', '20:50:00', '2020-09-08', 'INTIMATE PARTNER - SIMPLE ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Adult Arrest', 'APARTMENT', 'S WESTMORELAND AV', 203, 30),
(202011749, '2026-05-02', '04:05:00', '2020-04-07', 'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)', 'Baseball Bat', 'Invest Cont', 'VEHICLE, PASSENGER/TRUCK', 'W 6TH ST', 818, 31),
(201811813, '2026-05-02', '12:20:00', '2026-05-02', 'VEHICLE - STOLEN', 'Kitchen Knife', 'Invest Cont', 'STREET', 'MENLO AV', 747, 32),
(201809657, '2026-05-02', '19:35:00', '2026-05-02', 'INTIMATE PARTNER - SIMPLE ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Invest Cont', 'HOUSE', 'W ROSECRANS AV', 323, 33),
(201409975, '2026-05-02', '08:50:00', '2026-05-02', 'BURGLARY FROM VEHICLE', 'Hammer', 'Invest Cont', 'STREET', 'VENICE BL', 424, 34),
(201819653, '2026-05-02', '16:05:00', '2026-05-02', 'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)', 'Screwdriver', 'Invest Cont', 'VEHICLE, PASSENGER/TRUCK', 'W ATHENS BL', 313, 35),
(201911106, '2026-05-02', '23:20:00', '2026-05-02', 'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT', 'HAND GUN', 'Invest Cont', 'STREET', 'BLYTHE ST', 310, 36),
(201819475, '2026-05-02', '06:35:00', '2026-05-02', 'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT', 'UNKNOWN FIREARM', 'Adult Other', 'STREET', 'W 148TH ST', 213, 37),
(202106474, '2026-05-02', '14:50:00', '2026-05-02', 'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Invest Cont', 'APARTMENT', 'VENTURA BL', 746, 38),
(202115676, '2020-03-11', '22:05:00', '2020-05-11', 'BURGLARY', 'Broken Bottle', 'Invest Cont', 'OTHER BUSINESS', 'CANOGA AV', 819, 39),
(201416348, '2026-05-02', '05:20:00', '2026-05-02', 'VEHICLE - STOLEN', 'Chain', 'Invest Cont', 'PARKING LOT', 'GLENCOE AV', 738, 40),
(201420586, '2026-05-02', '13:35:00', '2026-05-02', 'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)', 'Brick', 'Invest Cont', 'APARTMENT', 'SARDIS AV', 829, 41),
(201504263, '2020-05-01', '20:50:00', '2020-05-01', 'BURGLARY FROM VEHICLE', 'Rock', 'Invest Cont', 'PARKING LOT', 'VICTORY BL', 828, 42),
(202013922, '2026-05-02', '04:05:00', '2026-05-02', 'THEFT PLAIN - PETTY ($950 & UNDER)', 'Pepper Spray', 'Invest Cont', 'APARTMENT', 'S MANHATTAN PL', 223, 43),
(201615829, '2026-05-02', '12:20:00', '2026-05-02', 'ROBBERY', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Invest Cont', 'STREET', 'LAUREL CANYON BL', 737, 44),
(201908231, '2026-05-02', '19:35:00', '2026-05-02', 'FIREARMS RESTRAINING ORDER (FIREARMS RO)', 'Taser', 'Invest Cont', 'PARKING LOT', 'NOLLAN PL', 203, 45),
(220614831, '2026-05-02', '08:50:00', '2026-05-02', 'THEFT OF IDENTITY', 'Stun Gun', 'Invest Cont', 'SIDEWALK', 'TRANSIENT', 818, 46),
(201420127, '2020-08-11', '16:05:00', '2020-10-11', 'BIKE - STOLEN', 'Bat', 'Invest Cont', 'APARTMENT', 'S SEPULVEDA BL', 747, 47),
(201810632, '2020-04-05', '23:20:00', '2020-04-05', 'BATTERY - SIMPLE ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Invest Cont', 'SIDEWALK', 'MANCHESTER AV', 323, 48),
(202115664, '2020-03-09', '06:35:00', '2020-05-11', 'EMBEZZLEMENT, GRAND THEFT ($950.01 & OVER)', 'Crowbar', 'Adult Other', 'OTHER BUSINESS', 'SHERMAN WY', 424, 49),
(202013106, '2020-06-08', '14:50:00', '2020-06-08', 'THEFT PLAIN - PETTY ($950 & UNDER)', 'Axe', 'Adult Other', 'HOUSE', 'S WILTON PL', 313, 50),
(201908682, '2020-12-04', '22:05:00', '2020-12-04', 'CHILD ABUSE (PHYSICAL) - SIMPLE ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Adult Arrest', 'HOTEL', 'SEPULVEDA BL', 310, 51),
(201419812, '2020-06-11', '05:20:00', '2020-06-11', 'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)', 'Machete', 'Invest Cont', 'PARKING LOT', 'VENICE BL', 213, 52),
(210404224, '2026-05-02', '13:35:00', '2021-01-04', 'BURGLARY', 'Razor Blade', 'Invest Cont', 'OTHER RESIDENCE', 'WARWICK AV', 746, 53),
(202105280, '2026-05-02', '20:50:00', '2026-05-02', 'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)', 'Scissors', 'Invest Cont', 'STREET', 'VENTURA BL', 819, 54),
(201904694, '2026-05-02', '04:05:00', '2026-05-02', 'VEHICLE - STOLEN', 'Flashlight', 'Invest Cont', 'STREET', 'FOOTHILL', 738, 55),
(210205056, '2026-05-02', '12:20:00', '2021-12-01', 'THEFT OF IDENTITY', 'Belt', 'Invest Cont', 'BAR/SPORTS BAR (OPEN DAY & NIGHT)', 'WELCOME ST', 829, 56),
(202011797, '2020-04-07', '19:35:00', '2020-06-07', 'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)', 'Metal Pipe', 'Invest Cont', 'GAS STATION', 'BEVERLY BL', 828, 57),
(201407385, '2020-02-02', '08:50:00', '2020-02-03', 'BURGLARY FROM VEHICLE', 'Baseball Bat', 'Invest Cont', 'PARKING UNDERGROUND/BUILDING', 'MCLAUGHLIN AV', 223, 58),
(211104687, '2026-05-02', '16:05:00', '2026-05-02', 'VANDALISM - MISDEAMEANOR ($399 OR UNDER)', 'Kitchen Knife', 'Invest Cont', 'CHURCH/CHAPEL (CHANGED 03-03 FROM CHURCH/TEMPLE)', 'W SUNSET BL', 737, 59),
(201513536, '2020-04-08', '23:20:00', '2020-05-08', 'VEHICLE - STOLEN', 'Hammer', 'Invest Cont', 'STREET', 'CARTWRIGHT AV', 203, 60),
(201313153, '2026-05-02', '06:35:00', '2026-05-02', 'ROBBERY', 'UNKNOWN WEAPON/OTHER WEAPON', 'Adult Arrest', 'CELL PHONE STORE', 'E FLORENCE AV', 818, 61),
(201713754, '2020-01-08', '14:50:00', '2026-05-02', 'THEFT OF IDENTITY', 'Screwdriver', 'Invest Cont', 'HOUSE', 'ONEAL CT', 747, 62),
(201513294, '2026-05-02', '22:05:00', '2026-05-02', 'CRIMINAL THREATS - NO WEAPON DISPLAYED', 'VERBAL THREAT', 'Invest Cont', 'SHOPPING MALL (COMMON AREA)', 'W VENTURA BL', 323, 63),
(201817027, '2020-09-10', '05:20:00', '2020-09-10', 'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT', 'UNKNOWN WEAPON/OTHER WEAPON', 'Invest Cont', 'ALLEY', '95TH ST', 424, 64),
(201610419, '2026-05-02', '13:35:00', '2026-05-02', 'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)', 'Broken Bottle', 'Invest Cont', 'STREET', 'GLAMIS ST', 313, 65),
(201910095, '2026-05-02', '20:50:00', '2026-05-02', 'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)', 'Chain', 'Invest Cont', 'PARKING LOT', 'ROXFORD ST', 310, 66),
(201316902, '2026-05-02', '04:05:00', '2026-05-02', 'VEHICLE - STOLEN', 'Brick', 'Invest Cont', 'STREET', 'W 47TH ST', 213, 67),
(201416213, '2026-05-02', '12:20:00', '2026-05-02', 'BATTERY - SIMPLE ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Invest Cont', 'APARTMENT', 'S SEPULVEDA BL', 746, 68),
(201817878, '2026-05-02', '19:35:00', '2026-05-02', 'THEFT-GRAND ($950.01 & OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD', 'Rock', 'Invest Cont', 'PORCH, RESIDENTIAL', 'AVALON BL', 819, 69),
(202104312, '2020-05-01', '08:50:00', '2020-01-07', 'THEFT PLAIN - PETTY ($950 & UNDER)', 'Pepper Spray', 'Invest Cont', 'OTHER BUSINESS', 'VENTURA BL', 738, 70),
(202013579, '2026-05-02', '16:05:00', '2026-05-02', 'BATTERY WITH SEXUAL CONTACT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Invest Cont', 'HOUSE', 'W 2ND ST', 829, 71),
(201404274, '2020-01-04', '23:20:00', '2020-01-05', 'LETTERS, LEWD - TELEPHONE CALLS, LEWD', 'Taser', 'Invest Cont', 'HOUSE', 'W 84TH ST', 828, 72),
(201812009, '2020-02-06', '06:35:00', '2020-02-06', 'VEHICLE - STOLEN', 'Stun Gun', 'Invest Cont', 'STREET', 'S SAN PEDRO ST', 223, 73),
(201817357, '2020-09-12', '14:50:00', '2020-09-12', 'CRIMINAL THREATS - NO WEAPON DISPLAYED', 'VERBAL THREAT', 'Invest Cont', 'STREET', 'ROSECRANS', 737, 74),
(231808869, '2020-01-12', '22:05:00', '2023-04-04', 'THEFT OF IDENTITY', 'Bat', 'Invest Cont', 'HOUSE', 'COMPTON AV', 203, 75),
(201516878, '2026-05-02', '05:20:00', '2026-05-02', 'ROBBERY', 'VERBAL THREAT', 'Invest Cont', 'STREET', 'CHANDLER', 818, 76),
(201412163, '2020-06-11', '13:35:00', '2020-06-11', 'BURGLARY FROM VEHICLE', 'Crowbar', 'Invest Cont', 'STREET', 'REES ST', 747, 77),
(202113353, '2026-05-02', '20:50:00', '2026-05-02', 'VIOLATION OF COURT ORDER', 'Axe', 'Adult Arrest', 'HOUSE', 'SATICOY ST', 323, 78),
(201917640, '2020-02-12', '04:05:00', '2020-02-12', 'BATTERY - SIMPLE ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Invest Cont', 'STREET', 'POLK ST', 424, 79),
(201914494, '2026-05-02', '12:20:00', '2026-05-02', 'ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT', 'AIR PISTOL/REVOLVER/RIFLE/BB GUN', 'Invest Cont', 'DAM/RESERVOIR', 'GLADSTONE', 313, 80),
(201904416, '2020-01-08', '19:35:00', '2020-01-08', 'BATTERY - SIMPLE ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Invest Cont', 'RESTAURANT/FAST FOOD', 'N SEPULVEDA BL', 310, 81),
(201419844, '2020-06-11', '08:50:00', '2020-06-11', 'BATTERY - SIMPLE ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Invest Cont', 'OTHER/OUTSIDE', 'OCEAN FRONT WALK', 213, 82),
(202108355, '2026-05-02', '16:05:00', '2026-05-02', 'VEHICLE - STOLEN', 'Machete', 'Invest Cont', 'DRIVEWAY', 'QUINTA RD', 746, 83),
(201517126, '2026-05-02', '23:20:00', '2020-02-11', 'BURGLARY', 'Razor Blade', 'Invest Cont', 'APARTMENT', 'VINELAND AV', 819, 84),
(201809081, '2020-02-04', '06:35:00', '2020-02-04', 'BATTERY - SIMPLE ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Invest Cont', 'DRIVEWAY', 'W IMPERIAL HY', 738, 85),
(201321853, '2026-05-02', '14:50:00', '2026-05-02', 'VEHICLE - STOLEN', 'Scissors', 'Invest Cont', 'STREET', 'WOODLAWN AV', 829, 86),
(201805731, '2020-01-02', '22:05:00', '2020-01-02', 'INTIMATE PARTNER - SIMPLE ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Adult Other', 'HOUSE', 'S BROADWAY', 828, 87),
(202018701, '2026-05-02', '05:20:00', '2026-05-02', 'INTIMATE PARTNER - SIMPLE ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Adult Other', 'PARKING LOT', 'W PICO BL', 223, 88),
(202017008, '2020-07-11', '13:35:00', '2020-10-11', 'BURGLARY', 'Flashlight', 'Invest Cont', 'TRADE SCHOOL (MEDICAL-TECHNICAL-BUSINESS)*', 'WILSHIRE BL', 737, 89),
(201508263, '2026-05-02', '20:50:00', '2026-05-02', 'BATTERY - SIMPLE ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Adult Other', 'DRIVEWAY', 'SIMPSON AV', 203, 90),
(201311118, '2026-05-02', '04:05:00', '2026-05-02', 'BURGLARY FROM VEHICLE', 'Belt', 'Invest Cont', 'HOUSE', 'W 71ST ST', 818, 91),
(201816741, '2020-05-09', '12:20:00', '2020-05-09', 'ARSON', 'Metal Pipe', 'Invest Cont', 'VEHICLE, PASSENGER/TRUCK', '102ND ST', 747, 92),
(201604649, '2026-05-02', '19:35:00', '2026-05-02', 'THEFT PLAIN - PETTY ($950 & UNDER)', 'Baseball Bat', 'Invest Cont', 'STREET', 'OLINDA', 323, 93),
(202112082, '2026-05-02', '08:50:00', '2026-05-02', 'VIOLATION OF RESTRAINING ORDER', 'Kitchen Knife', 'Adult Other', 'APARTMENT', 'AVENUE SAN LUIS', 424, 94),
(201806232, '2020-02-08', '16:05:00', '2020-02-09', 'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)', 'Hammer', 'Invest Cont', 'STREET', 'E 97TH ST', 313, 95),
(201711611, '2026-05-02', '23:20:00', '2026-05-02', 'INTIMATE PARTNER - SIMPLE ASSAULT', 'UNKNOWN WEAPON/OTHER WEAPON', 'Invest Cont', 'APARTMENT', 'LASSEN ST', 310, 96),
(201411760, '2026-05-02', '06:35:00', '2026-05-02', 'THEFT FROM MOTOR VEHICLE - GRAND ($950.01 AND OVER)', 'Screwdriver', 'Invest Cont', 'DRIVEWAY', 'TIVOLI AV', 213, 97),
(202116043, '2026-05-02', '14:50:00', '2026-05-02', 'THEFT FROM MOTOR VEHICLE - PETTY ($950 & UNDER)', 'Broken Bottle', 'Invest Cont', 'PARKING LOT', 'TOPANGA CANYON BL', 746, 98),
(201811570, '2026-05-02', '22:05:00', '2026-05-02', 'BATTERY - SIMPLE ASSAULT', 'STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)', 'Adult Arrest', 'STREET', 'MANCHESTER AV', 819, 99),
(201913374, '2026-05-02', '05:20:00', '2026-05-02', 'VANDALISM - FELONY ($400 & OVER, ALL CHURCH VANDALISMS)', 'Chain', 'Invest Cont', 'VEHICLE, PASSENGER/TRUCK', 'CEDROS AV', 738, 100);



-- Q1 — INNER JOIN (all 3 tables)
-- Show every crime with victim name, age, descent, and area name
SELECT 
    CRIME_INFO.crm_no,                  -- Crime number
    VICTIM_INFO.vict_name,              -- Victim name
    VICTIM_INFO.vict_age,               -- Victim age
    VICTIM_INFO.vict_descent,            -- Victim descent
    AREA_INFO.Area_name                 -- Area name
FROM 
    CRIME_INFO
INNER JOIN 
    VICTIM_INFO ON CRIME_INFO.vict_id = VICTIM_INFO.vict_id  -- Join on victim ID
INNER JOIN 
    AREA_INFO ON CRIME_INFO.Area_code = AREA_INFO.Area_code;  -- Join on area code


-- Q2 — LEFT JOIN
-- Show all victims and their crimes, including victims with no crime linked
SELECT 
    VICTIM_INFO.vict_name,            -- Victim name
    VICTIM_INFO.vict_age,             -- Victim age
    VICTIM_INFO.vict_descent,          -- Victim descent
    CRIME_INFO.crm_no                 -- Crime number (if linked)
FROM 
    VICTIM_INFO
LEFT JOIN 
    CRIME_INFO ON VICTIM_INFO.vict_id = CRIME_INFO.vict_id; -- Left join on victim ID to include all victims


-- Q3 — RIGHT JOIN
-- Show all areas and their crime count, and those with no crime count like beverely hills and lancaster shouldnt appear then
SELECT          
    AREA_INFO.Area_name,              -- Area name
    COUNT(CRIME_INFO.crm_no) AS crime_count  -- Crime count per area
FROM 
    CRIME_INFO
RIGHT JOIN 
    AREA_INFO ON CRIME_INFO.Area_code = AREA_INFO.Area_code  -- Right join on area code
GROUP BY 
    AREA_INFO.Area_name;           -- Group by area name to count crimes

-- Q4 — SELF JOIN
-- Find crimes that happened at the same location on the same date
SELECT 
    A.crm_no AS crime1,               -- First crime number
    B.crm_no AS crime2,               -- Second crime number
    A.Location,                       -- Crime location
    A.Date_occ                        -- Date of occurrence
FROM 
    CRIME_INFO A
JOIN 
    CRIME_INFO B ON A.Location = B.Location   -- Self join on location
    AND A.Date_occ = B.Date_occ           -- Same date
WHERE 
    A.crm_no <> B.crm_no;             -- Ensure the crimes are different


-- Q5 — CASE WHEN + ALIAS
-- Classify victims into age groups and count crimes per group
SELECT 
    CASE 
        WHEN vict_age < 18 THEN 'Minor'               -- Age less than 18
        WHEN vict_age BETWEEN 18 AND 35 THEN 'Young Adult'   -- Age between 18 and 35
        WHEN vict_age BETWEEN 36 AND 60 THEN 'Adult'        -- Age between 36 and 60
        ELSE 'Senior'                                      -- Age greater than 60
    END AS Age_Group,                             -- Age group classification
    COUNT(CRIME_INFO.crm_no) AS crime_count          -- Count of crimes in each group
FROM 
    VICTIM_INFO
LEFT JOIN 
    CRIME_INFO ON VICTIM_INFO.vict_id = CRIME_INFO.vict_id  -- Left join on victim ID to count crimes
GROUP BY 
    Age_Group;                                     -- Group by age group to count crimes
    
    
    -- Find areas in AREA_INFO with no corresponding crime records in CRIME_INFO
SELECT AREA_INFO.Area_name
FROM AREA_INFO
LEFT JOIN CRIME_INFO ON AREA_INFO.Area_code = CRIME_INFO.Area_code
WHERE CRIME_INFO.crm_no IS NULL;


-- RIGHT JOIN to show all areas and their crime count, including areas with zero crimes
SELECT 
    AREA_INFO.Area_name,                -- Area name
    COUNT(CRIME_INFO.crm_no) AS crime_count  -- Crime count for each area
FROM 
    CRIME_INFO
RIGHT JOIN 
    AREA_INFO ON CRIME_INFO.Area_code = AREA_INFO.Area_code  -- RIGHT JOIN to include all areas
GROUP BY 
    AREA_INFO.Area_name;               -- Group by area name to get crime count
    
    
    
    -- RIGHT JOIN to show all areas and their crime count, including areas with zero crimes
SELECT 
    AREA_INFO.Area_name,               -- Area name
    COUNT(CRIME_INFO.crm_no) AS crime_count  -- Crime count for each area (if linked, else NULL)
FROM 
    AREA_INFO
RIGHT JOIN 
    CRIME_INFO ON AREA_INFO.Area_code = CRIME_INFO.Area_code  -- RIGHT JOIN on area code
GROUP BY 
    AREA_INFO.Area_name;               -- Group by area name to get crime count
    
    -- Q6 — GROUP BY + HAVING + COUNT
-- Show areas that have more than 5 crimes recorded

SELECT 
    AI.Area_name AS Area_Name,
    COUNT(CI.crm_no) AS Total_Crimes
FROM 
    AREA_INFO AI
INNER JOIN 
    CRIME_INFO CI ON AI.Area_code = CI.Area_code
GROUP BY 
    AI.Area_name
HAVING 
    COUNT(CI.crm_no) > 5
ORDER BY 
    Total_Crimes DESC;
    
    
    -- Q7 — DATE Function + ORDER BY + LIMIT
-- Find top 10 crimes with the longest reporting delay in days

SELECT 
    CI.crm_no AS Crime_Number,
    CI.Crm_desc AS Crime_Type,
    CI.Date_occ AS Date_Occurred,
    CI.DATE_rptd AS Date_Reported,
    DATEDIFF(CI.DATE_rptd, CI.Date_occ) AS Days_Delayed
FROM 
    CRIME_INFO CI
INNER JOIN 
    VICTIM_INFO VI ON CI.vict_id = VI.vict_id
WHERE 
    CI.DATE_rptd > CI.Date_occ
ORDER BY 
    Days_Delayed DESC
LIMIT 10;

-- Q8 — Single-Row Subquery
-- Find all crimes that happened in the same area 
-- as the area with the highest number of crimes

SELECT 
    CI.crm_no AS Crime_Number,
    CI.Crm_desc AS Crime_Type,
    CI.Location AS Street,
    AI.Area_name AS Area_Name
FROM 
    CRIME_INFO CI
INNER JOIN 
    AREA_INFO AI ON CI.Area_code = AI.Area_code
WHERE 
    CI.Area_code = (
        SELECT Area_code
        FROM CRIME_INFO
        GROUP BY Area_code
        ORDER BY COUNT(*) DESC
        LIMIT 1
    );
    
    -- Q9 — Multi-Row Subquery (IN)
-- List all victims whose crimes resulted in an arrest

SELECT 
    VI.vict_name AS Victim_Name,
    VI.vict_age AS Age,
    VI.vict_sex AS Gender,
    VI.vict_descent AS Descent
FROM 
    VICTIM_INFO VI
WHERE 
    VI.vict_id IN (
        SELECT vict_id
        FROM CRIME_INFO
        WHERE Status_desc = 'Adult Arrest'
    )
ORDER BY 
    VI.vict_name ASC;
    
    -- Q10 — Nested Subquery + AVG
-- Find crimes where the victim is older than 
-- the average age of all female victims

SELECT 
    CI.crm_no AS Crime_Number,
    CI.Crm_desc AS Crime_Type,
    VI.vict_name AS Victim_Name,
    VI.vict_age AS Victim_Age,
    VI.vict_sex AS Gender
FROM 
    CRIME_INFO CI
INNER JOIN 
    VICTIM_INFO VI ON CI.vict_id = VI.vict_id
WHERE 
    VI.vict_age > (
        SELECT AVG(vict_age)
        FROM VICTIM_INFO
        WHERE vict_sex = 'F'
    )
ORDER BY 
    VI.vict_age DESC;
    