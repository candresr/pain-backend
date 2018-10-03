-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 05-07-2016 a las 17:43:00
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Country`
--

INSERT INTO `Country` (`id`, `name`, `code`) VALUES
(1, 'Colombia', '169'),
(2, 'Chile', '211'),
(3, 'Ecuador', '239'),
(4, 'Mexico', '493'),
(5, 'Peru', '589');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Doctor`
--

CREATE TABLE IF NOT EXISTS `Doctor` (
  `id_user` int(11) DEFAULT NULL,
  `id_specialization` int(11) DEFAULT NULL,
  `profile` text,
  `id_country` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `alert` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Doctor`
--

INSERT INTO `Doctor` (`id_user`, `id_specialization`, `profile`, `id_country`, `picture`, `alert`) VALUES
(3, 1, NULL, 1, NULL, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Dose`
--

CREATE TABLE IF NOT EXISTS `Dose` (
  `id_recipe` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
`id` int(11) NOT NULL,
  `start` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `frecuency` int(11) DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `start_time` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Dose`
--

INSERT INTO `Dose` (`id_recipe`, `id_product`, `id`, `start`, `frecuency`, `end`, `start_time`) VALUES
(1, 1, 1, '2016-07-01 20:55:01', 10, '2016-08-07 05:00:00', 0);

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
(2, 3, NULL),
(3, 2, NULL),
(5, 3, NULL),
(6, 3, NULL),
(7, 3, NULL),
(8, 3, NULL),
(9, 3, NULL),
(10, 3, NULL),
(11, 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Institution`
--

CREATE TABLE IF NOT EXISTS `Institution` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `id_country` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=911 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Institution`
--

INSERT INTO `Institution` (`id`, `name`, `address`, `phone`, `id_country`) VALUES
(102, 'CAFESALUD  E.P.S.  S.A.', '', '', 1),
(103, 'LA NUEVA EPS S.A.', '', '', 1),
(104, 'COOMEVA   E.P.S.  S.A.', '', '', 1),
(105, 'EPS Y MEDICINA PREPAGADA SURAMERICANA S.A', '', '', 1),
(106, 'SALUD  TOTAL  S.A.  E.P.S.', '', '', 1),
(107, 'E.P.S.  FAMISANAR  LTDA.', '', '', 1),
(108, 'E.P.S.  SANITAS  S.A.', '', '', 1),
(109, 'COMPENSAR   E.P.S.', '', '', 1),
(110, 'EPS SERVICIO OCCIDENTAL DE SALUD  S.A. - EPS S.O.S. S.A.', '', '', 1),
(111, 'CRUZ BLANCA  EPS S.A.', '', '', 1),
(112, 'COMFENALCO  VALLE  E.P.S.', '', '', 1),
(113, 'ALIANSALUD ENTIDAD PROMOTORA DE SALUD S.A.', '', '', 1),
(114, 'SALUDVIDA S.A .E.P.S', '', '', 1),
(115, 'FONDO DE PASIVO SOCIAL DE LOS FERROCARRILES NALES', '', '', 1),
(116, 'ASOCIACIÓN MUTUAL EMPRESA SOLIDARIA DE SALUD DE NARIÑO E.S.S. EMSSANAR E.S.S.-CM', '', '', 1),
(117, 'SAVIA SALUD EPS -CM', '', '', 1),
(118, 'COOPERATIVA DE SALUD Y DESARROLLO INTEGRAL ZONA SUR ORIENTAL DE CARTAGENA LTDA. COOSALUD E.S.S.-CM', '', '', 1),
(119, 'CAFESALUD  E.P.S.  S.A.-CM', '', '', 1),
(120, 'ASOCIACIÓN MUTUAL SER EMPRESA SOLIDARIA DE SALUD ESS-CM', '', '', 1),
(121, 'ASOCIACIÓN MUTUAL LA ESPERANZA ASMET  SALUD-CM', '', '', 1),
(122, 'EMPRESAS PUBLICAS DE MEDELLIN-DEPARTAMENTO MEDICO', '', '', 1),
(123, 'CAJA DE DE COMPENSACION FAMILIAR  CAJACOPI ATLANTICO-CM', '', '', 1),
(124, 'CAPITAL SALUD-CM', '', '', 1),
(125, 'CAPRESOCA  EPS-CM', '', '', 1),
(126, 'COOPERATIVA DE SALUD COMUNITARIA-COMPARTA-CM', '', '', 1),
(127, 'ASOCIACIÓN MUTUAL BARRIOS UNIDOS DE QUIBDÓ E.S.S.-CM', '', '', 1),
(128, 'EPS  CONVIDA-CM', '', '', 1),
(129, 'CAJA DE COMPENSACIÓN FAMILIAR DEL HUILA "COMFAMILIAR"-CM', '', '', 1),
(130, 'CAJA DE COMPENSACION FAMILIAR DE CORDOBA  COMFACOR-CM', '', '', 1),
(131, 'MALLAMAS-CM', '', '', 1),
(132, 'CAJA DE COMPENSACIÓN FAMILIAR DE NARIÑO "COMFAMILIAR NARIÑO"-CM', '', '', 1),
(133, 'LA NUEVA EPS S.A.-CM', '', '', 1),
(134, 'EMPRESA MUTUAL PARA EL DESARROLLO INTEGRAL  DE LA SALUD E.S.S. EMDISALUD ESS-CM', '', '', 1),
(135, 'MANEXKA EPSI-CM', '', '', 1),
(136, 'CAJA DE COMPENSACIÓN FAMILIAR DEL CHOCÓ COMFACHOCO-CM', '', '', 1),
(137, 'ANASWAYUU-CM', '', '', 1),
(138, 'CAJA DE COMPENSACION FAMILIAR DE CUNDINAMARCA COMFACUNDI-CM', '', '', 1),
(139, 'SALUDVIDA  S.A.  E.P.S.-CM', '', '', 1),
(140, 'CAJA DE COMPENSACIÓN FAMILIAR DE BOYACÁ COMFABOY-CM', '', '', 1),
(141, 'PIJAOS SALUD EPSI-CM', '', '', 1),
(142, 'CAPRECOM EPS', '', '', 1),
(143, 'ASOCIACIÓN INDÍGENA DEL CESAR Y LA GUAJIRA DUSAKAWI-CM', '', '', 1),
(144, 'ENTIDAD COOPERATIVA SOL.DE SALUD DEL NORTE DE SOACHA ECOOPSOS-CM', '', '', 1),
(145, 'CAJA DE COMPENSACIÓN FAMILIAR DE LA GUAJIRA-CM', '', '', 1),
(146, 'CAJA DE COMPENSACIÓN FAMILIAR DE SUCRE-CM', '', '', 1),
(147, 'GOLDEN GROUP S.A. EPS', '', '', 1),
(148, 'E.P.S.  SALUDCOOP', '', '', 1),
(149, 'HUMANA VIVIR S.A. E.P.S.', '', '', 1),
(150, 'SALUDCOLOMBIA EPS S.A.', '', '', 1),
(151, 'MULTIMEDICAS SALUD CON CALIDAD EPS S.A.', '', '', 1),
(152, 'ASOCIACIÓN MUTUAL LA ESPERANZA ASMET  SALUD', '', '', 1),
(153, 'COOPERATIVA DE SALUD Y DESARROLLO INTEGRAL ZONA SUR ORIENTAL DE CARTAGENA LTDA. COOSALUD E.S.S.', '', '', 1),
(154, 'COOPERATIVA DE SALUD COMUNITARIA-COMPARTA', '', '', 1),
(155, 'ASOCIACIÓN MUTUAL EMPRESA SOLIDARIA DE SALUD DE NARIÑO E.S.S. EMSSANAR E.S.S.', '', '', 1),
(156, 'SAVIA SALUD EPS', '', '', 1),
(157, 'SALUDVIDA S.A .E.P.S', '', '', 1),
(158, 'ASOCIACIÓN MUTUAL SER EMPRESA SOLIDARIA DE SALUD ESS', '', '', 1),
(159, 'CAPITAL SALUD', '', '', 1),
(160, 'CAFESALUD  E.P.S.  S.A.', '', '', 1),
(161, 'ASOCIACIÓN MUTUAL BARRIOS UNIDOS DE QUIBDÓ E.S.S.', '', '', 1),
(162, 'LA NUEVA EPS S.A.', '', '', 1),
(163, 'CAJA DE DE COMPENSACION FAMILIAR  CAJACOPI ATLANTICO', '', '', 1),
(164, 'CAJA DE COMPENSACION FAMILIAR DE CORDOBA  COMFACOR', '', '', 1),
(165, 'EPS  CONVIDA', '', '', 1),
(166, 'CAJA DE COMPENSACIÓN FAMILIAR DEL HUILA "COMFAMILIAR"', '', '', 1),
(167, 'EMPRESA MUTUAL PARA EL DESARROLLO INTEGRAL  DE LA SALUD E.S.S. EMDISALUD ESS', '', '', 1),
(168, 'ASOCIACIÓN INDÍGENA DEL CAUCA', '', '', 1),
(169, 'CAFESALUD  E.P.S.  S.A.-CM', '', '', 1),
(170, 'ENTIDAD COOPERATIVA SOL.DE SALUD DEL NORTE DE SOACHA ECOOPSOS', '', '', 1),
(171, 'MALLAMAS', '', '', 1),
(172, 'CAJA DE COMPENSACIÓN FAMILIAR  DE CARTAGENA "COMFAMILIAR CARTAGENA"', '', '', 1),
(173, 'MANEXKA EPSI', '', '', 1),
(174, 'ASOCIACIÓN INDÍGENA DEL CESAR Y LA GUAJIRA  DUSAKAWI', '', '', 1),
(175, 'NUEVA EPS S.A. -CM', '', '', 1),
(176, 'COOMEVA   E.P.S.  S.A.-CM', '', '', 1),
(177, 'CAJA DE COMPENSACIÓN FAMILIAR DE NARIÑO "COMFAMILIAR NARIÑO"', '', '', 1),
(178, 'CAPRESOCA  EPS', '', '', 1),
(179, 'CAJA DE COMPENSACIÓN FAMILIAR DEL CHOCÓ COMFACHOCO', '', '', 1),
(180, 'CAJA DE COMPENSACIÓN FAMILIAR DE LA GUAJIRA', '', '', 1),
(181, 'ANASWAYUU', '', '', 1),
(182, 'SALUD  TOTAL  S.A.  E.P.S. CM', '', '', 1),
(183, 'CAJA DE COMPENSACIÓN FAMILIAR DE CUNDINAMARCA COMFACUNDI', '', '', 1),
(184, 'CAJA DE COMPENSACIÓN FAMILIAR C.C.F. DEL ORIENTE COLOMBIANO "COMFAORIENTE"', '', '', 1),
(185, 'CAJA DE COMPENSACIÓN FAMILIAR DE BOYACÁ COMFABOY', '', '', 1),
(186, 'CAJA DE COMPENSACIÓN FAMILIAR DE SUCRE', '', '', 1),
(187, 'EPS Y MEDICINA PREPAGADA SURAMERICANA S.A-CM', '', '', 1),
(188, 'PIJAOS SALUD EPSI', '', '', 1),
(189, 'E.P.S.  FAMISANAR  LTDA.-CM', '', '', 1),
(190, 'EPS SERVICIO OCCIDENTAL DE SALUD  S.A. - EPS S.O.S. S.A.-CM', '', '', 1),
(191, 'COMPENSAR   E.P.S.-CM', '', '', 1),
(192, 'CRUZ BLANCA  EPS S.A.-CM', '', '', 1),
(193, 'E.P.S.  SANITAS  S.A.-CM', '', '', 1),
(194, 'COMFENALCO  VALLE  E.P.S.-CM', '', '', 1),
(195, 'CAPRECOM EPS', '', '', 1),
(196, 'SALUDVIDA S.A .E.P.S -CM', '', '', 1),
(197, 'ALIANSALUD ENTIDAD PROMOTORA DE SALUD S.A.-CM', '', '', 1),
(198, 'CAJA DE COMPENSACIÓN FAMILIAR DEL NORTE DE SANTANDER  "COMFANORTE"', '', '', 1),
(199, 'COLSUBSIDIO', '', '', 1),
(200, 'SOLSALUD  E.P.S.  S.A', '', '', 1),
(202, 'Arm.deChile Dpto.Bienestar ', 'Colon 3150                                   ', '', 2),
(203, 'Asistencia Publica ', '', '', 2),
(204, 'Asoc. Chilena Seguridad ', 'Av. Ramón Carnicer 163                       ', '', 2),
(205, 'Asoc. Dializados De Chile ', 'Rancagua # 0250                              ', '', 2),
(206, 'CENTRO ASISTENCIAL NORTE ANTOFAGAST', 'LOS PUMAS 10255 CHIMBA ALTO                  ', '', 2),
(207, 'Centro Clínico Militar ', '21 de Mayo 1167                              ', '', 2),
(208, 'Centro de Especialidades Farmaceuti ', 'Jose Manuel Infante N 927                    ', '', 2),
(209, 'Centro Salud Cordillera Andina ', 'San Jose de las Hnas Hosp. 151               ', '', 2),
(210, 'Clin Alemana De Stgo S.A. ', 'Av. Vitacura  5951                           ', '', 2),
(211, 'Clin. Davila Serv. Medic. ', 'Recoleta 464                                 ', '', 2),
(212, 'Clinica Alemana de Temuco ', 'Senador Estebanez 645                        ', '', 2),
(213, 'Clinica Alemana Valdivia S.A. ', 'Beaucheff 765                                ', '', 2),
(214, 'Clinica Avansalud Providencia S.A. ', 'Av. Salvador 130                             ', '', 2),
(215, 'CLINICA BICENTENARIO', 'Av. Libertador B.O''higgins #4850             ', '', 2),
(216, 'Clínica Bio Bio S.A. ', 'Av. J. Alessandri 3515                       ', '', 2),
(217, 'Clinica Ciudad del Mar ', '13 Norte 635                                 ', '', 2),
(218, 'Clinica de la Mujer ', 'Av. Alejandro Navarrete 2606                 ', '', 2),
(219, 'Clínica del Maule ', '', '', 2),
(220, 'Clinica Francesa S.A.', 'Avda. Francesa 97                            ', '', 2),
(221, 'Clinica Iquique S.A. ', 'Ohiggins 103                                 ', '', 2),
(222, 'Clinica Las Condes S.A. ', 'LO FONTECILLA Nº 441                         ', '', 2),
(223, 'Clinica Los Andes Pto Montt ', 'Av. Bellavista # 123                         ', '', 2),
(224, 'Clinica Los Andes S.A. ', 'Dr.Genaro Reyes 581                          ', '', 2),
(225, 'Clínica Los Coihues S.A ', 'Laguna Sur 6561                              ', '', 2),
(226, 'Clinica Magallanes S.A.', 'Av Bulnes 01448                              ', '', 2),
(227, 'Clinica Puerto Montt', 'Panamericana # 400                           ', '', 2),
(228, 'Clinica Reg. La portada de Antofaga ', 'Balmaceda N° 2648, Esq. Arturo Prat          ', '', 2),
(229, 'Clinica Rio Blanco ', 'Avda. Sta. Maria 777                         ', '', 2),
(230, 'Clinica San Lorenzo Ltda', 'Avda. Diego Portales S/N                     ', '', 2),
(231, 'Clinica Santa Maria ', 'Av. Santa Maria 0410                         ', '', 2),
(232, 'Clinica Universidad Catolica ', 'Lira 40 Segundo Subterraneo                  ', '', 2),
(233, 'Clínica Univesitaria Concepción ', 'Avda. Jorge Alessandri  #2047                ', '', 2),
(234, 'Clínica Valparaíso Prest. Hospit. S', 'Av. Brasil 2350                              ', '', 2),
(235, 'Clinica Vespucio S.A. ', 'Serafin Zamora 190                           ', '', 2),
(236, 'Cllínica Las Lilas S.A.', 'Av. Eleodoro Yañez 2087                      ', '', 2),
(237, 'Codelco-Div. Chuquicamata ', 'Huerfanos # 1270                             ', '', 2),
(238, 'Complejo Asistencial Dr. Sotero del ', 'Concha Y Toro 3459                           ', '', 2),
(239, 'Comunid. Hosp. Del Profesor ', 'Alameda 4860                                 ', '', 2),
(240, 'Con Gral Ur Violeta Parra ', 'Francisco Ramirez  150                       ', '', 2),
(241, 'Consult. San Fco Mostazal ', 'Lucco 400                                    ', '', 2),
(242, 'Consultorio Miraflores ', 'Miraflores 1369                              ', '', 2),
(243, 'Coorp.Municipal Des. Social ', 'Quinta 050                                   ', '', 2),
(244, 'Corp Nacional Cancer', 'Seminario 86                                 ', '', 2),
(245, 'Corp Nacional Cancer ', 'Seminario 86                                 ', '', 2),
(246, 'Corp. Munic. Antofagasta', 'San Martin 2200                              ', '', 2),
(247, 'Corp. Munic. D.S. Calama ', 'Av. Bdo. O''Higgins 1155                      ', '', 2),
(248, 'Corp. Munic. Valparaiso Des. Social ', 'Colon 2164                                   ', '', 2),
(249, 'Corp. Municipal de Iquique ', 'Baquedano 951                                ', '', 2),
(250, 'Corp. Municipal de Pta. Arenas ', 'Jorge Montt 890                              ', '', 2),
(251, 'Corp.Mun.De La Florida ', '', '', 2),
(252, 'Corp.Mun.Vina Del Mar ', '10 Norte 907                                 ', '', 2),
(253, 'Corp.Munic. Valparaiso', 'Av. Colon 2180                               ', '', 2),
(254, 'Corp.Municipal Iquique', 'BAQUEDANO Nº951                              ', '', 2),
(255, 'CORPORACION NACIONAL DEL CANCER', '', '', 2),
(256, 'Crs Penalolen Cordillera Oriente ', 'Avda. Las Torres 5100                        ', '', 2),
(257, 'D.A. Salud Muni. Concepcion ', 'Ohiggins 1256                                ', '', 2),
(258, 'Dipreca Fondo Hospital ', 'Vital Apoquindo 1200                         ', '', 2),
(259, 'Dir. S.S. Metrop.Occident ', '', '', 2),
(260, 'Direc.Salud Vina-Quillota ', 'Limache 1307                                 ', '', 2),
(261, 'Fund Arturo Lopez ', 'Rancagua   878                               ', '', 2),
(262, 'Fund. Hosp. Parroquial San Bdo. ', 'O''Higgins # 04                               ', '', 2),
(263, 'Fundac. Salud El Teniente ', 'Carretera Eduardo Frei M. 1002               ', '', 2),
(264, 'Fundac. Salud El Teniente ', '', '', 2),
(265, 'General Dr Raul Yazigi J ', 'Av. Las Condes  8631                         ', '', 2),
(266, 'Hosp. A. Fuentealba Lagos ', 'Riquelme 1131                                ', '', 2),
(267, 'Hosp. Barros Luco Trudeau ', 'Gran Avenida 3204                            ', '', 2),
(268, 'Hosp. Caupolican Pardo C. ', 'Profesor Zanartu 1010                        ', '', 2),
(269, 'Hosp. Cl. Sn.Borja-Arriar ', 'Santa Rosa 1234                              ', '', 2),
(270, 'Hosp. de la Florida Dra Eloisa Diaz', 'Froinlan Roa # 6542                          ', '', 2),
(271, 'Hosp. Dr. Gustavo Fricke ', 'Alvarez 1532                                 ', '', 2),
(272, 'Hosp. El Carmen  Dr. Luis V.Ferrada', 'Camino a Rinconada # 1201                    ', '', 2),
(273, 'Hosp. Exequiel Gonzalez C ', 'Ramon Subercaseaux 1534                      ', '', 2),
(274, 'Hosp. FF.AA. Cir. Guzman ', 'Bulnes S/N                                   ', '', 2),
(275, 'Hosp. Gmo. Grant Benavent ', 'Calle San Martin 1436                        ', '', 2),
(276, 'Hosp. Molina S.N.S. ', 'Luis Cruz Mrtinez S/N                        ', '', 2),
(277, 'Hosp. Nav.(T)A.Adriazola ', 'Michimalongo S/N B.Naval                     ', '', 2),
(278, 'Hosp. Naval Almir. Neff ', 'Subida Alessandri S/N                        ', '', 2),
(279, 'Hosp. Prov. Del Hco. Msr.Fdo', 'Av. Huasco 392                               ', '', 2),
(280, 'Hosp. Prov. del Huasco Mons. Fdo. ', 'Avda. Huasco 392 Acceso Sur                  ', '', 2),
(281, 'Hosp. Reg. Punta Arenas ', 'Av. Los Flamencos 01364                      ', '', 2),
(282, 'Hosp. Regional De Chillan ', 'Francisco Ramirez N° 10                      ', '', 2),
(283, 'Hosp. Regional De Talca ', '1 Norte S/N                                  ', '', 2),
(284, 'Hosp. Regional Rancagua ', 'Av. B. O''Higgins 611                         ', '', 2),
(285, 'Hosp. San Juan De Dios ', 'Av Argentina 315                             ', '', 2),
(286, 'Hosp.Dr. Eduardo Pereira Ramirez', 'Enrique Ibsen Esq. Noruega S/N               ', '', 2),
(287, 'Hospital Angol', 'Ilabaca S/N                                  ', '', 2),
(288, 'Hospital Angol ', 'Ilabaca 752                                  ', '', 2),
(289, 'Hospital Base Curico ', 'Chacabuco 121                                ', '', 2),
(290, 'Hospital Base Linares ', 'Avda. Brasil 753                             ', '', 2),
(291, 'Hospital Base Los Angeles ', 'Ricardo Vicuna S/N                           ', '', 2),
(292, 'Hospital Base Osorno ', 'Sector Las Quemas S/N                        ', '', 2),
(293, 'Hospital Base Pto. Montt', '', '', 2),
(294, 'Hospital Base Puerto Montt ', 'Seminario S/N                                ', '', 2),
(295, 'Hospital Base Valdivia ', 'Bueras S/N                                   ', '', 2),
(296, 'Hospital C. Van Buren ', 'Av Colon 2454                                ', '', 2),
(297, 'Hospital Calvo Mackenna ', 'Av. Antonio Varas 360                        ', '', 2),
(298, 'Hospital Carlos Cisternas ', 'Carlos Cisternas 2253                        ', '', 2),
(299, 'Hospital Carlos Van Buren', 'San Ignacio 725                              ', '', 2),
(300, 'Hospital Carlos Van Buren', 'San Ignacio 725                              ', '', 2),
(301, 'Hospital Casablanca', 'Yungay 124                                   ', '', 2),
(302, 'Hospital Cauquenes', 'Manuel Montt S/N                             ', '', 2),
(303, 'Hospital Chillan', 'Francisco Ramirez 10                         ', '', 2),
(304, 'Hospital Claudio Vicuña de San Anto', 'Carmen Guerrero S/N                          ', '', 2),
(305, 'Hospital Clínico del Sur S.P.A. ', 'Cardenio Avello 36                           ', '', 2),
(306, 'Hospital Clinico Viña del mar ', 'Calle LImache 1741                           ', '', 2),
(307, 'Hospital Concepcion', 'San Martin 1436                              ', '', 2),
(308, 'Hospital Copiapo', 'O''Higgins S/N                                ', '', 2),
(309, 'Hospital Coquimbo', 'Av. Videla S/N                               ', '', 2),
(310, 'Hospital Coronel ', 'Lautaro S/N                                  ', '', 2),
(311, 'Hospital Curanilahue ', 'O''Higgins 111                                ', '', 2),
(312, 'Hospital Curico', 'Chacabuco 121                                ', '', 2),
(313, 'Hospital de Antofagasta', 'Av. Argentina 1962                           ', '', 2),
(314, 'Hospital De Arauco ', 'Caup0Lican S/N                               ', '', 2),
(315, 'Hospital De Buin ', 'Prat 250                                     ', '', 2),
(316, 'Hospital De Canete ', 'Ruta P60R esquina  ruta P520                 ', '', 2),
(317, 'Hospital De Carabineros ', 'Simon Bolivar 2200                           ', '', 2),
(318, 'Hospital De Castro ', 'Freire 852                                   ', '', 2),
(319, 'Hospital De Cauquenes ', 'Montt S/N                                    ', '', 2),
(320, 'Hospital De Copiapo ', 'Los Carrera N° 1320                          ', '', 2),
(321, 'Hospital De Coquimbo ', 'Avenida Videla  S/N                          ', '', 2),
(322, 'Hospital De Gorbea ', 'Carrera 901                                  ', '', 2),
(323, 'Hospital De Lautaro ', 'Escala S/N                                   ', '', 2),
(324, 'Hospital De Melipilla ', 'O`Higgins 551                                ', '', 2),
(325, 'Hospital De Ovalle ', 'Ariztia S/N                                  ', '', 2),
(326, 'Hospital De Parral ', 'Anibal Pinto S/N                             ', '', 2),
(327, 'Hospital de Peñablanca ', 'Sargento Aldea 660                           ', '', 2),
(328, 'Hospital De Pitrufquen ', 'M. Rodriguez S/N                             ', '', 2),
(329, 'Hospital De Quillota ', 'Concepcion 1050                              ', '', 2),
(330, 'Hospital De San Carlos ', 'Gazmuri 448                                  ', '', 2),
(331, 'Hospital De Talagante ', 'Balmaceda 1458                               ', '', 2),
(332, 'Hospital De Tome ', 'O''Higgins 1633                               ', '', 2),
(333, 'Hospital Doctor Hernan', 'Mnauel Montt  # 115                          ', '', 2),
(334, 'Hospital Dr. Eduardo Pereira R.', 'Ibsen S/N                                    ', '', 2),
(335, 'Hospital E. Torres Galdames ', 'Av.H.De La Concepcion S/N                    ', '', 2),
(336, 'Hospital El Pino ', 'Los Morros 13560                             ', '', 2),
(337, 'Hospital Felix Bulnes', 'Leoncio Fernandez 2655                       ', '', 2),
(338, 'Hospital Feliz Bulnes Cerda', 'Leoncio Fernandez 2655                       ', '', 2),
(339, 'Hospital Gorbea', 'Carrera 901                                  ', '', 2),
(340, 'Hospital Higueras ', 'Alto Horno 777                               ', '', 2),
(341, 'Hospital Huasco', 'Cantera  105                                 ', '', 2),
(342, 'Hospital La Serena', 'Balmaceda 916                                ', '', 2),
(343, 'Hospital La Serena ', 'Balmaceda 946                                ', '', 2),
(344, 'Hospital Lautaro', 'Escala S/N                                   ', '', 2),
(345, 'Hospital Linares', 'Av. Brasil 753                               ', '', 2),
(346, 'Hospital Lirquen ', 'Camino A Tome S/N                            ', '', 2),
(347, 'Hospital Los Andes', 'Av.Argentina 315                             ', '', 2),
(348, 'Hospital Los Angeles', 'Av. Rcrdo.Vicuña Esq. Los Carr.              ', '', 2),
(349, 'Hospital Militar ', 'Av.Alcalde Fdo.Castillo V.9100               ', '', 2),
(350, 'Hospital Nueva Imperial ', 'Gorostiaga 258                               ', '', 2),
(351, 'Hospital Ovalle', 'Av. Ariztia 7                                ', '', 2),
(352, 'Hospital Padre Hurtado ', 'Esperanza 2150 Sta Rosa                      ', '', 2),
(353, 'Hospital Parral', 'Anibal Pinto S/N                             ', '', 2),
(354, 'Hospital Penco Lirquen', 'Camino a Tome  S/N - Lirquen                 ', '', 2),
(355, 'Hospital Peñablanca', 'Sgto. Aldea 660                              ', '', 2),
(356, 'Hospital Quillota', 'Concepcion 1050                              ', '', 2),
(357, 'Hospital Quilpue', 'San Martin 1270                              ', '', 2),
(358, 'Hospital Quilpue ', 'San Martin   1270                            ', '', 2),
(359, 'Hospital Rancagua', 'Avda. Libertador O Higgins 611               ', '', 2),
(360, 'Hospital Reg. Antofagasta ', 'Av Argentina 1962                            ', '', 2),
(361, 'Hospital Reg. De Temuco ', 'Manuel Montt 115                             ', '', 2),
(362, 'Hospital Roberto Del Rio', 'Profesor Zañartu 1085                        ', '', 2),
(363, 'Hospital Roberto Del Rio ', 'Profesor Zanartu 1085                        ', '', 2),
(364, 'Hospital Salvador', 'Av.Salvador 364                              ', '', 2),
(365, 'Hospital Salvador ', 'Avenida Salvador 364                         ', '', 2),
(366, 'Hospital San Antonio', 'Carmen Guerrero 945                          ', '', 2),
(367, 'Hospital San Carlos', 'Gazmuri 448                                  ', '', 2),
(368, 'Hospital San Fernando ', 'Negrete 1401                                 ', '', 2),
(369, 'Hospital San Javier', 'Riquelme 1131                                ', '', 2),
(370, 'Hospital San Juan de Dios', 'Huerfanos 3255                               ', '', 2),
(371, 'Hospital San Juan De Dios ', 'Huerfanos 3255                               ', '', 2),
(372, 'Hospital Talca', 'San Miguel S/N Talca Bod. Farmacia           ', '', 2),
(373, 'Hospital Talcahuano', 'Alto Horno 777                               ', '', 2),
(374, 'Hospital Tome', 'Mariano Egaña 1640                           ', '', 2),
(375, 'Hospital Victoria', 'Av. Dartnell S/N                             ', '', 2),
(376, 'Hospital Victoria ', 'Av Darnels S/N                               ', '', 2),
(377, 'Hospital Villarrica', 'San Martin 460                               ', '', 2),
(378, 'Hospital Villarrica ', 'San Martin 460                               ', '', 2),
(379, 'Hospital Viña del Mar', 'Alvarez 1532                                 ', '', 2),
(380, 'I. Muni De Chillan Depto Salud ', 'Herminda Martin 557                          ', '', 2),
(381, 'I. Munic De San Pedro De La Paz ', 'Los Canelos 65 Sn Pedro de la Paz            ', '', 2),
(382, 'I. Munic. De Arica ', '', '', 2),
(383, 'I. Munic. De Cartagena ', 'Errazuriz 665                                ', '', 2),
(384, 'I. Munic. De Con Con ', 'Manantiales Esq. Chanarcillo                 ', '', 2),
(385, 'I. Munic. De Copiapo ', '', '', 2),
(386, 'I. Munic. De Coronel ', 'Manuel Montt 798                             ', '', 2),
(387, 'I. Munic. De Curico ', 'Freire  0189                                 ', '', 2),
(388, 'I. Munic. De Linares ', 'Lautaro 305                                  ', '', 2),
(389, 'I. Munic. De Osorno ', 'Mackenna 851                                 ', '', 2),
(390, 'I. Munic. De Parral ', 'Anibal Pinto 1189                            ', '', 2),
(391, 'I. Munic. De Pto. Montt ', 'San Felipe 80                                ', '', 2),
(392, 'I. Munic. De Pto. Varas ', 'Errazuriz Esq A.Varas                        ', '', 2),
(393, 'I. Munic. De San Antonio ', 'Av. Barros Luco 2437                         ', '', 2),
(394, 'I. Munic. de Talagante ', 'Francisco Chacon N°750                       ', '', 2),
(395, 'I. Munic. De Talca Depto Salud ', '11 Oriente 13 Sur S/N                        ', '', 2),
(396, 'I. Munic. De Temuco ', 'Prat 650                                     ', '', 2),
(397, 'I. Munic. De Valdivia ', 'Pedro Aguirre Cerda 231                      ', '', 2),
(398, 'I. Municipalidad Chiguayante ', 'Orozimbo Barboza 104                         ', '', 2),
(399, 'I. Municipalidad Talcahuano ', 'A. Pinto 490 Cerro David Fuentes             ', '', 2),
(400, 'Inmob. Clinica San Carlos de Apoqui ', 'Camino el Alba 12351                         ', '', 2),
(401, 'Inst Seguridad Del Trabajo ', 'Placer 1410                                  ', '', 2),
(402, 'Inst. De Seg. Del Trabajo ', 'Alvarez 662                                  ', '', 2),
(403, 'Inst. De Seg. Del Trabajo ', 'Av. Colon  3430                              ', '', 2),
(404, 'Inst. Nacional Del Torax ', 'J. M. Infante 717                            ', '', 2),
(405, 'Inst. Oncologico Dr. Caupolican', 'Profesor Zañartu 1010                        ', '', 2),
(406, 'Inst. Segur. Del Trabajo ', 'Placer 1410                                  ', '', 2),
(407, 'Instituto De Diagnostico ', 'Avda. Santa Maria 1810                       ', '', 2),
(408, 'Instituto Nac Geriatria ', 'Jose Miguel Infante 370                      ', '', 2),
(409, 'Instituto Psiquiatrico ', 'Avenida La Paz 841                           ', '', 2),
(410, 'Instituto Traumatologico', 'San Martin 771                               ', '', 2),
(411, 'Hospital Traumatológico', 'San Martin N° 1580                           ', '', 2),
(412, 'Instituto Traumatologico ', '', '', 2),
(413, 'Munic. Con Con', 'Chañarcillo 1150                             ', '', 2),
(414, 'Municipalidad Hualpen ', 'Colon 8363                                   ', '', 2),
(415, 'Municipalidad Temuco', 'Antonio Varas 880                            ', '', 2),
(416, 'Mutual De Seguridad C.Ch.C ', 'Avda L.Bdo Ohiggins 4848                     ', '', 2),
(417, 'Mutual De Seguridad C.Ch.C.', 'Autpista Concepción Talcahuano 8720          ', '', 2),
(418, 'Mutual Seguridad C. Ch. C ', 'Av. L. B. O''Higgins 4848                     ', '', 2),
(419, 'Pontificia U. Catolica ', 'Marcoleta #367                               ', '', 2),
(420, 'S. S. Arica', '18 De Septiembre 1000                        ', '', 2),
(421, 'S..S.A. Hospital San Camilo ', 'Miraflores 2085                              ', '', 2),
(422, 'S.s. Aacongagua', 'Pasaje Juana Ross N° 928                     ', '', 2),
(423, 'S.S. Antofagasta', 'Simon Bolivar 523                            ', '', 2),
(424, 'S.S. Valpo S  Antonio Cons.Jean', 'Av. Brasil #  1435                           ', '', 2),
(425, 'S.S. Viña-Quillota', 'Avda. Limache N. 1307 Viña del Mar           ', '', 2),
(426, 'S.S.A Hosp.San Fco.Llay Llay ', 'San Francisco  N. 76                         ', '', 2),
(427, 'S.S.A. Hosp..San Antonio Putaendo ', '', '', 2),
(428, 'S.S.Ararucania', 'Carrera 301                                  ', '', 2),
(429, 'S.S.Ararucania Sur', 'Arturo Prat 969                              ', '', 2),
(430, 'S.S.Talcahuano', 'Thompson 86                                  ', '', 2),
(431, 'S.S:Aconcagua Con.Los Andes', '', '', 2),
(432, 'Sanatorio Aleman ', '', '', 2),
(433, 'Ser. Sal. Met. Sur Orient ', 'Avda Concha Y Toro 3459                      ', '', 2),
(434, 'Serv Salud Metropolitano Sur ', 'Santa Rosa  3453                             ', '', 2),
(435, 'Serv Salud Norte Hosp. San Jose ', 'San Jose 1126                                ', '', 2),
(436, 'Serv. De Salud Arica ', 'Arturo Prat 305                              ', '', 2),
(437, 'Serv. De Salud Coquimbo ', '', '', 2),
(438, 'Serv. Medicos Tabancura ', 'Av. Tabancura  1185                          ', '', 2),
(439, 'Serv. Nac. Sal. Del Maule ', '', '', 2),
(440, 'Serv. Sal. Antofagasta ', '', '', 2),
(441, 'Serv. Sal. Del Reloncavi ', 'Egaña  # 85                                  ', '', 2),
(442, 'Serv. Sal. Valpo-Sn.Anton ', 'Brasil 1435                                  ', '', 2),
(443, 'Serv. Salud Aconcagua ', 'Juana Ross 928                               ', '', 2),
(444, 'Serv. Salud Araucania ', 'Prat # 969                                   ', '', 2),
(445, 'Serv. Salud Del Maule              ', '', '', 2),
(446, 'Serv. Salud Metropolitano Norte ', 'Maruri  272                                  ', '', 2),
(447, 'Serv. Salud Talcahuano ', 'Thompson 86                                  ', '', 2),
(448, 'Serv.De Salud Nuble ', 'Bulnes 502                                   ', '', 2),
(449, 'Serv.Salud Arauco ', 'Carrera # 301                                ', '', 2),
(450, 'Serv.Salud Metropolitano Oriente ', '', '', 2),
(451, 'Servicio de Salud Iquique', 'ANIBAL PINTO 815                             ', '', 2),
(452, 'Servicio Salud Iquique ', 'Zeger 536                                    ', '', 2),
(453, 'Servicio Salud Valdivia ', 'Chacabuco 700                                ', '', 2),
(454, 'Soc. Clin. Renaca S.A. ', 'Anabaena # 336  Reñaca                       ', '', 2),
(455, 'Soc.Clin. Del Dolor Concepcion Ltda', 'Castellon # 316 Oficina 801                  ', '', 2),
(456, 'Soc.Med.De Estab.Clim.De Salud ', 'Carr.Cobre Ed.Freire 884                     ', '', 2),
(457, 'SOCIEDAD FARMACEUTICA ANTARES ', 'GRAL HOLLEY 2371 LOC 3                       ', '', 2),
(458, 'Universidad de Chile ', 'Santos Dumont                                ', '', 2),
(459, 'Universidad De Concepcion ', 'Barrio Univers.- Dir de Serv. Estudiantiles  ', '', 2),
(461, 'ALA DE COMBATE No.22 ', 'AV.PEDRO MENENDEZ GILBERT  BASE AEREA SIMON BOLIVAR', '+593 4 2282570', 3),
(462, 'AREA DE SALUD # 16 DAULE ', '9 DE OCTUBRE SOLAR 3 CALLE  QUINTA 169 JUNTO COLEGIO', '+593 4 2795338', 3),
(463, 'AREA DE SALUD #19 ', 'PEDRO QUIÑONEZ Y MALDONADO  ', '+593 2 2692103', 3),
(464, 'AREA DE SALUD 3 RIOVERDE ', '5 DE AGOSTO  ', '+593 6 2744199', 3),
(465, 'AREA DE SALUD 6 SAN LORENZO ', 'AV.CARCHI S/N  ', '+593 6 2780188', 3),
(466, 'AREA DE SALUD N. 6 BABA ', 'QUITO S/N Y URDANETA  ', '+593 5 2919144', 3),
(467, 'AREA DE SALUD No. 12 VILCABAMBA ', 'AV. DE LA ETERNA JUVENTUD #0844  ENTRADA A VILCABAMBA', '+593 7 2640188', 3),
(468, 'AREA DE SALUD NO. 2 ATUNTAQUI ', 'OLMEDO 16-29 Y JUAN DE VELASCO  ', '+593 6 2906107', 3),
(469, 'AREA DE SALUD No. 3 AMBATO ', 'BENJAMIN CARRION Y OSCAR EFREN  ', '+593 3 2411939', 3),
(470, 'AREA DE SALUD No. 4 ATACAMES ', 'RAFAEL PALACIOS Y OLMEDO  ', '+593 6 2731353', 3),
(471, 'AREA DE SALUD No. 5 DE BAHIA ', 'CECILIO INTRIAGO S/N Y  MARAÑON', '+593 5 2690706', 3),
(472, 'AREA DE SALUD No. 6 LA LIBERTAD ', 'CALLE OLEARY OE 884 Y PUNAES  ', '+593 2 2287378', 3),
(473, 'AREA DE SALUD NO.3 ', 'STO. DOMINGO DE LOS COLORADOS 7-74  MACHALA', '+593 7 2571645', 3),
(474, 'AREA DE SALUD No.7 QUERO CEVALLOS (CGFSLS)', 'GARCIA MORENO Y BOLIVAR  ', '+593 3 2746249', 3),
(475, 'CASA CUNA GANGOTENA POSSE ', 'ROCAFUERTE 834  ', '+593 2 2211135', 3),
(476, 'CENTRO A.A.JIPIJAPA IESS SEGURO DE SALUD', 'KM 1 VIA PUERTO CAYO  ', '+593 5 2600337', 3),
(477, 'CENTRO DE ATENCION AMBULATORIA DE SAN JUAN', 'GUATEMALA 352 Y MATEO  ', '+593 2 2573317', 3),
(478, 'CENTRO DE ATENCION AMBULATORIA DE SANGOLQUI', 'AV ATAHUALPA Y AV FLORIDA  ', '+593 2 2080707', 3),
(479, 'CENTRO DE ATENCION AMBULATORIA IESS SANTO DOMINGO', 'AV. QUITO Y LOS NARANJOS  ', '+593 2 2750930', 3),
(480, 'CENTRO DE ATENCION AMBULATORIA LA TRONCAL', '4 DE NOV. Y CALLE NAPO  ', '+593 7 4206832', 3),
(481, 'CENTRO DE ESPECIALIDADES COMITE DEL PUEBLO', 'JUNCAL LOTE 100 Y AMESABA  ', '2 3968200', 3),
(482, 'COMANDO CONJUNTO DE LAS FUERZAS ARMADAS', 'AV MALDONADO S/N DIAGONAL AL  COLEGIO ABDON CALDERON', '+593 2 2285397', 3),
(483, 'COMPAÑIA DE HIJAS DE LA CARIDAD SAN VICENTE DE PAUL', '13 DE JUNIO S/N Y 26 DE MAYO  ', '+593 6 2329200', 3),
(484, 'COORDINACION ZONAL 8 - SALUD ', 'AV CARLOS LUIS PLAZA DAÑIN Y  FRANCISCO BOLOÑA', '+593 4 2591056', 3),
(485, 'DIRECCION DISTRITAL 01D01 PARROQUIAS URBANAS Y RURALES SALUD', 'HUAYNACAPAC 1-27 Y PISARCAPAC  DIAGONAL AL BANCO CENTRAL', '+593 7 2867071', 3),
(486, 'DIRECCION DISTRITAL 01D02 PARROQUIAS URBANAS Y RURALES SALUD', 'AV 12 DE ABRIL 5-99 Y SOLANO  ', '+593 7 2836352', 3),
(487, 'DIRECCION DISTRITAL 01D03 GIRON A SANTA ISABEL SALUD', 'AV. RAFAEL GALARZA Y CESAR CASTILLO  ', '+593 7 2270645', 3),
(488, 'DIRECCION DISTRITAL 01D04 CHORDELEG GUALACEO-SALUD', 'MANUEL ANTONIO REYES S/N Y  NUEVE DE OCTUBRE', '593 7 2258387', 3),
(489, 'DIRECCION DISTRITAL 01D05 NABON OÑA SALUD', 'AV GIRON S/N Y AV PADRE CARLOS  SOLANO', '+593 7 2227009', 3),
(490, 'DIRECCION DISTRITAL 01D07CAMILO PONCE ENRIQUEZ-SALUD', 'FRANCISCO VIDAL S/N Y GUERRERO  DETRAS DE LA IGLESIA CENTRAL', '+593 7 2430008', 3),
(491, 'DIRECCION DISTRITAL 01D08 SIGSIG SALUD', 'AV. KENNEDY S/N VIA A PUERTO BELEN  ', '+593 7 2266115', 3),
(492, 'DIRECCION DISTRITAL 02D03 CHIMBO SAN  MIGUEL SALUD', 'JUAN PIO DE MORA Y  CESAR ABEL PAZMIÑO', '+593 3 2989416', 3),
(493, 'DIRECCION DISTRITAL 03D01 AZOGUEZ BIBLIAN DELEG SALUD', 'SALOME 011 Y BOLIVAR  ', '+593 7 2240192', 3),
(494, 'DIRECCION DISTRITAL 03D02 CAÑAR EL TAMBO SUSCAL SALUD', 'CHIMBORAZO S/N ALFONSO ALVARADO  ', '', 3),
(495, 'DIRECCION DISTRITAL 03D03 LA TRONCAL SALUD', 'SAN GABRIEL Y TERCERA SUR S/N  SAN GABRIEL', '7 2422443', 3),
(496, 'DIRECCION DISTRITAL 04D03 ESPEJO MIRA SALUD', 'JOSE BENIGNO GRIJALVA 9130  PANAMERICANA ANTIGUA', '6 2977166', 3),
(497, 'DIRECCION DISTRITAL 05D01LATACUNGA SALUD', 'MARQUEZ DE MAENZA Y SANCHEZ DE  ORELLANA', '+593 3 2730644', 3),
(498, 'DIRECCION DISTRITAL 05D02 LA MANA SALUD', 'AV 19 DE MAYO S/N MEDARDO  ANGEL SILVA', '3 2688342', 3),
(499, 'DIRECCION DISTRITAL 05D04-PUJILI SAQUISILI-SALUD', 'JUAN SALINAS 700  Y AV VELASCO IBARRA', '+593 3 2723980', 3),
(500, 'DIRECCION DISTRITAL 05D05 SIGCHOS-SALUD', 'RODRIGO ITURRALDE S/N Y ELOY  ', '', 3),
(501, 'DIRECCION DISTRITAL 05D06 SALCEDO SALUD', 'PANAMERICANA NORTE,JUNTO A LA  HOSTERIA RUMIPAMBA DE LAS ROSA', '+593 3 2726144', 3),
(502, 'DIRECCIÓN DISTRITAL 06D02 ALAUSI CHUNCHI SALUD', 'PABLO J DÁVILA S/N GUIDO CATANI  ', '', 3),
(503, 'DIRECCION DISTRITAL 06D04 COLTA GUAMOTE SALUD', 'AV. SIMON BOLIVAR S/N  ', '+593 3 2916198', 3),
(504, 'DIRECCION DISTRITAL 06D05 GUANO PENIPE SALUD', 'SIMON BOLIVAR Y AV VILLAGOMEZ  ', '+593 3 2961524', 3),
(505, 'DIRECCION DISTRITAL 07D01 CHILLA EL GUABO PASAJE SALUD', 'AV QUITO S/N Y SUCRE  ', '7 2916044', 3),
(506, 'DIRECCION DISTRITAL 07D02 MACHALA SALUD', 'BOYACA 508 ENTRE COLON Y TARQU  ', '+593 7 2963466', 3),
(507, 'DIRECCION DISTRITAL 07D03 ATAHUALPA PORTOVELO ZARUMA SALUD', 'DR. CARLOS REYES S/N JUNTO  UNID.EDUCATIVA DON BOSCO', '7 2973612', 3),
(508, 'DIRECCION DISTRITAL 07D04 BALSAS MARCABELI PIÑAS SALUD', 'BARRIO SAN JOSE  ', '+593 7 2976301', 3),
(509, 'DIRECCION DISTRITAL 07D05 ARENILLAS HUAQUILLAS LAS LAJAS SALUD', 'MARTHA BUCARAM Y 6 DE OCTUBRE  ADBON CALDERON', '+593 7 2510407', 3),
(510, 'DIRECCION DISTRITAL 07D06 SANTA ROSA-SALUD', 'AV.JOFFRE LIMA 506 Y FRANCO ROMERO  ', '+593 7 2943118', 3),
(511, 'DIRECCION DISTRITAL 08D01 ESMERALDAS SALUD', 'VENEZUELA Y ECUADOR  SECTOR AIRE LIBRE AV COLON FRENTE A LA CRUZ ROJA', '+593 6 2711427', 3),
(512, 'DIRECCION DISTRITAL 08D02 ELOY ALFARO-SALUD', 'ELOY ALFARO Y BORBON  ', '+593 6 2786542', 3),
(513, 'DIRECCION DISTRITAL 09D01 XIMENA 1 PARROQUIA RURAL PUNA ESTUARIO', 'FRANCISCO SEGURA 1114 ENTRE  AV QUITO Y SAN SALVADOR', '4 2442027', 3),
(514, 'DIRECCION DISTRITAL 09D03 GARCIA MORENO A ROCA SALUD', 'CUENCA ENTRE CACIQUE ALVAREZ  Y NOGUCHI No600', '4 2419874', 3),
(515, 'DIRECCION DISTRITAL 09D04 FEBRES CORDERO SALUD', 'FRANCISCO MARCOS S/N Y CALLE IZANA  ', '', 3),
(516, 'DIRECCION DISTRITAL 09D06 TARQUI 2 SALUD', 'MAPASINGUE OESTE AV. QUINTA  ENTRE CALLE SEGUNDA Y TERCERA', '+593 4 2353907', 3),
(517, 'DIRECCION DISTRITAL 09D07 PASCUALES-1-SALUD', 'BASTION POPULAR 16  BLOQUE 3 MZ 806', '4 2115845', 3),
(518, 'DIRECCION DISTRITAL 09D08 PASCUALES 2 SALUD', 'VIA PERIMETRAL KM 26 SL48-49  ', '', 3),
(519, 'DIRECCION DISTRITAL 09D09 TARQUI 3 SALUD', 'VIA A LA COSTA KM 17 SOLAR 1  JUNTO A LAS OFICINAS HOLCIM', '4 2531037', 3),
(520, 'DIRECCION DISTRITAL 09D10 PROGRESO EL MORRO POSORJA SALUD', 'CALLE 4TA Y CALLE S/N CDLA EL MORRO  DIAGONAL AL MUELLE PUERTO MORRO', '9 93413775', 3),
(521, 'DIRECCION DISTRITAL 09D11 ALFREDO BAQUERIZO MORENO SIMON BOLIVAR', 'COOP. JUJAN 233 Y CALLE SEPTIMA  ', '4 2748278', 3),
(522, 'DIRECCION DISTRITAL 09D12 BALAO NARANJAL SALUD', 'EMILIO GONZALEZ S/N Y  CESAR AMADOR BAQUERIZO', '4 2750193', 3),
(523, 'DIRECCION DISTRITAL 09D13 BALZAR COLINES PALESTINA SALUD', 'AV. DEL ESTUDIANTE 102  Y VINCES DIAGONAL AL COLEGIO 26 DE SEPTIEMBRE', '', 3),
(524, 'DIRECCION DISTRITAL 09D14 ISIDRO AYORA LOMAS DE SARGENTILLO', 'AV HERIBERTH RUSSA S/N Y  MARIA AUXILIADORA', '4 2704671', 3),
(525, 'DIRECCION DISTRITAL 09D16 EL TRIUNFO GNRAL ANTONIO ELIZALDE', 'AV 9 DE OCTUBRE Y MOZART  SAFADI', '+593 4 2010171', 3),
(526, 'DIRECCION DISTRITAL 09D18 CRNEL MARCELINO MARIDUEÑA NARANJITO SALUD', 'GARCIA MORENO S/N Y VEINTIUNO  DE JULIO DIAGONAL A LA FARMACIA GALENICA', '4 2720194', 3),
(527, 'DIRECCION DISTRITAL 09D20 SALITRE SALUD', 'LA BOCANA CALLE AV 27 DE NOVIEMBRE  Y PADRE AGUIRRE S/N FRENTE A UNIDAD EDUCATIVA FRANCISCANO', '4 2792560', 3),
(528, 'DIRECCION DISTRITAL 09D21 SAN JACINTO DE YAGUACHI SALUD', 'VIA A BABAHOYO S/N CDLA  JOSE CEVALLO RUIZ S/N DIAGONAL A LA CASA COMUNAL', '4 2020165', 3),
(529, 'DIRECCION DISTRITAL 09D22-PLAYAS SALUD', 'AV. 15 DE AGOSTO VIA AL MORRO  2 CUADRAS COLEGIO RASHID TORBAR', '4 2764438', 3),
(530, 'DIRECCION DISTRITAL 09D23 SAMBORONDON SALUD', '31 DE OCTUBRE Y SARGENTO PAVON  JUNTO AL COLEGIO SAMBORONDON', '+593 4 2024711', 3),
(531, 'DIRECCION DISTRITAL 09D24 DURAN SALUD', '16 DE OCTUBRE S/N Y ELOY ALFARO  A 100MTS.FERROCARRIL DURAN', '+593 4 2800293', 3),
(532, 'DIRECCION DISTRITAL 10D01 IBARRA SALUD', 'GARCÍA MORENO 3-34 Y ROCAFUERTE  ', '+593 6 2957336', 3),
(533, 'DIRECCION DISTRITAL 10D02 ANTONIO ANTE-OTAVALO-SALUD', 'PASAJE MOREANO S/N Y QUITO  ', '', 3),
(534, 'DIRECCION DISTRITAL 10D03-COTACACHI SALUD', 'PEDRO MONCAYO Y SEGUNDO LUIS MORENO  ', '+593 6 2915118', 3),
(535, 'DIRECCION DISTRITAL 11D01 LOJA SALUD', 'SANTO DOMINGO DE LOS COLORADOS  RIOBAMBA Y MACHALA', '07 2 582387', 3),
(536, 'DIRECCION DISTRITAL 11D02 CATAMAYO CHAGUARPAMBA OLMEDO SALUD', '  18 DE NOVIEMBRE Y EUGENIO ESPEJO', '7 2677146', 3),
(537, 'DIRECCION DISTRITAL 11D03 PALTAS SALUD', 'AV PANAMERICANA Y LA AVELINA  ', '+593 7 2683326', 3),
(538, 'DIRECCION DISTRITAL 11D04 CELICA PINDAL PUYANGO SALUD', 'AV. PIO JARAMILLO Y RIO 9 DE  DICIEMBRE', '+593 7 2680172', 3),
(539, 'DIRECCION DISTRITAL 11D06CALVAS- GONZANAMA-QUILANGA-SALUD', 'AV. LOJA Y CDLA. CRESPO  ', '+593 7 2687050', 3),
(540, 'DIRECCION DISTRITAL 11D08 SARAGURO SALUD', 'JUAN ANTONIO CASTRO Y CALASANZ  ', '+593 7 2200113', 3),
(541, 'DIRECCION DISTRITAL 11D09 ZAPOTILLO SALUD', 'HERMANO MIGUEL S/N  A TRES METROS DE GASOLINERA', '7 2647113', 3),
(542, 'DIRECCION DISTRITAL 12D02 PUEBLOVIEJO URDANETA SALUD', 'AV. PINARGOTE Y LAS TECAS  ', '+593 5 2942141', 3),
(543, 'DIRECCION DISTRITAL 12D03 QUEVEDO MOCACHE SALUD', 'AV VIVA ALFARO S/N VIGESIMA PRIMERA  Y ATAHUALPA', '5 2752117', 3),
(544, 'DIRECCION DISTRITAL 12D06 BUENA FE VALENCIA SALUD', '16 DE AGOSTO SOLAR 2 Y QUEVEDO  ', '', 3),
(545, 'DIRECCION DISTRITAL 13D01 PORTOVIEJO-SALUD', 'OLMEDO S/N Y 10 DE AGOSTO EDIFICIO  MUTUALISTA MANABI', '+593 5 2612229', 3),
(546, 'DIRECCION DISTRITAL 13D05- EL CARMEN-SALUD', 'AV. 3 DE JULIO S/N Y BARRIO  LA FLORESTA', '+593 2 2660808', 3),
(547, 'DIRECCION DISTRITAL 13D06 JUNIN BOLIVAR SALUD', 'CHILE ENTRE RICAURTE Y  GRANDA CENTENO', '+593 5 2685980', 3),
(548, 'DIRECCION DISTRITAL 13D08 PICHINCHA SALUD', 'VIA MANTA-QUEVEDO S/N  ', '593 5 2323096', 3),
(549, 'DIRECCION DISTRITAL 13D09 PAJAN SALUD', '9 DE OCTUBRE 347 Y 1ERA TRANS-  VERSAL', '+593 5 2649388', 3),
(550, 'DIRECCION DISTRITAL 13D10 JAMA PEDERNALES SALUD', 'LOPEZ CASTILLO Y 3 DE NOVIEMBRE  ', '5 2681500', 3),
(551, 'DIRECCION DISTRITAL 13D12 ROCAFUERTE TOSAGUA SALUD', 'PORTOVIEJO-RIOCHICO KM 5 S/N  ', '+593 5 2644214', 3),
(552, 'DIRECCION DISTRITAL 14D01 MORONA SALUD', 'GABINO RIVADENERIA Y 9 DE OCT  ', '+593 7 2700134', 3),
(553, 'DIRECCION DISTRITAL 14D02 HUAMBOYA PABLO SEXTO PALORA SALUD', 'AV.CUMANDA S/N  ', '+593 7 2312148', 3),
(554, 'DIRECCION DISTRITAL 14D03 LOGROÑO SUCUA-SALUD', 'EDMUNDO CARVAJAL 10001 Y ALCIDES  VENTIMILLA', '+593 7 2740814', 3),
(555, 'DIRECCION DISTRITAL 14D04 GUALAQUIZA SAN JUAN BOSCO SALUD', '24 DE MAYO S/N Y GONZALO PESANTEZ  ', '7 2781136', 3),
(556, 'DIRECCION DISTRITAL 14D05-TAISHA SALUD', 'SIN NOMBRE S/N  DIAGONAL A LA MISION SALESIANA', '+593 7 3900008', 3),
(557, 'DIRECCION DISTRITAL 14D06 LIMON INDANZA-SANTIAGO TIWINTSA-SALUD', 'GONZALO PESANTEZ Y ALFONSO SERRANO  ', '+593 7 2760354', 3),
(558, 'DIRECCION DISTRITAL 15D01 ARCHIDONA CARLOS JULIO AROSEMENA TOLA', 'RUBEN CEVALLOS S/N Y AYAGUASCA  ', '+593 6 2886480', 3),
(559, 'DIRECCION DISTRITAL 15D02 EL CHACO QUIJOS SALUD', 'RIO COCA 05 Y 5 DE MARZO  ', '+593 6 2320117', 3),
(560, 'DIRECCION DISTRITAL 16D01 PASTAZA MERA SANTA CLARA-SALUD', 'GUAYAS Y GUARANDA BARRIO OBRERO  EDIF CENTRO DE SALUD URBANO', '+593 3 2884194', 3),
(561, 'DIRECCION DISTRITAL 17D01 NANEGAL A GUALEA SALUD', 'ELOY ALFARO S/N Y GUAYAQUIL  ', '+593 2 2116197', 3),
(562, 'DIRECCION DISTRITAL 17D02 PARROQUIAS RURALES SALUD', 'LIZARDO BECERRA ENTRE 9 DE AGOSTO  Y CARAPUNGO', '+593 2 2820285', 3),
(563, 'DIRECCION DISTRITAL 17D03EL CONDADO A CALACALI SALUD', 'AV. JOHN F.KENNEDY N66-93 Y  LIZARDO RUIZ', '+593 2 2530787', 3),
(564, 'DIRECCION DISTRITAL 17D04PUENGASI A ITCHIMBIA', 'RIOS N4-183 Y CHILE LA TOLA  ', '+593 2 3161801', 3),
(565, 'DIRECCION DISTRITAL 17D05 LA CONCEPCION A ZAMBIZA-SALUD', 'AV. MARISCAL SUCRE S/N Y BERNARDO  DE LEGARDA', '+593 2 3211231', 3),
(566, 'DIRECCION DISTRITAL 17D06 CHILIBULO A LLOA SALUD', 'MA. DUCHICELA S9-10 Y CARANQUI  ', '+593 2 2655150', 3),
(567, 'DIRECCION DISTRITAL 17D08 CONOCOTO A LA MERCED SALUD', 'ELOY ALFARO N4-61 Y MATILDE ALBAN  ', '+593 2 3814990', 3),
(568, 'DIRECCION DISTRITAL 17D09 TUMBACO A TABABELA SALUD', 'PANAMERICANA AV ELOY ALFARO  VIA EL QUINCHE', '+593 2 2777192', 3),
(569, 'DIRECCION DISTRITAL 17D10 CAYAMBE PEDRO MONCAYO SALUD', 'AV.CORDOVA GALARZA OE5-65  Y MIRAFLORES', '+593 2 2360072', 3),
(570, 'DIRECCION DISTRITAL 17D11 MEJIA RUMIÑAHUI SALUD', 'LUIS CORDERO #1280 Y QUITO  SECTOR HOSP CANTONAL SANGOLQUI', '+593 2 2081384', 3),
(571, 'DIRECCION DISTRITAL 17D12PVM-PQ-SMB SALUD', 'ELIAS ESCOBAR S/N  A TRES CUADRAS DEL MERCADO', '+593 2 2392874', 3),
(572, 'DIRECCION DISTRITAL 18D03 BAÑOS DE AGUA SANTA SALUD', 'BARRIO NUEVO JUAN MONTALVO S/N  ', '+593 3 2740928', 3),
(573, 'DIRECCION DISTRITAL 18D04 PATATE SAN PEDRO DE PELILEO SALUD', 'JUAN DE VELASCO  S/N Y  ANTONIO RICAURTE', '+593 3 2630761', 3),
(574, 'DIRECCION DISTRITAL 18D05 SANTIAGO DE PILLARO SALUD', 'AV CARLOS CONTRERAS RUIZ S/N Y  AV. WILSON GOMEZ VARGAS', '+593 3 2873585', 3),
(575, 'DIRECCION DISTRITAL 19D01 YACUAMBI ZAMORA SALUD', '24 DE MAYO S/N Y AV. ALONSO  DE MERCADILLO', '7 2606042', 3),
(576, 'DIRECCION DISTRITAL 19D02 CENTINELA DEL CONDOR MARGARITZA PAQUISHA', 'AV. MALECON S/N Y CABO DANIEL  MARTINEZ', '7 3037421', 3),
(577, 'DIRECCION DISTRITAL 19D03 CHINCHIPE PALANDA SALUD', 'AV. AL COLEGIO S/N  ', '+593 7 3059780', 3),
(578, 'DIRECCION DISTRITAL 19D04 EL PANGUI YANZATZA SALUD', 'IVAN RIOFRIO Y 26 DE FEBRERO  ', '+593 7 2300345', 3),
(579, 'DIRECCION DISTRITAL 20D01 SAN CRISTOBAL SANTA CRUZ', 'AV.ALSACIO NORTHIA S/N Y QUITO  JUNTO A LA PERFECTURA APOSTOLICA DE GALAPAGOS', '5 2520305', 3),
(580, 'DIRECCION DISTRITAL 21D02LAGO AGRIO SALUD', 'MIGUEL ITURRALDE Y TUNGURAHUA  ', '+593 6 2820026', 3),
(581, 'DIRECCION DISTRITAL 22D01 LA JOYA DE LOS SACHAS SALUD', 'AV.MACHALA S/N A UNA CUADRA  COLEGIO OSCAR ROMERO', '+593 6 2897181', 3),
(582, 'DIRECCION DISTRITAL 22D02 ORELLANA LORETO SALUD', 'AV ALEJANDRO LABAKA S/N Y  ATAHUALPA', '6 2881688', 3),
(583, 'DIRECCION DISTRITAL 23D01 PARROQUIAS URBANAS (RIO VERDE', 'AV ABRAHAM CALAZACON 2502 Y  AV QUITO', '2 2758084', 3),
(584, 'DIRECCION DISTRITAL 24D01 SANTA ELENA SALUD', 'AV.MARQUEZ DE LA PLATA S/N  DETRAS DEL CEMENTERIO GENERAL', '+593 4 2910544', 3),
(585, 'DIRECCION DISTRITAL 24D02 LA LIBERTAD SALINAS SALUD', 'CDLA.FRANK VARGAS PAZZOS AV.  SAN JOSE S/N Y 44VA Y QUITO', '+593 4 2931672', 3),
(586, 'DIRECCION DISTRITAL DE SALUD 12D04 QUINSALOMA VENTANAS SALUD', '6 DE OCTUBRE S/N Y IGNACIO IBARRA  ', '5 2970219', 3),
(587, 'DIRECCION DISTRITAL DE SALUD No. 23D03', 'CALLE JUAN MONTALVO S/N BARRIO  SAN RAFAEL TRAS HOTEL ATOS', '+593 6 2726266', 3),
(588, 'DIRECCION DISTRITAL DE SALUD No.02D01', 'ESPEJO 210 Y CORONEL GARCIA  ', '+593 3 2980290', 3),
(589, 'DIRECCION DISTRITAL DE SALUD No.04D01', 'JUNIN Y RAFAEL ARELLANO ESQ.  ', '+593 6 2980296', 3),
(590, 'DIRECCION DISTRITAL DE SALUD No.05D03', 'AV.GENERAL ENRIQUEZ GALLO S/N  Y WENCESLAO BELTRAN', '+593 3 2684196', 3),
(591, 'DIRECCION DISTRITAL DE SALUD No.08D04', 'VICTOR VILLEGAS Y 3 DE JULIO  FRENTE SINDICATO DE CHOFERES', '', 3),
(592, 'DIRECCION DISTRITAL DE SALUD No.09D15', 'EL EMPALME S/N Y COOP 29 DE  OCTUBRE', '+593 4 2962372', 3),
(593, 'DIRECCION DISTRITAL DE SALUD No.11D05', 'AV. 27 DE ABRIL S/N  ', '+593 7 2653265', 3),
(594, 'DIRECCION DISTRITAL DE SALUD No.11D07', 'CABO SANCHEZ S/N Y CATAMAYO  ', '+593 7 2694956', 3),
(595, 'DIRECCION DISTRITAL DE SALUD No.12D01', 'CALLE G Y VARGAS MACHUCA  ', '+593 5 2735432', 3),
(596, 'DIRECCION DISTRITAL DE SALUD No.13D07', 'BOLIVAR S/N Y VARGAS TORRES  ALEJO LASCANO', '+593 5 2698280', 3),
(597, 'DIRECCION DISTRITAL DE SALUD No.18D01', 'LALAMA 04-29 Y CUENCA  ATRAS DEL JUAN MONTALVO', '+593 3 2822026', 3),
(598, 'DIRECCION DISTRITAL DE SALUD No.20D01', 'AV.ALSACIO NORTHIA S/N Y QUITO  ', '+593 5 2520118', 3),
(599, 'DIRECCION DISTRITAL DE SALUD No.23D02', 'URB. ECHANIQUE CUEVA CALLE VIA  AL BUA Y AV ESMERALDAS', '+593 2 2752850', 3),
(600, 'DIRECCION DISTRTTAL 21D04 SHUSHUFINDI SALUD TIPO I', 'CHILE Y 10 DE AGOSTO  ', '+593 6 2840013', 3),
(601, 'DIRECCION NACIONAL DE SALUD DE LA POLICIA NACIONAL', 'MARIANA DE JESUS  OCCIDENTAL', '+593 2 2263660', 3),
(602, 'DIRECCION PROVINCIAL DE SALUD DE MANABI', 'ROCAFUERTE 106 Y 12 DE MARZO  Y ELOY ALFARO', '+593 5', 3),
(603, 'DIRECCION PROVINCIAL DE SALUD DE SANTO DOMINGO DE LOS TSACHILAS', 'RIO ZAMORA 20-215  ', '+593 2 2763593', 3),
(604, 'DISTRITAL DE SALUD N01D06 EL PAN DE SEVILLA DE ORO SALUD', 'AV.CIRCUNVALACION S/N  (FRENTE AL CEMENTERIO HOSPITAL PAUTE)', '+593 7 2250107', 3),
(605, 'EMPRESA MUNICIPAL DE SERVICIOS DE SALUD DE MACHALA', 'AV 25 DE JUNIO Y 9 DE MAYO ESQ  4TO. PISO', '+593 7 2963775', 3),
(606, 'ENFARMA EP ', 'PORTETE E11-27 GREGORIO MUNGA  MANZANA D BLOQUE 15 OFICINA PB', '+593 2 3825790', 3),
(607, 'FARMACIA INSTITUCIONAL AREA DE SALUD No.2', 'AVE 24 Y CALLE 13  ', '+593 5 2612229', 3),
(608, 'GOBIERNO AUTONOMO DESCENTRALIZADO MUNICIPAL DE GUAYAQUIL', 'PICHINCHA 605 Y 10 DE AGOSTO  ', '+593 4 2599100', 3),
(609, 'HOGAR DE ANCIANOS Y AISLAMIENTO ', 'ESPEJO 1158 Y VEINTE Y  CUATRO DE MAYO', '+593 3 2969637', 3),
(610, 'HOSPITAL BASICO 1 BI EL ORO ', 'SUCRE S/N Y AV JUBONES  ', '+593 7 2915172', 3),
(611, 'HOSPITAL BASICO 17 BS ', 'AV. CESLAO MARIN S/N Y CALLE  LOS PINDOS', '+593 3 2885542', 3),
(612, 'HOSPITAL BASICO 7BI LOJA ', 'COLON 13-14 ENTRE BOLIVAR Y  BERNARDO VALDIVIESO', '+593 4 2461935', 3),
(613, 'HOSPITAL BASICO BACO ', 'AMAZONAS S/N Y ANTONIO CLAVIJO  ', '+593 3 2810312', 3),
(614, 'HOSPITAL BASICO DEL CANTON PICHINCHA', 'PICHINCHA S/N MANTA-QUEVEDO KM  1 VIA VALAREZO', '+593 5 2323072', 3),
(615, 'HOSPITAL BASICO IV DE ', 'VIA LOS ZORROS S/N  ', '+593 6 2881671', 3),
(616, 'HOSPITAL BRIGADA N°11 GALAPAGOS ', 'AV.DE LOS HEROES  ', '+593 3 2941846', 3),
(617, 'HOSPITAL CANTONAL DE GIRON ', 'ANTONIO FLOR S/N ENTRE LEOPOLDO  PEÑAHERRERA 1 CUADRA ESCUELA', '+593 7 2275115', 3),
(618, 'HOSPITAL CHILLANES AREA NO. 3 ', 'GARCIA MORENO  ', '+593 3 2978369', 3),
(619, 'HOSPITAL DE ALAUSI ', 'PABLO J.DAVILA S/N A UNA CUADRA DEL  SINDICATO DE CHOFERES', '+593 3 2930168', 3),
(620, 'HOSPITAL DE ATENCION INTEGRAL DEL ADULTO MAYOR', 'ANGEL LUDEÑA 1105 Y  PEDRO DE ALVARADO', '+593 2 2291780', 3),
(621, 'HOSPITAL DE ESPECIALIDADES FUERZAS ARMADAS No.1', 'QUESERAS DEL MEDIO NO.E11-278 (521)  Y AV. COLOMBIA', '+593 2 2520571', 3),
(622, 'HOSPITAL DE ESPECIALIDADES GUAYAQUIL "DR ABEL GILBERT PONTON"', '29 Y GUAYAQUIL  ', '+593 4 2601000', 3),
(623, 'HOSPITAL DE INFECTOLOGIA ', 'JULIAN CORONEL 900 Y J.MASCOTE  FRENTE AL INSTITUTO DE HIGIENE', '+593 2 2280542', 3),
(624, 'HOSPITAL DEL DIA DOCTOR EFREN JURADO LOPEZ', 'ARGENTINA 100 Y ELOY ALFARO  ', '+593 4 2581079', 3),
(625, 'HOSPITAL DEL NIÑO DR. FRANCISCO DE YCAZA BUSTAMANTE', 'AV.QUITO Y G. RENDON  ', '+593 5', 3),
(626, 'HOSPITAL DELFINA TORRES DE CONCHA ', 'AV. LIBERTAD Y MANABI  ', '+593 6 2722778', 3),
(627, 'HOSPITAL DERMATOLOGICO GONZALO GONZALEZ', 'PABLO GUEVERA Y ANTONIO SIERRA  ', '+593 2 2552549', 3),
(628, 'HOSPITAL DERMATOLOGICO LEPROCOMIO MARIANO ESTRELLA', 'ZENON S/N Y CAMINO A LAZARETO  JUNTO CANCHAS', '+593 7 2847427', 3),
(629, 'HOSPITAL DR.GUSTAVO DOMINGUEZ Z. ', 'AV.LAS DELICIAS S/N Y AV.QUITO  ', '+593 2 2750336', 3),
(630, 'HOSPITAL EUGENIO ESPEJO ', 'AV.GRAN COLOMBIA S/N YAGUACHI  DEPARTAMENTO FINANCIERO SR.SALAS', '+593 2 2507928', 3),
(631, 'HOSPITAL FRANCISCO DE ORELLANA ', 'KM.1/2 VIA COCA-LAGO  ', '+593 6 2880139', 3),
(632, 'HOSPITAL GENERAL DE CHONE ', 'AV AMAZONAS S/N Y MANUEL DE JESUS  ALVAREZ', '+593 5 2698933', 3),
(633, 'HOSPITAL GENERAL DE MACAS ', 'EULALIA VELIN S/N Y MACAS FUENTE  ', '+593 7 2702247', 3),
(634, 'HOSPITAL GENERAL DOCENTE DE CALDERON', 'GIOVANNI SN Y DERBY  ', '3 3814400', 3),
(635, 'HOSPITAL GENERAL DR. LIBORIO PANCHANA SOTOMAYOR', 'AV.MARQUEZ DE LA PLATA S/N  DETRAS DEL CEMENTERIO GENERAL', '+593 4 2910544', 3),
(636, 'HOSPITAL GENERAL ENRIQUE GARCES ', 'CHILIBULO S/N Y ENRIQUE GARCES  ', '+593 2 2614456', 3),
(637, 'HOSPITAL GENERAL HOMERO CASTANIER ', 'AV.ANDRES F.CORDOVA Y LUIS GONZALEZ  ', '+593 7 2240104', 3),
(638, 'HOSPITAL GENERAL II DE LIBERTAD ', 'P.M.GILBERT S/N Y AV.DEMOCRACIA  ', '+593 4 2282502', 3),
(639, 'HOSPITAL GENERAL III DE TARQUI ', 'AV.12 DE ABRIL 521 Y FEDERICO MALO  ', '+593 7 2831224', 3),
(640, 'HOSPITAL GENERAL JIPIJAPA ', 'EUGENIO ESPEJO S/N Y 12 DE OCTUBRE  ', '+593 5 2600377', 3),
(641, 'HOSPITAL GENERAL PROVINCIAL LUIS G. DAVILA', '10 DE AGOSTO #12051 Y LOJA  ', '+593 6 2980316', 3),
(642, 'HOSPITAL GENERAL SANTO DOMINGO ', 'AV. EMILIO LORENZO STHELE S/N  FRENTE FARMACIA PASTEUR', '+593 2 2762002', 3),
(643, 'HOSPITAL GENERAL TEOFILO DAVILA ', 'BUENAVISTA S/N Y BOYACA  ', '+593 7 2937581', 3),
(644, 'HOSPITAL GINECO-OBSTETRICO DE NUEVA AURORA LUZ ELENA ARISMENDI', 'NUEVA AURORA QUITUMBE ÑAN S/N  PLANTA BAJA JUNTO AL CONJUNTO RESIDENCIAL DEL EJERCITO', '2 3931020', 3),
(645, 'HOSPITAL GINECO-OBSTETRICO ISIDRO AYORA', 'AV.COLOMBIA N14-66 Y SODIRO  ', '+593 2 2527112', 3),
(646, 'HOSPITAL J.M.V. IBARRA DE TENA ', 'AV.15 NOV.1598/ELOY ALFARO  ', '+593 6 2886405', 3),
(647, 'HOSPITAL J.M.VELASCO IBARRA DE TENA ', 'AV.15 NOVIEMBRE 1598  ELOY ALFARO', '+593 6', 3),
(648, 'HOSPITAL LEON BECERRA MILAGRO ', 'CARLOS CHIRIGUAYA S/N Y  TORRES CAUSANA', '+593 4 2970148', 3),
(649, 'HOSPITAL LUIS F. MARTINEZ ', 'AV.COLON Y PANAMERICANA SUR  ', '+593 7 2235077', 3),
(650, 'HOSPITAL MARIA LORENA SERRANO ', 'PANAMERICANA SUR ENTRE CARCHI  Y 9 DE MAYO', '+593 7 2950221', 3),
(651, 'HOSPITAL MARIANA DE JESUS ', '27AVA Y ROSENDO AVILES  ', '4 2845868', 3),
(652, 'HOSPITAL MATERNIDAD MARIANA DE JESUS', 'AV. 27 S/N Y ROSENDO AVILES  CHAMBERS', '+593 4 2845686', 3),
(653, 'HOSPITAL MATILDE HIDALGO DE PROCEL ', 'OLFA DE BUCARAM S/N Y 29/MAYO  GUASMO SUR-COOP CAUSA PROLETAR', '+593 4 2480759', 3),
(654, 'HOSPITAL MIGUEL HILARIO ALCIVAR ', 'LEONIDAS PLAZA ROCAFUERTE Y  VIRGILIO STOOPER', '+593 5 2398420', 3),
(655, 'HOSPITAL MOVIL N.-1 ', 'VIA DAULE KM 10.5  CAMILO PONCE Y CARLOS J AROSEMENA', '+593 4 2581740', 3);
INSERT INTO `Institution` (`id`, `name`, `address`, `phone`, `id_country`) VALUES
(656, 'HOSPITAL MOVIL No.2 ', 'SAN JAVIER N26-175 Y ORELLANA  ', '+593 9 99651987', 3),
(657, 'HOSPITAL MUNICIPAL NUESTRA SEÑORA DE LA MERCED', 'ISIDRO VITERI Y GERTRUDIS ESPARZA  ', '+593 3 2849047', 3),
(658, 'HOSPITAL NAVAL DE ESMERALDAS ', 'AV. KENNEDY S/N FRENTE AL  COLEGIO DE INGENIEROS CIVILES', '+593 6 2724151', 3),
(659, 'HOSPITAL NAVAL GUAYAQUIL ', 'AV. DE LA MARINA S/N  FRENTE AL PLANETARIO', '+593 4 2461267', 3),
(660, 'HOSPITAL NEUMOLOGICO ALFREDO JOSE VALENZUELA', 'BOYACA S/N Y LOJA  ', '+593 4 2581740', 3),
(661, 'HOSPITAL NICOLAS COTTO INFANTE ', 'SUCRE S/N Y 24 DE MAYO  ', '+593 5 2790028', 3),
(662, 'HOSPITAL OBSTETRICO ANGELA LOAYZA DE OLLAGUE', 'VEGA DAVILA Y BOLIVAR  ', '+593 7 2943141', 3),
(663, 'HOSPITAL OSKAR JANDL ', 'AV JAIME ROLDOS Y JUAN  PABLO SEGUNDO', '980467633', 3),
(664, 'HOSPITAL PEDIATRICO BACA ORTIZ ', 'AV.6 DE DICIEMBRE S/N Y AV. COLON  ', '+593 2 2552254', 3),
(665, 'HOSPITAL POLICIA NACIONAL ', 'AV.AMERICAS JORGE PERRONE  ', '+593 4 2285709', 3),
(666, 'HOSPITAL PROVINCIAL ALFREDO NOBOA MONTENEGRO', 'SELVA ALEGRE S/N Y JM.CISNEROS  ', '+593 3 2980230', 3),
(667, 'HOSPITAL PROVINCIAL DE PORTOVIEJO ', 'CALLE 12 MARZO S/N ROCAFUERTE  ', '+593 5 2636430', 3),
(668, 'HOSPITAL PROVINCIAL GENERAL DOCENTE AMBATO', 'AV.PASTEUR 41-44 Y UNIDAD NAC.  ', '+593 3 2821058', 3),
(669, 'HOSPITAL PROVINCIAL GENERAL DOCENTE RIOBAMBA', 'JUAN FELIX PROAÑO S/N Y CHILE  ', '+593 3 2628102', 3),
(670, 'HOSPITAL PROVINCIAL GENERAL DOCENTE VICENTE CORRAL MOSCOSO', 'AV. LOS ARUPOS Y 12 DE ABRIL  ', '+593 7 4096601', 3),
(671, 'HOSPITAL PROVINCIAL GENERAL ISIDRO AYORA', 'MANUEL AGUSTIN AGUIRRE S/N Y  JUAN JOSE SAMANIEGO', '+593 7 2587053', 3),
(672, 'HOSPITAL PROVINCIAL GENERAL JULIUS DOEPFNER', 'SEVILLA DE ORO S/N INTERSECCIO  FRANCISCO DE ORELLANA', '+593 7 2605395', 3),
(673, 'HOSPITAL PROVINCIAL GENERAL LATACUNGA', 'HNAS. PAEZ Y 2 DE MAYO  ', '+593 3 2800332', 3),
(674, 'HOSPITAL PROVINCIAL GENERAL LATACUNGA', 'HERMANAS PAEZ Y 2 DE MAYO  ', '+593 3 2800332', 3),
(675, 'HOSPITAL PROVINCIAL GENERAL PABLO ARTURO SUAREZ', 'ANGEL LUDEÑA S/N Y MACHALA  ', '+593 2 2296308', 3),
(676, 'HOSPITAL PROVINCIAL GENERAL PABLO ARTURO SUAREZ', 'ANGEL LUDEÑA S/N Y MACHALA  ', '+593 2 2296308', 3),
(677, 'HOSPITAL PROVINCIAL MARCO VINICIO IZA', 'AV. QUITO S/N Y VICENTE NARVAEZ  ', '+593 6 2834614', 3),
(678, 'HOSPITAL PROVINCIAL MARTIN ICAZA ', 'MALECON 1400 Y BARREIRO  ', '+593 5 2730181', 3),
(679, 'HOSPITAL PROVINCIAL PUYO ', '9 DE OCTUBRE S/N Y BOLIVAR FEICAN  ', '+593 3 2792938', 3),
(680, 'HOSPITAL PSIQUIATRICO JULIO ENDARA ', 'AV. GENRAL RUMIÑAHUI PUENTE 7  ', '+593 6 2736650', 3),
(681, 'HOSPITAL PSIQUIATRICO SAN LAZARO ', 'AMBATO 771 Y BAHIA  ', '+593 2 2286944', 3),
(682, 'HOSPITAL QUITO No. 1 DE LA POLICIA NACIONAL', 'AV.MARIANA DE JESUS Y  AV. OCCIDENTAL', '+593 2 2276256', 3),
(683, 'HOSPITAL QUITO No.1 DE LA POLICIA NACIONAL', 'AV.M.DE JESUS Y AV.OCCIDENTAL  ', '+593 2 2276256', 3),
(684, 'HOSPITAL REPUBLICA DEL ECUADOR ', 'BELTRA S/N Y TOMAS DE BERLANGA  ', '+593 5 2527439', 3),
(685, 'HOSPITAL RODRIGUEZ ZAMBRANO DE MANTA', 'CARRETERA VIA A SAN MATEO S/N  ', '+593 5 2611849', 3),
(686, 'HOSPITAL SAGRADO CORAZON DE JESUS ', 'GUAYACANES Y WALTER ANDRADE  FAJARDO 400 CALLE A 1 B', '+593 5 2756839', 3),
(687, 'HOSPITAL SAN ANDRES ', 'AV. CARLOS ALBERTO ARAY  ', '+593 5 2353034', 3),
(688, 'HOSPITAL SAN FRANCISCO DE QUITO ', 'JAIME ROLDOS AGUILERA No.40554  ', '+593 2 3995200', 3),
(689, 'HOSPITAL SAN LUIS DE OTAVALO ', 'SUCRE Y ESTADOS UNIDOS  ', '+593 6 2922461', 3),
(690, 'HOSPITAL SAN VICENTE DE PAUL ', 'L.VARGAS TORRES 1156 Y  PASQUEL MONJE', '+593 6 2957272', 3),
(691, 'HOSPITAL SAN VICENTE DE PAUL ', 'AV. QUITO S/N Y SUCRE FRENTE A  FARMACIA SUCRE', '7 2915546', 3),
(692, 'HOSPITAL TEOFILO DAVILA FARMACIA INSTITUCIONAL', 'BUENAVISTA Y BOYACA  ', '+593 7 2937581', 3),
(693, 'HOSPITAL UNIVERSITARIO DE GUAYAQUIL ', 'VIA PERIMETRAL KM 23 S/N  FRENTE A LA COMPAÑIA KUBIEC', '2 2594760', 3),
(694, 'I.E.S.S. HOSPITAL DE AMBATO ', 'RODRIGO PACHANO 10-76 Y  EDMUNDO MARTINEZ', '+593 3 2828600', 3),
(695, 'I.E.S.S. HOSPITAL DE ANCON ', 'BARRIO OTAVALO S/N  ', '+593 4 2906064', 3),
(696, 'I.E.S.S. HOSPITAL DE CHONE ', 'BARRIO SAN FELIPE S/N  ', '+593 5 2695370', 3),
(697, 'I.E.S.S. HOSPITAL DE IBARRA ', 'AV. VICTOR MANUEL GUZMAN S/N  ', '+593 6 2598193', 3),
(698, 'I.E.S.S. HOSPITAL DE LATACUNGA ', 'QUITO S/N Y LEOPOLDO PINO  SECTOR EL LORETO', '+593 3 2812570', 3),
(699, 'I.E.S.S. HOSPITAL DE MACHALA ', 'BOLIVAR S/N Y AYACUCHO  ', '+593 7 2962183', 3),
(700, 'I.E.S.S. HOSPITAL MANTA ', 'AV.LA CULTURA JUNTO A  PATRONATO MUNICIPAL', '+593 4 2452700', 3),
(701, 'I.E.S.S. HOSPITAL PORTOVIEJO ', 'PROLONGACION AV.MANABI Y  MANUEL PALOMEQUE', '+593 5 2635337', 3),
(702, 'I.E.S.S. HOSPITAL RIOBAMBA ', 'CHILE3929 Y AV.UNIDAD NACIONAL  ', '+593 3 2961811', 3),
(703, 'I.E.S.S. UNIDAD A.A.PORTOVIEJO ', 'COLON Y OLMEDO ESQUINA  FRENTE AL MUNICIPIO DE PORTOVIEJO', '+593 5 2630731', 3),
(704, 'I.E.S.S. UNIDAD DE A.A. LOS ESTEROS ', 'BARRIO LOS ESTEROS AV. 103 S/N  ', '+593 5 2623440', 3),
(705, 'I.E.S.S. UNIDAD DE ATENCION AMBULATORIA CALCETA', 'CLDA.MUNICIPAL AV.ESTUDIANTIL  ', '+593 5', 3),
(706, 'I.E.S.S.HOSPITAL DE MILAGRO ', 'AV.MIGUEL CAMPODONICO S/N Y MANUEL  ASCAZUBI DIAGONAL AL CUARTEL', '+593 4 2977773', 3),
(707, 'IESS CENTRO DE ATENCION AMBULATORIA DE NUEVA LOJA', 'AV. COLOMBIA S/N Y COFANES  ', '+593 6 2830615', 3),
(708, 'IESS CENTRO DE ATENCION AMBULATORIA ZAMORA', 'AV. DEL EJERCITO S/N  FRENTE COLEGIO 12 DE FEBRERO', '+593 7 2605349', 3),
(709, 'IESS HOSPITAL CARLOS ANDRADE MARIN ', '18 DE SEPTIEMBRE Y AYACUCHO  ', '+593 2 2562503', 3),
(710, 'IESS HOSPITAL DE BABAHOYO ', 'CALLE JUAN AGNOLETO S/N Y BYPASS  JUNTO A LAS CANCHAS', '+593 5 2730133', 3),
(711, 'IESS HOSPITAL DE DURAN ', 'GONZALO APARICIO S/N Y GUILLERMO  DAVIS JUNTO IGLESIA STA MARIA', '+593 4 2801032', 3),
(712, 'IESS HOSPITAL DE EL PUYO ', 'CESLAO MARIN 1021 Y CURARAY  ', '+593 3 2885761', 3),
(713, 'IESS HOSPITAL ESMERALDAS ', 'AV.COLON ENTRE GUAYAS Y LOJA  ', '+593 6 2727775', 3),
(714, 'IESS HOSPITAL MANUEL YGNACIO MONTEROS V.', 'IBARRA Y SANTO DOMINGO  ', '+593 7 2570214', 3),
(715, 'IESS HOSPITAL REGIONAL JOSE CARRASCO ARTEAGA', 'JOSE CARRASCO ARTEAGA S/N Y POPAYAN  ', '+593 7 2861500', 3),
(716, 'IESS HOSPITAL SANTO DOMINGO DE LOS TSACHILAS', 'AV. RIO LELIA S/N Y LA LORENA  ', '+593 2 3940800', 3),
(717, 'IESS SEGURO DE SALUD C.A.A. CENTRAL CUENCA', 'BOLIVAR 6 90 Y BORRERO  ', '+593 7 2841636', 3),
(718, 'IESS SEGURO DE SALUD CENTRO A.A. ALAUSI', 'ESTEBAN OROZCO S/N Y ANTONIO MORA  ', '+593 3 2930144', 3),
(719, 'IESS SEGURO DE SALUD CENTRO A.A. AZOGUES', 'VINTIMILLA 7-10 Y AYACUCHO  ', '+593 7 2247980', 3),
(720, 'IESS SEGURO DE SALUD CENTRO A.A. BAHIA', 'MALECON S/N Y RIOFRIO  ', '+593 2 3121302', 3),
(721, 'IESS SEGURO DE SALUD CENTRO A.A. CENTRAL', '0E2 FLORES N6-28 Y N7 OLMEDO  ', '+593 2 2957121', 3),
(722, 'IESS SEGURO DE SALUD CENTRO A.A. CENTRAL GUAYAS', 'ALBERTO REYNA 204 Y VILLAMIL  ', '593 4 2530757', 3),
(723, 'IESS SEGURO DE SALUD CENTRO A.A. CENTRAL LOJA', '10 DE AGOSTO S/N Y  AV. MANUEL AGUSTIN AGUIRRE', '+593 7 2572417', 3),
(724, 'IESS SEGURO DE SALUD CENTRO A.A. CHIMBACALLE', 'NAPO E1-64 Y CASITAGUA  ', '+593 2 2653444', 3),
(725, 'IESS SEGURO DE SALUD CENTRO A.A. COTOCOLLAO', 'AV.PRENSA N55-118 Y PULIDA  ', '+593 2 2590800', 3),
(726, 'IESS SEGURO DE SALUD CENTRO A.A. DE OTAVALO', 'ROCA #1 Y ABDON CALDERON  ', '+593 6', 3),
(727, 'IESS SEGURO DE SALUD CENTRO A.A. EL BATAN', 'LAS PALMERAS S/N Y RIO COCA  ', '+593 2 2449369', 3),
(728, 'IESS SEGURO DE SALUD CENTRO A.A. GUARANDA', 'AGUSTO CHAVEZ S/N VIA AMBATO  ', '+593 3 2982019', 3),
(729, 'IESS SEGURO DE SALUD CENTRO A.A. LA LIBERTAD', 'BARRIO SAN FCO.CALLE 10 AV.13  ', '+593 4 2785226', 3),
(730, 'IESS SEGURO DE SALUD CENTRO A.A. LETAMENDI', 'L.GARAICOA 3029 Y LETAMENDI  ', '+593 4 2401940', 3),
(731, 'IESS SEGURO DE SALUD CENTRO A.A. NORTE TARQUI', 'CDLA.ST.ADRIANA AV.J.T.MARENGO  KM. 6 1/2', '+593 4 255188', 3),
(732, 'IESS SEGURO DE SALUD CENTRO A.A. QUEVEDO', 'AV.JUNE GUZMAN DE CORTEZ Y 9NA  ', '+593 5 5750305', 3),
(733, 'IESS SEGURO DE SALUD CENTRO A.A. SUR OCCIDENTAL', 'ANTONIO JOSE DE SUCRE 1127 Y  HERNANDO PRADO', '+593 2 3103743', 3),
(734, 'IESS SEGURO DE SALUD CENTRO A.A. SUR VALDIVIA', 'AV. 25 DE JULIO Y CALLE NAPO  ', '+593 4 2493160', 3),
(735, 'IESS SEGURO DE SALUD CENTRO A.A. TULCAN', 'RAFAEL ARELLANOY GARCIA MORENO  ', '+593 6 2981238', 3),
(736, 'IESS UNIDAD DE ATENCION AMBULATORIA CARIAMANGA', 'DAVID SALAZAR S/N  ', '+593 7 2687343', 3),
(737, 'IESS UNIDAD DE ATENCION AMBULATORIA DE MACAS', 'AVENIDA LA CIUDAD  ', '+593 7 2700112', 3),
(738, 'IESS UNIDAD DE ATENCION AMBULATORIA DE SANTA CRUZ', 'DELFIN Y DUNCAN  ', '+593 5 2861429', 3),
(739, 'IESS UNIDAD DE ATENCION AMBULATORIA DE SUCUA', 'Y CARLOS PALACIOS  ', '+593 7 2740889', 3),
(740, 'IESS UNIDAD DE ATENCION AMBULATORIA DEL CAÑAR', 'AV COLON Y ALFONSO MARIA ARCE  ', '+593 7 2235058', 3),
(741, 'IESS UNIDAD DE ATENCION AMBULATORIA EL CARMEN', 'AV.CHONE KM 37 URB  ASOCIACION DE GANADO', '5 2660014', 3),
(742, 'IESS UNIDAD DE ATENCION AMBULATORIA EL COCA', 'CORDOVA GALARZA Y ANTONIO CABRERA  ', '+593 6 2880452', 3),
(743, 'IESS UNIDAD DE ATENCION AMBULATORIA HUAQUILLAS', 'AV. REPUBLICA  ENTRE MANABI Y PI#AS', '+593 7 2510392', 3),
(744, 'IESS UNIDAD DE ATENCION AMBULATORIA MACARA', 'JUVENAL JARAMILLO S/N GONZANAMA  BARRIO VELASCO IBARRA', '+593 7 2696490', 3),
(745, 'IESS UNIDAD DE ATENCION AMBULATORIA PAJAN', 'SITIO ZAPOTAL S/N CARRETERA  PAJAN COLIMES ENT. SAN MIGUEL', '+593 5 2649255', 3),
(746, 'IESS UNIDAD DE ATENCION AMBULATORIA PORTOVELO', 'ANTONIO JOSE DE SUCRE  ROSA VIVAR', '+593 7 2949184', 3),
(747, 'IESS UNIDAD DE ATENCION AMBULATORIA SANTA ROSA', 'JOSE MARIA OLLAGUE  LEONE CASTELY', '+593 7 2943057', 3),
(748, 'IESS-SSC ', 'ESTRADA E1-16 Y 10 DE AGOSTO  ', '', 3),
(749, 'INSTITUTO DE SEGURIDAD SOCIAL DE LAS FUERZAS ARMADAS', 'JORGE DROM N37-125 Y JOSE  VILLALENGUA', '+593 2 3966085', 3),
(750, 'INSTITUTO ECUATORIANO DE SEGURIDAD SOCIAL IESS', 'AV.10 DE AGOSTO S/N Y BOGOTA  ', '+593 2 2230883', 3),
(751, 'INSTITUTO ECUATORIANO I.E.S.S HOSPITAL TEODORO MALDONADO', 'AVE. 25 DE JULIO S/N Y VÍA PUERTO MARITIMO', '+593 4 2490741', 3),
(752, 'JEFATURA DE AREA N°8 CENTRO DE SALUD SAUCES III', 'CDLA.SAUCES 3 MZ.151 A2 CASA  COMUNAL', '+593 4 2245589', 3),
(753, 'JUNTA DE BENEFICENCIA DE GUAYAQUIL ', 'VELEZ 109 Y PEDRO CARBO  ', '+593 4 2324060', 3),
(754, 'LIFE & HOPE SPECIALITY CARE S.A. CENTRO DE TRATAMIENTOS AMBULATORIOS', 'ED.FORTUNE PLAZA OFI 502  ELOY ALFARO N29-235 Y ALEMANIA', '+593 2 3825179', 3),
(755, 'MEDICAMENTOS CONSUMO INT JEFATURA DE SALUD AREA No. 2', 'MONTUFAR 1892 Y 13 DE ABRIL  ', '+593 9 92290153', 3),
(756, 'MEDISAN ', 'TOMAS CHARIOVE N47-75 Y  MIGUEL BEDOYA', '+593 2 2454092', 3),
(757, 'MINISTERIO DE SALUD PUBLICA ', 'AV.REPUBLICA DEL SALVADOR Y SUECIA  ', '+593 2 2972900', 3),
(758, 'MINISTERIO DE SALUD PUBLICA ', 'REPUBLICA DEL SALVADOR N54 64  Y SUECIA', '+593 2 2814400', 3),
(759, 'MUNICIPIO DEL DISTRITO METROPOLITANO DE QUITO', 'VENEZUELA OE 3-35 Y CHILE  ', '', 3),
(760, 'NUCLEO DE SOLCA MACHALA ', 'GUABO S/N Y TARQUI ESQ.  ', '+593 7 2938050', 3),
(761, 'SOCIEDAD DE LUCHA CONTRA EL CANCER ', 'AV.ELOY ALFARO Y LOS PINOS  ', '+593 2 2121123', 3),
(762, 'SOCIEDAD DE LUCHA CONTRA EL CANCER DEL ECUADOR SOLCA', 'AV.PEDRO MENENDEZ GILBERT  ', '+593 4 2288088', 3),
(763, 'SOCIEDAD DE LUCHA CONTRA EL CANCER SOLCA NUCLEO DE CUENCA', 'A.LANDIVAR AV.EL PARAISO  ', '+593 7 4096566', 3),
(764, 'SOLCA MANABI NUCLEO DE PORTOVIEJO ', 'AUTOPISTA DEL VALLE MANABI GUILLEM  ', '+593 5 2440012', 3),
(765, 'SOLCA NUCLEO DE LOJA ', 'AV.SALVADOR BUSTAMANTE CELI  ', '+593 7 2573752', 3),
(766, 'UNIDAD ATENCION AMBULATORIA DEL IESS EN LA CIUDAD DE QUININDE', 'BARRIO NUEVOS HORIZONTES S/N  ', '062737167', 3),
(767, 'UNIDAD DE ATENCION AMBULATORIA BALZAR', 'LUCAS TRIVIÑO SOLAR 1 Y  ROMULO RENDON', '+593 4 2957132', 3),
(768, 'UNIDAD DE ATENCION AMBULATORIA BUCAY', 'GARCIA MORENO S/N Y LOJA  ', '+593 4 2727092', 3),
(769, 'UNIDAD DE ATENCION AMBULATORIA DAULE', 'CDLA.ROSA MIRA MAZ.225 SOLAR 1  ', '+593 4 2795409', 3),
(770, 'UNIDAD DE ATENCION AMBULATORIA DE AMAGUAÑA', 'BARRIO MARIA AUXILIADORA  JOSE MEJIA LOTE 4 E IGLESIAS', '+593 2 2877182', 3),
(771, 'UNIDAD DE ATENCION AMBULATORIA DE BAÑOS', 'CALLE RAFAEL VIEIRA S/N Y  LUIS A. MARTINEZ', '+593 3 2740474', 3),
(772, 'UNIDAD DE ATENCION AMBULATORIA DE CATAMAYO', 'ISIDRO AYORA S/N Y 9 DE OCTUBRE  ', '+593 7 2676883', 3),
(773, 'UNIDAD DE ATENCION AMBULATORIA DE CAYAMBE', 'JUAN MONTALVO 803 Y SUCRE  ', '+593 2', 3),
(774, 'UNIDAD DE ATENCION AMBULATORIA DE CELICA', 'BARRIO SAN VICENTE CALLE AMAZONAS  S/N DIAGONAL ESTADIO', '+593 7 2657742', 3),
(775, 'UNIDAD DE ATENCION AMBULATORIA DE CHUNCHI', 'ABDON CALDERON S/N Y  GENERAL CÓRDOVA', '+593 3 2937194', 3),
(776, 'UNIDAD DE ATENCION AMBULATORIA DE NARANJAL', 'AV. OLMEDO S/N Y CALLEJON IESS  ', '+593 4 2751222', 3),
(777, 'UNIDAD DE ATENCION AMBULATORIA DE PALTAS', 'LAURO GUERRERO S/N Y MERCADILIO  ESQUINA', '+593 7 2683165', 3),
(778, 'UNIDAD DE ATENCION AMBULATORIA DE PASAJE', 'ELOY ALFARO  TARQUI', '+593 7 2915173', 3),
(779, 'UNIDAD DE ATENCION AMBULATORIA DE PIÑAS', 'CD.ORQUIDEA SUR AV.FCO CARRION  A 100MTRS ESTADIO DE LIGA CANT', '+593 7 2976104', 3),
(780, 'UNIDAD DE ATENCION AMBULATORIA DE SAN LORENZO', 'ROBERTO LUIS CERVANTES Y  ANA PAREDES', '+593 6 2780173', 3),
(781, 'UNIDAD DE ATENCION AMBULATORIA DE SAN MIGUEL DE BOLIVAR', 'BATALLA CAMINO REAL S/N  ', '+593 3 2989448', 3),
(782, 'UNIDAD DE ATENCION AMBULATORIA DE TABACUNDO', 'VELASCO IBARRA 206  ', '+593 2 2360182', 3),
(783, 'UNIDAD DE ATENCION AMBULATORIA DE ZUMBA', 'ZUMBA CALLE 12 DE FEBRERO S/N  Y ORELLANA JUNTO MUNICIPIO', '+593 7 2308234', 3),
(784, 'UNIDAD DE ATENCION AMBULATORIA DEL IESS ATUNTAQUI', 'CALLE GENERAL ENRIQUEZ DIAGONAL  A LA ESCUELA HNO. MIGUEL', '+593 6 2906124', 3),
(785, 'UNIDAD DE ATENCION AMBULATORIA DEL IESS EN MACHACHI', 'CALLE 11 DE NOVIEMBRE Y PASAJE  JOSE MEJIA LEQUERICA', '+593 9 84252978', 3),
(786, 'UNIDAD DE ATENCION AMBULATORIA DEL PARQUE INDUSTRIAL', 'AV. CELSO AUGUSTO RODRIGUEZ  ', '+593 3 2942122', 3),
(787, 'UNIDAD DE ATENCION AMBULATORIA DEL TENA', 'CALLE VIA PUERTO NAPO S/N  A 100M DEL HOTEL CRUZ CASPI', '', 3),
(788, 'UNIDAD DE ATENCION AMBULATORIA EL ANGEL', 'ABDON CALDERON 0484 Y RIOFRIO  ', '+593 6 2977218', 3),
(789, 'UNIDAD DE ATENCION AMBULATORIA EL EMPALME', 'CALLE AUHING S/N Y CALLE C  ', '+593 4 2960212', 3),
(790, 'UNIDAD DE ATENCION AMBULATORIA GUALAQUIZA', 'RIO SANTIAGO S/N Y TIWINTZA  DIAG.ESC.TERESA SAMANIEGO', '+593 7 2780149', 3),
(791, 'UNIDAD DE ATENCION AMBULATORIA IESS  COTACACHI', 'PEDRO MONCAYO 15-29 Y MODESTO  PEÑAHERRERA', '+593 6 2916027', 3),
(792, 'UNIDAD DE ATENCION AMBULATORIA IESS SAN GABRIEL', 'AV.ATAHUALPA S/N Y RUMICHACA  ', '+593 6 2290007', 3),
(793, 'UNIDAD DE ATENCION AMBULATORIA LA ECUATORIANA', 'AV.LA ECUATORIANA S/N  ', '+593 2 2696712', 3),
(794, 'UNIDAD DE ATENCION AMBULATORIA VENTANAS', '9 DE OCTUBRE 302  ', '+593 5 2970368', 3),
(795, 'UNIDAD METROPOLITANA DE SALUD NORTE ', 'DIEGO DE VASQUEZ Y UNION Y  PROGRESO', '+593 2 2282649', 3),
(796, 'UNIDAD METROPOLITANA DE SALUD SUR ', 'ADRIAN NAVARRO N.1660 E HINOS-  TROZA UNA CUADRA COL FE Y ALEG', '+593 2 3121302', 3),
(797, 'UNIDAD MUNICIPAL DE SALUD CENTRO ', 'ROCAFUERTE OE8-89 ENTRE IMBA  BURA Y CHIMBORAZO', '+593 2 2573083', 3),
(798, 'UNIDAD ONCOLOGICA CANTONASOLCA DE SANTA ELENA', 'BARRIO BELLAVISTA VIA ANCON  ', '+593 4 2942374', 3),
(799, 'UNIDAD ONCOLOGICA SOLCA CHIMBORAZO ', 'ESMERALDAS Y DUCHICELA  A 3 CUADRAS QUINTA MACAJI', '+593 3 2616402', 3),
(800, 'UNIDAD ONCOLOGICA SOLCA IMBABURA ', 'RAFAEL SANCHEZ 10-67 Y TOBIAS MENA  TRAS CENTRAL BOMBEROS', '+593 6 2610737', 3),
(801, 'UNIDAD ONCOLOGICA SOLCA SANTO DOMINGO DE LOS COLORADOS', 'GALAPAGOS S/N CUENCA  JUNTO SUPERMERCADO LA ECONOMIA', '+593 2 2740053', 3),
(802, 'UNIDAD ONCOLOGICA SOLCA TUNGURAHUA ', 'IZAMBA - ALFREDO COLOMA S/N Y  ENRIQUE SANCHEZ', '+593 3 2856098', 3),
(803, 'UNIVERSIDAD CENTRAL DEL ECUADOR HOSPITAL DEL DIA', 'GERONIMO LEYTON S/N Y AV. LA GASCA  ', '+593 2 3216177', 3),
(804, 'UNIVERSIDAD DE GUAYAQUIL ', 'AV.DELTA ENTRE MALECON DEL SALADO  Y AV. KENNEDY CDL.BOLIVAR', '+593 4 2287072', 3),
(805, 'VANTTIVE CIA. LTDA. ', 'PANAMERICANA NORTE KM 14 ENTRE  PASAJE CENEPA Y LEONIDAS PROAÑO', '+593 2 2507758', 3),
(807, 'Isssteleon nl', '', '', 4),
(808, 'Pensiones jalisco', '', '', 4),
(809, 'Pensiones chih.', '', '', 4),
(810, 'Isssteson', '', '', 4),
(811, 'Hr ae bajio', '', '', 4),
(812, 'Hosp civil guadalajara', '', '', 4),
(813, 'I. Jal. Cancerologia', '', '', 4),
(814, 'Isstecali', '', '', 4),
(815, 'H univ. Nl', '', '', 4),
(816, 'Isapeg', '', '', 4),
(817, 'Issesalud bc', '', '', 4),
(818, 'Ssa sonora', '', '', 4),
(819, 'Ssa jalisco', '', '', 4),
(820, 'Ssa sinaloa', '', '', 4),
(821, 'Ssa michoacán', '', '', 4),
(822, 'Ssa tamaulipas', '', '', 4),
(823, 'Ssa nuevo león', '', '', 4),
(824, 'Ssa durango', '', '', 4),
(825, 'Ceao de campeche', '', '', 4),
(826, 'Inr', '', '', 4),
(827, 'Inst cancerologia', '', '', 4),
(828, 'Inst nutricion', '', '', 4),
(829, 'Instituto nal. de cardiología', '', '', 4),
(830, 'Issemym', '', '', 4),
(831, 'Issstep', '', '', 4),
(832, 'Isstech', '', '', 4),
(833, 'Sec. Marina', '', '', 4),
(834, 'Hospital general de mexico', '', '', 4),
(835, 'Isem', '', '', 4),
(836, 'Ssa chiapas', '', '', 4),
(837, 'Ssa df', '', '', 4),
(838, 'Ssa morelos', '', '', 4),
(839, 'Ssa puebla', '', '', 4),
(840, 'Issste', '', '', 4),
(842, 'Asoc. Civil impacta salud y educaci', '', '', 5),
(843, 'Asociacion hijas de san camilo', '', '', 5),
(844, 'Direccion de abastecimiento de recu', '', '', 5),
(845, 'Diresa cusco', '', '', 5),
(846, 'Disa i callao', '', '', 5),
(847, 'Essalud almenara', '', '', 5),
(848, 'Essalud ancash', '', '', 5),
(849, 'Essalud apurimac', '', '', 5),
(850, 'Essalud arequipa', '', '', 5),
(851, 'Essalud ayacucho', '', '', 5),
(852, 'Essalud cajamarca', '', '', 5),
(853, 'Essalud cusco', '', '', 5),
(854, 'Essalud gcl', '', '', 5),
(855, 'Essalud huanuco', '', '', 5),
(856, 'Essalud ica', '', '', 5),
(857, 'Essalud junin', '', '', 5),
(858, 'Essalud la libertad', '', '', 5),
(859, 'Essalud lambayeque', '', '', 5),
(860, 'Essalud moquegua', '', '', 5),
(861, 'Essalud pasco', '', '', 5),
(862, 'Essalud piura', '', '', 5),
(863, 'Essalud rebagliati', '', '', 5),
(864, 'Essalud sabogal', '', '', 5),
(865, 'Essalud tacna', '', '', 5),
(866, 'Essalud trujillo', '', '', 5),
(867, 'Essalud tumbes', '', '', 5),
(868, 'Essalud ucayali', '', '', 5),
(869, 'Fap hospi', '', '', 5),
(870, 'Fap sesan', '', '', 5),
(871, 'Feban', '', '', 5),
(872, 'Ffaa  y policiales', '', '', 5),
(873, 'Fospeme', '', '', 5),
(874, 'Hosp v. L. Herrera', '', '', 5),
(875, 'Hosp. A. Loayza', '', '', 5),
(876, 'Hosp. Belen', '', '', 5),
(877, 'Hosp. C. Heredia', '', '', 5),
(878, 'Hosp. C. Ulloa', '', '', 5),
(879, 'Hosp. D.a. Carrion', '', '', 5),
(880, 'Hosp. De apoyo cusco', '', '', 5),
(881, 'Hosp. Del niño breña', '', '', 5),
(882, 'Hosp. Del niño san borja', '', '', 5),
(883, 'Hosp. Dos de mayo', '', '', 5),
(884, 'Hosp. Goyeneche', '', '', 5),
(885, 'Hosp. H. Unanue', '', '', 5),
(886, 'Hosp. Hermilio valdizán', '', '', 5),
(887, 'Hosp. Hipolito unanue de tacna', '', '', 5),
(888, 'Hosp. Maria auxiliadora s.j.m', '', '', 5),
(889, 'Hosp. Municipal los olivos', '', '', 5),
(890, 'Hosp. Reg. De cajamarca', '', '', 5),
(891, 'Hosp. Reg. H. Valdizán', '', '', 5),
(892, 'Hosp. Sta. Rosa de piura', '', '', 5),
(893, 'Hosp. Sta. Rosa p. Libre', '', '', 5),
(894, 'Hospital de apoyo departamental', '', '', 5),
(895, 'Hospital nacional victor', '', '', 5),
(896, 'Ibt health s.a.c', '', '', 5),
(897, 'Inen', '', '', 5),
(898, 'Inst. Nac. Cienc. Neurologicas', '', '', 5),
(899, 'Iren norte', '', '', 5),
(900, 'Iren sur', '', '', 5),
(901, 'Marina de guerra', '', '', 5),
(902, 'Maternidad de lima', '', '', 5),
(903, 'Noguchi', '', '', 5),
(904, 'Region arequipa - hospital reg', '', '', 5),
(905, 'Saludpol', '', '', 5),
(906, 'Santa maria socorro', '', '', 5),
(907, 'Southern peru copper corporation', '', '', 5),
(908, 'Ue 404 hosp. San juan de dios - pisco', '', '', 5),
(909, 'Ue hosp. Regional del cusco', '', '', 5),
(910, 'Utes chanchamayo', '', '', 5);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Line`
--

INSERT INTO `Line` (`id`, `id_country`, `name`) VALUES
(1, 1, 'Transtec'),
(2, 2, 'Transtec'),
(3, 3, 'Transtec'),
(4, 4, 'Transtec'),
(5, 4, 'Soloro'),
(6, 5, 'Transtec');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Notification`
--

INSERT INTO `Notification` (`id`, `id_user`, `read`, `text`, `link`, `id_dose`) VALUES
(1, 11, 0, 'Notificacion 1', NULL, 1),
(2, 11, 0, 'Notificacion 2', NULL, 1);

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
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Pain_report`
--

INSERT INTO `Pain_report` (`id_patient`, `level`, `created`, `read`) VALUES
(2, 5, '2016-07-05 21:17:51', 1),
(2, 6, '2016-06-30 19:34:18', 0),
(2, 7, '2016-06-30 19:34:30', 0),
(11, 8, '2016-07-05 21:18:35', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Patient`
--

CREATE TABLE IF NOT EXISTS `Patient` (
  `id_user` int(11) DEFAULT NULL,
  `id_doctor` int(11) NOT NULL,
  `id_institution` int(11) NOT NULL,
  `id_country` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Patient`
--

INSERT INTO `Patient` (`id_user`, `id_doctor`, `id_institution`, `id_country`) VALUES
(2, 3, 0, 1),
(4, 3, 0, 1),
(11, 3, 102, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Product`
--

INSERT INTO `Product` (`id`, `ref_code`, `name`, `description`, `picture`, `active`, `created`, `id_line`) VALUES
(1, '0001', 'Transtec', 'Transtec 35 µg/h\r\n', NULL, b'1', '2016-06-28 15:56:33', 1),
(2, '0002', 'Transtec', 'Transtec 52.5 µg/h\r\n', NULL, b'1', '2016-06-29 19:27:14', 1),
(3, '0003', 'Transtec', 'Transtec 70 µg/h', NULL, b'1', '2016-06-29 19:27:32', 1),
(4, '0004', 'Transtec', 'Transtec 35 µg/h', NULL, b'1', '2016-06-29 19:28:13', 2),
(5, '0005', 'Transtec', 'Transtec 35 µg/h', NULL, b'1', '2016-06-29 19:28:43', 3),
(6, '0006', 'Transtec', 'Transtec 35 µg/h', NULL, b'1', '2016-06-29 19:29:24', 4),
(7, '0007', 'Transtec', 'Transtec 52.5 µg/h', NULL, b'1', '2016-06-29 19:29:55', 4),
(8, '0008', 'Soloro', 'Soloro7 5mg', NULL, b'1', '2016-06-29 19:30:23', 5),
(9, '0009', 'Soloro', 'Soloro7 10mg', NULL, b'1', '2016-06-29 19:30:46', 5),
(10, '0010', 'Transtec', 'Transtec 35 µg/h', NULL, b'1', '2016-06-29 19:31:22', 6);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Recipe`
--

INSERT INTO `Recipe` (`id`, `created`, `description`, `id_patient`, `id_doctor`) VALUES
(1, '2016-07-01 20:52:49', NULL, 11, 3);

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
  `image` text,
  `pub_date` date NOT NULL,
  `id_country` int(11) NOT NULL,
  `permission` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `Specialization`
--

INSERT INTO `Specialization` (`id`, `name`, `active`) VALUES
(1, 'Cardiología', b'1'),
(2, 'Gastroenterología', b'1'),
(3, 'Infectología', b'1'),
(4, 'Medicina interna', b'1');

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
  `terms` tinyint(1) NOT NULL DEFAULT '0',
  `sex` varchar(10) NOT NULL,
  `picture` varchar(50) NOT NULL,
  `erased` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `User`
--

INSERT INTO `User` (`id`, `name`, `lastname`, `email`, `password`, `active`, `terms`, `sex`, `picture`, `erased`) VALUES
(1, 'Cesar', 'Ramirez', 'cesar@correo.com', 'd033e22ae348aeb5660fc2140aec35850c4da997', b'1', 0, 'm', 'profile.png', 0),
(2, 'Rossana', 'Mejias', 'ross@correo.com', '771d4026e7ad19fce0d7534fddb2ce53b7e0a4cd', b'1', 0, 'f', 'profile.png', 0),
(3, 'Julio', 'Cordoba', 'david@correo.com', '1f0160076c9f42a157f0a8f0dcc68e02ff69045b', b'1', 0, 'm', 'profile.png', 0),
(4, 'cami', 'lombana', 'cami@correo.com', '771d4026e7ad19fce0d7534fddb2ce53b7e0a4cd', b'1', 0, 'f', 'profile.png', 0),
(5, 'debora', 'buendia', 'cesar.ramirez@domoti-sas.com', 'e82ea78f2963d0fa29c19d709c2424317c2b34a9', b'1', 0, 'f', '', 0),
(6, 'debora', 'buendia', 'cesar.ramirez@domoti-sas.com', '78ffb91f790e537703aec1b82f5ed48a1332981d', b'1', 0, 'f', '', 0),
(7, 'debora', 'buendia', 'cesar.ramirez@domoti-sas.com', 'f8abd1894b49ce9ff394155a3884196acf9b08f8', b'1', 0, 'f', '', 0),
(8, 'debora', 'buendia', 'cesar.ramirez@domoti-sas.com', 'efc220fd7b53e64882330ec89f07e5b7c312a1de', b'1', 0, 'f', '', 0),
(9, 'debora', 'buendia', 'cesar.ramirez@domoti-sas.com', '6c8d5e4980d020a36088f253d614fdb576fd65c9', b'1', 0, 'f', '', 0),
(10, 'cesar', 'ramirez', 'cesar.ramirez@domoti-sas.com', 'e34526e449be5584f9a8f0c8a47516318e12c2b5', b'1', 0, 'm', '', 0),
(11, 'cesar', 'ramirez', 'cesar.ramirez@domoti-sas.com', 'a40ab8a11f76124db925ac4f62d30fc6c6b4aa91', b'1', 0, 'm', '', 0);

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
-- Indices de la tabla `Institution`
--
ALTER TABLE `Institution`
 ADD PRIMARY KEY (`id`), ADD KEY `id_country` (`id_country`);

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
 ADD KEY `id_patient` (`id_patient`);

--
-- Indices de la tabla `Patient`
--
ALTER TABLE `Patient`
 ADD KEY `FK_Patient_User` (`id_user`), ADD KEY `id_doctor` (`id_doctor`), ADD KEY `FK_Patient_Country` (`id_country`);

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
 ADD PRIMARY KEY (`id`), ADD KEY `FK_Rss_channel_Country` (`id_country`);

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
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `Dose`
--
ALTER TABLE `Dose`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `Group`
--
ALTER TABLE `Group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `Institution`
--
ALTER TABLE `Institution`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=911;
--
-- AUTO_INCREMENT de la tabla `Library`
--
ALTER TABLE `Library`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Line`
--
ALTER TABLE `Line`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `Notification`
--
ALTER TABLE `Notification`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `Permission`
--
ALTER TABLE `Permission`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `Product`
--
ALTER TABLE `Product`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `Recipe`
--
ALTER TABLE `Recipe`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
-- AUTO_INCREMENT de la tabla `Specialization`
--
ALTER TABLE `Specialization`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `Structure_tables`
--
ALTER TABLE `Structure_tables`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `User`
--
ALTER TABLE `User`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
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
-- Filtros para la tabla `Institution`
--
ALTER TABLE `Institution`
ADD CONSTRAINT `Institution_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `Country` (`id`) ON DELETE NO ACTION;

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
ADD CONSTRAINT `Pain_report_ibfk_1` FOREIGN KEY (`id_patient`) REFERENCES `Patient` (`id_user`);

--
-- Filtros para la tabla `Patient`
--
ALTER TABLE `Patient`
ADD CONSTRAINT `FK_Patient_Country` FOREIGN KEY (`id_country`) REFERENCES `Country` (`id`),
ADD CONSTRAINT `FK_Patient_User` FOREIGN KEY (`id_user`) REFERENCES `User` (`id`),
ADD CONSTRAINT `Patient_ibfk_1` FOREIGN KEY (`id_doctor`) REFERENCES `Doctor` (`id_user`);

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
-- Filtros para la tabla `Rss_channel`
--
ALTER TABLE `Rss_channel`
ADD CONSTRAINT `FK_Rss_channel_Country` FOREIGN KEY (`id_country`) REFERENCES `Country` (`id`);

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
