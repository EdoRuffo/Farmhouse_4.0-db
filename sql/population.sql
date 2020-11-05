/*Popolamento Animale*/

truncate table Animale;
insert into Animale values
(001, 'M', 'Bovino', 'Mucca', 'Frisona', '2019-08-10', 140, 1012, 01),
(002, 'F', 'Bovino', 'Mucca', 'Frisona', '2019-05-13', 138, 846, 01),
(003, 'F', 'Bovino', 'Mucca', 'Hereford', '2019-10-25', 146, 921, 01),
(004, 'M', 'Bovino', 'Mucca', 'Jersey', '2019-06-13', 163, 985, 01),
(005, 'F', 'Bovino', 'Mucca', 'Jersey', '2012-11-19', 139, 745, 01),
(006, 'M', 'Bovino', 'Mucca', 'Hereford', '2016-01-03', 152, 983, 01),

(007, 'M', 'Ovino', 'Pecora', 'Merino', '2019-08-10', 72, 110, 02),
(008, 'M', 'Ovino', 'Pecora', 'Ouessant', '2019-05-13', 80, 140, 02),
(009, 'F', 'Ovino', 'Pecora', 'Merino', '2019-10-25', 76, 120, 02),
(010, 'F', 'Ovino', 'Pecora', 'Texel', '2019-09-30', 79, 122, 02),
(011, 'F', 'Ovino', 'Pecora', 'Texel', '2012-11-19', 84, 90, 02),
(012, 'M', 'Ovino', 'Pecora', 'Ouessant', '2016-01-03', 81, 97, 02),

(019, 'F', 'Caprino', 'Capra', 'Boera', '2016-01-03', 41, 91, 04),
(020, 'M', 'Caprino', 'Capra', 'Boera', '2016-01-03', 48, 123, 04),
(021, 'F', 'Caprino', 'Capra', 'Pigmea', '2016-01-03', 45, 94, 04);

/*Popolamento Nati*/
truncate table Nati;
Insert Into Nati values
(010, '11:00:00', '2019-09-30', 3, 5, 2, 001);

/*Popolamento Riproduzione*/
truncate table Riproduzione;
Insert Into Riproduzione values
(001, 011, 012, '2018-12-29', '15:00:00', 'Positivo', 001);

/*Popolamento GPS*/
truncate table GPS;
insert into GPS 
values
(001, '2019-11-18 11:00:00', 0,0,0),
(002, '2019-11-18 11:00:00', 4,2,0),
(003, '2019-11-18 11:00:00', 9,9,0),
(004, '2019-11-18 11:00:00', 2,6,0),
(005, '2019-11-18 11:00:00', 3,1,0),
(006, '2019-11-18 11:00:00', 0,7,0),
(007, '2019-11-18 11:00:00', 1,5,0),

(001, '2019-11-18 16:00:00', 2,6,0),
(002, '2019-11-18 16:00:00', 0,1,0),
(003, '2019-11-18 16:00:00', 5,9,0),
(004, '2019-11-18 16:00:00', 9,2,0),
(005, '2019-11-18 16:00:00', 1,6,0),
(006, '2019-11-18 16:00:00', 4,1,0),
(007, '2019-11-18 16:00:00', 1,1,0),

(001, '2019-11-19 11:00:00', 7,0,0),
(002, '2019-11-19 11:00:00', 0,2,0),
(003, '2019-11-19 11:00:00', 5,2,0),
(004, '2019-11-19 11:00:00', 1,9,0),
(005, '2019-11-19 11:00:00', 6,1,0),
(006, '2019-11-19 11:00:00', 2,4,0),
(007, '2019-11-19 11:00:00', 1,9,0),

(001, '2019-11-19 16:00:00', 0,7,0),
(002, '2019-11-19 16:00:00', 4,3,0),
(003, '2019-11-19 16:00:00', 9,1,0),
(004, '2019-11-19 16:00:00', 0,6,0),
(005, '2019-11-19 16:00:00', 0,7,0),
(006, '2019-11-19 16:00:00', 9,7,0),
(007, '2019-11-19 16:00:00', 1,2,0);

