
CREATE TABLE futar (
  fazon INTEGER NOT NULL default '0',
  fnev varchar(25) NOT NULL default '',
  ftel varchar(12) NOT NULL default '',
  PRIMARY KEY  (fazon)
);

CREATE TABLE pizza (
  pazon integer NOT NULL default '0',
  pnev varchar(15) NOT NULL default '',
  par integer NOT NULL default '0',
  PRIMARY KEY  (pazon)
);

CREATE TABLE vevo (
  vazon integer NOT NULL default '0',
  vnev varchar(30) NOT NULL default '',
  vcim varchar(30) NOT NULL default '',
  PRIMARY KEY  (vazon)
);

CREATE TABLE rendeles (
  razon integer NOT NULL default '0',
  vazon integer NOT NULL default '0',
  fazon integer NOT NULL default '0',
  idopont date NOT NULL,
  PRIMARY KEY  (razon),
  CONSTRAINT v_FK FOREIGN KEY (vazon) REFERENCES vevo(vazon),
  CONSTRAINT f_FK FOREIGN KEY (fazon) REFERENCES futar(fazon)
);

CREATE TABLE tetel (
  razon integer NOT NULL default '0',
  pazon integer NOT NULL default '0',
  db integer NOT NULL default '0',
  CONSTRAINT r_FK FOREIGN KEY (razon) REFERENCES rendeles(razon),
  CONSTRAINT p_FK FOREIGN KEY (pazon) REFERENCES pizza(pazon)
);

INSERT INTO futar VALUES (1, 'Hurrikán', '123456');
INSERT INTO futar VALUES (2, 'Gyalogkakukk', '666666');
INSERT INTO futar VALUES (3, 'Gömbvillám', '888888');
INSERT INTO futar VALUES (4, 'Szélvész', '258369');
INSERT INTO futar VALUES (5, 'Imperial', '987654');

INSERT INTO pizza VALUES (1, 'Capricciosa', 1050);
INSERT INTO pizza VALUES (2, 'Frutti di Mare', 1350);
INSERT INTO pizza VALUES (3, 'Hawaii', 850);
INSERT INTO pizza VALUES (4, 'Vesuvio', 900);
INSERT INTO pizza VALUES (5, 'Sorrento', 1050);

INSERT INTO vevo VALUES (1, 'Hapci', '');
INSERT INTO vevo VALUES (2, 'Vidor', '');
INSERT INTO vevo VALUES (3, 'Tudor', '');
INSERT INTO vevo VALUES (4, 'Kuka', '');
INSERT INTO vevo VALUES (5, 'Szende', '');
INSERT INTO vevo VALUES (6, 'Szundi', '');
INSERT INTO vevo VALUES (7, 'Morgó', '');

INSERT INTO rendeles VALUES (1, 4, 2, '2016-10-01 12:04:11');
INSERT INTO rendeles VALUES (2, 7, 2, '2016-10-01 13:18:44');
INSERT INTO rendeles VALUES (3, 1, 1, '2016-10-02 10:11:41');
INSERT INTO rendeles VALUES (4, 5, 2, '2016-10-02 10:24:59');
INSERT INTO rendeles VALUES (5, 2, 3, '2016-10-02 13:19:06');
INSERT INTO rendeles VALUES (6, 4, 2, '2016-10-03 13:14:38');
INSERT INTO rendeles VALUES (7, 6, 2, '2016-10-04 11:10:35');
INSERT INTO rendeles VALUES (8, 7, 4, '2016-10-04 15:34:58');
INSERT INTO rendeles VALUES (9, 1, 5, '2016-10-04 17:07:59');
INSERT INTO rendeles VALUES (10, 3, 5, '2016-10-04 20:21:51');
INSERT INTO rendeles VALUES (11, 2, 1, '2016-10-05 18:52:53');
INSERT INTO rendeles VALUES (12, 5, 2, '2016-10-05 19:59:02');
INSERT INTO rendeles VALUES (13, 6, 2, '2016-10-06 14:55:03');
INSERT INTO rendeles VALUES (14, 4, 3, '2016-10-06 15:01:14');
INSERT INTO rendeles VALUES (15, 1, 4, '2016-10-06 18:48:46');
INSERT INTO rendeles VALUES (16, 2, 5, '2016-10-06 19:11:03');
INSERT INTO rendeles VALUES (17, 7, 2, '2016-10-06 19:56:28');
INSERT INTO rendeles VALUES (18, 3, 2, '2016-10-07 12:45:30');
INSERT INTO rendeles VALUES (19, 4, 5, '2016-10-07 13:00:56');
INSERT INTO rendeles VALUES (20, 1, 1, '2016-10-07 15:42:50');
INSERT INTO rendeles VALUES (21, 5, 3, '2016-10-08 18:56:00');

