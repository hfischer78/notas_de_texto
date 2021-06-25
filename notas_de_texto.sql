CREATE DATABASE  IF NOT EXISTS `nota_de_texto` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `nota_de_texto`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nota_de_texto
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.19-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Categoria` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Musica'),(2,'Cine'),(3,'Libros'),(4,'Noticias'),(5,'Trabajo');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(100) NOT NULL,
  `Fecha_Creacion` datetime NOT NULL,
  `Fecha_Modificacion` datetime NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_1e0f6c10-b85a-4a3c-8dbd-14de91025ad7` (`Id_usuario`),
  CONSTRAINT `FK_1e0f6c10-b85a-4a3c-8dbd-14de91025ad7` FOREIGN KEY (`Id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,'Peliculas para ver','2021-06-25 16:13:42','2021-06-25 16:13:42',1,'Harry Potter'),(2,'Bandas','2021-06-25 16:19:37','2021-06-25 16:19:37',1,'Divididos'),(3,'Tareas Importantes','2021-06-25 16:19:37','2021-06-25 16:19:37',1,'Entrega TP Digital House'),(4,'Libros recomendados','2021-06-25 16:19:37','2021-06-25 16:19:37',1,'Como manejar bases de datos y no morir en el intento'),(5,'Noticias','2021-06-25 16:19:37','2021-06-25 16:19:37',1,'Eficacia de la vacuna Sputnik');
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_categorias`
--

DROP TABLE IF EXISTS `notas_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas_categorias` (
  `Id_notas` int(11) DEFAULT NULL,
  `Id_Categorias` int(11) DEFAULT NULL,
  KEY `FK_5c62a62f-9879-406c-a109-355eef9cdc2e` (`Id_notas`),
  KEY `FK_567abaa6-ea6a-4612-8d1c-431ceed75d0b` (`Id_Categorias`),
  CONSTRAINT `FK_567abaa6-ea6a-4612-8d1c-431ceed75d0b` FOREIGN KEY (`Id_Categorias`) REFERENCES `categorias` (`Id`),
  CONSTRAINT `FK_5c62a62f-9879-406c-a109-355eef9cdc2e` FOREIGN KEY (`Id_notas`) REFERENCES `notas` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_categorias`
--

LOCK TABLES `notas_categorias` WRITE;
/*!40000 ALTER TABLE `notas_categorias` DISABLE KEYS */;
INSERT INTO `notas_categorias` VALUES (1,2),(2,1),(3,5),(4,3),(4,5),(5,4);
/*!40000 ALTER TABLE `notas_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) NOT NULL,
  `e-mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'horacio','horacio@horacio.com'),(2,'fernando','fernando@f.com'),(3,'alejandra','alejandra@a.com'),(4,'federico','federico@f.com'),(5,'sofia','sofia@s.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-25 16:36:43
