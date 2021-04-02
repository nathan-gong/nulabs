CREATE DATABASE  IF NOT EXISTS `nulabs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nulabs`;
-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: nulabs
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `username` varchar(255) NOT NULL,
  `college_name` varchar(16) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `college_name` (`college_name`),
  CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`college_name`) REFERENCES `college` (`college_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES ('c.sceppa','Bouve'),('g.abowd','COE'),('h.sive','COS'),('u.poiger','CSSH'),('r.echambadi','DMSB'),('c.brodley','Khoury');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `building_name` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `college_name` varchar(16) NOT NULL,
  PRIMARY KEY (`building_name`),
  KEY `college_name` (`college_name`),
  CONSTRAINT `building_ibfk_1` FOREIGN KEY (`college_name`) REFERENCES `college` (`college_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES ('140 The Fenway','140 Fenway','COS'),('177 Huntington','177 Huntington Avenue','Khoury'),('Behrakis Health Sciences Center','30 Leon Street','Bouve'),('Churchill Hall','380 Huntington Avenue','CSSH'),('Egan Research Center','120 Forsyth Street','COS'),('Forsyth Building','70 Forsyth Street','Khoury'),('Hayden Hall','361 Huntington Avenue','DMSB'),('Hurtig Hall','10 Gainsborough Street','COS'),('Interdisciplinary Science and Engineering Center','805 Columbus Ave','Khoury'),('Marine Science Center','430 Nahant Road','COS'),('Mugar Life Sciences Building','330 Huntington Avenue','COS'),('Nightingale Hall','105 Forsyth Street','COS'),('Renaissance Park','1135 Tremont Street','CSSH'),('Richards Hall','360 Huntington Avenue','Khoury'),('Roux Institute','100 Fore Street','Khoury'),('Shillman Hall','115 Forsyth Street','COS'),('Snell Engineering Center','110 Forsyth Street','COS'),('West Village H','440 Huntington Avenue','Khoury');
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `college`
--

DROP TABLE IF EXISTS `college`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `college` (
  `college_name` varchar(16) NOT NULL,
  PRIMARY KEY (`college_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `college`
--

LOCK TABLES `college` WRITE;
/*!40000 ALTER TABLE `college` DISABLE KEYS */;
INSERT INTO `college` VALUES ('Bouve'),('COE'),('COS'),('CSSH'),('DMSB'),('Khoury');
/*!40000 ALTER TABLE `college` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conducts`
--

DROP TABLE IF EXISTS `conducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conducts` (
  `username` varchar(255) NOT NULL,
  `title` varchar(256) NOT NULL,
  `lab_name` varchar(255) NOT NULL,
  KEY `username` (`username`),
  KEY `title` (`title`),
  KEY `lab_name` (`lab_name`),
  CONSTRAINT `conducts_ibfk_1` FOREIGN KEY (`username`) REFERENCES `lab_member` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `conducts_ibfk_2` FOREIGN KEY (`title`) REFERENCES `project` (`title`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `conducts_ibfk_3` FOREIGN KEY (`lab_name`) REFERENCES `lab` (`lab_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conducts`
--

LOCK TABLES `conducts` WRITE;
/*!40000 ALTER TABLE `conducts` DISABLE KEYS */;
INSERT INTO `conducts` VALUES ('A.Gates','Center for Complex Network Research','Center for Complex Network Research'),('D.Gysi','Center for Complex Network Research','Center for Complex Network Research'),('M.Kellis','Center for Complex Network Research','Center for Complex Network Research'),('A.Barab·si','Center for Complex Network Research','Center for Complex Network Research'),('S.Marsella','Cognitive Embodied Social Agents Research (CESAR) Lab','Cognitive Embodied Social Agents Research (CESAR) Lab'),('P.Sequeira','Cognitive Embodied Social Agents Research (CESAR) Lab','Cognitive Embodied Social Agents Research (CESAR) Lab'),('D.Jeong','Cognitive Embodied Social Agents Research (CESAR) Lab','Cognitive Embodied Social Agents Research (CESAR) Lab'),('H.Wang','Cognitive Embodied Social Agents Research (CESAR) Lab','Cognitive Embodied Social Agents Research (CESAR) Lab'),('D.Feng','Cognitive Embodied Social Agents Research (CESAR) Lab','Cognitive Embodied Social Agents Research (CESAR) Lab'),('N.Yongsatianchot','Cognitive Embodied Social Agents Research (CESAR) Lab','Cognitive Embodied Social Agents Research (CESAR) Lab'),('P.Parker','Cognitive Embodied Social Agents Research (CESAR) Lab','Cognitive Embodied Social Agents Research (CESAR) Lab'),('C.Riedl','Collaborative Social Systems Lab','Collaborative Social Systems Lab'),('S.Westby','Collaborative Social Systems Lab','Collaborative Social Systems Lab'),('Z.Fulker','Collaborative Social Systems Lab','Collaborative Social Systems Lab'),('V.Lange','Collaborative Social Systems Lab','Collaborative Social Systems Lab'),('N.Lore','Collaborative Social Systems Lab','Collaborative Social Systems Lab'),('K.Flaherty','Collaborative Social Systems Lab','Collaborative Social Systems Lab'),('H.Jimison','Consortium on Technology for Proactive Care','Consortium on Technology for Proactive Care'),('M.Pavel','Consortium on Technology for Proactive Care','Consortium on Technology for Proactive Care'),('X.Li','Consortium on Technology for Proactive Care','Consortium on Technology for Proactive Care'),('M.Kos','Consortium on Technology for Proactive Care','Consortium on Technology for Proactive Care'),('D.Sternad','From Action to Interaction; Complex Object Manipulation:','Action Lab'),('D.Sternad','Assessment of Stability in Complex Human Movements:','Action Lab'),('D.Sternad','The MAGIC Table: A Motion-Analysis Device for Upper-Limb Research:','Action Lab'),('S.Bazzi','Assessment of Stability in Complex Human Movements:','Action Lab'),('M.Sadeghi','From Action to Interaction; Complex Object Manipulation:','Action Lab'),('M.Russo','Assessment of Stability in Complex Human Movements:','Action Lab'),('A.Krotov','The MAGIC Table: A Motion-Analysis Device for Upper-Limb Research:','Action Lab'),('B.Gossart','From Action to Interaction; Complex Object Manipulation:','Action Lab'),('S.Bond','Assessment of Stability in Complex Human Movements:','Action Lab'),('A.Nugent','The MAGIC Table: A Motion-Analysis Device for Upper-Limb Research:','Action Lab'),('K.Lee','Neural basis of affective experience','Affective and Brain Sciences Lab'),('K.Lee','Concepts and Emotion','Affective and Brain Sciences Lab'),('S.Fiedler','Examining functional activity in human brain stem nuclei using high resolution, ultra-high Field (7T) fMRI','Affective and Brain Sciences Lab'),('Y.Wang','Neural basis of affective experience','Affective and Brain Sciences Lab'),('Y.Wang','Modeling networks and network dynamics','Affective and Brain Sciences Lab'),('A.Iancarelli','Modeling networks and network dynamics','Affective and Brain Sciences Lab'),('K.McVeigh','Concepts and Emotion','Affective and Brain Sciences Lab'),('E.Diederich','Examining functional activity in human brain stem nuclei using high resolution, ultra-high Field (7T) fMRI','Affective and Brain Sciences Lab'),('I.Korogodsky','Modeling networks and network dynamics','Affective and Brain Sciences Lab'),('N.Chaudhary','Neural basis of affective experience','Affective and Brain Sciences Lab'),('L.Christenson','Cognitive control in social and affective neuroscience','Affective and Brain Sciences Lab'),('J.Apfeld','Examining how the brain regulates aging and resilience to stress','Apfeld Lab'),('J.Norris','Examining how the brain regulates aging and resilience to stress','Apfeld Lab'),('F.Servello','Examining how the brain regulates aging and resilience to stress','Apfeld Lab'),('Y.Xu','Examining how the brain regulates aging and resilience to stress','Apfeld Lab'),('S.Stumbur','Examining how the brain regulates aging and resilience to stress','Apfeld Lab'),('N.Patel','Examining how the brain regulates aging and resilience to stress','Apfeld Lab'),('A.Lindberg','Examining how the brain regulates aging and resilience to stress','Apfeld Lab'),('N.Gong','Examining how the brain regulates aging and resilience to stress','Apfeld Lab'),('P.Beuning','Persisters','Lewis Lab'),('P.Beuning','Uncultured Bacteria','Lewis Lab'),('P.Beuning','Lyme Disease','Lewis Lab'),('P.Beuning','Drug Discovery','Lewis Lab'),('L.Ruffner','Persisters','Lewis Lab'),('H.Stern','Uncultured Bacteria','Lewis Lab'),('J.McIsaac','Lyme Disease','Lewis Lab'),('S.Watson','Drug Discovery','Lewis Lab'),('S.Fields','Persisters','Lewis Lab'),('R.Dilworth','Uncultured Bacteria','Lewis Lab'),('L.Kankanamge','Lyme Disease','Lewis Lab'),('E.Micheloni','Drug Discovery','Lewis Lab'),('A.Murphy','Nutrient enrichment of marshes','Bowen Lab'),('A.Murphy','Understanding marsh carbon storage','Bowen Lab'),('A.Murphy','Plant Microbe interactions','Bowen Lab'),('A.Murphy','Animal Microbe interactions','Bowen Lab'),('J.LHeureux','Plant Microbe interactions','Bowen Lab'),('H.Sullivan','Controls on nitrous oxide fluxes','Bowen Lab'),('A.Martinez','Understanding marsh carbon storage','Bowen Lab'),('J.Vinels','Controls on nitrous oxide fluxes','Bowen Lab'),('K.McNally','Understanding marsh carbon storage','Bowen Lab'),('B.Donnelly','Plant Microbe interactions','Bowen Lab'),('T.Hadzic','COVID-19 modeling and wastewater surveillance','Emergent Epidemics Lab'),('D.Joseph','COVID-19 modeling and wastewater surveillance','Emergent Epidemics Lab'),('C.Yang','COVID-19 modeling and wastewater surveillance','Emergent Epidemics Lab'),('W.Healy','COVID-19 modeling and wastewater surveillance','Emergent Epidemics Lab'),('M.Zahedi','COVID-19 modeling and wastewater surveillance','Emergent Epidemics Lab'),('M.Shrestha','COVID-19 modeling and wastewater surveillance','Emergent Epidemics Lab'),('M.Di Pierro','Physical Genetics ','Di Pierro Lab'),('K.Chowdhury','Learning and Dynamic Spectrum Access','Next Generation Networks and Systems Lab (GENESYS)'),('D.Roy','Networked Robotics','Next Generation Networks and Systems Lab (GENESYS)'),('Y.Naderi','Perpetually Operating Internet of Things','Next Generation Networks and Systems Lab (GENESYS)'),('K.Alemdar','Learning and Dynamic Spectrum Access','Next Generation Networks and Systems Lab (GENESYS)'),('C.Bocanegra','Networked Robotics','Next Generation Networks and Systems Lab (GENESYS)'),('B.Salehi','Perpetually Operating Internet of Things','Next Generation Networks and Systems Lab (GENESYS)'),('S.Bencherif','Biomaterials Design','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('L.Eggermont','Tissue Engineering','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('T.Colombani','Cancer Immunotherapy','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('M.Zeevi','Biomaterials Design','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('K.Batt','Tissue Engineering','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('Z.Rogers','Cancer Immunotherapy','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('Y.Bart','DATA Initiative','DATA Initiative'),('K.Chan','DATA Initiative','DATA Initiative'),('P.Ciuccarelli','DATA Initiative','DATA Initiative'),('D.Cohen','DATA Initiative','DATA Initiative'),('M.Eckelman','DATA Initiative','DATA Initiative'),('K.Pauwels','DATA Initiative','DATA Initiative'),('d.shaughnessy','Social Enterprise Institute','Social Enterprise Institute'),('dittrich.a','Social Enterprise Institute','Social Enterprise Institute'),('grun.a','Social Enterprise Institute','Social Enterprise Institute'),('agoglia.a','Social Enterprise Institute','Social Enterprise Institute'),('szaniawski.k','Social Enterprise Institute','Social Enterprise Institute'),('fall.c','Social Enterprise Institute','Social Enterprise Institute'),('D.Cokely','Sign Language Development','Center for Atypical Language Interpreting'),('D.Cokely','Adult Communication Skills and Assessments','Center for Atypical Language Interpreting'),('D.Cokely','Forensic Psychology','Center for Atypical Language Interpreting'),('D.Doucette','Interpreting for Persons with Atypical Language','Center for Atypical Language Interpreting'),('D.Doucette','Adult Communication Skills and Assessments','Center for Atypical Language Interpreting'),('E.Kramer','Forensic Psychology','Center for Atypical Language Interpreting'),('E.Kramer','Language Deprivation Syndrome','Center for Atypical Language Interpreting'),('S.Flynn','Integrated Resilience Enhancement Solutions','Global Resilience Institute'),('M.Bernstein','Cyber Resilience','Global Resilience Institute'),('J.Stephens','Enterprise Continuity and Recovery Solutions','Global Resilience Institute'),('R.White','Integrated Resilience Enhancement Solutions','Global Resilience Institute'),('W.Edwards','Cyber Resilience','Global Resilience Institute'),('M.Patterson','Enterprise Continuity and Recovery Solutions','Global Resilience Institute'),('P.Anderson','Integrated Resilience Enhancement Solutions','Global Resilience Institute'),('A.Valencia','Cyber Resilience','Global Resilience Institute'),('S.Pickens','Enterprise Continuity and Recovery Solutions','Global Resilience Institute'),('A.Pinto','Time-series observations','Pinto Lab'),('A.Pinto','Designing microbiomes','Pinto Lab'),('A.Pinto','Cataloguing membership','Pinto Lab'),('A.Pinto','Model community','Pinto Lab'),('E.Chen','Time-series observations','Pinto Lab'),('S.Vosloo','Time-series observations','Pinto Lab'),('S.Vosloo','Model community','Pinto Lab'),('B.Gincley','Model community','Pinto Lab'),('B.Gincley','Designing microbiomes','Pinto Lab'),('C.Anderson','Designing microbiomes','Pinto Lab'),('L.Huo','Cataloguing membership','Pinto Lab'),('L.Huo','Time-series observations','Pinto Lab'),('C.Mboijana','Time-series observations','Pinto Lab');
/*!40000 ALTER TABLE `conducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab`
--

DROP TABLE IF EXISTS `lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab` (
  `lab_name` varchar(255) NOT NULL,
  `lab_description` varchar(3000) NOT NULL,
  `website` varchar(1000) NOT NULL,
  `recruiting_status` tinyint NOT NULL,
  `department` varchar(255) NOT NULL,
  `building_name` varchar(255) NOT NULL,
  PRIMARY KEY (`lab_name`),
  KEY `building_name` (`building_name`),
  CONSTRAINT `lab_ibfk_1` FOREIGN KEY (`building_name`) REFERENCES `building` (`building_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab`
--

LOCK TABLES `lab` WRITE;
/*!40000 ALTER TABLE `lab` DISABLE KEYS */;
INSERT INTO `lab` VALUES ('Action Lab','Motor skills such as throwing a ball, eating with knife and fork or dancing are uniquely human and key to functional behavior. Optimizing the acquisition and preventing or reverting the degradation of skill requires a rigorous quantitative understanding. The Action Lab analyzes how human neurophysiology and task mechanics constrains sensorimotor skills and their change. This work has applications for and performance enhancement and recovery after neurological injury.','https://web.northeastern.edu/actionlab/#_ga=2.91656218.1214471716.1615096785-1696423499.1564006309',1,'Behavioral Neuroscience','Mugar Life Sciences Building'),('Advanced Drug Delivery Research Lab','The ADDRES Lab studies interactions between materials and biological systems, with a current focus on the intestinal environment, via development of theoretical and tissue-engineered cell culture models.','http://www1.coe.neu.edu/~rebecca/#_ga=2.53442984.1214471716.1615096785-1696423499.1564006309',0,'Biochemistry','Snell Engineering Center'),('Affective and Brain Sciences Lab','Research in his lab focuses on two main areas. The first area examines the neural basis of affect including pleasure and pain, emotion (e.g. fear), and interactions between affect/emotion with cognition. The second area examines large-scale computational architectures of the brain with the goal that it will advance theory and research in affective neuroscience.','https://web.northeastern.edu/affectiveandbrainscienceslab/?page_id=150',0,'Psychology','Shillman Hall'),('Amiji Group','The research effort in the Laboratory of Biomaterials and Advanced Nano-Delivery Systems (BANDS) is focused on the development of biocompatible materials from natural and synthetic polymers, target-specific drug and gene delivery systems for cancer, CNS, inflammatory, and infectious diseases, and nanotechnology applications in medical diagnosis, imaging, and therapy.','https://web.northeastern.edu/amijilab/people/prof-amiji/#_ga=2.125221002.1214471716.1615096785-1696423499.1564006309',0,'Biochemistry','140 The Fenway'),('Apfeld Lab','The Apfeld Lab seeks to dissect the interplay between redox processes and age-dependent changes in tissue function in the nematode C. elegans, in order to shed light on the association between the dysregulation of the cellular redox environment and many human diseases of aging.','https://apfeldlab.mystrikingly.com/',1,'Biochemistry','Mugar Life Sciences Building'),('Biomedical Optics Research Group','This group studies biomedical optics and non-invasive imaging, rare cell detection and tracking in the body, ultrafast time-domain diffuse optical imaging, image reconstruction and biomedical signal processing.','https://sites.google.com/site/niedrelab/home',0,'Biochemistry','Interdisciplinary Science and Engineering Center'),('Bioresponsive Drug Delivery and Tissue Engineering Lab','Bioresponsive drug delivery; cell and tissue engineering; tissue architecture; targeted therapeutics','https://www.augustelab.org/about/index.html',0,'Chemical Engineering','Interdisciplinary Science and Engineering Center'),('Bowen Lab','Much of the research in the Bowen Lab is focused on how salt marsh microbial communities, and in particular those microbes that are important in the nitrogen cycle, respond to global change drivers.','https://jb2032.wixsite.com/bowenlab',1,'Marine and Environmental Sciences','Marine Science Center'),('Business Sustainability Initiative','The Business Sustainability Initiative at DíAmore-McKim encourages and supports programs that promote sustainability in research, teaching and service as well as collaborations with industry and other colleges in the university.','https://damore-mckim.northeastern.edu/business-sustainability/',1,'Business Administration','Hayden Hall'),('Cell & Tissue Engineering Lab (CEL)','The Asthagiri lab investigates how cancer cells acquire the ability to invade their surroundings, a key early step in the lethal progression to metastasis. They seek to identify robust therapeutic strategies to target cancer cells whose heterogeneity and plasticity make them a ìmoving target.î','https://www.cell-engineering.org/',0,'Bioengineering','Interdisciplinary Science and Engineering Center'),('Center for Atypical Language Interpreting','The Center for Atypical Language Interpreting (CALI) is addressing the growing demand for interpreters with specialized skills to serve Deaf and DeafBlind persons with atypical language.','https://www.northeastern.edu/cali/#_ga=2.123706507.1214471716.1615096785-1696423499.1564006309',0,'Sociology','Renaissance Park'),('Center for Complex Network Research','Investigates how networks emerge, what they look like, how they evolve and more. ','https://www.barabasilab.com/',1,'Computer Science','177 Huntington'),('Center for Drug Discovery','The Center for Drug Discovery synthesizes novel compounds to treat a diverse array of indications, from neurodegenerative illnesses to obesity and addiction. Our compounds have been instrumental in elucidating the structures and functions of the endocannabinoid system.','http://cdd.neu.edu/',1,'Pharmacy','Behrakis Health Sciences Center'),('Center for Emerging Markets','This center was founded in 2007, and is dedicated to conducting research on how firms can leverage high-growth emerging markets for global competitive advantage and to disseminating best practices for success in such countries.','https://damore-mckim.northeastern.edu/group/emerging-markets/contacts/',0,'Business Administration','Hayden Hall'),('Center for Entrepreneurship Education','A university-wide resource for all students, faculty and alumni that integrates entrepreneurship and innovation courses, entrepreneurial co-ops in early stage companies, venture incubation through IDEA and more.','https://entrepreneurship.northeastern.edu/',1,'Business Administration','Hayden Hall'),('Center for Family Business','This membership-based educational program focuses on the unique interests of emerging leaders, successors and senior generation family members who are stakeholders in their family businesses.','https://damore-mckim.northeastern.edu/family-business/',1,'Business Administration','Hayden Hall'),('Center for Health Policy and Healthcare Research','The centerís mission is to promote the efficiency, quality and accessibility of health care services through innovative research, education, and policy analysis.','https://web.northeastern.edu/chphr/?_ga=2.253232833.938051176.1615096785-1442243363.1564006309',1,'Business Administration','Richards Hall'),('Center for Pharmaceutical Biotechnology and Nanomedicine','Research at this center includes pharmaceutical nanocarriers, controlled drug and gene delivery, drug targeting, intracellular targeting, experimental medical imaging, and cancer immunology, and train young researches in these areas.','https://web.northeastern.edu/cpbn/#_ga=2.57505450.1214471716.1615096785-1696423499.1564006309',0,'Biotechnology','140 The Fenway'),('Center for Translational Neuroimaging (CTNI)','The Centerís mission is to provide services to the academic community interested in the areas of animal modeling and drug testing to aid in the diagnosis and treatment of CNS diseases.','https://web.northeastern.edu/ctni/#_ga=2.158766394.1214471716.1615096785-1696423499.1564006309',0,'Health Sciences','Mugar Life Sciences Building'),('Center for Workforce Analytics','Founded in 2015, CFWA advances the science and practice of applied workforce measurement and analytics.','https://damore-mckim.northeastern.edu/workforce-analytics/',1,'Business Administration','Hayden Hall'),('Center on Crime and Community Resilience','Based at Northeastern University, we partner with governments and non-profits to find research-based solutions to crime and other complex social problems. Our focus is on the needs and priorities of the partners and communities we work with, with the goal of bringing resilience to vulnerable communities.','https://cssh.northeastern.edu/ccresilience/',1,'Political Science','Churchill Hall'),('Clark Lab','The Clark lab builds nanoscale sensors to image and detect signaling chemistry in the body. We are a multidisciplinary team of chemists, engineers, and biologists who are seeking to expand the probes and contrast agents available for imaging. The members of the group work in the areas of sensor synthesis, analytical characterization, and validation in animal models.','https://nanosensors.sites.northeastern.edu/#_ga=2.53335336.1214471716.1615096785-1696423499.1564006309',1,'Chemistry and Chemical Biology','Interdisciplinary Science and Engineering Center'),('Cognitive Embodied Social Agents Research (CESAR) Lab','Works on computational modeling of human behavior for study and education and analysis applications','https://web.northeastern.edu/cesar/#_ga=2.133601294.1214471716.1615096785-1696423499.1564006309',1,'Computer Science','West Village H'),('Collaborative Social Systems Lab','Explores collaboration in distributed environments using modeling, experiments and data analysis','https://www.christophriedl.net/',1,'Computer Science','177 Huntington'),('Communication Analysis and Design Laboratory (CADLAB)','Conducts interdisciplinary work on speech communication and human-computer interaction','https://web.northeastern.edu/cadlab/#_ga=2.92647453.1214471716.1615096785-1696423499.1564006309',0,'Computer Science','Forsyth Building'),('Computational Optics and Translational Imaging (COTI) Lab','Innovations in translational medical imaging devices to better diagnose cancers, low-cost point-of-care diagnostic tools to delivery life-saving medicines to the resource-poor regions, and high performance computing tools to facilitate the development of the next-generation imaging methods','http://fanglab.org/wiki/',1,'Bioengineering','Interdisciplinary Science and Engineering Center'),('Consortium on Technology for Proactive Care','Leverages behavioral informatics to develop affordable, technology based healthcare solutions','https://ctpc.khoury.northeastern.edu/nuhome-2/',0,'Computer Science','Richards Hall'),('Cram Lab','The Cram Laboratory utilizes the model organism Caenorhabditis elegans as an in vivo system to examine how mechanical forces are sensed and interpreted by cells and how this influences cell migration. In addition, they collaborate with Chemical Engineers to improve production of drug compounds by the medicinal plant Catharanthus roseus.','https://web.northeastern.edu/cramlab/#_ga=2.154515512.1214471716.1615096785-1696423499.1564006309',0,'Biochemistry','Mugar Life Sciences Building'),('DATA Initiative','The Digital, Analytics, Technology and Automation Initiative is enabling a generation of intellectual leadership in the areas of digital convergence.','https://damore-mckim.northeastern.edu/data-initiative/',1,'Business Administration','Hayden Hall'),('Data Visualization','Explores visualization for human perception and vision, visual encodings, design tihnking, and more.','https://visualization.khoury.northeastern.edu/people/',1,'Data Science','Roux Institute'),('Developmental Neuropsychobiology Laboratory','Dr. Brenhouseís lab studies the dynamic interaction between the brain, the body, and the environment throughout early life and adolescent development. Using animal models with genetic, behavioral, and pharmacological manipulation, her laboratory investigates why later manifestation of mental illness occurs, and how we might prevent it.','https://web.northeastern.edu/brenhouselab/',0,'Psychology','Nightingale Hall'),('Di Pierro Lab','The Di Pierro Lab is focused primarily on physical genetics. We are broadly interested in the physical processes involved in the translation of genetic information. We develop novel theoretical approaches to characterize the structure and function of the genome using the tools of statistical physics, information theory, and computational modeling.','https://dipierrolab.sites.northeastern.edu/#_ga=2.100520606.1214471716.1615096785-1696423499.1564006309',1,'Physics','177 Huntington'),('Emergent Epidemics Lab','Research in the Emergent Epidemics Lab spans a broad range of topics in complex systems and network science, with an emphasis on infectious disease dynamics and forecasting/predictive models.','https://scarpino.github.io/',1,'Mathematics','Roux Institute'),('Global Resilience Institute','The Global Resilience Institute is leading a university-wide interdisciplinary effort to advance resilience-related initiatives that contribute to the security, sustainability, health, and well-being of societies.','https://globalresilience.northeastern.edu/#_ga=2.123706507.1214471716.1615096785-1696423499.1564006309',1,'Global Studies','177 Huntington'),('Helping Hands Lab','Develops perception, planning, and control algorithms for robots in built-for-human environments','https://www2.ccs.neu.edu/research/helpinghands/index.html',1,'Computer Science','Interdisciplinary Science and Engineering Center'),('Humanities Center','Through unique programming and research initiatives, the Humanities Center fosters collaboration and conversation on the significance of history, literature, and culture.','https://cssh.northeastern.edu/humanities/',0,'History','Renaissance Park'),('Institute for Health Equity and Social Justice Research','nan','https://bouve.northeastern.edu/institute-of-health-equity-social-justice-research/',1,'Health Sciences','Behrakis Health Sciences Center'),('Kar Lab','Professor Karís interests lie in the investigation of electronic, optical, and electrochemical properties of graphene and development of graphene-based applications, including energy generation and storage.','https://web.northeastern.edu/swastik/home.htm#_ga=2.87481368.1214471716.1615096785-1696423499.1564006309',0,'Physics','Egan Research Center'),('Lab for Learning and Planning in Robotics','We work on planning and reinforcement learning methods for dealing with realistic partial observable and/or multi-agent settings in autonomous systems.','https://llpr.ccs.neu.edu/#_ga=2.133092366.1214471716.1615096785-1696423499.1564006309',0,'Robotics','Interdisciplinary Science and Engineering Center'),('Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)','Polymer chemistry and engineering; biomaterials; biomedical engineering; drug delivery; tissue engineering; regenerative medicine; immunotherapy; immunoengineering; vaccines','https://web.northeastern.edu/bencheriflab/#_ga=2.133017870.1214471716.1615096785-1696423499.1564006309',0,'Chemical Engineering','Mugar Life Sciences Building'),('Lazer Lab','Explores complex research problems around social influence, social networks, and network science.','http://www.lazerlab.net/',0,'Computer Science','Richards Hall'),('Lee-Parsons Research Laboratory','This research group is applying metabolic engineering principles and methodologies to improve the production of important compounds, i.e. critical plant-derived pharmaceuticals or biofuels, from plant cell & tissue cultures and microalgae cultures.','https://web.northeastern.edu/lee-parsons/#_ga=2.136106161.1214471716.1615096785-1696423499.1564006309',0,'Chemical Engineering','Mugar Life Sciences Building'),('Lewis Lab','The Lewis Lab studies persister cells responsible for tolerance to antibiotics, uncultured bacteria of the environment and the microbiome, and works on drug discovery.','https://web.northeastern.edu/adc/#_ga=2.120958984.1214471716.1615096785-1696423499.1564006309',0,'Biology','Mugar Life Sciences Building'),('Mask Testing at Northeastern University','Environmental organic chemistry; passive sampling methods for organic contaminants in water and sediments; transport and transformation of contaminants in indoor and natural environments','https://www.masktestingatnu.com/',1,'Civil and Environmental Engineering','Snell Engineering Center'),('Mathematical Optimization modeling, Computation, and Analytics (MOCA) Lab','The overall mission of MOCA research lab is to develop problem-driven, data-informed decision models and computational tools, which provide not only mathematically optimal solutions but also practically explainable results for supporting decision-making in healthcare related applications.','https://sites.google.com/site/joechou75/moca-group',0,'Mechanical and Industrial Engineering','Snell Engineering Center'),('Mathematical, Computational and Applied Data Science (MCADS) Lab','Develops data algorithms, techniques, and methodologies to analyze and solve complex problems.','http://www.ccs.neu.edu/home/eelhami/mcadsLab.htm#_ga=2.100104222.1214471716.1615096785-1696423499.1564006309',1,'Computer Science','West Village H'),('mHealth Research Group','Invents and validates systems, methodologies, and algorithms for new mobile health applications.','https://www.mhealthgroup.org/',0,'Computer Science','177 Huntington'),('Modeling of Biological and Socio-technical Systems (MOBS) Lab','Creates models and tools to understand and anticipate large-scale complex networks and systems.','https://www.mobs-lab.org/contact.html',0,'Computer Science','177 Huntington'),('Mon(IoT)r Lab','Investigates personal information, data, and privacy risks from Internet of things (IoT) devices.','https://moniotrlab.ccis.neu.edu/#_ga=2.86954392.1214471716.1615096785-1696423499.1564006309',1,'Computer Science','Interdisciplinary Science and Engineering Center'),('National Education and Research Center for Outcomes Assesment in Healthcare (NERCOA)','The National Education and Research Center for Outcomes Assessment in Healthcare (NERCOA) was established in 1991 with funding from the United States Public Health Service.','https://bouve.northeastern.edu/pharmacy/research/nercoa/',1,'Pharmacy','140 The Fenway'),('Network Science Institute','The NSI works to discover and inspire fundamentally new ways to measure, model, predict and visualize meaningful interactions and interconnectivity of social, physical and technological systems. Faculty include: Alessandro Vespignani, Albert-Laszlo Barabasi, Dima Krioukov, Samuel Scarpino.','https://www.networkscienceinstitute.org/',1,'Network Science','177 Huntington'),('Next Generation Networks and Systems Lab (GENESYS)','Dynamic spectrum access; energy harvesting sensor networks; 5G technology; intra-body communication; protocol design for wireless','https://genesys-lab.org/',1,'Electrical and Computer Engineering','Interdisciplinary Science and Engineering Center'),('Northeastern Sensors & Nano Systems (NS&NS) Laboratory','In NS&NS Lab, we are working on the development of miniaturized, low-power and high-performance sensors and radio frequency components. We focus on understanding and exploiting the fundamental properties of micromechanical structures and advanced nanomaterials to engineer new classes of micro- and nano-electromechanical systems (MEMS/NEMS) with unique and enabling features applied to the areas of chemical, physical and biological sensing and low power reconfigurable radio communication systems.','https://web.northeastern.edu/nemslab/#_ga=2.133495054.1214471716.1615096785-1696423499.1564006309',1,'Electrical and Computer Engineering','Interdisciplinary Science and Engineering Center'),('Ondrechen Lab','Our work spans the areas of theoretical and computational chemistry, computational biology, bioinformatics, protein design, and drug discovery.','http://www.northeastern.edu/org/',0,'Biochemistry','Mugar Life Sciences Building'),('Parameswaran Lab','Harikrishnan Parameswaranís research focuses on cell-extracellular matrix interactions, force transmission in multicellular ensembles, asthma, pulmonary physiology.','https://coe.northeastern.edu/people/parameswaran-harikrishnan/',1,'Bioengineering','Interdisciplinary Science and Engineering Center'),('Pinto Lab','We investigate microbial ecosystems at the interface of infrastructure and public / environmental health with a focus on the engineered water cycle. Our goal is to characterize and manipulate microbial communities to (1) protect and improve public and environmental health and (2) improve functional reliability and economic feasibility of water infrastructure.','https://www.pintolab.com/',1,'Civil Engineering','Mugar Life Sciences Building'),('Programming Research Laboratory','Conducts research on the design, implementation, and analysis of programming languages, and more.','http://prl.ccs.neu.edu/#_ga=2.57671082.1214471716.1615096785-1696423499.1564006309',1,'Computer Science','West Village H'),('Rouhanifard Lab','Our lab uses chemical, biological and computational approaches to address both fundamental and applied questions in biology and medicine.','https://rouhanifardlab.com/',1,'Bioengineering','Interdisciplinary Science and Engineering Center'),('Shefelbine Lab','The Shefelbine Lab studies multiscale mechanics and musculoskeletal mechanobiology.','http://www.shefelbine.org/',0,'Bioengineering','Interdisciplinary Science and Engineering Center'),('Slavov Lab','Seeking principles in the coordination among protein synthesis, metabolism, cell growth and differentiation','https://slavovlab.net/',1,'Bioengineering','Mugar Life Sciences Building'),('Social Enterprise Institute','Rooted in the study of sustainable, enterprise-based solutions to global poverty, SEI aims to educate social business leaders through coursework, cooperative education, international field studies, on-campus student organizations, and service-learning programs.','https://www.northeastern.edu/sei/?_ga=2.51831521.938051176.1615096785-1442243363.1564006309',0,'Business Administration','Hayden Hall'),('Social Impact Lab','We develop experiential learning models to support our mission of preparing students for lives of purpose as ethical and effective citizen-leaders and social change agents.','https://cssh.northeastern.edu/impactlab/',1,'Human Services','Renaissance Park'),('Social Science Environmental Health Research Institute','The Social Science Environmental Health Research Institute works on the following areas: Creating Collaborations between Life Scientists and Social Scientists, Integrating Comprehensive Doctoral training in Environmental Sociology with the Sociology and Anthropology Department, Networking Environmental Health Communities with Faculty and Students for Research and Internships, Expanding Biomonitoring and Air/dust Monitoring, Including Innovative Methods of Reporting Data to Participants, and Developing, Applying, and Studying the Use of Low-cost Tools for Community-based Environmental Monitoring','https://www.northeastern.edu/environmentalhealth/#_ga=2.99024158.1214471716.1615096785-1696423499.1564006309',1,'Health Sciences','Richards Hall'),('Statistical Methods for Studies of Biomolecular Systems','Develops methods for high-throughput large-scale molecular investigations of biological organisms.','https://olga-vitek-lab.ccis.northeastern.edu/#_ga=2.65854894.1214471716.1615096785-1696423499.1564006309',1,'Data Science','West Village H'),('SunnyLand','SunnyLand applies protein chemistry, analysis and engineering to biology and medicine.','https://web.northeastern.edu/sunnyland/#_ga=2.161396797.1214471716.1615096785-1696423499.1564006309',1,'Chemistry and Chemical Biology','Hurtig Hall'),('Syngergetic Media Learning (SMILE) Lab','Researches applied machine learning, social media analytics, human-computer interaction, and more.','https://web.northeastern.edu/smilelab/#_ga=2.154459576.1214471716.1615096785-1696423499.1564006309',1,'Data Science','Richards Hall'),('Vision Lab','The Vision Laboratory employs psychophysical and computational methods to better understand visual perception.','https://web.northeastern.edu/visionlab/#_ga=2.136091953.1214471716.1615096785-1696423499.1564006309',1,'Psychology','Nightingale Hall'),('Wellness Technology Lab','Examines how novel interactive computing systems can help people to achieve wellness.','https://wellness.khoury.northeastern.edu/#_ga=2.154459576.1214471716.1615096785-1696423499.1564006309',0,'Computer Science','177 Huntington'),('Wireless Networks and Embedded Systems (WiNES) Laboratory','Modeling, optimization, and experimental evaluation of wireless networked systems; Networked implantable medical systems; Multimedia sensor networks; Secure tactical cognitive radio networks; Underwater networks; Mobile cloud computing','https://ece.northeastern.edu/wineslab/index.php#_ga=2.120566792.1214471716.1615096785-1696423499.1564006309',0,'Electrical and Computer Engineering','Interdisciplinary Science and Engineering Center');
/*!40000 ALTER TABLE `lab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_member`
--

DROP TABLE IF EXISTS `lab_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_member` (
  `username` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `degree_level` varchar(64) NOT NULL,
  `lab_name` varchar(255) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `lab_name` (`lab_name`),
  CONSTRAINT `lab_member_ibfk_1` FOREIGN KEY (`lab_name`) REFERENCES `lab` (`lab_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_member`
--

LOCK TABLES `lab_member` WRITE;
/*!40000 ALTER TABLE `lab_member` DISABLE KEYS */;
INSERT INTO `lab_member` VALUES ('A.Barab·si','Albert-L·szlÛ','Barab·si','Faculty','Center for Complex Network Research'),('A.Gates','Alexander','Gates','Faculty','Center for Complex Network Research'),('A.Iancarelli','Alessia','Iancarelli','Graduate','Affective and Brain Sciences Lab'),('A.Krotov','Aleksei','Krotov','Masters','Action Lab'),('A.Lindberg','Anders','Lindberg','Undergraduate','Apfeld Lab'),('A.Martinez','Anrea Unzueta','Martinez','PhD','Bowen Lab'),('A.Murphy','Annie','Murphy','Postdoc','Bowen Lab'),('A.Nugent','Abigail','Nugent','Undergraduate','Action Lab'),('A.Pinto','Ameet','Pinto','Faculty','Pinto Lab'),('A.Satpute','Ajay','Satpute','PhD','Affective and Brain Sciences Lab'),('A.Valencia','Angie','Valencia','Faculty','Global Resilience Institute'),('agoglia.a','Ally','Agoglia','BS','Social Enterprise Institute'),('B.Donnelly','Brian','Donnelly','PhD','Bowen Lab'),('B.Gincley','Benjamin','Gincley','PhD','Pinto Lab'),('B.Gossart','Ben','Gossart','Undergraduate','Action Lab'),('B.Salehi','Batool','Salehi','PhD','Next Generation Networks and Systems Lab (GENESYS)'),('C.Anderson','Christopher','Anderson','Post-doc','Pinto Lab'),('C.Bocanegra','Carlos','Bocanegra','PhD','Next Generation Networks and Systems Lab (GENESYS)'),('C.Mboijana','Cole','Mboijana','Undergrad','Pinto Lab'),('C.Riedl','Christoph','Riedl','Faculty','Collaborative Social Systems Lab'),('C.Yang','Chai-Huang','Yang','PhD','Emergent Epidemics Lab'),('D.Amador','Dahila','Amador','Undergraduate','Ondrechen Lab'),('D.Cohen','Dan','Cohen','Faculty','DATA Initiative'),('D.Cokely','Dennis','Cokely','PhD','Center for Atypical Language Interpreting'),('D.Doucette','Diana','Doucette','PhD','Center for Atypical Language Interpreting'),('D.Erdogmus','Deniz','Erdogmus','Professor','Ondrechen Lab'),('D.Feng','Daniel','Feng','Faculty','Cognitive Embodied Social Agents Research (CESAR) Lab'),('D.Gysi','Deisy','Gysi','Faculty','Center for Complex Network Research'),('D.Hilvert','Don','Hilvert','Professor','Ondrechen Lab'),('D.Jeong','David','Jeong','Faculty','Cognitive Embodied Social Agents Research (CESAR) Lab'),('D.Joseph','Daisha','Joseph','Undergraduate','Emergent Epidemics Lab'),('D.Roy','Debashri','Roy','Postdoc','Next Generation Networks and Systems Lab (GENESYS)'),('d.shaughnessy','Dennis','Shaughnessy','Faculty','Social Enterprise Institute'),('D.Sternad','Dagmar','Sternad','PhD','Action Lab'),('dittrich.a','Alexandra','Dittrich','BS','Social Enterprise Institute'),('E.Chen','Emily','Chen','Undergraduate','Pinto Lab'),('E.Diederich','Ellie','Diederich','Undergraduate','Affective and Brain Sciences Lab'),('E.Kramer','Erica','Kramer','PhD','Center for Atypical Language Interpreting'),('E.Micheloni','Emily','Micheloni','Graduate','Lewis Lab'),('F.Servello','Frank','Servello','Graduate','Apfeld Lab'),('fall.c','Charlotte','Fall','BS','Social Enterprise Institute'),('grun.a','Alex','Grun','BS','Social Enterprise Institute'),('H.Jimison','Holly','Jimison','PhD','Consortium on Technology for Proactive Care'),('H.Stern','Hannah','Stern','Graduate','Lewis Lab'),('H.Sullivan','Hillary','Sullivan','PhD','Bowen Lab'),('H.Wang','Hui','Wang','Faculty','Cognitive Embodied Social Agents Research (CESAR) Lab'),('I.Korogodsky','Ilana','Korogodsky','Undergraduate','Affective and Brain Sciences Lab'),('J.Agar','Jeff','Agar','Professor','Ondrechen Lab'),('J.Apfeld','Javier','Apfeld','PhD','Apfeld Lab'),('J.Bowen','Jennifer','Bowen','PhD','Emergent Epidemics Lab'),('J.Ko','Jaeju','Ko','Professor','Ondrechen Lab'),('J.LHeureux','Johanna','LHeureux','PhD','Bowen Lab'),('J.McIsaac','Jim','McIsaac','Graduate','Lewis Lab'),('J.Norris','Jodie','Norris','Graduate','Apfeld Lab'),('J.Stephens','Jennie','Stephens','Faculty','Global Resilience Institute'),('J.Sundaram','Joie','Sundaram','Undergraduate','Ondrechen Lab'),('J.Vinels','Joe','Vinels','PhD','Bowen Lab'),('K.Alemdar','K¸bra','Alemdar','PhD','Next Generation Networks and Systems Lab (GENESYS)'),('K.Barnsley','Kelton','Barnsley','PhD','Ondrechen Lab'),('K.Batt','Khushbu','Batt','PhD','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('K.Chan','Kwong','Chan','Faculty','DATA Initiative'),('K.Chowdhury','Kaushik','Chowdhury','Faculty','Next Generation Networks and Systems Lab (GENESYS)'),('K.Flaherty','Kristin','Flaherty','Postdoc','Collaborative Social Systems Lab'),('K.Lee','Kent','Lee','Postdoc','Affective and Brain Sciences Lab'),('K.Lewis','Kim','Lewis','PhD','Lewis Lab'),('K.McNally','Kerry','McNally','PhD','Bowen Lab'),('K.McVeigh','Kieran','McVeigh','Graduate','Affective and Brain Sciences Lab'),('K.Pauwels','Koen','Pauwels','Faculty','DATA Initiative'),('L.Christenson','Lauren','Christenson','Undergraduate','Affective and Brain Sciences Lab'),('L.Eggermont','Loek','Eggermont','Postdoc','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('L.Huo','Linxuan','Huo','PhD','Pinto Lab'),('L.Kankanamge','Lakindu Pathira','Kankanamge','Graduate','Lewis Lab'),('L.Ruffner','Lydia','Ruffner','Graduate','Lewis Lab'),('M.Bernstein','Mel','Bernstein','Faculty','Global Resilience Institute'),('M.Di Pierro','Michele','Di Pierro','Professor','Di Pierro Lab'),('M.Eckelman','Matthew','Eckelman','Faculty','DATA Initiative'),('M.Hong','Megan','Hong','Undergraduate','Ondrechen Lab'),('M.Kellis','Manolis','Kellis','Faculty','Center for Complex Network Research'),('M.Kos','Maciej','Kos','PhD','Consortium on Technology for Proactive Care'),('M.Ondrechen','Mary Jo','Ondrechen','PhD','Ondrechen Lab'),('M.Patterson','Mark','Patterson','Faculty','Global Resilience Institute'),('M.Pavel','Michael','Pavel','PhD','Consortium on Technology for Proactive Care'),('M.Russo','Marta','Russo','Postdoc','Action Lab'),('M.Sadeghi','Mohsen','Sadeghi','PhD','Action Lab'),('M.Shrestha','Munik','Shrestha','Postdoc','Emergent Epidemics Lab'),('M.Trumble','Max','Trumble','PhD','Ondrechen Lab'),('M.Zahedi','Mohammad Mehdi','Zahedi','PhD','Emergent Epidemics Lab'),('M.Zeevi','Michael','Zeevi','PhD','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('N.Chaudhary','Nihal','Chaudhary','Undergraduate','Affective and Brain Sciences Lab'),('N.Gong','Nathan','Gong','Undergraduate','Apfeld Lab'),('N.Lore','Nunzio','Lore','PhD','Collaborative Social Systems Lab'),('N.Patel','Niket','Patel','Undergraduate','Apfeld Lab'),('N.Yongsatianchot','Nutchanon','Yongsatianchot','Faculty','Cognitive Embodied Social Agents Research (CESAR) Lab'),('P.Anderson','Phil','Anderson','Faculty','Global Resilience Institute'),('P.Beuning','Penny','Beuning','Professor','Ondrechen Lab'),('P.Ciuccarelli','Paolo','Ciuccarelli','Faculty','DATA Initiative'),('P.Parker','Phillip','Parker','Faculty','Cognitive Embodied Social Agents Research (CESAR) Lab'),('P.Sequeira','Pedro','Sequeira','Faculty','Cognitive Embodied Social Agents Research (CESAR) Lab'),('R.Dilworth','Ryan','Dilworth','Graduate','Lewis Lab'),('R.White','Robin','White','Faculty','Global Resilience Institute'),('S.Bazzi','Salah','Bazzi','PhD','Action Lab'),('S.Bencherif','Sidi ','Bencherif','Faculty','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('S.Bond','Sabrina','Bond','Undergraduate','Action Lab'),('S.Fiedler','Stephanie','Fiedler','BA','Affective and Brain Sciences Lab'),('S.Fields','Sarah ','Fields','Graduate','Lewis Lab'),('S.Flynn','Stephen','Flynn','Faculty','Global Resilience Institute'),('S.Lyengar','Suhasini','Lyengar','PhD','Ondrechen Lab'),('S.Marsella','Stacy','Marsella','Director','Cognitive Embodied Social Agents Research (CESAR) Lab'),('S.Pickens','Scott','Pickens','Faculty','Global Resilience Institute'),('S.Stumbur','Stephanie','Stumbur','Undergraduate','Apfeld Lab'),('S.Vosloo','Solize','Vosloo','PhD','Pinto Lab'),('S.Watson','Samantha','Watson','Graduate','Lewis Lab'),('S.Westby','Samuel','Westby','PhD','Collaborative Social Systems Lab'),('szaniawski.k','Kelly','Szaniawski','BS','Social Enterprise Institute'),('T.Colombani','Thibault','Colombani','Postdoc','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('T.Hadzic','Tamara','Hadzic','Undergraduate','Emergent Epidemics Lab'),('V.Lange','V','Lange','PhD','Collaborative Social Systems Lab'),('W.Edwards','Warren','Edwards','Faculty','Global Resilience Institute'),('W.Healy','Wan','Healy','PhD','Emergent Epidemics Lab'),('X.Li','Xuangui','Li','PhD','Consortium on Technology for Proactive Care'),('Y.Bart','Yakov','Bart','Faculty','DATA Initiative'),('Y.Naderi','Yousof','Naderi','Faculty','Next Generation Networks and Systems Lab (GENESYS)'),('Y.Wang','Yiju','Wang','Graduate','Affective and Brain Sciences Lab'),('Y.Xu','Yuyan','Xu','Graduate','Apfeld Lab'),('Z.Fulker','Zach','Fulker','PhD','Collaborative Social Systems Lab'),('Z.Rogers','Zachary','Rogers','PhD','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)');
/*!40000 ALTER TABLE `lab_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pi`
--

DROP TABLE IF EXISTS `pi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pi` (
  `username` varchar(255) NOT NULL,
  `lab_name` varchar(255) NOT NULL,
  PRIMARY KEY (`username`),
  KEY `lab_name` (`lab_name`),
  CONSTRAINT `pi_ibfk_1` FOREIGN KEY (`username`) REFERENCES `lab_member` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pi_ibfk_2` FOREIGN KEY (`lab_name`) REFERENCES `lab` (`lab_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pi`
--

LOCK TABLES `pi` WRITE;
/*!40000 ALTER TABLE `pi` DISABLE KEYS */;
INSERT INTO `pi` VALUES ('D.Sternad','Action Lab'),('A.Satpute','Affective and Brain Sciences Lab'),('J.Apfeld','Apfeld Lab'),('A.Murphy','Bowen Lab'),('D.Cokely','Center for Atypical Language Interpreting'),('A.Barab·si','Center for Complex Network Research'),('S.Marsella','Cognitive Embodied Social Agents Research (CESAR) Lab'),('C.Riedl','Collaborative Social Systems Lab'),('H.Jimison','Consortium on Technology for Proactive Care'),('M.Di Pierro','Di Pierro Lab'),('J.Bowen','Emergent Epidemics Lab'),('S.Flynn','Global Resilience Institute'),('S.Bencherif','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('K.Lewis','Lewis Lab'),('K.Chowdhury','Next Generation Networks and Systems Lab (GENESYS)'),('M.Ondrechen','Ondrechen Lab'),('A.Pinto','Pinto Lab'),('d.shaughnessy','Social Enterprise Institute');
/*!40000 ALTER TABLE `pi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `title` varchar(256) NOT NULL,
  `project_description` varchar(3000) DEFAULT NULL,
  `lab_name` varchar(255) NOT NULL,
  PRIMARY KEY (`title`),
  KEY `lab_name` (`lab_name`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`lab_name`) REFERENCES `lab` (`lab_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('Aakar Innovations','Aakar Innovations specializes in low-cost sanitary pad factories. The factories provide a much-needed product and offer a means of employment for underserved communities. Currently, students are working on establishing a factory in the South African Township of Langa.','Social Enterprise Institute'),('Additive (3D Printing)','Join our team as we teach 3D printing to high schoolers! Dearborn Stem Academy is a ten minute bus ride from campus, and weíll probably be teaching either Tuesday, Wednesday, or Thursday from 12-1pm. The day of the week will be decided in a few weeks.','Social Enterprise Institute'),('Adult Communication Skills and Assessments','nan','Center for Atypical Language Interpreting'),('Animal Microbe interactions','Research on the human microbiome has taught us a tremendous amount about animal microbe interactions. Many commercially important marine organisms also have microbiomes. We are working to understand their role in organism health. ','Bowen Lab'),('Assessment of Stability in Complex Human Movements:','This research develops mathematical tools to assess dynamic stability in human trajectories that do not map onto known attractors.','Action Lab'),('Biomaterials Design','Recently, we have developed mechanically robust and syringe-injectable biomimetic cryogels. These cryogels form a new class of polymeric hydrogels with unique properties including large and interconnected pores, mechanical robustness, and injectability with shape memory properties.','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('Bioresponsive Drug Delivery','We investigate the use of stimuli-responsive polymers to alter the release profile of drugs and genetic materials from their carriers. Methods to trigger release can be used to increase the localization of chemotherapeutics within tumors and the efficiency of DNA and siRNA delivery.','Bioresponsive Drug Delivery and Tissue Engineering Lab'),('Cancer Immunotherapy','Recently, Multicellular Tumor Spheroids (MCTS) aimed to reproduce the 3D architecture of solid tumors and fill the gap between monolayer cultured cells and animal models. These 3D MCTS cultures were set up either as free-floating, microencapsulated into inert non-porous hydrogels, or embedded in mechanically-instable ECM.','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('Cataloguing membership','We are developing a genomic catalogue of microorganisms observed in drinking water systems and their metabolic potentials. This will enable an improved understanding of the impact of drinking water microbes on infrastructure and health.','Pinto Lab'),('Cellular Analogues','Molecular level control over membrane surface chemistry allows cells to alter their binding affinity. Cells dynamically control their local molecular density, diffusivity, and membrane elasticity by organizing the ensemble of lipids, sugars, and proteins on their membranes. One model system mimics leukocyte-endothelial cell adhesions by complementing the assembly of molecules on cytokine-activated endothelial cell surfaces.','Bioresponsive Drug Delivery and Tissue Engineering Lab'),('Center for Complex Network Research','investigates how networks emerge, what they look like, how they evolve and more. ','Center for Complex Network Research'),('Cognitive control in social and affective neuroscience','nan','Affective and Brain Sciences Lab'),('Cognitive Embodied Social Agents Research (CESAR) Lab','Works on computational modeling of human behavior for study and education and analysis applications','Cognitive Embodied Social Agents Research (CESAR) Lab'),('Collaborative Social Systems Lab','Explores collaboration in distributed environments using modeling, experiments and data analysis','Collaborative Social Systems Lab'),('Communication Analysis and Design Laboratory (CADLAB)','Conducts interdisciplinary work on speech communication and human-computer interaction','Communication Analysis and Design Laboratory (CADLAB)'),('Concepts and Emotion','nan','Affective and Brain Sciences Lab'),('Consortium on Technology for Proactive Care','Leverages behavioral informatics to develop affordable, technology based healthcare solutions','Action Lab'),('Controls on nitrous oxide fluxes','Nitrous oxide is a greenhouse gas with a global warming potential nearly 300x that of carbon dioxide. As we enrich our coastal waters with anthropogenic N, the question is, are we increasing N2O flux to the environment? ','Bowen Lab'),('COVID-19 modeling and wastewater surveillance','nan','Emergent Epidemics Lab'),('Cyber Resilience','GRI is at the forefront of developing the concept of Cyber Resilience and applying the relevant principles in the real world.','Global Resilience Institute'),('DATA Initiative','The Digital, Analytics, Technology and Automation Initiative is enabling a generation of intellectual leadership in the areas of digital convergence.','DATA Initiative'),('Designing microbiomes','Desigining  the microbial community on filters is a rational strategy for managing consumer exposure to drinking water microbes. Our approach is to  develop metabolic model informed process strategies to actively shape the structure and function of microorganisms in biofiltration systems.','Pinto Lab'),('Drug Discovery','We have an active natural product drug discovery program with a focus on compounds active against Gram Negative pathogens, Mycobacterium tuberculosis and Borrelia burgdorferi.','Lewis Lab'),('Enterprise Continuity and Recovery Solutions','GRI works with organizations of all types to define, refine, and test comprehensive all-hazard Enterprise Continuity and Recovery Plans that minimize impact of disruption and speed up time to operational recovery. Additionally, GRI offers comprehensive Post-Incident Assessment to support building back ìbetter and stronger.î','Global Resilience Institute'),('Examining functional activity in human brain stem nuclei using high resolution, ultra-high Field (7T) fMRI','nan','Affective and Brain Sciences Lab'),('Examining how the brain regulates aging and resilience to stress','We use the nematode C. elegans as a tractable model organism to investigate how the brain regulates aging and resilience at cellular, tissue, and organismic levels.','Apfeld Lab'),('Forensic Psychology','nan','Center for Atypical Language Interpreting'),('From Action to Interaction; Complex Object Manipulation:','This research examines human interaction with complex objects, in particular complex objects with internal dynamics. Using the exemplary task of carrying a cup of coffee we examine how interaction ensures predictability of the object dynamics.','Action Lab'),('Hospital Community Benefits','Center faculty members are using financial reports that tax-exempt hospitals are required to file with the Internal Revenue Service (I.R.S.) to examine patterns in the delivery of community benefits such as charity care and community-based health promotion activities. Using these data, Center faculty members conducted the first national assessment of community benefits provided by tax-exempt hospitals, which was published in the New England Journal of Medicine.','Center for Health Policy and Healthcare Research'),('Hospital Supply Chain','Center faculty members are conducting studies to identify best practices for managing hospital supply chains and the factors associated with supply chain management as a core competency for hospitals. Center faculty members have received funding from the Department of Veterans Affairs to study best practices and improvement opportunities for inventory management.','Center for Health Policy and Healthcare Research'),('Hospital-Physician Integration','Center faculty members have been conducting research regarding the performance implications for hospitals from employing physicians directly or through practice acquisitions. In a recently completed study, published in the journal Decision Sciences, Center faculty found hospital employment of physicians to be associated with better quality of cardiac care but that the strength of the relationship diminished for hospitals with well-developed service lines for cardiac care as determined in part by patient volumes and advanced information technology.','Center for Health Policy and Healthcare Research'),('Impacto','Help women in Chiapas, Mexico receives fair and equitable compensation for their original weaving and designs. Many of these women have little to no education and are vulnerable to intellectual property theft from large companies like Zara or H&M. ','Social Enterprise Institute'),('Integrated Resilience Enhancement Solutions','We apply a research-based methodology and set of supporting processes to provide communities and enterprises effective multi-dimensional resilience enhancing initiatives.','Global Resilience Institute'),('Interpreting for Persons with Atypical Language','nan','Center for Atypical Language Interpreting'),('Language Deprivation Syndrome','nan','Center for Atypical Language Interpreting'),('Learning and Dynamic Spectrum Access','Deep learning applications in wireless spectrum sensing, fingerprinting and access from sub-6GHz to mmWave/THz frequencies, reconfigurable radios','Next Generation Networks and Systems Lab (GENESYS)'),('Low Value Care','Center faculty are investigating health care services that offer relatively little value in terms of health benefits. A recently completed project focused on inappropriate diagnostic imaging services, funded by the National Institute for Health Care Management. In this study, center faculty have used the Massachusetts All Payer Database to to examine inappropriate diagnostic imaging based on guidelines from the American College of Radiology.','Center for Health Policy and Healthcare Research'),('Lyme Disease','Our goal is to understand the nature of PTLDS (Chronic Lyme Disease) and identify treatments for this debilitating condition. We are conducting experiments to understand the nature of persistence in Borrelia burgdorferi, and have a high-throughput drug discovery program to identify novel antimicrobials with potent and specific activity against the pathogen.','Lewis Lab'),('Medicare Quality Ratings','Center faculty members have examined the quality ratings that the Center for Medicare and Medicaid Services use for prescription drug plans participating in the Medicare Part D program. One such study published in Health Affairs investigated the influence of the socio-economic characteristics of a planís enrollees on its quality ratings for medication adherence.','Center for Health Policy and Healthcare Research'),('Model community','Aerobic nitrification is an important biological process in engineered water systems, including drinking water systems. Aerobic nitrifiers can also serve as an ideal model community to investigate ecological processes governing microbial community assembly.','Pinto Lab'),('Modeling networks and network dynamics','nan','Affective and Brain Sciences Lab'),('Networked Robotics','Systems approach to coordination and computation in unmanned aerial vehicles, aerial wireless base stations, synchronization and aerial beamforming.','Next Generation Networks and Systems Lab (GENESYS)'),('Neural basis of affective experience','nan','Affective and Brain Sciences Lab'),('Nutrient enrichment of marshes','We have spent the last ~15 years adding nutrients to salt marshes to see how they respond as part of the NSF Funded TIDE project.','Bowen Lab'),('Opioid Addiction','Center faculty members are investigating different approaches for treating and reducing the risk of opioid addiction. One study, supported by the Centers for Disease Control and Prevention, is focusing on physician prescribing practices for opioids including Suboxone, a medication used for treating opioid use disorder. Another study is supported by the Abdul Latif Jameel Poverty Action Lab at MIT and is evaluating the use of educational messaging and financial incentives for reducing the use and misuse of prescription opioid medication.','Center for Health Policy and Healthcare Research'),('Pay-for-Performance and Quality of Care','Center faculty members have conducted studies regarding the design and implementation of pay-for-performance programs for improving quality of care. In support of this research, Center faculty members have received funding from the Robert Wood Johnson Foundation and Agency for Healthcare Research and Quality.','Center for Health Policy and Healthcare Research'),('Perpetually Operating Internet of Things','Systems design and protocols forwireless RF energy harvesting, magnetic resonance and inductive energy transfer, wake-up radio and battery-less sensors.','Next Generation Networks and Systems Lab (GENESYS)'),('Persisters','Persisters are dormant variants of regular cells which are tolerant to antibiotics and responsible for recalcitrance of a variety of chronic infections, including tuberculosis and those caused by microbial biofilms. We identified a number of mechanisms for persister formation, and the first compound that kills them, acyldepsipeptide.','Lewis Lab'),('Physical Genetics ','We develop novel theoretical approaches to characterize the structure and function of the genome using the tools of statistical physics, information theory, and computational modeling.','Di Pierro Lab'),('Plant Microbe interactions','The interactions among above- and below-ground plant traits, plant species and genotypic diversity, and soil microbes are critically important for both plant success and resulting ecosystem services.','Bowen Lab'),('Restoring salt marsh ecosystem services','Restoring salt marshes often targets bringing back native marsh vegetation, but we are working to understand whether or not that process also restores nitrogen removal. ','Bowen Lab'),('Sign Language Development','nan','Center for Atypical Language Interpreting'),('Social Enterprise Institute','The Social Enterprise Institute (SEI) at Northeastern University is the hub for social entrepreneurship housed in the DíAmore-McKim School of Business. Grounded in the belief that business can be a powerful tool in helping to alleviate poverty in the developing world by utilizing enterprise based solutions, we believe we are building the next generation of global business leaders.','Social Enterprise Institute'),('The MAGIC Table: A Motion-Analysis Device for Upper-Limb Research:','Complementary to our work on predictability in human object control, this line of research examines whether the motor coordination challenges in individuals with autism are due to difficulties in prediction.','Action Lab'),('Time-series observations','We use a  time-series framework combined with integrated \'omics to obtain mechanistic information about microbial metabolism and interspecies interactions. Quantitative understanding of the ecology of the drinking water microbiome will enable development of models to predict their spatial-temporal dynamics.','Pinto Lab'),('Tissue Engineering','The goal of our research is to engineer an advanced and multi-functional preformed biomaterials which can adhere in wet environments, improve cell survival, direct angiogenesis and provide a suitable 3D biomimetic microenvironment for tissue regeneration and biointegration, be highly compressible and injectable for minimally invasive surgical implantations.','Laboratory for Advanced and Multiscale Polymeric Biomaterials (LAMP)'),('Uncultured Bacteria','Uncultured bacteria make up the majority of species on the planet, but do not grow in the lab. We developed a general method to grow these organisms by cultivation in their natural environment. In marine sediment, siderophores from neighbors serve as growth factors for uncultured bacteria. We have recently identified growth factors for uncultured bacteria from the human microbiome. We also use uncultured bacteria as a source for discovering new antibiotics.','Lewis Lab'),('Understanding marsh carbon storage','Salt marshes are highly productive ecosystems and their ability to store carbon is one way we can help fight the battle against climate change. We are working to understand what controls rates of carbon storage in marsh sediments.','Bowen Lab');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `deleted_project` AFTER DELETE ON `project` FOR EACH ROW BEGIN

DELETE FROM conducts WHERE conducts.title = OLD.title;
DELETE FROM results_in WHERE results_in.title = OLD.title;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `publication`
--

DROP TABLE IF EXISTS `publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publication` (
  `doi` varchar(256) NOT NULL,
  `title` varchar(256) NOT NULL,
  `publish_date` int NOT NULL,
  `journal` varchar(1000) NOT NULL,
  PRIMARY KEY (`doi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publication`
--

LOCK TABLES `publication` WRITE;
/*!40000 ALTER TABLE `publication` DISABLE KEYS */;
INSERT INTO `publication` VALUES ('10.1001/jamaoto.2014.3519','Clinical Vestibular Testing Assessed With Machine-Learning Algorithms',2015,'JAMA Network'),('10.1002/2016JG003484','Long-term fertilization alters the relative importance of nitrate reduction pathways in salt marsh sediments',2016,'Journal of Geophysical Research'),('10.1002/mame.201900824','Effect of polymer concentration on autoclaved cryogel properties',2020,'Macromolecular materials and engineering'),('10.1002/marc.201400278','Cell-friendly inverse opal hydrogels for cell encapsulation, drug and protein delivery, and functional nanoparticle encapsulation',2020,'National Library of Medicine'),('10.1002/pro.3416','Functional classification of protein structures by local structure matching in graph representation',2018,'The Protein Society'),('10.1007/978-1-4939-7471-9_4','What can we learn about human disease from the nematode C. elegans?',2018,'Methods in Molecular Biology'),('10.1007/978-3-030-34475-7_22','Antimicrobial hydrogels: key considerations and engineering strategies for biomedical applications',2020,'Racing for the surface'),('10.1007/978-3-319-09767-1_34','Metaphoric gestures: towards grounded mental spaces',2014,'International Conference on Intelligent Virtual Agents Conference'),('10.1007/978-3-319-41649-6_23','Integrating model-based prediction and facial expressions in the perception of emotion',2016,'International Conference on Artificial General Intelligence'),('10.1007/978-3-319-67401-8_19','Negative feedback in your face: examining the effects of proxemics and gender on learning',2017,'Intelligent Virtual Agents'),('10.1007/s10464-014-9685-8','The other side of the broken window: A methodology that translates building permits into an ecometric of investment by community members',2015,'American Journal of Community Psychology'),('10.1007/s11095-013-1238-6','Effect of ingested lipids on drug dissolution and release with concurrent digestion: a modeling approach',2013,'National Library of Medicine'),('10.1007/s11606-020-05761-x','Effects of Physician Experience, Specialty Training, and Self-Referral on Inappropriate Diagnostic Imaging',2020,'National Library of Medicine'),('10.1007/s12237-016-0067-3','Tidal Freshwater marshes harbor phylogenetically unique clades of sulfate reducers that are resistant to climate change induced salinity intrusion',2016,'Estuaries and Coasts'),('10.1007/s13346-013-0178-3','Label-Free Raman Microspectral Analysis for Comparison of Cellular Uptake and Distribution between Non-Targeted and EGFR-Targeted Biodegradable Polymeric Nanoparticles',2013,'National Library of Medicine'),('10.1007/s42524-020-0093-5','Airline Planning and Scheduling: Models and Solution Methodologies',2020,'Frontiers of Engineering Management'),('10.1016/j.artmed.2015.06.004','Removing confounding factors via constraint-based clustering: An application to finding homogeneous groups of multiple sclerosis patients',2015,'Elsevier'),('10.1016/j.artmed.2020.101806','Mixed-Integer Optimization Approach to Learning Association Rules for Unplanned ICU Transfer',2020,'Artificial Intelligence in Medicine'),('10.1016/j.biomaterials.2007.12.041','Feedback-regulated paclitaxel delivery based on poly(N,N-dimethylaminoethyl methacrylate-co-2-hydroxyethyl methacrylate) nanoparticles',2008,'Biomaterials'),('10.1016/j.biomaterials.2009.09.107','The role of antibody synergy and membrane fluidity in the vascular targeting of immunoliposomes',2010,'Science Direct'),('10.1016/j.biomaterials.2010.04.048','The effect of swelling and cationic character on gene transfection by pH-sensitive nanocarriers',2010,'Science Direct'),('10.1016/j.biomaterials.2011.08.093','Bioresponsive matrices in drug delivery',2011,'Europe PMC'),('10.1016/j.brainres.2006.01.005','Integrating automatic and controlled processes into neurocognitive models of social cognition',2006,'Elsevier'),('10.1016/j.cell.2020.02.056','The Science of Antibiotic Discovery',2020,'Cell'),('10.1016/j.conb.2012.12.012','Large-scale brain networks in affective and social neuroscience: towards an integrative functional architecture of the brain',2013,'Elsevier'),('10.1016/j.cor.2020.105049','Integrated Optimization Model and Algorithm for Pattern Generation and Selection in Logical Analysis of Data',2020,'Science Direct'),('10.1016/j.drudis.2014.05.003','Three dimensional human small intestine models for ADME-Tox studies',2014,'National Library of Medicine'),('10.1016/j.jconrel.2010.11.034','Gastrointestinal contents post-lipid ingestion: In vivo measurements and in vitro models for studying oral drug delivery',2012,'National Library of Medicine'),('10.1016/j.jenvp.2014.08.003','Caring about the community, counteracting disorder: 311 reports of public issues as expressions of territoriality',2014,'Science Direct'),('10.1016/j.neulet.2018.01.042','Deconstructing arousal into wakeful, automatic and affective varieties',2019,'Elsevier'),('10.1016/j.outlook.2017.10.008','NUCare: advancing research on technological integration for self-management in the aging population',2017,'Nursing Outlook'),('10.1016/j.respol.2021.104212','Incentives, competition, and inequality in markets for creative production',2021,'Research Policy'),('10.1016/j.scitotenv.2020.141451','Differential prevalence and host association of antimicrobial resistance traits in disinfected and non-disinfected drinking water systems',2020,'Science of the Total Environment'),('10.1016/j.ssresearch.2016.04.009','Using Small Data to Interpret Big Data: 311 Reports as Individual Contributions to Informal Social Control in Urban Neighborhoods',2016,'Science Direct'),('10.1016/j.steroids.2019.02.003','Synthesis of Benzoylbenzamide Derivatives of 17?-E-Vinyl Estradiol and Evaluation as Ligands for the Estrogen Receptor-? Ligand Binding Domain',2019,'National Library of Medicine'),('10.1016/j.tibtech.2019.09.008','Injectable cryogels for biomedical applications',2020,'Science Direct'),('10.1016/j.tics.2019.07.003','The Default Mode Networkís Role in Discrete Emotion',2019,'Elsevier'),('10.1016/j.tma.2020.07.002','The heat shock transcription factor HSF-1 protects Caenorhabditis elegans from peroxide stress',2020,'KeAi: Chinese Roots Global Impact'),('10.1016/j.wateres.2019.11528','Long solids retention times and attached growth phase favor prevalence of comammox bacteria in nitrogen removal systems',2019,'Water Research'),('10.1016/j.yebeh.2015.04.055','Cortical feature analysis and machine learning improves detection of ìMRI-negativeî focal cortical dysplasia',2015,'Elsevier'),('10.1016/S2589-7500(20)30293-4','Mask-wearing and control of SARS-CoV-2 transmission in the USA: a cross-sectional study',2021,'MedRxiv'),('10.1021/acs.biochem.7b01004.','Prediction of active site and distal residues in coli DNA polymerase III alpha polymerase activity',2018,'National Library of Medicine'),('10.1021/acs.est.0c01655','Impact of Hurricane Maria on Drinking Water Quality in Puerto Rico',2020,'Environmental Science & Technology'),('10.1021/acs.jmedchem.7b01400','In vitro and in vivo evaluation of C-11-labeled azetidine-carboxylates for imaging monoacylglycerol lipase by PET imaging studies',2018,'Medicinal Chemistry'),('10.1021/mp9003095','Immunoliposomes that target endothelium in vitro are dependent on lipid raft formation',2010,'Molecular Pharmaceutics'),('10.1021/nl902789s','Nanocarrier cross-linking density and pH sensitivity regulate intracellular gene transfer',2009,'Nano Letters'),('10.1037/ebs0000063','311 hotlines, territoriality, and the collaborative maintenance of the urban commons: Examining the intersection of a coproduction policy and evolved human behavior',2016,'APA PsychNet'),('10.1038/d41586-021-00314-6','A wealth of discovery built on the Human Genome Project ó by the numbers',2021,'Nature'),('10.1038/ncomms12881','Nutrient enrichment induces dormancy and decreases diversity of active bacteria',2016,'Nature Communicatons'),('10.1038/s41467-017-00626-0','Lineage overwhelms environmental conditions in in determining rhizosphere bacterial communities in a cosmopolitan invasive plant',2017,'Nature Communicatons'),('10.1038/s41467-020-20436-1','Make Your Crowd Smart',2020,'Sloan Management Review'),('10.1038/s41564-018-0307-3','GABA-modulating bacteria of the human gut microbiota',2019,'Nature Microbiology'),('10.1038/s41586-019-1791-1','A new antibiotic selectively kills Gram-negative pathogens',2019,'Nature'),('10.1038/s41591-020-1104-0','Crowding and the shape of COVID-19 epidemics.',2020,'Nature'),('10.1038/s41598-017-06866-w','Contextual connectivity: A framework for understanding the intrinsic dynamic architecture of large-scale functional brain netw',2017,'Scientific Reports'),('10.1038/s41598-020-57653-z','Ultra High Field fMRI of Human Superior Colliculi Activity during Affective Visual Processing',2020,'Scientific Reports'),('10.1038/s41598-020-65401-6','Real-Time Inference and Detection of Disruptive EEG Network for Epileptic Seizures',2020,'Nature'),('10.1038/s41598-020-73987-0','The SensorOverlord predicts the accuracy of measurements with ratiometric biosensors',2020,'Scientific Reports'),('10.1038/s41598-020-80091-w','Social network structure and composition in former NFL football players',2021,'Scientific Reports'),('10.1039/c3lc41366g','Spatially monitoring oxygen level in 3D microfabricated cell culture systems using optical oxygen sensing beads',2013,'National Library of Medicine'),('10.1044/2020_JSLHR-20-00357','Quantitative Assessment of Learning and Retention in Virtual Vocal Function Exercises',2020,'Journal of Speech'),('10.106/j.biopsych.2012.10.001','The Functional Neural Architecture of Self-Reports of Affective Experience',2012,'Biological Pyschiatry'),('10.1063/1.5042090','Stability and predictability in human control of complex objects',2018,'Chaos: An Interdisciplinary Journal of Nonlinear Science'),('10.1073/pnas.1306095110','Identification of discrete functional subregions of the human periaqueductal gray',2013,'Proc Natl Acad Sci'),('10.1074/jbc.RA118.005914','Tri-arginine exosite patch of caspase-6 recruits substrates for hydrolysis',2019,'Science Direct'),('10.1080/07388551.2016.1209157','Vascularization strategies for skin tissue engineering',2020,'Biomaterials Science'),('10.1080/2326263X.2014.996066','RSVP IconMessenger: icon-based brain-interfaced alternative and augmentative communication',2014,'Brain Computer Interfaces'),('10.1089/ten.TEA.2012.0153','Precise, biomimetic replication of the multiscale structure of intestinal basement membrane using chemical vapor deposition',2013,'National Library of Medicine'),('10.1093/cercor/bhs408','Distinct Regions of Prefrontal Cortex Are Associated with the Controlled Retrieval and Selection of Social Information',2013,'Cerebral Cortex'),('10.1093/cercor/bhv001','The Brain Basis of Positive and Negative Affect: Evidence from a Meta-Analysis of the Human Neuroimaging Literature',2016,'Cerebral Cortex'),('10.1093/jopart/muw046','Uncharted territoriality in coproduction: The motivations for 311 reporting',2016,'Science Direct'),('10.1093/scan/nsw104','Novel response patterns during repeated presentation of affective and neutral stimuli',2016,'Social Cognitive and Affective Neuroscience'),('10.1093/scan/nsw121','The role of language in the experience and perception of emotion: a neuroimaging meta-analysis',2016,'Social Cognitive and Affective Neuroscience'),('10.1097/HMR.0000000000000283','On the Relations between Focus, Experience, and Hospital Performance Health Care Management Review',2018,'National Library of Medicine'),('10.1097/JHM-D-17-00177','Impact of ACA Medicaid Expansion on Hospital Finance. Journal of Healthcare Management',2019,'National Library of Medicine'),('10.1101/2020.02.16.951590','Accelerating Monte Carlo modeling of structured-light-based diffuse optical imaging via photon sharing',2020,'BioRxIv'),('10.1101/2020.05.04.076315','Uncovering the genetic blueprint of the C. elegans nervous system',2020,'PNAS'),('10.1101/2020.10.08.329805','Engineering cryogels to modulate oxygen tension in reconstructed tumor microenvironments',2020,'Cancer immunology research'),('10.1101/2020.10.27.20220897','The effect of eviction moratoria on the transmission of SARS-CoV-2',2021,'MedRxiv'),('10.1109/ACII.2015.7344558','The appraisal equivalence hypothesis: verifying the domain-independence of a computational model of emotion dynamics',2015,'International Conference on Affective Computing and Intelligent Interaction (ACII)'),('10.1109/ACII.2015.7344572','Emotional perception for updating agentsí beliefs',2015,'International Conference on Affective Computing and Intelligent Interaction (ACII)'),('10.1109/ACII.2017.8273590','Assessing personality through objective behavioral sensing',2017,'IEEE'),('10.1109/ICRA.2018.8460774','Stability and Predictability in Dynamically Complex Physical Interactions',2018,'IEEE Robotics and Automation Letters'),('10.1109/INFOCOM.2018.8486207','WiFED Mobile: WiFi Friendly Energy Delivery with Mobile Distributed Beamforming',2021,'IEEE/ACM Transactions on Networking'),('10.1109/JIOT.2021.3053632','iSense: Intelligent Object Sensing and Robot Tracking through Networked Coupled Magnetic Resonant Coils',2021,'IEEE Internet of Things Journal'),('10.1109/LRA.2020.2972863','Robustness in human manipulation of dynamically complex objects through control contraction metrics',2020,'IEEE Robotics and Automation Letters'),('10.1109/MCOM.001.2000180','More is better: Data Augmentation for Channel-Resilient RF Fingerprinting',2020,'IEEE Communications Magazine'),('10.1109/TCOMM.2019.2914652','ReLy: Machine Learning for Ultra-Reliable, Low Latency Messaging in Industrial Robots',2021,'IEEE Communications Magazine'),('10.1109/TVT.2020.3042128','RF Fingerprinting Unmanned Aerial Vehicles with Non-standard Transmitter Waveforms',2020,'IEEE Transactions on Vehicular Technology'),('10.1111/1462‐2920.15453','Drift dynamics in microbial communities and effective community size',2021,'Environmental Microbiology'),('10.1126/science.aau7224','Quantifying Reputation and Success in Art',2018,'Science '),('10.1126/science.abb4218','The effect of human mobility and control measures on the COVID-19 epidemic in China.',2020,'Science'),('10.1128/mBio.01516-20','Novel Antimicrobials from Uncultured Bacteria Acting against Mycobacterium tuberculosis',2020,'American Society for Microbiology'),('10.1128/mBio.01930-19','Stochastic Variation in Expression of the Tricarboxylic Acid Cycle Produces Persister Cells',2019,'American Society for Microbiology'),('10.1128/mBio.02310-20','A Distinct Microbiome Signature in Posttreatment Lyme Disease Patients',2020,'American Society for Microbiology'),('10.1128/mSphere.00274-20','Microbial nitrogen metabolism in chloraminated drinking water reservoirs',2020,'mSphere'),('10.1145/2488388.2488435','Measuring Personalization of Web Search',2013,'Association for Computing Machinery'),('10.1145/2661334.2661339','SpeechOmeter: heads-up monitoring to improve speech clarity',2014,'Association for Computing Machinery'),('10.1145/2661334.2661422','DigitCHAT: enabling AAC input at conversational speed',2014,'Association for Computing Machinery'),('10.1145/2663716.2663744','Measuring Price Discrimination and Steering on E-commerce Web Sites',2014,'Internet Measurement Conference'),('10.1145/2815675.2815681','Peeking Beneath the Hood of Uber',2015,'Internet Measurement Conference'),('10.1145/2815675.2815714','Location, Location, Location: The Impact of Geolocation on Web Search Personalization',2015,'Internet Measurement Conference'),('10.1145/2872427.2883016','MapWatch: Detecting and Monitoring International Border Personalization on Online Maps',2016,'World Wide Web'),('10.1145/2872427.2883089','An Empirical Analysis of Algorithmic Pricing on Amazon Marketplace',2016,'World Wide Web'),('10.1145/2987443.2987469','Recommended For You: A First Look at Content Recommendation Networks',2016,'Internet Measurement Conference'),('10.1145/2998181.2998327','Bias in Online Freelance Marketplaces: Evidence from TaskRabbit and Fiverr',2017,'Association for Computing Machinery'),('10.1145/3134677','Suppressing the Search Engine Manipulation Effect (SEME)',2017,'Association for Computing Machinery'),('10.1145/3173574.3174225','Investigating the Impact of Gender on Rank in Resume Search Engines',2018,'Association for Computing Machinery'),('10.1145/3178876.3186134','On Ridesharing Competition and Accessibility: Evidence from Uber, Lyft, and Taxi',2018,'World Wide Web'),('10.1145/3274417','Auditing Partisan Audience Bias within Google Search',2018,'Association for Computing Machinery'),('10.1155/2017/4852537','Fluorinated adenosine A2A receptor antagonists inspired by Preladenant as potential cancer immunotherapeutics',2017,'Medicinal Chemistry'),('10.1158/2326-6074','engineering cryogels to modulate oxygen tension in reconstructed tumor microenvironments',2020,'American Association for Cancer Research'),('10.1159/000357369','Approaches to cell delivery: substrates and scaffolds for cell therapy',2014,'National Library of Medicine'),('10.1177/0013916513499585','Custodians and custodianship in urban neighborhoods: A methodology using reports of public issues received by a cityís 311 hotline',2015,'Sage Journal'),('10.1177/0022427815577835','Public and Private Spheres of Neighborhood Disorder: Assessing Pathways to Violence Using Large-Scale Digital Records',2015,'Journal of Research in Crime and Delinquency'),('10.1177/0033354920946788','Impact of Changes in Dental Benefits on Utilization of Emergency Departments for Non-Traumatic Dental Conditions in Massachusetts',2020,'National Library of Medicine'),('10.1177/0081175015576601','Ecometrics in the age of big data: Measuring and assessing ìbroken windowsî using administrative records',2015,'Sociological Methodology'),('10.1177/0963721414553440','Does Language Do More Than Communicate Emotion?',2015,'Psychological Science'),('10.1177/1077558718754573','Gender Differences in Hospital CEO Compensation: A National Investigation of Not-for-Profit Hospitals',2018,'National Library of Medicine'),('10.1186/s40148-020-00813-0','Disinfection systematically impacts the drinking water microbiome',2020,'Microbiomes'),('10.1257/aer.p20171126','Gender and the Dynamics of Economics Seminars',2021,'Seminar Dynamics Collective'),('10.1257/aer.p20171127','The Gender Pay Gap in Medicine: A Systematic Review',2021,'Community Resilience'),('10.1257/aer.p20171128','Resilience in the Age of Stupid',2021,'Community Resilience'),('10.1257/aer.p20171129','Will Developers Block Clean Energy Standards?',2021,'CommonWealth'),('10.1287/orsc.2018.1219','Learning from Mixed Signals in Online Innovation Communities',2018,'Organization Science '),('10.1353/hpu.2021.0016','Differences in Uptake of Low-Dose CT Scan for Lung Cancer among White and Black Adult Smokers in the United States',2017,'Academy of Management'),('10.1357/002224015815848820','Nitrogen substrate dependent nitrous oxide cycling in salt marsh sediments',2015,'Journal of Marine Research '),('10.1364/BOE.409468','Hybrid mesh and voxel based Monte Carlo algorithm for accurate and efficient photon transport modeling in complex bio-tissues',2020,'Biomed. Opt. Express'),('10.1364/BOE.411898','Light transport modeling in highly complex tissues using the implicit mesh-based Monte Carlo algorithm',2021,'Biomed. Opt. Express'),('10.1371/journal.pcbi.1003900','Rhythmic manipulation of objects with complex dynamics: Predictability over chaos',2014,'PLoS Computational Biology'),('10.1371/journal.pcbi.1004066','A Bayesian Model of Category-Specific Emotional Brain Responses',2015,'PLOS Computational Biology'),('10.1371/journal.pone.0099944','Altered goblet cell differentiation and surface mucus properties in Hirschsprung disease',2014,'National Library of Medicine'),('10.1371/journal.pone.0228487','Probing remote residues important for catalysis in Escherichia coli ornithine transcarbamoylase',2020,'PLoS ONE'),('10.1523/JNEUROSCI.1652-20.2020','Neural Encoding and Representation of Time for Sensorimotor Control and Learning',2021,'Journal of Neuroscience'),('10.1523/JNEUROSCI.2043-18.2019','Functional involvement of human periaqueductal gray and other midbrain nuclei in cognitive control',2019,'Journal of Neuroscience'),('10.1744291','Linguistic diversity in a Deaf prison population: Implications for due process.',2004,'Journal of Deaf Studies and Deaf Education'),('10.1744292','The development of Nicaraguan Sign Language via the language acquisition process.',1994,'Boston University Conference on Language Development'),('10.1744295','Assessing linguistic diversity in deaf criminal suspects',2002,'Sign Language Studies'),('10.18122/B20Q5R','Academic performance prediction in a gender-imbalanced environment',2017,'Association for Computing Machinery'),('10.3354/ame01837','Effects of short-term diel changes in environmental conditions on active microbial communities in a salt marsh pond',2017,'Aquatic Microbial Ecology'),('10.3389/fmcib.2020.601864','Episodic decrease in temperature increases mcy gene transcription and cellular microcystin in continuous cultures of Microcystis aeruginosa PCC 7806',2020,'Frontiers in Microbiology'),('10.3389/fmicb.2013.00342','Functional gene pyrosequencing and network analysis shed light on denitrifying bacteria in salt marsh sediments and their response to increased nitrogen supply',2013,'Frontiers in Microbiology'),('10.3389/fnagi.2014.00158','Velocity-curvature patterns matter in human-robot physical interaction',2014,'Robotics and Automation Letters'),('10.3389/fpsyg.2015.01860','Involvement of Sensory Regions in Affective Experience: A Meta-Analysis',2015,'Frontiers in Psychology'),('10.3390/biology7010001','Age-dependence and aging-dependence: Neuronal loss and lifespan in a C. elegans model of Parkinsons disease',2018,'Biology'),('10.3390/healthcare8020078','Adjusting Daily Inpatient Bed Allocation to Smooth Emergency Department Occupancy Variation',2020,'Healthcare'),('10.3390/polym12061233','Oxygen-releasing antibacterial nanofibrous scaffolds for tissue engineering applications',2020,'Polymers'),('10.3390/v13020146','Biological and Clinical Consequences of Integrin Binding via a Rogue RGD Motif in the SARS CoV-2 Spike Protein',2021,'Viruses'),('10.37765/ajmc.2020.88502','Regional Market Factors and Patient Experience in Primary Care',2020,'The American Journal of Managed Care'),('10.3987/COM-18-S(T)50','A Practical Synthesis of Glycinamide Ribonucleotide',2018,'Heterocycles'),('10.4269/ajtmh.20-1502','Seeding COVID-19 across sub-Saharan Africa: an analysis of reported importation events across 40 countries.',2021,'MedRxiv'),('10.5555/2615731.2615857','Gesture generation with low-dimensional embeddings',2014,'Autonomous Agents & Multiagent Systems '),('10.5555/2936924.2937063','Do as i say, not as i do: challenges in delegating decisions to automated agents',2016,'Autonomous Agents & Multiagent Systems '),('10.5555/3091125.3091240','Is it just me?: evaluating attribution of negative feedback as a function of virtual instructorís gender and proxemics',2017,'Autonomous Agents & Multiagent Systems '),('10.7287/peerj.preprints.3017v1','Fighting fungi with fungi: the mycobiome contribution to emerging disease in amphibians',2017,'Frontiers in Microbiology'),('10.7554/eLife.56186','Caenorhabditis elegans processes sensory information to choose between freeloading and self-defense strategies',2020,'eLife'),('10.97816428','White Patriarchy Wonít Solve the Climate Crisis: Antiracist, Feminist Leadership Is What We Need Right Now',2021,'Community Resilience'),('11.0302-C002.indd','The Neuroscience of Goal-Directed Behavior',2011,'Psychology Press'),('2017 :1587-1590','Can accelerometry data improve estimates of heart rate variability from wrist pulse PPG sensors?',2017,'IEEE Engineering in Medicine and Biology Society');
/*!40000 ALTER TABLE `publication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results_in`
--

DROP TABLE IF EXISTS `results_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results_in` (
  `title` varchar(256) NOT NULL,
  `doi` varchar(128) NOT NULL,
  KEY `title` (`title`),
  KEY `doi` (`doi`),
  CONSTRAINT `results_in_ibfk_1` FOREIGN KEY (`title`) REFERENCES `project` (`title`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `results_in_ibfk_2` FOREIGN KEY (`doi`) REFERENCES `publication` (`doi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results_in`
--

LOCK TABLES `results_in` WRITE;
/*!40000 ALTER TABLE `results_in` DISABLE KEYS */;
INSERT INTO `results_in` VALUES ('Center for Complex Network Research','10.1038/d41586-021-00314-6'),('Center for Complex Network Research','10.1038/s41598-020-80091-w'),('Center for Complex Network Research','10.1101/2020.05.04.076315'),('Cognitive Embodied Social Agents Research (CESAR) Lab','10.5555/3091125.3091240'),('Cognitive Embodied Social Agents Research (CESAR) Lab','10.1109/ACII.2017.8273590'),('Cognitive Embodied Social Agents Research (CESAR) Lab','10.1007/978-3-319-67401-8_19'),('Cognitive Embodied Social Agents Research (CESAR) Lab','10.1007/978-3-319-41649-6_23'),('Cognitive Embodied Social Agents Research (CESAR) Lab','10.5555/2936924.2937063'),('Cognitive Embodied Social Agents Research (CESAR) Lab','10.1109/ACII.2015.7344572'),('Cognitive Embodied Social Agents Research (CESAR) Lab','10.1109/ACII.2015.7344558'),('Cognitive Embodied Social Agents Research (CESAR) Lab','10.5555/2615731.2615857'),('Cognitive Embodied Social Agents Research (CESAR) Lab','10.1007/978-3-319-09767-1_34'),('Collaborative Social Systems Lab','10.1016/j.respol.2021.104212'),('Collaborative Social Systems Lab','10.1038/s41467-020-20436-1'),('Collaborative Social Systems Lab','10.1126/science.aau7224'),('Collaborative Social Systems Lab','10.1287/orsc.2018.1219'),('Communication Analysis and Design Laboratory (CADLAB)','10.1080/2326263X.2014.996066'),('Communication Analysis and Design Laboratory (CADLAB)','10.1145/2661334.2661422'),('Communication Analysis and Design Laboratory (CADLAB)','10.1145/2661334.2661339'),('Consortium on Technology for Proactive Care','2017 :1587-1590'),('Consortium on Technology for Proactive Care','10.1016/j.outlook.2017.10.008'),('Consortium on Technology for Proactive Care','10.1523/JNEUROSCI.1652-20.2020'),('From Action to Interaction; Complex Object Manipulation:','10.1371/journal.pcbi.1003900'),('From Action to Interaction; Complex Object Manipulation:','10.3389/fnagi.2014.00158'),('Assessment of Stability in Complex Human Movements:','10.1109/LRA.2020.2972863'),('Assessment of Stability in Complex Human Movements:','10.1063/1.5042090'),('Assessment of Stability in Complex Human Movements:','10.1109/ICRA.2018.8460774'),('The MAGIC Table: A Motion-Analysis Device for Upper-Limb Research:','10.1044/2020_JSLHR-20-00357'),('Examining functional activity in human brain stem nuclei using high resolution, ultra-high Field (7T) fMRI','10.1523/JNEUROSCI.2043-18.2019'),('Examining functional activity in human brain stem nuclei using high resolution, ultra-high Field (7T) fMRI','10.1016/j.neulet.2018.01.042'),('Examining functional activity in human brain stem nuclei using high resolution, ultra-high Field (7T) fMRI','10.1073/pnas.1306095110'),('Examining functional activity in human brain stem nuclei using high resolution, ultra-high Field (7T) fMRI','10.1038/s41598-020-57653-z'),('Neural basis of affective experience','10.1093/scan/nsw104'),('Neural basis of affective experience','10.106/j.biopsych.2012.10.001'),('Neural basis of affective experience','10.1093/cercor/bhv001'),('Neural basis of affective experience','10.3389/fpsyg.2015.01860'),('Cognitive control in social and affective neuroscience','10.1016/j.brainres.2006.01.005'),('Cognitive control in social and affective neuroscience','11.0302-C002.indd'),('Cognitive control in social and affective neuroscience','10.1093/cercor/bhs408'),('Concepts and Emotion','10.1016/j.tics.2019.07.003'),('Concepts and Emotion','10.1093/scan/nsw121'),('Concepts and Emotion','10.1371/journal.pcbi.1004066'),('Concepts and Emotion','10.1177/0963721414553440'),('Examining how the brain regulates aging and resilience to stress','10.1038/s41598-020-73987-0'),('Examining how the brain regulates aging and resilience to stress','10.1016/j.tma.2020.07.002'),('Examining how the brain regulates aging and resilience to stress','10.7554/eLife.56186'),('Examining how the brain regulates aging and resilience to stress','10.1007/978-1-4939-7471-9_4'),('Examining how the brain regulates aging and resilience to stress','10.3390/biology7010001'),('Lyme Disease','10.1128/mBio.02310-20'),('Uncultured Bacteria','10.1128/mBio.01516-20'),('Drug Discovery','10.1016/j.cell.2020.02.056'),('Drug Discovery','10.1038/s41586-019-1791-1'),('Persisters','10.1128/mBio.01930-19'),('Uncultured Bacteria','10.1038/s41564-018-0307-3'),('Nutrient enrichment of marshes','10.1038/ncomms12881'),('Nutrient enrichment of marshes','10.1007/s12237-016-0067-3'),('Nutrient enrichment of marshes','10.3389/fmicb.2013.00342'),('Restoring salt marsh ecosystem services','10.3354/ame01837'),('Controls on nitrous oxide fluxes','10.1002/2016JG003484'),('Controls on nitrous oxide fluxes','10.1357/002224015815848820'),('Plant Microbe interactions','10.1038/s41467-017-00626-0'),('Animal Microbe interactions','10.7287/peerj.preprints.3017v1'),('COVID-19 modeling and wastewater surveillance','10.4269/ajtmh.20-1502'),('COVID-19 modeling and wastewater surveillance','10.1101/2020.10.27.20220897'),('COVID-19 modeling and wastewater surveillance','10.1016/S2589-7500(20)30293-4'),('COVID-19 modeling and wastewater surveillance','10.1038/s41591-020-1104-0'),('COVID-19 modeling and wastewater surveillance','10.1126/science.abb4218'),('Cellular Analogues','10.1021/mp9003095'),('Cellular Analogues','10.1016/j.biomaterials.2009.09.107'),('Bioresponsive Drug Delivery','10.1016/j.biomaterials.2011.08.093'),('Bioresponsive Drug Delivery','10.1016/j.biomaterials.2010.04.048'),('Bioresponsive Drug Delivery','10.1021/nl902789s'),('Bioresponsive Drug Delivery','10.1016/j.biomaterials.2007.12.041'),('Biomaterials Design','10.1002/marc.201400278'),('Biomaterials Design','10.1016/j.tibtech.2019.09.008'),('Biomaterials Design','10.1158/2326-6074'),('Biomaterials Design','10.1007/978-3-030-34475-7_22'),('Tissue Engineering','10.1002/mame.201900824'),('Cancer Immunotherapy','10.1101/2020.10.08.329805'),('Cancer Immunotherapy','10.3390/polym12061233'),('Tissue Engineering','10.1080/07388551.2016.1209157'),('Learning and Dynamic Spectrum Access','10.1109/INFOCOM.2018.8486207'),('Perpetually Operating Internet of Things','10.1109/TCOMM.2019.2914652'),('Networked Robotics','10.1109/JIOT.2021.3053632'),('Networked Robotics','10.1109/TVT.2020.3042128'),('Perpetually Operating Internet of Things','10.1109/MCOM.001.2000180'),('Hospital Community Benefits','10.1364/BOE.411898'),('Pay-for-Performance and Quality of Care','10.1364/BOE.409468'),('Hospital Supply Chain','10.1101/2020.02.16.951590'),('Opioid Addiction','10.1097/HMR.0000000000000283'),('Hospital-Physician Integration','10.1353/hpu.2021.0016'),('Medicare Quality Ratings','10.37765/ajmc.2020.88502'),('Low Value Care','10.1177/0033354920946788'),('Hospital Community Benefits','10.1007/s11606-020-05761-x'),('Pay-for-Performance and Quality of Care','10.1177/1077558718754573'),('Hospital Supply Chain','10.1097/JHM-D-17-00177'),('Sign Language Development','10.1744292'),('Forensic Psychology','10.1744291'),('Forensic Psychology','10.1744295'),('Integrated Resilience Enhancement Solutions','10.97816428'),('Enterprise Continuity and Recovery Solutions','10.1257/aer.p20171126'),('Enterprise Continuity and Recovery Solutions','10.1257/aer.p20171127'),('Enterprise Continuity and Recovery Solutions','10.1257/aer.p20171128'),('Cyber Resilience','10.1257/aer.p20171129'),('Integrated Resilience Enhancement Solutions','10.3390/v13020146'),('Time-series observations','10.1111/1462‐2920.15453'),('Time-series observations','10.1021/acs.est.0c01655'),('Time-series observations','10.1186/s40148-020-00813-0'),('Designing microbiomes','10.1016/j.wateres.2019.11528'),('Cataloguing membership','10.3389/fmcib.2020.601864'),('Cataloguing membership','10.1128/mSphere.00274-20'),('Model community','10.1016/j.scitotenv.2020.141451');
/*!40000 ALTER TABLE `results_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nulabs'
--

--
-- Dumping routines for database 'nulabs'
--
/*!50003 DROP FUNCTION IF EXISTS `get_college` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_college`(username VARCHAR(255)) RETURNS varchar(16) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE pi_building VARCHAR(255);
    DECLARE result VARCHAR(16);
    DECLARE pi_lab VARCHAR(255);
	SELECT get_lab(username) INTO pi_lab;
    SELECT building_name FROM lab l WHERE l.lab_name = pi_lab INTO pi_building;
    SELECT college_name FROM building b WHERE b.building_name = pi_building INTO result;
    RETURN result;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_lab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_lab`(username VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN 
		DECLARE pi_lab VARCHAR(255);
        SELECT lab_name FROM pi p WHERE p.username = username INTO pi_lab;
        RETURN pi_lab;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_member` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_member`(IN title VARCHAR(256), IN s_username VARCHAR(255), IN pi_username VARCHAR(255))
BEGIN
	DECLARE pi_lab VARCHAR(255);
		SELECT get_lab(pi_username) INTO pi_lab;
	INSERT INTO conducts VALUES (s_username, title, pi_lab);
    UPDATE lab_member m
    SET m.lab_name = pi_lab
    WHERE m.username = s_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_publication_to_project` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_publication_to_project`(IN doi VARCHAR(256), IN title VARCHAR(256), 
IN publish_date INT, IN journal VARCHAR(1000), IN project_title VARCHAR(256))
BEGIN
	INSERT INTO publication VALUES (doi, title, publish_date, journal);
	INSERT INTO results_in VALUES (project_title, doi);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_student`(IN username VARCHAR(255), IN first_name varchar(255), IN last_name VARCHAR(255), IN degree_level VARCHAR(64), IN lab_name VARCHAR(255))
BEGIN
INSERT INTO lab_member values (username, first_name, last_name, degree_level, lab_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_lab` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_lab`(IN lab_name VARCHAR(255), IN lab_description VARCHAR(3000), IN website VARCHAR(1000), 
IN recruiting_status TINYINT, IN department VARCHAR(255), IN building_name VARCHAR(255))
BEGIN
	INSERT INTO lab VALUES (lab_name, lab_description, website, recruiting_status, department, building_name);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_lab_building` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_lab_building`(IN building_name VARCHAR(255), IN street VARCHAR(255), IN username VARCHAR(255))
BEGIN
    DECLARE admin_college VARCHAR(255);
	
    SELECT college_name FROM administrator a WHERE a.username = username INTO admin_college;
    
    INSERT INTO building values (building_name, street, admin_college);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_project` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_project`(IN title VARCHAR(256), IN project_description VARCHAR(3000), IN lab_name VARCHAR(255))
BEGIN
INSERT INTO project VALUES (title, project_description, lab_name);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_member` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_member`(IN title VARCHAR(256), IN s_username VARCHAR(255), IN pi_username VARCHAR(255))
BEGIN
	DECLARE pi_lab VARCHAR(255);
		SELECT get_lab(pi_username) INTO pi_lab;
	DELETE FROM conducts c
    WHERE c.username = s_username AND 
    c.title = title;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_project` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_project`(IN project_title VARCHAR(256))
BEGIN
	DELETE FROM project p WHERE p.title = project_title;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_admin_building_names` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_admin_building_names`(IN username VARCHAR(255))
BEGIN
    DECLARE admin_college VARCHAR(255);
    
	SELECT college_name FROM administrator a WHERE a.username = username INTO admin_college;
    SELECT building_name FROM building b WHERE b.college_name = admin_college;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_building_names` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_building_names`()
BEGIN
    SELECT building_name from building;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_labs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_labs`(IN username VARCHAR(255))
BEGIN
	DECLARE admin_college VARCHAR(255);
    
	SELECT college_name FROM administrator a WHERE a.username = username INTO admin_college;
	SELECT l.* FROM building b JOIN lab l ON b.building_name = l.building_name WHERE b.college_name = admin_college order by l.lab_name;

	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pi_labmember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pi_labmember`(IN username VARCHAR(255))
BEGIN
		DECLARE pi_lab VARCHAR(255);
		SELECT get_lab(username) INTO pi_lab;
        
        SELECT * FROM conducts c WHERE c.lab_name = pi_lab;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pi_projects` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pi_projects`(IN username VARCHAR(255))
BEGIN
		DECLARE pi_lab VARCHAR(255);
		SELECT get_lab(username) INTO pi_lab;
        
        SELECT * FROM project p WHERE p.lab_name = pi_lab;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pi_publication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pi_publication`(IN username VARCHAR(255))
BEGIN
		DECLARE pi_lab VARCHAR(255);
		SELECT get_lab(username) INTO pi_lab;
        SELECT * FROM publication WHERE publication.doi IN (
			SELECT doi FROM results_in WHERE results_in.title IN 
			(SELECT title FROM project p WHERE p.lab_name = pi_lab));
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_description` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_description`(IN title VARCHAR(256), IN project_description VARCHAR(3000))
BEGIN

UPDATE project p
	SET p.project_description = project_description
	WHERE p.title = title; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_lab_building_street` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_lab_building_street`(IN building_name VARCHAR(255), IN street VARCHAR(255))
BEGIN
	UPDATE building b
    SET b.street = street 
    WHERE b.building_name = building_name;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-01 22:11:02
