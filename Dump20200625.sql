CREATE DATABASE  IF NOT EXISTS `sin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sin`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: sin
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `agente`
--

DROP TABLE IF EXISTS `agente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agente` (
  `n_distintivo` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `nome_in_codice` varchar(20) DEFAULT NULL,
  `data_nascita` date NOT NULL,
  `n_cercapersone` varchar(20) NOT NULL,
  `codice_contratto` int DEFAULT NULL,
  PRIMARY KEY (`n_distintivo`),
  UNIQUE KEY `codice_contratto_UNIQUE` (`codice_contratto`),
  CONSTRAINT `agente_contr_att` FOREIGN KEY (`codice_contratto`) REFERENCES `contratto_op_campo_attuale` (`codice`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agente`
--

LOCK TABLES `agente` WRITE;
/*!40000 ALTER TABLE `agente` DISABLE KEYS */;
INSERT INTO `agente` VALUES ('app','alessio','palma','goat','2000-02-04','111',33);
/*!40000 ALTER TABLE `agente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `agente_BEFORE_INSERT` BEFORE INSERT ON `agente` FOR EACH ROW BEGIN
IF new.codice_contratto IS NOT NULL THEN
  IF new.codice_contratto IN (SELECT spia.codice_contratto
                              FROM spia) THEN
    signal sqlstate '45000' set message_text = 'Il contratto è già associato ad una spia';
  END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `agente_BEFORE_UPDATE` BEFORE UPDATE ON `agente` FOR EACH ROW BEGIN
IF new.codice_contratto IS NOT NULL THEN
  IF new.codice_contratto IN (SELECT spia.codice_contratto
                              FROM spia) THEN
    signal sqlstate '45000' set message_text = 'Il contratto è già associato ad una spia';
  END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `bloccaggio`
--

DROP TABLE IF EXISTS `bloccaggio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloccaggio` (
  `codice_operazione` int NOT NULL,
  `codice_spia` int NOT NULL,
  PRIMARY KEY (`codice_operazione`,`codice_spia`),
  KEY `codspia_idx` (`codice_spia`),
  CONSTRAINT `codice-spion` FOREIGN KEY (`codice_operazione`) REFERENCES `operazione_spionaggio` (`codice`) ON DELETE CASCADE,
  CONSTRAINT `codice_spia_scoperta` FOREIGN KEY (`codice_spia`) REFERENCES `spia_scoperta` (`codice`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloccaggio`
--

LOCK TABLES `bloccaggio` WRITE;
/*!40000 ALTER TABLE `bloccaggio` DISABLE KEYS */;
INSERT INTO `bloccaggio` VALUES (1,44);
/*!40000 ALTER TABLE `bloccaggio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citta`
--

DROP TABLE IF EXISTS `citta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citta` (
  `nome` varchar(45) NOT NULL,
  `n_abitanti` int NOT NULL,
  `provincia` varchar(45) NOT NULL,
  PRIMARY KEY (`nome`),
  KEY `provcittà_idx` (`provincia`),
  CONSTRAINT `prov_citta` FOREIGN KEY (`provincia`) REFERENCES `citta` (`nome`),
  CONSTRAINT `ab_città` CHECK ((`n_abitanti` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citta`
--

LOCK TABLES `citta` WRITE;
/*!40000 ALTER TABLE `citta` DISABLE KEYS */;
INSERT INTO `citta` VALUES ('ostia',80000,'roma'),('pomezia',60000,'roma'),('roma',600000,'roma'),('talenti',20000,'roma');
/*!40000 ALTER TABLE `citta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comp_indagini`
--

DROP TABLE IF EXISTS `comp_indagini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comp_indagini` (
  `nome_in_codice` varchar(20) NOT NULL,
  `numero_distintivo` varchar(20) NOT NULL,
  PRIMARY KEY (`nome_in_codice`,`numero_distintivo`),
  KEY `indagente_idx` (`numero_distintivo`),
  CONSTRAINT `agente_ind` FOREIGN KEY (`numero_distintivo`) REFERENCES `agente` (`n_distintivo`) ON DELETE CASCADE,
  CONSTRAINT `nome_ind` FOREIGN KEY (`nome_in_codice`) REFERENCES `indagine` (`nome_in_codice`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comp_indagini`
--

LOCK TABLES `comp_indagini` WRITE;
/*!40000 ALTER TABLE `comp_indagini` DISABLE KEYS */;
INSERT INTO `comp_indagini` VALUES ('leone','app'),('tigre','app');
/*!40000 ALTER TABLE `comp_indagini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conflitto_territoriale`
--

DROP TABLE IF EXISTS `conflitto_territoriale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conflitto_territoriale` (
  `org1` varchar(20) NOT NULL,
  `org2` varchar(20) NOT NULL,
  PRIMARY KEY (`org1`,`org2`),
  KEY `conforg2_idx` (`org2`),
  CONSTRAINT `conf_org1` FOREIGN KEY (`org1`) REFERENCES `org_criminale` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `conf_org2` FOREIGN KEY (`org2`) REFERENCES `org_criminale` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conflitto_territoriale`
--

LOCK TABLES `conflitto_territoriale` WRITE;
/*!40000 ALTER TABLE `conflitto_territoriale` DISABLE KEYS */;
INSERT INTO `conflitto_territoriale` VALUES ('mafia','clan casamonica'),('camorra','mafia');
/*!40000 ALTER TABLE `conflitto_territoriale` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `conflitto_territoriale_BEFORE_INSERT` BEFORE INSERT ON `conflitto_territoriale` FOR EACH ROW BEGIN
CALL controllo_conflitto(new.org1,new.org2);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `conflitto_territoriale_BEFORE_UPDATE` BEFORE UPDATE ON `conflitto_territoriale` FOR EACH ROW BEGIN
CALL controllo_conflitto(new.org1,new.org2);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `contratto_agente_scaduto`
--

DROP TABLE IF EXISTS `contratto_agente_scaduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratto_agente_scaduto` (
  `codice` int NOT NULL,
  `n_distintivo` varchar(20) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL,
  `sede` varchar(45) NOT NULL,
  PRIMARY KEY (`codice`),
  KEY `distagente_idx` (`n_distintivo`),
  KEY `cas-sede_idx` (`sede`),
  CONSTRAINT `agente_contr` FOREIGN KEY (`n_distintivo`) REFERENCES `agente` (`n_distintivo`) ON DELETE CASCADE,
  CONSTRAINT `sede_contr_agente` FOREIGN KEY (`sede`) REFERENCES `sede` (`indirizzo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratto_agente_scaduto`
--

LOCK TABLES `contratto_agente_scaduto` WRITE;
/*!40000 ALTER TABLE `contratto_agente_scaduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratto_agente_scaduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratto_op_campo_attuale`
--

DROP TABLE IF EXISTS `contratto_op_campo_attuale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratto_op_campo_attuale` (
  `codice` int NOT NULL,
  `data_inizio` date NOT NULL,
  `sede` varchar(45) NOT NULL,
  PRIMARY KEY (`codice`),
  KEY `ca_oc-sede_idx` (`sede`),
  CONSTRAINT `sed_contr_op_cam` FOREIGN KEY (`sede`) REFERENCES `sede` (`indirizzo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratto_op_campo_attuale`
--

LOCK TABLES `contratto_op_campo_attuale` WRITE;
/*!40000 ALTER TABLE `contratto_op_campo_attuale` DISABLE KEYS */;
INSERT INTO `contratto_op_campo_attuale` VALUES (2,'1999-04-05','via don luigi sturzo'),(33,'2008-05-03','via del mare');
/*!40000 ALTER TABLE `contratto_op_campo_attuale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratto_op_log_scaduto`
--

DROP TABLE IF EXISTS `contratto_op_log_scaduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratto_op_log_scaduto` (
  `codice` int NOT NULL,
  `cf` varchar(20) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL,
  `sede` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codice`),
  KEY `cs-cf_idx` (`cf`),
  KEY `cs-sede_idx` (`sede`),
  CONSTRAINT `cf_contr_op_log` FOREIGN KEY (`cf`) REFERENCES `operatore_logistico` (`cf`) ON DELETE CASCADE,
  CONSTRAINT `sede_contr_op_log` FOREIGN KEY (`sede`) REFERENCES `sede` (`indirizzo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratto_op_log_scaduto`
--

LOCK TABLES `contratto_op_log_scaduto` WRITE;
/*!40000 ALTER TABLE `contratto_op_log_scaduto` DISABLE KEYS */;
INSERT INTO `contratto_op_log_scaduto` VALUES (3,'snt','2000-02-03','2001-04-04','via campobello'),(4,'snt','2000-04-07','2001-09-09','via del mare'),(6,'yyy','2002-07-01','2002-07-02','via don luigi sturzo'),(7,'yyy','2003-08-09','2003-08-10','via del mare');
/*!40000 ALTER TABLE `contratto_op_log_scaduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratto_op_uff_attuale`
--

DROP TABLE IF EXISTS `contratto_op_uff_attuale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratto_op_uff_attuale` (
  `codice` int NOT NULL,
  `data_inizio` date NOT NULL,
  `sede` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codice`),
  KEY `ca-sede_idx` (`sede`),
  CONSTRAINT `sede_contr_op_uff` FOREIGN KEY (`sede`) REFERENCES `sede` (`indirizzo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratto_op_uff_attuale`
--

LOCK TABLES `contratto_op_uff_attuale` WRITE;
/*!40000 ALTER TABLE `contratto_op_uff_attuale` DISABLE KEYS */;
INSERT INTO `contratto_op_uff_attuale` VALUES (1,'2000-03-04','via don luigi sturzo'),(2,'2000-04-04','via don luigi sturzo'),(10,'2002-05-06','via campobello'),(11,'2004-07-06','via campobello'),(15,'2006-01-11','via campobello');
/*!40000 ALTER TABLE `contratto_op_uff_attuale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contratto_spia_scaduto`
--

DROP TABLE IF EXISTS `contratto_spia_scaduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contratto_spia_scaduto` (
  `codice` int NOT NULL,
  `n_distintivo` varchar(20) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date NOT NULL,
  `sede` varchar(45) NOT NULL,
  PRIMARY KEY (`codice`),
  UNIQUE KEY `n_distintivo_UNIQUE` (`n_distintivo`),
  KEY `sede_contr_spia_idx` (`sede`),
  CONSTRAINT `sede_contr_spia` FOREIGN KEY (`sede`) REFERENCES `sede` (`indirizzo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `spia_contr` FOREIGN KEY (`n_distintivo`) REFERENCES `spia` (`n_distintivo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contratto_spia_scaduto`
--

LOCK TABLES `contratto_spia_scaduto` WRITE;
/*!40000 ALTER TABLE `contratto_spia_scaduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratto_spia_scaduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `criminale`
--

DROP TABLE IF EXISTS `criminale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criminale` (
  `cf` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `soprannome` varchar(20) DEFAULT NULL,
  `data_nascita` date NOT NULL,
  `tipo` enum('latitante','condannato') NOT NULL,
  `data_latitanza` date DEFAULT NULL,
  `org_criminale` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cf`),
  KEY `crimorg_idx` (`org_criminale`),
  CONSTRAINT `organizzazione` FOREIGN KEY (`org_criminale`) REFERENCES `org_criminale` (`nome`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criminale`
--

LOCK TABLES `criminale` WRITE;
/*!40000 ALTER TABLE `criminale` DISABLE KEYS */;
INSERT INTO `criminale` VALUES ('cpp','cristian','paolo','cris','1998-08-09','condannato',NULL,'mafia'),('ggc','alessio','mari','ale','1990-01-01','condannato',NULL,'mafia'),('qqq','matteo','sesto','six','1984-04-07','latitante','2000-06-06','camorra'),('snt','luigi','primo','first','2000-01-01','condannato',NULL,'camorra'),('wsb','walter','sabatini','saba','1959-01-04','latitante','2004-09-09',NULL);
/*!40000 ALTER TABLE `criminale` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `criminale_BEFORE_INSERT` BEFORE INSERT ON `criminale` FOR EACH ROW BEGIN
IF (new.tipo = 'condannato') THEN
	IF (new.data_latitanza IS NOT NULL) THEN
		SET new.data_latitanza=NULL;
    END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `criminale_BEFORE_UPDATE` BEFORE UPDATE ON `criminale` FOR EACH ROW BEGIN
IF (new.tipo = 'condannato') THEN
	IF (new.data_latitanza IS NOT NULL) THEN
		SET new.data_latitanza=NULL;
    END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `criminali_indagini`
--

DROP TABLE IF EXISTS `criminali_indagini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `criminali_indagini` (
  `criminale` varchar(20) NOT NULL,
  `nome_in_codice` varchar(20) NOT NULL,
  PRIMARY KEY (`criminale`,`nome_in_codice`),
  KEY `nicindcrim_idx` (`nome_in_codice`),
  CONSTRAINT `crim_ind` FOREIGN KEY (`criminale`) REFERENCES `criminale` (`cf`) ON DELETE CASCADE,
  CONSTRAINT `nome_ind_crim` FOREIGN KEY (`nome_in_codice`) REFERENCES `indagine` (`nome_in_codice`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `criminali_indagini`
--

LOCK TABLES `criminali_indagini` WRITE;
/*!40000 ALTER TABLE `criminali_indagini` DISABLE KEYS */;
INSERT INTO `criminali_indagini` VALUES ('ggc','falco'),('wsb','grigio_antrace'),('ggc','iena'),('cpp','leone'),('ggc','lupo'),('wsb','omega'),('ggc','scialla_semper');
/*!40000 ALTER TABLE `criminali_indagini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detenzione`
--

DROP TABLE IF EXISTS `detenzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detenzione` (
  `criminale` varchar(20) NOT NULL,
  `carcere` varchar(20) NOT NULL,
  `durata_condanna` varchar(45) NOT NULL,
  PRIMARY KEY (`criminale`),
  KEY `nomecarcere_idx` (`carcere`),
  CONSTRAINT `cf_cond` FOREIGN KEY (`criminale`) REFERENCES `criminale` (`cf`) ON DELETE CASCADE,
  CONSTRAINT `nome_carcere` FOREIGN KEY (`carcere`) REFERENCES `penitenziario` (`nome`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detenzione`
--

LOCK TABLES `detenzione` WRITE;
/*!40000 ALTER TABLE `detenzione` DISABLE KEYS */;
INSERT INTO `detenzione` VALUES ('cpp','carcere2','ergastolo'),('ggc','regina coeli','ergastolo'),('snt','carcere1','ergastolo');
/*!40000 ALTER TABLE `detenzione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direttore`
--

DROP TABLE IF EXISTS `direttore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direttore` (
  `cf` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `data_nascita` date NOT NULL,
  `stipendio` int DEFAULT NULL,
  `anni_lavoro` int NOT NULL DEFAULT '13',
  `codice_contratto` int DEFAULT NULL,
  PRIMARY KEY (`cf`),
  UNIQUE KEY `codice_contratto_UNIQUE` (`codice_contratto`),
  CONSTRAINT `dir_contr` FOREIGN KEY (`codice_contratto`) REFERENCES `contratto_op_uff_attuale` (`codice`) ON DELETE SET NULL,
  CONSTRAINT `dir_stip` CHECK ((`stipendio` > 0)),
  CONSTRAINT `lav_dir_pos` CHECK ((`anni_lavoro` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direttore`
--

LOCK TABLES `direttore` WRITE;
/*!40000 ALTER TABLE `direttore` DISABLE KEYS */;
INSERT INTO `direttore` VALUES ('ggg','ale','sandro','2000-02-02',4000,15,NULL),('snk','davide','palma','2000-07-06',2000,13,NULL),('snt','paolo','volpe','1980-06-05',3000,15,15),('sss','simone','santoro','1999-04-06',10000,13,1);
/*!40000 ALTER TABLE `direttore` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `direttore_BEFORE_INSERT` BEFORE INSERT ON `direttore` FOR EACH ROW BEGIN
CALL controllo_stipendio_dir(new.stipendio);

IF new.codice_contratto IS NOT NULL THEN
  IF new.codice_contratto IN (SELECT operatore_logistico.codice_contratto
                              FROM operatore_logistico) THEN
    signal sqlstate '45000' set message_text = 'Il contratto è già associato ad un operatore_logistico';
  END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `direttore_BEFORE_UPDATE` BEFORE UPDATE ON `direttore` FOR EACH ROW BEGIN
CALL controllo_stipendio_dir(new.stipendio);
IF new.codice_contratto IS NOT NULL THEN
  IF new.codice_contratto IN (SELECT operatore_logistico.codice_contratto
                              FROM operatore_logistico) THEN
    signal sqlstate '45000' set message_text = 'Il contratto è già associato ad un operatore_logistico';
  END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `indagine`
--

DROP TABLE IF EXISTS `indagine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `indagine` (
  `nome_in_codice` varchar(20) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date DEFAULT NULL,
  PRIMARY KEY (`nome_in_codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indagine`
--

LOCK TABLES `indagine` WRITE;
/*!40000 ALTER TABLE `indagine` DISABLE KEYS */;
INSERT INTO `indagine` VALUES ('alfa','2009-04-04','2009-05-06'),('beta','2012-07-08','2012-08-07'),('falco','2015-05-05','2016-10-10'),('gamma','2005-07-05','2005-07-07'),('grigio_antrace','2020-08-08','2020-10-10'),('iena','2000-04-07','2000-08-08'),('leone','2013-08-09','2014-12-04'),('lupo','2014-06-09','2014-12-12'),('omega','2020-01-01','2020-05-05'),('rosso fuoco','2014-08-09','2014-07-09'),('scialla_semper','2017-03-02','2017-03-10'),('tigre','2017-09-01','2017-09-05'),('verde foglia','2001-01-01','2002-02-02');
/*!40000 ALTER TABLE `indagine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `istanza_settore`
--

DROP TABLE IF EXISTS `istanza_settore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `istanza_settore` (
  `sede` varchar(45) NOT NULL,
  `data_costruzione` date NOT NULL,
  `ambito` varchar(20) NOT NULL,
  PRIMARY KEY (`sede`,`data_costruzione`,`ambito`),
  KEY `is-ambito_idx` (`ambito`),
  CONSTRAINT `ambito_settore` FOREIGN KEY (`ambito`) REFERENCES `settore` (`ambito`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sede_settore` FOREIGN KEY (`sede`) REFERENCES `sede` (`indirizzo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `istanza_settore`
--

LOCK TABLES `istanza_settore` WRITE;
/*!40000 ALTER TABLE `istanza_settore` DISABLE KEYS */;
INSERT INTO `istanza_settore` VALUES ('via don luigi sturzo','2014-07-08','antimafia'),('via don luigi sturzo','2019-04-09','antimafia'),('via don luigi sturzo','2005-01-03','coordinamento'),('via don luigi sturzo','2008-09-06','coordinamento'),('via don luigi sturzo','2011-06-07','corruzione'),('via don luigi sturzo','2013-07-04','corruzione'),('via don luigi sturzo','2018-08-04','emergenze'),('via don luigi sturzo','2000-02-02','finanza'),('via don luigi sturzo','2004-07-01','indagini'),('via don luigi sturzo','2010-05-05','spionaggio');
/*!40000 ALTER TABLE `istanza_settore` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `istanza_settore_BEFORE_INSERT` BEFORE INSERT ON `istanza_settore` FOR EACH ROW BEGIN
call controllo_data_settore(new.sede,new.data_costruzione);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `istanza_settore_BEFORE_UPDATE` BEFORE UPDATE ON `istanza_settore` FOR EACH ROW BEGIN
call controllo_data_settore(new.sede,new.data_costruzione);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `numero_telefono_criminale`
--

DROP TABLE IF EXISTS `numero_telefono_criminale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numero_telefono_criminale` (
  `numero` varchar(20) NOT NULL,
  `cf` varchar(20) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `cfcrim_idx` (`cf`),
  CONSTRAINT `cf_crim` FOREIGN KEY (`cf`) REFERENCES `criminale` (`cf`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numero_telefono_criminale`
--

LOCK TABLES `numero_telefono_criminale` WRITE;
/*!40000 ALTER TABLE `numero_telefono_criminale` DISABLE KEYS */;
/*!40000 ALTER TABLE `numero_telefono_criminale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numero_telefono_direttore`
--

DROP TABLE IF EXISTS `numero_telefono_direttore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numero_telefono_direttore` (
  `numero` varchar(20) NOT NULL,
  `cf` varchar(45) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `cfdir_idx` (`cf`),
  CONSTRAINT `cf_dir` FOREIGN KEY (`cf`) REFERENCES `direttore` (`cf`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numero_telefono_direttore`
--

LOCK TABLES `numero_telefono_direttore` WRITE;
/*!40000 ALTER TABLE `numero_telefono_direttore` DISABLE KEYS */;
INSERT INTO `numero_telefono_direttore` VALUES ('3347829526','sss'),('3489970593','sss');
/*!40000 ALTER TABLE `numero_telefono_direttore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numero_telefono_op_logistico`
--

DROP TABLE IF EXISTS `numero_telefono_op_logistico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numero_telefono_op_logistico` (
  `numero` varchar(20) NOT NULL,
  `cf` varchar(20) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `cfoplog_idx` (`cf`),
  CONSTRAINT `cf_op_log` FOREIGN KEY (`cf`) REFERENCES `operatore_logistico` (`cf`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numero_telefono_op_logistico`
--

LOCK TABLES `numero_telefono_op_logistico` WRITE;
/*!40000 ALTER TABLE `numero_telefono_op_logistico` DISABLE KEYS */;
/*!40000 ALTER TABLE `numero_telefono_op_logistico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numero_telefono_sospettato`
--

DROP TABLE IF EXISTS `numero_telefono_sospettato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `numero_telefono_sospettato` (
  `numero` varchar(20) NOT NULL,
  `cf` varchar(20) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `cfsos_idx` (`cf`),
  CONSTRAINT `cf_sosp` FOREIGN KEY (`cf`) REFERENCES `sospettato` (`cf`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numero_telefono_sospettato`
--

LOCK TABLES `numero_telefono_sospettato` WRITE;
/*!40000 ALTER TABLE `numero_telefono_sospettato` DISABLE KEYS */;
/*!40000 ALTER TABLE `numero_telefono_sospettato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operatore_logistico`
--

DROP TABLE IF EXISTS `operatore_logistico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operatore_logistico` (
  `cf` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `data_nascita` date NOT NULL,
  `stipendio` int DEFAULT NULL,
  `anni_lavoro` int NOT NULL DEFAULT '0',
  `codice_contratto` int DEFAULT NULL,
  PRIMARY KEY (`cf`),
  UNIQUE KEY `codice_contratto_UNIQUE` (`codice_contratto`),
  CONSTRAINT `op_log_contr_att` FOREIGN KEY (`codice_contratto`) REFERENCES `contratto_op_uff_attuale` (`codice`) ON DELETE SET NULL,
  CONSTRAINT `lav_op_pos` CHECK ((`anni_lavoro` >= 0)),
  CONSTRAINT `op_stip` CHECK ((`stipendio` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operatore_logistico`
--

LOCK TABLES `operatore_logistico` WRITE;
/*!40000 ALTER TABLE `operatore_logistico` DISABLE KEYS */;
INSERT INTO `operatore_logistico` VALUES ('snt','davide','palma','1955-05-05',1600,11,2),('xxx','simone','boni','1980-07-06',1400,12,11),('yyy','alessio','santoro','1970-08-08',1500,11,10);
/*!40000 ALTER TABLE `operatore_logistico` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `operatore_logistico_BEFORE_INSERT` BEFORE INSERT ON `operatore_logistico` FOR EACH ROW BEGIN
CALL controllo_stipendio_op(new.stipendio);
IF new.codice_contratto IS NOT NULL THEN
  IF new.codice_contratto IN (SELECT direttore.codice_contratto
                              FROM direttore) THEN
    signal sqlstate '45000' set message_text = 'Il contratto è già associato ad un direttore';
	END IF;
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `operatore_logistico_BEFORE_UPDATE` BEFORE UPDATE ON `operatore_logistico` FOR EACH ROW BEGIN
IF new.anni_lavoro >= 13 THEN
	signal sqlstate '45000' set message_text = 'Dati gli anni di lavoro, l\'operatore che si vuole aggiornare è diventato un direttore, usa la procedura \'diventa_direttore(...)\'';
END IF;

CALL controllo_stipendio_op(new.stipendio);

IF new.codice_contratto IS NOT NULL THEN
  IF new.codice_contratto IN (SELECT direttore.codice_contratto
                              FROM direttore) THEN
    signal sqlstate '45000' set message_text = 'Il contratto è già associato ad un direttore';
	END IF;
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `operazione_spionaggio`
--

DROP TABLE IF EXISTS `operazione_spionaggio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operazione_spionaggio` (
  `codice` int NOT NULL,
  `data_inizio` date DEFAULT NULL,
  `data_fine` date DEFAULT NULL,
  `tipo` enum('controspionaggio','spionaggio esterno') NOT NULL,
  `stato` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operazione_spionaggio`
--

LOCK TABLES `operazione_spionaggio` WRITE;
/*!40000 ALTER TABLE `operazione_spionaggio` DISABLE KEYS */;
INSERT INTO `operazione_spionaggio` VALUES (1,'2000-01-01',NULL,'controspionaggio',NULL);
/*!40000 ALTER TABLE `operazione_spionaggio` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `operazione_spionaggio_BEFORE_INSERT` BEFORE INSERT ON `operazione_spionaggio` FOR EACH ROW BEGIN
IF (new.tipo = 'controspionaggio') THEN
	IF (new.stato IS NOT NULL) OR (new.data_fine IS NOT NULL) THEN
		SET new.stato=NULL;
		SET new.data_fine=NULL;
    END IF;
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `operazione_spionaggio_BEFORE_UPDATE` BEFORE UPDATE ON `operazione_spionaggio` FOR EACH ROW BEGIN
IF (new.tipo = 'controspionaggio') THEN
	IF (new.stato IS NOT NULL) OR (new.data_fine IS NOT NULL) THEN
		SET new.stato=NULL;
		SET new.data_fine=NULL;
    END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `org_criminale`
--

DROP TABLE IF EXISTS `org_criminale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `org_criminale` (
  `nome` varchar(20) NOT NULL,
  `comp_stimati` int NOT NULL,
  PRIMARY KEY (`nome`),
  CONSTRAINT `comp_org_crim` CHECK ((`comp_stimati` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_criminale`
--

LOCK TABLES `org_criminale` WRITE;
/*!40000 ALTER TABLE `org_criminale` DISABLE KEYS */;
INSERT INTO `org_criminale` VALUES ('camorra',300),('clan casamonica',150),('cosa nostra',250),('mafia',500);
/*!40000 ALTER TABLE `org_criminale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penitenziario`
--

DROP TABLE IF EXISTS `penitenziario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penitenziario` (
  `nome` varchar(20) NOT NULL,
  `data_costruzione` date DEFAULT NULL,
  `n_detenuti` int DEFAULT NULL,
  `città` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nome`),
  KEY `città_carcere_idx` (`città`),
  CONSTRAINT `città_carcere` FOREIGN KEY (`città`) REFERENCES `citta` (`nome`) ON DELETE CASCADE,
  CONSTRAINT `pen_det` CHECK ((`n_detenuti` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penitenziario`
--

LOCK TABLES `penitenziario` WRITE;
/*!40000 ALTER TABLE `penitenziario` DISABLE KEYS */;
INSERT INTO `penitenziario` VALUES ('carcere1',NULL,1000,'pomezia'),('carcere2','2000-01-01',1500,'ostia'),('regina coeli',NULL,2000,'roma');
/*!40000 ALTER TABLE `penitenziario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reati_indagini`
--

DROP TABLE IF EXISTS `reati_indagini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reati_indagini` (
  `reato` int NOT NULL,
  `nome_in_codice` varchar(20) NOT NULL,
  PRIMARY KEY (`reato`,`nome_in_codice`),
  KEY `reatoind_idx` (`nome_in_codice`),
  CONSTRAINT `cod_reato` FOREIGN KEY (`reato`) REFERENCES `reato` (`codice`) ON DELETE CASCADE,
  CONSTRAINT `reato_ind` FOREIGN KEY (`nome_in_codice`) REFERENCES `indagine` (`nome_in_codice`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reati_indagini`
--

LOCK TABLES `reati_indagini` WRITE;
/*!40000 ALTER TABLE `reati_indagini` DISABLE KEYS */;
INSERT INTO `reati_indagini` VALUES (3,'alfa'),(3,'beta'),(1,'falco'),(3,'gamma'),(2,'iena'),(4,'lupo'),(3,'rosso fuoco'),(3,'scialla_semper'),(3,'verde foglia');
/*!40000 ALTER TABLE `reati_indagini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reato`
--

DROP TABLE IF EXISTS `reato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reato` (
  `codice` int NOT NULL,
  `descrizione` varchar(45) NOT NULL,
  PRIMARY KEY (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reato`
--

LOCK TABLES `reato` WRITE;
/*!40000 ALTER TABLE `reato` DISABLE KEYS */;
INSERT INTO `reato` VALUES (1,'omicidio'),(2,'rapina'),(3,'stupro'),(4,'estorsione');
/*!40000 ALTER TABLE `reato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riconoscimento_agente`
--

DROP TABLE IF EXISTS `riconoscimento_agente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riconoscimento_agente` (
  `agente` varchar(20) NOT NULL,
  `titolo` varchar(20) NOT NULL,
  PRIMARY KEY (`agente`,`titolo`),
  CONSTRAINT `ric_agente` FOREIGN KEY (`agente`) REFERENCES `agente` (`n_distintivo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riconoscimento_agente`
--

LOCK TABLES `riconoscimento_agente` WRITE;
/*!40000 ALTER TABLE `riconoscimento_agente` DISABLE KEYS */;
/*!40000 ALTER TABLE `riconoscimento_agente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riconoscimento_spia`
--

DROP TABLE IF EXISTS `riconoscimento_spia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riconoscimento_spia` (
  `spia` varchar(20) NOT NULL,
  `titolo` varchar(20) NOT NULL,
  PRIMARY KEY (`spia`,`titolo`),
  CONSTRAINT `ric_spia` FOREIGN KEY (`spia`) REFERENCES `spia` (`n_distintivo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riconoscimento_spia`
--

LOCK TABLES `riconoscimento_spia` WRITE;
/*!40000 ALTER TABLE `riconoscimento_spia` DISABLE KEYS */;
/*!40000 ALTER TABLE `riconoscimento_spia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede`
--

DROP TABLE IF EXISTS `sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede` (
  `indirizzo` varchar(45) NOT NULL,
  `città` varchar(45) DEFAULT NULL,
  `data_fondazione` date NOT NULL,
  `direttore` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`indirizzo`),
  KEY `dirsede_idx` (`direttore`),
  KEY `cittàsede_idx` (`città`),
  CONSTRAINT `città_sede` FOREIGN KEY (`città`) REFERENCES `citta` (`nome`) ON DELETE CASCADE,
  CONSTRAINT `dir_sede` FOREIGN KEY (`direttore`) REFERENCES `direttore` (`cf`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede`
--

LOCK TABLES `sede` WRITE;
/*!40000 ALTER TABLE `sede` DISABLE KEYS */;
INSERT INTO `sede` VALUES ('via campobello','roma','2000-05-07',NULL),('via del mare','roma','2000-03-03',NULL),('via don luigi sturzo','roma','2000-01-01','sss');
/*!40000 ALTER TABLE `sede` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sede_BEFORE_INSERT` BEFORE INSERT ON `sede` FOR EACH ROW BEGIN
IF new.direttore IS NOT NULL THEN
	CALL controllo_direttore(new.indirizzo,new.direttore);
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `sede_BEFORE_UPDATE` BEFORE UPDATE ON `sede` FOR EACH ROW BEGIN
IF new.direttore IS NOT NULL THEN
	CALL controllo_direttore(new.indirizzo,new.direttore);
END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `settore`
--

DROP TABLE IF EXISTS `settore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settore` (
  `ambito` varchar(20) NOT NULL,
  `finanziamento` int NOT NULL,
  PRIMARY KEY (`ambito`),
  CONSTRAINT `settore_fin` CHECK ((`finanziamento` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settore`
--

LOCK TABLES `settore` WRITE;
/*!40000 ALTER TABLE `settore` DISABLE KEYS */;
INSERT INTO `settore` VALUES ('antimafia',50000),('coordinamento',1900),('corruzione',25000),('emergenze',50000),('finanza',10000),('indagini',10000),('spionaggio',20000);
/*!40000 ALTER TABLE `settore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sospettati_indagini`
--

DROP TABLE IF EXISTS `sospettati_indagini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sospettati_indagini` (
  `cf` varchar(20) NOT NULL,
  `nome_in_codice` varchar(20) NOT NULL,
  PRIMARY KEY (`cf`,`nome_in_codice`),
  KEY `nome_ind_idx` (`nome_in_codice`),
  CONSTRAINT `nome_ind_sos` FOREIGN KEY (`nome_in_codice`) REFERENCES `indagine` (`nome_in_codice`) ON DELETE CASCADE,
  CONSTRAINT `sosp_ind` FOREIGN KEY (`cf`) REFERENCES `sospettato` (`cf`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sospettati_indagini`
--

LOCK TABLES `sospettati_indagini` WRITE;
/*!40000 ALTER TABLE `sospettati_indagini` DISABLE KEYS */;
INSERT INTO `sospettati_indagini` VALUES ('mbt','falco'),('jsc','grigio_antrace'),('mbt','omega'),('jsc','scialla_semper'),('jsc','tigre'),('mbt','tigre');
/*!40000 ALTER TABLE `sospettati_indagini` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sospettato`
--

DROP TABLE IF EXISTS `sospettato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sospettato` (
  `cf` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `data_nascita` date NOT NULL,
  PRIMARY KEY (`cf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sospettato`
--

LOCK TABLES `sospettato` WRITE;
/*!40000 ALTER TABLE `sospettato` DISABLE KEYS */;
INSERT INTO `sospettato` VALUES ('jsc','joe','scacchi','1996-04-01'),('mbt','mario','tellibalo','1986-05-09'),('mcb','matteo','colomba','1990-04-02'),('mgr','margherita','rossi','1994-10-07');
/*!40000 ALTER TABLE `sospettato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spia`
--

DROP TABLE IF EXISTS `spia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spia` (
  `n_distintivo` varchar(20) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `nome_in_codice` varchar(20) DEFAULT NULL,
  `data_nascita` date NOT NULL,
  `n_cercapersone` varchar(20) NOT NULL,
  `codice_contratto` int DEFAULT NULL,
  PRIMARY KEY (`n_distintivo`),
  UNIQUE KEY `codice_contratto_UNIQUE` (`codice_contratto`),
  CONSTRAINT `spia_contr_att` FOREIGN KEY (`codice_contratto`) REFERENCES `contratto_op_campo_attuale` (`codice`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spia`
--

LOCK TABLES `spia` WRITE;
/*!40000 ALTER TABLE `spia` DISABLE KEYS */;
INSERT INTO `spia` VALUES ('111','francesco','magnani','frank','1998-05-06','123',2);
/*!40000 ALTER TABLE `spia` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `spia_BEFORE_INSERT` BEFORE INSERT ON `spia` FOR EACH ROW BEGIN
IF new.codice_contratto IS NOT NULL THEN
  IF new.codice_contratto IN (SELECT agente.codice_contratto
                              FROM agente) THEN
    signal sqlstate '45000' set message_text = 'Il contratto è già associato ad un agente';
  END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `spia_BEFORE_UPDATE` BEFORE UPDATE ON `spia` FOR EACH ROW BEGIN
IF new.codice_contratto IS NOT NULL THEN
  IF new.codice_contratto IN (SELECT agente.codice_contratto
                              FROM agente) THEN
    signal sqlstate '45000' set message_text = 'Il contratto è già associato ad un agente';
  END IF;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `spia_scoperta`
--

DROP TABLE IF EXISTS `spia_scoperta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spia_scoperta` (
  `codice` int NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `stato` varchar(45) NOT NULL,
  PRIMARY KEY (`codice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spia_scoperta`
--

LOCK TABLES `spia_scoperta` WRITE;
/*!40000 ALTER TABLE `spia_scoperta` DISABLE KEYS */;
INSERT INTO `spia_scoperta` VALUES (1,'dimitri','toljan','bulgaria'),(44,'alex','sando','svizzera');
/*!40000 ALTER TABLE `spia_scoperta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spionaggio`
--

DROP TABLE IF EXISTS `spionaggio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spionaggio` (
  `n_distintivo` varchar(20) NOT NULL,
  `codice` int NOT NULL,
  PRIMARY KEY (`n_distintivo`,`codice`),
  KEY `codice_missione_idx` (`codice`),
  CONSTRAINT `codice_missione` FOREIGN KEY (`codice`) REFERENCES `operazione_spionaggio` (`codice`) ON DELETE CASCADE,
  CONSTRAINT `spia_missione` FOREIGN KEY (`n_distintivo`) REFERENCES `spia` (`n_distintivo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spionaggio`
--

LOCK TABLES `spionaggio` WRITE;
/*!40000 ALTER TABLE `spionaggio` DISABLE KEYS */;
INSERT INTO `spionaggio` VALUES ('111',1);
/*!40000 ALTER TABLE `spionaggio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_op_11`
--

DROP TABLE IF EXISTS `view_op_11`;
/*!50001 DROP VIEW IF EXISTS `view_op_11`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_op_11` AS SELECT 
 1 AS `città`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_op_13`
--

DROP TABLE IF EXISTS `view_op_13`;
/*!50001 DROP VIEW IF EXISTS `view_op_13`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_op_13` AS SELECT 
 1 AS `org_criminale`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_op_15`
--

DROP TABLE IF EXISTS `view_op_15`;
/*!50001 DROP VIEW IF EXISTS `view_op_15`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_op_15` AS SELECT 
 1 AS `cf`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_op_16`
--

DROP TABLE IF EXISTS `view_op_16`;
/*!50001 DROP VIEW IF EXISTS `view_op_16`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_op_16` AS SELECT 
 1 AS `sede`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_op_17`
--

DROP TABLE IF EXISTS `view_op_17`;
/*!50001 DROP VIEW IF EXISTS `view_op_17`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_op_17` AS SELECT 
 1 AS `org1`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_op_3`
--

DROP TABLE IF EXISTS `view_op_3`;
/*!50001 DROP VIEW IF EXISTS `view_op_3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_op_3` AS SELECT 
 1 AS `ambito`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_op_6`
--

DROP TABLE IF EXISTS `view_op_6`;
/*!50001 DROP VIEW IF EXISTS `view_op_6`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_op_6` AS SELECT 
 1 AS `criminale`,
 1 AS `nome_in_codice`,
 1 AS `reato`,
 1 AS `nome_indagine`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_op_8`
--

DROP TABLE IF EXISTS `view_op_8`;
/*!50001 DROP VIEW IF EXISTS `view_op_8`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_op_8` AS SELECT 
 1 AS `nome_in_codice`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'sin'
--

--
-- Dumping routines for database 'sin'
--
/*!50003 DROP PROCEDURE IF EXISTS `controllo_conflitto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `controllo_conflitto`(org1 VARCHAR(20), org2 VARCHAR(20))
BEGIN
	IF org1 = org2 THEN signal sqlstate '45000' set message_text = 'Un\'organizzazione criminale non può essere in conflitto con se stessa';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `controllo_data_settore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `controllo_data_settore`(nome_sede VARCHAR(45), data_costruzione DATE)
BEGIN
IF (SELECT data_fondazione
    FROM sede
    WHERE indirizzo=nome_sede) > data_costruzione THEN
    signal sqlstate '45000' set message_text = 'La data di costruzione del settore non può essere maggiore della data di fondazione della sede';
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `controllo_direttore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `controllo_direttore`(sede_dirig VARCHAR(45), dirett_dirig VARCHAR(20))
BEGIN
IF (SELECT codice_contratto
    FROM direttore
    WHERE direttore.cf = dirett_dirig) IS NULL THEN
    signal sqlstate '45000' set message_text = 'Un direttore può dirigere solo la sede in cui lavora';
END IF;
IF (SELECT sede
    FROM contratto_op_uff_attuale
    WHERE contratto_op_uff_attuale.codice = (SELECT codice_contratto
                                              			FROM direttore
                                              			WHERE direttore.cf = dirett_dirig)) <> sede_dirig THEN
	signal sqlstate '45000' set message_text = 'Un direttore può dirigere solo la sede in cui lavora';
END IF;
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `controllo_stipendio_dir` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `controllo_stipendio_dir`(stip INT)
BEGIN
  IF (SELECT MAX(stipendio)
      FROM operatore_logistico) > stip
  THEN signal sqlstate '45000' set message_text = 'Lo stipendio di un direttore deve essere maggiore di quello di ogni operatore logistico';
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `controllo_stipendio_op` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `controllo_stipendio_op`(stip INT)
BEGIN
  IF (SELECT MIN(stipendio)
      FROM direttore) < stip
  THEN signal sqlstate '45000' set message_text = 'Lo stipendio di un operatore logistico deve essere inferiore di quello di ogni direttore';
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `diventa_direttore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `diventa_direttore`(cf VARCHAR(20), nome VARCHAR(20), cognome VARCHAR(20), data_nascita DATE, stipendio INT, anni_lavoro INT, codice_contratto INT)
BEGIN
INSERT INTO direttore VALUES(cf, nome, cognome, data_nascita, stipendio, anni_lavoro, codice_contratto);
DELETE FROM operatore_logistico WHERE operatore_logistico.cf=cf;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `operazione1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `operazione1`(nome_op VARCHAR(20), distintivo VARCHAR(20))
BEGIN
INSERT INTO comp_indagini VALUES(distintivo, nome_op);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `operazione10` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `operazione10`(data_input DATE)
BEGIN
SELECT *
FROM reato
WHERE codice IN (SELECT reati_indagini.reato
				 FROM indagine JOIN reati_indagini ON indagine.nome_in_codice = reati_indagini.nome_in_codice
				 WHERE indagine.data_inizio >= data_input
				 GROUP BY reati_indagini.reato
				 HAVING COUNT(*) > 4);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `operazione12` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `operazione12`(agente_input VARCHAR(20))
BEGIN
SELECT agente.n_distintivo, agente.nome, agente.cognome, agente.nome_in_codice, agente.data_nascita, agente.n_cercapersone, agente.codice_contratto, indagine.nome_in_codice, indagine.data_inizio
FROM (agente JOIN comp_indagini ON agente.n_distintivo=comp_indagini.numero_distintivo) JOIN indagine ON comp_indagini.nome_in_codice=indagine.nome_in_codice
WHERE agente.n_distintivo = agente_input AND indagine.data_fine IS NULL;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `operazione2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `operazione2`(distintivo VARCHAR(20), codice INT)
BEGIN
INSERT INTO spionaggio VALUES(distintivo,codice);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `operazione4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `operazione4`(spia_input VARCHAR(20))
BEGIN
SELECT *
FROM spia, operazione_spionaggio
WHERE (spia.n_distintivo,operazione_spionaggio.codice) IN (
				SELECT *
				FROM(spionaggio) 
				WHERE (n_distintivo = spia_input));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `operazione5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `operazione5`(prov_input VARCHAR(45))
BEGIN
SELECT SUM(n_detenuti)
FROM penitenziario 
WHERE penitenziario.città IN (SELECT nome
							  FROM citta
							  WHERE provincia=prov_input);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `operazione9` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `operazione9`(stato_input VARCHAR(45))
BEGIN
SELECT codice_operazione
FROM bloccaggio JOIN spia_scoperta ON codice_spia = codice
WHERE stato = stato_input;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_op_11`
--

/*!50001 DROP VIEW IF EXISTS `view_op_11`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_op_11` (`città`) AS select `sede2`.`città` AS `città` from `sede` `sede2` group by `sede2`.`città` having (count(0) > 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_op_13`
--

/*!50001 DROP VIEW IF EXISTS `view_op_13`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_op_13` (`org_criminale`) AS select `criminale`.`org_criminale` AS `org_criminale` from `criminale` where (`criminale`.`tipo` = 'latitante') */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_op_15`
--

/*!50001 DROP VIEW IF EXISTS `view_op_15`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_op_15` (`cf`) AS select `sospettati_indagini`.`cf` AS `cf` from (`sospettati_indagini` join `indagine` on((`sospettati_indagini`.`nome_in_codice` = `indagine`.`nome_in_codice`))) where (year(`indagine`.`data_inizio`) >= (year(curdate()) - 5)) group by `sospettati_indagini`.`cf` having (count(0) > 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_op_16`
--

/*!50001 DROP VIEW IF EXISTS `view_op_16`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_op_16` (`sede`) AS select `istanza_settore`.`sede` AS `sede` from `istanza_settore` group by `istanza_settore`.`sede` having (count(0) > 9) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_op_17`
--

/*!50001 DROP VIEW IF EXISTS `view_op_17`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_op_17` (`org1`) AS select `conflitto_territoriale`.`org1` AS `org1` from `conflitto_territoriale` union select `conflitto_territoriale`.`org2` AS `org2` from `conflitto_territoriale` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_op_3`
--

/*!50001 DROP VIEW IF EXISTS `view_op_3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_op_3` (`ambito`) AS select `istanza_settore`.`ambito` AS `ambito` from `istanza_settore` where (`istanza_settore`.`data_costruzione` < '2010-01-01') */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_op_6`
--

/*!50001 DROP VIEW IF EXISTS `view_op_6`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_op_6` (`criminale`,`nome_in_codice`,`reato`,`nome_indagine`) AS select `criminali_indagini`.`criminale` AS `criminale`,`criminali_indagini`.`nome_in_codice` AS `nome_in_codice`,`reati_indagini`.`reato` AS `reato`,`reati_indagini`.`nome_in_codice` AS `nome_in_codice` from (`criminali_indagini` join `reati_indagini` on((`criminali_indagini`.`nome_in_codice` = `reati_indagini`.`nome_in_codice`))) */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_op_8`
--

/*!50001 DROP VIEW IF EXISTS `view_op_8`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_op_8` (`nome_in_codice`) AS select `indagine`.`nome_in_codice` AS `nome_in_codice` from (((`indagine` join `criminali_indagini` on((`indagine`.`nome_in_codice` = `criminali_indagini`.`nome_in_codice`))) join `criminale` on((`criminali_indagini`.`criminale` = `criminale`.`cf`))) join `detenzione` on((`criminale`.`cf` = `detenzione`.`criminale`))) where ((`indagine`.`data_fine` is not null) and (`detenzione`.`durata_condanna` = 'ergastolo') and (`criminale`.`org_criminale` is not null)) */
/*!50002 WITH CASCADED CHECK OPTION */;
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

-- Dump completed on 2020-06-25 19:37:07
