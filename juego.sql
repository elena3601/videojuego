CREATE DATABASE  IF NOT EXISTS `juego` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `juego`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: juego
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jugador`
--

DROP TABLE IF EXISTS `jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugador` (
  `id_jugador` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contrasenia` varchar(10) NOT NULL,
  PRIMARY KEY (`id_jugador`),
  UNIQUE KEY `id_jugador_UNIQUE` (`id_jugador`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugador`
--

LOCK TABLES `jugador` WRITE;
/*!40000 ALTER TABLE `jugador` DISABLE KEYS */;
INSERT INTO `jugador` VALUES (1,'Eder Ulises game','eder@gmail.com','12345678'),(2,'Elena','elena@gmail.com','12345678'),(3,'Davis','david@gmail.com','12345678');
/*!40000 ALTER TABLE `jugador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveles`
--

DROP TABLE IF EXISTS `niveles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `niveles` (
  `id_nivel` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) NOT NULL,
  `fk_puntuacion` int NOT NULL,
  PRIMARY KEY (`id_nivel`),
  UNIQUE KEY `id_nivele_UNIQUE` (`id_nivel`),
  KEY `fk_puntuacion_idx` (`fk_puntuacion`),
  CONSTRAINT `fk_puntuacion` FOREIGN KEY (`fk_puntuacion`) REFERENCES `puntaje` (`id_puntaje`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveles`
--

LOCK TABLES `niveles` WRITE;
/*!40000 ALTER TABLE `niveles` DISABLE KEYS */;
INSERT INTO `niveles` VALUES (1,'En el nivel 1 el objetivo es sobrevivir ',1),(2,'En el nivel 2 el objetivo es superar lo 2000 puntos',2),(3,'En el nivel 3 el objetivo es matar a todo lo que se mueva',3);
/*!40000 ALTER TABLE `niveles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidas`
--

DROP TABLE IF EXISTS `partidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partidas` (
  `id_partidas` int NOT NULL AUTO_INCREMENT,
  `estado` enum('Pausada','Jugando','Finalizada') NOT NULL,
  `fecha` datetime NOT NULL,
  `fk_nivel` int NOT NULL,
  `fk_usuario` int NOT NULL,
  `fk_puntaje` int NOT NULL,
  PRIMARY KEY (`id_partidas`),
  UNIQUE KEY `id_partidas_UNIQUE` (`id_partidas`),
  KEY `fk_nivel_idx` (`fk_nivel`),
  KEY `fk_usuario_idx` (`fk_usuario`),
  KEY `fk_puntaje_idx` (`fk_puntaje`),
  CONSTRAINT `fk_nivel` FOREIGN KEY (`fk_nivel`) REFERENCES `niveles` (`id_nivel`),
  CONSTRAINT `fk_puntaje` FOREIGN KEY (`fk_puntaje`) REFERENCES `puntaje` (`id_puntaje`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`fk_usuario`) REFERENCES `jugador` (`id_jugador`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidas`
--

LOCK TABLES `partidas` WRITE;
/*!40000 ALTER TABLE `partidas` DISABLE KEYS */;
INSERT INTO `partidas` VALUES (1,'Jugando','2022-10-10 09:11:59',1,1,1),(2,'Finalizada','2022-10-19 05:35:15',1,1,2),(3,'Pausada','2022-08-19 03:11:02',1,1,3),(4,'Jugando','2022-10-11 22:32:58',1,1,4),(5,'Finalizada','2022-10-09 09:54:36',1,1,5),(6,'Jugando','2022-06-19 15:32:59',2,2,6),(7,'Pausada','2022-03-06 20:47:31',2,2,7),(8,'Finalizada','2022-05-28 16:38:10',2,2,8),(9,'Jugando','2022-09-25 03:11:02',2,2,9),(10,'Pausada','2022-07-21 13:52:30',2,2,10),(11,'Finalizada','2022-03-18 15:54:30',3,3,11),(12,'Jugando','2022-10-15 18:31:24',3,3,12),(13,'Pausada','2022-10-12 22:21:30',3,3,13),(14,'Finalizada','2022-10-02 09:16:34',3,3,14),(15,'Jugando','2022-10-13 09:11:55',3,3,15);
/*!40000 ALTER TABLE `partidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntaje`
--

DROP TABLE IF EXISTS `puntaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntaje` (
  `id_puntaje` int NOT NULL AUTO_INCREMENT,
  `puntos` int NOT NULL,
  PRIMARY KEY (`id_puntaje`),
  UNIQUE KEY `id_puntaje_UNIQUE` (`id_puntaje`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntaje`
--

LOCK TABLES `puntaje` WRITE;
/*!40000 ALTER TABLE `puntaje` DISABLE KEYS */;
INSERT INTO `puntaje` VALUES (1,100),(2,543),(3,548),(4,548),(5,1034),(6,456),(7,435),(8,748),(9,643),(10,560),(11,23),(12,974),(13,548),(14,864),(15,234);
/*!40000 ALTER TABLE `puntaje` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-19 21:28:27