/*Popolamento Pascolo */
truncate table Pascolo;
Insert Into Pascolo values 
(001, '2019-11-19', '18:00:00', '16:00:00', 4),
(002, '2019-11-19', '18:00:00', '16:00:00', 4),
(003, '2019-11-19', '18:00:00', '16:00:00', 4),
(004, '2019-11-19', '18:00:00', '16:00:00', 4),
(005, '2019-11-19', '18:05:00', '16:00:00', 4),
(006, '2019-11-19', '18:10:00', '16:00:00', 4),
(007, '2019-11-19', '18:01:00', '16:00:00', 4),

(001, '2019-11-19', '13:00:00', '11:00:00', 2),
(002, '2019-11-19', '13:00:00', '11:00:00', 2),
(003, '2019-11-19', '13:00:00', '11:00:00', 2),
(004, '2019-11-19', '13:00:00', '11:00:00', 2),
(005, '2019-11-19', '13:05:00', '11:00:00', 2),
(006, '2019-11-19', '13:10:00', '11:00:00', 2),
(007, '2019-11-19', '13:01:00', '11:00:00', 2);

/*Popolamento Mangiatoia*/
truncate table Mangiatoia;
insert into Mangiatoia values
(01, 01, 10),
(02, 01, 10),

(03, 02, 10),
(04, 02, 10),

(05, 03, 10),
(06, 03, 10);

/*Popolamento Dipendente*/
truncate table Dipendente;
insert into Dipendente values 
(001, 'Zeno', 'Lepri'),
(002, 'Paolo', 'Volpi'),
(003, 'Renato', 'Tartarughi'),
(004, 'Marco', 'Lupi'),
(005, 'Vinicio', 'Cani');

/*Popolamento Impiego */
truncate table Impiego;
insert into Impiego values
(001, 001),
(001, 003),
(001, 005),
(002, 002),
(002, 004),
(003, 001),
(003, 002),
(004, 005),
(004, 003),
(005, 002),
(005, 004);

/*Popolamento Utente*/
truncate table Utente;
insert into Utente values
('C001A', 'Antonio', 'Rossi', 'Via Eulero 1', '1111', 0001),
('C002A', 'Alessandro', 'Bianchi', 'Via Euclide 22', '2222', 0002),
('C003A', 'Dario', 'Verdi', 'Via Archimede 12', '3333', 0003),
('C004A', 'Alessia', 'Neri', 'Via Cartesio 3', '4444', 0004),

('C005B', 'Luigi', 'Rossi', 'Via Cauchy 1', '1111', 0005), /*stessa carta di Credito di Mario Rossi*/
('C006B', 'Fabio', 'Bianchi', 'Via Turing 7', '5555', 0006),
('C007B', 'Luca', 'Verdi', 'Via Boole 14', '6666', 0007),
('C008B', 'Giulia', 'Neri', 'Via Einstein 4', '7777', 0008),
('C009B', 'Giulia', 'Rossi', 'Via Eulero 1', '1111', 0009),


('U009A', 'Sabrina', 'Violi', 'Via Garibaldi 1', NULL, NULL),
('U010A', 'Mario', 'Rossi', 'Via Mazzini 5', NULL, NULL);

/*Popolamento Cliente*/
truncate table Cliente;
insert into Cliente values
(0001),
(0002),
(0003),
(0004);

/*Popolamento Prenotazione*/
truncate table Prenotazione;
insert into Prenotazione values
(1, 0001, '2018-05-12', '2018-05-15', 100),
(2, 0002, '2017-12-29', '2018-01-03', 80),
(3, 0003, '2016-10-12', '2016-10-19', 60),
(4, 0004, '2018-07-12', '2018-07-13', 35),
(5, 0005, '2018-07-21', '2018-07-24', 100),
(6, 0006, '2016-12-29', '2017-01-03', 75),
(7, 0007, '2016-10-12', '2016-10-19', 90),
(8, 0008, '2015-07-12', '2015-07-15', 60),
(9, 0009, '2014-10-09', '2014-10-13', 0);


