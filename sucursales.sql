-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2022 a las 23:11:27
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sucursales`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_orden` (IN `_sucursales_id` INT(11), IN `_ordenes_fecha` VARCHAR(100), `_ordenes_total` VARCHAR(100))  INSERT INTO `ordenes` (`ordenes_id`, `sucursales_id`, `ordenes_fecha`, `ordenes_total`) VALUES (NULL,  _sucursales_id, _ordenes_fecha,  _ordenes_total )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_producto` (IN `ordenId` INT(11), IN `_codigo` VARCHAR(200), `_descripcion` VARCHAR(200), IN `_precio` DECIMAL(50,0))  INSERT INTO `productos` (`producto_id`, `orden_id`, `producto_codig`, `producto_descripcion`, `producto_precio`) VALUES 
(NULL, ordenId,_codigo, _descripcion, _precio)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `create_sucursal` (IN `Nombre_s` VARCHAR(100))  INSERT INTO SUCURSALES (sucursal_nombre) VALUES (Nombre_s)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_orden` (IN `_id` INT(11))  DELETE FROM `ordenes` WHERE `ordenes`.`ordenes_id` = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_producto` (IN `_id` INT(11))  DELETE FROM `productos` WHERE `productos`.`producto_id` =_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_sucursal` (IN `_id` INT(11))  DELETE FROM `sucursales` WHERE `sucursales`.`sucursal_id` = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_ordenes` ()  select * from ordenes$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_productos` ()  select * from productos$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `show_sucursales` ()  SELECT * FROM sucursales$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_orden` (IN `_ordenes_id` INT(11), IN `_sucursales_id` INT(11), IN `_ordenes_fecha` VARCHAR(100), `_ordenes_total` VARCHAR(100))  UPDATE `ordenes` SET 
`sucursales_id` = _sucursales_id,
`ordenes_fecha` =  _ordenes_fecha,
`ordenes_total` = _ordenes_total

WHERE `ordenes`.`ordenes_id` =  _ordenes_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_producto` (IN `productoId` INT(11), IN `ordenId` INT(11), IN `_codigo` VARCHAR(200), IN `_descripcion` VARCHAR(200), IN `_precio` DECIMAL(50,0))  UPDATE `productos` SET
`orden_id` = ordenId,
`producto_codig` =  _codigo,
`producto_descripcion` =  _descripcion,
`producto_precio` = _precio 

WHERE `productos`.`producto_id` = productoId$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_sucursal` (IN `_id` INT(11), IN `_nombre` VARCHAR(100))  UPDATE `sucursales` SET `sucursal_nombre` = _nombre WHERE `sucursales`.`sucursal_id` = _id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `ordenes_id` int(11) NOT NULL,
  `sucursales_id` int(11) NOT NULL,
  `ordenes_fecha` varchar(100) NOT NULL,
  `ordenes_total` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`ordenes_id`, `sucursales_id`, `ordenes_fecha`, `ordenes_total`) VALUES
(1, 12, '06/07/2022', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `producto_codig` varchar(200) NOT NULL,
  `producto_descripcion` varchar(200) NOT NULL,
  `producto_precio` decimal(50,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `orden_id`, `producto_codig`, `producto_descripcion`, `producto_precio`) VALUES
(6, 1, '18156', 'Esmeriladora angular', '625'),
(7, 1, '17193', 'Pala redonda-', '100');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `sucursal_id` int(11) NOT NULL,
  `sucursal_nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`sucursal_id`, `sucursal_nombre`) VALUES
(12, 'sucursal CDMX');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`ordenes_id`),
  ADD KEY `sucursales_id` (`sucursales_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `orden_id` (`orden_id`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`sucursal_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `ordenes_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `sucursal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`sucursales_id`) REFERENCES `sucursales` (`sucursal_id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`ordenes_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
