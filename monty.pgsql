CREATE DATABASE katica;
CREATE TABLE kategoria (
    id INTEGER PRIMARY KEY,
    kategoriaNev VARCHAR(50)
);

CREATE TABLE forgalom (
    id INTEGER PRIMARY KEY,
    termek VARCHAR(50),
    vevo VARCHAR(20),
    kategoriaID INTEGER,
    egyseg VARCHAR(10),
    nettoar INTEGER,
    mennyiseg INTEGER,
    kiadva BOOLEAN,
    CONSTRAINT katicaFK FOREIGN KEY (kategoriaID) REFERENCES kategoria(id)
);

ALTER TABLE forgalom DROP kiadva;
ALTER TABLE forgalom ADD kiadva BOOLEAN;


INSERT INTO kategoria(id, kategoriaNev) VALUES
  (1, 'Ételek'),
  (2, 'Italok');

INSERT INTO forgalom(id, termek, vevo, kategoriaId, egyseg, nettoar, mennyiseg, kiadva) VALUES
(246, 'Sajtos hot-dog', 'Lajos', 1, 'db', 450, 2, TRUE),
(247, 'Limonádé', 'Lajos', 2, 'dl', 100, 5, TRUE),
(248, 'Gyrostál', 'Kinga', 1, 'db', 1500, 1, TRUE),
(249, 'Ízes palacsinta', 'Kinga', 1, 'db', 350, 2, TRUE),
(250, 'Túros palacsinta', 'Kinga', 1, 'db', 270, 1, TRUE),
(251, 'Narancslé', 'Kinga', 2, 'dl', 150, 3, TRUE),
(252, 'Főtt virsli', 'Jenő', 1, 'pár', 450, 2, FALSE),
(253, 'Kenyér', 'Jenő', 1, 'szelet', 60, 2, TRUE),
(254, 'Gyrostál', 'Ági', 1, 'db', 1500, 3, FALSE),
(255, 'Málnaszörp', 'Ági', 2, 'dl', 100, 10, FALSE),
(256, 'Sajtos hot-dog', 'Lajos', 2, 'db', 450, 2, FALSE),
(257, 'Málnaszörp', 'Lajos', 2, 'dl', 100, 3, FALSE),
(258, 'Gyrostál', 'Jenő', 1, 'db', 1500, 1, FALSE);

SELECT * FROM kategoria;
SELECT * FROM forgalom;

INSERT INTO kategoria(id, kategoriaNev) VALUES
(3, 'Ajándéktárgyak');

UPDATE forgalom SET termek = 'Gyros tál' WHERE termek = 'Gyrostál';

SELECT termek, vevo FROM forgalom WHERE kiadva = FALSE ORDER BY vevo;

SELECT sum(nettoar*mennyiseg), sum(nettoar*mennyiseg*0.27) as áfa FROM forgalom 
INNER JOIN kategoria ON kategoria.id = forgalom.kategoriaID
GROUP BY kategoriaNev;

