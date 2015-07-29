-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-03-2015 a las 19:14:37
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `recursos_informaticos`
--
CREATE DATABASE IF NOT EXISTS `recursos_informaticos` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `recursos_informaticos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bases_datos`
--

CREATE TABLE IF NOT EXISTS `bases_datos` (
`id_bd` int(10) unsigned zerofill NOT NULL COMMENT 'Identificador de la Base de Datos',
  `nombre_bd` varchar(45) DEFAULT NULL COMMENT 'Sistema manejador de la base de datos',
  `version` varchar(45) DEFAULT NULL COMMENT 'Versión de la Base de Datos',
  `puerto_tcp` varchar(45) DEFAULT NULL COMMENT 'Puerto TCP de la Base de Datos',
  `proposito` varchar(45) DEFAULT NULL COMMENT 'Propósito de la Base de datos',
  `usuarios` varchar(45) DEFAULT NULL COMMENT 'Número de Usuarios concurrentes',
  `replica` varchar(45) DEFAULT NULL COMMENT 'Se replica a otro servidor?Si/No Si-A Cual?',
  `tamano` varchar(45) DEFAULT NULL COMMENT 'Tamaño aprox de la Base',
  `horario` varchar(45) DEFAULT NULL COMMENT 'Horario de Operación',
  `respaldos` varchar(45) DEFAULT NULL COMMENT 'Tipos de Respaldo',
  `horario_baja` varchar(45) DEFAULT NULL COMMENT 'Horario para dar de baja la base ',
  `exports` varchar(45) DEFAULT NULL COMMENT 'Exports',
  `logs` varchar(45) DEFAULT NULL COMMENT 'Archives/logLogs',
  `password_admin` varchar(45) DEFAULT NULL COMMENT 'Contraseñas de Administrador',
  `usuario_admin` varchar(45) DEFAULT NULL COMMENT 'Usuario Administrador',
  `servidor_id_servidor` int(10) unsigned zerofill NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bases_datos_has_contacto`
--

CREATE TABLE IF NOT EXISTS `bases_datos_has_contacto` (
  `bases_datos_id_bd` int(10) unsigned zerofill NOT NULL COMMENT 'Id de Base de Datos',
  `contacto_id_contacto` int(11) NOT NULL COMMENT 'Id de contacto',
  `rol` varchar(20) DEFAULT NULL COMMENT 'Rol que desempeña en la Base de datos',
  `nombre_usuario` varchar(10) DEFAULT NULL COMMENT 'Nombre de usuario del contacto',
  `password` varchar(8) DEFAULT NULL COMMENT 'Contraseña del contacto',
  `fecha_alta` varchar(45) DEFAULT NULL COMMENT 'Fecha de alta para uso de la Base de datos'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE IF NOT EXISTS `contacto` (
  `id_contacto` int(11) NOT NULL COMMENT 'Identifiacdor de contacto',
  `num_empleado` int(11) NOT NULL COMMENT 'Número de empleado',
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre del empleado',
  `puesto` varchar(40) DEFAULT NULL COMMENT 'Puesto del empleado',
  `tel_directo` varchar(15) DEFAULT NULL COMMENT 'teléfono directo del empleado',
  `tel_ext` varchar(5) DEFAULT NULL COMMENT 'Extensión telefónica del empleado',
  `tel_celular` varchar(15) DEFAULT NULL COMMENT 'Número de teléfono celular del empleado',
  `correo1` varchar(30) DEFAULT NULL COMMENT 'Correo electrónico de empleado (Institucional)',
  `correo2` varchar(45) DEFAULT NULL COMMENT 'Correo electrónico del empleado (Personal)',
  `fecha_alta` date DEFAULT NULL COMMENT 'Fecha del Alta',
  `activo` tinyint(1) DEFAULT NULL COMMENT 'Empleado Activo (Si/No)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_servidor`
--

CREATE TABLE IF NOT EXISTS `detalle_servidor` (
  `id_detalle_servidor` int(11) NOT NULL COMMENT 'Número de identificación del servidor de aplicaciones',
  `instancias` varchar(45) DEFAULT NULL COMMENT 'número de instancias',
  `aplicaciones` varchar(45) DEFAULT NULL COMMENT '# Aplicaciones desplegadas',
  `url` varchar(45) DEFAULT NULL COMMENT 'URL de Administración (Servidor : puerto)',
  `usuario` varchar(45) DEFAULT NULL COMMENT 'Usuario del Administrador',
  `password` varchar(45) DEFAULT NULL COMMENT 'Contraseña del Administrador',
  `plataforma` varchar(45) DEFAULT NULL COMMENT 'Plataforma',
  `sistema_opera` varchar(45) DEFAULT NULL COMMENT 'Sistema Operativo ',
  `desarrollo` varchar(45) DEFAULT NULL COMMENT 'Desarrollo\nJava (Applets, Servlets, JSPs, EARSs, WARs, EJBs)\nPL/SQL\nC\nPerl\nCGIs',
  `ambientes` varchar(45) DEFAULT NULL COMMENT 'Ambientes de desarrollo y de Producción',
  `hora_respaldo` time DEFAULT NULL COMMENT 'Hora de Respaldos',
  `perioricidad` varchar(45) DEFAULT NULL COMMENT 'Periodicidad de Respaldos',
  `opera_dias_habil` varchar(45) DEFAULT NULL COMMENT 'Días Hábiles de Operación',
  `opera_dias_criti` varchar(45) DEFAULT NULL COMMENT 'Días Críticos de Operación',
  `opera_hora_habil` varchar(45) DEFAULT NULL COMMENT 'Horas Hábiles de Operación',
  `opera_hora_criti` varchar(45) DEFAULT NULL COMMENT 'Horas Críticas de Operación',
  `arquitectura_apli` varchar(45) DEFAULT NULL COMMENT 'Arquitectura de Componentes J2EE . Componentes web. Servlets, JSP, JavaBeans. Componentes de negocio EnterpriseJavaBeans (EJB). Componentes BI. Recursos J2EE. Pool de conexiones. Servicio de mensajería. Recursos de Conector (Adaptador de recursos EIS). Servicios de seguridad. Autenticación básica HTTP.Autenticación basada en Certificados',
  `servidor_id_servidor` int(10) unsigned zerofill NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_red`
--

CREATE TABLE IF NOT EXISTS `servicio_red` (
  `id_servicio_red` int(11) NOT NULL COMMENT 'Clave de Identificación del Servicio de Red',
  `host_name` varchar(45) DEFAULT NULL COMMENT 'Nombre del Host al que se le proporciona el servicio de red',
  `puerto_tcpip` varchar(45) DEFAULT NULL COMMENT 'Puerto TCP/IP del Host Name',
  `servicio` varchar(45) DEFAULT NULL COMMENT 'Servicio que utiliza del servidor',
  `descripcion` varchar(45) DEFAULT NULL COMMENT 'Descripción del Host',
  `ip` varchar(45) DEFAULT NULL COMMENT 'Dirección IP del Host Name',
  `mascara` varchar(45) DEFAULT NULL COMMENT 'Mascára de red del Hos Name',
  `gateway` varchar(45) DEFAULT NULL COMMENT 'Gateway del Host Name'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_red_has_servidor`
--

CREATE TABLE IF NOT EXISTS `servicio_red_has_servidor` (
  `servicio_red_id_servicio_red` int(11) NOT NULL,
  `servidor_id_servidor` int(10) unsigned zerofill NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servidor`
--

CREATE TABLE IF NOT EXISTS `servidor` (
`id_servidor` int(10) unsigned zerofill NOT NULL COMMENT 'Clave de Identificación del registro en la tabla',
  `host` varchar(250) DEFAULT NULL COMMENT 'Nombre del host',
  `ip` varchar(15) DEFAULT NULL COMMENT 'Dirección IP del servidor',
  `noserie` varchar(50) DEFAULT NULL COMMENT 'Número de serie del servidor',
  `noinventario` varchar(50) DEFAULT NULL COMMENT 'Número de Inventario',
  `marca` varchar(50) DEFAULT NULL COMMENT 'Marca del servidor',
  `modelo` varchar(50) DEFAULT NULL COMMENT 'Modelo del servidor',
  `ubicacion` varchar(150) DEFAULT NULL COMMENT 'Descripción de la ubicación física del servidor',
  `area` varchar(45) DEFAULT NULL COMMENT 'Nombre del Área donde se encuentra físicamente el servidor',
  `garantia` date DEFAULT NULL COMMENT 'Vigencia de la garantia',
  `proposito` varchar(45) DEFAULT NULL COMMENT 'Propósito',
  `arquitectura` varchar(250) DEFAULT NULL COMMENT 'Arquitectura del procesador',
  `num_procesadores` varchar(200) DEFAULT NULL COMMENT 'Número de Procesadores instalados',
  `cant_max_proce` int(11) DEFAULT NULL COMMENT 'Cantidad Máxima que soporta para instalación de procesadores',
  `tarjetas_cpu` varchar(45) DEFAULT NULL COMMENT 'Tarjetas de CPU y Memorias',
  `cant_max_cpu` int(11) DEFAULT NULL COMMENT 'Cantidad máxima de tarjetas de CPU',
  `tarjetas_red` varchar(45) DEFAULT NULL COMMENT 'Tarjetas de Red y Tipo',
  `slot_exp_red` int(11) DEFAULT NULL COMMENT 'Slot de expansión permitidos en la tarjetas de Red',
  `memia_actu` varchar(45) DEFAULT NULL COMMENT 'Cantidad de memoria actual',
  `max_memoria` varchar(45) DEFAULT NULL COMMENT 'Máximo de memoria permitida en el sistema',
  `slot_discos_int` varchar(45) DEFAULT NULL COMMENT 'Slots para discos internos y Tipos en el Sistema',
  `discos_insta` varchar(45) DEFAULT NULL COMMENT 'Discos instalados en el almacenamiento interno',
  `capacidades_disc` varchar(45) DEFAULT NULL COMMENT 'Capacidades del almacenamiento interno',
  `configuracion` varchar(45) DEFAULT NULL COMMENT 'Configuración del almacenamiento interno',
  `particiones` varchar(45) DEFAULT NULL COMMENT 'particiones del almacenamiento interno',
  `medios_secud` varchar(45) DEFAULT NULL COMMENT 'Medios Secundarios de almacenamiento interno',
  `dispo_extr` varchar(45) DEFAULT NULL COMMENT 'Dispositivos externos',
  `conex_config` varchar(45) DEFAULT NULL COMMENT 'Conexión y Configuracion de los dispositivos externos',
  `sistema_opera` varchar(45) DEFAULT NULL COMMENT 'Sistema Operativo',
  `version_sistem` varchar(45) DEFAULT NULL COMMENT 'Versión del sistema operativo',
  `actualiza_sistem` varchar(45) DEFAULT NULL COMMENT 'Actualizaciones del sistema operativo',
  `administra_sistem` varchar(45) DEFAULT NULL COMMENT 'Nombre de usuario del Administrador del sistema operativo',
  `password_sistem` varchar(45) DEFAULT NULL COMMENT 'Contraseña del administrador del sistema operativo',
  `acpower` varchar(45) DEFAULT NULL COMMENT 'Característica eléctrica de la corriente alterna en su configuración máxima',
  `temperatura` varchar(45) DEFAULT NULL COMMENT 'Característica Ambiental de temperatura en su configuración máxima',
  `disipacion` varchar(45) DEFAULT NULL COMMENT 'Característica ambiental de la Disipación térmica BTU/Hora',
  `altura` varchar(45) DEFAULT NULL COMMENT 'Altura en dimensiones del servidor',
  `ancho` varchar(45) DEFAULT NULL COMMENT 'Ancho en dimensiones del servidor',
  `profundidad` varchar(45) DEFAULT NULL COMMENT 'Profuncidad en dimensiones del servidor',
  `peso` varchar(45) DEFAULT NULL COMMENT 'Peso del servidor',
  `observaciones` varchar(45) DEFAULT NULL COMMENT 'Observaciones de la tabla servidores',
  `servicio_red_id_servicio_red` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servidor_has_contacto`
--

CREATE TABLE IF NOT EXISTS `servidor_has_contacto` (
  `servidor_id_servidor` int(10) unsigned zerofill NOT NULL COMMENT 'Servidor Id',
  `contacto_id_contacto` int(11) NOT NULL COMMENT 'Id de Contacto',
  `rol` varchar(20) DEFAULT NULL COMMENT 'Rol que desempeña en el servidor',
  `nombre_usuario` varchar(10) DEFAULT NULL COMMENT 'nombre de usuario',
  `password` varchar(8) DEFAULT NULL COMMENT 'contraseña de usuario',
  `fecha_alta` date DEFAULT NULL COMMENT 'Fecha de alta para el uso del servidor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistemas_inf`
--

CREATE TABLE IF NOT EXISTS `sistemas_inf` (
  `id_sistema` int(11) NOT NULL COMMENT 'Identificador de Sistema de Información',
  `nombre` varchar(45) DEFAULT NULL COMMENT 'Nombre de la Base de datos',
  `definicion` varchar(45) DEFAULT NULL COMMENT 'Definición del sistema de información',
  `fecha_impla` date DEFAULT NULL COMMENT 'Fecha de implantación del sistema de información',
  `version` varchar(45) DEFAULT NULL COMMENT 'Versión',
  `enfoque` varchar(45) DEFAULT NULL COMMENT 'Enfoque',
  `proposito` varchar(45) DEFAULT NULL COMMENT 'Propósito',
  `alcance` varchar(45) DEFAULT NULL COMMENT 'Alcance',
  `procesos` varchar(45) DEFAULT NULL COMMENT 'Proceso(s) de negocio que atiende',
  `areas` varchar(45) DEFAULT NULL COMMENT 'Áreas donde se encuentra operando',
  `modulos_impl` varchar(45) DEFAULT NULL COMMENT 'Módulos implementados',
  `reportes` varchar(45) DEFAULT NULL COMMENT 'Reportes que genera',
  `fecha_actualiza` date DEFAULT NULL COMMENT 'Fecha de última actualización',
  `modulos_falt` varchar(45) DEFAULT NULL COMMENT 'Módulos por implementar',
  `plataforma` varchar(45) DEFAULT NULL COMMENT 'Plataforma de desarrollo',
  `arquitectura` varchar(45) DEFAULT NULL COMMENT 'Arquitectura / Servidor de aplicaciones (AS)*',
  `operacion_dias` varchar(45) DEFAULT NULL COMMENT 'Días y Horas hábiles y críticos',
  `respaldo` varchar(45) DEFAULT NULL COMMENT 'Respaldo del Sistema de informaicón especificando Hora y días y/o periodicidad',
  `desarrollo` varchar(45) DEFAULT NULL COMMENT 'Ambiente de Desarrollo',
  `url` varchar(45) DEFAULT NULL COMMENT 'URL del sistema de información',
  `otras_conexiones` varchar(45) DEFAULT NULL COMMENT 'Otras conexiones',
  `usuario_admin` varchar(45) DEFAULT NULL COMMENT 'Usuario Administrador',
  `password_admin` varchar(45) DEFAULT NULL COMMENT 'Contraseña del administrador',
  `servidor_id_servidor` int(10) unsigned zerofill NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sistemas_inf_has_contacto`
--

CREATE TABLE IF NOT EXISTS `sistemas_inf_has_contacto` (
  `sistemas_inf_id_sistema` int(11) NOT NULL COMMENT 'Id de Sistema de Información',
  `contacto_id_contacto` int(11) NOT NULL COMMENT 'Id de Contacto',
  `rol` varchar(20) DEFAULT NULL COMMENT 'Rol que desempeña en el Sistema de Información',
  `nombre_usuario` varchar(10) DEFAULT NULL COMMENT 'Nombre de usuario',
  `password` varchar(8) DEFAULT NULL COMMENT 'Contraseña de usuario',
  `fecha_alta` date DEFAULT NULL COMMENT 'Fecha de alta para uso del sistema de información'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `software`
--

CREATE TABLE IF NOT EXISTS `software` (
`id_software` int(10) unsigned zerofill NOT NULL COMMENT 'Número de identificación del software',
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `version` varchar(45) DEFAULT NULL COMMENT 'Versión del Software',
  `licencia` varchar(45) DEFAULT NULL COMMENT 'Licencia del Softwware',
  `mantto` varchar(45) DEFAULT NULL COMMENT 'Mantenimiento del software'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `software_has_servidor`
--

CREATE TABLE IF NOT EXISTS `software_has_servidor` (
  `software_id_software` int(10) unsigned zerofill NOT NULL COMMENT 'Id del software',
  `servidor_id_servidor` int(10) unsigned zerofill NOT NULL COMMENT 'Id del servidor',
  `fecha_instal` date DEFAULT NULL COMMENT 'Fecha de instalación del software',
  `no_licencia` int(5) DEFAULT NULL COMMENT 'Número de licencia utilizada',
  `observaciones` varchar(150) DEFAULT NULL COMMENT 'Datos de configuración especial del software'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bases_datos`
--
ALTER TABLE `bases_datos`
 ADD PRIMARY KEY (`id_bd`), ADD KEY `fk_bases_datos_servidor1_idx` (`servidor_id_servidor`);

--
-- Indices de la tabla `bases_datos_has_contacto`
--
ALTER TABLE `bases_datos_has_contacto`
 ADD PRIMARY KEY (`bases_datos_id_bd`,`contacto_id_contacto`), ADD KEY `fk_bases_datos_has_contacto_contacto1_idx` (`contacto_id_contacto`), ADD KEY `fk_bases_datos_has_contacto_bases_datos1_idx` (`bases_datos_id_bd`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
 ADD PRIMARY KEY (`id_contacto`);

--
-- Indices de la tabla `detalle_servidor`
--
ALTER TABLE `detalle_servidor`
 ADD PRIMARY KEY (`id_detalle_servidor`), ADD KEY `fk_detalle_servidor_servidor1_idx` (`servidor_id_servidor`);

--
-- Indices de la tabla `servicio_red`
--
ALTER TABLE `servicio_red`
 ADD PRIMARY KEY (`id_servicio_red`);

--
-- Indices de la tabla `servicio_red_has_servidor`
--
ALTER TABLE `servicio_red_has_servidor`
 ADD PRIMARY KEY (`servicio_red_id_servicio_red`,`servidor_id_servidor`), ADD KEY `fk_servicio_red_has_servidor_servidor1_idx` (`servidor_id_servidor`), ADD KEY `fk_servicio_red_has_servidor_servicio_red1_idx` (`servicio_red_id_servicio_red`);

--
-- Indices de la tabla `servidor`
--
ALTER TABLE `servidor`
 ADD PRIMARY KEY (`id_servidor`), ADD KEY `fk_servidor_servicio_red1_idx` (`servicio_red_id_servicio_red`);

--
-- Indices de la tabla `servidor_has_contacto`
--
ALTER TABLE `servidor_has_contacto`
 ADD PRIMARY KEY (`servidor_id_servidor`,`contacto_id_contacto`), ADD KEY `fk_servidor_has_contacto_contacto1_idx` (`contacto_id_contacto`), ADD KEY `fk_servidor_has_contacto_servidor1_idx` (`servidor_id_servidor`);

--
-- Indices de la tabla `sistemas_inf`
--
ALTER TABLE `sistemas_inf`
 ADD PRIMARY KEY (`id_sistema`), ADD KEY `fk_sistemas_inf_servidor1_idx` (`servidor_id_servidor`);

--
-- Indices de la tabla `sistemas_inf_has_contacto`
--
ALTER TABLE `sistemas_inf_has_contacto`
 ADD PRIMARY KEY (`sistemas_inf_id_sistema`,`contacto_id_contacto`), ADD KEY `fk_sistemas_inf_has_contacto_contacto1_idx` (`contacto_id_contacto`), ADD KEY `fk_sistemas_inf_has_contacto_sistemas_inf1_idx` (`sistemas_inf_id_sistema`);

--
-- Indices de la tabla `software`
--
ALTER TABLE `software`
 ADD PRIMARY KEY (`id_software`);

--
-- Indices de la tabla `software_has_servidor`
--
ALTER TABLE `software_has_servidor`
 ADD PRIMARY KEY (`software_id_software`,`servidor_id_servidor`), ADD KEY `fk_software_has_servidor_servidor1_idx` (`servidor_id_servidor`), ADD KEY `fk_software_has_servidor_software1_idx` (`software_id_software`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bases_datos`
--
ALTER TABLE `bases_datos`
MODIFY `id_bd` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la Base de Datos';
--
-- AUTO_INCREMENT de la tabla `servidor`
--
ALTER TABLE `servidor`
MODIFY `id_servidor` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Clave de Identificación del registro en la tabla',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `software`
--
ALTER TABLE `software`
MODIFY `id_software` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT 'Número de identificación del software',AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bases_datos`
--
ALTER TABLE `bases_datos`
ADD CONSTRAINT `fk_bases_datos_servidor1` FOREIGN KEY (`servidor_id_servidor`) REFERENCES `servidor` (`id_servidor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `bases_datos_has_contacto`
--
ALTER TABLE `bases_datos_has_contacto`
ADD CONSTRAINT `fk_bases_datos_has_contacto_bases_datos1` FOREIGN KEY (`bases_datos_id_bd`) REFERENCES `bases_datos` (`id_bd`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_bases_datos_has_contacto_contacto1` FOREIGN KEY (`contacto_id_contacto`) REFERENCES `contacto` (`id_contacto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_servidor`
--
ALTER TABLE `detalle_servidor`
ADD CONSTRAINT `fk_detalle_servidor_servidor1` FOREIGN KEY (`servidor_id_servidor`) REFERENCES `servidor` (`id_servidor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servicio_red_has_servidor`
--
ALTER TABLE `servicio_red_has_servidor`
ADD CONSTRAINT `fk_servicio_red_has_servidor_servicio_red1` FOREIGN KEY (`servicio_red_id_servicio_red`) REFERENCES `servicio_red` (`id_servicio_red`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_servicio_red_has_servidor_servidor1` FOREIGN KEY (`servidor_id_servidor`) REFERENCES `servidor` (`id_servidor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servidor`
--
ALTER TABLE `servidor`
ADD CONSTRAINT `fk_servidor_servicio_red1` FOREIGN KEY (`servicio_red_id_servicio_red`) REFERENCES `servicio_red` (`id_servicio_red`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `servidor_has_contacto`
--
ALTER TABLE `servidor_has_contacto`
ADD CONSTRAINT `fk_servidor_has_contacto_contacto1` FOREIGN KEY (`contacto_id_contacto`) REFERENCES `contacto` (`id_contacto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_servidor_has_contacto_servidor1` FOREIGN KEY (`servidor_id_servidor`) REFERENCES `servidor` (`id_servidor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sistemas_inf`
--
ALTER TABLE `sistemas_inf`
ADD CONSTRAINT `fk_sistemas_inf_servidor1` FOREIGN KEY (`servidor_id_servidor`) REFERENCES `servidor` (`id_servidor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sistemas_inf_has_contacto`
--
ALTER TABLE `sistemas_inf_has_contacto`
ADD CONSTRAINT `fk_sistemas_inf_has_contacto_contacto1` FOREIGN KEY (`contacto_id_contacto`) REFERENCES `contacto` (`id_contacto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_sistemas_inf_has_contacto_sistemas_inf1` FOREIGN KEY (`sistemas_inf_id_sistema`) REFERENCES `sistemas_inf` (`id_sistema`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `software_has_servidor`
--
ALTER TABLE `software_has_servidor`
ADD CONSTRAINT `fk_software_has_servidor_servidor1` FOREIGN KEY (`servidor_id_servidor`) REFERENCES `servidor` (`id_servidor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_software_has_servidor_software1` FOREIGN KEY (`software_id_software`) REFERENCES `software` (`id_software`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
