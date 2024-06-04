-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Village_green
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Bon_de_livraison`
--

DROP TABLE IF EXISTS `Bon_de_livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bon_de_livraison` (
  `Id_livraison` int(11) NOT NULL AUTO_INCREMENT,
  `date_livraison` date DEFAULT NULL,
  `nom_livreur` varchar(50) DEFAULT NULL,
  `Id_commande` int(11) NOT NULL,
  PRIMARY KEY (`Id_livraison`),
  KEY `Id_commande` (`Id_commande`),
  CONSTRAINT `Bon_de_livraison_ibfk_1` FOREIGN KEY (`Id_commande`) REFERENCES `commande` (`Id_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bon_de_livraison`
--

LOCK TABLES `Bon_de_livraison` WRITE;
/*!40000 ALTER TABLE `Bon_de_livraison` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bon_de_livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `Id_article` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_court` varchar(30) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `prix_HT` decimal(10,2) NOT NULL,
  `Id_sous_rubrique` int(11) NOT NULL,
  PRIMARY KEY (`Id_article`),
  KEY `Id_sous_rubrique` (`Id_sous_rubrique`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`Id_sous_rubrique`) REFERENCES `sous_rubrique` (`Id_sous_rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,'Bongos d\'étude','Dimensions (environ) : Hembra 18,5 cm Ø et Macho 16 cm Ø','Bongos.jpeg',47.56,1),(2,'Djembe','Instrument de percussion africain à membrane','djembe.jpeg',180.00,1),(3,'Solist Xylophone A442','Instrument de percussion constitué de lames en bois ou en métal de différentes longueurs','xylophone.png',1831.67,2),(4,'Chimes 25 lames','Chimes 1 rangée, 25 battants avec cadre de fixation et marteau, ','chimes.jpg',74.75,2),(5,'Yamaha CLP-775 B','Instrument électronique reproduisant le son et le toucher d\'un piano acoustique.','yamaha1.png',2495.85,3),(6,'Yamaha CLP-765 GP','Clavier numérique 88 touches Grand Touch-S,','yamaha.png',3748.33,3),(7,'Moog One - 16','Instrument électronique produisant des sons par synthèse analogique.','moog.png',9332.50,4),(8,'YAMAHA MODX6+','Clavier 61 touches semi-lourdes avec toucher initial ','modx6.png',1065.83,4),(9,'Gewa ideale violon 1/4','Marque: Gewa, Modèle: Ideale-VL2, Taille: 1/4, Table: épicéa européen','gewa.png',374.17,5),(10,'Student Pro Viola Set 14','Instrument à cordes frottées plus grand que le violon et plus petit que le violoncelle','alto.png',132.50,5),(11,'Taylor AD26e Baritone-6','Forme Grand Symphony, Table en acajou massif, Barrage Taylor Baritone','guitare.png',1158.33,6),(12,'Ukulele Lute Baritone','Instrument à cordes pincées d\'origine hawaïenne, offrant un son distinctif et joyeux','ukulele.png',207.50,6),(13,'Trompette','Instrument à vent de la famille des cuivres','trompette.jpeg',599.99,7),(14,'Cor','Instrument à vent de la famille des cuivres','cor.jpeg',1899.99,7),(15,'Buffet crampon légende','La clarinette Légende de Buffet Crampon se distingue par ses caractéristiques clés','buffet.png',6428.33,8),(16,'Flûte traversière semi pro','Tête en argent massif, un corps et une patte en maillechort argenté','traversiere.jpg',1180.83,8);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `Id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `date_commande` date NOT NULL,
  `montant_commande_HT` decimal(11,2) NOT NULL,
  `montant_commande_TTC` decimal(11,2) NOT NULL,
  `TVA` decimal(5,2) DEFAULT NULL,
  `Id_facture` int(11) NOT NULL,
  `moyen_paiement` varchar(20) NOT NULL,
  `adresse_facturation` varchar(100) NOT NULL,
  `ville_facturation` varchar(50) DEFAULT NULL,
  `telephone_facturation` varchar(20) DEFAULT NULL,
  `mail_facturation` varchar(50) DEFAULT NULL,
  `etat_facture` varchar(20) NOT NULL,
  `adresse_livraison` varchar(100) NOT NULL,
  `etat_livraison` varchar(20) NOT NULL,
  `Id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`Id_commande`),
  KEY `Id_utilisateur` (`Id_utilisateur`),
  CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`Id_utilisateur`) REFERENCES `utilisateur` (`Id_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encadre`
--

DROP TABLE IF EXISTS `encadre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encadre` (
  `Id_utilisateur` int(11) NOT NULL,
  `matricule_personnel` varchar(30) NOT NULL,
  PRIMARY KEY (`Id_utilisateur`,`matricule_personnel`),
  KEY `matricule_personnel` (`matricule_personnel`),
  CONSTRAINT `encadre_ibfk_1` FOREIGN KEY (`Id_utilisateur`) REFERENCES `utilisateur` (`Id_utilisateur`),
  CONSTRAINT `encadre_ibfk_2` FOREIGN KEY (`matricule_personnel`) REFERENCES `personnel` (`matricule_personnel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encadre`
--

LOCK TABLES `encadre` WRITE;
/*!40000 ALTER TABLE `encadre` DISABLE KEYS */;
INSERT INTO `encadre` VALUES (1,'cr-03'),(2,'cr-04'),(3,'cr-03'),(4,'cr-04');
/*!40000 ALTER TABLE `encadre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseur` (
  `numero_fournisseur` varchar(20) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `adresse` varchar(200) NOT NULL,
  `pays` varchar(30) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `code_postal` varchar(20) NOT NULL,
  PRIMARY KEY (`numero_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur`
--

LOCK TABLES `fournisseur` WRITE;
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` VALUES ('F01','etchebest','123 Rue des Fournitures','France','Paris','+33 1 23 45 67 89','75001'),('F02','christophoro','456 Avenue des Produits','France','Lyon','+33 4 56 78 90 12','69001'),('F03','christine','789 Boulevard des Articles','France','Marseille','+33 6 78 90 12 34','13001'),('F04','christelle','1010 Rue des Marchandises','France','Toulouse','+33 5 67 89 01 23','31000'),('F05','chroustille','111 Rue des Fournitures','France','Lille','+33 3 45 67 89 01','59000'),('F06','chrisler','1212 Avenue des Produits','France','Bordeaux','+33 5 56 78 90 12','33000'),('F07','jesus crist','1313 Boulevard des Articles','France','Nantes','+33 2 78 90 12 34','44000'),('F08','christian','1414 Rue des Marchandises','France','Strasbourg','+33 3 67 89 01 23','67000'),('F09','christaline','1515 Rue des Fournitures','France','Nice','+33 4 45 67 89 01','06000'),('F10','christina','1616 Avenue des Produits','France','Montpellier','+33 5 56 78 90 12','34000');
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournit`
--

DROP TABLE IF EXISTS `fournit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournit` (
  `numero_fournisseur` varchar(20) NOT NULL,
  `Id_article` int(11) NOT NULL,
  PRIMARY KEY (`numero_fournisseur`,`Id_article`),
  KEY `Id_article` (`Id_article`),
  CONSTRAINT `fournit_ibfk_1` FOREIGN KEY (`numero_fournisseur`) REFERENCES `fournisseur` (`numero_fournisseur`),
  CONSTRAINT `fournit_ibfk_2` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournit`
--

LOCK TABLES `fournit` WRITE;
/*!40000 ALTER TABLE `fournit` DISABLE KEYS */;
INSERT INTO `fournit` VALUES ('F01',1),('F02',2),('F03',3),('F04',4),('F05',5),('F05',11),('F06',6),('F06',12),('F07',7),('F07',13),('F08',8),('F08',14),('F09',9),('F09',15),('F10',10),('F10',16);
/*!40000 ALTER TABLE `fournit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livre`
--

DROP TABLE IF EXISTS `livre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livre` (
  `Id_article` int(11) NOT NULL,
  `Id_livraison` int(11) NOT NULL,
  `quantité_livré` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_article`,`Id_livraison`),
  KEY `Id_livraison` (`Id_livraison`),
  CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id_article`),
  CONSTRAINT `livre_ibfk_2` FOREIGN KEY (`Id_livraison`) REFERENCES `Bon_de_livraison` (`Id_livraison`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livre`
--

LOCK TABLES `livre` WRITE;
/*!40000 ALTER TABLE `livre` DISABLE KEYS */;
/*!40000 ALTER TABLE `livre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnel` (
  `matricule_personnel` varchar(30) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `mail` varchar(50) NOT NULL,
  `mot_de_passe` varchar(300) DEFAULT NULL,
  `service` varchar(20) NOT NULL,
  `role` varchar(50) NOT NULL,
  `code_postal` varchar(20) NOT NULL,
  PRIMARY KEY (`matricule_personnel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel`
--

LOCK TABLES `personnel` WRITE;
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
INSERT INTO `personnel` VALUES ('cr-01','je','ne','sais pas quoi','0605149514','mettre@pour.fr','completer','ces','ligne','00001'),('cr-02','je','ne','sais pas quoi','0605149514','mettre@pour.fr','completer','ces','ligne','00002'),('cr-03','je','ne','sais pas quoi','0605149514','mettre@pour.fr','completer','ces','ligne','00003'),('cr-04','je','ne','sais pas quoi','0605149514','mettre@pour.fr','completer','ces','ligne','00004');
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubrique`
--

DROP TABLE IF EXISTS `rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rubrique` (
  `Id_Rubrique` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_court` varchar(30) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id_Rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubrique`
--

LOCK TABLES `rubrique` WRITE;
/*!40000 ALTER TABLE `rubrique` DISABLE KEYS */;
INSERT INTO `rubrique` VALUES (1,'Percussion','instruments à percussion','instruments-percussion.jpeg'),(2,'Clavier','instruments à clavier','instruments-clavier.jpg'),(3,'Corde','instruments à cordes','instruments-corde.jpeg'),(4,'Vent','instruments à vent','instruments-vent.png');
/*!40000 ALTER TABLE `rubrique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `se_compose_de`
--

DROP TABLE IF EXISTS `se_compose_de`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `se_compose_de` (
  `Id_commande` int(11) NOT NULL,
  `Id_article` int(11) NOT NULL,
  `nombre_d_article` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_commande`,`Id_article`),
  KEY `Id_article` (`Id_article`),
  CONSTRAINT `se_compose_de_ibfk_1` FOREIGN KEY (`Id_commande`) REFERENCES `commande` (`Id_commande`),
  CONSTRAINT `se_compose_de_ibfk_2` FOREIGN KEY (`Id_article`) REFERENCES `article` (`Id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `se_compose_de`
--

LOCK TABLES `se_compose_de` WRITE;
/*!40000 ALTER TABLE `se_compose_de` DISABLE KEYS */;
/*!40000 ALTER TABLE `se_compose_de` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sous_rubrique`
--

DROP TABLE IF EXISTS `sous_rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sous_rubrique` (
  `Id_sous_rubrique` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_court` varchar(30) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `Id_Rubrique` int(11) NOT NULL,
  PRIMARY KEY (`Id_sous_rubrique`),
  KEY `Id_Rubrique` (`Id_Rubrique`),
  CONSTRAINT `sous_rubrique_ibfk_1` FOREIGN KEY (`Id_Rubrique`) REFERENCES `rubrique` (`Id_Rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sous_rubrique`
--

LOCK TABLES `sous_rubrique` WRITE;
/*!40000 ALTER TABLE `sous_rubrique` DISABLE KEYS */;
INSERT INTO `sous_rubrique` VALUES (1,'Membranophones','Famille des membranophones','membran.jpeg',1),(2,'Idiophones','Famille des idiophones','idio.png',1),(3,'Pianos','Famille des pianos','piano.jpg',2),(4,'Synthétiseurs','Synthétiseurs','synthé.jpg',2),(5,'Cordes frottées','Cordes frottées','frotté.jpg',3),(6,'Cordes pincées','Cordes pincées','pince.jpg',3),(7,'Cuivres','Famille des cuivres','cuivre.png',4),(8,'Bois','Famille des bois','bois.jpg',4);
/*!40000 ALTER TABLE `sous_rubrique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `Id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prénom` varchar(50) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `code_postal` varchar(20) NOT NULL,
  `pays` varchar(30) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `mot_de_passe` varchar(300) NOT NULL,
  `reduction` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`Id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'user1','user1','userlocation','00001','userlocation','userlocation','0000000001','user1@mail.com','password',20.00),(2,'user2','user2','userlocation','00002','userlocation','userlocation','0000000002','user2@mail.com','password',10.00),(3,'user3','user3','userlocation','00003','userlocation','userlocation','0000000003','user3@mail.com','password',6.00),(4,'user4','user4','userlocation','00004','userlocation','userlocation','0000000004','user4@mail.com','password',7.00);
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-16 12:14:31
