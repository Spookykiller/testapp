-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: boekhouding_database
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `annualaccounts`
--

DROP TABLE IF EXISTS `annualaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `annualaccounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `an_date` datetime DEFAULT NULL,
  `an_pr_return` decimal(10,0) DEFAULT NULL,
  `an_pr_production_cost` decimal(10,0) DEFAULT NULL,
  `an_pr_gross_margin` decimal(10,0) DEFAULT NULL,
  `an_pr_TA_expenses` decimal(10,0) DEFAULT NULL,
  `an_pr_accomodation_expenses` decimal(10,0) DEFAULT NULL,
  `an_pr_sales_expenses` decimal(10,0) DEFAULT NULL,
  `an_pr_consumption_expenses` decimal(10,0) DEFAULT NULL,
  `an_pr_other_expenses` decimal(10,0) DEFAULT NULL,
  `an_pr_total_other_expenses` decimal(10,0) DEFAULT NULL,
  `an_pr_net_margin` decimal(10,0) DEFAULT NULL,
  `an_pr_depreciation` decimal(10,0) DEFAULT NULL,
  `an_pr_bank_charges` decimal(10,0) DEFAULT NULL,
  `an_pr_small_business_scheme` decimal(10,0) DEFAULT NULL,
  `an_pr_loss` decimal(10,0) DEFAULT NULL,
  `an_pr_withdrawal` decimal(10,0) DEFAULT NULL,
  `an_pr_deposit` decimal(10,0) DEFAULT NULL,
  `an_pr_balance_turnover_tax` decimal(10,0) DEFAULT NULL,
  `an_pr_payed_turnover_tax` decimal(10,0) DEFAULT NULL,
  `an_pr_deductible_consumption_expenses` decimal(10,0) DEFAULT NULL,
  `an_ba_debtor` decimal(10,0) DEFAULT NULL,
  `an_ba_liquid_assets` decimal(10,0) DEFAULT NULL,
  `an_ba_prepayment` decimal(10,0) DEFAULT NULL,
  `an_ba_stock` decimal(10,0) DEFAULT NULL,
  `an_ba_carrying_amount` decimal(10,0) DEFAULT NULL,
  `an_ba_total_asset` decimal(10,0) DEFAULT NULL,
  `an_ba_creditors` decimal(10,0) DEFAULT NULL,
  `an_ba_accrued_receivables` decimal(10,0) DEFAULT NULL,
  `an_ba_current_receivables` decimal(10,0) DEFAULT NULL,
  `an_ba_loan` decimal(10,0) DEFAULT NULL,
  `an_ba_pr_balance` decimal(10,0) DEFAULT NULL,
  `an_ba_withdrawals_deposits_balance` decimal(10,0) DEFAULT NULL,
  `an_ba_reserve` decimal(10,0) DEFAULT NULL,
  `an_ba_total_receivables` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `annualaccounts`
--