/*Popolamento Stanza*/
truncate table Stanza;
insert into Stanza values
(1, 'Singola', 1, 0, 25),
(2, 'Singola', 1, 0, 25),
(3, 'Singola', 1, 0, 25),
(4, 'Singola', 1, 0, 25),
(5, 'Doppia', 0, 1, 40),
(6, 'Doppia', 0, 1, 40),
(7, 'Doppia', 0, 1, 40),
(8, 'Familiare', 1, 1, 50),
(9, 'Familiare', 2, 1, 60),
(10, 'Familiare', 2, 1, 60);

/*Popolamento PrenotazioneServiziAggiuntivi*/
truncate table PrenotazioneServiziAggiuntivi;
insert into PrenotazioneServiziAggiuntivi values
(1, 'Piscina', '2018-05-12', '2018-05-15'),
(1, 'CentroBenessere', '2018-05-12', '2018-05-14'),
(2, 'CentroBenessere', '2018-05-12', '2018-01-03'),
(3, 'Idromassaggio', '2016-10-13', '2016-10-18'),

(5, 'Piscina', '2018-07-21', '2018-07-24'),
(5, 'CentroBenessere', '2018-07-21', '2018-07-24'),
(5, 'Idromassaggio', '2018-07-21', '2018-07-24');

/*Popolamento ServiziAggiuntivi*/
truncate table ServiziAggiuntivi;
insert into ServiziAggiuntivi values
('Piscina', 10),
('CentroBenessere', 20),
('Idromassaggio', 15);

/*Popolamento Formaggio*/
truncate table Formaggio;
Insert Into Formaggio values
('PecorinoSalato', 'Roma', 1,1,1,1,1),
('Mozzarella', 'Napoli', 2,2,2,2,2),
('Crescenza', 'Salerno', 3,3,3,3,3),
('Parmigiano', 'Parma', 4,4,44,4,4),
('Stracchino', 'Udine', 4,6,3,24,7),
('Fontina', 'Fiume', 1,1,1,11,1);

/*Popolamento Prodotto*/
truncate table Prodotto;
Insert Into Prodotto values
(00001, 001, 1450, 'PecorinoSalato'),
(00002, 001, 1400, 'PecorinoSalato'),
(00004, 002, 1250, 'PecorinoSalato'),
(00003, 003, 1500, 'PecorinoSalato'),
(00005, 001, 1300, 'Mozzarella'),
(00006, 002, 1450, 'Mozzarella'),
(00007, 003, 1450, 'Crescenza'),
(00008, 002, 1400, 'Crescenza'),
(00009, 001, 1300, 'Parmigiano'),
(00010, 003, 1250, 'Parmigiano');

/*Popolamento ScaffalaturaCantina*/
truncate table ScaffalaturaCantina;
Insert into ScaffalaturaCantina values
(0001, 001, 00003);

/*Popolamento ScaffalaturaMagazzino */
truncate table ScaffalaturaMagazzino;
Insert into ScaffalaturaMagazzino values
(0001, 001, 4),
(0002, 002, 5),
(0003, 001, 6);

/*Popolamento Stagionature*/
truncate table Stagionature;
Insert into Stagionature values
(001, 0001, 100, '2019-10-25', NULL);


/*Popolamento FasiLavorazione*/
truncate table FasiLavorazione;
Insert Into FasiLavorazione values
(00001, 1, 15, 50, 59), (00001, 2, 45, 20, 120), (00001, 3, 13, 185, 59), (00001, 4, 31, 180, 36), (00001, 5, 16, 50, 23), (00001, 6, 15, 49, 59), (00001, 7, 72 ,60, 59),
(00002, 1, 17, 50, 59), (00002, 2, 50, 20, 110), (00002, 3, 16, 190, 59), (00002, 4, 30, 170, 36), (00002, 5, 15, 49, 23), (00002, 6, 18, 50, 59), (00002, 7, 71 ,63, 50),
(00005, 1, 15, 20, 10), (00005, 2, 15, 70, 64), (00005, 3, 15, 20, 10), (00005, 4, 15, 20, 10), (00005, 5, 16, 96, 68), (00005, 6, 15, 20, 10), (00005, 7, 15, 40, 58),
(00009, 1, 60, 30, 60), (00009, 2, 20, 20, 50), (00009, 3, 35, 30, 40), (00009, 4, 20, 30, 50), (00009, 5, 30, 40, 70), (00009, 6, 10, 80, 20), (00009, 7, 60, 30, 100),

