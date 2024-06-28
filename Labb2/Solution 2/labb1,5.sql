-- create database labb2;
use labb2;

DROP TABLE hyra_ut;
CREATE TABLE hyra_ut (
  medlems_nummer int NOT NULL,
  film_nummer int NOT NULL,
  slut_datum date,
  aterlamnings_datum date 
  );
  
  
  DROP TABLE reservera;
  CREATE TABLE reservera (
  medlems_nummer int NOT NULL,
  fnamn varchar(25),
  enamn varchar(25),
  film_nummer int NOT NULL,
  onskad_datum date
  );

  DROP TABLE film_regissor;
  CREATE TABLE film_regissor (
  film_nummer int NOT NULL,
  regissor_fornamn varchar(25),
  regissor_efternamn varchar(25) 
  );

  DROP TABLE film_aktor;
  CREATE TABLE film_aktor (
  film_nummer int NOT NULL,
  aktor_fornamn varchar(25),
  aktor_efternamn varchar(25) 
  );  
  
  
DROP TABLE film_i_butik;
CREATE TABLE film_i_butik (
  butik_nummer int NOT NULL,
  film_nummer int NOT NULL,
  pris int,
  hyll_nummer int,
  antal_kopior int 
  );
  
  
DROP TABLE Medlem;
CREATE TABLE Medlem (
  medlems_nummer int NOT NULL,
  fnamn varchar(25),
  enamn varchar(25),
  stad varchar(30),
  hus_nummer int,
  gata varchar(30),
  postnummer int,
  butik_nummer int NOT NULL,
  medlems_datum date
  );


DROP TABLE Anstalld;
CREATE TABLE Anstalld(
anstallningsnummer int NOT NULL,
chefs_id int,
fornamn varchar(25) ,
efternamn varchar(25) ,
butik_nummer int NOT NULL
);
  
-- DROP TABLE Film_roll;
-- CREATE TABLE Film_roll (
-- film_nummer int NOT NULL,
-- m_id int NOT NULL,
-- roll varchar(25) NOT NULL, 
-- for_namn varchar(25),
-- efter_namn varchar(25)
-- );  
  
DROP TABLE Film;
CREATE TABLE Film (
  film_nummer int NOT NULL,
  titel varchar(30),
  filmlangd int,
  hudvid_kategory varchar(25) 
  );
  
  
DROP TABLE Butik;
CREATE TABLE Butik (
  butik_nummer int NOT NULL,
  telefonnummer int,
  butik_namn varchar(30),
  stad varchar(30),
  hus_nummer int,
  gata varchar(30),
  postnummer int 
  );
  
  -- här sätter jag primary keys
ALTER TABLE Butik ADD CONSTRAINT Butik_PK PRIMARY KEY (butik_nummer);
ALTER TABLE Anstalld ADD CONSTRAINT Anstalld_PK PRIMARY KEY (anstallningsnummer);
ALTER TABLE Film ADD CONSTRAINT Film_PK PRIMARY KEY (film_nummer);
ALTER TABLE Medlem ADD CONSTRAINT Medlem_PK PRIMARY KEY (medlems_nummer);
-- ALTER TABLE Chef ADD CONSTRAINT Chef_PK PRIMARY KEY (chef_id);
ALTER TABLE reservera ADD CONSTRAINT reservera_PK PRIMARY KEY (medlems_nummer,film_nummer);
ALTER TABLE hyra_ut ADD CONSTRAINT reservera_PK PRIMARY KEY (medlems_nummer,film_nummer);
ALTER TABLE film_i_butik ADD CONSTRAINT film_i_butik_PK PRIMARY KEY (butik_nummer,film_nummer);
 ALTER TABLE film_aktor ADD CONSTRAINT film_aktor_PK PRIMARY KEY (film_nummer,aktor_fornamn,aktor_efternamn);
 ALTER TABLE film_regissor ADD CONSTRAINT film_regissor_PK PRIMARY KEY (film_nummer,regissor_fornamn,regissor_efternamn);
-- ALTER TABLE Film_roll ADD CONSTRAINT Film_roll_PK PRIMARY KEY (film_nummer,m_id,roll);




-- här sätter jag forign keys

