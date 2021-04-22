DROP DATABASE IF EXISTS `Oto`;
CREATE DATABASE `Oto`;

USE `Oto`;


CREATE TABLE IF NOT EXISTS Vehicules(
id_vehicules INT(10) Unsigned NOT NULL auto_increment Primary key ,
etat boolean NOT NULL,
vehi_type boolean NOT NULL,
modele varchar(50) NOT NULL,
marque varchar(50) NOT NULL,
kilometrage INT(6),
Prix INT(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS commerciaux(
    id_commerciaux INT(10) Unsigned NOT NULL auto_increment primary key,
    fonction_commercial boolean NOT NULL
    
   
);

CREATE TABLE IF NOT EXISTS Client(
    id_client INT(10) Unsigned NOT NULL auto_increment Primary key,
    type_client boolean NOT NULL ,
    nom_client varchar(30) NOT NULL,
    id_commerciaux INT(10) NOT NULL,
    FOREIGN KEY (id_commerciaux) REFERENCES commerciaux(id_commerciaux)
);
CREATE TABLE IF NOT EXISTS options(
   id_options INT(10) NOT NULL auto_increment,
   opt_type VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_options) 
);


CREATE TABLE IF NOT EXISTS accessoires(
   id_accessoires VARCHAR(50),
   acces_type VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_accessoires)
);
CREATE TABLE commande(
   id_commande INT(10) NOT NULL auto_increment,
   com_date DATETIME NOT NULL,
   PRIMARY KEY(id_commande)
);


CREATE TABLE IF NOT EXISTS reparation(
    id_reparation INT(10) Unsigned NOT NULL auto_increment primary key
);
CREATE TABLE IF NOT EXISTS entretien(
id_entretien INT(10) Unsigned NOT NULL auto_increment primary key
);


CREATE TABLE IF NOT EXISTS Acheter(
    id_vehicules INT(10) Unsigned NOT NULL auto_increment ,
    id_client INT(10) Unsigned NOT NULL  ,
    paiement boolean NOT NULL,
    
    primary key(id_vehicules,id_client),
    foreign key (id_vehicules)REFERENCES vehicules(id_vehicules),
    foreign key (id_client) REFERENCES client (id_client)
);
CREATE TABLE IF NOT EXISTS poser(
    id_accessoires INT(10) Unsigned NOT NULL,
    id_options INT(10) NOT NULL,
    id_commande INT(10) Unsigned NOT NULL,
    primary key (id_options,id_accessoires,id_commande),
    foreign key (id_accessoires) REFERENCES accessoires(id_acccessoires),
    FOREIGN KEY(id_options) REFERENCES options(id_options),
   FOREIGN KEY(id_commande) REFERENCES commande(id_commande)
    
);
CREATE TABLE IF NOT EXISTS effectuer(
    id_vehicules INT(10) Unsigned NOT NULL,
    id_entretien INT(10) Unsigned NOT NULL,
    id_reparation INT(10) Unsigned NOT NULL,
    primary key (id_vehicules,id_entretien,id_reparation),
    foreign key (id_vehicules) REFERENCES vehicules(id_vehicules),
    foreign key (id_entretien) REFERENCES entretien(id_entretien),
    foreign key (id_reparation) REFERENCES reparation(id_reparation)

);
CREATE TABLE IF NOT EXISTS commander(
    id_vehicules INT(10) NOT NULL auto_increment,
    id_commande INT(10) NOT NULL,
    primary key (id_vehicules,id_commande),
    foreign key (id_vehicules) REFERENCES vehicules(id_vehicules),
    foreign key (id_commande) REFERENCES commande (id_commande)
)