INSERT INTO tetel VALUES (1, 1, 2);
INSERT INTO tetel VALUES (1, 4, 3);
INSERT INTO tetel VALUES (2, 2, 1);
INSERT INTO tetel VALUES (3, 1, 2);
INSERT INTO tetel VALUES (4, 1, 1);
INSERT INTO tetel VALUES (4, 4, 1);
INSERT INTO tetel VALUES (5, 2, 4);
INSERT INTO tetel VALUES (6, 1, 1);
INSERT INTO tetel VALUES (6, 4, 1);
INSERT INTO tetel VALUES (6, 5, 1);
INSERT INTO tetel VALUES (7, 5, 5);
INSERT INTO tetel VALUES (8, 4, 3);
INSERT INTO tetel VALUES (9, 2, 1);
INSERT INTO tetel VALUES (10, 1, 1);
INSERT INTO tetel VALUES (10, 4, 1);
INSERT INTO tetel VALUES (11, 1, 1);
INSERT INTO tetel VALUES (12, 2, 2);
INSERT INTO tetel VALUES (12, 4, 2);
INSERT INTO tetel VALUES (13, 4, 1);
INSERT INTO tetel VALUES (13, 5, 1);
INSERT INTO tetel VALUES (13, 2, 1);
INSERT INTO tetel VALUES (14, 2, 2);
INSERT INTO tetel VALUES (15, 1, 1);
INSERT INTO tetel VALUES (16, 2, 1);
INSERT INTO tetel VALUES (16, 4, 1);
INSERT INTO tetel VALUES (16, 5, 1);
INSERT INTO tetel VALUES (17, 1, 2);
INSERT INTO tetel VALUES (17, 2, 3);
INSERT INTO tetel VALUES (18, 1, 4);
INSERT INTO tetel VALUES (18, 5, 1);
INSERT INTO tetel VALUES (19, 1, 1);
INSERT INTO tetel VALUES (19, 2, 1);
INSERT INTO tetel VALUES (19, 4, 1);
INSERT INTO tetel VALUES (19, 5, 1);
INSERT INTO tetel VALUES (20, 5, 3);
INSERT INTO tetel VALUES (21, 2, 2);
INSERT INTO tetel VALUES (21, 4, 1);

SELECT * FROM tetel;
SELECT * FROM vevo;
SELECT * FROM rendeles;
SELECT * FROM futar;
SELECT * FROM pizza;

SELECT fnev as "név nekije" FROM futar WHERE fnev LIKE 'g%';
SELECT fnev FROM futar WHERE fnev ILIKE 'g%';
/* Hogy hívják az egyes pizzafutárokat? */
SELECT fnev FROM futar;
/* Milyen pizzák közül lehet rendelni, és mennyibe kerülnek? */
SELECT pnev, par FROM pizza;
/* Mennyibe kerül átlagosan egy pizza? */
SELECT round(AVG(par),1) FROM pizza;
/* Mely pizzák olcsóbbak 1000 Ft-nál? */
SELECT pnev, par FROM pizza WHERE par < 1000;
/* Ki szállította házhoz az első (egyes sorszámú) rendelést? */
SELECT fnev FROM futar
INNER JOIN rendeles ON rendeles.fazon = futar.fazon WHERE razon = 1;
/* Kik rendeltek pizzát október 1. és 4. között? */
SELECT vnev FROM vevo
INNER JOIN rendeles ON rendeles.vazon = vevo.vazon 
WHERE idopont BETWEEN '2016-10-01 00:00:01' AND '2016-10-04 23:59:59';
/*  Milyen pizzákat evett Morgó? */
SELECT pnev FROM pizza
INNER JOIN tetel ON tetel.pazon = pizza.pazon
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
WHERE vnev = 'Morgó';
/* Ki szállított házhoz Tudornak? */
SELECT fnev FROM futar
INNER JOIN rendeles ON rendeles.fazon = futar.fazon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
WHERE vnev = 'Tudor';
/* Az egyes rendelések alkalmával ki kinek szállított házhoz? */
SELECT fnev, vnev FROM futar
INNER JOIN rendeles ON rendeles.fazon = futar.fazon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon;
/* Mennyit költött pizzára Vidor? */
SELECT SUM(par) FROM pizza 
INNER JOIN tetel ON tetel.pazon = pizza.pazon
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
WHERE vnev = 'Vidor';

SELECT SUM(par*db) FROM pizza 
INNER JOIN tetel ON tetel.pazon = pizza.pazon
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
WHERE vnev = 'Vidor';
/* Hány alkalommal rendelt Sorrento pizzát Kuka? */
SELECT count(*) FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
 WHERE pnev = 'Sorrento' AND vnev = 'Kuka';