-- ALTER TABLE Anstalld ADD CONSTRAINT Anstalld_FK FOREIGN KEY (chefs_id) REFERENCES Chef (chef_id) on update cascade on delete cascade;
ALTER TABLE Anstalld ADD CONSTRAINT Anstalld3_FK FOREIGN KEY (butik_nummer) REFERENCES Butik (butik_nummer) on update cascade on delete cascade;
ALTER TABLE Anstalld ADD CONSTRAINT chefs_id_FK FOREIGN KEY (chefs_id) REFERENCES Anstalld (anstallningsnummer) on update cascade on delete cascade;


  ALTER TABLE film_aktor ADD CONSTRAINT film_aktor_FK FOREIGN KEY (film_nummer) REFERENCES Film (film_nummer) on update cascade on delete cascade;

  ALTER TABLE film_regissor ADD CONSTRAINT film_regissor_FK FOREIGN KEY (film_nummer) REFERENCES Film (film_nummer) on update cascade on delete cascade;

ALTER TABLE film_i_butik ADD CONSTRAINT film_i_butik_FK FOREIGN KEY (butik_nummer) REFERENCES Butik (butik_nummer) on update cascade on delete cascade;
ALTER TABLE film_i_butik ADD CONSTRAINT film_i_butik2_FK FOREIGN KEY (film_nummer) REFERENCES Film (film_nummer) on update cascade on delete cascade;

ALTER TABLE hyra_ut ADD CONSTRAINT medlems_nummer_FK FOREIGN KEY (medlems_nummer) REFERENCES Medlem (medlems_nummer) on update cascade on delete cascade;
ALTER TABLE hyra_ut ADD CONSTRAINT film_nummer_FK FOREIGN KEY (film_nummer) REFERENCES Film (film_nummer) on update cascade on delete cascade;

ALTER TABLE reservera ADD CONSTRAINT medlems_nummer2_FK FOREIGN KEY (medlems_nummer) REFERENCES Medlem (medlems_nummer) on update cascade on delete cascade;
ALTER TABLE reservera ADD CONSTRAINT film_nummer2_FK FOREIGN KEY (film_nummer) REFERENCES Film (film_nummer) on update cascade on delete cascade;

-- ALTER TABLE Film_roll ADD CONSTRAINT Film_roll_FK FOREIGN KEY (film_nummer) REFERENCES Film (film_nummer) on update cascade on delete cascade;


ALTER TABLE Medlem ADD CONSTRAINT butik_nummer_FK FOREIGN KEY (butik_nummer) REFERENCES Butik (butik_nummer) on update cascade on delete cascade;



-- butikerna
INSERT INTO Butik VALUES 
-- Butik 1
(11,0734567890,'Gulan','Stockholm',12,'Fornbyvagen',16370),
-- Butik 2
(22,0700389406,'Filmstaden','Sundsvall',16,'Nackstavagen',85352),
-- Butik 3
(33,0760859994,'Filmkedjan','Stockholm',25,'Ruddammsgatan',63340),
-- Butik 4
(44,0760859994,'Videodrome','Stockholm',18,'Kvissleby',86231),
-- Butik 5
(55,0760859994,'Hemmakvall','Stockholm',13,'Bankgatan',85231);

-- chefer i olika butiker
-- INSERT INTO Chef VALUES 
-- Butik 1
-- (1,'Malek','Joujo'),
-- Butik 2
-- (2,'Johannes','Joujo'),
-- Butik 3
-- (3,'Daniela','Joujo'),
-- Butik 4
-- (4,'Abborre','Joujo'),
-- Butik 5
-- (5,'Silva','Joujo');


