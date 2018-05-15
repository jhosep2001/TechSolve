-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-05-2018 a las 03:39:53
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vuelos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int(12) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `nacimiento` date NOT NULL,
  `codigoVuelo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `nombre`, `documento`, `nacimiento`, `codigoVuelo`) VALUES
(1, 'Jhosep Granda', '1152710916', '1998-01-20', 'EX-123'),
(3, 'Gloria', '121212', '2018-05-03', 'EX-123'),
(10, 'Roberto Afortunado', '102030', '1966-12-01', 'EX-3001'),
(11, 'Juan Carlos Granda', '209812', '1978-05-21', 'EX-123'),
(14, 'Jhosep', '1152710916', '3897-01-31', 'CA-12312'),
(15, 'Rocio', 'Berrio', '3892-02-22', 'EX-123'),
(16, 'Thomas Alberto Rodriguez', '392919', '3888-08-12', 'EX-123'),
(18, 'Angie', '9801203320', '3897-05-10', 'EX-123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelos`
--

CREATE TABLE `vuelos` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `código` varchar(20) NOT NULL,
  `descripcion` text NOT NULL,
  `asientos` int(5) NOT NULL,
  `Precio` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vuelos`
--

INSERT INTO `vuelos` (`id`, `fecha`, `código`, `descripcion`, `asientos`, `Precio`) VALUES
(1, '2018-05-18', 'CA-12312', 'Vuelo que parte desde la ciudad de Medellín con dirección Bogota. Hora de despegue: 8:00 PM', 123, 150000),
(2, '2018-05-26', 'EX-123', 'Vuelo que parte desde la ciudad de Medellín con dirección Madrid,España. Hora de despegue: 8:00 AM', 10, 2000000),
(3, '2018-05-16', 'EX-3001', 'Vuelo exclusivo para primeras 2 reservas, con dirección Cancun,Mexico. Hora de despegue : 12:00 PM', 2, 160000),
(4, '2018-05-18', 'CA2-3021', 'Vuelo que parte desde la ciudad de Medellín, aeropuerto Jose Maria Cordoba con dirección a la ciudad de Cali, Hora de despegue: 6:00PM', 50, 80000),
(5, '2018-05-01', 'AL2-321', 'Vuelo que parte desde la ciudad de Medellín, aeropuerto Jose Maria Cordoba con dirección a la ciudad de Santa Marta, Hora de despegue: 6:00AM', 50, 500000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `códigovuelo` (`codigoVuelo`);

--
-- Indices de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `código` (`código`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `vuelos`
--
ALTER TABLE `vuelos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `códigovuelo` FOREIGN KEY (`codigoVuelo`) REFERENCES `vuelos` (`código`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