(00004, 1, 15, 50, 62), (00004, 2, 50, 20, 110), (00004, 3, 15, 184, 62), (00004, 4, 30, 178, 32), (00004, 5, 15, 54, 22), (00004, 6, 15, 50, 62), (00004, 7, 72, 58, 61),
(00006, 1, 32, 46, 21), (00006, 2, 15, 78, 62), (00006, 3, 34, 43, 26), (00006, 4, 30, 41, 21), (00006, 5, 11, 96, 81), (00006, 6, 30, 43, 22), (00006, 7, 15, 40, 58),
(00008, 1, 10, 16, 20), (00008, 2, 11, 9, 21), (00008, 3, 10, 21, 30), (00008, 4, 30, 21, 11), (00008, 5, 9, 16, 20), (00008, 6, 10, 16, 10), (00008, 7, 10, 31, 10),

(00003, 1, 15, 50, 62), (00003, 2, 50, 20, 121), (00003, 3, 15, 188, 61), (00003, 4, 31, 179, 38), (00003, 5, 15, 51, 21), (00003, 6, 15, 50, 61), (00003, 7, 71, 60, 51),
(00007, 1, 10, 15, 20), (00007, 2, 10, 9, 21), (00007, 3, 10, 21, 31), (00007, 4, 32, 20, 11), (00007, 5, 9, 15, 21), (00007, 6, 10, 16, 10), (00007, 7, 11, 30, 10),
(00010, 1, 60, 31, 60), (00010, 2, 21, 20, 50), (00010, 3, 35, 31, 40), (00010, 4, 20, 31, 52), (00010, 5, 30, 41, 70), (00010, 6, 10, 79, 21), (00010, 7, 60, 31, 101);

/*Popolamento Lotto*/
truncate table Lotto;
Insert Into Lotto values
(001, '2019-11-19', '2020-11-19', NULL, 001),
(002, '2019-11-19', '2020-11-19', NULL, 001),
(003, '2019-11-19', '2020-11-19', NULL, 002),
(004, '2019-11-19', '2020-11-19', NULL, 002),
(005, '2019-11-19', '2020-11-19', NULL, 002);


/*Popolamento FasiLavorazioneIdeale */
truncate table FasiLavorazioneIdeale;
insert into FasiLavorazioneIdeale values
('PecorinoSalato' , 1, 15, 50, 60),
('PecorinoSalato', 2, 50, 20, 120),
('PecorinoSalato', 3, 15, 190, 60),
('PecorinoSalato', 4, 30, 180, 40),
('PecorinoSalato', 5, 15, 50, 20),
('PecorinoSalato', 6, 15, 50, 60),
('PecorinoSalato', 7, 70 ,60, 50),

('Mozzarella', 1, 30, 40, 20),
('Mozzarella', 2, 15, 80, 60),
('Mozzarella', 3, 30, 40, 20),
('Mozzarella', 4, 30, 40, 20),
('Mozzarella', 5, 10, 100, 80),
('Mozzarella', 6, 30, 40, 20),
('Mozzarella', 7, 12, 40, 60),

('Crescenza', 1, 10, 15, 20),
('Crescenza', 2, 10, 10, 20),
('Crescenza', 3, 10, 20, 30),
('Crescenza', 4, 30, 20, 10),
('Crescenza', 5, 10, 15, 20),
('Crescenza', 6, 10, 15, 10),
('Crescenza', 7, 10, 30, 10),

