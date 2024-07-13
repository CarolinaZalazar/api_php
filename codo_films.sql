-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-07-2024 a las 13:58:05
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `codo_films`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id_pelicula` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `genero` varchar(225) NOT NULL,
  `direccion` varchar(125) NOT NULL,
  `sinopsis` text DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `emision` int(4) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id_pelicula`, `titulo`, `genero`, `direccion`, `sinopsis`, `duracion`, `emision`, `imagen`) VALUES
(1, 'Furiosa: de la saga Mad Max', '2', 'Quentin Tarantino', 'Precuela de la película de 2015 \'Mad Max: Furia en la carretera\'.', 148, 2024, 'Furiosa.jpg'),
(2, 'Titanic', 'Romance', 'Steven Spielberg', 'Una historia de amor condenada entre una mujer joven de la alta sociedad y un artista pobre a bordo del lujoso e ill-fated R.M.S. Titanic.', 200, 1997, 'Django Unchained.jpg'),
(3, 'Pulp Fiction', '1', 'Steven Spielberg', 'Las vidas de dos matones, un boxeador, la esposa de un gángster y un par de bandidos se entrelazan en cuatro historias de violencia y redención.', 154, 1994, 'Pulp Fiction.jpg'),
(4, 'Jurassic Park', '1', 'Steven Spielberg', 'Un parque temático de dinosaurios sufre una gran caída cuando un fallo en el sistema de seguridad permite a los dinosaurios escapar y aterrorizar a los visitantes.', 172, 1993, 'Jurassic Park.jpg'),
(5, 'Los vigilantes', '10', 'Steven Spielberg', 'Sigue a Mina, una artista de 28 años que queda varada en un bosque en el oeste de Irlanda. Cuando Mina encuentra refugio, sin saberlo, queda atrapada junto a tres extraños que son observados y acechados por misteriosas criaturas cada noche.', 151, 2024, 'Los vigilantes.jpg'),
(6, 'Bad Boys: Hasta la muerte', '2', 'Steven Spielberg', 'Tras escuchar falsas acusaciones sobre su excapitán y mentor Mike y Marcus deciden investigar el asunto incluso volverse los más buscados de ser necesarios', 180, 2024, 'Bad Boys Hasta la muerte.jpg'),
(7, 'Interstellar', '1', 'Steven Spielberg', 'Un equipo de exploradores viaja a través de un agujero de gusano en el espacio en un intento por asegurar el futuro de la humanidad.', 169, 2014, 'Interstellar.jpg'),
(8, 'Avatar', '1', 'Steven Spielberg', 'Un marine parapléjico es enviado a la luna Pandora en una misión única pero se debate entre seguir sus órdenes y proteger el mundo que siente que es su hogar.', 162, 2009, 'Avatar.jpg'),
(9, 'The Shining', '10', 'Steven Spielberg', 'Un hombre se vuelve loco mientras trabaja como cuidador de invierno en un hotel aislado con su familia, que experimenta fenómenos sobrenaturales.', 146, 1980, 'The Shining.jpg'),
(10, 'Detonantes', '1', 'Steven Spielberg', 'Cuando una soldado de las fuerzas de élite estadounidenses vuelve a casa tras la repentina muerte de su padre, sus preguntas le llevarán a enfrentarse a una violenta banda.', 146, 2024, 'Detonantes.jpg'),
(11, 'Un asunto familiar', '8', 'Steven Spielberg', '¿Puede haber algo peor que trabajar como asistente para una caprichosa estrella del cine que no te toma en serio? Descubrir que está enamorado de tu madre.', 139, 2024, 'Un asunto familiar.jpg'),
(12, 'Forrest Gump', '8', 'Steven Spielberg', 'La presidencia de Kennedy y Johnson, Vietnam, Watergate y otros eventos históricos se desarrollan desde la perspectiva de un hombre de Alabama con un IQ bajo pero buenas intenciones.', 142, 1994, 'Forrest Gump.jpg'),
(13, 'Gru 4. Mi villano favorito', '12', 'Steven Spielberg', 'Gru, Lucy y las niñas -Margo, Edith y Agnes- dan la bienvenida a un nuevo miembro en la familia: Gru Junior, que parece llegar con el propósito de ser un suplicio para su padre. Gru tendrá que enfrentarse en esta ocasión a su nueva némesis Maxime Le Mal y su sofisticada y malévola novia Valentina, lo que obligará a la familia a tener que darse a la fuga. Cuarta entrega de \'Gru, mi villano favorito\'.', 175, 2024, 'Gru 4. Mi villano favorito.jpg'),
(14, 'Schindler\'s List', '2', 'Steven Spielberg', 'En la Polonia ocupada por los nazis durante la Segunda Guerra Mundial, Oskar Schindler se convierte gradualmente en un empresario preocupado por salvar a sus empleados judíos.', 195, 1993, 'Schindler\'s List.jpg'),
(15, 'E.T. the Extra-Terrestrial', '12', 'Steven Spielberg', 'Un niño se hace amigo de un extraterrestre que está varado en la Tierra y lo ayuda a regresar a su hogar mientras intenta mantenerlo en secreto del gobierno.', 115, 1982, 'E.T. the Extra-Terrestrial.jpg'),
(16, 'Amigos imaginarios', '12', 'Steven Spielberg', 'Película sobre el viaje de una niña para redescubrir su imaginación.', 152, 2024, 'Amigos imaginarios.jpg'),
(17, 'El reino del planeta de los simios', '1', 'Steven Spielberg', 'Ambientada varias generaciones en el futuro tras el reinado de César, en la que los simios son la especie dominante que vive en armonía y los humanos se han visto reducidos a vivir en la sombra. Mientras un nuevo y tiránico líder simio construye su imperio, un joven simio emprende un angustioso viaje que le llevará a cuestionarse todo lo que sabe sobre el pasado y a tomar decisiones que definirán el futuro de simios y humanos por igual.', 153, 2024, 'El reino del planeta de los simios.jpg'),
(18, 'Intensa Mente 2', '12', 'Steven Spielberg', 'Las vocecillas dentro de la cabeza de Riley la conocen del derecho y del revés, pero el próximo verano todo cambiará cuando Del revés 2 de Disney y Pixar introduzca una nueva emoción: ansiedad.', 141, 2024, 'Intensa Mente 2.jpg'),
(19, 'The Matrix', '1', 'Steven Spielberg', 'Un programador descubre la verdad inquietante sobre su realidad y su papel en la guerra contra sus controladores.', 136, 1999, 'The Matrix.jpg'),
(20, 'Django Unchained', '14', 'Steven Spielberg', 'Con la ayuda de un cazarrecompensas alemán, un esclavo liberado se propone rescatar a su esposa de un brutal dueño de plantación en Mississippi.', 165, 2012, 'Django Unchained.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `clave` varchar(125) NOT NULL,
  `es_admin` char(1) NOT NULL DEFAULT 'N',
  `estado` char(1) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `clave`, `es_admin`, `estado`) VALUES
(1, 'Administrador', 'admin@gmail.com', '123456789', 'S', 'A'),
(2, 'César', 'cesar@gmail.com', '123', 'N', 'A'),
(3, 'Florencia', 'florencia@gmail.com', '456', 'N', 'A'),
(4, 'carolina', 'carol@gmail.com', '789', 'N', 'A'),
(7, 'santiago', 'santi@gmail.com', '159', 'N', 'A'),
(15, 'javier', 'javi@gmail.com', '753', 'N', 'A'),
(16, 'Andrea Reyes', 'andre@gmail.com', '125', 'N', 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id_pelicula`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id_pelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
