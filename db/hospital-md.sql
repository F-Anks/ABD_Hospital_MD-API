-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospital_api
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `tbb_defunciones`
--

DROP TABLE IF EXISTS `tbb_defunciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_defunciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_defunciones`
--

LOCK TABLES `tbb_defunciones` WRITE;
/*!40000 ALTER TABLE `tbb_defunciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_defunciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_departamentos`
--

DROP TABLE IF EXISTS `tbb_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_departamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_departamentos`
--

LOCK TABLES `tbb_departamentos` WRITE;
/*!40000 ALTER TABLE `tbb_departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_diagnostico`
--

DROP TABLE IF EXISTS `tbb_diagnostico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_diagnostico` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_diagnostico`
--

LOCK TABLES `tbb_diagnostico` WRITE;
/*!40000 ALTER TABLE `tbb_diagnostico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_diagnostico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_dietas`
--

DROP TABLE IF EXISTS `tbb_dietas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_dietas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_dietas`
--

LOCK TABLES `tbb_dietas` WRITE;
/*!40000 ALTER TABLE `tbb_dietas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_dietas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_documentos_oficiales`
--

DROP TABLE IF EXISTS `tbb_documentos_oficiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_documentos_oficiales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_documentos_oficiales`
--

LOCK TABLES `tbb_documentos_oficiales` WRITE;
/*!40000 ALTER TABLE `tbb_documentos_oficiales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_documentos_oficiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_expedientes_medicos`
--

DROP TABLE IF EXISTS `tbb_expedientes_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_expedientes_medicos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_expedientes_medicos`
--

LOCK TABLES `tbb_expedientes_medicos` WRITE;
/*!40000 ALTER TABLE `tbb_expedientes_medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_expedientes_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_nacimientos`
--

DROP TABLE IF EXISTS `tbb_nacimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_nacimientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_nacimientos`
--

LOCK TABLES `tbb_nacimientos` WRITE;
/*!40000 ALTER TABLE `tbb_nacimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_nacimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_notas_medicas`
--

DROP TABLE IF EXISTS `tbb_notas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_notas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_notas_medicas`
--

LOCK TABLES `tbb_notas_medicas` WRITE;
/*!40000 ALTER TABLE `tbb_notas_medicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_notas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_pacientes`
--

DROP TABLE IF EXISTS `tbb_pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_pacientes` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_pacientes`
--

LOCK TABLES `tbb_pacientes` WRITE;
/*!40000 ALTER TABLE `tbb_pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_personal`
--

DROP TABLE IF EXISTS `tbb_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personal` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personal`
--

LOCK TABLES `tbb_personal` WRITE;
/*!40000 ALTER TABLE `tbb_personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_personal_medico`
--

DROP TABLE IF EXISTS `tbb_personal_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personal_medico` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personal_medico`
--

LOCK TABLES `tbb_personal_medico` WRITE;
/*!40000 ALTER TABLE `tbb_personal_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_personal_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_personas`
--

DROP TABLE IF EXISTS `tbb_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personas`
--

LOCK TABLES `tbb_personas` WRITE;
/*!40000 ALTER TABLE `tbb_personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_personas_fisicas`
--

DROP TABLE IF EXISTS `tbb_personas_fisicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas_fisicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personas_fisicas`
--

LOCK TABLES `tbb_personas_fisicas` WRITE;
/*!40000 ALTER TABLE `tbb_personas_fisicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_personas_fisicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_personas_morales`
--

DROP TABLE IF EXISTS `tbb_personas_morales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas_morales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personas_morales`
--

LOCK TABLES `tbb_personas_morales` WRITE;
/*!40000 ALTER TABLE `tbb_personas_morales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_personas_morales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_proveedores`
--

DROP TABLE IF EXISTS `tbb_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_proveedores` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_proveedores`
--

LOCK TABLES `tbb_proveedores` WRITE;
/*!40000 ALTER TABLE `tbb_proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_quejas_sugerencias`
--

DROP TABLE IF EXISTS `tbb_quejas_sugerencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_quejas_sugerencias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_quejas_sugerencias`
--

LOCK TABLES `tbb_quejas_sugerencias` WRITE;
/*!40000 ALTER TABLE `tbb_quejas_sugerencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_quejas_sugerencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_recetas_medicas`
--

DROP TABLE IF EXISTS `tbb_recetas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_recetas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_recetas_medicas`
--

LOCK TABLES `tbb_recetas_medicas` WRITE;
/*!40000 ALTER TABLE `tbb_recetas_medicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_recetas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_transacciones_finacieras`
--

DROP TABLE IF EXISTS `tbb_transacciones_finacieras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_transacciones_finacieras` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_transacciones_finacieras`
--

LOCK TABLES `tbb_transacciones_finacieras` WRITE;
/*!40000 ALTER TABLE `tbb_transacciones_finacieras` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_transacciones_finacieras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_transfusiones_sanguineas`
--

DROP TABLE IF EXISTS `tbb_transfusiones_sanguineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_transfusiones_sanguineas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_transfusiones_sanguineas`
--

LOCK TABLES `tbb_transfusiones_sanguineas` WRITE;
/*!40000 ALTER TABLE `tbb_transfusiones_sanguineas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_transfusiones_sanguineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_traslados`
--

DROP TABLE IF EXISTS `tbb_traslados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_traslados` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_traslados`
--

LOCK TABLES `tbb_traslados` WRITE;
/*!40000 ALTER TABLE `tbb_traslados` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_traslados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_tratamientos`
--

DROP TABLE IF EXISTS `tbb_tratamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_tratamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_tratamientos`
--

LOCK TABLES `tbb_tratamientos` WRITE;
/*!40000 ALTER TABLE `tbb_tratamientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_tratamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_valoraciones`
--

DROP TABLE IF EXISTS `tbb_valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_valoraciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_valoraciones`
--

LOCK TABLES `tbb_valoraciones` WRITE;
/*!40000 ALTER TABLE `tbb_valoraciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_valoraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_areas`
--

DROP TABLE IF EXISTS `tbc_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_areas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(80) NOT NULL,
  `Descripcion` text,
  `Ubicacion_ID` int DEFAULT NULL,
  `Personal_ID_Responsable` int DEFAULT NULL,
  `Area_Superior_ID` int DEFAULT NULL,
  `Estatus_Operacion` enum('Activo','Inactivo','En Espera') DEFAULT NULL,
  `Total_Empleados` int DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Estatus` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`),
  KEY `fk_area_superior` (`Area_Superior_ID`),
  CONSTRAINT `fk_area_superior` FOREIGN KEY (`Area_Superior_ID`) REFERENCES `tbc_areas` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_areas`
--

LOCK TABLES `tbc_areas` WRITE;
/*!40000 ALTER TABLE `tbc_areas` DISABLE KEYS */;
INSERT INTO `tbc_areas` VALUES (1,'Servicios Medicos','Área encargada de la gestión de citas medicas y recetas medic',1,3,NULL,NULL,12,'2026-01-16 12:47:28','2026-01-16 12:47:28',_binary ''),(2,'Registros medicos','registros y gestión del personal medico',1,3,NULL,NULL,12,'2026-01-16 12:57:46','2026-01-16 12:57:46',_binary ''),(3,'Urgencias','Área de atención inmediata a pacientes',1,10,NULL,'Activo',25,'2026-01-16 12:59:21','2026-01-16 12:59:21',_binary ''),(4,'Recursos Humanos','Área encargada de la gestión del personal',1,3,NULL,NULL,12,'2026-01-16 14:05:26','2026-01-16 14:05:26',_binary '');
/*!40000 ALTER TABLE `tbc_areas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_ai_areas` AFTER INSERT ON `tbc_areas` FOR EACH ROW BEGIN
INSERT INTO tbi_bitacora (
     Nombre_Tabla,
     Usuario,
     Operacion,
     Descripcion,
     Fecha_Hora
     )
     VALUES (
    'tbc_areas',
     USER(),
    'Insert',
    'Se ha agregado una nueva área',
    NOW()
    );
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbc_cirugias`
--

DROP TABLE IF EXISTS `tbc_cirugias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_cirugias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_cirugias`
--

LOCK TABLES `tbc_cirugias` WRITE;
/*!40000 ALTER TABLE `tbc_cirugias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_cirugias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_equipamiento`
--

DROP TABLE IF EXISTS `tbc_equipamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_equipamiento` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_equipamiento`
--

LOCK TABLES `tbc_equipamiento` WRITE;
/*!40000 ALTER TABLE `tbc_equipamiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_equipamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_espacios`
--

DROP TABLE IF EXISTS `tbc_espacios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_espacios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_espacios`
--

LOCK TABLES `tbc_espacios` WRITE;
/*!40000 ALTER TABLE `tbc_espacios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_espacios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_medicamentos`
--

DROP TABLE IF EXISTS `tbc_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_medicamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_medicamentos`
--

LOCK TABLES `tbc_medicamentos` WRITE;
/*!40000 ALTER TABLE `tbc_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_organos`
--

DROP TABLE IF EXISTS `tbc_organos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_organos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_organos`
--

LOCK TABLES `tbc_organos` WRITE;
/*!40000 ALTER TABLE `tbc_organos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_organos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_patologias`
--

DROP TABLE IF EXISTS `tbc_patologias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_patologias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_patologias`
--

LOCK TABLES `tbc_patologias` WRITE;
/*!40000 ALTER TABLE `tbc_patologias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_patologias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_servicios`
--

DROP TABLE IF EXISTS `tbc_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_servicios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_servicios`
--

LOCK TABLES `tbc_servicios` WRITE;
/*!40000 ALTER TABLE `tbc_servicios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_servicios_medicos`
--

DROP TABLE IF EXISTS `tbc_servicios_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_servicios_medicos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_servicios_medicos`
--

LOCK TABLES `tbc_servicios_medicos` WRITE;
/*!40000 ALTER TABLE `tbc_servicios_medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_servicios_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_signos_vitales`
--

DROP TABLE IF EXISTS `tbc_signos_vitales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_signos_vitales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_signos_vitales`
--

LOCK TABLES `tbc_signos_vitales` WRITE;
/*!40000 ALTER TABLE `tbc_signos_vitales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_signos_vitales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_accesos`
--

DROP TABLE IF EXISTS `tbd_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_accesos` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Persona_ID` int NOT NULL,
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Espacio_ID` int DEFAULT NULL,
  `Tipo` enum('Entrada','Salida') DEFAULT NULL,
  `Estatus` bit(1) DEFAULT b'1',
  `Personal_ID_autoriza` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_accesos`
--

LOCK TABLES `tbd_accesos` WRITE;
/*!40000 ALTER TABLE `tbd_accesos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_accesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_aprobaciones`
--

DROP TABLE IF EXISTS `tbd_aprobaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_aprobaciones` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Personal_ID` int NOT NULL,
  `Servicio_ID` int NOT NULL,
  `Estatus_Aprobacion` enum('Pendiente','Aprobado','Rechazado') DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Estatus` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_aprobaciones`
--

LOCK TABLES `tbd_aprobaciones` WRITE;
/*!40000 ALTER TABLE `tbd_aprobaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_aprobaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_campanias`
--

DROP TABLE IF EXISTS `tbd_campanias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_campanias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(150) NOT NULL,
  `Descripcion` text NOT NULL,
  `Departamento_ID` int unsigned NOT NULL,
  `Personal_ID_responsable` int unsigned NOT NULL,
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Fin` datetime DEFAULT NULL,
  `Estatus_Realizacion` enum('Programada','Realizada','Finalizada','Cancelada','Aprobada','Activa','Inactiva') DEFAULT 'Programada',
  `Estatus` bit(1) DEFAULT b'1',
  `Tipo` enum('Preventiva','Diagnóstica','Terapéutica','Especializada','General') NOT NULL DEFAULT 'General',
  `Observaciones` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_campanias`
--

LOCK TABLES `tbd_campanias` WRITE;
/*!40000 ALTER TABLE `tbd_campanias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_campanias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_citas_medicas`
--

DROP TABLE IF EXISTS `tbd_citas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_citas_medicas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_citas_medicas`
--

LOCK TABLES `tbd_citas_medicas` WRITE;
/*!40000 ALTER TABLE `tbd_citas_medicas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_citas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_horarios`
--

DROP TABLE IF EXISTS `tbd_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_horarios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_horarios`
--

LOCK TABLES `tbd_horarios` WRITE;
/*!40000 ALTER TABLE `tbd_horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_inventario_equipamientos`
--

DROP TABLE IF EXISTS `tbd_inventario_equipamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_inventario_equipamientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_inventario_equipamientos`
--

LOCK TABLES `tbd_inventario_equipamientos` WRITE;
/*!40000 ALTER TABLE `tbd_inventario_equipamientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_inventario_equipamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_inventario_medicamentos`
--

DROP TABLE IF EXISTS `tbd_inventario_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_inventario_medicamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_inventario_medicamentos`
--

LOCK TABLES `tbd_inventario_medicamentos` WRITE;
/*!40000 ALTER TABLE `tbd_inventario_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_inventario_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_lotes_medicamentos`
--

DROP TABLE IF EXISTS `tbd_lotes_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_lotes_medicamentos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_lotes_medicamentos`
--

LOCK TABLES `tbd_lotes_medicamentos` WRITE;
/*!40000 ALTER TABLE `tbd_lotes_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_lotes_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_padecimientos`
--

DROP TABLE IF EXISTS `tbd_padecimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_padecimientos` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_padecimientos`
--

LOCK TABLES `tbd_padecimientos` WRITE;
/*!40000 ALTER TABLE `tbd_padecimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_padecimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_valoraciones`
--

DROP TABLE IF EXISTS `tbd_valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_valoraciones` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_valoraciones`
--

LOCK TABLES `tbd_valoraciones` WRITE;
/*!40000 ALTER TABLE `tbd_valoraciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_valoraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbi_bitacora`
--

DROP TABLE IF EXISTS `tbi_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbi_bitacora` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_Tabla` varchar(80) NOT NULL,
  `Usuario` varchar(80) NOT NULL,
  `Operacion` enum('Insert','Update','Delete') NOT NULL,
  `Descripcion` text NOT NULL,
  `Fecha_Hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbi_bitacora`
--

LOCK TABLES `tbi_bitacora` WRITE;
/*!40000 ALTER TABLE `tbi_bitacora` DISABLE KEYS */;
INSERT INTO `tbi_bitacora` VALUES (1,'tbc_areas','paco@DESKTOP-KSGHE8F','Insert','Se ha agregado una nueva área','2026-01-16 12:47:28'),(2,'tbc_areas','paco2@DESKTOP-I9H2BPJ','Insert','Se ha agregado una nueva área','2026-01-16 12:57:46'),(3,'tbc_areas','cabrera@DESKTOP-LCCOCUU','Insert','Se ha agregado una nueva área','2026-01-16 12:59:21'),(4,'tbc_areas','root@localhost','Insert','Se ha agregado una nueva área','2026-01-16 14:05:26');
/*!40000 ALTER TABLE `tbi_bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_roles_sistema`
--

DROP TABLE IF EXISTS `v_roles_sistema`;
/*!50001 DROP VIEW IF EXISTS `v_roles_sistema`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_roles_sistema` AS SELECT 
 1 AS `User`,
 1 AS `Host`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_reporte_privilegios`
--

DROP TABLE IF EXISTS `vw_reporte_privilegios`;
/*!50001 DROP VIEW IF EXISTS `vw_reporte_privilegios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_reporte_privilegios` AS SELECT 
 1 AS `mensaje`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_roles_usuarios_2`
--

DROP TABLE IF EXISTS `vw_roles_usuarios_2`;
/*!50001 DROP VIEW IF EXISTS `vw_roles_usuarios_2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_roles_usuarios_2` AS SELECT 
 1 AS `usuario`,
 1 AS `host`,
 1 AS `roles_asignados`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'hospital_api'
--

--
-- Dumping routines for database 'hospital_api'
--

--
-- Final view structure for view `v_roles_sistema`
--

/*!50001 DROP VIEW IF EXISTS `v_roles_sistema`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_roles_sistema` AS select `mysql`.`user`.`User` AS `User`,`mysql`.`user`.`Host` AS `Host` from `mysql`.`user` where ((not((`mysql`.`user`.`User` like 'mysql.%'))) and (`mysql`.`user`.`User` <> 'root') and (not((`mysql`.`user`.`User` like '%.%')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_reporte_privilegios`
--

/*!50001 DROP VIEW IF EXISTS `vw_reporte_privilegios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_reporte_privilegios` AS select `reporte`.`mensaje` AS `mensaje` from (select '-- GERENCIA --' AS `mensaje` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `CONCAT(
        'GRANT ',
        GROUP_CONCAT(tp.PRIVILEGE_TYPE ORDER BY tp.PRIVILEGE_TYPE SEPARATOR ', '),
        ' ON ',
        tp.TABLE_SCHEMA, '.', tp.TABLE_NAME,
        ' TO ',
        tp.GRANTEE, ';'
    )` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_api') and (`tp`.`GRANTEE` like '\'ge_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- RECURSOS HUMANOS --' AS `-- RECURSOS HUMANOS --` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `CONCAT(
        'GRANT ',
        GROUP_CONCAT(tp.PRIVILEGE_TYPE ORDER BY tp.PRIVILEGE_TYPE SEPARATOR ', '),
        ' ON ',
        tp.TABLE_SCHEMA, '.', tp.TABLE_NAME,
        ' TO ',
        tp.GRANTEE, ';'
    )` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_api') and (`tp`.`GRANTEE` like '\'hr_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- RECURSOS MATERIALES --' AS `-- RECURSOS MATERIALES --` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `CONCAT(
        'GRANT ',
        GROUP_CONCAT(tp.PRIVILEGE_TYPE ORDER BY tp.PRIVILEGE_TYPE SEPARATOR ', '),
        ' ON ',
        tp.TABLE_SCHEMA, '.', tp.TABLE_NAME,
        ' TO ',
        tp.GRANTEE, ';'
    )` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_api') and (`tp`.`GRANTEE` like '\'mr_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- REGISTROS MEDICOS --' AS `-- REGISTROS MEDICOS --` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `CONCAT(
        'GRANT ',
        GROUP_CONCAT(tp.PRIVILEGE_TYPE ORDER BY tp.PRIVILEGE_TYPE SEPARATOR ', '),
        ' ON ',
        tp.TABLE_SCHEMA, '.', tp.TABLE_NAME,
        ' TO ',
        tp.GRANTEE, ';'
    )` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_api') and (`tp`.`GRANTEE` like '\'md_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- SERVICIOS MEDICOS --' AS `-- SERVICIOS MEDICOS --` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `CONCAT(
        'GRANT ',
        GROUP_CONCAT(tp.PRIVILEGE_TYPE ORDER BY tp.PRIVILEGE_TYPE SEPARATOR ', '),
        ' ON ',
        tp.TABLE_SCHEMA, '.', tp.TABLE_NAME,
        ' TO ',
        tp.GRANTEE, ';'
    )` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_api') and (`tp`.`GRANTEE` like '\'ms_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- FARMACIA --' AS `-- FARMACIA --` union all select concat('GRANT ',group_concat(`tp`.`PRIVILEGE_TYPE` order by `tp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`tp`.`TABLE_SCHEMA`,'.',`tp`.`TABLE_NAME`,' TO ',`tp`.`GRANTEE`,';') AS `CONCAT(
        'GRANT ',
        GROUP_CONCAT(tp.PRIVILEGE_TYPE ORDER BY tp.PRIVILEGE_TYPE SEPARATOR ', '),
        ' ON ',
        tp.TABLE_SCHEMA, '.', tp.TABLE_NAME,
        ' TO ',
        tp.GRANTEE, ';'
    )` from `information_schema`.`TABLE_PRIVILEGES` `tp` where ((`tp`.`TABLE_SCHEMA` = 'hospital_api') and (`tp`.`GRANTEE` like '\'ph_user\'@%')) group by `tp`.`GRANTEE`,`tp`.`TABLE_SCHEMA`,`tp`.`TABLE_NAME` union all select '-- DEVELOPER --' AS `-- DEVELOPER --` union all select concat('GRANT ',group_concat(`sp`.`PRIVILEGE_TYPE` order by `sp`.`PRIVILEGE_TYPE` ASC separator ', '),' ON ',`sp`.`TABLE_SCHEMA`,'.* TO ',`sp`.`GRANTEE`,';') AS `CONCAT(
            'GRANT ',
            GROUP_CONCAT(sp.PRIVILEGE_TYPE ORDER BY sp.PRIVILEGE_TYPE SEPARATOR ', '),
            ' ON ',
            sp.TABLE_SCHEMA,
            '.* TO ',
            sp.GRANTEE,
            ';'
        )` from `information_schema`.`SCHEMA_PRIVILEGES` `sp` where ((`sp`.`TABLE_SCHEMA` = 'hospital_api') and (`sp`.`GRANTEE` like '\'developer\'@%')) group by `sp`.`GRANTEE`,`sp`.`TABLE_SCHEMA`) `reporte` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_roles_usuarios_2`
--

/*!50001 DROP VIEW IF EXISTS `vw_roles_usuarios_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_roles_usuarios_2` AS select `u`.`User` AS `usuario`,`u`.`Host` AS `host`,ifnull(group_concat(concat(`r`.`TO_USER`,'@',convert(`r`.`TO_HOST` using utf8mb3)) order by `r`.`TO_USER` ASC separator ', '),'SIN ROLES') AS `roles_asignados` from (`mysql`.`user` `u` left join `mysql`.`role_edges` `r` on(((`u`.`User` = `r`.`FROM_USER`) and (`u`.`Host` = `r`.`FROM_HOST`)))) where ((`u`.`User` like '%user%') or (`u`.`User` = 'developer')) group by `u`.`User`,`u`.`Host` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-16 22:24:24
