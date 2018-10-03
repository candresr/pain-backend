-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 27-06-2016 a las 16:41:19
-- Versión del servidor: 5.5.49-0+deb8u1
-- Versión de PHP: 5.6.20-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `pain`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Application`
--

CREATE TABLE IF NOT EXISTS `Application` (
`id` bigint(20) NOT NULL,
  `application` timestamp NULL DEFAULT NULL,
  `suppose` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_dose` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Country`
--

CREATE TABLE IF NOT EXISTS `Country` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Doctor`
--

CREATE TABLE IF NOT EXISTS `Doctor` (
  `id_user` int(11) DEFAULT NULL,
  `id_specialization` int(11) DEFAULT NULL,
  `profile` text,
  `id_country` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Dose`
--

CREATE TABLE IF NOT EXISTS `Dose` (
  `id_recipe` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
`id` int(11) NOT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `frecuency` int(11) DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `start_time` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Group`
--

CREATE TABLE IF NOT EXISTS `Group` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `public` tinyint(4) DEFAULT '0',
  `erased` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Group`
--

INSERT INTO `Group` (`id`, `name`, `description`, `public`, `erased`) VALUES
(1, 'Administrador', 'Administrador del sistema', 0, 0),
(2, 'Medicos', 'Médicos certificados para aplicación del medicamento', 0, 0),
(3, 'Pacientes', 'Ingresados para tratar el dolor ', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Group_user`
--

CREATE TABLE IF NOT EXISTS `Group_user` (
  `id_user` int(11) DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Group_user`
--

INSERT INTO `Group_user` (`id_user`, `id_group`, `valid_to`) VALUES
(1, 1, NULL),
(2, 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Library`
--

CREATE TABLE IF NOT EXISTS `Library` (
`id` int(11) NOT NULL,
  `url` text,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `image` text,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Line`
--

CREATE TABLE IF NOT EXISTS `Line` (
`id` int(11) NOT NULL,
  `id_country` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Notification`
--

CREATE TABLE IF NOT EXISTS `Notification` (
`id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `read` tinyint(4) NOT NULL DEFAULT '0',
  `text` text,
  `link` text,
  `id_dose` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Nurse`
--

CREATE TABLE IF NOT EXISTS `Nurse` (
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pain_report`
--

CREATE TABLE IF NOT EXISTS `Pain_report` (
  `id_patient` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Patient`
--

CREATE TABLE IF NOT EXISTS `Patient` (
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Permission`
--

CREATE TABLE IF NOT EXISTS `Permission` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Permission_group`
--

CREATE TABLE IF NOT EXISTS `Permission_group` (
  `id_permission` int(11) DEFAULT NULL,
  `id_group` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Product`
--

CREATE TABLE IF NOT EXISTS `Product` (
`id` int(11) NOT NULL,
  `ref_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `picture` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_line` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Recipe`
--

CREATE TABLE IF NOT EXISTS `Recipe` (
`id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text,
  `id_patient` int(11) DEFAULT NULL,
  `id_doctor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Rss_channel`
--

CREATE TABLE IF NOT EXISTS `Rss_channel` (
`id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `link` text,
  `language` varchar(255) DEFAULT NULL,
  `copyright` text,
  `image` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Rss_item`
--

CREATE TABLE IF NOT EXISTS `Rss_item` (
`id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `link` text,
  `description` text,
  `copyright` text,
  `pubDate` datetime DEFAULT NULL,
  `id_channel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Schema_tables`
--

CREATE TABLE IF NOT EXISTS `Schema_tables` (
`id` int(11) NOT NULL,
  `column_name` varchar(50) DEFAULT NULL,
  `column_type` varchar(50) DEFAULT NULL,
  `tittle` varchar(50) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `rules` varchar(250) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `search` tinyint(1) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0',
  `join` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Schema_tables`
--

INSERT INTO `Schema_tables` (`id`, `column_name`, `column_type`, `tittle`, `is_visible`, `table_name`, `order`, `rules`, `category`, `search`, `erased`, `join`) VALUES
(1, 'id', 'hidden', 'Id', 0, 'User', 1, '', '', 0, 0, ''),
(2, 'name', 'varchar', 'Nombre', 1, 'User', 2, 'trim|required', '', 1, 0, ''),
(3, 'lastname', 'varchar', 'Apellido', 1, 'User', 3, 'trim|required', '', 1, 0, NULL),
(4, 'email', 'varchar', 'Correo', 1, 'User', 4, 'trim|required|valid_email', '', 1, 0, ''),
(5, 'password', 'password', 'Contraseña', 0, 'User', 5, 'trim|required', '', 0, 0, NULL),
(6, 'active', 'hidden', 'Activo', 0, 'User', 6, '', '', 0, 0, NULL),
(7, 'id', 'hidden', 'Id', 0, 'Group', 1, '', '', 0, 0, NULL),
(8, 'name', 'varchar', 'Nombre', 1, 'Group', 2, 'trim|required', '', 1, 0, ''),
(9, 'description', 'text', 'Descripcion', 1, 'Group', 3, 'trim|required', '', 1, 0, NULL),
(10, 'public', 'hidden', 'Publico', 0, 'Group', 4, '', '', 0, 0, NULL),
(11, 'type_user', 'combobox', 'Grupo', 1, 'User', 7, NULL, 'Doctor', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Session`
--

CREATE TABLE IF NOT EXISTS `Session` (
`id_user` int(11) NOT NULL,
  `device` text,
  `token` text,
  `valid_to` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Specialization`
--

CREATE TABLE IF NOT EXISTS `Specialization` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Structure_tables`
--

CREATE TABLE IF NOT EXISTS `Structure_tables` (
`id` int(11) NOT NULL,
  `name_table` varchar(100) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `erased` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Structure_tables`
--

INSERT INTO `Structure_tables` (`id`, `name_table`, `title`, `url`, `erased`) VALUES
(1, 'User', 'Usuarios', 'admin/listAll', 0),
(2, 'Group', 'Grupos', 'admin/listAll', 0),
(3, 'Doctor', 'Medicos', 'admin/listAll', 0),
(4, 'Patient', 'Pacientes', 'admin/listAll', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `User`
--

CREATE TABLE IF NOT EXISTS `User` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'1',
  `erased` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `User`
--

INSERT INTO `User` (`id`, `name`, `lastname`, `email`, `password`, `active`, `erased`) VALUES
(1, 'Cesar', 'Ramirez', 'cesar@correo.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', b'1', 0),
(2, 'Rossana', 'Mejias', 'ross@correo.com', '771d4026e7ad19fce0d7534fddb2ce53b7e0a4cd', b'1', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Application`
--
ALTER TABLE `Application`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_Application_Recipe_Product_Dose` (`id_dose`);

--
-- Indices de la tabla `Country`
--
ALTER TABLE `Country`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Doctor`
--
ALTER TABLE `Doctor`
 ADD KEY `FK_Doctor_Country` (`id_country`), ADD KEY `FK_Doctor_Specialization` (`id_specialization`), ADD KEY `FK_Doctor_User` (`id_user`);

--
-- Indices de la tabla `Dose`
--
ALTER TABLE `Dose`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_Recipe_Product_Dose_Product` (`id_product`), ADD KEY `FK_Recipe_Product_Dose_Recipe` (`id_recipe`);

--
-- Indices de la tabla `Group`
--
ALTER TABLE `Group`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Group_user`
--
ALTER TABLE `Group_user`
 ADD KEY `FK_Group_user_Group` (`id_group`), ADD KEY `FK_Group_user_User` (`id_user`);

--
-- Indices de la tabla `Library`
--
ALTER TABLE `Library`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Line`
--
ALTER TABLE `Line`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_Line_Country` (`id_country`);

--
-- Indices de la tabla `Notification`
--
ALTER TABLE `Notification`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_Notification_Recipe_Product_Dose` (`id_dose`), ADD KEY `FK_Notification_User` (`id_user`);

--
-- Indices de la tabla `Nurse`
--
ALTER TABLE `Nurse`
 ADD KEY `FK_Nurse_User` (`id_user`);

--
-- Indices de la tabla `Pain_report`
--
ALTER TABLE `Pain_report`
 ADD KEY `FK_Pain_report_User` (`id_patient`);

--
-- Indices de la tabla `Patient`
--
ALTER TABLE `Patient`
 ADD KEY `FK_Patient_User` (`id_user`);

--
-- Indices de la tabla `Permission`
--
ALTER TABLE `Permission`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Permission_group`
--
ALTER TABLE `Permission_group`
 ADD KEY `FK_Permission_group_Group` (`id_group`), ADD KEY `FK_Permission_group_Permission` (`id_permission`);

--
-- Indices de la tabla `Product`
--
ALTER TABLE `Product`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_Product_Line` (`id_line`);

--
-- Indices de la tabla `Recipe`
--
ALTER TABLE `Recipe`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_Recipe_User` (`id_patient`), ADD KEY `FK_Recipe_User_02` (`id_doctor`);

--
-- Indices de la tabla `Rss_channel`
--
ALTER TABLE `Rss_channel`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Rss_item`
--
ALTER TABLE `Rss_item`
 ADD PRIMARY KEY (`id`), ADD KEY `FK_Rss_Rss_channel` (`id_channel`);

--
-- Indices de la tabla `Schema_tables`
--
ALTER TABLE `Schema_tables`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Session`
--
ALTER TABLE `Session`
 ADD KEY `FK_Session_User` (`id_user`);

--
-- Indices de la tabla `Specialization`
--
ALTER TABLE `Specialization`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Structure_tables`
--
ALTER TABLE `Structure_tables`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `User`
--
ALTER TABLE `User`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Application`
--
ALTER TABLE `Application`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Country`
--
ALTER TABLE `Country`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Dose`
--
ALTER TABLE `Dose`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Group`
--
ALTER TABLE `Group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `Library`
--
ALTER TABLE `Library`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Line`
--
ALTER TABLE `Line`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Notification`
--
ALTER TABLE `Notification`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Permission`
--
ALTER TABLE `Permission`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Product`
--
ALTER TABLE `Product`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Recipe`
--
ALTER TABLE `Recipe`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Rss_channel`
--
ALTER TABLE `Rss_channel`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Rss_item`
--
ALTER TABLE `Rss_item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Schema_tables`
--
ALTER TABLE `Schema_tables`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `Session`
--
ALTER TABLE `Session`
MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Structure_tables`
--
ALTER TABLE `Structure_tables`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `User`
--
ALTER TABLE `User`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Application`
--
ALTER TABLE `Application`
ADD CONSTRAINT `FK_Application_Recipe_Product_Dose` FOREIGN KEY (`id_dose`) REFERENCES `Dose` (`id`);

--
-- Filtros para la tabla `Doctor`
--
ALTER TABLE `Doctor`
ADD CONSTRAINT `FK_Doctor_Country` FOREIGN KEY (`id_country`) REFERENCES `Country` (`id`),
ADD CONSTRAINT `FK_Doctor_Specialization` FOREIGN KEY (`id_specialization`) REFERENCES `Specialization` (`id`),
ADD CONSTRAINT `FK_Doctor_User` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`);

--
-- Filtros para la tabla `Dose`
--
ALTER TABLE `Dose`
ADD CONSTRAINT `FK_Recipe_Product_Dose_Product` FOREIGN KEY (`id_product`) REFERENCES `Product` (`id`),
ADD CONSTRAINT `FK_Recipe_Product_Dose_Recipe` FOREIGN KEY (`id_recipe`) REFERENCES `Recipe` (`id`);

--
-- Filtros para la tabla `Group_user`
--
ALTER TABLE `Group_user`
ADD CONSTRAINT `FK_Group_user_Group` FOREIGN KEY (`id_group`) REFERENCES `Group` (`id`),
ADD CONSTRAINT `FK_Group_user_User` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`);

--
-- Filtros para la tabla `Line`
--
ALTER TABLE `Line`
ADD CONSTRAINT `FK_Line_Country` FOREIGN KEY (`id_country`) REFERENCES `Country` (`id`);

--
-- Filtros para la tabla `Notification`
--
ALTER TABLE `Notification`
ADD CONSTRAINT `FK_Notification_Recipe_Product_Dose` FOREIGN KEY (`id_dose`) REFERENCES `Dose` (`id`),
ADD CONSTRAINT `FK_Notification_User` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`);

--
-- Filtros para la tabla `Nurse`
--
ALTER TABLE `Nurse`
ADD CONSTRAINT `FK_Nurse_User` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`);

--
-- Filtros para la tabla `Pain_report`
--
ALTER TABLE `Pain_report`
ADD CONSTRAINT `FK_Pain_report_User` FOREIGN KEY (`id_patient`) REFERENCES `User` (`id`);

--
-- Filtros para la tabla `Patient`
--
ALTER TABLE `Patient`
ADD CONSTRAINT `FK_Patient_User` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`);

--
-- Filtros para la tabla `Permission_group`
--
ALTER TABLE `Permission_group`
ADD CONSTRAINT `FK_Permission_group_Group` FOREIGN KEY (`id_group`) REFERENCES `Group` (`id`),
ADD CONSTRAINT `FK_Permission_group_Permission` FOREIGN KEY (`id_permission`) REFERENCES `Permission` (`id`);

--
-- Filtros para la tabla `Product`
--
ALTER TABLE `Product`
ADD CONSTRAINT `FK_Product_Line` FOREIGN KEY (`id_line`) REFERENCES `Line` (`id`);

--
-- Filtros para la tabla `Recipe`
--
ALTER TABLE `Recipe`
ADD CONSTRAINT `FK_Recipe_User` FOREIGN KEY (`id_patient`) REFERENCES `User` (`id`),
ADD CONSTRAINT `FK_Recipe_User_02` FOREIGN KEY (`id_doctor`) REFERENCES `User` (`id`);

--
-- Filtros para la tabla `Rss_item`
--
ALTER TABLE `Rss_item`
ADD CONSTRAINT `FK_Rss_Rss_channel` FOREIGN KEY (`id_channel`) REFERENCES `Rss_channel` (`id`);

--
-- Filtros para la tabla `Session`
--
ALTER TABLE `Session`
ADD CONSTRAINT `FK_Session_User` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