CREATE TABLE epizodok (
  id integer NOT NULL,
  nev varchar(255) DEFAULT NULL,
  sorozat varchar(255) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tipusok (
  id INTEGER NOT NULL,
  tipus varchar(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE forgatokonyv (
  id INTEGER NOT NULL,
  epizodid integer DEFAULT NULL,
  resz varchar(255) DEFAULT NULL,
  tipusid integer DEFAULT 1,
  szinesz varchar(255) DEFAULT NULL,
  karakter varchar(255) DEFAULT NULL,
  reszletek text NOT NULL,
  felvetel_datuma date NOT NULL,
  lejatszas_datuma date NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT FK_forgatokonyv_tipusok_id FOREIGN KEY (tipusid)
  REFERENCES tipusok (id),
  CONSTRAINT FK_scripts_epizodok_id FOREIGN KEY (epizodid)
  REFERENCES epizodok (id)
);

INSERT INTO epizodok VALUES
(1, 'Episode One: Whither Canada?', '1/1'),
(2, 'Episode Two: Sex and violence', '1/2'),
(3, 'Episode Three: How to recognise different types of trees from quite a long way away', '1/3'),
(4, 'Episode Four: Owl-stretching time', '1/4'),
(5, 'Episode Five: Man''s crisis of identity in the latter half of the twentieth century', '1/5'),
(6, 'Episode Six', '1/6'),
(7, 'Episode Seven: You''re no fun any more', '1/7'),
(8, 'Episode Eight: Full frontal nudity', '1/8'),
(9, 'Episode Nine: The ant, an introduction', '1/9'),
(10, 'Episode Ten', '1/10');

INSERT INTO tipusok VALUES
(1, 'utasítás'),
(2, 'dialógus'),
(3, 'nem beállított');

INSERT INTO forgatokonyv VALUES
(1, 1, NULL, 2, 'Michael Palin', 'It''s Man', 'It''s...', '1969-09-07', '1969-10-05'),
(2, 1, NULL, 2, 'John Cleese', 'Voice Over', 'Monty Python''s Flying Circus.', '1969-09-07', '1969-10-05'),
(3, 1, NULL, 1, NULL, NULL, 'Titles beginning with words "Monty Python''s Flying Circus". Various bizarre things happen. When titles end:', '1969-09-07', '1969-10-05'),
(4, 1, NULL, 1, NULL, NULL, 'Ordinary grey-suited announcer standing by desk. He smiles confidently.', '1969-09-07', '1969-10-05'),
(5, 1, NULL, 2, 'Graham Chapman', 'Announcer', 'Good evening.', '1969-09-07', '1969-10-05'),
(6, 1, NULL, 1, NULL, NULL, 'The announcer confidently moves to chair and sits down. There is a squeal as of a pig being sat upon.', '1969-09-07', '1969-10-05'),
(7, 1, NULL, 1, NULL, NULL, 'Cut to a blackboard with several lines of pigs drawn on it in colour. A man steps into view and with a piece of chalk crosses out one of the pigs', '1969-09-07', '1969-10-05'),
(8, 1, 'It''s Wolfgang Amadeus Mozart', 1, NULL, NULL, 'CAPTION: ''IT''S WOLFGANG AMADEUS MOZART''', '1969-09-07', '1969-10-05'),
(9, 1, 'It''s Wolfgang Amadeus Mozart', 1, NULL, NULL, 'Mozart sitting at piano tinkling with the keys. He finishes tinkling.', '1969-09-07', '1969-10-05'),
(10, 1, 'Famous deaths', 2, 'John Cleese', 'Mozart', 'Hello again, and welcome to the show. Tonight we continue to look at some famous deaths. Tonight we start with the wonderful death of Genghis Khan, conqueror of India. Take it away Genghis.', '1969-09-07', '1969-10-05'),
(11, 1, 'Famous deaths', 1, NULL, NULL, 'Cut to Genghis Khan''s tent. Genghis strides about purposefully. Indian-style background music. Suddenly the music cuts out and Genghis Khan with a squawk throws himself in the air and lands on his back. This happens very suddenly. Judges hold up cards with points on, in the manner of ice skating judges.', '1969-09-07', '1969-10-05'),
(12, 1, 'Famous deaths', 2, 'Graham Chapman', 'Voice Over', '9.1, 9.3, 9.7, that''s 28.1 for Genghis Khan.', '1969-09-07', '1969-10-05'),
(13, 1, 'Famous deaths', 1, NULL, NULL, 'Mozart still at piano.', '1969-09-07', '1969-10-05'),
(14, 1, 'Famous deaths', 2, 'John Cleese', 'Mozart', 'Bad luck Genghis. Nice to have you on the show. And now here are the scores.', '1969-09-07', '1969-10-05'),
(15, 1, 'Famous deaths', 1, NULL, NULL, 'Scoreboard with Eddie Waring figure standing by it. The scoreboard looks a little like this:', '1969-09-07', '1969-10-05'),
(16, 1, 'Famous deaths', 1, NULL, NULL, 'St Stephan 29.9 Richard III 29.3 Jean D''arc 29.1 Marat 29.0 A. Lincoln (U.S of A)  28.2 G. Khan 28.1 King Edward VII 3.1 ', '1969-09-07', '1969-10-05'),
(17, 1, 'Famous deaths', 2, 'Eric Idle', 'Eddie', 'Well there you can see the scores now. St Stephen in the lead there with his stoning, then comes King Richard the Third at Bosworth Field, a grand death that, then the very lovely Jean d''Arc, then Marat in his bath - best of friends with Charlotte in the showers afterwards - then A. Lincoln of the U.S of A, a grand little chap that, and number six Genghis Khan, and the back marker King Edward the Seventh. Back to you, Wolfgang.', '1969-09-07', '1969-10-05'),
(18, 1, 'Famous deaths', 2, 'John Cleese', 'Mozart', 'Thank you, Eddie. And now time for this week''s request death.', '1969-09-07', '1969-10-05'),
(19, 1, 'Famous deaths', 1, NULL, 'Mozart', 'taking card off piano', '1969-09-07', '1969-10-05'),
(20, 1, 'Famous deaths', 2, 'John Cleese', 'Mozart', 'For Mr and Mrs Violet Stebbings of 23 Wolverston Road, Hull, the death of Mr Bruce Foster of Guildford.', '1969-09-07', '1969-10-05'),
(21, 1, 'Famous deaths', 1, NULL, NULL, 'Cut to a lounge setting. Mr Foster sitting in chair.', '1969-09-07', '1969-10-05'),
(22, 1, 'Famous deaths', 2, 'Graham Chapman', 'Foster', 'Strewth!', '1969-09-07', '1969-10-05'),
(23, 1, 'Famous deaths', 1, NULL, 'Foster', 'he dies', '1969-09-07', '1969-10-05'),
(24, 1, 'Famous deaths', 1, NULL, NULL, 'Mozart still there. He looks at watch.', '1969-09-07', '1969-10-05'),
(25, 1, 'Famous deaths', 2, 'John Cleese', 'Mozart', 'Oh blimey, how time flies. Sadly we are reaching the end of yet another programme and so it is finale time. We are proud to be bringing to you one of the evergreen bucket kickers. Yes, the wonderful death of the famous English Admiral Nelson.', '1969-09-07', '1969-10-05'),
(26, 1, 'Famous deaths', 1, NULL, NULL, 'Cut to a modern office block, as high as possible. After a pause a body flies out of the top window looking as much like Nelson as possible. As it plummets there is a strangled scream.', '1969-09-07', '1969-10-05'),
(27, 1, 'Famous deaths', 1, NULL, 'Nelson', 'Kiss me Hardy!', '1969-09-07', '1969-10-05'),
(28, 1, 'Famous deaths', 1, NULL, NULL, 'The body hits the ground. There is the loud noise of a pig squealing.', '1969-09-07', '1969-10-05'),
(29, 1, 'Italian lesson', 3, NULL, NULL, 'Cut to a night school Teacher looking down out of classroom window. He crosses to a long wall blackboard with line of pigs drawn on near end. He crosses one off, walks along blackboard to other end which has written on it ''evening classes 7-8 p.m.''. He writes ''Italian'' below this and turns to camera.', '1969-09-07', '1969-10-05'),
(30, 1, 'Italian lesson', 2, 'Terry Jones', 'Teacher', 'Ah - good evening everyone, and welcome to the second of our Italian language classes, in which we''ll be helping you brush up your Italian. Last week we started at the beginning, and we learnt the Italian for a ''spoon''. Now, I wonder how many of you can remember what it was?', '1969-09-07', '1969-10-05'),
(31, 1, 'Italian lesson', 1, NULL, NULL, 'Shout of ''Si! Si! Si!'' from the class whom we see are all Italians.', '1969-09-07', '1969-10-05'),
(32, 1, 'Italian lesson', 2, 'Terry Jones', 'Teacher', 'Not all at once ... sit down Mario. Giuseppe!', '1969-09-07', '1969-10-05'),
(33, 1, 'Italian lesson', 2, 'Michael Palin', 'Giuseppe', 'Il cucchiaio.', '1969-09-07', '1969-10-05'),
(34, 1, 'Italian lesson', 2, 'Terry Jones', 'Teacher', 'Well done Giuseppe, or, as the Italians would say: ''Molto bene, Giuseppe''.', '1969-09-07', '1969-10-05'),
(35, 1, 'Italian lesson', 2, 'Michael Palin', 'Giuseppe', 'Grazie signor ... grazie di tutta la sua gentilezza.', '1969-09-07', '1969-10-05'),
(36, 1, 'Italian lesson', 2, 'Terry Jones', 'Teacher', 'Well, now, this week we''re going to learn some useful phrases to help us open a conversation with an Italian. Now first of all try telling him where you come from. For example, I would say: ''Sono Inglese di Gerrard''s Cross'', I am an Englishman from Gerrard''s Cross. Shall we all try that together?', '1969-09-07', '1969-10-05'),
(37, 1, 'Italian lesson', 2, NULL, 'All', 'Sono Inglese di Gerrard''s Cross.', '1969-09-07', '1969-10-05'),
(38, 1, 'Italian lesson', 2, 'Terry Jones', 'Teacher', 'Not too bad, now let''s try it with somebody else. Er... Mr... ?', '1969-09-07', '1969-10-05'),
(39, 1, 'Italian lesson', 2, 'John Cleese', 'Mariolini', 'Mariolini.', '1969-09-07', '1969-10-05'),
(40, 1, 'Italian lesson', 2, 'Terry Jones', 'Teacher', 'Ah, Mr Mariolini, and where are you from?', '1969-09-07', '1969-10-05'),
(41, 1, 'Italian lesson', 2, 'John Cleese', 'Mariolini', 'Napoli, signor.', '1969-09-07', '1969-10-05'),
(42, 1, 'Italian lesson', 2, 'Terry Jones', 'Teacher', 'Ah ... you''re an Italian.', '1969-09-07', '1969-10-05'),
(43, 1, 'Italian lesson', 2, 'John Cleese', 'Mariolini', 'Si, si signor!', '1969-09-07', '1969-10-05'),
(44, 1, 'Italian lesson', 2, 'Terry Jones', 'Teacher', 'Well in that case you would say: ''Sono Italiano di Napoli''.', '1969-09-07', '1969-10-05'),
(45, 1, 'Italian lesson', 2, 'John Cleese', 'Mariolini', 'Ah, capisco, mile grazie signor...', '1969-09-07', '1969-10-05'),
(46, 1, 'Italian lesson', 2, 'Eric Idle', 'Francesco', 'Per favore, signor!', '1969-09-07', '1969-10-05'),
(47, 1, 'Italian lesson', 2, 'Terry Jones', 'Teacher', 'Yes?', '1969-09-07', '1969-10-05'),
(48, 1, 'Italian lesson', 2, 'Eric Idle', 'Francesco', 'Non conosgeve parliamente, signor devo me parlo sono Italiano di Napoli quando il habitare de Milano.', '1969-09-07', '1969-10-05'),
(49, 1, 'Italian lesson', 2, 'Terry Jones', 'Teacher', 'I''m sorry ... I don''t understand!', '1969-09-07', '1969-10-05'),
(50, 1, 'Italian lesson', 1, NULL, 'Giuseppe', 'pointing to Francesco', '1969-09-07', '1969-10-05');

SELECT * FROM epizodok, forgatokonyv, tipusok;

SELECT nev FROM epizodok WHERE sorozat = '1/5';
SELECT count(resz) as "epizódok száma" FROM forgatokonyv;
SELECT DISTINCT szinesz FROM forgatokonyv WHERE szinesz is not null GROUP BY szinesz;
SELECT reszletek FROM forgatokonyv WHERE szinesz = 'John Cleese' AND resz = 'Italian lesson';
SELECT count(reszletek) as "bejegyzések száma", szinesz as "színész" FROM forgatokonyv WHERE szinesz is not null GROUP BY szinesz ORDER BY "bejegyzések száma" DESC, "színész"  LIMIT 1;

