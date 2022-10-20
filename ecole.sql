DROP DATABASE IF EXISTS Etudiants;
CREATE DATABASE Etudiants;

USE Etudiants;

  
CREATE TABLE Cours (
	Code VARCHAR(45),
	Nom VARCHAR(45), 
	NomCours VARCHAR(45),
    Enseignant VARCHAR(45),
	constraint pk_Cours primary key (Code));
    
    
CREATE TABLE Etudiant (
	Matricule VARCHAR(45),
	Nom VARCHAR(45), 
	Prenom VARCHAR(45),
    DateNaissance DATE,
    Niveau VARCHAR(45),
    constraint pk_etudiant primary key (Matricule)
    );
    
CREATE TABLE Examen (
	Matricule VARCHAR(45),
    Code VARCHAR(45),
	Note float,   
    constraint fk1_Examen foreign key (code) REFERENCES Cours(code),
    constraint fk2_Examen foreign key (Matricule) REFERENCES Etudiant(Matricule),
	constraint pk_Examen primary key (Matricule, code)
    );

INSERT INTO Etudiant VALUES
("1","NOM1","PRENOM1","1995-12-10","MASTER1"),
("2","NOM2","PRENOM2","1995-02-19","MASTER2"),
("3","NOM3","PRENOM3","1996-05-04","DUT");

INSERT INTO Cours VALUES
("M1","MATIERE1","PROFESSEUR1"),
("M2","MATIERE2","PROFESSEUR2"),
("M3","MATIERE3","PROFESSEUR3");

INSERT INTO Examen VALUES
("2","M1",15),
("2","M2",14),
("3","M3",9),
("1","M1",13),
("3","M1",13);