-- lägger till anstalld i butiker
INSERT INTO Anstalld VALUES 
-- Butik 1
(100,NULL,'Malek','Joujo',11),(2,100,'Lars','Andersson',11),
(3,100,'Mikael','Johansson',11),(4,100,'Anders','Karlsson',11),
(5,100,'Johan','Nilsson',11),(6,100,'Erik','Eriksson',11),
-- Butik 2
(200,NULL,'Johannes','Joujo',22),
(7,200,'Lar','Larson',22),(8,200,'Mikael','Mikaelsson',22),
(9,200,'Anders','Andersson',22),(10,200,'Johan','Johansson',22),
(11,200,'Erika','Eriksson',22),
-- Butik 3
(300,NULL,'Daniela','Joujo',33),(12,300,'Anna','Olsson',33),
(13,300,'Eva','Persson',33),(14,300,'Maria','Gustafsson',33),
(15,300,'Sara','Ali',33),(16,300,'Thomas','Sandberg',33),
-- Butik 4
(400,NULL,'Abborre','Joujo',44),
(17,400,'Alice','Vera',44),(18,400,'Alma','Ella',44),
(19,400,'Stella','Ines',44),(20,400,'Ebba','Bush',44),
-- Butik 5
(500,NULL,'Saliva','Joujo',55),
(21,500,'Molly','Sanden',44),(22,500,'Ulf','Kristersson',55),
(23,500,'Magdalena','Andersson',55),(24,500,'Henrik','Vinge',55),
(25,500,'Mattias','Karlsson',55),(26,500,'Nooshi','Dadgostar',55);


-- filmers namn, längd på filmen och kategori
INSERT INTO Film VALUES 
-- film 1
(1,'The Shawshank Redemption',142,'Drama'),
-- film 2
(2,'The Godfather',175,'Crime'),
-- film 3
(3,'The Dark Knight',152,'Crime'),
-- film 4
(4,'The Godfather Part II',202,'Crime'),
-- film 5
(5,'Forrest Gump',142,'Comedi');



-- Hur många, vart och hur mycket kostar filmerna i olika butiker
INSERT INTO film_i_butik VALUES 
-- butik 1
(11,1,100,1,17),(11,2,150,2,15),(11,3,75,3,21),(11,4,175,4,13),(11,5,50,5,25),
-- butik 2
(22,1,100,1,7),(22,2,150,2,5),(22,3,75,3,2),(22,4,175,4,3),(22,5,50,5,5),
-- butik 3 
(33,1,100,2,10),(33,2,150,1,5),(33,3,75,3,9),(33,4,175,5,13),(33,5,50,4,18),
-- butik 4
(44,1,90,1,15),(44,2,100,2,12),(44,3,100,3,14),(44,4,175,4,5),(44,5,50,5,10),
-- butik 5
(55,1,85,1,17),(55,2,175,2,15),(55,3,175,3,2),(55,4,190,4,1),(55,5,50,5,25);


-- regisörrerna för filmerna som finns tillgängliga i butikerna
 INSERT INTO film_regissor VALUES 
-- film 1
 (1,'Frank','Darabont'),
-- film 2
 (2,'Francis','Coppola'),
-- film 3
 (3,'Christopher','Nolan'),
-- film 4
 (4,'Francis','Coppola'),
-- film 5
 (5,'Robert','Zemeckis');

-- insert into Film_roll values
-- (1,1,'Regissor','Frank','Darabont'), (1,2,'Regissor','Francis','Coppola'),
-- (3,3,'Regissor','Christopher','Nolan'), (4,4,'Regissor','Francis','Coppola'),
-- (5,5,'Regissor','Robert','Zemeckis'),
-- aktors för film 1
-- (1,1,'Aktor','Frank','Darabont'), (1,6,'Aktor','Tim','Robbins'),
-- (1,7,'Aktor','Morgan','Freeman'),(1,8,'Aktor','Bob','Gunton'),
-- för film 2
-- (2,9,'Aktor','Marlon','Brando'), (2,10,'Aktor','Al','Pacino'),
-- (2,11,'Aktor','James','Caan'),
-- för film 3
-- (3,12,'Aktor','Christian','Bale'),
-- för film 4
-- (4,9,'Aktor','Al','Pacino'),
-- för film 5
-- (5,13,'Aktor','Tom','Hanks');

-- lägger till värden i film_aktor
  INSERT INTO film_aktor VALUES 
-- film 1
  (1,'Frank','Darabont'),
  (1,'Tim','Robbins'),(1,'Morgan','Freeman'),(1,'Bob','Gunton'),
-- film 2
 (2,'Marlon','Brando'),(2,'Al','Pacino'),(2,'James','Caan'),
-- film 3
 (3,'Christian','Bale'),(3,'Heath','Ledger'),(3,'Aaron','Eckhart'),
-- film 4
 (4,'Al','Pacino'),(4,'Robert','De Niro'),(4,'Robert','Duvall'),