('Parmigiano', 1, 60, 30, 60),
('Parmigiano', 2, 20, 20, 50),
('Parmigiano', 3, 35, 30, 40),
('Parmigiano', 4, 20, 30, 50),
('Parmigiano', 5, 30, 40, 70),
('Parmigiano', 6, 10, 80, 20),
('Parmigiano', 7, 60, 30, 100);

/*Popolamento Pasto*/
truncate table Pasto;
insert into Pasto values 
(001, '2019-11-18 12:00:00', 2, 2, 1, 2, 3, 4, 5, 6),
(002, '2019-11-18 12:00:00', 2, 2, 1, 2, 3, 4, 5, 6),
(003, '2019-11-18 12:00:00', 2, 2, 1, 2, 3, 4, 5, 6),

(001, '2019-11-18 19:00:00', 2, 2, 6, 5, 4, 3, 2, 1),
(002, '2019-11-18 19:00:00', 2, 2, 4, 2, 3, 3, 2, 1),
(003, '2019-11-18 19:00:00', 2, 2, 4, 2, 3, 3, 2, 1);

/*Popolamento TipoForaggio */
truncate table TipoForaggio;
insert into TipoForaggio values
(3,2,1,10),
(4,5,6,5);

/*Popolamento StatoMangiatoia */
truncate table StatoMangiatoia;
insert into StatoMangiatoia values
(001, '2019-11-18 14:00:00', 0.5),
(001, '2019-11-18 16:00:00', 0.2),
(001, '2019-11-18 18:00:00', 0.1),

(002, '2019-11-18 14:00:00', 2),
(002, '2019-11-18 16:00:00', 1.5),
(002, '2019-11-18 18:00:00', 1.2),

(003, '2019-11-18 14:00:00', 0.5),
(003, '2019-11-18 16:00:00', 0),
(003, '2019-11-18 18:00:00', 0),

(001, '2019-11-18 21:00:00', 1.5),
(001, '2019-11-18 23:00:00', 0.2),
(001, '2019-11-19 01:00:00', 0.1),

(002, '2019-11-18 21:00:00', 1.5),
(002, '2019-11-18 23:00:00', 1.2),
(002, '2019-11-19 01:00:00', 1),

(003, '2019-11-18 21:00:00', 0.5),
(003, '2019-11-18 23:00:00', 0.2),
(003, '2019-11-19 01:00:00', 0.1);

/*Popolamento Recensioni*/

truncate table RecensioniProdotti;
Insert into RecensioniProdotti values
('EdoRuffo', 00001, 5),
('EdoRuffo', 00002, 3),
('PippoDelMi', 00003, 2),
('EdoRuffo', 00004, 0),
('PippoDelMi', 00005, 2),
('PippoDelMi', 00006, 1),
('PippoDelMi', 00007, 4),
('PippoDelMi', 00008, 5),
('EdoRuffo', 00009, 4),
('EdoRuffo', 00010, 5);

truncate table recensioniSoggiorno;
Insert into RecensioniSoggiorno values 
('EdoRuffo', 00001, 2),
('EdoRuffo', 00002, 5),
('PippoDelMi', 00003, 2),
('EdoRuffo', 00004, 0),
('PippoDelMi', 00005, 4),
('PippoDelMi', 00006, 5),
('PippoDelMi', 00007, 4),
('PippoDelMi', 00008, 3),
('EdoRuffo', 00009, 4),
('EdoRuffo', 00010, 1);

/*Popolamento PrelievoLatte*/
truncate table PrelievoLatte;
Insert into PrelievoLatte values
(1,001),
(1,002),
(2,003);

/*Popolamento Escursione */
truncate table escursione;
INSERT into escursione values 
(1,1, '15:00:00', '2019-11-30');

/*Popolamento Prenotazione Stanze */
truncate table prenotazioneStanze;
insert into PrenotazioneStanze values
(1,5),
(2,4),
(3,3),
(4,5),
(5,6),
(6,2),
(7,3),
(8,3),
(9,3),
(10,3)
;

