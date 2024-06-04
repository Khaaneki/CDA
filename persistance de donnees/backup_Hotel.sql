-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Hotel
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
-- Table structure for table `Appartient`
--

DROP TABLE IF EXISTS `Appartient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Appartient` (
  `per_num` int(11) NOT NULL,
  `gro_num` int(11) NOT NULL,
  PRIMARY KEY (`per_num`,`gro_num`),
  KEY `gro_num` (`gro_num`),
  CONSTRAINT `Appartient_ibfk_1` FOREIGN KEY (`per_num`) REFERENCES `Personne` (`per_num`),
  CONSTRAINT `Appartient_ibfk_2` FOREIGN KEY (`gro_num`) REFERENCES `Groupe` (`gro_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appartient`
--

LOCK TABLES `Appartient` WRITE;
/*!40000 ALTER TABLE `Appartient` DISABLE KEYS */;
/*!40000 ALTER TABLE `Appartient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Groupe`
--

DROP TABLE IF EXISTS `Groupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Groupe` (
  `gro_num` int(11) NOT NULL AUTO_INCREMENT,
  `gro_libelle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`gro_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Groupe`
--

LOCK TABLES `Groupe` WRITE;
/*!40000 ALTER TABLE `Groupe` DISABLE KEYS */;
/*!40000 ALTER TABLE `Groupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Personne`
--

DROP TABLE IF EXISTS `Personne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Personne` (
  `per_num` int(11) NOT NULL AUTO_INCREMENT,
  `per_nom` varchar(50) DEFAULT NULL,
  `per_prenom` varchar(50) DEFAULT NULL,
  `per_adresse` varchar(50) DEFAULT NULL,
  `per_ville` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`per_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Personne`
--

LOCK TABLES `Personne` WRITE;
/*!40000 ALTER TABLE `Personne` DISABLE KEYS */;
/*!40000 ALTER TABLE `Personne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chambre`
--

DROP TABLE IF EXISTS `chambre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chambre` (
  `capacite_chambre` int(11) DEFAULT NULL,
  `degre_confort` int(11) DEFAULT NULL,
  `exposition` varchar(50) DEFAULT NULL,
  `type_chambre` varchar(50) DEFAULT NULL,
  `num_chambre` int(11) NOT NULL,
  `num_hotel` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_chambre`),
  UNIQUE KEY `num_chambre` (`num_chambre`),
  KEY `num_hotel` (`num_hotel`),
  CONSTRAINT `chambre_ibfk_1` FOREIGN KEY (`num_hotel`) REFERENCES `hotel` (`num_hotel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chambre`
--

LOCK TABLES `chambre` WRITE;
/*!40000 ALTER TABLE `chambre` DISABLE KEYS */;
INSERT INTO `chambre` VALUES (2,21,'Est','Double',1,1),(1,20,'Nord','Standard',2,1),(4,19,'Sud','familiale',3,1),(2,20,'Ouest','Double',4,2),(1,19,'Est','Stadard',5,2),(4,22,'Sud','Familiale',6,2),(2,18,'Nord','Double',7,3),(1,23,'Ouest','Standard',8,3),(4,20,'Sud','Familiale',9,3),(2,19,'Nord-Ouest','Double',10,4),(1,21,'Sud','Standard',11,4),(4,24,'Est','Familiale',12,4),(2,21,'Nord-est','Double',13,5),(1,18,'Sud-est','Standard',14,5),(2,23,'Ouest','Familiale',15,5),(2,22,'Sud','Double',16,6),(1,21,'Sud-Est','Standard',17,6),(4,20,'Nord-ouest','Familiale',18,6),(2,21,'Est','Double',19,7),(1,19,'Nord','Standard',20,7),(4,24,'Sud','Familiale',21,7),(2,21,'Est','Double',22,8),(1,18,'Ouest','Standard',23,8),(4,23,'Sud','Familiale',24,8),(2,22,'Ouest','Double',25,9),(1,20,'Nord','Standard',26,9),(4,23,'Est','Familiale',27,9);
/*!40000 ALTER TABLE `chambre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `num_client` int(11) NOT NULL AUTO_INCREMENT,
  `adresse_client` varchar(100) DEFAULT NULL,
  `nom_client` varchar(50) DEFAULT NULL,
  `prenom_client` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotel` (
  `capacite_hotel` int(11) DEFAULT NULL,
  `categorie_hotel` varchar(10) DEFAULT NULL,
  `nom_hotel` varchar(50) DEFAULT NULL,
  `adresse_hotel` varchar(100) DEFAULT NULL,
  `num_hotel` int(11) NOT NULL AUTO_INCREMENT,
  `num_station` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_hotel`),
  KEY `num_station` (`num_station`),
  CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`num_station`) REFERENCES `station` (`num_station`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (200,'A2','Crainb','124 rue Castorelu 2685 CASSE',1,1),(250,'A1','Balou','11 avenue de picardie 80000 AMIENS',2,1),(150,'A3','Lafly','8 rue de manchespeur 99999 INDITI',3,1),(100,'B1','Travers','3 allee granumé 56412 LONAERI',4,2),(120,'B3','Quote','1 rue vrouuuum 46982 VOITURE',5,2),(180,'B2','Shifty','17 rue de la peur 46667 EPOUVANT',6,2),(220,'C2','Lomelix','27 place de souligne 80015 LOOPING',7,3),(130,'C1','Ascendentier','4 allee de la cote a cote 34562 HEIDI',8,3),(50,'C3','Trickshot','8 rue de la distribution 87456 COURROIE',9,3);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `num_chambre` int(11) NOT NULL,
  `num_client` int(11) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `date_reservation` date DEFAULT NULL,
  `montant_arrhes` decimal(10,2) DEFAULT NULL,
  `prix_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`num_chambre`,`num_client`),
  KEY `num_client` (`num_client`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`num_chambre`) REFERENCES `chambre` (`num_chambre`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`num_client`) REFERENCES `client` (`num_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station` (
  `num_station` int(11) NOT NULL AUTO_INCREMENT,
  `nom_station` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num_station`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'Pas-de-calais'),(2,'Somme'),(3,'Aisne'),(4,'Pas-de-calais'),(5,'Somme'),(6,'Aisne'),(7,'Pas-de-calais'),(8,'Somme'),(9,'Aisne'),(10,'Pas-de-calais'),(11,'Somme'),(12,'Aisne');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-06 15:19:52
