CREATE TABLE Livre(
idLivre int,
titre varchar(45),
idEditeur int,
CONSTRAINT pk_livre PRIMARY KEY (idLivre)
);

CREATE TABLE Auteur(
idAuteur int,
nom varchar(45),
prenom varchar(45),
CONSTRAINT pk_auteur PRIMARY KEY (idAuteur)
);

CREATE TABLE Editeur(
idEditeur int,
nom varchar(45),
CONSTRAINT pk_editeur PRIMARY KEY (idEditeur)
);

CREATE TABLE Exemplaire(
idExemplaire int,
idLivre int,
CONSTRAINT pk_exemplaire PRIMARY KEY (idExemplaire)
);

CREATE TABLE Emprunt(
idEx int,
idAb int,
dateEmprunt date,
dateRetour date,
CONSTRAINT pk_emprunt PRIMARY KEY (idEx, idAb)
);

CREATE TABLE Abonne(
idAb int,
nom varchar(45),
prenom varchar(45),
tel int(10),
adresse varchar(45),
CONSTRAINT pk_abonne PRIMARY KEY (idAb)
);

CREATE TABLE AuteurDe(
idLivre int,
idAuteur int,
CONSTRAINT pk_auteurde PRIMARY KEY (idLivre, idAuteur)
);


ALTER TABLE Livre
ADD CONSTRAINT fk_libvre
FOREIGN KEY (idEditeur) REFERENCES Editeur(idEditeur);

ALTER TABLE Exemplaire
ADD CONSTRAINT fk_exemplaire
FOREIGN KEY (idLivre) REFERENCES Livre(idLivre);

ALTER TABLE Emprunt
ADD CONSTRAINT fk_emprunt
FOREIGN KEY (idEx) REFERENCES Exemplaire(idExemplaire);

ALTER TABLE Emprunt
ADD CONSTRAINT fk_emprunt2
FOREIGN KEY (idAb) REFERENCES Abonne(idAb);

ALTER TABLE AuteurDe
ADD CONSTRAINT fk_auteurde
FOREIGN KEY (idLivre) REFERENCES Livre(idLivre);

ALTER TABLE AuteurDe
ADD CONSTRAINT fk_auteurde2
FOREIGN KEY (idAuteur) REFERENCES Auteur(idAuteur);

INSERT INTO Abonne VALUES (1, 'Michel', 'Tom', NULL, NULL);
INSERT INTO Abonne VALUES (2, 'Moreau', 'Jean-Baptiste', NULL, NULL);
INSERT INTO Abonne VALUES (3, 'Moreau', 'Jean-Baptiste', NULL, NULL);
INSERT INTO Abonne VALUES (4, 'Roux', 'Sarah', NULL, NULL);
INSERT INTO Abonne VALUES (5, 'Dubois', 'Mathis', NULL, NULL);

INSERT INTO Auteur VALUES (1, 'Nietzsche', 'Friedrich');
INSERT INTO Auteur VALUES (2, 'Card', 'Orson Scott');
INSERT INTO Auteur VALUES (3, 'Tournier', 'Michel');
INSERT INTO Auteur VALUES (4, 'Brin', 'David');
INSERT INTO Auteur VALUES (5, 'Brin', 'Françoise');

INSERT INTO Editeur VALUES (1, 'Gallimard'); 
INSERT INTO Editeur VALUES (2, 'Denoel');
INSERT INTO Editeur VALUES (3, 'Poche');
INSERT INTO Editeur VALUES (4, 'J''ai lu');
INSERT INTO Editeur VALUES (5, 'Broché');

INSERT INTO Livre VALUES (1, 'La volonté de puissance', 1);
INSERT INTO Livre VALUES (2, 'Espoir-du-cerf', 2);
INSERT INTO Livre VALUES (3, 'Vendredi ou la vie sauvage', 3);
INSERT INTO Livre VALUES (4, 'Elevation', 4);
INSERT INTO Livre VALUES (5, 'Vendredi ou la vie sauvage', 3);
INSERT INTO Livre VALUES (6, 'Ainsi parlait Zarathoustra', 3);
INSERT INTO Livre VALUES (7, 'Humain, trop humain', 3);
INSERT INTO Livre VALUES (8, 'Les maitres chanteurs', 2);
INSERT INTO Livre VALUES (9, 'St-Exupéry, Terre des hommes', 5);
INSERT INTO Livre VALUES (10, 'Rédemption', 4);

INSERT INTO Exemplaire VALUES (1, 1);
INSERT INTO Exemplaire VALUES (2, 2);
INSERT INTO Exemplaire VALUES (3, 3);
INSERT INTO Exemplaire VALUES (4, 4);
INSERT INTO Exemplaire VALUES (5, 5);
INSERT INTO Exemplaire VALUES (6, 3);
INSERT INTO Exemplaire VALUES (7, 6);
INSERT INTO Exemplaire VALUES (8, 7);
INSERT INTO Exemplaire VALUES (9, 8);
INSERT INTO Exemplaire VALUES (10, 8);
INSERT INTO Exemplaire VALUES (11, 8);
INSERT INTO Exemplaire VALUES (12, 9);
INSERT INTO Exemplaire VALUES (13, 10);

INSERT INTO AuteurDe VALUES (1, 1);
INSERT INTO AuteurDe VALUES (2, 2);
INSERT INTO AuteurDe VALUES (3, 3);
INSERT INTO AuteurDe VALUES (4, 4);
INSERT INTO AuteurDe VALUES (5, 3);
INSERT INTO AuteurDe VALUES (6, 1);
INSERT INTO AuteurDe VALUES (7, 1);
INSERT INTO AuteurDe VALUES (8, 2);
INSERT INTO AuteurDe VALUES (9, 5);
INSERT INTO AuteurDe VALUES (10, 4);

INSERT INTO Emprunt VALUES (2, 1, '2008-10-20', '2008-11-07');
INSERT INTO Emprunt VALUES (3, 2, '2009-10-02', NULL);
INSERT INTO Emprunt VALUES (5, 4, NULL, NULL);
INSERT INTO Emprunt VALUES (9, 2, '2009-10-08', NULL);
INSERT INTO Emprunt VALUES (2, 4, '2009-11-20', NULL);
INSERT INTO Emprunt VALUES (4, 5, '2009-11-25', NULL);