-- film 5
 (5,'Tom','Hanks'),(5,'Robin','Wring'),(5,'Gary','Sinise');

-- medlemmarna i butikerna
INSERT INTO Medlem(medlems_nummer,fnamn,enamn,stad,hus_nummer,gata,postnummer,butik_nummer,medlems_datum) VALUES 
(1,'Malika','Hansson','Stockholm',4,'Stenbygrand',16370,11,'2000-01-11'),
(2,'Jonna','Andersson','Sundsvall',16,'Nackstavagen',85352,22,'2002-03-12'),
(6,'Joakim','Lundell','Sundsvall',6,'Gronberg',85350,22,'2003-03-12'),
(3,'Daniel','Eriksson','Stockholm',4,'Stenbygrand',16370,33,'2005-01-24'),
(4,'Abod','Salah','Stockholm',4,'Stenbygrand',16370,44,'2000-04-20'),
(5,'Loe','Messi','Stockholm',4,'Stenbygrand',16370,55,'1988-12-11');

-- personer som reserverar filmer
INSERT INTO reservera VALUES 
(1,'Eric','Eriksson',1,'2022-10-10'),(1,'Eric','Eriksson',4,'2022-11-13'),
(2,'Jan','Emanuel',1,'2022-11-20'),(2,'Jan','Emanuel',5,'2022-11-23'),(2,'Jan','Emanuel',4,'2022-11-24'),
(3,'Ben','Mitkus',1,'2022-11-25'),(3,'Ben','Mitkus',2,'2022-11-25'),(3,'Ben','Mitkus',4,'2022-12-13'),
(4,'Dani','Jose',1,'2022-12-14'),(4,'Dani','Jose',5,'2022-12-17'),(5,'William','Dream',1,'2022-11-24');

-- hyrt ut några filmer
INSERT INTO hyra_ut VALUES 
(1,2,'2022-12-20','2022-11-13'),(1,3,'2022-12-20','2022-11-13'),
(1,4,'2022-12-20','2022-11-13'),(1,5,'2022-12-20','2022-11-13'),
(3,5,'2022-12-20','2022-11-13'),(3,1,'2022-12-20','2022-11-13'),
(3,2,'2022-12-20','2022-11-13'),(5,5,'2022-12-20','2022-11-13');





-- Lista ut alla butiker som inte har butik_nummer 22 --
-- select *from butik where butik_nummer!=22;

-- Lista ut alla butiker som har bokstaven a i namnet --
-- select * from butik where butik_namn like'%a%';

-- Lista ut alla medlemar som blev medlemar mellan '2002-03-12' och  '2005-01-24' --
-- select *from medlem where medlems_datum between '2002-03-12' and '2005-01-24';

-- Lista ut film_nummer,sum(pris), count(*), avg(pris),min(pris) för filmer --
-- select film_nummer,sum(pris), count(*), avg(pris),min(pris) from film_i_butik, butik where film_i_butik.butik_nummer=butik.butik_nummer group by film_nummer;

-- Lista ut billigaste priset priset för varje film --
-- select film_nummer,min(pris) from film_i_butik, butik where film_i_butik.butik_nummer=butik.butik_nummer group by film_nummer having min(pris);

-- Lista ut priset på filmer i storleksordning från störst till minst --
-- select *from film_i_butik order by pris desc;

-- Ta bort alla filmer från butik_nummer 11 som kostar 100 kr --
-- delete from film_i_butik where butik_nummer=11 and pris=100;


-- Lista ut vilken butik som har en film som kostar 85 kr --
-- select *from film_i_butik where pris =(select pris from film_i_butik where pris=85);
-- För allting som finns i butiken--
-- select *from film_i_butik where butik_nummer =(select butik_nummer from film_i_butik where pris=85);
-- Annan exempel om Naieb inte gillar den förra--
-- Lista ut alla priser som är större än avg(pris) --
-- select * from film_i_butik where pris>(select avg(pris) from film_i_butik);

-- Lista ut den dyraste filmen i varje butik --
-- select butik_nummer,avg(pris) from film_i_butik group by butik_nummer order by avg(pris) desc;

-- extra -- 
-- select * from film_regissor a, film_aktor b where a.regissor_fornamn=b.aktor_fornamn and a.film_nummer=b.film_nummer;



