CREATE DATABASE  IF NOT EXISTS `pdv_sistema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pdv_sistema`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: pdv_sistema
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `buzon_quejas`
--

DROP TABLE IF EXISTS `buzon_quejas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buzon_quejas` (
  `id_queja` int NOT NULL AUTO_INCREMENT,
  `mensaje` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_queja`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buzon_quejas`
--

LOCK TABLES `buzon_quejas` WRITE;
/*!40000 ALTER TABLE `buzon_quejas` DISABLE KEYS */;
INSERT INTO `buzon_quejas` VALUES (1,'Prueba','2026-10-04 20:40:49'),(2,'i0p9uyo8tuikujtdhfjgklkhgjmcfnnghfjk','2026-10-05 14:47:51'),(3,'No sirve esta porqueria (yo la hice)','2026-10-18 05:28:54');
/*!40000 ALTER TABLE `buzon_quejas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogo_anadidos`
--

DROP TABLE IF EXISTS `catalogo_anadidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo_anadidos` (
  `id_anadido` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio_extra` decimal(10,2) NOT NULL DEFAULT '0.00',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_anadido`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo_anadidos`
--

LOCK TABLES `catalogo_anadidos` WRITE;
/*!40000 ALTER TABLE `catalogo_anadidos` DISABLE KEYS */;
INSERT INTO `catalogo_anadidos` VALUES (6,'Leche Deslactosada',10.00,1),(7,'Leche de Avena / Almendra',15.00,1),(8,'Shot Extra de Espresso',15.00,1),(9,'Crema Batida',10.00,1),(10,'Jarabe (Vainilla / Caramelo)',12.00,1);
/*!40000 ALTER TABLE `catalogo_anadidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icono` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '☕',
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '#d4af37',
  `orden` int DEFAULT '0',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Café Caliente','☕','#8D6E63',1,'2026-10-14 06:01:23'),(2,'Café Frío','?','#5C6BC0',2,'2026-10-14 06:01:23'),(3,'Smoothies & Frappés','?','#26A69A',3,'2026-10-14 06:01:23'),(4,'Postres','?','#EC407A',4,'2026-10-14 06:01:23');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ventas` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int DEFAULT NULL,
  `nombre_producto` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamano_elegido` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detalles_extras` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`) ON DELETE CASCADE,
  CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ventas`
--

LOCK TABLES `detalle_ventas` WRITE;
/*!40000 ALTER TABLE `detalle_ventas` DISABLE KEYS */;
INSERT INTO `detalle_ventas` VALUES (1,27,1,'Capuchino',NULL,'',2,50.00,100.00),(2,28,1,'Capuchino','Mediano','sin leche',1,55.00,55.00),(3,29,3,'Oreo','Mediano','Sin azucar',1,55.00,55.00),(4,29,1,'Capuchino','Grande','Sin leche',1,70.00,70.00),(5,30,3,'Oreo','Grande','',1,65.00,65.00),(6,30,1,'Capuchino','Grande','Sin azucar',2,70.00,140.00),(7,31,1,'Capuchino','Chico','Jarabe (Vainilla / Caramelo) (+$12)',1,57.00,57.00),(8,32,1,'Capuchino','Grande','',1,70.00,70.00),(9,33,3,'Oreo','Chico','',1,45.00,45.00),(10,34,3,'Oreo','Grande','',1,65.00,65.00),(11,34,1,'Capuchino','Grande','',1,70.00,70.00),(12,35,1,'Capuchino','Grande','',1,70.00,70.00),(13,35,3,'Oreo','Grande','',1,65.00,65.00),(14,35,1,'Capuchino','Chico','',1,45.00,45.00),(15,36,1,'Capuchino','Chico','',10,45.00,450.00);
/*!40000 ALTER TABLE `detalle_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fondos_caja`
--

DROP TABLE IF EXISTS `fondos_caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fondos_caja` (
  `id_fondo` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `monto_inicial` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fecha` date NOT NULL,
  `fecha_hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_fondo`),
  UNIQUE KEY `unique_usuario_fecha` (`id_usuario`,`fecha`),
  CONSTRAINT `fondos_caja_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fondos_caja`
--

LOCK TABLES `fondos_caja` WRITE;
/*!40000 ALTER TABLE `fondos_caja` DISABLE KEYS */;
INSERT INTO `fondos_caja` VALUES (1,2,500.00,'2026-10-15','2026-10-16 03:33:25'),(2,1,0.00,'2026-10-15','2026-10-16 03:42:51'),(3,9,500.00,'2026-10-17','2026-10-17 07:17:38');
/*!40000 ALTER TABLE `fondos_caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos`
--

DROP TABLE IF EXISTS `gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gastos` (
  `id_gasto` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_gasto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos`
--

LOCK TABLES `gastos` WRITE;
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
INSERT INTO `gastos` VALUES (1,1,'Luz',6000.00,'2026-09-28 21:32:18'),(2,1,'Huevo',500.00,'2026-10-14 06:55:36');
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos_modificadores`
--

DROP TABLE IF EXISTS `grupos_modificadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos_modificadores` (
  `id_grupo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `es_obligatorio` tinyint(1) DEFAULT '0',
  `seleccion_multiple` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos_modificadores`
--

LOCK TABLES `grupos_modificadores` WRITE;
/*!40000 ALTER TABLE `grupos_modificadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupos_modificadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones_modificadores`
--

DROP TABLE IF EXISTS `opciones_modificadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opciones_modificadores` (
  `id_opcion` int NOT NULL AUTO_INCREMENT,
  `id_grupo` int NOT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio_extra` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id_opcion`),
  KEY `id_grupo` (`id_grupo`),
  CONSTRAINT `opciones_modificadores_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `grupos_modificadores` (`id_grupo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones_modificadores`
--

LOCK TABLES `opciones_modificadores` WRITE;
/*!40000 ALTER TABLE `opciones_modificadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `opciones_modificadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_anadidos`
--

DROP TABLE IF EXISTS `producto_anadidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_anadidos` (
  `id_producto` int NOT NULL,
  `id_anadido` int NOT NULL,
  PRIMARY KEY (`id_producto`,`id_anadido`),
  KEY `id_anadido` (`id_anadido`),
  CONSTRAINT `producto_anadidos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE,
  CONSTRAINT `producto_anadidos_ibfk_2` FOREIGN KEY (`id_anadido`) REFERENCES `catalogo_anadidos` (`id_anadido`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_anadidos`
--

LOCK TABLES `producto_anadidos` WRITE;
/*!40000 ALTER TABLE `producto_anadidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_anadidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_tamanos`
--

DROP TABLE IF EXISTS `producto_tamanos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_tamanos` (
  `id_tamano` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `nombre_tamano` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `orden` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tamano`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `producto_tamanos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_tamanos`
--

LOCK TABLES `producto_tamanos` WRITE;
/*!40000 ALTER TABLE `producto_tamanos` DISABLE KEYS */;
INSERT INTO `producto_tamanos` VALUES (9,3,'Chico',45.00,1),(10,3,'Mediano',55.00,2),(11,3,'Grande',65.00,3),(12,1,'Chico',45.00,1),(13,1,'Mediano',55.00,2),(14,1,'Grande',70.00,3);
/*!40000 ALTER TABLE `producto_tamanos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `codigo_interno` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `costo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `precio_venta` decimal(10,2) NOT NULL DEFAULT '0.00',
  `imagen_url` longtext COLLATE utf8mb4_unicode_ci,
  `tiene_tamanos` tinyint(1) NOT NULL DEFAULT '0',
  `stock` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `codigo_interno` (`codigo_interno`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,'MEL-343C9E','Capuchino','bibhb',50.00,45.00,'http://127.0.0.1:8000/uploads/prod_718f90d711.jpeg',1,29),(3,3,'MEL-1ACB5E','Oreo','hiui',100.00,45.00,'http://127.0.0.1:8000/uploads/prod_40b3eebab3.jpg',1,36);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` enum('admin','empleado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'empleado',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Admin Principal','secreto123','admin','2026-09-15 18:35:43'),(2,'Cajero 1','cajero123','empleado','2026-09-15 18:35:43'),(5,'Cajero 2','12345','empleado','2026-09-16 16:43:04'),(6,'Cajero 3','cajero123','empleado','2026-09-16 16:43:19'),(9,'admin','admin123','admin','2026-10-14 06:01:23');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `cliente_nombre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'Mostrador',
  `tipo_orden` enum('aqui','llevar') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'aqui',
  `total` decimal(10,2) NOT NULL,
  `metodo_pago` enum('efectivo','tarjeta','mixto') COLLATE utf8mb4_unicode_ci NOT NULL,
  `monto_efectivo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `monto_tarjeta` decimal(10,2) NOT NULL DEFAULT '0.00',
  `estado_barra` enum('pendiente','listo') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pendiente',
  `fecha_hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_venta`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,2,'Mostrador','aqui',60.00,'efectivo',60.00,0.00,'pendiente','2026-09-16 16:05:25'),(2,5,'Mostrador','aqui',112.00,'efectivo',112.00,0.00,'pendiente','2026-09-16 16:56:37'),(3,5,'Mostrador','aqui',52.00,'efectivo',52.00,0.00,'pendiente','2026-09-16 17:14:13'),(4,5,'Mostrador','aqui',118.00,'efectivo',118.00,0.00,'pendiente','2026-09-16 17:14:29'),(5,6,'Mostrador','aqui',22.00,'efectivo',22.00,0.00,'pendiente','2026-09-16 17:15:02'),(6,5,'Mostrador','aqui',52.00,'efectivo',52.00,0.00,'pendiente','2026-09-16 21:30:54'),(7,5,'Mostrador','aqui',116.48,'tarjeta',0.00,116.48,'pendiente','2026-09-16 21:31:06'),(8,2,'Mostrador','aqui',52.00,'efectivo',52.00,0.00,'pendiente','2026-09-28 21:55:35'),(9,2,'Mostrador','aqui',22.88,'tarjeta',0.00,22.88,'pendiente','2026-09-28 21:55:41'),(10,2,'Mostrador','aqui',74.00,'efectivo',74.00,0.00,'pendiente','2026-10-04 16:34:52'),(11,2,'Mostrador','aqui',31.20,'tarjeta',0.00,31.20,'pendiente','2026-10-04 16:35:12'),(12,2,'Mostrador','aqui',82.00,'efectivo',82.00,0.00,'pendiente','2026-10-04 16:43:44'),(13,2,'Mostrador','aqui',22.00,'efectivo',22.00,0.00,'pendiente','2026-10-04 16:48:18'),(14,2,'Mostrador','aqui',52.00,'efectivo',52.00,0.00,'pendiente','2026-10-04 18:55:09'),(16,2,'Mostrador','aqui',50.00,'efectivo',50.00,0.00,'pendiente','2026-10-05 14:45:25'),(17,2,'Mostrador','aqui',130.00,'efectivo',130.00,0.00,'pendiente','2026-10-05 15:13:58'),(18,2,'Mostrador','aqui',20.80,'tarjeta',0.00,20.80,'pendiente','2026-10-05 15:14:13'),(19,2,'Mostrador','aqui',100.00,'efectivo',100.00,0.00,'pendiente','2026-10-05 15:39:46'),(20,5,'Mostrador','aqui',130.00,'efectivo',130.00,0.00,'pendiente','2026-10-05 15:40:23'),(21,5,'Mostrador','aqui',93.60,'tarjeta',0.00,93.60,'pendiente','2026-10-05 15:40:58'),(22,5,'Mostrador','aqui',83.20,'tarjeta',0.00,83.20,'pendiente','2026-10-05 15:41:52'),(23,2,'Mostrador','aqui',83.20,'tarjeta',0.00,83.20,'pendiente','2026-10-05 20:35:16'),(24,2,'Mostrador','aqui',187.20,'tarjeta',0.00,187.20,'pendiente','2026-10-05 20:35:34'),(25,2,'Mostrador','aqui',20.00,'efectivo',20.00,0.00,'pendiente','2026-10-05 20:36:20'),(26,2,'Mostrador','aqui',50.00,'efectivo',50.00,0.00,'pendiente','2026-10-05 20:36:45'),(27,5,'Mostrador','aqui',100.00,'efectivo',100.00,0.00,'pendiente','2026-10-14 06:18:59'),(28,5,'Mostrador','aqui',55.00,'efectivo',55.00,0.00,'pendiente','2026-10-14 06:25:24'),(29,5,'Mostrador','aqui',125.00,'efectivo',125.00,0.00,'pendiente','2026-10-14 06:57:09'),(30,2,'Mostrador','aqui',205.00,'efectivo',205.00,0.00,'pendiente','2026-10-15 06:43:43'),(31,2,'Mostrador','aqui',57.00,'efectivo',57.00,0.00,'pendiente','2026-10-16 03:34:13'),(32,2,'Mostrador','llevar',70.00,'efectivo',70.00,0.00,'pendiente','2026-10-16 03:34:43'),(33,1,'Rafael','llevar',45.00,'efectivo',45.00,0.00,'pendiente','2026-10-16 03:43:53'),(34,9,'RAFAEL','aqui',135.00,'efectivo',135.00,0.00,'listo','2026-10-17 07:18:06'),(35,9,'Rafael','llevar',183.20,'mixto',100.00,83.20,'listo','2026-10-18 05:23:17'),(36,9,'Ing. Pedro','aqui',468.00,'tarjeta',0.00,468.00,'listo','2026-10-18 05:23:51');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-17 23:59:40
