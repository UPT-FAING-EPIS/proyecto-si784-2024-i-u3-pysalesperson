-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.32-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.7.0.6850
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sis_venta_test
CREATE DATABASE IF NOT EXISTS `sis_venta_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `sis_venta_test`;

-- Volcando estructura para tabla sis_venta_test.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla sis_venta_test.cliente: ~1 rows (aproximadamente)
REPLACE INTO `cliente` (`idcliente`, `nombre`, `telefono`, `direccion`, `usuario_id`, `estado`) VALUES
	(1, 'Cliente de Prueba', '123456789', 'Dirección de Prueba', 1, 0);

-- Volcando estructura para tabla sis_venta_test.configuracion
CREATE TABLE IF NOT EXISTS `configuracion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla sis_venta_test.configuracion: ~1 rows (aproximadamente)
REPLACE INTO `configuracion` (`id`, `nombre`, `telefono`, `email`, `direccion`) VALUES
	(1, 'Nueva Empresa', '987654321', 'nuevo@empresa.com', 'Nueva Dirección');

-- Volcando estructura para tabla sis_venta_test.detalle_permisos
CREATE TABLE IF NOT EXISTS `detalle_permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_permiso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_venta_test.detalle_permisos: ~6 rows (aproximadamente)
REPLACE INTO `detalle_permisos` (`id`, `id_permiso`, `id_usuario`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 3, 1),
	(4, 4, 1),
	(5, 5, 1),
	(6, 6, 1);

-- Volcando estructura para tabla sis_venta_test.detalle_temp
CREATE TABLE IF NOT EXISTS `detalle_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` varchar(50) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla sis_venta_test.detalle_temp: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sis_venta_test.detalle_venta
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_venta_test.detalle_venta: ~16 rows (aproximadamente)
REPLACE INTO `detalle_venta` (`id`, `id_producto`, `id_venta`, `cantidad`, `precio`) VALUES
	(1, 4, 1, 2, 13.00),
	(2, 3, 1, 1, 16.00),
	(3, 4, 2, 3, 13.00),
	(4, 7, 3, 2, 5.00),
	(5, 6, 4, 1, 14.25),
	(6, 1, 5, 1, 15.00),
	(7, 1, 6, 1, 15.00),
	(8, 32, 6, 1, 1.00),
	(9, 31, 7, 1, 15.00),
	(10, 1, 7, 1, 15.00),
	(11, 33, 8, 1, 15.50),
	(12, 1, 9, 1, 15.00),
	(13, 1, 10, 1, 15.00),
	(14, 31, 11, 2, 15.00),
	(15, 2, 12, 1, 20.50),
	(16, 6, 13, 2, 14.25);

-- Volcando estructura para tabla sis_venta_test.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_venta_test.permisos: ~6 rows (aproximadamente)
REPLACE INTO `permisos` (`id`, `nombre`) VALUES
	(1, 'configuración'),
	(2, 'usuarios'),
	(3, 'clientes'),
	(4, 'productos'),
	(5, 'ventas'),
	(6, 'nueva_venta');

-- Volcando estructura para tabla sis_venta_test.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `codproducto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `existencia` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`codproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla sis_venta_test.producto: ~1 rows (aproximadamente)
REPLACE INTO `producto` (`codproducto`, `codigo`, `descripcion`, `precio`, `existencia`, `usuario_id`, `estado`) VALUES
	(1, '123456', 'Producto de Prueba', 100.00, 10, 1, 0);

-- Volcando estructura para tabla sis_venta_test.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla sis_venta_test.usuario: ~1 rows (aproximadamente)
REPLACE INTO `usuario` (`idusuario`, `nombre`, `correo`, `usuario`, `clave`, `estado`) VALUES
	(1, 'Aaron Pedro Paco Ramos', 'ppacoramos@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1);

-- Volcando estructura para tabla sis_venta_test.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sis_venta_test.ventas: ~10 rows (aproximadamente)
REPLACE INTO `ventas` (`id`, `id_cliente`, `total`, `id_usuario`, `fecha`) VALUES
	(4, 2, 14.25, 1, '2023-07-02 22:57:34'),
	(5, 4, 15.00, 1, '2023-07-02 23:04:56'),
	(6, 4, 16.00, 1, '2023-09-11 02:55:12'),
	(7, 4, 30.00, 1, '2023-09-11 03:01:34'),
	(8, 4, 15.50, 1, '2023-09-11 03:02:57'),
	(9, 4, 15.00, 1, '2023-11-06 15:49:04'),
	(10, 4, 15.00, 1, '2023-11-06 15:49:32'),
	(11, 4, 30.00, 1, '2023-12-01 05:17:02'),
	(12, 1, 20.50, 1, '2024-06-11 16:20:15'),
	(13, 7, 28.50, 1, '2024-06-11 16:24:16');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
