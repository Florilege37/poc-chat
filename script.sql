CREATE TABLE User (
    id INT PRIMARY KEY AUTO_INCREMENT,
    prenom VARCHAR(255) NOT NULL,
    nom VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    adresse VARCHAR(255)
);

CREATE TABLE Agence (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    telephone INT NOT NULL,
    heureOuverture INT NOT NULL,
    heureFermeture INT NOT NULL
);

CREATE TABLE Vehicule (
    id INT PRIMARY KEY AUTO_INCREMENT,
    marque VARCHAR(255) NOT NULL,
    modele VARCHAR(255) NOT NULL,
    categorie_vehicule VARCHAR(255) NOT NULL,
    hasGps BOOLEAN NOT NULL,
    description VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE OffreLocation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    agence_id INT,
    vehicule_id INT,
    villeDepart VARCHAR(255) NOT NULL,
    villeArrivee VARCHAR(255) NOT NULL,
    date_debut DATE NOT NULL,
    date_retour DATE NOT NULL,
    categorie_vehicule VARCHAR(255) NOT NULL,
    tarif INT NOT NULL,
    FOREIGN KEY (agence_id) REFERENCES Agence(id),
    FOREIGN KEY (vehicule_id) REFERENCES Vehicule(id)
);

CREATE TABLE Reservation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    offre_id INT,
    date_reservation DATE NOT NULL,
    etat VARCHAR(255) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (offre_id) REFERENCES OffreLocation(id)
);

