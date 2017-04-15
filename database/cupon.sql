-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-04-2017 a las 03:57:16
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cupon`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oferta`
--

CREATE TABLE `oferta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `condiciones` text NOT NULL,
  `ruta_foto` varchar(255) NOT NULL COMMENT 'solo guarda ruta de la foto',
  `precio` decimal(10,0) NOT NULL COMMENT 'en euros',
  `descuento` decimal(10,0) NOT NULL COMMENT 'en euros, no en porcentaje',
  `fecha_publicacion` datetime NOT NULL,
  `fecha_expiracion` datetime NOT NULL,
  `compras` int(11) NOT NULL COMMENT 'contador de las ventas realizadas',
  `umbral` int(11) NOT NULL COMMENT 'compras minimas para que se active la oferta',
  `revisada` tinyint(1) NOT NULL,
  `ciudad_id` int(11) NOT NULL COMMENT 'relacion 1:n',
  `tienda_id` int(11) NOT NULL COMMENT 'relacion 1:n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tienda`
--

CREATE TABLE `tienda` (
  `id` int(11) NOT NULL COMMENT 'clave primaria',
  `nombre` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `login` varchar(10) NOT NULL COMMENT 'nombre de usuario para acceder a extranet',
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL COMMENT 'valor aleatorio para codificar la contraseña',
  `descripcion` text NOT NULL,
  `direccion` text NOT NULL,
  `ciudad_id` int(11) NOT NULL COMMENT 'relacion 1:n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `direccion` text NOT NULL,
  `permite_email` tinyint(1) NOT NULL COMMENT 'indica si el usuario permite comunicaciones publicitarias',
  `fecha_alta` datetime NOT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  `dni` varchar(9) NOT NULL COMMENT 'documento nacional de identidad',
  `numero_tarjeta` varchar(20) NOT NULL COMMENT 'numero de la tarjeta de credito',
  `ciudad_id` int(11) NOT NULL COMMENT 'relacion 1:n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `fecha` datetime NOT NULL,
  `oferta_id` int(11) NOT NULL COMMENT 'relacion 1:n',
  `usuario_id` int(11) NOT NULL COMMENT 'relacion 1:n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oferta`
--
ALTER TABLE `oferta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `oferta`
--
ALTER TABLE `oferta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tienda`
--
ALTER TABLE `tienda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'clave primaria';
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