/* Hány pizzát evett Szende? */
SELECT sum(db) FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
 WHERE vnev = 'Szende';
/*  Hányszor rendelt pizzát Hapci? */
SELECT * FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
 WHERE vnev = 'Hapci';
/* Hány darab Hawaii pizza fogyott összesen? */
UPDATE tetel SET pazon = 3 WHERE razon = 20;
SELECT sum(db) FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
 WHERE pnev = 'Hawaii';
/* Mennyit költöttek pizzára az egyes vevők? */
SELECT sum(par*db), vnev FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
 GROUP BY vnev;
/* Mennyit vettek az egyes vevők a különböző pizzákból? */
SELECT sum(db), pnev, vnev FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
 GROUP BY vnev, pnev ORDER BY vnev;
/* Ki hány pizzát szállított házhoz az egyes napokon? */
SELECT fnev, sum(db), idopont FROM futar
INNER JOIN rendeles ON rendeles.fazon = futar.fazon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
INNER JOIN tetel ON tetel.razon = rendeles.razon
INNER JOIN pizza ON pizza.pazon = tetel.pazon
GROUP BY idopont, fnev ORDER BY idopont;
/* Ki hány pizzát rendelt az egyes napokon? */
SELECT vnev, sum(db), idopont FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
GROUP BY idopont, vnev ORDER BY idopont;
/* Mennyi volt a bevétel az egyes napokon? */
SELECT sum(par*db), extract (MONTH FRom idopont) as hónap, extract (DAY FRom idopont) as nap FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
GROUP BY idopont ORDER BY idopont;
/* Hány pizza fogyott naponta? */
SELECT sum(db), idopont FROM rendeles
INNER JOIN tetel ON rendeles.razon = tetel.razon
GROUP BY idopont ORDER BY idopont;
/* Mennyi pizza fogyott átlagosan naponta? */
SELECT round(sum(db)/8.0,2) FROM rendeles
INNER JOIN tetel ON rendeles.razon = tetel.razon;
/* Hány pizzát rendeltek átlagosan egyszerre? */
SELECT round(avg(db),2) FROM rendeles
INNER JOIN tetel ON rendeles.razon = tetel.razon;
/* Hány házhoz szállítása volt az egyes futároknak? */
SELECT fnev, sum(db) FROM futar 
INNER JOIN rendeles ON rendeles.fazon = futar.fazon
INNER JOIN tetel ON tetel.razon = rendeles.razon
INNER JOIN pizza ON pizza.pazon = tetel.pazon
GROUP BY fnev;
/* A fogyasztás alapján mi a pizzák népszerűségi sorrendje? */
SELECT sum(db) as összrendelés, pnev FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
GROUP BY pnev ORDER BY összrendelés desc;
/* A rendelések összértéke alapján mi a vevők sorrendje? */
SELECT vnev, sum(db) as össz FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
GROUP BY vnev ORDER BY össz desc;
/* Melyik a legdrágább pizza? */
SELECT DISTINCT pnev, par FROM pizza ORDER BY par desc limit 1;
/* Ki szállította házhoz a legtöbb pizzát? */
SELECT fnev, sum(db) FROM futar 
INNER JOIN rendeles ON futar.fazon = rendeles.fazon
INNER JOIN tetel ON tetel.razon = rendeles.razon
INNER JOIN pizza ON tetel.pazon = pizza.pazon
GROUP BY fnev ORDER BY sum(db) desc LIMIT 1;
/* Ki ette a második legtöbb pizzát? */
SELECT vnev, sum(db) FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
GROUP BY vnev ORDER BY sum(db) desc LIMIT 1 offset 1;
/* Melyik nap fogyott a legtöbb pizza? */
SELECT sum(db), idopont FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
GROUP BY idopont ORDER BY sum(db) desc LIMIT 1;
/* Melyik nap fogyott a legtöbb Capricciosa pizza? */
SELECT sum(db), idopont FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
WHERE pnev = 'Capricciosa'
GROUP BY idopont ORDER BY sum(db) desc LIMIT 1;
/* Hány pizza fogyott a legforgalmasabb napon? */
SELECT sum(db) as "db pizza", count(rendeles.razon) as "rendelések száma", idopont FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
GROUP BY idopont ORDER BY sum(db) desc LIMIT 1;
/* Mennyi volt a bevétel a legjobb napon? */
SELECT sum(par*db) as bevétel, idopont FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon 
INNER JOIN rendeles ON rendeles.razon = tetel.razon
GROUP BY idopont ORDER BY bevétel desc LIMIT 1;
/*  */
/*  */
/*  */
/*  */
/*  */
/*  */
/*  */
/*  */
/*  */
/*  */
/*  */
/*  */
/*  */
/*  */
/*  */
/*  */
/*  */
/*  */
/*  */