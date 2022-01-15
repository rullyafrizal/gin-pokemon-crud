-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: pokemon_crud
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pokemon_types`
--

DROP TABLE IF EXISTS `pokemon_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemon_types` (
  `pokemon_id` varbinary(255) NOT NULL,
  `type_id` int unsigned NOT NULL,
  PRIMARY KEY (`pokemon_id`,`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemon_types`
--

LOCK TABLES `pokemon_types` WRITE;
/*!40000 ALTER TABLE `pokemon_types` DISABLE KEYS */;
INSERT INTO `pokemon_types` VALUES (_binary '14bfbd6b-d77c-4ea2-8638-bc0858adfda6',8),(_binary '224e3000-8aae-40a5-b689-902076e8c3ba',1),(_binary '224e3000-8aae-40a5-b689-902076e8c3ba',2),(_binary '254ae126-868f-46e4-8bed-f2b44fd8786b',2),(_binary '300a1823-828a-4e6b-a4ee-c9203210a60c',1),(_binary '300a1823-828a-4e6b-a4ee-c9203210a60c',2),(_binary '31520594-8bab-4cff-85e2-7f1dc17ab044',3),(_binary '3aaa00a4-b1fc-403e-8a80-755e81b7cf74',1),(_binary '3aaa00a4-b1fc-403e-8a80-755e81b7cf74',2),(_binary '49f9a67b-bf14-409a-b9d1-554c27a05b46',5),(_binary '49f9a67b-bf14-409a-b9d1-554c27a05b46',6),(_binary '7087bf24-25e4-428a-a950-bbe9981f473b',7),(_binary '92ea09ec-b581-4f57-bf69-17ba10b4704f',5),(_binary '92ea09ec-b581-4f57-bf69-17ba10b4704f',6),(_binary 'bce6517d-ce81-4338-9560-f17c18e1c169',4);
/*!40000 ALTER TABLE `pokemon_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemons`
--

DROP TABLE IF EXISTS `pokemons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pokemons` (
  `id` varbinary(255) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemons`
--

LOCK TABLES `pokemons` WRITE;
/*!40000 ALTER TABLE `pokemons` DISABLE KEYS */;
INSERT INTO `pokemons` VALUES (_binary '14bfbd6b-d77c-4ea2-8638-bc0858adfda6','036','Clefable','2022-01-15 02:40:25','2022-01-15 02:40:25'),(_binary '224e3000-8aae-40a5-b689-902076e8c3ba','002','Ivysaur','2022-01-15 02:37:26','2022-01-15 02:37:26'),(_binary '254ae126-868f-46e4-8bed-f2b44fd8786b','029','Nidoran','2022-01-15 02:40:05','2022-01-15 02:40:05'),(_binary '300a1823-828a-4e6b-a4ee-c9203210a60c','003','Venusaur','2022-01-15 02:37:42','2022-01-15 02:37:42'),(_binary '31520594-8bab-4cff-85e2-7f1dc17ab044','004','Charmande','2022-01-15 02:37:57','2022-01-15 02:37:57'),(_binary '3aaa00a4-b1fc-403e-8a80-755e81b7cf74','001','Bulbasaur','2022-01-14 14:00:02','2022-01-14 14:00:02'),(_binary '49f9a67b-bf14-409a-b9d1-554c27a05b46','017','Pidgeotto','2022-01-15 02:39:08','2022-01-15 02:39:08'),(_binary '7087bf24-25e4-428a-a950-bbe9981f473b','025','Pikachu','2022-01-15 02:39:32','2022-01-15 02:39:32'),(_binary '92ea09ec-b581-4f57-bf69-17ba10b4704f','016','Pidgey','2022-01-15 02:38:59','2022-01-15 02:38:59'),(_binary 'bce6517d-ce81-4338-9560-f17c18e1c169','007','Squirtle','2022-01-15 02:38:15','2022-01-15 02:38:15');
/*!40000 ALTER TABLE `pokemons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Grass','2022-01-14 14:00:02','2022-01-15 02:37:42'),(2,'Poison','2022-01-14 14:00:02','2022-01-15 02:40:05'),(3,'Fire','2022-01-14 14:05:39','2022-01-15 02:37:57'),(4,'Water','2022-01-15 02:38:15','2022-01-15 02:38:15'),(5,'Normal','2022-01-15 02:38:59','2022-01-15 02:39:08'),(6,'Flying','2022-01-15 02:38:59','2022-01-15 02:39:08'),(7,'Electric','2022-01-15 02:39:32','2022-01-15 02:39:32'),(8,'Fairy','2022-01-15 02:40:25','2022-01-15 02:40:25');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-15  2:44:08
