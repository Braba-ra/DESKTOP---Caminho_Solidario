CREATE DATABASE  IF NOT EXISTS `caminho_solidario` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `caminho_solidario`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: caminho_solidario
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `adm`
--

DROP TABLE IF EXISTS `adm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adm` (
  `idAdm` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `senha_adm` varchar(45) NOT NULL,
  `idPessoa` int DEFAULT NULL,
  PRIMARY KEY (`idAdm`),
  KEY `idPessoa` (`idPessoa`),
  CONSTRAINT `adm_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm`
--

LOCK TABLES `adm` WRITE;
/*!40000 ALTER TABLE `adm` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficiario`
--

DROP TABLE IF EXISTS `beneficiario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficiario` (
  `idBeneficiario` int NOT NULL AUTO_INCREMENT,
  `data_nascimento_beneficiario` date NOT NULL,
  `estado_civil` char(15) NOT NULL,
  `renda_familiar` float DEFAULT NULL,
  `dependente` varchar(45) DEFAULT NULL,
  `idPessoa` int DEFAULT NULL,
  `idFilho_Dependente` int DEFAULT NULL,
  `idEndereco` int DEFAULT NULL,
  `idBeneficioGov` int DEFAULT NULL,
  PRIMARY KEY (`idBeneficiario`),
  KEY `idPessoa` (`idPessoa`),
  KEY `idFilho_Dependente` (`idFilho_Dependente`),
  KEY `idEndereco` (`idEndereco`),
  KEY `idBeneficioGov` (`idBeneficioGov`),
  CONSTRAINT `beneficiario_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`idPessoa`),
  CONSTRAINT `beneficiario_ibfk_2` FOREIGN KEY (`idFilho_Dependente`) REFERENCES `filho_dependente` (`idFilho_Dependente`),
  CONSTRAINT `beneficiario_ibfk_3` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`),
  CONSTRAINT `beneficiario_ibfk_4` FOREIGN KEY (`idBeneficioGov`) REFERENCES `beneficiogov` (`idBeneficioGov`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiario`
--

LOCK TABLES `beneficiario` WRITE;
/*!40000 ALTER TABLE `beneficiario` DISABLE KEYS */;
INSERT INTO `beneficiario` VALUES (1,'1991-04-16','CASADO (A)',1000,'SIM ',10,8,NULL,NULL),(2,'2005-07-10','SOLTEIRO (A)',1000,'SIM ',11,9,NULL,NULL);
/*!40000 ALTER TABLE `beneficiario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficio`
--

DROP TABLE IF EXISTS `beneficio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficio` (
  `idBeneficio` int NOT NULL AUTO_INCREMENT,
  `data_cadastro` date NOT NULL,
  `data_entrada` date DEFAULT NULL,
  `data_saida` date DEFAULT NULL,
  `prorrogacao` varchar(45) DEFAULT NULL,
  `duracao` varchar(45) DEFAULT NULL,
  `situacao_beneficio` char(10) NOT NULL,
  `idPessoa` int DEFAULT NULL,
  `idBeneficiario` int DEFAULT NULL,
  PRIMARY KEY (`idBeneficio`),
  KEY `fk_beneficio_beneficiario` (`idPessoa`),
  CONSTRAINT `beneficio_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `beneficiario` (`idBeneficiario`),
  CONSTRAINT `fk_beneficio_beneficiario` FOREIGN KEY (`idPessoa`) REFERENCES `beneficiario` (`idBeneficiario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficio`
--

LOCK TABLES `beneficio` WRITE;
/*!40000 ALTER TABLE `beneficio` DISABLE KEYS */;
INSERT INTO `beneficio` VALUES (1,'2025-07-17','2025-07-17','2026-01-17','','6 meses','Ativo',NULL,NULL),(2,'2025-07-17','2025-07-17','2026-07-17','','6 meses','Ativo',NULL,NULL),(3,'2025-07-17','2025-07-17','2026-07-17','','6 meses','Ativo',NULL,NULL),(6,'2025-07-17','2025-07-17','2026-01-17','','6 meses','Ativo',NULL,2);
/*!40000 ALTER TABLE `beneficio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beneficiogov`
--

DROP TABLE IF EXISTS `beneficiogov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beneficiogov` (
  `idBeneficioGov` int NOT NULL AUTO_INCREMENT,
  `POSSUI_BENEFICIO` char(4) NOT NULL,
  `NOME_BENEFICIO_GOV` varchar(20) DEFAULT NULL,
  `VALOR_BENEFICIO` float DEFAULT NULL,
  `OUTROS` varchar(45) DEFAULT NULL,
  `idPessoa` int DEFAULT NULL,
  PRIMARY KEY (`idBeneficioGov`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiogov`
--

LOCK TABLES `beneficiogov` WRITE;
/*!40000 ALTER TABLE `beneficiogov` DISABLE KEYS */;
/*!40000 ALTER TABLE `beneficiogov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `idEndereco` int NOT NULL AUTO_INCREMENT,
  `endereco` varchar(50) NOT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `situacao_moradia` varchar(20) NOT NULL,
  `valor_aluguel` float DEFAULT NULL,
  PRIMARY KEY (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (1,'Rua das Acácias','Primavera','Belo Horizonte','123456788','ALUGUEL',700);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_voluntario`
--

DROP TABLE IF EXISTS `endereco_voluntario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_voluntario` (
  `id_enderecoV` int NOT NULL AUTO_INCREMENT,
  `cep` varchar(9) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `bairro` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_enderecoV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_voluntario`
--

LOCK TABLES `endereco_voluntario` WRITE;
/*!40000 ALTER TABLE `endereco_voluntario` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco_voluntario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `espera_voluntario`
--

DROP TABLE IF EXISTS `espera_voluntario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `espera_voluntario` (
  `id_esperaVol` int NOT NULL AUTO_INCREMENT,
  `cpf` varchar(12) NOT NULL,
  `nome_completo` varchar(60) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefone` varchar(12) NOT NULL,
  `data_pedido` date DEFAULT NULL,
  PRIMARY KEY (`id_esperaVol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `espera_voluntario`
--

LOCK TABLES `espera_voluntario` WRITE;
/*!40000 ALTER TABLE `espera_voluntario` DISABLE KEYS */;
/*!40000 ALTER TABLE `espera_voluntario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filho_dependente`
--

DROP TABLE IF EXISTS `filho_dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filho_dependente` (
  `idFilho_Dependente` int NOT NULL AUTO_INCREMENT,
  `nome_filho_dependente` varchar(50) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `parentesco` varchar(10) DEFAULT NULL,
  `pcd` varchar(5) DEFAULT NULL,
  `idEndereco` int DEFAULT NULL,
  `idBeneficiario` int DEFAULT NULL,
  PRIMARY KEY (`idFilho_Dependente`),
  KEY `idEndereco` (`idEndereco`),
  CONSTRAINT `filho_dependente_ibfk_1` FOREIGN KEY (`idEndereco`) REFERENCES `endereco` (`idEndereco`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filho_dependente`
--

LOCK TABLES `filho_dependente` WRITE;
/*!40000 ALTER TABLE `filho_dependente` DISABLE KEYS */;
INSERT INTO `filho_dependente` VALUES (1,'cachorrinhos',NULL,NULL,NULL,NULL,NULL),(2,'fsdfsadf',NULL,NULL,NULL,NULL,NULL),(3,'Flamengo',NULL,NULL,NULL,NULL,NULL),(4,'Ayron Martins',NULL,NULL,NULL,NULL,NULL),(5,'Golden Retriever',NULL,NULL,NULL,NULL,NULL),(6,'Flamengo',NULL,NULL,NULL,NULL,NULL),(7,'aasasa',NULL,NULL,NULL,NULL,NULL),(8,'Golden Retriever',NULL,NULL,NULL,NULL,NULL),(9,'Flamengo',NULL,NULL,NULL,NULL,NULL),(10,'Flamengo','2016-12-13','Filho','NÃO',NULL,2),(11,'asas',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `filho_dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `filho_dependente_beneficiario`
--

DROP TABLE IF EXISTS `filho_dependente_beneficiario`;
/*!50001 DROP VIEW IF EXISTS `filho_dependente_beneficiario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `filho_dependente_beneficiario` AS SELECT 
 1 AS `ID`,
 1 AS `NOME`,
 1 AS `DATA_NASCIMENTO`,
 1 AS `BENEFICIARIO`,
 1 AS `PARENTESCO`,
 1 AS `PCD`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `frequencia`
--

DROP TABLE IF EXISTS `frequencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `frequencia` (
  `idFrequencia` int NOT NULL AUTO_INCREMENT,
  `CPF` char(15) DEFAULT NULL,
  `ANO` char(5) DEFAULT NULL,
  `MES` varchar(15) DEFAULT NULL,
  `REGISTRO` char(1) DEFAULT NULL,
  `idPessoa` int DEFAULT NULL,
  PRIMARY KEY (`idFrequencia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `frequencia`
--

LOCK TABLES `frequencia` WRITE;
/*!40000 ALTER TABLE `frequencia` DISABLE KEYS */;
INSERT INTO `frequencia` VALUES (1,'12345678900','2025','JULHO  ','F',NULL);
/*!40000 ALTER TABLE `frequencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `situacao` char(1) NOT NULL,
  `idPessoa` int DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `idPessoa` (`idPessoa`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'12345678900','C4CA4238A0B923820DCC509A6F75849B','V',1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `idPessoa` int NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`idPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Bárbara Letícia','12345678900','61986520624','barbara@gmail.com'),(7,'Daiana Ribeiro','00987654321','61986785432','daianaRibeiro@gmail.com'),(8,'Lucas Martins','00000000001','61985678432','flamengo@flamengo.com'),(10,'Daiana Ribeiro','09876543211','61986547832','daianaRibeiro@gmail.com'),(11,'Lucas Ataíde','87678543234','61986453821','flamenguista@flamengo.com');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pessoa_login_vw`
--

DROP TABLE IF EXISTS `pessoa_login_vw`;
/*!50001 DROP VIEW IF EXISTS `pessoa_login_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pessoa_login_vw` AS SELECT 
 1 AS `ID`,
 1 AS `nome_completo`,
 1 AS `cpf`,
 1 AS `telefone`,
 1 AS `email`,
 1 AS `situacao`,
 1 AS `senha`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `relatorio`
--

DROP TABLE IF EXISTS `relatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relatorio` (
  `idRelatorio` int NOT NULL AUTO_INCREMENT,
  `registro` char(1) DEFAULT NULL,
  `mes` varchar(45) DEFAULT NULL,
  `idFrequencia` int DEFAULT NULL,
  PRIMARY KEY (`idRelatorio`),
  KEY `idFrequencia` (`idFrequencia`),
  CONSTRAINT `relatorio_ibfk_1` FOREIGN KEY (`idFrequencia`) REFERENCES `frequencia` (`idFrequencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relatorio`
--

LOCK TABLES `relatorio` WRITE;
/*!40000 ALTER TABLE `relatorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `relatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tbvoluntario`
--

DROP TABLE IF EXISTS `tbvoluntario`;
/*!50001 DROP VIEW IF EXISTS `tbvoluntario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tbvoluntario` AS SELECT 
 1 AS `ID`,
 1 AS `voluntario`,
 1 AS `email`,
 1 AS `senha`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `voluntario`
--

DROP TABLE IF EXISTS `voluntario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voluntario` (
  `idVoluntarios` int NOT NULL AUTO_INCREMENT,
  `email_voluntario` varchar(50) NOT NULL,
  `senha_voluntario` varchar(50) NOT NULL,
  `idPessoa` int DEFAULT NULL,
  PRIMARY KEY (`idVoluntarios`),
  KEY `idPessoa` (`idPessoa`),
  CONSTRAINT `voluntario_ibfk_1` FOREIGN KEY (`idPessoa`) REFERENCES `pessoa` (`idPessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voluntario`
--

LOCK TABLES `voluntario` WRITE;
/*!40000 ALTER TABLE `voluntario` DISABLE KEYS */;
/*!40000 ALTER TABLE `voluntario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_beneficio_pessoa`
--

DROP TABLE IF EXISTS `vw_beneficio_pessoa`;
/*!50001 DROP VIEW IF EXISTS `vw_beneficio_pessoa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_beneficio_pessoa` AS SELECT 
 1 AS `ID`,
 1 AS `nome_completo`,
 1 AS `data_cadastro`,
 1 AS `data_entrada`,
 1 AS `data_saida`,
 1 AS `prorrogacao`,
 1 AS `duracao`,
 1 AS `situacao_beneficio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_beneficiogov_pessoa`
--

DROP TABLE IF EXISTS `vw_beneficiogov_pessoa`;
/*!50001 DROP VIEW IF EXISTS `vw_beneficiogov_pessoa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_beneficiogov_pessoa` AS SELECT 
 1 AS `id`,
 1 AS `nome`,
 1 AS `cpf`,
 1 AS `possui_beneficio`,
 1 AS `nome_beneficio_gov`,
 1 AS `valor_beneficio`,
 1 AS `outros`,
 1 AS `idPessoa`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_pessoa_beneficiario`
--

DROP TABLE IF EXISTS `vw_pessoa_beneficiario`;
/*!50001 DROP VIEW IF EXISTS `vw_pessoa_beneficiario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pessoa_beneficiario` AS SELECT 
 1 AS `idBeneficiario`,
 1 AS `nome_completo`,
 1 AS `cpf`,
 1 AS `data_nascimento_beneficiario`,
 1 AS `estado_civil`,
 1 AS `telefone`,
 1 AS `email`,
 1 AS `renda_familiar`,
 1 AS `dependente`,
 1 AS `nome_filho_dependente`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'caminho_solidario'
--

--
-- Dumping routines for database 'caminho_solidario'
--

--
-- Final view structure for view `filho_dependente_beneficiario`
--

/*!50001 DROP VIEW IF EXISTS `filho_dependente_beneficiario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `filho_dependente_beneficiario` AS select `fd`.`idFilho_Dependente` AS `ID`,`fd`.`nome_filho_dependente` AS `NOME`,`fd`.`data_nascimento` AS `DATA_NASCIMENTO`,`p`.`nome_completo` AS `BENEFICIARIO`,`fd`.`parentesco` AS `PARENTESCO`,`fd`.`pcd` AS `PCD` from ((`filho_dependente` `fd` join `beneficiario` `b` on((`fd`.`idBeneficiario` = `b`.`idBeneficiario`))) join `pessoa` `p` on((`p`.`idPessoa` = `b`.`idPessoa`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pessoa_login_vw`
--

/*!50001 DROP VIEW IF EXISTS `pessoa_login_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pessoa_login_vw` AS select `p`.`idPessoa` AS `ID`,`p`.`nome_completo` AS `nome_completo`,`p`.`cpf` AS `cpf`,`p`.`telefone` AS `telefone`,`p`.`email` AS `email`,`l`.`situacao` AS `situacao`,`l`.`senha` AS `senha` from (`pessoa` `p` join `login` `l` on((`p`.`cpf` = `l`.`cpf`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tbvoluntario`
--

/*!50001 DROP VIEW IF EXISTS `tbvoluntario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`barbara`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `tbvoluntario` AS select `v`.`idVoluntarios` AS `ID`,`p`.`nome_completo` AS `voluntario`,`v`.`email_voluntario` AS `email`,`v`.`senha_voluntario` AS `senha` from (`voluntario` `v` join `pessoa` `p` on((`p`.`idPessoa` = `v`.`idPessoa`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_beneficio_pessoa`
--

/*!50001 DROP VIEW IF EXISTS `vw_beneficio_pessoa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_beneficio_pessoa` AS select `beneficio`.`idBeneficio` AS `ID`,`pessoa`.`nome_completo` AS `nome_completo`,`beneficio`.`data_cadastro` AS `data_cadastro`,`beneficio`.`data_entrada` AS `data_entrada`,`beneficio`.`data_saida` AS `data_saida`,`beneficio`.`prorrogacao` AS `prorrogacao`,`beneficio`.`duracao` AS `duracao`,`beneficio`.`situacao_beneficio` AS `situacao_beneficio` from (`beneficio` join `pessoa` on((`pessoa`.`idPessoa` = `beneficio`.`idPessoa`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_beneficiogov_pessoa`
--

/*!50001 DROP VIEW IF EXISTS `vw_beneficiogov_pessoa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_beneficiogov_pessoa` AS select `beneficiogov`.`idBeneficioGov` AS `id`,`pessoa`.`nome_completo` AS `nome`,`pessoa`.`cpf` AS `cpf`,`beneficiogov`.`POSSUI_BENEFICIO` AS `possui_beneficio`,`beneficiogov`.`NOME_BENEFICIO_GOV` AS `nome_beneficio_gov`,`beneficiogov`.`VALOR_BENEFICIO` AS `valor_beneficio`,`beneficiogov`.`OUTROS` AS `outros`,`beneficiogov`.`idPessoa` AS `idPessoa` from (`pessoa` join `beneficiogov` on((`pessoa`.`idPessoa` = `beneficiogov`.`idPessoa`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pessoa_beneficiario`
--

/*!50001 DROP VIEW IF EXISTS `vw_pessoa_beneficiario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pessoa_beneficiario` AS select `beneficiario`.`idBeneficiario` AS `idBeneficiario`,`pessoa`.`nome_completo` AS `nome_completo`,`pessoa`.`cpf` AS `cpf`,`beneficiario`.`data_nascimento_beneficiario` AS `data_nascimento_beneficiario`,`beneficiario`.`estado_civil` AS `estado_civil`,`pessoa`.`telefone` AS `telefone`,`pessoa`.`email` AS `email`,`beneficiario`.`renda_familiar` AS `renda_familiar`,`beneficiario`.`dependente` AS `dependente`,`filho_dependente`.`nome_filho_dependente` AS `nome_filho_dependente` from ((`pessoa` join `beneficiario` on((`pessoa`.`idPessoa` = `beneficiario`.`idPessoa`))) join `filho_dependente` on((`filho_dependente`.`idFilho_Dependente` = `beneficiario`.`idFilho_Dependente`))) */;
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

-- Dump completed on 2025-07-18  8:56:10
