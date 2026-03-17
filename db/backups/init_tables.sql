/*
=============================================================================
Nombre del archivo: init_tables.sql
Descripción del archivo: Script SQL para la creación condicional de las tablas necesarias (tbb_personas, tbb_personas_fisicas y tbb_pacientes) y sus relaciones de FKs.
Creado por: Agente AI Antigravity
Adaptado por: 
Supervisado por: 
=============================================================================
*/
-- Script para crear las tablas si no existen, basado en la estructura original
-- Equipo : SICPES - Servicios Medicos (md_user)

CREATE TABLE IF NOT EXISTS `tbb_personas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `tipo` enum('Fisica','Moral') NOT NULL DEFAULT 'Fisica',
  `rfc` varchar(14) DEFAULT NULL,
  `pais_origen` varchar(50) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `rfc` (`rfc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `tbb_personas_fisicas` (
  `ID` int unsigned NOT NULL,
  `titulo_cortesia` varchar(40) DEFAULT NULL,
  `nombre` varchar(60) NOT NULL,
  `primer_apellido` varchar(45) DEFAULT NULL,
  `segundo_apellido` varchar(60) DEFAULT NULL,
  `genero` varchar(10) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `edad` int DEFAULT NULL,
  `tipo_edad` varchar(50) DEFAULT NULL,
  `curp` varchar(18) DEFAULT NULL,
  `grupo_sanguineo` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_personas_fisicas_personas` FOREIGN KEY (`ID`) REFERENCES `tbb_personas` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `tbb_pacientes` (
  `ID` int unsigned NOT NULL,
  `status_medico` varchar(150) DEFAULT NULL,
  `status_vida` enum('Vivo','Finado','Coma','Vegetativo','Desconocido') NOT NULL DEFAULT 'Desconocido',
  `fecha_ultima_citamedica` datetime DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `estatus` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_pacientes_personas_fisicas` FOREIGN KEY (`ID`) REFERENCES `tbb_personas_fisicas` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `tbi_bitacora` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_Tabla` varchar(100) NOT NULL,
  `Usuario` varchar(100) NOT NULL,
  `Operacion` enum('Insert','Update','Delete') NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `Fecha_Hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
