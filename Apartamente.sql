DROP TABLE Proprietar;
DROP TABLE Apartament;
DROP TABLE Consum;
DROP TABLE Chitanta;

CREATE TABLE Proprietar
(id_proprietar double,
nume VARCHAR(30),
telefon VARCHAR(15),
email VARCHAR(50));

CREATE TABLE Apartament
(id_apartament double,
adresa VARCHAR(60),
nr_ap double,
suprafata double,
id_proprietar double);

CREATE TABLE Consum
(id_apartament double,
an double,
luna double,
nr_pers double,
cantitate double,
valoare double, 
pret_apa double);

CREATE TABLE Chitanta
(nr double,
data DATE,
id_apartament double,
valoare double);

INSERT INTO Proprietar
VALUES(322,'Luncan Razvan','042643932','razvan.luncan@gmail.com');

INSERT INTO Proprietar
VALUES(123,'Deme Maria','746743544','deme.maria@yahoo.com');

INSERT INTO Proprietar
VALUES(333,'Barbu Mihai','436665544','barbu.mihai@yahoo.com');

INSERT INTO Proprietar
VALUES(564,'Popescu Andrei','5654264','popescu_andrei@gmail.com');

INSERT INTO Proprietar
VALUES(869,'Adrian Dorel','54334264','adrian.dorel@yahoo.com');

INSERT INTO Apartament
VALUES(453,'Oradea Cazaban 44',5,55,123);

INSERT INTO Apartament
VALUES(888,'Bucuresti Eroilor 90',3,33,869);

INSERT INTO Apartament
VALUES(432,'Cluj-Napoca Croitrorilor 22',6,61,123);

INSERT INTO Apartament
VALUES(111,'Arad Mihai Eminescu 34',5,60,123);

INSERT INTO Apartament
VALUES(112,'Oradea Cazaban 34',5,60,564);

INSERT INTO Apartament
VALUES(777,'Oradea Republicii 12',12,61,123);

INSERT INTO Apartament
VALUES(873,'Cluj-Napoca Strada Observatorului 34',45,90,322);

INSERT INTO Apartament
VALUES(555,'Oradea Strada Salcamilor 66',14,67,322);

INSERT INTO Apartament
VALUES(875,'Reghin Strada Petru Maior nr.12',78,59,333);

INSERT INTO Apartament
VALUES(787,'Osorhei Strada Principala nr.333',78,91,333);

INSERT INTO Apartament
VALUES(921,'Turda Baita 17',45,76,322);

INSERT INTO Apartament
VALUES(444,'Turda Baita 17',67,88,333);

INSERT INTO Apartament
VALUES(892,'Turda Baita 17',50,99,333);

INSERT INTO Apartament
VALUES(98,'Turda Baita 17',7,88,123);

INSERT INTO Apartament
VALUES(44,'Turda Baita 17',12,97,333);

INSERT INTO Apartament
VALUES(149,'Turda Baita 17',7,50,564);

INSERT INTO Apartament
VALUES(4,'Cluj-Napoca Masinistilor 90',10,88,322);

INSERT INTO Consum
VALUES(444,2018,03,45,12,999,43);

INSERT INTO Consum
VALUES(892,2017,05,65,10,87.0,11);

INSERT INTO Consum
VALUES(921,2019,04,4,23,87.0,11);

INSERT INTO Consum
VALUES(453,2018,03,3,23,43.2,14);

INSERT INTO Consum
VALUES(44,2018,08,2,12,34.5,12.2);

INSERT INTO Consum
VALUES(98,2018,08,3,54,66,19);

INSERT INTO Consum
VALUES(149,2018,09,2,44,23,44);

INSERT INTO Consum
VALUES(892,2018,05,64,19,82,5);

INSERT INTO Consum
VALUES(149,2018,02,1,33,24,33);

INSERT INTO Consum
VALUES(444,2019,01,3,110,89,5);

INSERT INTO Consum
VALUES(98,2017,12,2,34,22,17);

INSERT INTO Consum
VALUES(892,2017,11,3,2,4,5);

INSERT INTO Consum
VALUES(453,2019,10,32,222,43,14);

INSERT INTO Consum
VALUES(777,2018,05,6,7,90,32);

INSERT INTO Consum
VALUES(777,2019,05,3,3,88,12);

INSERT INTO Consum
VALUES(4,2017,04,2,2,56,45);

INSERT INTO Consum
VALUES(4,2017,07,5,5,66,91);

INSERT INTO Consum
VALUES(98,2018,04,6,3,22,20);

INSERT INTO Consum
VALUES(98,2018,03,6,3,22,20);

INSERT INTO Chitanta
VALUES(12,'21-Sep-2018',453,43.2);

INSERT INTO Chitanta
VALUES(13,'19-May-2017',453,63.2);

INSERT INTO Chitanta
VALUES(56,'10-Jun-2019',432,88.2);

INSERT INTO Chitanta
VALUES(65,'10-Dec-2019',432,99.2);

INSERT INTO Chitanta
VALUES(87,'07-Jan-2018',777,76.2);

INSERT INTO Chitanta
VALUES(90,'01-Mar-2017',777,66.2);

INSERT INTO Chitanta
VALUES(10,'15-Jul-2018',777,66.2);

ALTER TABLE Proprietar
ADD CONSTRAINT proprietar_id_p_pk PRIMARY KEY(id_proprietar);

ALTER TABLE Apartament
ADD CONSTRAINT apartament_id_p_pk PRIMARY KEY (id_apartament);

ALTER TABLE Consum
ADD CONSTRAINT consum_ap_an_luna_pk PRIMARY KEY (id_apartament,an,luna);

ALTER TABLE Chitanta
ADD CONSTRAINT chitanta_nr_pk PRIMARY KEY (nr);

ALTER TABLE Apartament
ADD CONSTRAINT apartament_id_proprietar_fk FOREIGN KEY (id_proprietar) REFERENCES Proprietar (id_proprietar);

ALTER TABLE Consum
ADD CONSTRAINT consum_id_ap_fk FOREIGN KEY (id_apartament) REFERENCES Apartament(id_apartament);

ALTER TABLE Chitanta
ADD CONSTRAINT chitanta_id_ap_fk FOREIGN KEY (id_apartament) REFERENCES Apartament (id_apartament);

ALTER TABLE Consum
ADD CONSTRAINT ck_an_verif CHECK(an>=2017 AND an<=2019);

ALTER TABLE Consum
ADD CONSTRAINT ck_cant_verificare CHECK((cantitate=0 AND nr_pers=0) OR(cantitate!=0));