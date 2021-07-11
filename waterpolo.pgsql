CREATE TABLE IF NOT EXISTS kapitany (
  id numeric(2,0) NOT NULL PRIMARY KEY,
  név varchar(18) DEFAULT NULL,
  született numeric(4,0) DEFAULT NULL,
  meghalt numeric(4,0) DEFAULT NULL
);

CREATE TABLE IF NOT EXISTS bajnoksag (
  id numeric(2,0) NOT NULL PRIMARY KEY,
  év numeric(4,0) DEFAULT NULL,
  helyszín varchar(13) DEFAULT NULL,
  helyezés numeric(1,0) DEFAULT NULL,
  kapitányid numeric(2,0) DEFAULT NULL,
  verseny varchar(18) DEFAULT NULL,
  CONSTRAINT kapitany FOREIGN KEY (kapitányid) REFERENCES kapitany(id)
);

DROP TABLE kapitany, bajnoksag;

INSERT INTO kapitany VALUES
(1, 'Speisegger Ernő', 1884, 1948),
(2, 'Beleznay László', 1891, 1953),
(3, 'Komjádi Béla', 1892, 1933),
(4, 'Ivády Sándor', 1903, 1998),
(5, 'Németh János', 1906, 1988),
(6, 'Sárkány Miklós', 1908, 1998),
(7, 'Rajki Béla', 1909, 2000),
(8, 'Laky Károly', 1912, 2000),
(9, 'Lemhényi Dezső', 1917, 2003),
(10, 'Gyarmati Dezső', 1927, 2013),
(11, 'Markovits Kálmán', 1931, 2009),
(12, 'Mayer Mihály', 1933, 2000),
(13, 'Rusorán Péter', 1940, 2012),
(14, 'Konrád János', 1941, 2014),
(15, 'Kásás Zoltán', 1946, 0),
(16, 'Horkai György', 1954, 0),
(17, 'Kemény Dénes', 1954, 0),
(18, 'Benedek Tibor', 1972, 2020);
INSERT INTO bajnoksag VALUES
(1, 1912, 'Stockholm', 5, 1, 'Olimpia'),
(2, 1924, 'Párizs', 5, 3, 'Olimpia'),
(3, 1928, 'Amszterdam', 2, 3, 'Olimpia'),
(4, 1932, 'LosAngeles', 1, 3, 'Olimpia'),
(5, 1936, 'Berlin', 1, 2, 'Olimpia'),
(6, 1948, 'London', 2, 5, 'Olimpia'),
(7, 1952, 'Helsinki', 1, 7, 'Olimpia'),
(8, 1956, 'Melbourne', 1, 7, 'Olimpia'),
(9, 1960, 'Róma', 3, 9, 'Olimpia'),
(10, 1964, 'Tokió', 1, 8, 'Olimpia'),
(11, 1968, 'Mexikóváros', 3, 11, 'Olimpia'),
(12, 1972, 'München', 2, 7, 'Olimpia'),
(13, 1976, 'Montreal', 1, 10, 'Olimpia'),
(14, 1980, 'Moszkva', 3, 10, 'Olimpia'),
(15, 1988, 'Szöul', 5, 15, 'Olimpia'),
(16, 1992, 'Barcelona', 6, 14, 'Olimpia'),
(17, 1996, 'Atlanta', 4, 16, 'Olimpia'),
(18, 2000, 'Sydney', 1, 17, 'Olimpia'),
(19, 2004, 'Athén', 1, 17, 'Olimpia'),
(20, 2008, 'Peking', 1, 17, 'Olimpia'),
(21, 2012, 'London', 5, 17, 'Olimpia'),
(22, 2016, 'Rio', 5, 18, 'Olimpia'),
(23, 1973, 'Belgrád', 1, 10, 'Világbajnokság'),
(24, 1975, 'Cali', 2, 10, 'Világbajnokság'),
(25, 1978, 'Nyugat-Berlin', 2, 10, 'Világbajnokság'),
(26, 1982, 'Guayaquil', 2, 12, 'Világbajnokság'),
(27, 1986, 'Madrid', 9, 10, 'Világbajnokság'),
(28, 1991, 'Perth', 3, 14, 'Világbajnokság'),
(29, 1994, 'Róma', 5, 16, 'Világbajnokság'),
(30, 1998, 'Perth', 2, 17, 'Világbajnokság'),
(31, 2001, 'Fukuoka', 5, 17, 'Világbajnokság'),
(32, 2003, 'Barcelona', 1, 17, 'Világbajnokság'),
(33, 2005, 'Montreal', 2, 17, 'Világbajnokság'),
(34, 2007, 'Melbourne', 2, 17, 'Világbajnokság'),
(35, 2009, 'Róma', 5, 17, 'Világbajnokság'),
(36, 2011, 'Sanghaj', 4, 17, 'Világbajnokság'),
(37, 2013, 'Barcelona', 1, 18, 'Világbajnokság'),
(38, 2015, 'Kazan', 6, 18, 'Világbajnokság'),
(39, 1927, 'Bologna', 1, 3, 'Európa-bajnokság'),
(40, 1931, 'Párizs', 1, 1, 'Európa-bajnokság'),
(41, 1934, 'Magdeburg', 1, 2, 'Európa-bajnokság'),
(42, 1938, 'London', 1, 4, 'Európa-bajnokság'),
(43, 1947, 'MonteCarlo', 4, 6, 'Európa-bajnokság'),
(44, 1954, 'Torino', 1, 9, 'Európa-bajnokság'),
(45, 1958, 'Budapest', 1, 9, 'Európa-bajnokság'),
(46, 1962, 'Lipcse', 1, 8, 'Európa-bajnokság'),
(47, 1966, 'Utrecht', 5, 11, 'Európa-bajnokság'),
(48, 1970, 'Barcelona', 2, 7, 'Európa-bajnokság'),
(49, 1974, 'Bécs', 1, 10, 'Európa-bajnokság'),
(50, 1977, 'Jönköping', 1, 10, 'Európa-bajnokság'),
(51, 1981, 'Split', 3, 12, 'Európa-bajnokság'),
(52, 1983, 'Róma', 2, 13, 'Európa-bajnokság'),
(53, 1985, 'Szófia', 5, 13, 'Európa-bajnokság'),
(54, 1987, 'Strasbourg', 5, 15, 'Európa-bajnokság'),
(55, 1989, 'Bonn', 9, 15, 'Európa-bajnokság'),
(56, 1991, 'Athén', 5, 14, 'Európa-bajnokság'),
(57, 1993, 'Sheffield', 2, 16, 'Európa-bajnokság'),
(58, 1995, 'Bécs', 2, 16, 'Európa-bajnokság'),
(59, 1997, 'Sevilla', 1, 17, 'Európa-bajnokság'),
(60, 1999, 'Firenze', 1, 17, 'Európa-bajnokság'),
(61, 2001, 'Budapest', 3, 17, 'Európa-bajnokság'),
(62, 2003, 'Kranj', 3, 17, 'Európa-bajnokság'),
(63, 2006, 'Belgrád', 2, 17, 'Európa-bajnokság'),
(64, 2008, 'Málaga', 3, 17, 'Európa-bajnokság'),
(65, 2010, 'Zágráb', 4, 17, 'Európa-bajnokság'),
(66, 2012, 'Eindhoven', 3, 17, 'Európa-bajnokság'),
(67, 2014, 'Budapest', 2, 18, 'Európa-bajnokság'),
(68, 2016, 'Belgrád', 3, 18, 'Európa-bajnokság');

