-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2020 a las 20:29:05
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbvkoalas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbcertificaciones`
--

CREATE TABLE `tbcertificaciones` (
  `ID_Certificacion` int(11) NOT NULL,
  `Nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbcertificaciones`
--

INSERT INTO `tbcertificaciones` (`ID_Certificacion`, `Nombre`, `Descripcion`) VALUES
(1, 'No Aplica', 'No Aplica'),
(2, 'Pais', 'Descripcion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbcitas`
--

CREATE TABLE `tbcitas` (
  `ID_Cita` int(11) NOT NULL,
  `ID_Mascota` int(11) NOT NULL,
  `Descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `FechaCita` datetime NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbcitas`
--

INSERT INTO `tbcitas` (`ID_Cita`, `ID_Mascota`, `Descripcion`, `FechaCita`, `FechaCreacion`) VALUES
(1, 1, 'Necesito un cambio de look de mi mascota', '2020-08-17 00:00:00', '2020-08-14 02:13:11'),
(2, 1, 'sadjkgjkhsadgbsadsda', '2020-10-12 10:10:00', '2020-10-08 18:21:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbclientes`
--

CREATE TABLE `tbclientes` (
  `ID_Cliente` int(11) NOT NULL,
  `ID_Municipio` int(11) NOT NULL,
  `ID_Sexo` int(11) NOT NULL,
  `Nombre` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `Dui` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Nit` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `NoRegistro` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Correo` varchar(75) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `FechaIngreso` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbclientes`
--

INSERT INTO `tbclientes` (`ID_Cliente`, `ID_Municipio`, `ID_Sexo`, `Nombre`, `Apellido`, `Dui`, `Nit`, `NoRegistro`, `FechaNacimiento`, `Correo`, `Telefono`, `Direccion`, `FechaIngreso`) VALUES
(8, 1, 1, 'Bryan', 'Rauda', '12345678-9', '123456-789654-11-5', '12354-6', '2020-07-07', 'ashkdgahs@kjsaghdad.com', '1234-5678', 'casa', '2020-07-23 23:31:14'),
(9, 1, 1, 'Juan', 'Alberto', '123698-9', '1232456-859-5654-6', '4565487-9', '1999-08-19', 'jashdg@aksjda.com', '1234-5678', 'kajhsdgqwyhdbsakjhdbc', '2020-07-23 23:52:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbdepartamentos`
--

CREATE TABLE `tbdepartamentos` (
  `ID_Departamento` int(11) NOT NULL,
  `ID_Pais` int(11) NOT NULL,
  `Departamento` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbdepartamentos`
--

INSERT INTO `tbdepartamentos` (`ID_Departamento`, `ID_Pais`, `Departamento`) VALUES
(1, 1, 'La Libertad'),
(2, 1, 'San Salvador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbdetallecertificacion`
--

CREATE TABLE `tbdetallecertificacion` (
  `ID_DetalleCertificacion` int(11) NOT NULL,
  `ID_Certificacion` int(11) NOT NULL,
  `ID_DetalleServicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbdetallecitas`
--

CREATE TABLE `tbdetallecitas` (
  `ID_DetalleCita` int(11) NOT NULL,
  `ID_Cita` int(11) NOT NULL,
  `ID_DetalleServicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbdetallecitas`
--

INSERT INTO `tbdetallecitas` (`ID_DetalleCita`, `ID_Cita`, `ID_DetalleServicio`) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 1, 5),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbdetallefactura`
--

CREATE TABLE `tbdetallefactura` (
  `ID_DetalleFactura` int(11) NOT NULL,
  `ID_Factura` int(11) NOT NULL,
  `ID_Precio` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbdetallefactura`
--

INSERT INTO `tbdetallefactura` (`ID_DetalleFactura`, `ID_Factura`, `ID_Precio`, `ID_Producto`, `Cantidad`, `Precio`) VALUES
(1, 1, NULL, 3, 15, 7.5),
(2, 2, 1, NULL, 2, 50),
(3, 3, 1, NULL, 2, 50),
(4, 4, NULL, 4, 15, 33.75),
(5, 4, NULL, 4, 5, 17.5),
(6, 5, 1, NULL, 12, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbdetallepublicaciones`
--

CREATE TABLE `tbdetallepublicaciones` (
  `ID_DetallePublicacion` int(11) NOT NULL,
  `ID_Publicacion` int(11) NOT NULL,
  `Subtitulo` text COLLATE utf8_spanish_ci NOT NULL,
  `Parrafo` text COLLATE utf8_spanish_ci NOT NULL,
  `NombreArchivo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `UrlArchivo` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbdetalleservicio`
--

CREATE TABLE `tbdetalleservicio` (
  `ID_DetalleServicio` int(11) NOT NULL,
  `ID_Servicio` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `Costo` float NOT NULL,
  `Precio` float NOT NULL,
  `TiempoDuracion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbdetalleservicio`
--

INSERT INTO `tbdetalleservicio` (`ID_DetalleServicio`, `ID_Servicio`, `Nombre`, `Descripcion`, `Costo`, `Precio`, `TiempoDuracion`) VALUES
(1, 1, 'Corte Moderado', 'En este corte solo se baja un poco el pelo de la mascota y casi no se nota', 2, 5, 5),
(2, 1, 'Corte Medio', 'Este corte es un poco mas notable en la mascota', 4, 10, 9),
(3, 1, 'Corte Personalizado', 'Este corte es personalizado y puede notarse mucho o notarse muy poco', 7, 15, 15),
(4, 2, 'Limpieza de pelaje', 'Limpia el pelo y las patitas de la mascota', 2, 5, 5),
(5, 2, 'Limpieza de dientes', 'a la mascota se le limpian los dientes a profundidad', 3, 7, 3),
(6, 2, 'Limpieza perianal', 'Se limpian a profundidad las partes de la mascota', 5, 15, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbespecies`
--

CREATE TABLE `tbespecies` (
  `ID_Especie` int(11) NOT NULL,
  `Especie` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbespecies`
--

INSERT INTO `tbespecies` (`ID_Especie`, `Especie`) VALUES
(1, 'Perro'),
(2, 'Gato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbfacturas`
--

CREATE TABLE `tbfacturas` (
  `ID_Factura` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `ID_TipoFactura` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `Cliente` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Fecha` date NOT NULL,
  `NoFactura` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `CantidadLetras` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbfacturas`
--

INSERT INTO `tbfacturas` (`ID_Factura`, `ID_Usuario`, `ID_TipoFactura`, `ID_Cliente`, `Cliente`, `Fecha`, `NoFactura`, `CantidadLetras`, `FechaCreacion`) VALUES
(1, 2, 6, NULL, 'Koalas', '2020-08-31', '123456', '', '2020-08-19 02:04:08'),
(2, 2, 1, NULL, 'Juan Diego', '2020-08-31', '1', '', '2020-08-19 02:08:38'),
(3, 2, 1, NULL, 'Juan Diego', '2020-08-31', '1', '', '2020-08-19 02:09:06'),
(4, 2, 6, NULL, 'Koalas', '2020-08-23', '136598775', '', '2020-08-20 12:52:16'),
(5, 2, 1, NULL, 'Bryan Rauda', '2020-10-08', '321654561654654', '', '2020-10-08 18:08:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbkardex`
--

CREATE TABLE `tbkardex` (
  `ID_Kardex` int(11) NOT NULL,
  `ID_DetalleFactura` int(11) NOT NULL,
  `ID_TipoMovimiento` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `CostoPromedio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbkardex`
--

INSERT INTO `tbkardex` (`ID_Kardex`, `ID_DetalleFactura`, `ID_TipoMovimiento`, `Cantidad`, `CostoPromedio`) VALUES
(1, 1, 1, 15, 0.5),
(2, 3, 2, 13, 0.133333),
(3, 4, 1, 15, 2.25),
(4, 5, 1, 20, 8.41667),
(5, 6, 2, 1, 3600.13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbmarcas`
--

CREATE TABLE `tbmarcas` (
  `ID_Marca` int(11) NOT NULL,
  `Marca` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbmarcas`
--

INSERT INTO `tbmarcas` (`ID_Marca`, `Marca`) VALUES
(1, 'Marca 1'),
(2, 'Marca 4'),
(3, 'Marca 3'),
(4, 'marca 54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbmascotas`
--

CREATE TABLE `tbmascotas` (
  `ID_Mascota` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `ID_Especie` int(11) NOT NULL,
  `ID_Sexo` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbmascotas`
--

INSERT INTO `tbmascotas` (`ID_Mascota`, `ID_Cliente`, `ID_Especie`, `ID_Sexo`, `Nombre`, `FechaNacimiento`, `FechaCreacion`) VALUES
(1, 8, 2, 1, 'michi', '2020-07-06', '2020-07-23 23:40:35'),
(2, 8, 2, 2, 'Kira', '2010-06-25', '2020-07-23 23:44:10'),
(3, 9, 1, 1, 'ruper', '2020-07-12', '2020-07-23 23:53:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbmunicipios`
--

CREATE TABLE `tbmunicipios` (
  `ID_Municipio` int(11) NOT NULL,
  `ID_Certificacion` int(11) NOT NULL,
  `ID_Departamento` int(11) NOT NULL,
  `Municipio` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbmunicipios`
--

INSERT INTO `tbmunicipios` (`ID_Municipio`, `ID_Certificacion`, `ID_Departamento`, `Municipio`) VALUES
(1, 1, 1, 'Santa Tecla'),
(2, 1, 2, 'mexicanos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbpaises`
--

CREATE TABLE `tbpaises` (
  `ID_Pais` int(11) NOT NULL,
  `Pais` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Nacionalidad` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbpaises`
--

INSERT INTO `tbpaises` (`ID_Pais`, `Pais`, `Nacionalidad`) VALUES
(1, 'El Salvador', 'Salvadoreño'),
(2, 'Honduras', 'Hondureño');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbprecios`
--

CREATE TABLE `tbprecios` (
  `ID_Precio` int(11) NOT NULL,
  `ID_Producto` int(11) NOT NULL,
  `ID_UnidadMedida` int(11) NOT NULL,
  `Precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbprecios`
--

INSERT INTO `tbprecios` (`ID_Precio`, `ID_Producto`, `ID_UnidadMedida`, `Precio`) VALUES
(1, 3, 1, 25),
(2, 3, 2, 75),
(3, 3, 3, 5.6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbproductos`
--

CREATE TABLE `tbproductos` (
  `ID_Producto` int(11) NOT NULL,
  `ID_Marca` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `ID_TipoProducto` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `FechaVencimiento` date NOT NULL,
  `Descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `Stock` int(11) NOT NULL,
  `CostoPromedio` float NOT NULL,
  `NombreImagen` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `UrlImagen` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbproductos`
--

INSERT INTO `tbproductos` (`ID_Producto`, `ID_Marca`, `ID_Usuario`, `ID_TipoProducto`, `Nombre`, `FechaVencimiento`, `Descripcion`, `Stock`, `CostoPromedio`, `NombreImagen`, `UrlImagen`, `FechaCreacion`) VALUES
(3, 2, 1, 2, 'Pelota', '2020-07-08', 'Pelota para perro', 1, 3600.13, 'img1096999235', 'assets/files/img1096999235.png', '2020-07-29 02:11:41'),
(4, 4, 2, 1, 'Comida para perro', '2020-08-31', 'descripcion', 20, 8.41667, 'img79901714', 'assets/files/img79901714.png', '2020-08-19 01:51:02'),
(5, 2, 2, 1, 'Comida Gato', '2020-08-28', 'descirpcion de comida', 0, 0, 'img2116126546', 'assets/files/img2116126546.png', '2020-08-19 01:52:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbpublicaciones`
--

CREATE TABLE `tbpublicaciones` (
  `ID_Publicacion` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `Titulo` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbpublicaciones`
--

INSERT INTO `tbpublicaciones` (`ID_Publicacion`, `ID_Usuario`, `Titulo`, `Descripcion`, `FechaCreacion`) VALUES
(2, 1, 'Titulo publicacion', 'Descripcion de publicacion', '2020-08-13 01:40:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbservicios`
--

CREATE TABLE `tbservicios` (
  `ID_Servicio` int(11) NOT NULL,
  `ID_TipoServicio` int(11) NOT NULL,
  `ID_Usuario` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `FechaCreacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbservicios`
--

INSERT INTO `tbservicios` (`ID_Servicio`, `ID_TipoServicio`, `ID_Usuario`, `Nombre`, `Descripcion`, `FechaCreacion`) VALUES
(1, 5, 1, 'Corte de pelo', 'La mascota tendra un corte de pelo que puede variar segun las necesidades', '2020-08-14 02:06:05'),
(2, 6, 2, 'Baño de mascota', 'Baño de mascota ', '2020-08-14 02:09:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbsexos`
--

CREATE TABLE `tbsexos` (
  `ID_Sexo` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbsexos`
--

INSERT INTO `tbsexos` (`ID_Sexo`, `Nombre`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbtiposervicio`
--

CREATE TABLE `tbtiposervicio` (
  `ID_TipoServicio` int(11) NOT NULL,
  `TipoServicio` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbtiposervicio`
--

INSERT INTO `tbtiposervicio` (`ID_TipoServicio`, `TipoServicio`) VALUES
(1, 'Jugueterias'),
(2, 'Hotel'),
(3, 'Clinica'),
(4, 'Casas'),
(5, 'Peluqueria'),
(6, 'Limpieza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbtiposfacturas`
--

CREATE TABLE `tbtiposfacturas` (
  `ID_TipoFactura` int(11) NOT NULL,
  `TipoFactura` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbtiposfacturas`
--

INSERT INTO `tbtiposfacturas` (`ID_TipoFactura`, `TipoFactura`) VALUES
(1, 'Cosumidor Final'),
(2, 'Credito Fiscal'),
(3, 'Nota de Remision'),
(4, 'Nota de Credito'),
(5, 'Nota de Debito'),
(6, 'Compra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbtiposmovimientos`
--

CREATE TABLE `tbtiposmovimientos` (
  `ID_TipoMovimiento` int(11) NOT NULL,
  `Movimiento` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbtiposmovimientos`
--

INSERT INTO `tbtiposmovimientos` (`ID_TipoMovimiento`, `Movimiento`) VALUES
(1, 'Entradas'),
(2, 'Salida'),
(3, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbtiposproductos`
--

CREATE TABLE `tbtiposproductos` (
  `ID_TipoProducto` int(11) NOT NULL,
  `TipoProducto` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbtiposproductos`
--

INSERT INTO `tbtiposproductos` (`ID_TipoProducto`, `TipoProducto`) VALUES
(1, 'Comidas'),
(2, 'Juguete'),
(3, 'Servicio'),
(4, 'Medicina'),
(5, 'Ropas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbunidadesmedidas`
--

CREATE TABLE `tbunidadesmedidas` (
  `ID_UnidadMedida` int(11) NOT NULL,
  `Unidad` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbunidadesmedidas`
--

INSERT INTO `tbunidadesmedidas` (`ID_UnidadMedida`, `Unidad`) VALUES
(1, 'Unidad'),
(2, 'Paquete'),
(3, 'Libra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbusuarios`
--

CREATE TABLE `tbusuarios` (
  `ID_Usuario` int(11) NOT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Apellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Usuario` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `Password` text COLLATE utf8_spanish_ci NOT NULL,
  `TipoUsuario` int(11) NOT NULL COMMENT '1 = Administrador, 2 = Empleado, 3 = Usuario',
  `FechaCreacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbusuarios`
--

INSERT INTO `tbusuarios` (`ID_Usuario`, `Nombre`, `Apellido`, `Usuario`, `Password`, `TipoUsuario`, `FechaCreacion`) VALUES
(1, 'Daniel', 'Quevedo', 'dquevedo', '$2y$12$fI1.iXF60w5xEp3tq4bI/uqghxgeGacURi/I4pUXRvsF/RpW6of4S', 1, '2020-07-24 00:08:41'),
(2, 'Administrador', 'Koala', 'admin', '$2y$12$EwhhSCZ8xPIHs6D0EAoo2.WAwyIJiq9qdxzX7ThmmkBcs.FnEp6uW', 1, '2020-08-13 01:48:14'),
(3, 'Danilo', 'Marquez', 'dmarquez', '$2y$12$wU8JMw9qmfU7JPaRDxZjm.OTmQJzFobGfQvCkjIRZTbh7TUQKErL.', 2, '2020-08-13 23:55:32'),
(4, 'Diana', 'Garay', 'dgaray', '$2y$12$x6aeMlc0eGnRgSFk1Xsm0eHGvRCDoi6IXLZyWR1EfHWee2ax4yezy', 3, '2020-08-14 00:28:38'),
(5, 'Juan', 'Diego', 'jdiego', '$2y$12$1NeIdePMKAqDm4MI3wL7mOcmCAUR9tOw9A2WdbOL4R6chJzGLAQT.', 3, '2020-08-14 01:53:29'),
(6, 'Steven', 'Hernandez', 'shernandez', '$2y$12$ZT53UTb8dXjUV779nJosAOIVVmzvd/0RYs5KaZoOdYxexdzoZRPBO', 2, '2020-08-14 02:27:43');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbcertificaciones`
--
ALTER TABLE `tbcertificaciones`
  ADD PRIMARY KEY (`ID_Certificacion`);

--
-- Indices de la tabla `tbcitas`
--
ALTER TABLE `tbcitas`
  ADD PRIMARY KEY (`ID_Cita`),
  ADD KEY `ID_Mascota` (`ID_Mascota`);

--
-- Indices de la tabla `tbclientes`
--
ALTER TABLE `tbclientes`
  ADD PRIMARY KEY (`ID_Cliente`),
  ADD KEY `ID_Municipio` (`ID_Municipio`),
  ADD KEY `ID_Sexo` (`ID_Sexo`);

--
-- Indices de la tabla `tbdepartamentos`
--
ALTER TABLE `tbdepartamentos`
  ADD KEY `ID_Departamento` (`ID_Departamento`),
  ADD KEY `ID_Pais` (`ID_Pais`);

--
-- Indices de la tabla `tbdetallecertificacion`
--
ALTER TABLE `tbdetallecertificacion`
  ADD PRIMARY KEY (`ID_DetalleCertificacion`),
  ADD KEY `ID_Certificacion` (`ID_Certificacion`),
  ADD KEY `ID_DetalleServicio` (`ID_DetalleServicio`);

--
-- Indices de la tabla `tbdetallecitas`
--
ALTER TABLE `tbdetallecitas`
  ADD PRIMARY KEY (`ID_DetalleCita`),
  ADD KEY `ID_Cita` (`ID_Cita`),
  ADD KEY `ID_DetalleServicio` (`ID_DetalleServicio`);

--
-- Indices de la tabla `tbdetallefactura`
--
ALTER TABLE `tbdetallefactura`
  ADD PRIMARY KEY (`ID_DetalleFactura`),
  ADD KEY `ID_Precio` (`ID_Precio`),
  ADD KEY `ID_Factura` (`ID_Factura`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `tbdetallepublicaciones`
--
ALTER TABLE `tbdetallepublicaciones`
  ADD PRIMARY KEY (`ID_DetallePublicacion`),
  ADD KEY `ID_Publicacion` (`ID_Publicacion`);

--
-- Indices de la tabla `tbdetalleservicio`
--
ALTER TABLE `tbdetalleservicio`
  ADD PRIMARY KEY (`ID_DetalleServicio`),
  ADD KEY `ID_Servicio` (`ID_Servicio`);

--
-- Indices de la tabla `tbespecies`
--
ALTER TABLE `tbespecies`
  ADD PRIMARY KEY (`ID_Especie`);

--
-- Indices de la tabla `tbfacturas`
--
ALTER TABLE `tbfacturas`
  ADD PRIMARY KEY (`ID_Factura`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_TipoFactura` (`ID_TipoFactura`),
  ADD KEY `ID_Cliente` (`ID_Cliente`);

--
-- Indices de la tabla `tbkardex`
--
ALTER TABLE `tbkardex`
  ADD PRIMARY KEY (`ID_Kardex`),
  ADD KEY `ID_DetalleFactura` (`ID_DetalleFactura`),
  ADD KEY `ID_TipoMovimiento` (`ID_TipoMovimiento`);

--
-- Indices de la tabla `tbmarcas`
--
ALTER TABLE `tbmarcas`
  ADD PRIMARY KEY (`ID_Marca`);

--
-- Indices de la tabla `tbmascotas`
--
ALTER TABLE `tbmascotas`
  ADD PRIMARY KEY (`ID_Mascota`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Especie` (`ID_Especie`),
  ADD KEY `ID_Sexo` (`ID_Sexo`);

--
-- Indices de la tabla `tbmunicipios`
--
ALTER TABLE `tbmunicipios`
  ADD PRIMARY KEY (`ID_Municipio`),
  ADD KEY `ID_Certificacion` (`ID_Certificacion`),
  ADD KEY `ID_Departamento` (`ID_Departamento`);

--
-- Indices de la tabla `tbpaises`
--
ALTER TABLE `tbpaises`
  ADD PRIMARY KEY (`ID_Pais`);

--
-- Indices de la tabla `tbprecios`
--
ALTER TABLE `tbprecios`
  ADD PRIMARY KEY (`ID_Precio`),
  ADD KEY `ID_Producto` (`ID_Producto`),
  ADD KEY `ID_UnidadMedida` (`ID_UnidadMedida`);

--
-- Indices de la tabla `tbproductos`
--
ALTER TABLE `tbproductos`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `ID_Marca` (`ID_Marca`),
  ADD KEY `ID_Usuario` (`ID_Usuario`),
  ADD KEY `ID_TipoProducto` (`ID_TipoProducto`);

--
-- Indices de la tabla `tbpublicaciones`
--
ALTER TABLE `tbpublicaciones`
  ADD PRIMARY KEY (`ID_Publicacion`),
  ADD KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `tbservicios`
--
ALTER TABLE `tbservicios`
  ADD PRIMARY KEY (`ID_Servicio`),
  ADD KEY `ID_TipoServicio` (`ID_TipoServicio`),
  ADD KEY `ID_Usuario` (`ID_Usuario`);

--
-- Indices de la tabla `tbsexos`
--
ALTER TABLE `tbsexos`
  ADD PRIMARY KEY (`ID_Sexo`);

--
-- Indices de la tabla `tbtiposervicio`
--
ALTER TABLE `tbtiposervicio`
  ADD PRIMARY KEY (`ID_TipoServicio`);

--
-- Indices de la tabla `tbtiposfacturas`
--
ALTER TABLE `tbtiposfacturas`
  ADD PRIMARY KEY (`ID_TipoFactura`);

--
-- Indices de la tabla `tbtiposmovimientos`
--
ALTER TABLE `tbtiposmovimientos`
  ADD PRIMARY KEY (`ID_TipoMovimiento`);

--
-- Indices de la tabla `tbtiposproductos`
--
ALTER TABLE `tbtiposproductos`
  ADD PRIMARY KEY (`ID_TipoProducto`);

--
-- Indices de la tabla `tbunidadesmedidas`
--
ALTER TABLE `tbunidadesmedidas`
  ADD PRIMARY KEY (`ID_UnidadMedida`);

--
-- Indices de la tabla `tbusuarios`
--
ALTER TABLE `tbusuarios`
  ADD PRIMARY KEY (`ID_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbcertificaciones`
--
ALTER TABLE `tbcertificaciones`
  MODIFY `ID_Certificacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbcitas`
--
ALTER TABLE `tbcitas`
  MODIFY `ID_Cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbclientes`
--
ALTER TABLE `tbclientes`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tbdepartamentos`
--
ALTER TABLE `tbdepartamentos`
  MODIFY `ID_Departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbdetallecertificacion`
--
ALTER TABLE `tbdetallecertificacion`
  MODIFY `ID_DetalleCertificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbdetallecitas`
--
ALTER TABLE `tbdetallecitas`
  MODIFY `ID_DetalleCita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbdetallefactura`
--
ALTER TABLE `tbdetallefactura`
  MODIFY `ID_DetalleFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbdetallepublicaciones`
--
ALTER TABLE `tbdetallepublicaciones`
  MODIFY `ID_DetallePublicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbdetalleservicio`
--
ALTER TABLE `tbdetalleservicio`
  MODIFY `ID_DetalleServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbespecies`
--
ALTER TABLE `tbespecies`
  MODIFY `ID_Especie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbfacturas`
--
ALTER TABLE `tbfacturas`
  MODIFY `ID_Factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbkardex`
--
ALTER TABLE `tbkardex`
  MODIFY `ID_Kardex` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbmarcas`
--
ALTER TABLE `tbmarcas`
  MODIFY `ID_Marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbmascotas`
--
ALTER TABLE `tbmascotas`
  MODIFY `ID_Mascota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbmunicipios`
--
ALTER TABLE `tbmunicipios`
  MODIFY `ID_Municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbpaises`
--
ALTER TABLE `tbpaises`
  MODIFY `ID_Pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbprecios`
--
ALTER TABLE `tbprecios`
  MODIFY `ID_Precio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbproductos`
--
ALTER TABLE `tbproductos`
  MODIFY `ID_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbpublicaciones`
--
ALTER TABLE `tbpublicaciones`
  MODIFY `ID_Publicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbservicios`
--
ALTER TABLE `tbservicios`
  MODIFY `ID_Servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbsexos`
--
ALTER TABLE `tbsexos`
  MODIFY `ID_Sexo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbtiposervicio`
--
ALTER TABLE `tbtiposervicio`
  MODIFY `ID_TipoServicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbtiposfacturas`
--
ALTER TABLE `tbtiposfacturas`
  MODIFY `ID_TipoFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbtiposmovimientos`
--
ALTER TABLE `tbtiposmovimientos`
  MODIFY `ID_TipoMovimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbtiposproductos`
--
ALTER TABLE `tbtiposproductos`
  MODIFY `ID_TipoProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbunidadesmedidas`
--
ALTER TABLE `tbunidadesmedidas`
  MODIFY `ID_UnidadMedida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbusuarios`
--
ALTER TABLE `tbusuarios`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbcitas`
--
ALTER TABLE `tbcitas`
  ADD CONSTRAINT `tbcitas_ibfk_1` FOREIGN KEY (`ID_Mascota`) REFERENCES `tbmascotas` (`ID_Mascota`);

--
-- Filtros para la tabla `tbclientes`
--
ALTER TABLE `tbclientes`
  ADD CONSTRAINT `tbclientes_ibfk_1` FOREIGN KEY (`ID_Municipio`) REFERENCES `tbmunicipios` (`ID_Municipio`),
  ADD CONSTRAINT `tbclientes_ibfk_2` FOREIGN KEY (`ID_Sexo`) REFERENCES `tbsexos` (`ID_Sexo`);

--
-- Filtros para la tabla `tbdepartamentos`
--
ALTER TABLE `tbdepartamentos`
  ADD CONSTRAINT `tbdepartamentos_ibfk_1` FOREIGN KEY (`ID_Pais`) REFERENCES `tbpaises` (`ID_Pais`);

--
-- Filtros para la tabla `tbdetallecertificacion`
--
ALTER TABLE `tbdetallecertificacion`
  ADD CONSTRAINT `tbdetallecertificacion_ibfk_1` FOREIGN KEY (`ID_Certificacion`) REFERENCES `tbcertificaciones` (`ID_Certificacion`),
  ADD CONSTRAINT `tbdetallecertificacion_ibfk_2` FOREIGN KEY (`ID_DetalleServicio`) REFERENCES `tbdetalleservicio` (`ID_DetalleServicio`);

--
-- Filtros para la tabla `tbdetallecitas`
--
ALTER TABLE `tbdetallecitas`
  ADD CONSTRAINT `tbdetallecitas_ibfk_1` FOREIGN KEY (`ID_Cita`) REFERENCES `tbcitas` (`ID_Cita`),
  ADD CONSTRAINT `tbdetallecitas_ibfk_2` FOREIGN KEY (`ID_DetalleServicio`) REFERENCES `tbdetalleservicio` (`ID_DetalleServicio`);

--
-- Filtros para la tabla `tbdetallefactura`
--
ALTER TABLE `tbdetallefactura`
  ADD CONSTRAINT `tbdetallefactura_ibfk_1` FOREIGN KEY (`ID_Precio`) REFERENCES `tbprecios` (`ID_Precio`),
  ADD CONSTRAINT `tbdetallefactura_ibfk_2` FOREIGN KEY (`ID_Factura`) REFERENCES `tbfacturas` (`ID_Factura`),
  ADD CONSTRAINT `tbdetallefactura_ibfk_3` FOREIGN KEY (`ID_Producto`) REFERENCES `tbproductos` (`ID_Producto`);

--
-- Filtros para la tabla `tbdetallepublicaciones`
--
ALTER TABLE `tbdetallepublicaciones`
  ADD CONSTRAINT `tbdetallepublicaciones_ibfk_1` FOREIGN KEY (`ID_Publicacion`) REFERENCES `tbpublicaciones` (`ID_Publicacion`);

--
-- Filtros para la tabla `tbdetalleservicio`
--
ALTER TABLE `tbdetalleservicio`
  ADD CONSTRAINT `tbdetalleservicio_ibfk_1` FOREIGN KEY (`ID_Servicio`) REFERENCES `tbservicios` (`ID_Servicio`);

--
-- Filtros para la tabla `tbfacturas`
--
ALTER TABLE `tbfacturas`
  ADD CONSTRAINT `tbfacturas_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `tbclientes` (`ID_Cliente`),
  ADD CONSTRAINT `tbfacturas_ibfk_2` FOREIGN KEY (`ID_TipoFactura`) REFERENCES `tbtiposfacturas` (`ID_TipoFactura`),
  ADD CONSTRAINT `tbfacturas_ibfk_3` FOREIGN KEY (`ID_Usuario`) REFERENCES `tbusuarios` (`ID_Usuario`);

--
-- Filtros para la tabla `tbkardex`
--
ALTER TABLE `tbkardex`
  ADD CONSTRAINT `tbkardex_ibfk_1` FOREIGN KEY (`ID_DetalleFactura`) REFERENCES `tbdetallefactura` (`ID_DetalleFactura`),
  ADD CONSTRAINT `tbkardex_ibfk_2` FOREIGN KEY (`ID_TipoMovimiento`) REFERENCES `tbtiposmovimientos` (`ID_TipoMovimiento`);

--
-- Filtros para la tabla `tbmascotas`
--
ALTER TABLE `tbmascotas`
  ADD CONSTRAINT `tbmascotas_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `tbclientes` (`ID_Cliente`),
  ADD CONSTRAINT `tbmascotas_ibfk_2` FOREIGN KEY (`ID_Especie`) REFERENCES `tbespecies` (`ID_Especie`),
  ADD CONSTRAINT `tbmascotas_ibfk_3` FOREIGN KEY (`ID_Sexo`) REFERENCES `tbsexos` (`ID_Sexo`);

--
-- Filtros para la tabla `tbmunicipios`
--
ALTER TABLE `tbmunicipios`
  ADD CONSTRAINT `tbmunicipios_ibfk_1` FOREIGN KEY (`ID_Departamento`) REFERENCES `tbdepartamentos` (`ID_Departamento`),
  ADD CONSTRAINT `tbmunicipios_ibfk_2` FOREIGN KEY (`ID_Certificacion`) REFERENCES `tbcertificaciones` (`ID_Certificacion`);

--
-- Filtros para la tabla `tbprecios`
--
ALTER TABLE `tbprecios`
  ADD CONSTRAINT `tbprecios_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `tbproductos` (`ID_Producto`),
  ADD CONSTRAINT `tbprecios_ibfk_2` FOREIGN KEY (`ID_UnidadMedida`) REFERENCES `tbunidadesmedidas` (`ID_UnidadMedida`);

--
-- Filtros para la tabla `tbproductos`
--
ALTER TABLE `tbproductos`
  ADD CONSTRAINT `tbproductos_ibfk_1` FOREIGN KEY (`ID_Marca`) REFERENCES `tbmarcas` (`ID_Marca`),
  ADD CONSTRAINT `tbproductos_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `tbusuarios` (`ID_Usuario`),
  ADD CONSTRAINT `tbproductos_ibfk_3` FOREIGN KEY (`ID_TipoProducto`) REFERENCES `tbtiposproductos` (`ID_TipoProducto`);

--
-- Filtros para la tabla `tbpublicaciones`
--
ALTER TABLE `tbpublicaciones`
  ADD CONSTRAINT `tbpublicaciones_ibfk_1` FOREIGN KEY (`ID_Usuario`) REFERENCES `tbusuarios` (`ID_Usuario`);

--
-- Filtros para la tabla `tbservicios`
--
ALTER TABLE `tbservicios`
  ADD CONSTRAINT `tbservicios_ibfk_1` FOREIGN KEY (`ID_TipoServicio`) REFERENCES `tbtiposervicio` (`ID_TipoServicio`),
  ADD CONSTRAINT `tbservicios_ibfk_2` FOREIGN KEY (`ID_Usuario`) REFERENCES `tbusuarios` (`ID_Usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
