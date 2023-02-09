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
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `Cod_Pedido` int NOT NULL,
  `Data_Envio` date DEFAULT NULL,
  `Data_Entrega` date DEFAULT NULL,
  `Confirm_Recebido` tinyint(1) DEFAULT NULL,
  `Cod_Cesta` int DEFAULT NULL,
  `Cod_Pagamento` int DEFAULT NULL,
  `Cod_Endereco` int DEFAULT NULL,
  `CPF_Cliente` int DEFAULT NULL,
  `Cod_Funcionario` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Pedido`),
  KEY `fk_Cesta_Pedido` (`Cod_Cesta`),
  KEY `fk_Pagamento_Pedido` (`Cod_Pagamento`),
  KEY `fk_Endereco_Pedido` (`Cod_Endereco`),
  KEY `fk_Cliente_Pedido` (`CPF_Cliente`),
  KEY `fk_Funcionario_Pedido` (`Cod_Funcionario`),
  CONSTRAINT `fk_Cesta_Pedido` FOREIGN KEY (`Cod_Cesta`) REFERENCES `cesta` (`Cod_Cesta`),
  CONSTRAINT `fk_Cliente_Pedido` FOREIGN KEY (`CPF_Cliente`) REFERENCES `cliente` (`CPF_Cliente`),
  CONSTRAINT `fk_Endereco_Pedido` FOREIGN KEY (`Cod_Endereco`) REFERENCES `endereco` (`Cod_Endereco`),
  CONSTRAINT `fk_Funcionario_Pedido` FOREIGN KEY (`Cod_Funcionario`) REFERENCES `funcionario` (`Cod_Funcionario`),
  CONSTRAINT `fk_Pagamento_Pedido` FOREIGN KEY (`Cod_Pagamento`) REFERENCES `tipo_pagamento` (`Cod_Pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2023-02-08','2023-02-12',0,1,1,1,111111111,1),(2,'2023-02-08','2023-02-12',0,2,2,2,222222222,2),(3,'2023-02-08','2023-02-12',0,3,3,3,333333333,3),(4,'2023-02-08','2023-02-12',0,4,4,4,444444444,4),(5,'2023-02-08','2023-02-12',0,5,4,5,555555555,5);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-08 23:56:31
