CREATE DATABASE  IF NOT EXISTS `datask-db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `datask-db`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: datask-db
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articulo` (
  `Id_Articulo` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(45) NOT NULL,
  `Texto` varchar(900) NOT NULL,
  `FechaCreacion` datetime NOT NULL,
  `Categoria_Id_Categoria` int NOT NULL,
  `Usuario_Id_Usuario` int NOT NULL,
  PRIMARY KEY (`Id_Articulo`),
  KEY `fk_Articulo_Categoria1_idx` (`Categoria_Id_Categoria`),
  KEY `fk_Articulo_Usuario1_idx` (`Usuario_Id_Usuario`),
  CONSTRAINT `fk_Articulo_Categoria1` FOREIGN KEY (`Categoria_Id_Categoria`) REFERENCES `categoria` (`Id_Categoria`),
  CONSTRAINT `fk_Articulo_Usuario1` FOREIGN KEY (`Usuario_Id_Usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articulo`
--

LOCK TABLES `articulo` WRITE;
/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
INSERT INTO `articulo` VALUES (1,'¿Qué es una API abierta (pública)?',' ¿Sabes qué es una API abierta y para qué se utilizan? Entre los conceptos más fundamentales para iniciar en la programación o en el sector IT, en general, está el saber qué es una API abierta (o pública), pues esto va a determinar muchos de los procesos en los que te embarcarás. Así pues, si necesitas saber qué es una API abierta, te animamos a descubrirlo en este artículo.','2022-10-22 00:00:10',1,1),(2,'Vulnerabilidades de inyección SQL','¿Sabes qué son las vulnerabilidades de inyección SQL y cómo pueden ser identificadas en una aplicación web? El pentesting de aplicaciones web consiste en poner a prueba la seguridad de todas sus páginas por medio de las mismas técnicas que usaría un hacker malicioso para vulnerarlas. Cabe aclarar que, en el pentesting, este proceso se realiza de forma autorizada y con el fin de reportar los fallos de seguridad encontrado.','2022-10-31 00:10:00',4,2),(4,'¿Qué es Microsoft Azure?',' Microsoft Azure es un servicio de computación en la nube desarrollado por Microsoft Corporation que permite almacenar datos, crear, gestionar y desplegar programas y aplicaciones en la nube. Lo consigue a través del uso de centros de datos, es decir, las instalaciones utilizadas por las organizaciones para guardar su información. Su portal permite el acceso a numerosos servicios de plataforma con el fin de contratar las herramientas de infraestructura necesarias para el funcionamiento de la compañía o proyecto tecnológico.','2022-10-31 19:34:00',6,5),(6,'Peticiones HTTP con Fetch',' En el mundo del desarrollo web, toda página tiene conexiones con otras fuentes de datos, normalmente API construidas para el propio proyecto. Para establecer comunicación con las diversas fuentes de datos de un proyecto, usamos peticiones HTTP. En este post, te enseñaremos qué son y cómo funcionan las peticiones HTTP con Fetch, una herramienta complementaria a la librería Axios.','2022-11-01 17:28:00',5,2);
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `Id_Categoria` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Usuario_Id_Usuario` int NOT NULL,
  PRIMARY KEY (`Id_Categoria`),
  KEY `fk_Categoria_Usuario1_idx` (`Usuario_Id_Usuario`),
  CONSTRAINT `fk_Categoria_Usuario1` FOREIGN KEY (`Usuario_Id_Usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Fundamentos de la programacion',3),(2,'Lenguajes de programacion',2),(3,'Patrones de diseño de software',1),(4,'Ciberseguridad',4),(5,'Desarrollo Web',3),(6,'Big Data',2),(7,'Marketing Digital',1),(8,'Redes',5),(9,'Ciencia de datos',2),(10,'Devops',5);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `Id_Comentario` int NOT NULL AUTO_INCREMENT,
  `Texto` varchar(400) NOT NULL,
  `FechaCreacion` datetime NOT NULL,
  `Usuario_Id_Usuario` int NOT NULL,
  `Pregunta_Id_pregunta` int NOT NULL,
  `Articulo_Id_Articulo` int NOT NULL,
  PRIMARY KEY (`Id_Comentario`),
  KEY `fk_Comentario_Usuario1_idx` (`Usuario_Id_Usuario`),
  KEY `fk_Comentario_Pregunta1_idx` (`Pregunta_Id_pregunta`),
  KEY `fk_Comentario_Articulo1_idx` (`Articulo_Id_Articulo`),
  CONSTRAINT `fk_Comentario_Articulo1` FOREIGN KEY (`Articulo_Id_Articulo`) REFERENCES `articulo` (`Id_Articulo`),
  CONSTRAINT `fk_Comentario_Pregunta1` FOREIGN KEY (`Pregunta_Id_pregunta`) REFERENCES `pregunta` (`Id_pregunta`),
  CONSTRAINT `fk_Comentario_Usuario1` FOREIGN KEY (`Usuario_Id_Usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiqueta`
--

DROP TABLE IF EXISTS `etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiqueta` (
  `Id_Etiqueta` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Usuario_Id_Usuario` int NOT NULL,
  PRIMARY KEY (`Id_Etiqueta`),
  KEY `Id_Usuario_idx` (`Usuario_Id_Usuario`),
  CONSTRAINT `Id_Usuario` FOREIGN KEY (`Usuario_Id_Usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta` (
  `Id_pregunta` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(45) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `FechaCreacion` datetime NOT NULL,
  `Etiqueta` varchar(12) NOT NULL,
  `Usuario_Id_Usuario` int NOT NULL,
  PRIMARY KEY (`Id_pregunta`),
  KEY `fk_Pregunta_Usuario1_idx` (`Usuario_Id_Usuario`),
  CONSTRAINT `fk_Pregunta_Usuario1` FOREIGN KEY (`Usuario_Id_Usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta_etiqueta`
--

DROP TABLE IF EXISTS `pregunta_etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta_etiqueta` (
  `Etiqueta_Id_Etiqueta` int NOT NULL,
  `Pregunta_Id_pregunta` int NOT NULL,
  PRIMARY KEY (`Etiqueta_Id_Etiqueta`,`Pregunta_Id_pregunta`),
  KEY `fk_Etiqueta_has_Pregunta_Pregunta1_idx` (`Pregunta_Id_pregunta`),
  KEY `fk_Etiqueta_has_Pregunta_Etiqueta1_idx` (`Etiqueta_Id_Etiqueta`),
  CONSTRAINT `fk_Etiqueta_has_Pregunta_Etiqueta1` FOREIGN KEY (`Etiqueta_Id_Etiqueta`) REFERENCES `etiqueta` (`Id_Etiqueta`),
  CONSTRAINT `fk_Etiqueta_has_Pregunta_Pregunta1` FOREIGN KEY (`Pregunta_Id_pregunta`) REFERENCES `pregunta` (`Id_pregunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta_etiqueta`
--

LOCK TABLES `pregunta_etiqueta` WRITE;
/*!40000 ALTER TABLE `pregunta_etiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregunta_etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `Id_Roles` int NOT NULL AUTO_INCREMENT,
  `Nombre_Rol` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_Roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_usuario`
--

DROP TABLE IF EXISTS `roles_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_usuario` (
  `Roles_Id_Roles` int NOT NULL,
  `Usuario_Id_Usuario` int NOT NULL,
  PRIMARY KEY (`Roles_Id_Roles`,`Usuario_Id_Usuario`),
  KEY `fk_Roles_has_Usuario_Usuario1_idx` (`Usuario_Id_Usuario`),
  KEY `fk_Roles_has_Usuario_Roles1_idx` (`Roles_Id_Roles`),
  CONSTRAINT `fk_Roles_has_Usuario_Roles1` FOREIGN KEY (`Roles_Id_Roles`) REFERENCES `roles` (`Id_Roles`),
  CONSTRAINT `fk_Roles_has_Usuario_Usuario1` FOREIGN KEY (`Usuario_Id_Usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_usuario`
--

LOCK TABLES `roles_usuario` WRITE;
/*!40000 ALTER TABLE `roles_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `UserName` varchar(45) NOT NULL,
  `Descripcion` varchar(300) NOT NULL,
  `FechaAlta` datetime DEFAULT NULL,
  `Ciudad` varchar(20) NOT NULL,
  `ImagenPerfil` varchar(45) DEFAULT NULL,
  `Contraseña` char(102) NOT NULL,
  `Email` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'AdminMatias','Boiero','Administrador_MB','Desarrollador',NULL,'Buenos Aires',NULL,'pbkdf2:sha256:260000$YFhg8ci3rRRB9b1e$95a67fe6307a53289312c13927e8120138f43f19f50e1cb274d2511cbe98a939','admin@programaelfuturo.com'),(2,'AdminGonzalo','Bruzzo','Administrador_GB','Desarrollador',NULL,'Buenos Aires',NULL,'Admin123*','admin@programaelfuturo.com'),(3,'AdminJonatan','Acuña','Administrador_JA','Desarrollador',NULL,'Cordoba',NULL,'Admin123*','admin@programaelfuturo.com'),(4,'AdminFlavia','Pieroni','Administrador_FP','Desarrolladora',NULL,'Cordoba',NULL,'Admin123*','admin@programaelfuturo.com'),(5,'AdminGabi','Farias','Administrador_GF','Desarrollador',NULL,'Cordoba',NULL,'Admin123*','admin@programaelfuturo.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votos`
--

DROP TABLE IF EXISTS `votos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votos` (
  `Id_votos` int NOT NULL AUTO_INCREMENT,
  `Comentario_Id_Comentario` int NOT NULL,
  `Pregunta_Id_pregunta` int NOT NULL,
  `Usuario_Id_Usuario` int NOT NULL,
  PRIMARY KEY (`Id_votos`),
  KEY `fk_Votos_Comentario1_idx` (`Comentario_Id_Comentario`),
  KEY `fk_Votos_Pregunta1_idx` (`Pregunta_Id_pregunta`),
  KEY `fk_Votos_Usuario1_idx` (`Usuario_Id_Usuario`),
  CONSTRAINT `fk_Votos_Comentario1` FOREIGN KEY (`Comentario_Id_Comentario`) REFERENCES `comentario` (`Id_Comentario`),
  CONSTRAINT `fk_Votos_Pregunta1` FOREIGN KEY (`Pregunta_Id_pregunta`) REFERENCES `pregunta` (`Id_pregunta`),
  CONSTRAINT `fk_Votos_Usuario1` FOREIGN KEY (`Usuario_Id_Usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votos`
--

LOCK TABLES `votos` WRITE;
/*!40000 ALTER TABLE `votos` DISABLE KEYS */;
/*!40000 ALTER TABLE `votos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-09 20:39:48
