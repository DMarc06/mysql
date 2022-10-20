DROP DATABASE IF EXISTS CINEMAS;
CREATE DATABASE CINEMAS;

USE CINEMAS;

CREATE TABLE Ville (
	CodePostal INT,
	NomVille VARCHAR(45),
    CONSTRAINT PK_Ville PRIMARY KEY (CodePostal),
    check(CodePostal like "_____"));

CREATE TABLE Cinema (
	NumCinema INT,
	NomCinema VARCHAR(45),
	RueCinema VARCHAR(45),
	Codepostal INT,
	CONSTRAINT FK_Cinema FOREIGN KEY (CodePostal) REFERENCES Ville(CodePostal),
	CONSTRAINT PK_Cinema PRIMARY KEY (NumCinema)
);

CREATE TABLE Salle (
	NumSalle INT,
	Capacite INT,
	NumCinema INT,
	CONSTRAINT FK_Salle FOREIGN KEY (NumCinema) REFERENCES Cinema(NumCinema),
	CONSTRAINT PK_Salle PRIMARY KEY(NumSalle),
    CHECK(Capacite between 30 and 100)
);

CREATE TABLE Film (
	NumFilm INT,
	Titre VARCHAR(45),
	Duree INT,
	Producteur VARCHAR(45),
	CONSTRAINT PK_Film PRIMARY KEY (NumFilm)
);

CREATE TABLE Projection (
	NumFilm INT,
	NumSalle INT,
	DateP DATE,
	NbreEntree INT,
	CONSTRAINT FK_ProjectionFilm FOREIGN KEY (NumFilm) REFERENCES Film(NumFilm),
	CONSTRAINT FK_ProjectionSalle FOREIGN KEY (NumSalle) REFERENCES Salle(NumSalle),
	CONSTRAINT PK_Project PRIMARY KEY (NumFilm, NumSalle, DateP)
);

INSERT INTO Ville VALUES
(11111, "VILLE1"),
(22222,"VILLE2"),
(33333,"VILLE3");

INSERT INTO Cinema VALUES
(1,"CINEMA1","RUE1",11111),
(2,"CINEMA2","RUE2",22222),
(3,"CINEMA3","RUE3",33333);

INSERT INTO Salle VALUES
(1,40,1),
(2,35,1),
(3,60,2),
(4,90,3),
(5,40,2);

INSERT INTO Film VALUES
(1,"FILM1",90,"PROD1"),
(2,"FILM2",90,"PROD2"),
(3,"FILM3",80,"PROD3"),
(4,"FILM4",70,"PROD4");

INSERT INTO Projection VALUES
(1,2,"2011-10-21",30),
(2,1,"2011-10-24",80),
(3,1,"2011-10-25",50),
(4,4,"2011-10-16",70),
(1,3,"2011-10-25",60),
(2,2,"2011-10-23",20),
(1,4,"2011-08-25",50),
(1,4,"2011-08-27",50),
(1,4,"2014-10-24",50),
(2,1,"2015-10-24",50);