SELECT * FROM bajnoksag;
SELECT * FROM kapitany;
/*Listázza ki az összes olyan olimpia évét és helyszínét, ahol a magyar válogatott
aranyérmet szerzett! A listát rendezze évszám szerint csökkenő sorrendbe!*/
SELECT (2021-év) as "Hány éve volt", helyszín FROM bajnoksag
WHERE helyezés = 1 AND verseny = 'Olimpia' ORDER BY év desc;
/*Milyen világversenyeken vett részt a magyar válogatott 2008-ban? Írja ki a verseny
típusát, helyszínét, az elért helyezést és a szöv.kapitány nevét! */
SELECT verseny as típus, helyszín, helyezés as "elért helyezés", név as "szöv.kapitány"
FROM bajnoksag INNER JOIN kapitany ON kapitányid = kapitany.id
WHERE év = 2008;
/*Hány évesek voltak a kapitányok az egyes versenyeken? Jelenítse meg a kapitány nevét,
az életkorát és a verseny helyszínét! A számított mező neve életkor legyen! A listát
rendezze a kapitányok neve szerint névsorba! */
SELECT év-született as életkor, név, helyszín 
FROM bajnoksag INNER JOIN kapitany ON kapitányid = kapitany.id
ORDER BY név, életkor;
/*Összesen hány világversenyen vezették az egyes kapitányok a vízilabda válogatottat?
Jelenjen meg a listában a kapitány neve, a versenyek száma. A versenyek számát
tartalmazó mező neve „versenyek” legyen! A listát rendezze a versenynek száma szerint
csökkenő sorrendbe! */
SELECT count(kapitányid) as versenyek, név FROM bajnoksag
INNER JOIN kapitany ON kapitányid = kapitany.id
GROUP BY név ORDER BY versenyek DESC;
/*Írja ki azoknak a kapitányoknak a nevét és születési dátumát, akik keresztneve Dezső és
vezették a válogatottat olimpián. Minden kapitány neve csak egyszer szerepeljen a
listában! Rendezze a listát a kapitányok neve szerint ABC sorrendbe! */
SELECT DISTINCT név, született
FROM bajnoksag INNER JOIN kapitany ON kapitányid = kapitany.id
WHERE név LIKE '%Dezső' AND verseny = 'Olimpia' ORDER BY név;
/*Az egyes kapitányok hány versenyen szereztek dobogós helyezést a válogatottal? A
számított mezőt nevezze el ’versenyek’-re! Jelenítse meg a kapitány nevét és a
versenyek számát! (A helyezést ne!) Rendezze a listát a versenyek száma szerint
csökkenő sorrendbe! */
SELECT count(helyezés) as versenyek, név
FROM bajnoksag INNER JOIN kapitany ON kapitányid = kapitany.id
GROUP BY név ORDER BY versenyek desc;
/*Vannak olyan kapitányok, akik már elhunytak. Átlagosan hány évet éltek a régmúlt
szövetségi kapitányai? */
SELECT avg(meghalt-született) as életkor
FROM kapitany WHERE meghalt > 0;
/*Azok között a kapitányok között, akik már elhunytak ki volt az 5 legidősebben távozó
és hány évet éltek? */
SELECT (meghalt-született) as életkor, név
FROM kapitany WHERE meghalt > 0 ORDER BY életkor desc LIMIT 5;
/*Egyik szövetségi kapitány megnyerte a válogatottal az olimpiát, de sajnos a rákövetkező
évben elhunyt. Hogy hívták, melyik évben halt meg, hol volt és melyik évben az
olimpia? */

/*Listázza ki azoknak a kapitányoknak a nevét, akiknek legalább 3 világversenyen nem
sikerült dobogóra juttatnia a vízilabda válogatottat! */

/* */
/* */

