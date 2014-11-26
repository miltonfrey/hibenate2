-- MySQL dump 10.13  Distrib 5.5.24, for Win32 (x86)
--
-- Host: localhost    Database: pfc3
-- ------------------------------------------------------
-- Server version	5.5.24-log

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
-- Table structure for table `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignatura` (
  `codAsignatura` int(11) NOT NULL DEFAULT '0',
  `nombreAsignatura` varchar(50) DEFAULT NULL,
  `creditos` smallint(6) DEFAULT NULL,
  `periodo` varchar(10) DEFAULT NULL,
  `infoAsigantura` longtext,
  `webAsignatura` varchar(200) DEFAULT NULL,
  `facultad` varchar(50) DEFAULT NULL,
  `titulacion` varchar(45) DEFAULT NULL,
  `nombreUniversidad` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`codAsignatura`,`nombreUniversidad`),
  KEY `asignatura_ibfk_1` (`nombreUniversidad`),
  CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`nombreUniversidad`) REFERENCES `universidad` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignatura`
--

LOCK TABLES `asignatura` WRITE;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
INSERT INTO `asignatura` VALUES (1,'asd',6,'invierno','','','','','ABC'),(1,'Ingenieria del software',6,'invierno','','','','','Cambridge'),(1,'Redes',10,'anual','','','','','UDC'),(2,'SOII',5,'primavera','','','','','ABC'),(2,'Ingles tecnico',6,'invierno','','','','','UDC'),(3,'Ingles técnico',6,'invierno','','','','','ABC'),(3,'TALF',10,'anual','','','','','UDC'),(4,'Fisica',10,'anual','','','','','ABC'),(4,'Fisica',6,'invierno','','','','','UDC'),(5,'Electronica',6,'invierno','','','','','ABC'),(5,'Electronica',7,'primavera','','','','','UDC'),(6,'Calculo',10,'anual','','','','','ABC'),(6,'Programacion I',6,'primavera','','','','','UDC'),(7,'Programacion',4,'invierno','','','','','ABC'),(7,'Programacion II',6,'primavera','','','','','UDC'),(8,'Programacion II',5,'primavera','','http://www.marca.com','','','ABC'),(8,'SO I',6,'invierno','','','','','UDC'),(9,'TALF',6,'invierno','','','','','ABC'),(9,'SO II',8,'invierno','','','','','UDC'),(10,'Teoría de colas ',10,'anual','','','','','ABC'),(10,'Ingenieria del software',6,'invierno','','','','','UDC'),(11,'SO I',6,'invierno','','','','','ABC'),(11,'Aseguramiento de la Calidad',6,'invierno','','','','','UDC'),(12,'Matematica discreta',6,'primavera','','http://www.meteogalicia.es','','','ABC');
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato` (
  `idContrato` int(11) NOT NULL AUTO_INCREMENT,
  `idMovilidad` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idContrato`),
  KEY `idMovilidad_idx` (`idMovilidad`),
  CONSTRAINT `idMovilidad` FOREIGN KEY (`idMovilidad`) REFERENCES `movilidad` (`codMovilidad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato_equivalencia`
--

DROP TABLE IF EXISTS `contrato_equivalencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato_equivalencia` (
  `idContrato` int(11) NOT NULL,
  `idEquivalencia` int(11) NOT NULL,
  PRIMARY KEY (`idContrato`,`idEquivalencia`),
  KEY `equivalencia1_idx` (`idEquivalencia`),
  CONSTRAINT `contrato1` FOREIGN KEY (`idContrato`) REFERENCES `contrato` (`idContrato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `equivalencia1` FOREIGN KEY (`idEquivalencia`) REFERENCES `equivalencia` (`idequivalencia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato_equivalencia`
--

LOCK TABLES `contrato_equivalencia` WRITE;
/*!40000 ALTER TABLE `contrato_equivalencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `contrato_equivalencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursoacademico`
--

DROP TABLE IF EXISTS `cursoacademico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursoacademico` (
  `cursoAcademico` varchar(10) NOT NULL,
  PRIMARY KEY (`cursoAcademico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursoacademico`
--

LOCK TABLES `cursoacademico` WRITE;
/*!40000 ALTER TABLE `cursoacademico` DISABLE KEYS */;
INSERT INTO `cursoacademico` VALUES ('2014/2015'),('2015/2016');
/*!40000 ALTER TABLE `cursoacademico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equivalencia`
--

DROP TABLE IF EXISTS `equivalencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equivalencia` (
  `idequivalencia` int(11) NOT NULL AUTO_INCREMENT,
  `visible` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`idequivalencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equivalencia`
--

LOCK TABLES `equivalencia` WRITE;
/*!40000 ALTER TABLE `equivalencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `equivalencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `estado` varchar(15) NOT NULL,
  PRIMARY KEY (`estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES ('aceptado'),('pendiente'),('rechazado');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_movilidad`
--

DROP TABLE IF EXISTS `estado_movilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_movilidad` (
  `estadoMovilidad` varchar(10) NOT NULL,
  PRIMARY KEY (`estadoMovilidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_movilidad`
--

LOCK TABLES `estado_movilidad` WRITE;
/*!40000 ALTER TABLE `estado_movilidad` DISABLE KEYS */;
INSERT INTO `estado_movilidad` VALUES ('aceptada'),('cancelada'),('pendiente'),('rechazada'),('terminada');
/*!40000 ALTER TABLE `estado_movilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje` (
  `idmensaje` int(11) NOT NULL AUTO_INCREMENT,
  `origen` varchar(45) NOT NULL,
  `destino` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL,
  `tema` mediumtext,
  `texto` longtext NOT NULL,
  `leidoDestino` varchar(2) NOT NULL,
  `eliminadoOrigen` varchar(2) NOT NULL,
  `eliminadoDestino` varchar(2) NOT NULL,
  PRIMARY KEY (`idmensaje`),
  KEY `origen_idx` (`origen`),
  KEY `destino_idx` (`destino`),
  CONSTRAINT `destino` FOREIGN KEY (`destino`) REFERENCES `usuario` (`login`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `origen` FOREIGN KEY (`origen`) REFERENCES `usuario` (`login`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
INSERT INTO `mensaje` VALUES (137,'user1','admin','2014-11-24 22:05:49','contrato creado','el usuario user1 ha modificado un contrato','no','no','no'),(138,'user1','admin','2014-11-24 22:05:49','contrato creado','el usuario user1 ha modificado un contrato','no','no','no'),(139,'user1','admin','2014-11-24 22:12:53','contrato creado','el usuario user1 ha modificado un contrato','no','no','no'),(140,'user1','admin','2014-11-24 22:12:53','contrato creado','el usuario user1 ha modificado un contrato','no','no','no'),(141,'admin','user1','2014-11-24 22:36:34','cambio de estado de contrato','El estado de un contrato ha sido modificado','no','no','no'),(142,'user1','admin','2014-11-24 22:37:03','contrato creado','el usuario user1 ha modificado un contrato','no','no','no'),(143,'user1','admin','2014-11-24 22:42:59','movilidad creada','el usuario n1 a1 ha creado una movilidad a ABC entre el 24-11-2014 y 28-02-2015','no','no','no'),(144,'admin','user1','2014-11-24 22:43:25','cambio de estado de movilidad','destino:ABC \nfecha de inicio:24-11-2014 \nfecha fin:28-02-2015\n\nel estado de la movilidad ahora es: aceptada','no','no','no'),(145,'user1','admin','2014-11-24 22:43:48','contrato modificado','el usuario user1 ha modificado un contrato','no','no','no'),(146,'user1','admin','2014-11-24 22:43:48','contrato modificado','el usuario user1 ha modificado un contrato','no','no','no'),(147,'user1','admin','2014-11-24 22:50:54','movilidad creada','el usuario n1 a1 ha creado una movilidad a ABC entre el 24-11-2014 y 28-02-2015','no','no','no'),(149,'admin','user1','2014-11-24 23:12:38','cambio de estado de movilidad','destino:ABC \nfecha de inicio:24-11-2014 \nfecha fin:28-02-2015\n\nel estado de la movilidad ahora es: aceptada','no','no','no'),(150,'user1','admin','2014-11-24 23:13:05','contrato modificado','el usuario user1 ha modificado un contrato','no','no','no'),(151,'user1','admin','2014-11-24 23:13:05','contrato modificado','el usuario user1 ha modificado un contrato','no','no','no'),(152,'admin','user1','2014-11-24 23:13:36','cambio de estado de contrato','El estado de un contrato ha sido modificado','no','no','no'),(153,'user1','admin','2014-11-26 11:23:23','movilidad creada','el usuario n1 a1 ha creado una movilidad a ABC entre el 26-11-2014 y 31-03-2015','no','no','no'),(154,'admin','user1','2014-11-26 11:24:22','cambio de estado de movilidad','destino:ABC \nfecha de inicio:26-11-2014 \nfecha fin:31-03-2015\n\nel estado de la movilidad ahora es: aceptada','no','no','no');
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembro_grupo_asignatura_a`
--

DROP TABLE IF EXISTS `miembro_grupo_asignatura_a`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miembro_grupo_asignatura_a` (
  `idmiembro_grupo_asignatura_a` int(11) NOT NULL AUTO_INCREMENT,
  `codAsignatura` int(11) DEFAULT NULL,
  `nombreUniversidad` varchar(50) DEFAULT NULL,
  `idEquivalencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmiembro_grupo_asignatura_a`),
  KEY `equivalenciad_idx` (`idEquivalencia`),
  KEY `asignaturaa_idx` (`codAsignatura`,`nombreUniversidad`),
  CONSTRAINT `asignaturaa` FOREIGN KEY (`codAsignatura`, `nombreUniversidad`) REFERENCES `asignatura` (`codAsignatura`, `nombreUniversidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `equivalenciad` FOREIGN KEY (`idEquivalencia`) REFERENCES `equivalencia` (`idequivalencia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembro_grupo_asignatura_a`
--

LOCK TABLES `miembro_grupo_asignatura_a` WRITE;
/*!40000 ALTER TABLE `miembro_grupo_asignatura_a` DISABLE KEYS */;
/*!40000 ALTER TABLE `miembro_grupo_asignatura_a` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miembro_grupo_asignatura_b`
--

DROP TABLE IF EXISTS `miembro_grupo_asignatura_b`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miembro_grupo_asignatura_b` (
  `idmiembro_grupo_asignatura_b` int(11) NOT NULL AUTO_INCREMENT,
  `codAsignatura` int(11) DEFAULT NULL,
  `nombreUniversidad` varchar(50) DEFAULT NULL,
  `idEquivalencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmiembro_grupo_asignatura_b`),
  KEY `asignatura_idx` (`codAsignatura`,`nombreUniversidad`),
  KEY `equivalencia_idx` (`idEquivalencia`),
  CONSTRAINT `asignaturab` FOREIGN KEY (`codAsignatura`, `nombreUniversidad`) REFERENCES `asignatura` (`codAsignatura`, `nombreUniversidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `equivalencia` FOREIGN KEY (`idEquivalencia`) REFERENCES `equivalencia` (`idequivalencia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miembro_grupo_asignatura_b`
--

LOCK TABLES `miembro_grupo_asignatura_b` WRITE;
/*!40000 ALTER TABLE `miembro_grupo_asignatura_b` DISABLE KEYS */;
/*!40000 ALTER TABLE `miembro_grupo_asignatura_b` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movilidad`
--

DROP TABLE IF EXISTS `movilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movilidad` (
  `codMovilidad` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInicio` datetime NOT NULL,
  `fechaFin` datetime NOT NULL,
  `estado` varchar(10) NOT NULL,
  `loginUsuario` varchar(20) NOT NULL,
  `nombreUniversidad` varchar(45) NOT NULL,
  `cursoAcademico` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codMovilidad`),
  KEY `usuario_idx` (`loginUsuario`),
  KEY `universidad_idx` (`nombreUniversidad`),
  KEY `cursoAcademico_idx` (`cursoAcademico`),
  CONSTRAINT `cursoAcademico` FOREIGN KEY (`cursoAcademico`) REFERENCES `cursoacademico` (`cursoAcademico`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `universidad` FOREIGN KEY (`nombreUniversidad`) REFERENCES `universidad` (`nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario` FOREIGN KEY (`loginUsuario`) REFERENCES `usuario` (`login`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movilidad`
--

LOCK TABLES `movilidad` WRITE;
/*!40000 ALTER TABLE `movilidad` DISABLE KEYS */;
INSERT INTO `movilidad` VALUES (1,'2014-11-26 00:00:00','2015-03-31 00:00:00','aceptada','user1','ABC','2014/2015');
/*!40000 ALTER TABLE `movilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES ('Alemania'),('España'),('Francia'),('Reino Unido');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `universidad`
--

DROP TABLE IF EXISTS `universidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `universidad` (
  `nombre` varchar(45) NOT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `info` longtext,
  `web` varchar(50) DEFAULT NULL,
  `codUniversidad` varchar(15) NOT NULL,
  PRIMARY KEY (`nombre`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `codUniversidad_UNIQUE` (`codUniversidad`),
  KEY `pais_idx` (`pais`),
  CONSTRAINT `pais` FOREIGN KEY (`pais`) REFERENCES `pais` (`nombre`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `universidad`
--

LOCK TABLES `universidad` WRITE;
/*!40000 ALTER TABLE `universidad` DISABLE KEYS */;
INSERT INTO `universidad` VALUES ('ABC','Alemania','','http://marca.com','GER001'),('ASD','Alemania','','','GER-002'),('BVF','Alemania','','','GER-004'),('Cambridge','Reino Unido','','','UK-001'),('RTE','Alemania','','','GER-003'),('SDF','Alemania','','','GER-005'),('UDC','España','','','ES-001');
/*!40000 ALTER TABLE `universidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `login` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `tipo_usuario` smallint(6) NOT NULL,
  `titulacion` varchar(25) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido1` varchar(45) NOT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('admin','21232f297a57a5a743894a0e4a801fc3',0,'admin','admin','admin','admin'),('admin2','c84258e9c39059a89ab77d846ddab909',0,'admin','admin','admin',NULL),('s','0cc175b9c0f1b6a831c399e269772661',1,'GEI','s','s','s'),('user1','a722c63db8ec8625af6cf71cb8c2d939',1,'GEI','n1','a1',''),('user10','4d186321c1a7f0f354b297e8914ab240',1,'MUEI','Nombre1','Apellido1','Apellido2'),('user11','1a1dc91c907325c69271ddf0c944bc72',1,'GEI','a','a','a'),('user2','pass2',1,'GEI','u2','a2','');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-26 14:39:31
