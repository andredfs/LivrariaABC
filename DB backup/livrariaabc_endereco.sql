-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: livrariaabc
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `Cod_Endereco` int NOT NULL,
  `Nome_Rua` varchar(400) DEFAULT NULL,
  `Complemento` varchar(400) DEFAULT NULL,
  `CEP` varchar(400) DEFAULT NULL,
  `Numero` int DEFAULT NULL,
  `Cod_Bairro` int DEFAULT NULL,
  `Cod_TipoEnd` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Endereco`),
  KEY `fk_Endereco_Bairro` (`Cod_Bairro`),
  KEY `fk_Tipo_Endereco` (`Cod_TipoEnd`),
  CONSTRAINT `fk_Endereco_Bairro` FOREIGN KEY (`Cod_Bairro`) REFERENCES `bairro` (`Cod_Bairro`),
  CONSTRAINT `fk_Tipo_Endereco` FOREIGN KEY (`Cod_TipoEnd`) REFERENCES `tipo_endereco` (`Cod_TipoEnd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'SHIS','QI 11','123456789',11,1,1),(2,'Tv. Matos Coutinho','Casa 2','123456789',2,2,1),(3,'R. dos Navegantes','Ed. Jose Bandeira de Oliveira','123456789',223,3,1),(4,'R. 3111','322','123456789',322,4,1),(5,'R. Cecilio Celeste','3012','123456789',3012,5,1);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-08 23:56:32
