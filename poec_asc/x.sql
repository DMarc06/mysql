-- Script SQL

-- Langage de definition de données

-- Creation d'un base de données
DROP DATABASE IF EXISTS poec_asr;
CREATE DATABASE poec_asr;

-- Utilisation d'une db
USE poec_asr;

-- Création de la table person, avec la declaration de la colonne id en tant que cle primaire
-- Une clé primaire identifie un ensemble de colonnes
CREATE TABLE personne(
	id int PRIMARY KEY AUTO_INCREMENT,
    nom varchar(45) NOT NULL,
    prenom varchar(45) NOT NULL,
    age int,
    salaire int,
	ville varchar(45) DEFAULT 'Nice',
    CHECK(age < 150)
);

CREATE TABLE voiture(
	immatriculation int PRIMARY KEY AUTO_INCREMENT,
    marque varchar(45),
    modele varchar(45),
    annee int,
    id_personne int,
    FOREIGN KEY (id_personne) REFERENCES personne(id)
);

-- Pour supprimer une table
-- DROP TABLE voiture;

-- DROP TABLE personne;

CREATE TABLE employe(
	cni char(6),
    prenom char(20),
    nom char(20),
    CONSTRAINT pk_employe PRIMARY KEY (prenom, nom)
);

ALTER TABLE employe 
DROP PRIMARY KEY;

ALTER TABLE employe 
ADD CONSTRAINT pk_employe PRIMARY KEY (cni);

ALTER TABLE employe 
MODIFY COLUMN nom varchar(45) NOT NULL;

-- Langage de manipulation de donnees

-- Inserer une valeur pour chaque colonne
INSERT INTO personne VALUES
(1, "Wick", "John", 30, 2000, "Nice"),
(2, "Doe", "Bob", 40, 1500, "Paris"),
(3, "Wayne", "John", 30, 2000, "Marseille"),
(4, "Benzema", "Karim", 33, 20000, "Lyon");

-- Dans cet exemple, nous precisons les colonnes -> utile pour l'auto-increment
INSERT INTO personne(nom, prenom, age, salaire, ville) VALUE ("Cooper", "John", 45, 2000, "New-York");

INSERT INTO personne(nom, prenom) VALUE ("Dupont", "Henri");

INSERT INTO personne SET nom = "Dupond", prenom = "Jean", age = 30, salaire = 2000;

INSERT INTO voiture VALUES
(100, 'Peugeot', '5008', 2018, 5),
(200, 'Renault', 'clio', 2000, 4),
(300, 'Ford', 'fiesta', 2010, 1),
(400, 'Peugeot', '106', 2002, 3),
(500, 'Citroen', 'C4', 2015, 4),
(600, 'Ford', 'Kuga', 2019, null),
(700, 'Fiat', 'punto', 2008, 5);



-- Langage d'interrogation de données

-- Une requète SQL de lecture est composée d'au moins deux clauses :

-- SELECT : selectionner les colonnes
-- FROM : cibler la table concerné

-- WHERE : Déclarer une condition
-- ....

-- Selectionne toutes les données de la table personne
SELECT * FROM personne;

-- Selectionne les colonnes nom et prenom de la table personne
SELECT nom, prenom
FROM personne;

-- Selectionne la colonne ville de la table personne
SELECT ville
FROM personne;

-- Supprime les doublons
SELECT distinct(ville)
FROM personne;

-- Compte le nombre de ville dans la table personne
-- La fonction d'aggrégation COUNT() permet de compter les nombre 
-- d'enregistrements, ici le nombre de villes distinctes dans la table personne
SELECT COUNT(distinct(ville)) AS nombre_ville
FROM personne; 

SELECT * 
from personne 
where ville = "Marseille" or ville = "Nice"; 

SELECT * 
FROM personne
WHERE ville = 'Marseille' and (salaire <=2000 OR salaire >=2500);

-- Selectionne les voitures dont l'id du propriétaire est non-null
-- cad, toutes les voitures qui ont un proprietaire
SELECT *
FROM voiture
WHERE id_personne IS NOT NULL;

-- Utiliser la fonction IFNULL() por remplacer les valeurs nulles par une autre valeur
SELECT marque, IFNULL(id_personne,'pas de proprietaire') AS proprietaire
FROM voiture;

-- Classe le resultat selon le numero du proprietaire
-- ORDER BY : ASC par defaut, sinon declarer DESC pour un ordre décroissant
SELECT *
FROM voiture
WHERE id_personne IS NOT NULL
ORDER BY id_personne DESC;

-- Selectionne les voitures dont l'id du propriétaire est non-null
-- cad, toutes les voitures qui ont un proprietaire
SELECT *
FROM voiture
WHERE id_personne IS NOT NULL;

-- Utiliser la fonction IFNULL() por remplacer les valeurs nulles par une autre valeur
SELECT marque, IFNULL(id_personne,'pas de proprietaire') AS proprietaire
FROM voiture;

-- Classe le resultat selon le numero du proprietaire
-- ORDER BY : ASC par defaut, sinon declarer DESC pour un ordre décroissant
SELECT *
FROM voiture
WHERE id_personne IS NOT NULL
ORDER BY id_personne DESC;

-- Compte le nombre de vehicule pour chaque personne
-- Il faut les regrouper avec GROUP BY, ici selon la colonne id_personne
-- ici, on filtre les resultats de la fonction d’agregation 
SELECT id_personne, COUNT(*) AS nombre_vehicule
FROM voiture
WHERE id_personne IS NOT NULL
GROUP BY id_personne
HAVING nombre_vehicule > 1;

 -- select * from 
 
 -- Fonctions d'aggregation

-- COUNT()
-- MAX()
-- MIN()
-- SUM()
-- AVG()

-- Ecrire une requete SQL qui permet de compter la somme des salaires
-- regroupe par ville
-- SELECT SUM(salaire) AS Salaire FROM personne group by ville; OK

-- Ecrire une requete SQL qui permet de regrouper les identifiants de
-- personne qui ont un vehicule de marque Renault ou Citroen
 
-- SELECT marque, id_personne FROM voiture WHERE marque ='Renault' OR marque ='Citroen';
-- SELECT COUNT(*) FROM voiture WHERE marque ='Renault' OR marque ='Citroen';

select nom, prenom, ville, modele, marque
From personne p, voiture v
where p.id = v.id_personne;

-- IDEM

select nom, prenom, ville, modele, marque
From personne p
JOIN voiture v ON p.id = v.id_personne;