LOCK TABLES `annualaccounts` WRITE;
/*!40000 ALTER TABLE `annualaccounts` DISABLE KEYS */;
INSERT INTO `annualaccounts` VALUES (1,'2015-04-01 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,200,100,500,NULL,300,200,1000,2000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-10 12:48:37','2016-06-10 13:29:35');
/*!40000 ALTER TABLE `annualaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_number` int(11) DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `client_contact_person` varchar(255) DEFAULT NULL,
  `client_address` varchar(255) DEFAULT NULL,
  `client_zipcode` varchar(255) DEFAULT NULL,
  `client_residence` varchar(255) DEFAULT NULL,
  `client_gender` tinyint(1) DEFAULT NULL,
  `client_phone` varchar(255) DEFAULT NULL,
  `client_email` varchar(255) DEFAULT NULL,
  `client_account_number` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (2,1,'Kinesis','Frank','Postbus 2015','3222 LK','Alkmaar',1,'0612345678','frank.kinesis@kinesis.nl','NL 043321 TK032','2016-06-07 10:37:32','2016-06-07 10:37:32'),(3,2,'Appletree','Arjen Bosman','Ewardstraat 204','6677 OL','Naasten',1,'06321234654','arjen.bosman@appletree.nl','NL 093221 TT 032','2016-06-07 10:42:24','2016-06-07 10:42:24'),(4,3,'Koenders Advies','Willem Totma','Weering 21','1254 OP','Kalkmaar',1,'08-73341123','willem@koendersadvies.nl','NL 012321 RK 232','2016-06-07 10:44:15','2016-06-07 10:44:15'),(5,4,'Timmerbedrijf','Gregory','Riklak 211','8442 NK','Capricorn',1,'781-217-6591','GregoryMWilliams@inbound.plus','4929 4038 6596 0229','2016-06-07 10:46:37','2016-06-07 10:46:37');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_number` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_zipcode` varchar(255) DEFAULT NULL,
  `company_place` varchar(255) DEFAULT NULL,
  `company_phone` varchar(255) DEFAULT NULL,
  `company_email` varchar(255) DEFAULT NULL,
  `company_webaddress` varchar(255) DEFAULT NULL,
  `company_bank_account_number` varchar(255) DEFAULT NULL,
  `company_bank` varchar(255) DEFAULT NULL,
  `company_VAT_number` varchar(255) DEFAULT NULL,
  `company_CC_number` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,NULL,'Koenders Advies','Stadrijk 209','5403NK','Uden','061234567','hoihoi@koendersadvies.nl','www.koendersadvies.nl','123456789','ING','21%','Kvk hier','2016-06-07 10:33:52','2016-06-14 10:11:35'),(2,NULL,'4G Webdesign','Stadrijk 216','5403NK','Uden','0413253375','gijs@de4gees.nl','www.de4gees.nl/webdesign','0987654321','ING','BTW 21232','KvK 123456789','2016-06-07 13:03:10','2016-06-07 13:03:10');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_number` int(11) DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `invoice_client_name` varchar(255) DEFAULT NULL,
  `invoice_subject` varchar(255) DEFAULT NULL,
  `invoice_VAT_number` varchar(255) DEFAULT NULL,
  `invoice_VAT_percentage` int(11) DEFAULT NULL,
  `invoice_exclusive_VAT` decimal(10,0) DEFAULT NULL,
  `invoice_VAT` decimal(10,0) DEFAULT NULL,
  `invoice_including_VAT` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,1,'2016-06-07 00:00:00','Appletree','Boekhoudprogramma','234212',21,600,NULL,NULL,'2016-06-08 07:44:07','2016-06-08 07:44:07'),(2,2,'2016-06-04 00:00:00','Koenders Advies','V&W rekening gemaakt.','1244124',6,965,NULL,NULL,'2016-06-08 08:55:58','2016-06-08 08:55:58');
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_number` int(11) DEFAULT NULL,
  `project_name` varchar(255) DEFAULT NULL,
  `project_client` varchar(255) DEFAULT NULL,
  `project_budget` decimal(10,0) DEFAULT NULL,
  `project_billable` decimal(10,0) DEFAULT NULL,
  `project_non_billable` decimal(10,0) DEFAULT NULL,
  `project_residual` decimal(10,0) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,NULL,'Validatieformulier maken','Kinesis',20,NULL,NULL,NULL,'2016-06-07 11:27:02','2016-06-07 11:27:02'),(2,NULL,'Onderzoeksrapport','Appletree',10,NULL,NULL,NULL,'2016-06-07 11:27:20','2016-06-07 11:27:20'),(3,NULL,'Financieel rapport','Kinesis',30,NULL,NULL,NULL,'2016-06-07 11:33:13','2016-06-07 11:33:13'),(4,NULL,'Financiele mutaties','Koenders Advies',30,NULL,NULL,NULL,'2016-06-07 17:00:19','2016-06-07 17:00:19');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160601191954'),('20160601195738'),('20160602084157'),('20160602085300'),('20160602090928'),('20160602093237'),('20160602093903'),('20160602114342'),('20160610120232');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spendings`
--

DROP TABLE IF EXISTS `spendings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spendings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spending_number` int(11) DEFAULT NULL,
  `spending_date` datetime DEFAULT NULL,
  `spending_company_name` varchar(255) DEFAULT NULL,
  `spending_cost_description` varchar(255) DEFAULT NULL,
  `spending_type` varchar(255) DEFAULT NULL,
  `spending_VAT_percentage` int(11) DEFAULT NULL,
  `spending_exclusive_VAT` decimal(10,0) DEFAULT NULL,
  `spending_VAT` decimal(10,0) DEFAULT NULL,
  `spending_including_VAT` decimal(10,0) DEFAULT NULL,
  `spending_paid` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spendings`
--

LOCK TABLES `spendings` WRITE;
/*!40000 ALTER TABLE `spendings` DISABLE KEYS */;
INSERT INTO `spendings` VALUES (1,1,'2016-06-08 00:00:00','Shell','Benzinekosten','Kantoorkosten',21,NULL,NULL,30,'2016-06-08 00:00:00','2016-06-08 08:51:29','2016-06-08 08:51:29'),(2,2,'2016-05-11 00:00:00','Lekkerzitten','Stoelen','Kantoorkosten',21,NULL,NULL,1200,'2016-06-02 00:00:00','2016-06-08 09:00:15','2016-06-08 09:00:15');
/*!40000 ALTER TABLE `spendings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheets`
--

DROP TABLE IF EXISTS `timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timesheet_project_number` int(11) DEFAULT NULL,
  `timesheet_name` varchar(255) DEFAULT NULL,
  `timesheet_description` varchar(255) DEFAULT NULL,
  `timesheet_date` datetime DEFAULT NULL,
  `timesheet_hours` decimal(10,0) DEFAULT NULL,
  `timesheet_billable` tinyint(1) DEFAULT NULL,
  `timesheet_comment` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheets`
--

LOCK TABLES `timesheets` WRITE;
/*!40000 ALTER TABLE `timesheets` DISABLE KEYS */;
INSERT INTO `timesheets` VALUES (1,1,'Validatieformulier maken','Veel velden aanmaken en bewerken.','2016-06-06 00:00:00',20,1,'Moet er nog 2 afmaken.','2016-06-07 11:54:04','2016-06-07 11:54:04'),(2,2,'Onderzoeksrapport','Onderzoek naar belastingadvies opstellen','2016-06-02 00:00:00',12,0,'Af!','2016-06-07 11:54:37','2016-06-13 10:20:16'),(3,3,'Validatieformulier maken','Uitzoeken hoe ik een validatieformulier kon maken in HTML','2016-06-03 00:00:00',13,1,'Moet nog even kijken naar de kleuren','2016-06-07 11:55:23','2016-06-13 10:23:48'),(4,4,'Financieel rapport','Financieel rapport hockyclub uden verder uitgewerkt','2016-06-04 00:00:00',30,0,'Kostte meer tijd dan voorheen gedacht.','2016-06-07 12:47:34','2016-06-13 10:23:41');
/*!40000 ALTER TABLE `timesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_gender` tinyint(1) DEFAULT NULL,
  `user_function` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_number` int(11) DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  KEY `index_users_on_company_id` (`company_id`),
  CONSTRAINT `fk_rails_7682a3bdfe` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'flexkoenders@koendersadvies.nl','$2a$11$SfEG2YvepL6FZw7wtpkawOdL7Mao72iX98v7x3nhXOtRW6lLS/0fq',NULL,NULL,'Gijs Verdonschot',1,'Accountant','0648267752',NULL,NULL,42,'2016-06-16 10:18:20','2016-06-15 17:32:53','84.35.200.66','84.29.160.171','2016-06-07 10:34:18','2016-06-16 10:18:20',1),(4,'test123@koendersadvies.nl','$2a$11$LnZJOQyL9sxbU.Y7EoBExOgCqGD0k3CAgPBUJNwocoCqcpA1tBMXS',NULL,NULL,'test12345678',1,'Accountant','0648267752',NULL,NULL,5,'2016-06-12 13:13:38','2016-06-12 08:58:28','84.29.160.171','84.29.160.171','2016-06-07 13:03:31','2016-06-12 13:13:38',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-16 10:19:43
