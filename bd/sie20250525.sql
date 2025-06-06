-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 20-05-2025 a les 10:46:25
-- Versió del servidor: 10.4.6-MariaDB
-- Versió de PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `sie`
--

DELIMITER $$
--
-- Funcions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `generar_codi_actuacio` (`any_actual` INT) RETURNS VARCHAR(15) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci BEGIN
  DECLARE seq INT;

  -- Comprova si l'any ja existeix a la taula de seqüència
  IF (SELECT COUNT(*) FROM `actuacions_seq` WHERE `any` = any_actual) = 0 THEN
    INSERT INTO `actuacions_seq` (`any`, `seguent_valor`) VALUES (any_actual, 1);
  END IF;

  -- Obté el valor seqüencial actual
  SELECT `seguent_valor` INTO seq FROM `actuacions_seq` WHERE `any` = any_actual;

  -- Incrementa la seqüència per a l'any
  UPDATE `actuacions_seq` SET `seguent_valor` = seq + 1 WHERE `any` = any_actual;

  -- Retorna el codi formatat com "seq-any"
  RETURN CONCAT(seq, '-', any_actual);
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `generar_codi_conveni` (`any_actual` INT) RETURNS VARCHAR(15) CHARSET utf8mb4 COLLATE utf8mb4_unicode_ci BEGIN
  DECLARE seq INT;

  -- Comprova si l'any ja existeix a la taula de seqüència
  IF (SELECT COUNT(*) FROM `conveni_seq` WHERE `any` = any_actual) = 0 THEN
    INSERT INTO `conveni_seq` (`any`, `seguent_valor`) VALUES (any_actual, 1);
  END IF;

  -- Obté el valor seqüencial actual
  SELECT `seguent_valor` INTO seq FROM `conveni_seq` WHERE `any` = any_actual;

  -- Incrementa la seqüència per a l'any
  UPDATE `conveni_seq` SET `seguent_valor` = seq + 1 WHERE `any` = any_actual;

  -- Retorna el codi formatat com "seq-any"
  RETURN CONCAT(any_actual, '-', seq);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de la taula `actuacions`
--

CREATE TABLE `actuacions` (
  `id` int(11) NOT NULL,
  `codi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codi_extern` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtipus_id` int(11) NOT NULL,
  `origen` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pressupost` decimal(10,2) DEFAULT 0.00,
  `assumit_servei` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'N',
  `observacions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `centre_id` int(11) DEFAULT NULL,
  `estat_id` int(11) DEFAULT NULL,
  `prioritat_id` int(11) DEFAULT NULL,
  `data_entrada` date NOT NULL DEFAULT current_timestamp(),
  `data_enviament` date NOT NULL,
  `tecnic_id` int(11) DEFAULT NULL,
  `origen_id` int(11) DEFAULT NULL,
  `desti_id` int(11) DEFAULT NULL,
  `mode_enviament_id` int(11) DEFAULT NULL,
  `url_ibisec` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `actuacions`
--

INSERT INTO `actuacions` (`id`, `codi`, `codi_extern`, `subtipus_id`, `origen`, `descripcio`, `pressupost`, `assumit_servei`, `observacions`, `centre_id`, `estat_id`, `prioritat_id`, `data_entrada`, `data_enviament`, `tecnic_id`, `origen_id`, `desti_id`, `mode_enviament_id`, `url_ibisec`) VALUES
(21, '1-2025', '', 200, NULL, 'Més endolls', '0.00', 'N', 'Bon dia,\r\nvos escrivim per sol·licitar la instal·lació de més endolls a l\'escola. Primer ho vàrem sol·licitar a l\'Ajuntament de Palma, però ens ens han dit que això és obra nova i ho hem de sol·licitar a Conselleria.\r\n\r\nPer això ens posam en contacte amb vosaltres, esperam que ens pogue dotar d\'això i si no explicar-nos quines són les passes per fer-ho. \r\n\r\nGràcies', 462, 3, 1, '2025-02-24', '2025-03-05', 2, NULL, NULL, NULL, ''),
(28, '2-2025', '', 218, NULL, 'Reparació unitat exterior sistema climatització', '8832.73', 'N', 'Bon dia, \r\n\r\nTal com he parlat amb en Marco, gerent Ibisec, adjunt el pressupost que ens ha enviat l\'empresa per a fer la reparació dels aires del CEIP ES FOSARRET. Aquesta reparació és de caràcter urgent, ja que fa ja molt temps que tenim problemes amb aquest sistema de climatització. \r\n\r\nEns podeu anar informant de les dates aprox. del procediment. \r\n\r\nPos en còpia a na Bel Pinya, tècnica d\'educació i Marc Gradaille, ingenyier també de l\'Ajuntament de Sóller. \r\n\r\n\r\nSalutacions,', 292, 11, 3, '2025-01-10', '2025-01-27', 1, 1, 4, 1, ''),
(33, '3-2025', '', 56, NULL, 'Pintar façana', '0.00', 'N', 'Conversa telefònica Àlex. S\'haurà de fer CM.', 793, 11, 1, '2025-02-06', '0000-00-00', 1, 1, NULL, NULL, ''),
(34, '4-2025', '', 57, NULL, 'Instal·lació d’una carpa al pati', '0.00', 'N', 'Possiblement haurem d\'enviar doblers.', 467, 2, 1, '2025-03-06', '0000-00-00', 1, NULL, NULL, NULL, ''),
(35, '5-2025', '', 49, NULL, 'Filtracions coberta', '0.00', 'N', 'Enviat informe de l\'IBISEC a l\'Ajuntament de Llubí.', 284, 2, 1, '2025-03-06', '2025-02-19', 1, 1, 3, 1, ''),
(36, '1-2024', '', 9, NULL, 'Envà divisori biblioteca', '0.00', 'N', '', 273, 2, 1, '2024-10-28', '1970-01-01', NULL, 1, NULL, NULL, ''),
(37, '6-2025', '', 59, NULL, 'Lamel·les aula d\'infantil', '2093.40', 'N', 'Bon dia,\r\nvos volia informar que tenim una aula  d\'infantil  a la planta baixa de l\'edifici i que és l\'única  aula  que no té lamel·les. Això implica que, en diverses ocasions i la darrera vegada la setmana passada, intentassin  entrar a l\'aula des de l\'exterior. No ho varen aconseguir, però altres vegades sí que hem trobat l\'aula girada. Per això, demanam, i ja ho hem sol·licitat altres vegades, que es puguin instal·lar lamel·les en aquesta finestra com les que estan col·locades a les altres aules. Vos adjunt una foto  de la finestra.', 293, 3, 1, '2025-01-28', '0000-00-00', 1, 1, NULL, NULL, ''),
(38, '7-2025', '', 67, NULL, 'Condicionament acústic', '0.00', 'N', 'Bon dia\r\nEl nostre menjador escolar és gros i té aproximadament 250 usuaris diaris. Tenim molt de renou i\r\nvoldríem millorar aquest aspecte.\r\nQuan va venir el Conseller Antoni Vera havia tengut una reunió amb la representant de l\'AFA, el\r\nbatle i regidors de l\'ajuntament d\'Esporles i es va posar de manifest la possibilitat de millorar\r\nl\'aïllament acústic del menjador escolar.\r\nPer tant sol.licitam assessorament per a millorar l\' aïllament acústic del nostre menjador\r\nescolar', 310, 13, 1, '2025-02-20', '1970-01-01', 1, NULL, 4, 1, ''),
(39, '8-2025', '', 49, NULL, 'Reparació goteres', '0.00', 'N', '', 823, 11, 1, '2025-03-07', '0000-00-00', 1, 1, 4, 1, ''),
(40, '2-2024', '', 50, NULL, 'Millores en canaletes', '0.00', 'N', 'Les caneletes de l\'edifici principal i del pavelló són molt velles, es van produint forats i goteres que anam reparant però ha aribat un moment que trobam que es necessari posar-les noves.', 785, 1, 1, '2024-11-25', '0000-00-00', NULL, 1, NULL, NULL, 'https://outlook.office.com/mail/'),
(42, '3-2024', '', 219, NULL, 'Millorar finestres', '0.00', 'N', 'Les finestres de vidre-alumini de tot el centre són molt antigues. Són molt males d\'obrir i tancar i\r\nno són eficients en l\'aspecte energètic. Estaria bé posar-les noves amb vidres i perfileria eficient.', 785, 1, 1, '2024-11-25', '0000-00-00', NULL, 1, NULL, NULL, ''),
(44, '4-2024', '', 220, NULL, '', '0.00', 'N', 'Les finestres tenen unes persianes de lames de plàstic. Amb el temps s\'han anat deteriorant i\r\ncada any caven algunes lames. Durant aquest darrers anys nosatres hem anat substiuint les que es\r\ntroben més malament per persianes de lames d\'alumni però ha arribat un moment que el nombre\r\nde persines que convé substituir superen la nostra capacitat d\'actuació. Estaria bé canviar totes les\r\npersianes per persianes de lames d\'alumini', 785, 1, 1, '2024-11-25', '0000-00-00', NULL, 1, NULL, NULL, ''),
(45, '5-2024', '', 203, NULL, 'Canvi alarma contra incendis', '0.00', 'N', 'Bon dia, \r\n\r\nBon dia, hem demanat pressupost per canviar l\'alarma que la tenim digital a analògica. Ens interessa saber no només la zona del centre on es dispara, sinó que quan hi ha dispars intempestius saber el sensor.\r\n\r\nPer això, necessitam saber si tenim els sensors que toca i complim o no la normativa, ja que el pressupost que ens han presentat, indica que no complim la normativa vigent.\r\n\r\nAgrairíem si ens podeu ajudar i assessorar en aquest aspecte i si us interessa venir a veure la nostra instal·lació.\r\n\r\nGràcies', 784, 1, 1, '2024-12-05', '0000-00-00', NULL, 1, NULL, NULL, ''),
(56, '21-2025', '', 55, NULL, 'Desprendiment mur', '0.00', 'N', 'Hola Toni,\r\n\r\nEL CEIP Sa Graduada de Maó tiene un problema con muro que se está desplomando sobre la parcela colindante. Te adjunto nuestro informe.\r\n\r\nÀlex, la directora territorial, está mirando con el ayuntamiento si, al ser una medianera, tiene que pagarse a medias con el propietario. \r\n\r\nSea como sea (pagarlo a medias o pagarlo la Conselleria), podéis encargaros vosotros al ser un menor.\r\n\r\nDime cosas!!!\r\n\r\nUn abrazo', 412, 7, 1, '2025-01-02', '2025-02-24', 1, 1, 2, 1, ''),
(57, '22-2025', '', 21, NULL, 'NOVES ESTRUCTURES PEL PATI D\'EDUCACIÓ INFANTIL', '0.00', 'N', 'Dia 5 de març el centre va enviar un mail i no es va contestar referent a las estructures per a jocs que volen instal·lar al pati.', 252, 11, 2, '2025-03-05', '0000-00-00', 2, 1, NULL, NULL, ''),
(59, '24-2025', '', 9, NULL, 'Sol·licitud mòdul prefabricat mòbil infantil al pati', '0.00', 'N', 'Sol·liciten la instal·lació d’un mòdul prefabricat al pati de 143m² per disposar de dues aules i\r\npoder aprofitar al màxim l’espai útil de l’escola reformada. Així tota l’etapa d’infantil\r\npodria estar ubicada allà. Rebut per VALIB 374458', 409, 1, 1, '2025-03-20', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(60, '25-2025', '', 57, NULL, 'Tendals ombra als patis del centre', '0.00', 'N', 'En cas que finalment l\'IBE no pugui realitzar aquestes actuacions, des del Servei d\'Infraestructures Educatives us proposarem una alternativa per tal que la instal·lació d\'ombres al vostre pati sigui una realitat.', 305, 1, 1, '2025-03-21', '0000-00-00', 1, 1, NULL, NULL, ''),
(61, '26-2025', '', 56, NULL, 'Cartell nom del centre', '0.00', 'N', 'Tramesa del pressupost de la placa del nom del centre previst per a col·locar a la façana de l\'entrada principal del centre.', 449, 11, 1, '2025-03-20', '0000-00-00', 2, 1, NULL, NULL, ''),
(62, '27-2025', '', 57, NULL, 'Estructura ombra pati', '0.00', 'N', 'Tramesa de l\'escrit de l\'AFA del centre en referència a l\'estructura d\'ombra que es vol col.locar a un dels patis. ', 281, 1, 1, '2025-03-21', '0000-00-00', NULL, 1, NULL, NULL, ''),
(63, '28-2025', '', 200, NULL, 'Desperfectes aula prefabricada', '0.00', 'N', 'Petició per arreglar els llums d\'una aula prefabricada.', 337, 7, 1, '2025-03-21', '0000-00-00', 1, 1, 2, NULL, ''),
(64, '29-2025', '', 57, NULL, 'Acondicionament terrasses infantil', '0.00', 'N', '', 353, 1, 1, '2025-03-21', '0000-00-00', NULL, 1, NULL, NULL, ''),
(65, '30-2025', '', 218, NULL, 'Rebut sol·licitud expedient de despesa ED2025-33', '5847.00', 'N', 'Rebut sol·licitud expedient de despesa ED2025-33. Donem el vistiplau de l\'actuació, i indicam que no és necessari ED (menys de 6.000€).', 821, 11, 1, '2025-03-24', '2025-03-24', 1, NULL, NULL, 1, ''),
(66, '31-2025', '', 72, NULL, 'Dubtes sobre tres espais del centre', '0.00', 'N', '', 375, 11, 1, '2025-03-24', '0000-00-00', NULL, 1, NULL, NULL, ''),
(67, '32-2025', '', 75, NULL, 'Desperfectes de goteres', '0.00', 'N', 'Volen informació de la qüestió de les goteres del centre que van enviar el passat 11 de Març', 797, 1, 1, '2025-03-25', '0000-00-00', NULL, 1, NULL, NULL, ''),
(68, '33-2025', '', 72, NULL, 'Frigorífic avariat', '0.00', 'N', 'Dubtes de les característiques del frigorífic.\r\n09/04 - Els enviam @, han de decidir si reparen o substitueixen frigorífic', 369, 11, 1, '2025-03-25', '0000-00-00', 1, 1, NULL, NULL, ''),
(69, '34-2025', '', 223, NULL, 'Neteja forjat sanitàri i reparació col·lector aigues fecals', '0.00', 'N', '', 831, 11, 3, '2025-03-25', '0000-00-00', 1, NULL, NULL, NULL, ''),
(70, '35-2025', '', 52, NULL, 'Goteres a les aules prefabricades', '0.00', 'N', 'Dia 25 de març hi ha una segona reiteració del tema goteres del qual ja van informar a l\'octubre 2024 en un @ amb diverses actuacions', 804, 11, 1, '2025-03-25', '0000-00-00', NULL, 1, NULL, NULL, ''),
(72, '37-2025', '', 9, NULL, 'Necessitat d\'espai al CEPA Pitiüsses', '0.00', 'N', '', 494, 1, 1, '2025-03-24', '0000-00-00', NULL, 1, NULL, NULL, ''),
(73, '38-2025', '', 72, NULL, 'Instal·lació d\'una font d\'aigua al pati', '0.00', 'N', 'Reiteració del @ de 30 de gener de la petició de instal·lació d\'una font d\'aigua al pati', 489, 11, 1, '2025-03-24', '0000-00-00', 1, 1, NULL, NULL, ''),
(74, '39-2025', '', 200, NULL, 'Sol·liciten la substitució de lluminàries a les aules', '0.00', 'N', 'sol·liciten la substitució de la lluminària fluorescent a les 37 aules de l\'edifici del carrer Joan Coll per pantalles LED. Remeten fotografies.', 798, 1, 1, '2025-03-26', '0000-00-00', 1, 1, NULL, NULL, ''),
(75, '40-2025', '', 54, NULL, 'Avaluació i sol·licitud de finançament per a la reparació de desperfectes esctructurals', '0.00', 'N', 'Esquerdes significatives, despreniments i degradació del formigó causats per humitats, filtracions i moviments estructurals.', 824, 1, 1, '2025-03-18', '0000-00-00', NULL, 1, NULL, NULL, ''),
(76, '41-2025', '', 61, NULL, 'DEFICIÈNCIES PAVIMENT DE SALES I DESPATXOS DEL CEIP ES PUIG DE SÓLLER', '0.00', 'N', 'Ha arribat l\'nforme tècnic municipal', 297, 13, 1, '2025-03-27', '0000-00-00', 1, 1, NULL, NULL, ''),
(77, '42-2025', '', 72, NULL, 'Deficiències a les instal·lacions elèctriques', '0.00', 'N', 'adjuntem els escrits rebuts per distribució electrònica de l\'Associació de pares i mares d\'alumnes del CEIP Jaume I, i de l\'associació de veinats i amics de Palmanova amb relació a les deficiències de la instal·lació electrica, i adreçades al Conseller.', 323, 11, 1, '2025-03-27', '0000-00-00', 2, 1, NULL, NULL, ''),
(78, '43-2025', '', 221, NULL, 'Sol·liciten la substitució de les portes d\'entrada al centre', '0.00', 'N', 'Envien Fotografies', 469, 1, 1, '2025-03-27', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(79, '44-2025', '', 10, NULL, 'Adequació instal·lacions audiovisuals.', '0.00', 'N', 'les instal·lacions tècniques d’àudio i enllumenat estan obsoletes', 795, 1, 1, '2025-03-27', '0000-00-00', NULL, 1, NULL, NULL, ''),
(80, '45-2025', '', 21, NULL, 'Protecció pilars, canastas minibasquet i rocòdrom', '0.00', 'N', 'Actuacions al pati: Protecció pilars, canastas minibasquet i rocòdrom', 467, 11, 1, '2025-03-26', '0000-00-00', 1, 1, NULL, NULL, ''),
(81, '46-2025', '', 53, NULL, 'Substitució de persianes i rehabilitació façanes', '0.00', 'N', '', 814, 1, 1, '2025-03-31', '0000-00-00', NULL, 1, NULL, NULL, ''),
(82, '47-2025', '', 72, NULL, 'dubtes referent als residus', '0.00', 'N', 'Volen saber com gestionar els residus, piles, fluorescents i tòners', 767, 1, 1, '2025-03-31', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(83, '48-2025', '', 71, NULL, 'Consulta amb relació a un informe tècnic de l\'Ajuntament sobre l\'estat de les màquines', '0.00', 'N', '', 310, 1, 1, '2025-03-31', '0000-00-00', NULL, 1, NULL, NULL, ''),
(84, '49-2025', '', 78, NULL, 'Equips de fred del menjador avariats', '0.00', 'N', '', 392, 3, 1, '2025-03-28', '0000-00-00', 1, 1, NULL, NULL, ''),
(85, '50-2025', '', 9, NULL, 'Reformes a la casa de la conserge', '0.00', 'N', 'han concedit la implantació del CFGS d\'Allotjaments Turístics pel proper curs 25/26', 821, 2, 1, '2025-03-31', '0000-00-00', 1, NULL, NULL, NULL, ''),
(86, '51-2025', '', 79, NULL, 'Toldos per tenir ombra davant les classes de primer cicle', '0.00', 'N', 'Petició per instal·lar tendals enrotllables a la façana d\'unes aules del centre.', 347, 11, 1, '2025-03-31', '0000-00-00', 2, 1, NULL, 1, ''),
(87, '52-2025', '', 201, NULL, 'Reiteren: Sol·liciten rosetes per cable de xarxa a les aules, sense fils la connexió no funciona bé.', '0.00', 'N', 'Amb data 31/03 reiteren la petició. AQUESTA PETICIÓ S\'HAVIA ASIGNAT PER ERROR A SA GRADUADA DE MAÓ.', 573, 1, 2, '2025-03-20', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(88, '53-2025', '', 78, NULL, 'Reformes a la cuina', '0.00', 'N', 'Bon dia, som na Maria Antònia Marroig Colom, Directora del CEiP Ses Marjades. Al nostre centre educatiu tenim una cuina que ha tornat molt vella i està en mal estat i en la que realitzam diferents activitats educatives, com el taller de cuina setmanal o els tallers puntuals quan arriben algunes festivitats. Nosaltres podem fer la gestió de demanar els pressuposts i fer el seguiment però volem saber si podem comptar amb els diners per part de la conselleria i quin són els tràmits a seguir i la documentació a aportar.', 438, 3, 1, '2025-04-01', '0000-00-00', 1, NULL, NULL, NULL, ''),
(89, '54-2025', '', 227, NULL, 'Reiteren Sol·lilcitud aula prefabricada i demanen informació sobre la licitació de la cuina', '0.00', 'N', 'En referència a les mancances d\'espai del CEIP Son Juny de Sant Joan, adjuntem informe del nostre tècnic municipal així com informe de l\'escola, per que valoreu la necessitat de una aula prefabricada si es possible dins aquest curs escolar 2024-2025 i sinó per el pròxim 2025-2026', 450, 1, 2, '2025-04-02', '0000-00-00', NULL, 1, NULL, NULL, ''),
(90, '55-2025', '', 77, NULL, 'Instal·lació de gronxadors sala psicomotricitat', '0.00', 'N', '', 326, 3, 1, '2025-04-02', '0000-00-00', 1, 1, NULL, NULL, ''),
(91, '56-2025', '', 54, NULL, 'Vàries actuacions', '0.00', 'N', 'Bon dia,\r\nTal i com hem parlat avui a la visita al centre, adjunt els remetem el llistat de desperfectes del CEIP Badies amb les imatges corresponents. Totes aquestes incidències han estat comunicades en diferents correus a l\'Ajuntament de Llucmajor sense tenir resposta alguna.\r\nUs enviam un altre correu amb més imatges.\r\nEsperam poder solucionar, al manco, el que és més urgent pel perill que comporta.\r\nMoltes gràcies i salutacions cordials,\r\n\r\nAlícia Rigo, directora del CEIP Badies', 258, 12, 1, '2025-04-02', '0000-00-00', NULL, 1, NULL, NULL, ''),
(92, '57-2025', '', 76, NULL, 'Ampliació sala de professorat', '0.00', 'N', 'Es una reiteració del assumpte de la sala de professors. Volen saber com està el tema.', 774, 1, 1, '2025-04-03', '0000-00-00', NULL, 1, NULL, NULL, ''),
(93, '58-2025', '', 75, NULL, 'Desperfectes Humitats Edifici', '0.00', 'N', 'Ens han sortit moltes taques d\'humitat a tota una ala de l\'edifici. En concret a 5 aules. L\'ambient és molt insalubre. Hem anat fent net i també posant humidificadors, però sospitam que el problema és més greu perquè es va estenent a la resta de l\'edifici i veim que va a més. Voldria saber si qualque tècnic ho pot venir a veure i dir-nos qui s\'ha d\'encarregar (ajuntament o administració) de valorar i reparar aquest desperfecte. Adjunt una fotografia com a mostra del que està succeint a totes les aules.', 351, 1, 1, '2025-04-03', '0000-00-00', NULL, 1, NULL, NULL, ''),
(94, '59-2025', '', 81, NULL, 'Obra remodelació espai equip directiu', '0.00', 'N', 'Volem sol·licitar fer obra al nostre despatx ja que tenim el rack del centre just dedins. Voldríem\r\ntancar-lo amb una paret de pladur, obrir-ne una d\'obra que està a l\'altre costat, i posar una\r\nporta. Adjuntem imatges, així i tot vos demanem una visita presencial d\'algun tècnic per veure\r\n\"in situ\" l\'espai. Vos demanem l\'autorització i l\'execució d\'aquesta obra\r\nAdjunten pressupost.\r\nReiteració: El 14/05 crida el director Joan Miquel Serra per saber si poden començar les obres el mes de juliol', 263, 1, 2, '2025-04-04', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(95, '60-2025', '', 1, NULL, 'Sol·licitud instal·lació d\'Aire Acondicionat', '0.00', 'N', 'Es va fer una obra d\'acondicionament de les noves instal.lacions. Des d\'IEPI ens varen informar que no havia pressupost per incloure l\'aire acondicionat.\r\nAra ens han dit que, actualment, sí es disposa de dotació econòmica per posar aire acondicional a la seu de l\'EAP, que ho hem de sol.licitat mitjançant un correu, a vosaltres, i que ens dirieu les segúents passes a fer', 567, 1, 1, '2025-04-04', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(96, '61-2025', '', 76, NULL, 'Reubicació aula UEECO', '0.00', 'N', 'Consulta relacionada amb la reorganització dels espais prevista de cara al proper curs, arran de l\'autorització de l\'aula UEECO.', 387, 1, 1, '2025-04-04', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(97, '62-2025', '', 13, NULL, 'Instal·lació de dues piques i griferia a l\'aula de plástica', '0.00', 'N', '', 326, 3, 1, '2025-04-04', '0000-00-00', 1, 1, NULL, NULL, ''),
(99, '64-2025', '', 78, NULL, 'Trasllat menjador escolar', '0.00', 'N', 'possibilitat de traslladar el menjador a un nou espai dins del mateix edifici. Es tracta de dues aules contigües que volem unificar en una sola, i per les quals ja comptem amb l\'aprovació del pla d\'infraestructures per part de l\'ajuntament de Sant Josep.  Ens agradaria saber si seria viable destinar aquest espai com a nou menjador', 271, 1, 1, '2025-04-10', '0000-00-00', NULL, 1, NULL, NULL, ''),
(100, '65-2025', '', 54, NULL, 'Reparació reixa metàl·lica al bar del centre.', '0.00', 'N', 'Bon dia,\r\n\r\nDes de l\'IES s\'Arenal volem informar d’un desperfecte que afecta la seguretat de l’alumnat i del personal del nostre centre, i que convindria reparar amb la màxima celeritat possible.\r\n\r\nConcretament, el problema es troba a la barana situada a la zona del bar, que protegeix un desnivell d’aproximadament 1,5 metres.', 818, 11, 3, '2025-04-10', '0000-00-00', 2, NULL, NULL, NULL, ''),
(101, '66-2025', '', 224, NULL, 'Desperfectes i necessitats del centre', '0.00', 'N', 'L\'IBISEC ens reenvia el correu que ha rebut del centre amb els desperfectes.', 399, 1, 1, '2025-04-10', '0000-00-00', NULL, 1, NULL, NULL, ''),
(102, '67-2025', '', 202, NULL, 'Comptador compartit IES/CEIP Son Rullan', '0.00', 'N', 'La setmana passada, els serveis de manteniment de l\'Ajuntament de Palma em varen enviar un correu sobre la inspecció OCA (per un Organisme de Control Autoritzat) del CEIP Son Rullan, que comparteix comptador amb l\'IES Son Rullan.\r\nHe arxivat els documents als dos centres, tant a la carpeta de l\'IES Son Rullan com a la carpeta del CEIP Son Rullan. S\'hauria d\'obrir una actuació per cada centre, per tenir-les presents.', 453, 3, 1, '2025-04-11', '0000-00-00', 2, NULL, NULL, NULL, ''),
(103, '68-2025', '', 202, NULL, 'Comptador compartit IES/CEIP Son Rullan', '0.00', 'N', 'La setmana passada, els serveis de manteniment de l\'Ajuntament de Palma em varen enviar un correu sobre la inspecció OCA (per un Organisme de Control Autoritzat) del CEIP Son Rullan, que comparteix comptador amb l\'IES Son Rullan.\r\nHe arxivat els documents als dos centres, tant a la carpeta de l\'IES Son Rullan com a la carpeta del CEIP Son Rullan. S\'hauria d\'obrir una actuació per cada centre, per tenir-les presents.', 833, 3, 1, '2025-04-11', '0000-00-00', 2, 1, NULL, NULL, ''),
(104, '69-2025', '', 71, NULL, 'Licitació ventiladors', '0.00', 'N', 'Bon dia,\r\na principi de curs vam ser informats que Conselleria havia adquirit una partida per a comprar ventiladors. Volíem saber com està aquest tema?\r\ngràcies', 804, 11, 1, '2025-04-14', '0000-00-00', 1, NULL, NULL, NULL, ''),
(105, '70-2025', '', 52, NULL, 'Vàries actuacions', '0.00', 'N', 'Som en Joan Ramon Mateu Torandell director del CEIP Miquel Capllonch\r\nMe posava en contacte amb vosaltres per dues qüestions:\r\n\r\n    1. Feines pendents:  a) Com ja heu estat informats en diverses vegades tenim unes humitats que ens venen del terra, suposadament es alguna tuberia de les baixants de les pluvials que ens causa el problema. L\'ajuntament de Pollença ja us ha enviat l\'informe tècnic i esperam resposta. b) A principi de curs varem rebre la visita del conseller i vàrem comunicar que ens agradari fer un tancament de les entrades d\'educació infantil, ja que estan a l\'intemperi i quan plou l\'aigua entra a les aules. Seguim esperant resposta.\r\n    2. Dubtes i mes problemes: Resulta que tenim dins la sala de màquines un acumulador d\'aigua calenta que s\'ha foradat i necessitam canviar-lo o arreglar-lo; a més a més, ens hem adonat que el desaigua que hi ha a la sala de calderes no està al lloc adequat ja que la sala te el rost canviat i el desaigua no recull l\'aigua per tant ens causa goteres interiors i més humitats. Necessitam una RESPOSTA PER SABER COM ACTUAR.\r\nAdjunt fotografies dels diferents casos.', 355, 1, 1, '2025-04-15', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(106, '71-2025', '', 52, NULL, 'Problemes greus de goteres', '0.00', 'N', 'S\'han enviat diferents emails (17 de març, 14 d\'abril i 15 d\'abril) indicant els\r\nproblemes greus de goteres que patim al CEPA Llevant i noves fissures que han\r\naparegut.\r\nDes d\'IBISEC ens han comunicat que s\'han enviat al vostre departament. Si fos\r\npossible, ens agradaria saber en quina situació es troba aquesta sol·licitud, ja que\r\ncada vegada s\'ha agreujat més la problemàtica que patim i des del dia 17 de març\r\nno hem rebut cap resposta', 492, 1, 3, '2025-04-15', '0000-00-00', NULL, 4, NULL, NULL, ''),
(107, '72-2025', '', 13, NULL, 'Sol·licitud de renovacio de tots els banys antics.', '0.00', 'N', 's\'han detectat fugues per rotura de canonades durant les\r\nvacances de Pasqua L\'Ajuntament s\'encarregarà de valorar els danys i poder donar solució\r\ndurant l\'estiu (Hauran d\'alçar el terre fins arribar a l\'escomesa del carrer)\r\nL\'entitat municipal s\'encarregarà d\'arreglar les canonades però no actualitzarà els banys que\r\ndaten de la construcció de l\'edifici 1970, les cisternes encara tenen cadena...\r\nPer aquest motiu sol·licitam la renovació de tots els banys antics del centre.', 470, 1, 1, '2025-04-28', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(108, '73-2025', '', 76, NULL, 'Consulta amb relació al canvi de lloc del despatx de la direcció', '0.00', 'N', 'voldríem fer un canvi d\'ubicació del despatx de direcció per posar-lo en un lloc més accessible i a l\'abast de tota la comunitat (s\'adjunta plànol). \r\nWhatsApp Image 2025-05-02 at 11.08.34 (1).jpeg', 255, 3, 1, '2025-05-02', '0000-00-00', 2, 1, NULL, NULL, ''),
(109, '74-2025', '', 72, NULL, 'Descalcificador avariat', '0.00', 'N', 'tenim un problema amb el descalsificador situat a l\'edifici d\'infantil on també hi ha la cuina i el menjador. \r\nL\'aparell no funciona i això fa que els electrodomèstics es facin malbé.\r\nUn dels rentaplats ja s\'ha romput i l\'altre té avaries constants per culpa de la calç.\r\nDes de l\'Ajuntament ens asseguren que no és competència seva la reparació.\r\nVoldríem saber si des de l\'IBISEC es podria reparar o canviar aquest aparell, tal i com es va fer amb l\'aire del quarto fred el curs passat. \r\nHem de fer la compra d\'un rentaplats nou i és una despesa important que no volem fer sinó tenim arreglat el descalsificador, per evitar avaries en l\'aparell nou.\r\n\r\nEsper la vostra resposta', 345, 3, 1, '2025-05-02', '0000-00-00', 1, 1, NULL, NULL, ''),
(110, '75-2025', '', 223, NULL, 'Posible fuita d\'aigua', '0.00', 'N', 'Envio aquest correu als contactes que tenim a fi d\'accelerar la comunicació, demanam perdó si fem spam. Al dia d\'avui el centre està pendent de l\'autorització d\'una porta nova a la cafeteria; al darrer correu hem adjuntat nous pressupostos adaptats a les consideracions tècniques requerides per part seva, estam esperant una resposta per iniciar les tasques.. D\'ALTRA BANDA vos comuniquem que hem detecta una important fuita d\'aigua a la canalització d\'aigua des de l\'aljub dels edificis de sos Monjos i de Batxillerat cap els edificis. El motor d\'impulsió està permanentment en marxa i no hem vist cap aixeta ni cisterna oberta, per tant pensam que és una fuita important de la canal subterrània de la conducció d\'aigua neta. Ara mateix tenim els banys dels mencionats edificis i l\'alumnat i professorat dels dos edificis baixa per fer ús a l\'edifici principal. Esperam assessorament per part de conselleria ja que no es tracta d\'una simple feina de llanterners.', 800, 1, 3, '2025-05-02', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(111, '76-2025', '', 218, NULL, 'Contracte manteniment climatitzacio i  varis treballs de conservació pendents', '0.00', 'N', 'A partir d’aquest 2025 ja no tendrem l’empresa de manteniment que la conselleria ens va\r\nassignar (Requejo) durant els dos darrers anys. A partir d’ara el manteniment l’haurem de\r\nfer nosaltres, però el problema que tenim és amb el manteniment del sistema de\r\nclimatització. Hem demanat a la mateixa empresa per continuar amb el manteniment i el\r\ncost mensual és de 1298.22 € (annex 1) més les reparacions que se’n derivin. No podem fer\r\nfront als més de 15.000€ que suposarà el manteniment de la climatització.\r\nA part del manteniment de la climatització, hi ha una sèrie d’actuacions per a la conservació\r\nde l’edifici que no s’ha duit a terme durant aquests 2 anys en els quals l’empresa Requejo\r\nse n’ha ocupat del manteniment i que fan que l’estat i la imatge del centre es deteriori\r\n(annex 2): parets sense pintar, il·luminació molt deficient, portes de fusta rompudes,\r\ndiverses goteres a les teulades, taques d’humitat a la façana… i una urgent revisió del\r\nsistema elèctric.\r\nA més a més, després de la visita del conseller durant el curs passat, s’acordaren tres\r\nactuacions més grans que encara romanen sense data de realització: reforma de\r\nconsergeria, revisió de l’amfiteatre i asfaltat del pati.\r\nPER AIXÒ, DEMANAM\r\n1- Disposar d’una solució realista per al manteniment de la climatització i les actuacions de\r\nconservació de l’edifici.\r\n2- Tenir una data de realització de les actuacions acordades amb el conseller', 791, 1, 1, '2025-05-06', '0000-00-00', NULL, 1, NULL, NULL, ''),
(112, '77-2025', '', 219, NULL, 'Caiguda del tancament perímetral', '0.00', 'N', 'Adjunt algunes de les fotos dels efectes d\'un acte de vandalisme fet per dos al.lots (han provocat un incendi devora les aules taller) que han entrat fàcilment al pati aquest diumenge a causa del deteriorament i caiguda de part del mur perimetral. \r\nPer la qual cosa us pregam una actuació ràpida per subsanar aquesta deficiència que ja duim temps reclamant.', 798, 1, 3, '2025-05-06', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(113, '78-2025', '', 64, NULL, 'Reiteren Sol·licitud de 27/02/2025 d\'eliminació de barreres arquitectòniques', '0.00', 'N', 'Bon dia, en data del 21 de febrer varem compartir un arxiu amb fotos per justificar la necessitat de eliminar barreres arquitectòniques a l\'IES XARC.\r\nEncara no hem obtingut resposta i volem saber si s\'ha de fer a través de IBISEC o ho podem fer a través de infraestructures. El centre té alumnes amb discapacitats i necessitem poder donar tràmit a la seva petició. Ens podeu donar instruccions?\r\n\r\nD\'altra banda, el mateix centre està pendent de canviar la fusteria donat que les portes estan desfetes i ja no es poden arreglar els panys perquè la fusta està desfeta. són unes 70 portes. Aconselleu iniciar l\'actuació a través de IBISEC o considereu que serà més ràpid fer una part aquest any a través de Infraestructures i una altra part l\'any vinent?  \r\n\r\nEsperem la vostra resposta.', 834, 1, 2, '2025-05-06', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(114, '79-2025', '', 72, NULL, 'Consulta relacionada amb l\' inspecció dels ascensors', '0.00', 'N', 'L\'OCA ens ha enviat el certificat, que és favorable sense defectes però que inclou 2 deficiències que, segons ens van informar, corresponen a modificacions introduïdes a la darrera normativa sobre ascensors que es va publicar l\'any passat i que, en qualsevol cas, hauran de quedar resoltes abans de la propera inspecció d\'aquí a 2 anys.', 828, 11, 1, '2025-05-07', '0000-00-00', 1, NULL, NULL, NULL, ''),
(115, '80-2025', '', 21, NULL, 'Sol·licitud d’instal·lació d’estructura de joc per al pati d’educació infantil', '0.00', 'N', 'Tal com se’ns va indicar, aquest tipus d’equipaments no han pogut ser inclosos dins la licitació inicial per motius tècnics (vist i plau municipal, compliment de normativa específica, etc.), i és aquest Servei qui n’ha de supervisar la tramitació i execució.\r\n\r\nConsiderem aquesta estructura com una necessitat prioritària, ja que és essencial per al desenvolupament psicomotor i social dels infants de 3 a 6 anys. \r\n\r\nRestam a l’espera de les vostres indicacions sobre els passos a seguir per iniciar aquest procés, així com sobre la viabilitat i els criteris per fer aquesta sol·licitud. Restam també a la vostra disposició per ampliar qualsevol informació que pugui ser necessària.', 306, 3, 1, '2025-05-07', '0000-00-00', 1, 1, NULL, NULL, ''),
(116, '81-2025', '', 223, NULL, 'Rotura tuberia baixant i filtracions a una aula', '0.00', 'N', 'Us informam que aquest matí s’ha detectat una incidència greu a l\'aula de 5 anys A d\'Educació Infantil. Ens hem trobat amb una important acumulació d’humitat i una forta mala olor. Posteriorment, s’ha produït una filtració d\'aigua a l\'interior de l’aula.\r\n\r\nTot sembla indicar que la fuita prové d\'una baixant, possiblement vinculada a les instal·lacions de la cuina. L\'aigua ha entrat dins l\'aula amb una olor molt desagradable, fet que ens ha obligat a traslladar l’alumnat a un altre espai del centre per garantir la seva seguretat i benestar.\r\n\r\nAtesa l’ experiència dels darrers anys amb problemàtiques similars, sol·licitam la coordinació i la intervenció immediata tant de l’Ajuntament d’Esporles com de la Conselleria d’Educació per tal de solucionar aquesta situació de manera urgent i definitiva.\r\n\r\nAdjuntam fotografies preses aquest mateix matí per documentar l’estat de l’espai afectat.', 310, 1, 3, '2025-05-07', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(117, '82-2025', '', 8, NULL, 'Ampliació sala cap d\'estudis', '0.00', 'N', 'L\'equip directiu de l\'IES Cap de LLevant sol·licita poder engrandir la sala de cap d\'estudis del centre ajuntant-la amb una sala contigua. Es tracta de eliminar un mur de separació entre les dues sales, aquest mur no arriba fins la part de dalt del sostre sinó que només supera un poc el fals sostre, és un mur només de separació i per tant, és fàcil enderrocar-lo.\r\n\r\nEl centre es faria càrrec de la part econòmica de les obres i aquestes durien a terme a final d\'aquest curs quan ja no hi hagi alumnes, finals de juny, juliol o agost.\r\n\r\nRemetem plànol amb la situació exacte del mur, marcat en color vermell, que es vol suprimir. Les dues estàncies a ajuntar serien les E022 i la E024.', 778, 1, 1, '2025-05-08', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(118, '83-2025', '', 224, NULL, 'Sol·licitud de substitució del ascensor', '0.00', 'N', 'Em dirigeixo a vosaltres des de l\'IES Calvià, amb motiu de les deficiències detectades a l’ascensor de l’edifici A del nostre centre, que es troba fora de servei des d\'abans de les vacances de Pasqua. Aquestes deficiències han estat detallades a al missatge enviat per l’empresa de manteniment, que adjunt a aquest correu per a la vostra consideració.\r\n\r\nL’empresa responsable del manteniment m\'ha facilitat un pressupost de reparació, també adjunt, que contempla la substitució de determinades peces. Tanmateix, m\'han informat que, en cas de fallida d’altres components no inclosos en el pressupost, la reparació podria resultar inviable a causa de l’obsolescència de l’equip actual.\r\n\r\nDavant d’aquesta situació, i per garantir la seguretat i accessibilitat dels usuaris del centre, sol·licito la substitució completa de l’ascensor, incloent-hi l’execució de l’obra necessària. Adjunt igualment el pressupost corresponent a aquesta actuació per a la vostra valoració.\r\n\r\nNo obstant això, estam treballant amb altres empreses del sector per valorar altres pressupostos i així, en cas que ens doneu la possibilitat de rebre la partida pressupostària, poder realitzar l\'expedient de despesa corresponent.\r\n\r\nResto a la vostra disposició per ampliar qualsevol informació que considereu necessària i quedo a l’espera de la vostra resposta.\r\n\r\nAtentament,', 775, 1, 1, '2025-05-12', '0000-00-00', NULL, 1, NULL, NULL, ''),
(119, '84-2025', '', 219, NULL, 'Sol·licitud canvi de finestres', '0.00', 'N', 'Bon dia,\r\ntal com hem quedat en conversa telefónica demanam informació sobre la sol·licitud de canvi de finestres i persianes de la nostra escola.\r\nSembla que la sol·licitud no es troba.\r\nEl curs 23-24 vàrem tenir la visita del conseller d\'educació i ens va dir que durant el curs 24-25 es canviarien  les finestres i les persianes.\r\nLes finestres són molt antigues i velles. No tanquen bé. Quan feim el simulacre d\'incendis per normativa totes les finestres han de quedar tancades. D\'algunes aules i passadissos és impossible fer-ho ràpidament i sense pujar-se a una escala.\r\nEls vidres de les finestres són molt prims i passam fred en l\'hivern i calor en l\'estiu. Els passadissos són un forn quan fa calor.\r\nMoltes finestres estan sense lames i és perillós perquè els infants poden caure i quan fa calor és necessari tancar les persianes.\r\nDemanam informació de l\'actuació requerida.', 326, 1, 1, '2025-05-12', '0000-00-00', NULL, 1, NULL, NULL, ''),
(120, '85-2025', '', 224, NULL, 'Sol·licitud, per part de l\'Ajuntament de Palma, de manteniment periòdic d\'una zona enjardinada', '0.00', 'N', 'Des del Servei d’Infraestructures Educatives hem rebut una petició de l’Ajuntament de Palma, derivada d\'una queixa vecinal per tal que es dugui a terme una actuació de neteja d’herbes i manteniment a la zona enjardinada devora el Conservatori Superior de Música i Dansa, especialment a l’entorn de l’estàtua als Donants de Sang, al carrer Alfons el Magnànim.\r\n\r\nSegons s’indica, l’espai es troba en un estat de deixadesa, amb presència d’herbes i brutícia.', 554, 1, 1, '2025-05-13', '0000-00-00', NULL, 2, NULL, NULL, ''),
(121, '86-2025', '', 224, NULL, 'Tala de pins, risc de caigudes per vent o pluja', '0.00', 'N', 'tenim un jardí molt gran amb uns 20 pins, però cada vegada són més grans i ja començen a invadir l\'edifici. Vos adjunt un informe de l\'empresa de jardineria amb les recomenacions que hem de fer. Aleshores, \r\n\r\n    Podem talar els pins? Pensam que són un risc per a la comunitat educativa i per als edificis.\r\n    Qui paga aquesta despesa?\r\n    Avançam nosaltres els diners  i després la Conselleria ens fa un ingrés?\r\n\r\nQued a l\'espera de la vostra resposta per fer una següent passa,', 767, 1, 3, '2025-05-16', '0000-00-00', NULL, 1, NULL, NULL, ''),
(122, '87-2025', '', 223, NULL, 'Bany amb fuites d\'aigua', '0.00', 'N', 'Des del mes de juliol tenim banys condemnats per fugues d\'aigua. \r\nEn el mes de novembre va venir l\'arquitecta Helena Guinjoan a fer la visita a les instal·lacions. No hem rebut resposta.\r\nA finals de gener vam rebre una partida econòmica en concepte d\'obres. Sense cap explicació.\r\nEsteim a l\'espera, que ens detallin el procediment a seguir.\r\nDesprés de varies telefonades i correus, no hem rebut resposta i ja és un tema preocupant, les fugues son per dins l\'infraestructura i no totes es fan visibles fàcilment. Això suposa un deterior de l\'edifici. També dir que el problema es fa extensible a altres sanitaris. Ara ja son més els banys que necessiten reparació.\r\nAgrairíem que us possessiu en contacte amb el centre per sabre com procedir.', 268, 1, 2, '2025-05-16', '0000-00-00', NULL, 1, NULL, NULL, ''),
(123, '88-2025', '', 224, NULL, 'Caiguda de lluminàries al fals sostre', '0.00', 'N', 'avui, et temps del pati, dos professors eren a una de les sales de feina que tenim al centre i ha\r\ncaigut un dels llums del fals sostre i 2 o 3 plaques. Adjunt 2 fotografies.\r\nJustament, un dels professors s\'havia aixecat per anar a cercar uns papers i no l\'ha endevinat,\r\nperò podria haver estat molt greu.\r\nAra mateix, hem tancat la sala i hem telefonat a la persona que ens du el manteniment per què\r\nvengui urgentment a arreglar el desperfecte i revisi la resta de fals sostre per tal d\'assegurar que\r\nno implica perill.\r\nAquest fet ens fa pensar en quin deu ser l\'estat del fals sostre de tota la resta del centre. Això\r\nhagués pogut passar dins una aula durant les classes.\r\nÉsper això que sol·licitam la revisió del fals sostre per poder tenir clar que la instal·lació és\r\nsegura pel nostres alumnat i professorat.', 791, 11, 1, '2025-05-19', '0000-00-00', 2, NULL, NULL, NULL, ''),
(124, '89-2025', '', 224, NULL, 'Aigua calenta, filtracions, enrajolat cuina, coberta alumini', '0.00', 'N', 'Al present correu vos comunicam, conjuntament el CIFP POLITÈCNIC DE LLEVANT i l\'IES MANACOR, una sèrie de deficiències que requereixen de la vostra intervenció:\r\n\r\n- Aigua calenta al pavelló. \r\nL\'aigua calenta del pavelló és generada per una instal·lació sobredimensionada que amb el pas dels anys s\'han anat espanyant diversos elements de cost elevat que hem anat solucionant amb petites modificacions del sistema. Durant aquest curs els problemes han persistit i no hem pogut assegurar el correcte funcionament. Per aquest motiu necessitam traçar un pla d\'actuació per tal de poder garantir el correcte funcionament de la instal·lació. Nosaltres parlant amb gent del sector pensam que la solució passa per instal·lar un sistema d\'acumuladors elèctrics o d\'aerotermia que simplifiquin la instal·lació i els possibles problemes i a la vegada s\'aprofitin de la generació solar fotovoltaica de que disposa el centre, donat que amb l\'actual sistema s\'ha de comprar gas. Ens agradaria tenir una reunió insitu per tal de valorar les possibles solucions. \r\n\r\n- Evacuació aigua quan plou de forma intensa.\r\nDurant el darrer trimestre de l\'any 2024 es va fer una intervenció per millorar el drenatge i evaquació de l\'aigua. Fa uns dies va ploure, sense un extrema intensitat, i ja va tornar entrar cap a la zona del hall. Voldríem valorar possibles solucions ja que quan entra aigua ràpidament entra al foso de l\'ascensor i a l\'aula magna que esta enmoquetada (ha bufat i dona una mala imatge de l\'aula).  (AQUESTA INCIDÈNCIA ESTÀ COMUNICADA A L\'IBISEC I HAN DIT QUE FARAN UNA NOVA INTERVENCIÓ)\r\n\r\n- Enrajolat paret cantina.\r\nA la cantina hi ha un problema de filtracions d\'aigua des del terrat de sobre i que ha fet penetrar la humitat dins  el mur de pladur que esta enrajolat. Degut a aquesta humitat les rajoles es van desferrant i van caient. Es podria fer una intervenció tapant les goteres (no sabem exactament des d\'on es filtra l\'aigua) i d\'anar arreglant el que cau, però al ser de pladur fa necessari desmontar completament el mur i refer-lo de nou. Per aquest motiu també ens agradaria que ens faceu una visita per veure quina seria la millor opció. \r\n\r\n- Ferro i onduline oxidats:\r\nVos recordam que continuam sense poder fer el manteniment de les columnes i jàceres de ferro que hi ha als passadissos i a les escales del centre, donat l\'elevat cost inassumible per qualsevol dels dos centres. A més, anteriorment, ja es va fer constar que moltes peces d\'onduline de ferro galvanitzat que hi ha damunt les escales i a la porxada que duu fins a la cantina es troben oxidades i convendria canviar aquestes peces (una arquitecta de l\'IBISEC crec que ja va fer un informe fa uns anys).', 525, 1, 1, '2025-05-19', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(125, '90-2025', '', 79, NULL, 'Ombres', '0.00', 'N', 'Bon dia. Li remet aquest correu arrel de la reunió telemàtica  mantinguda avuí amb el servei d\'infraestrutures.\r\nEl mes passat vàrem instal·lar una pérgola per donar més ombra al pati de Primària del nostre centre. La veritat és que desconeixíem la normativa referent a l\'obligació de comunicar-lo prèviament al Servei d\'Infraestrutures educatives. L\'ajuntament està informada de la instal·lació però vàrem ser nosaltres els que ho vàrem gestionar amb una empresa, donat que l\'ajuntament no tenia diners per financiar-la.\r\nEs per això que volíem posar en coneixement d\'aquest fet al servei, arrel de les indicacions donades en la reunió d\'avui.\r\nEsperant ens comuniquin què hem de fer a partir d\'ara, li saluda atentament\r\nFco. Javier Rey', 317, 1, 1, '2025-05-19', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(126, '91-2025', '', 61, NULL, 'Trispol gimnàs', '0.00', 'N', 'Adjuntam 4 pressupostos de reforma del parquet del gimnàs del CEE Son Ferriol.\r\nTambé adjuntam l\'informe fet per la tècnica Helena Guinjoan Palau-Ribes del Servei d\'Infraestructures de centres , fet el 11 de febrer de 2025.\r\nCom vàrem acordar vos facilitam aquests pressupostos abans d\'inciar l\'expedient de despesa per a què ens confirmeu si les opcions a triar entren dins dels requisits de l\'informe , malgrat les diferències entre algun ells.', 165, 1, 1, '2025-05-19', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(127, '92-2025', '', 72, NULL, 'Consultes vàries', '0.00', 'N', 'Bon dia,\r\nArran de la sessió formativa d\'ahir ens han sorgit alguns dubtes que voldria comentar-vos per si els podem aclarir.\r\n\r\n1. Pla d\'autoprotecció. El nostre pla d\'autoprotecció està obsolet, i el passat mes d\'abril vam registrar una instància (adjunta) a la Conselleria (VALIB identificador 380913) i a l\'Ajuntament, demanant solucions. La directora del centre ha mantingut converses amb la delegada territorial i aquesta ha assegurat que n\'està al cas i que ho tenen present, però nosaltres no tenim cap constància de res. Després de la reunió d\'avui ens ha sorgit el dubte: qui s\'ha d\'encarregar de cercar el tècnic que ha de fer el pla? qui l\'ha de pagar? com podem saber si el nostre pla està en marxa?\r\n\r\n2. Tabics. Si fos el cas que volguéssim tirar un tabic per unir dues aules i fer un espai més gran, com hauríem de procedir? l\'edifici és municipal...\r\n\r\n3. Pèrgoles. El centre disposa d\'algunes pèrgoles per fer ombra als patis. Algunes són més noves que d\'altres. En el moment que es van fer no es va demanar a un tècnic que les supervisés. Ara hem de contactar amb qualque expert que acrediti que estan ben clavades al terra i que són segures? com hem de procedir?\r\n\r\n4. Estructura. Fa unes setmanes la brigada d\'obres de l\'Ajuntament va llevar una estructura (amb el cautxú) que estava en mal estat. Ens han dit que en posaran una de nova (l\'edifici és responsabilitat de l\'Ajuntament), i mentrestant han comentat que ens posrien arena a la zona (de moment no l\'han posada). En aquest cas, si ho fa tot l\'Ajuntament (comprar i instal·lar l\'estructura), hem de fer cap sol·licitud o informar a Conselleria?', 425, 1, 1, '2025-05-19', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(128, '93-2025', '', 224, NULL, 'Substitució del terra de tres aules i la instal·lació d\'aire condicionat', '0.00', 'N', 'Sóc Eduardo Arroyo, director del CEIP Son Pisà.\r\n\r\nAmb motiu de la visita realitzada pel Conseller d’Educació i Universitats, Sr. Antoni Vera Alemany, i la Directora General de Planificació i Gestió Educativa, Sra. Catalina Maria Ginart Serrano, per a la inauguració de l’Escoleta al nostre centre, se\'ns va demanar informació sobre les necessitats actuals del centre.\r\n\r\nEn aquella ocasió, vam exposar que tres aules d\'Educació Infantil presenten un estat molt deteriorat del paviment, amb un desgast considerable que en dificulta l’ús adequat. Tant el Conseller com la Directora General van poder constatar in situ la necessitat urgent de substituir el terra d’aquestes aules.\r\n\r\nD\'altra banda, també es va comentar la manca d\'un sistema de climatització a les tres noves aules de 2 anys. Durant els mesos de primavera i estiu, aquestes aules assoleixen temperatures elevades que poden afectar el benestar dels infants, i per tant és necessari instal·lar-hi aparells d\'aire condicionat per complir amb la normativa vigent sobre condicions ambientals en espais educatius.\r\n\r\nSeguint les indicacions del Conseller i la Directora General, hem gestionat com a centre tres pressupostos de diferents empreses per a cadascuna de les actuacions esmentades. Adjuntam, per tant, els pressupostos corresponents a la substitució del terra de les tres aules d’Infantil i a la instal·lació d\'aire condicionat a les tres aules de 2 anys.\r\n\r\nAmb aquest escrit, sol·licitam a la Direcció General d\'Infraestructures la concessió dels fons necessaris per poder dur a terme aquestes millores tan necessàries.\r\n\r\nRestam a la vostra disposició per ampliar qualsevol informació que considereu oportuna.', 452, 1, 1, '2025-05-19', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(129, '94-2025', '', 51, NULL, 'Goteres poliesportiu', '0.00', 'N', 'és per informar de les inundacions que vam tenir al poliesportiu després de les pluges del passat cap de setmana. Adjunt hi trobarà un informe amb fotografies. \r\n\r\nEl tècnic IBISEC de Menorca, sr. Jordi Picot, n\'està al corrent.', 796, 1, 1, '2025-05-19', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(130, '95-2025', '', 6, NULL, 'Eliminació barreres arquitectòniques', '0.00', 'N', 'en el nostre centre no tenim ascensor per pujar al primer pis i ens és molt necessari pel fet de tenir alumnes amb problemes de mobilitat als quals els serà impossible pujar escales per accedir a dalt.\r\nPer tant, vos demanam que ho valoreu i ho tingueu en compte. L\'eliminació de barreres arquitectòniques', 365, 1, 1, '2025-05-19', '2025-05-19', 2, NULL, 2, 1, ''),
(131, '96-2025', '', 49, NULL, 'Filtracions de la coberta', '0.00', 'N', 'Us comuniquem que amb les fortes puges d\'aquest passat diumenge hem trobat dues aules que han patit greus filtracions d\'aigua des del sostre.\r\nDemanem que algun tècnic vengui a fer una revisió i que garanteixi que no hi ha perill per l\'alumnat. Ara mateix el sostre està amerat i hem hagut de traslladar els alumnes d\'aula.', 325, 1, 1, '2025-05-19', '0000-00-00', NULL, 1, NULL, NULL, ''),
(132, '97-2025', '', 54, NULL, 'Reparació marquesina d\'accés per despreniments. A la espera de pressuposts.', '0.00', 'N', 'Se deben hacer las actuaciones siguientes:\r\n\r\n    Retirar con medios manuales (sin compresor) los fragmentos del recubrimiento de hormigón con riesgo de caída. Según conversación telefónica, esta operación ya se ha realizado como actuación preventiva.\r\n    Repicar con medios manuales (sin compresor) las zonas de la losa donde se aprecien grietas, para poder reparar el forjado. Debe revisarse todo el perímetro de la marquesina. En las fotografías se aprecian desprendimientos anteriores en algunas zonas de la marquesina.\r\n    Rascar el óxido de las armaduras con un cepillo de púas metálicas, aplicar pintura pasivante para evitar la oxidación. Aplicar un puente de unión y una capa de mortero de reparación con fibras.\r\n    Pintar la marquesina de nuevo.\r\n\r\n\r\nSi durante la ejecución de los trabajos se detectan afectaciones graves a las armaduras, podéis comunicarlo al Servicio de Infraestructuras Educativas para poder valorar la actuación.\r\n\r\nPara reparar la marquesina, desde el centro debéis pedir presupuestos para hacer las actuaciones indicadas y remitirlos al Servicio de Infraestructuras Educativas (infraestructureseducatives@ibeducacio.eu).\r\n\r\nLos presupuestos deben ser comparables (deben contener las mismas partidas y las mismas unidades). También deben incluir los medios auxiliares necesarios para realizar los trabajos (andamios, elevadores, etc), la gestión de residuos, que se deben llevar a un vertedero autorizado, y las medidas de seguridad y salud para garantizar la seguridad de los trabajadores durante la ejecución de los trabajos. Por último, en el presupuesto debe constar claramente el desglose del IVA y el importe total de las actuaciones (importe base+IVA).', 768, 3, 1, '2025-05-20', '0000-00-00', 2, NULL, NULL, 1, '');

--
-- Disparadors `actuacions`
--
DELIMITER $$
CREATE TRIGGER `before_insert_actuacions` BEFORE INSERT ON `actuacions` FOR EACH ROW BEGIN
  DECLARE any_actual INT;
  SET any_actual = YEAR(NEW.data_entrada);

  -- Assigna el codi si no s’ha proporcionat
  IF NEW.codi IS NULL THEN
    SET NEW.codi = generar_codi_actuacio(any_actual);
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de la taula `actuacions_seq`
--

CREATE TABLE `actuacions_seq` (
  `any` int(4) NOT NULL,
  `seguent_valor` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `actuacions_seq`
--

INSERT INTO `actuacions_seq` (`any`, `seguent_valor`) VALUES
(2024, 6),
(2025, 98);

-- --------------------------------------------------------

--
-- Estructura de la taula `actuacio_conveni`
--

CREATE TABLE `actuacio_conveni` (
  `id` int(11) NOT NULL,
  `centre_id` int(11) NOT NULL,
  `conveni_id` int(11) NOT NULL,
  `codi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcio` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pressupost_inicial` decimal(12,2) DEFAULT NULL,
  `pressupost_definitiu` decimal(12,2) DEFAULT NULL,
  `aprovacio_inicial` date DEFAULT NULL,
  `aprovacio_definitiva` date DEFAULT NULL,
  `previsio_inici` date DEFAULT NULL,
  `previsio_final` date DEFAULT NULL,
  `observacions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comissio_seguiment_data` date DEFAULT NULL,
  `comissio_seguiment_enllac` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `actuacio_conveni`
--

INSERT INTO `actuacio_conveni` (`id`, `centre_id`, `conveni_id`, `codi`, `descripcio`, `pressupost_inicial`, `pressupost_definitiu`, `aprovacio_inicial`, `aprovacio_definitiva`, `previsio_inici`, `previsio_final`, `observacions`, `comissio_seguiment_data`, `comissio_seguiment_enllac`) VALUES
(1, 175, 3, NULL, 'Prova 1', '100.00', '200.00', '2025-05-05', '1970-01-01', '1970-01-01', '1970-01-01', 'cap', '1970-01-01', ''),
(2, 175, 3, NULL, 'Prova 199', '250.08', '500.07', '2025-05-06', '2025-06-07', '2025-07-08', '2025-08-09', 'dos', '2025-09-10', 'hola');

-- --------------------------------------------------------

--
-- Estructura de la taula `assignar_espais`
--

CREATE TABLE `assignar_espais` (
  `num_unitats` int(11) NOT NULL,
  `num_alumnes_infantil` int(11) DEFAULT 0,
  `num_alumnes_primaria` int(11) DEFAULT 0,
  `num_alumnes_eso` int(11) DEFAULT 0,
  `num_alumnes_batx` int(11) DEFAULT 0,
  `num_alumnes_fp` int(11) DEFAULT 0,
  `preu_metre_construit` decimal(10,2) NOT NULL,
  `id_centre` int(11) NOT NULL,
  `id_espai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `assignar_espais`
--

INSERT INTO `assignar_espais` (`num_unitats`, `num_alumnes_infantil`, `num_alumnes_primaria`, `num_alumnes_eso`, `num_alumnes_batx`, `num_alumnes_fp`, `preu_metre_construit`, `id_centre`, `id_espai`) VALUES
(9, 5000, 1000, 3, 2, 1, '1000.00', 854, 36),
(34, 99, 0, 0, 0, 0, '1000.00', 854, 37);

-- --------------------------------------------------------

--
-- Estructura de la taula `centres`
--

CREATE TABLE `centres` (
  `id` int(11) NOT NULL,
  `Ubi_Codi` int(11) NOT NULL,
  `Titularitat` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sigla` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Codi` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Centre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Adreca` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CP` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Localitat` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Municipi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Illa` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Telefon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Alta` date DEFAULT NULL,
  `Baixa` date DEFAULT NULL,
  `Inspector_id` int(11) DEFAULT NULL,
  `id_illa` int(11) DEFAULT NULL,
  `id_municipi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `centres`
--

INSERT INTO `centres` (`id`, `Ubi_Codi`, `Titularitat`, `Sigla`, `Codi`, `Centre`, `Adreca`, `CP`, `Localitat`, `Municipi`, `Illa`, `Telefon`, `Fax`, `email`, `Alta`, `Baixa`, `Inspector_id`, `id_illa`, `id_municipi`) VALUES
(1, 605, 'privada', 'C', '07013656', 'C Àgora Portals (integrat música)', 'Ctra. Vella d\'Andratx s/n  ', '07184', 'Calvià', 'Calvià', 'Mallorca', '971676735', NULL, 'info@agoraportals.edu.es', NULL, NULL, 23, 1, 11),
(2, 858, 'privada', 'C', '07015689', 'C Arimunani', 'C/ de la Farigola 8-6-4 (camí de Son Sales)', '07141', 'Son Daviu Nou', 'Marratxí', 'Mallorca', '686602411', NULL, 'info@arimunani.com', '0000-00-00', NULL, 2, 1, 33),
(3, 122, 'privada', 'C', '07013085', 'C Coop. Son Verí Nou', 'Pl. de s\'Estany s/n  ', '07609', 'Son Verí Nou', 'Llucmajor', 'Mallorca', '971491646', '971442543', 'administracion@colegiosonverinou.com', NULL, NULL, 14, 1, 29),
(4, 614, 'privada', 'C', '07007735', 'C Francesc de Borja Moll', 'Av. dels Tamarells s/n  ', '07600', 'S\'Arenal', 'Palma', 'Mallorca', '971491252', '971743207', 'direccion@colegioborjamoll.net', NULL, NULL, 14, 1, 38),
(5, 519, 'privada', 'C', '07003638', 'C Luis Vives', 'C/ de Sant Joan de la Salle 5  ', '07003', 'Palma', 'Palma', 'Mallorca', '971290150', '971290011', 'informacion@colegioluisvives.es', NULL, NULL, 21, 1, 38),
(6, 525, 'privada', 'C', '07008776', 'C Mestral', 'C/ d\'Aubarca 14-18  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971194576', '971194374', 'secretaria@colegio-mestral.com', NULL, NULL, 10, 3, 63),
(7, 814, 'privada', 'C', '07015291', 'C Nau Escola', 'C/ de Josep Antoni de Cabanyes 8  ', '07011', 'Sa Vileta', 'Palma', 'Mallorca', '971253983', NULL, 'info@nauescola.com', NULL, NULL, 9, 1, 38),
(8, 860, 'privada', 'C', '07015690', 'C Sa Llavor', 'Pl. del Metge Borràs 3  ', '07350', 'Binissalem', 'Binissalem', 'Mallorca', '871049194', NULL, 'benvinguts@sallavor.es', '0000-00-00', NULL, 35, 1, 8),
(9, 554, 'privada', 'C', '07002828', 'C San Cayetano', 'Av. de Picasso 21  ', '07014', 'Palma', 'Palma', 'Mallorca', '971220575', '971220565', 'csc@colegiosancayetano.com', NULL, NULL, 9, 1, 38),
(10, 949, 'privada', 'C', '07016803', 'C Saudade', 'C/ Martí Rubí secretari, 114', '07141', 'Sa Cabaneta', 'Marratxí', 'Mallorca', '971289588', NULL, 'correo@centrocrea-t.es', '0000-00-00', NULL, 2, 1, 33),
(11, 30, 'pública', 'CA', '07500211', 'CA Camp d\'Aprenentatge d\'Orient', 'C/ de la Creu 3  ', '07349', 'Orient', 'Bunyola', 'Mallorca', '971688257', '971429380', 'caorient@educaib.eu', NULL, NULL, 17, 1, 10),
(12, 776, 'pública', 'CA', '07500361', 'CA Camp d\'Aprenentatge de Binifaldó', 'Refugi de les Cases de Binifaldó', '07315', 'Escorca', 'Escorca', 'Mallorca', '971427212', NULL, 'cabinifaldo@educaib.eu', NULL, NULL, 17, 1, 18),
(13, 617, 'pública', 'CA', '07500181', 'CA Camp d\'Aprenentatge de Far de Cavalleria', 'Far de Cavalleria', '07740', 'Es Mercadal', 'Es Mercadal', 'Menorca', '669186477', NULL, 'cafardecavalleria@educaib.eu', NULL, NULL, 16, 2, 35),
(14, 25, 'pública', 'CA', '07500178', 'CA Camp d\'Aprenentatge de Formentera', 'Av. de Porto Saler 87  ', '07860', 'Sant Francesc de Formentera', 'Formentera', 'Formentera', '971323050', '971322859', 'caformentera@educaib.eu', NULL, NULL, 36, 4, 23),
(15, 28, 'pública', 'CA', '07500130', 'CA Camp d\'Aprenentatge de Son Ferriol', 'Av. del Cid 581  ', '07198', 'Son Ferriol', 'Palma', 'Mallorca', '971427144', '971727144', 'casonferriol@educaib.eu', NULL, NULL, 17, 1, 38),
(16, 29, 'pública', 'CA', '07500142', 'CA Camp d\'Aprenentatge des Palmer', 'Ctra. de la Colònia de Sant Jordi PK 5,2  ', '07630', 'Campos', 'Campos', 'Mallorca', '609886641', '971429380', 'caespalmer@educaib.eu', NULL, NULL, 17, 1, 13),
(17, 26, 'pública', 'CA', '07500120', 'CA Camp d\'Aprenentatge Es Pinaret', 'Ctra. de Santadrià PK 1,7  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971481702', '971481702', 'caespinaret@educaib.eu', NULL, NULL, 16, 2, 62),
(18, 27, 'pública', 'CA', '07500166', 'CA Camp d\'Aprenentatge Sa Cala', 'C/ de Sant Vicent de sa Cala 8  ', '07810', 'Sant Joan de Labritja', 'Sant Joan de Labritja', 'Eivissa', '971320094', '971320094', 'casacala@educaib.eu', NULL, NULL, 36, 3, 46),
(19, 786, 'pública', 'CA', '07500191', 'CA Centre d\'Aprenentatge Científicomatemàtic', 'C/ de Salvà 14  ', '07013', 'Palma', 'Palma', 'Mallorca', '971739290', NULL, 'cacenmat@educaib.eu', NULL, NULL, 20, 1, 38),
(20, 787, 'privada', 'CAEED', '07015112', 'CAEED Francisca Tomàs', 'C/ d\'Antoni Marquès 26  ', '07003', 'Palma', 'Palma', 'Mallorca', '971751022', NULL, 'escoladansafranciscatomas@gmail.com', NULL, NULL, 31, 1, 38),
(21, 378, 'privada', 'CAEED', '07008144', 'CAEED Sant Jaume', 'C/ de Pau Piferrer 15  ', '07011', 'Palma', 'Palma', 'Mallorca', '971450865', NULL, 'dansasantjaume@gmail.com', NULL, NULL, 31, 1, 38),
(22, 784, 'privada', 'CAEEM', '07014715', 'CAEEM Centro Internacional de Educación (CIDE)', 'C/ de l\'Arner 3  ', '07013', 'Sa Vileta', 'Palma', 'Mallorca', '682157751', NULL, 'escolademusicacide@gmail.com', NULL, NULL, 24, 1, 38),
(23, 907, 'privada', 'CAEEM', '07016232', 'CAEEM Escola de Música del Sagrat Cor', 'C/ del Pare Antoni Oliver 4  ', '07014', 'Palma', 'Palma', 'Mallorca', '971734645', '971287976', 'dirtitular@sagratcor.fecib.net', '0000-00-00', NULL, 1, 1, 38),
(24, 383, 'privada', 'CAEEM', '07008132', 'CAEEM Escola de Música Santa Mónica', 'C/ de Martínez Vargas 13  ', '07005', 'Palma', 'Palma', 'Mallorca', '971274800', '971275020', 'secretaria@colegiosantamonica.eu', NULL, NULL, 31, 1, 38),
(25, 788, 'privada', 'CAEEM', '07015100', 'CAEEM Obrador de Músics, Marratxí', 'C/ de sa Cabana 1-3  ', '07141', 'Es Pont d\'Inca', 'Marratxí', 'Mallorca', '606328755', NULL, 'obradordemusics@gmail.com', NULL, NULL, 31, 1, 33),
(26, 382, 'privada', 'CAEEM', '07008703', 'CAEEM Sant Josep Obrer', 'C/ dels Reis Catòlics 89  ', '07008', 'Palma', 'Palma', 'Mallorca', '971274825', '971275150', 'musica@santjosepobrer.com', NULL, NULL, 25, 1, 38),
(27, 801, 'privada', 'CAEPAPDI', '07015197', 'CAEPAPDI CEF, Escuela de Artes Audiovisuales', 'Pl. de Barcelona 17  ', '07011', 'Palma', 'Palma', 'Mallorca', '971718063', '971712404', 'info@cefmallorca.com', NULL, NULL, 31, 1, 38),
(28, 906, 'pública', 'CAHD', '07015951', 'CAHD Maria Antònia Pascual', 'Ctra. de Valldemossa 79, nivell 1, mòdul B, passadís Q (HU Son Espases)', '07010', 'Palma', 'Palma', 'Mallorca', NULL, NULL, 'lmplanasbauza@educaib.eu', '0000-00-00', NULL, 28, 1, 38),
(29, 3, 'privada', 'CC', '07013528', 'CC Aixa-Llaüt', 'C/ de Gregor Mendel s/n (Parc Bit)', '07121', 'Palma', 'Palma', 'Mallorca', '971439954', '971439950', 'secretaria@aixa-net.org', NULL, NULL, 24, 1, 38),
(30, 13, 'privada', 'CC', '07003501', 'CC Arcàngel Sant Rafel', 'C/ de Pablo Iglesias 4  ', '07004', 'Palma', 'Palma', 'Mallorca', '971756514', '971295354', 'centre@arcangelsantrafel.com', NULL, NULL, 21, 1, 38),
(31, 18, 'privada', 'CC', '07006767', 'CC Aula Balear', 'C/ de Can Valero 19  ', '07011', 'Sa Vileta', 'Palma', 'Mallorca', '971202301', '971206915', 'aulabalear@telefonica.net', NULL, NULL, 9, 1, 38),
(32, 21, 'privada', 'CC', '07003456', 'CC Balmes', 'C/ de Pere II 42  ', '07007', 'Palma', 'Palma', 'Mallorca', '971242700', '971248253', 'col.legibalmes@telefonica.net', NULL, NULL, 27, 1, 38),
(33, 577, 'privada', 'CC', '07001541', 'CC Beata Francinaina Cirer', 'C/ de Santiago Russiñol 217  ', '07300', 'Inca', 'Inca', 'Mallorca', '971500953', '971504287', 'svpinca@planalfa.es', NULL, NULL, 6, 1, 25),
(34, 22, 'privada', 'CC', '07001526', 'CC Beato Ramón Llull', 'C/ del Vent 10  ', '07300', 'Inca', 'Inca', 'Mallorca', '971500100', NULL, 'secretaria@beatramonllull.org', NULL, NULL, 6, 1, 25),
(35, 24, 'privada', 'CC', '07005416', 'CC Bisbe Verger', 'C/ des Celler 44  ', '07650', 'Santanyí', 'Santanyí', 'Mallorca', '971163085', '971653450', 'info@bisbeverger.es', NULL, NULL, 17, 1, 54),
(36, 31, 'privada', 'CC', '07004679', 'CC Can Bonet', 'C/ dels Llimoners s/n  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '971342143', '971803157', 'canbonet2@yahoo.es', NULL, NULL, 11, 3, 44),
(37, 93, 'privada', 'CC', '07004230', 'CC Centro Internacional de Educación (CIDE)', 'Camí de l\'Arner 3  ', '07013', 'Sa Vileta', 'Palma', 'Mallorca', '871900143', '971606449', 'cide@cide.es', NULL, NULL, 24, 1, 38),
(38, 124, 'privada', 'CC', '07001927', 'CC Cor de Maria', 'C/ de San Fernando 42  ', '07702', 'Maó', 'Maó', 'Menorca', '971364965', '971351743', 'cordemaria@planalfa.es', NULL, NULL, 16, 2, 34),
(39, 125, 'privada', 'CC', '07003171', 'CC Corpus Christi', 'Camí de Son Gotleu 69  ', '07008', 'Palma', 'Palma', 'Mallorca', '971242100', '971274629', 'corpus@santjosepobrer.es', NULL, NULL, 25, 1, 38),
(40, 355, 'privada', 'CC', '07003092', 'CC El Temple', 'C/ de Montevideo 4  ', '07006', 'Palma', 'Palma', 'Mallorca', '971466964', '971777342', 'secretaria.eltemple.palma@centrosfest.net', NULL, NULL, 27, 1, 38),
(41, 374, 'privada', 'CC', '07006664', 'CC Es Liceu', 'C/ de sa Cabana 31  ', '07141', 'Es Pont d\'Inca', 'Marratxí', 'Mallorca', '971600986', '971794809', 'escola@esliceu.com', NULL, NULL, 22, 1, 33),
(42, 424, 'privada', 'CC', '07000959', 'CC Escolania de Lluc (integrat música)', 'Pl. dels Pelegrins s/n  ', '07315', 'Lluc', 'Escorca', 'Mallorca', '971871535', '971517096', 'direccio@escolanialluc.net', NULL, NULL, 5, 1, 18),
(43, 536, 'privada', 'CC', '07003614', 'CC Escolàpies Palma', 'C/ de Joan Crespí 30  ', '07014', 'Palma', 'Palma', 'Mallorca', '971730314', '971450333', 'secretaria@escolapiespalma.org', NULL, NULL, 1, 1, 38),
(44, 427, 'privada', 'CC', '07000650', 'CC Fray Juan Ballester', 'C/ del Pare Alzina s/n  ', '07630', 'Campos', 'Campos', 'Mallorca', '971650821', '971650426', 'info@frajoanballester.com', NULL, NULL, 29, 1, 13),
(45, 503, 'privada', 'CC', '07003471', 'CC Jesús María', 'C/ de Guillem Galmés 38  ', '07004', 'Palma', 'Palma', 'Mallorca', '971751859', '971290039', 'info@ccjesusmaria.com', NULL, NULL, 21, 1, 38),
(46, 505, 'privada', 'CC', '07003699', 'CC Juan de la Cierva', 'C/ del Tenor Bou Roig 13  ', '07008', 'Palma', 'Palma', 'Mallorca', '971477293', '971470511', 'info@colegiojuandelacierva.com', NULL, NULL, 34, 1, 38),
(47, 507, 'privada', 'CC', '07000391', 'CC L\'Assumpció', 'C/ de Sant Vicenç de Paül 9  ', '07350', 'Binissalem', 'Binissalem', 'Mallorca', '971870377', '971886162', 'assumpcio@assumpcio.fecib.net', NULL, NULL, 5, 1, 8),
(48, 508, 'privada', 'CC', '07003730', 'CC La Immaculada', 'C/ de Robert Graves 38  ', '07015', 'Palma', 'Palma', 'Mallorca', '971731229', '971735245', 'secretaria@immaculadapm.com', NULL, NULL, 24, 1, 38),
(49, 509, 'privada', 'CC', '07003468', 'CC La Miraculosa', 'C/ de Semolera 16  ', '07008', 'Palma', 'Palma', 'Mallorca', '971421063', '971241986', 'lamilagrosapm@planalfa.es', NULL, NULL, 27, 1, 38),
(50, 510, 'privada', 'CC', '07004084', 'CC La Porciúncula', 'Av. del Fra Joan Llabrés 1  ', '07600', 'S\'Arenal', 'Palma', 'Mallorca', '971269912', '971265054', 'direccio@porciuncula.org', NULL, NULL, 29, 1, 38),
(51, 34, 'privada', 'CC', '07004308', 'CC La Purísima', 'C/ de Sevilla 19  ', '07013', 'Palma', 'Palma', 'Mallorca', '971733868', '971456858', 'administracion@la-purisima.org', NULL, NULL, 28, 1, 38),
(52, 511, 'privada', 'CC', '07000081', 'CC La Salle', 'Av. de la Verge del Toro 86  ', '07730', 'Alaior', 'Alaior', 'Menorca', '971372253', '971378120', 'alaior@lasallevp.es', NULL, NULL, 18, 2, 69),
(53, 512, 'privada', 'CC', '07001472', 'CC La Salle', 'C/ de ses Coves 61  ', '07300', 'Inca', 'Inca', 'Mallorca', '971500365', '971880660', 'inca@lasallevp.es', NULL, NULL, 6, 1, 25),
(54, 516, 'privada', 'CC', '07001915', 'CC La Salle', 'C/ de Vassallo 125  ', '07703', 'Maó', 'Maó', 'Menorca', '971356114', '971356319', 'mao@lasallevp.es', NULL, NULL, 16, 2, 34),
(55, 515, 'privada', 'CC', '07002181', 'CC La Salle', 'C/ de San Juan Bautista de la Salle 2  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971550278', '971843362', 'manacor@lasallevp.es', NULL, NULL, 19, 1, 30),
(56, 513, 'privada', 'CC', '07002440', 'CC La Salle', 'C/ de la Salle 15  ', '07141', 'Es Pont d\'Inca', 'Marratxí', 'Mallorca', '971600249', '971607771', 'pontdinca@lasallevp.es', NULL, NULL, 22, 1, 33),
(57, 514, 'privada', 'CC', '07004333', 'CC La Salle', 'Camí de Son Rapinya 29  ', '07013', 'Sa Vileta', 'Palma', 'Mallorca', '971606397', '971606381', 'palma@lasallevp.es', NULL, NULL, 20, 1, 38),
(58, 517, 'privada', 'CC', '07002622', 'CC Lladó', 'C/ de Castillejos 45  ', '07007', 'Es Coll d\'en Rabassa', 'Palma', 'Mallorca', '971268065', '971743746', 'info@colegiollado.com', NULL, NULL, 30, 1, 38),
(59, 520, 'privada', 'CC', '07004278', 'CC Madre Alberta', 'Camí dels Reis 102  ', '07013', 'Sa Vileta', 'Palma', 'Mallorca', '971792085', '971606654', 'direccion@madrealberta.com', NULL, NULL, 9, 1, 38),
(60, 521, 'privada', 'CC', '07003602', 'CC Manjón', 'C/ de l\'Alferes Llobera Estrades 18  ', '07010', 'Palma', 'Palma', 'Mallorca', '971294711', '871961641', 'direccio@escolamanjon.com', NULL, NULL, 21, 1, 38),
(61, 522, 'privada', 'CC', '07006871', 'CC Mare de Déu de les Neus', 'C/ de les Monges 5  ', '07817', 'Sant Jordi de ses Salines', 'Sant Josep de sa Talaia', 'Eivissa', '971395045', '971395071', 'direccio@marededeudelesneus.com', NULL, NULL, 4, 3, 47),
(62, 523, 'privada', 'CC', '07006482', 'CC Mata de Jonc', 'C/ de Son Espanyolet 49  ', '07014', 'Palma', 'Palma', 'Mallorca', '971736677', '971283952', 'secretaria@matadejonc.cat', NULL, NULL, 9, 1, 38),
(63, 526, 'privada', 'CC', '07004448', 'CC Monti-sion', 'C/ de Monti-sion 35  ', '07460', 'Pollença', 'Pollença', 'Mallorca', '971530305', '971535050', 'secretaria@montision.org', NULL, NULL, 5, 1, 40),
(64, 528, 'privada', 'CC', '07001721', 'CC Nostra Senyora de Gràcia', 'C/ de Paraires 3  ', '07620', 'Llucmajor', 'Llucmajor', 'Mallorca', '971661309', '971662843', 'nsgracia@nostrasenyoradegracia.com', NULL, NULL, 30, 1, 29),
(65, 529, 'privada', 'CC', '07000807', 'CC Nostra Senyora de la Consolació', 'C/ de la Mare Molas 2  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971484140', '971484096', 'titular@consolacio.es', NULL, NULL, 18, 2, 62),
(66, 530, 'privada', 'CC', '07000030', 'CC Nuestra Señora de la Consolación', 'C/ de Sant Roc 4  ', '07340', 'Alaró', 'Alaró', 'Mallorca', '971510355', '971518507', 'director@consolacioalaro.com', NULL, NULL, 32, 1, 1),
(67, 532, 'privada', 'CC', '07000111', 'CC Nuestra Señora de la Consolación', 'C/ de Cabrera 5  ', '07400', 'Alcúdia', 'Alcúdia', 'Mallorca', '971545843', '971547322', 'secretaria@nsc-alcudia.com', NULL, NULL, 3, 1, 2),
(68, 531, 'privada', 'CC', '07001319', 'CC Nuestra Señora de la Consolación', 'C/ de Joan Xico 8  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971301418', '971391337', 'secretaria@consolacion-eivissa.com', NULL, NULL, 36, 3, 63),
(69, 533, 'privada', 'CC', '07003687', 'CC Nuestra Señora de la Consolación', 'C/ de Bach 4  ', '07008', 'Palma', 'Palma', 'Mallorca', '971474526', '971706552', 'administracion@consolacionvivero.com', NULL, NULL, 7, 1, 38),
(70, 534, 'privada', 'CC', '07007221', 'CC Nuestra Señora de la Consolación', 'Pl. de la Parròquia 2  ', '07009', 'Sa Indioteria', 'Palma', 'Mallorca', '971294762', '971430685', 'direccion@consolacionindioteria.com', NULL, NULL, 2, 1, 38),
(71, 535, 'privada', 'CC', '07003572', 'CC Nuestra Señora de la Esperanza', 'Av. de l\'Arquitecte Gaspar Bennàzar 14  ', '07004', 'Palma', 'Palma', 'Mallorca', '971751558', '971751558', 'secretaria@colegiolaesperanza.es', NULL, NULL, 34, 1, 38),
(72, 537, 'privada', 'CC', '07003857', 'CC Nuestra Señora de Montesión', 'C/ de Monti-Sion 24  ', '07001', 'Palma', 'Palma', 'Mallorca', '971711300', '971723830', 'secretariapalma@colegiomontesion.es', NULL, NULL, 23, 1, 38),
(73, 538, 'privada', 'CC', '07004254', 'CC Nuestra Señora de Montesión', 'Camí de Son Rapinya 14  ', '07013', 'Sa Vileta', 'Palma', 'Mallorca', '971792250', '971798644', 'secretariasonmoix@colegiomontesion.es', NULL, NULL, 23, 1, 38),
(74, 539, 'privada', 'CC', '07003341', 'CC Pedro Poveda', 'C/ del Lledoner 6  ', '07008', 'Palma', 'Palma', 'Mallorca', '971474096', '971472278', 'cpedropovedapalma@gmail.com', NULL, NULL, 2, 1, 38),
(75, 540, 'privada', 'CC', '07003511', 'CC Pius XII', 'Av. de l\'Arquitecte Gaspar Bennàzar 33  ', '07004', 'Palma', 'Palma', 'Mallorca', '971751572', '971200340', 'drodriguez_piusxii@yahoo.es', NULL, NULL, 32, 1, 38),
(76, 541, 'privada', 'CC', '07001460', 'CC Pureza de María', 'C/ del Llevant 92  ', '07300', 'Inca', 'Inca', 'Mallorca', '971881875', '971880161', 'secretaria@pmaria-inca.org', NULL, NULL, 6, 1, 25),
(77, 542, 'privada', 'CC', '07002117', 'CC Pureza de María', 'C/ de Sant Jeroni 7  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971550525', '971555069', 'direccion@pmaria-manacor.org', NULL, NULL, 19, 1, 30),
(78, 544, 'privada', 'CC', '07000212', 'CC Ramon Llull', 'V. de Joan Riera 15  ', '07150', 'Andratx', 'Andratx', 'Mallorca', '971136193', '971136901', 'secretaria@ramon-llull.com', NULL, NULL, 12, 1, 4),
(79, 545, 'privada', 'CC', '07005301', 'CC Ramon Llull', 'C/ del Sol 5  ', '07320', 'Santa Maria del Camí', 'Santa Maria del Camí', 'Mallorca', '971140620', '971140469', 'rllullsm@planalfa.es', NULL, NULL, 2, 1, 53),
(80, 546, 'privada', 'CC', '07001344', 'CC Sa Real', 'Av. d\'Ignasi Wallis s/n  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971315424', '971316767', 'sreale@planalfa.es', NULL, NULL, 11, 3, 63),
(81, 547, 'privada', 'CC', '07003675', 'CC Sagrat Cor', 'C/ del Pare Antoni Oliver 4  ', '07014', 'Palma', 'Palma', 'Mallorca', '971734645', '971287976', 'dirtitular@sagratcor.fecib.net', NULL, NULL, 1, 1, 38),
(82, 548, 'privada', 'CC', '07005623', 'CC Sagrats Cors', 'C/ d\'Isabel II 114  ', '07100', 'Sóller', 'Sóller', 'Mallorca', '971630497', '971634646', 'sagratscors@sagratscors.net', NULL, NULL, 20, 1, 58),
(83, 549, 'privada', 'CC', '07003328', 'CC San Agustín', 'C/ de Mateu Enric Lladó 30  ', '07002', 'Palma', 'Palma', 'Mallorca', '971723465', '971726455', 'director@sanagustinpalma.es', NULL, NULL, 27, 1, 38),
(84, 550, 'privada', 'CC', '07003651', 'CC San Alfonso María de Ligorio', 'C/ del Vi 12  ', '07012', 'Palma', 'Palma', 'Mallorca', '971724413', '971717358', 'administracion@colegiosanalfonso.com', NULL, NULL, 28, 1, 38),
(85, 552, 'privada', 'CC', '07000297', 'CC San Buenaventura', 'C/ de Sant Antoni 1  ', '07570', 'Artà', 'Artà', 'Mallorca', '971836986', '971836986', 'direccio@santbonaventura.org', NULL, NULL, 33, 1, 6),
(86, 553, 'privada', 'CC', '07001711', 'CC San Buenaventura', 'C/ del Convent 25  ', '07620', 'Llucmajor', 'Llucmajor', 'Mallorca', '971660453', '971669004', 'secretaria@santbonaventura.net', NULL, NULL, 30, 1, 29),
(87, 555, 'privada', 'CC', '07003331', 'CC San Felipe Neri', 'C/ de Vilanova 3  ', '07002', 'Palma', 'Palma', 'Mallorca', '971714739', '971425001', 'santfelipneri@gorgblau.coop', NULL, NULL, 1, 1, 38),
(88, 560, 'privada', 'CC', '07003559', 'CC San José de la Montaña', 'C/ de Cotlliure 22  ', '07010', 'Palma', 'Palma', 'Mallorca', '971750629', '971753026', 'sanjosem@planalfa.es', NULL, NULL, 21, 1, 38),
(89, 562, 'privada', 'CC', '07001058', 'CC Sant Alfons', 'C/ de Zavellà 1  ', '07200', 'Felanitx', 'Felanitx', 'Mallorca', '971581211', '971582561', 'lledoner@lledoner.com', NULL, NULL, 27, 1, 21),
(90, 551, 'privada', 'CC', '07002701', 'CC Sant Antoni Abat', 'C/ de Sant Joan de la Creu 58  ', '07198', 'Son Ferriol', 'Palma', 'Mallorca', '971426001', '971429082', 'info@csantantoniabat.com', NULL, NULL, 29, 1, 38),
(91, 556, 'privada', 'CC', '07003298', 'CC Sant Francesc', 'C/ de Ramon Llull 1  ', '07001', 'Palma', 'Palma', 'Mallorca', '971716111', '971711886', 'secretaria@santfrancesc.net', NULL, NULL, 12, 1, 38),
(92, 563, 'privada', 'CC', '07001150', 'CC Sant Francesc d\'Assís', 'C/ del Pare Huguet 11  ', '07750', 'Ferreries', 'Ferreries', 'Menorca', '971373190', '971373850', 'sfassisf@sfassisf.com', NULL, NULL, 18, 2, 22),
(93, 557, 'privada', 'CC', '07002130', 'CC Sant Francesc d\'Assís', 'C/ Major 28  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971844280', '971843108', 'manacor@sfassis.org', NULL, NULL, 19, 1, 30),
(94, 564, 'privada', 'CC', '07002579', 'CC Sant Francesc d\'Assís', 'C/ de Joan Miró 1  ', '07440', 'Muro', 'Muro', 'Mallorca', '971537513', '971860618', 'muro@sfassis.org', NULL, NULL, 35, 1, 37),
(95, 559, 'privada', 'CC', '07003444', 'CC Sant Francesc d\'Assís', 'Ptge. de Can Feixina 1  ', '07005', 'Palma', 'Palma', 'Mallorca', '971469415', '971774145', 'palma@sfassis.org', NULL, NULL, 34, 1, 38),
(96, 558, 'privada', 'CC', '07004588', 'CC Sant Francesc d\'Assís', 'C/ de la Lluna 11  ', '07420', 'Sa Pobla', 'Sa Pobla', 'Mallorca', '971862703', '971540228', 'sapobla@sfassis.org', NULL, NULL, 21, 1, 68),
(97, 565, 'privada', 'CC', '07000731', 'CC Sant Francesc de Sales', 'Av. de la Constitució 57  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971380100', '971380104', 'diresc.ciutadella@salesians.cat', NULL, NULL, 8, 2, 62),
(98, 566, 'privada', 'CC', '07001939', 'CC Sant Josep', 'C/ de Cos de Gràcia 98  ', '07702', 'Maó', 'Maó', 'Menorca', '971355804', '971355573', 'sjosemahon@planalfa.es', NULL, NULL, 8, 2, 34),
(99, 567, 'privada', 'CC', '07006500', 'CC Sant Josep Obrer I', 'C/ de Sebastià Arrom 3  ', '07008', 'Palma', 'Palma', 'Mallorca', '971473308', '971472706', 'sjo@santjosepobrer.es', NULL, NULL, 25, 1, 38),
(100, 568, 'privada', 'CC', '07003067', 'CC Sant Josep Obrer II (integrat música)', 'C/ dels Reis Catòlics 89  ', '07008', 'Palma', 'Palma', 'Mallorca', '971274825', '971275150', 'primaria@santjosepobrer.es', NULL, NULL, 25, 1, 38),
(101, 569, 'privada', 'CC', '07003717', 'CC Sant Pere', 'C/ de Baltasar Valentí 76  ', '07008', 'Palma', 'Palma', 'Mallorca', '971475050', '971473280', 'secretaria@colegisantpere.com', NULL, NULL, 2, 1, 38),
(102, 561, 'privada', 'CC', '07000315', 'CC Sant Salvador', 'C/ de la Caritat 11  ', '07570', 'Artà', 'Artà', 'Mallorca', '971836269', '971829538', 'direccio@santsalvador.net', NULL, NULL, 33, 1, 6),
(103, 575, 'privada', 'CC', '07001447', 'CC Sant Vicenç de Paül', 'C/ de Sant Vicenç de Paül 2  ', '07300', 'Inca', 'Inca', 'Mallorca', '971500890', '971880892', 'svpaulinca@planalfa.es', NULL, NULL, 6, 1, 25),
(104, 573, 'privada', 'CC', '07001666', 'CC Sant Vicenç de Paül', 'C/ de Catany 5  ', '07600', 'S\'Arenal', 'Llucmajor', 'Mallorca', '971440104', '971440834', 'svpaula@planalfa.es', NULL, NULL, 27, 1, 29),
(105, 571, 'privada', 'CC', '07002105', 'CC Sant Vicenç de Paül', 'C/ de n\'Olesa 7  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971556120', '971844802', 'svicentepm@planalfa.es', NULL, NULL, 19, 1, 30),
(106, 570, 'privada', 'CC', '07002646', 'CC Sant Vicenç de Paül', 'C/ del Marquès 10  ', '07007', 'Es Coll d\'en Rabassa', 'Palma', 'Mallorca', '971262695', '971266657', 'secretaria@svpcoll.fecib.net', NULL, NULL, 27, 1, 38),
(107, 578, 'privada', 'CC', '07003390', 'CC Sant Vicenç de Paül', 'C/ de Siquier 4  ', '07007', 'Palma', 'Palma', 'Mallorca', '971241436', '971279491', 'direccio@svpaul-lasoledat.com', NULL, NULL, 29, 1, 38),
(108, 576, 'privada', 'CC', '07003596', 'CC Sant Vicenç de Paül', 'C/ de Sant Vicenç de Paül 13  ', '07010', 'Cas Capiscol', 'Palma', 'Mallorca', '971750624', '971201254', 'svpaulpalma@planalfa.es', NULL, NULL, 32, 1, 38),
(109, 574, 'privada', 'CC', '07004266', 'CC Sant Vicenç de Paül', 'C/ del Poll 3  ', '07011', 'Sa Vileta', 'Palma', 'Mallorca', '971791240', '971799836', 'secretaria@svpsavileta.fecib.net', NULL, NULL, 23, 1, 38),
(110, 572, 'privada', 'CC', '07005611', 'CC Sant Vicenç de Paül', 'C/ de Cristòfol Pizà 27  ', '07100', 'Sóller', 'Sóller', 'Mallorca', '971631089', '971632271', 'svpsoller@svpsoller.fecib.net', NULL, NULL, 20, 1, 58),
(111, 579, 'privada', 'CC', '07003021', 'CC Santa Magdalena Sofia', 'C/ de Francesc Martí Mora 42  ', '07011', 'Palma', 'Palma', 'Mallorca', '971738297', '971288015', 'escola@smsofia.net', NULL, NULL, 24, 1, 38),
(112, 580, 'privada', 'CC', '07002920', 'CC Santa Maria', 'C/ de l\'Almirall Cervera 2  ', '07014', 'Palma', 'Palma', 'Mallorca', '971739539', '971456826', 'secretaria@colsantamaria.org', NULL, NULL, 1, 1, 38),
(113, 581, 'privada', 'CC', '07003262', 'CC Santa Mónica', 'C/ de Martínez Vargas 13  ', '07005', 'Palma', 'Palma', 'Mallorca', '971274800', '971275020', 'secretaria@colegiosantamonica.eu', NULL, NULL, 7, 1, 38),
(114, 582, 'privada', 'CC', '07002427', 'CC Santa Teresa', 'C/ de Santa Teresa 1  ', '07141', 'Es Pont d\'Inca', 'Marratxí', 'Mallorca', '971600177', '971607031', 'colsantateresa1903@gmail.com', NULL, NULL, 22, 1, 33),
(115, 583, 'privada', 'CC', '07003377', 'CC Santísima Trinidad', 'C/ de la Concepció 24  ', '07012', 'Palma', 'Palma', 'Mallorca', '971716651', '971726411', 'secretaria.strinitat.palma@centrosfest.net', NULL, NULL, 9, 1, 38),
(116, 584, 'privada', 'CC', '07004643', 'CC Santísima Trinidad', 'C/ de Balansat 7  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '971340860', '971345480', 'secretaria.santantoni@centrosfest.net', NULL, NULL, 10, 3, 44),
(117, 585, 'privada', 'CC', '07001459', 'CC Santo Tomás de Aquino - Liceo Santa Teresa', 'C/ de ses Coves 110  ', '07300', 'Inca', 'Inca', 'Mallorca', '971500361', '971570655', 'santotomas@incaeducacion.com', NULL, NULL, 6, 1, 25),
(118, 799, 'privada', 'CC', '07015151', 'CC Totheducatiu', 'C/ del Plataner 4  ', '07008', 'Palma', 'Palma', 'Mallorca', '971479407', '971478352', 'secretaria@totheducatiu.com', NULL, NULL, 2, 1, 38),
(119, 588, 'privada', 'CC', '07004539', 'CC Verge de Monti-Sion', 'C/ de la Caritat 13  ', '07260', 'Porreres', 'Porreres', 'Mallorca', '971647296', '971647296', 'info@vergedemontision.com', NULL, NULL, 14, 1, 41),
(120, 589, 'privada', 'CC', '07002816', 'CC Virgen del Carmen', 'C/ de Murillo 48  ', '07013', 'Palma', 'Palma', 'Mallorca', '971730630', '971730725', 'contacto@vcarmenpalma.com', NULL, NULL, 9, 1, 38),
(121, 504, 'privada', 'CCEE', '07005891', 'CCEE Joan Mesquida', 'C/ des Canyar s/n  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971552625', '971844849', 'joanmesquida@aproscom.org', NULL, NULL, 19, 1, 30),
(122, 33, 'privada', 'CCEE', '07008326', 'CCEE Joan XXIII', 'C/ de Menorca 55  ', '07300', 'Inca', 'Inca', 'Mallorca', '971881038', '971880561', 'joan23@patronatjoan23.org', NULL, NULL, 32, 1, 25),
(123, 669, 'privada', 'CCEE', '07004308', 'CCEE La Purísima', 'C/ de Sevilla 19  ', '07013', 'Palma', 'Palma', 'Mallorca', '971733868', '971456858', 'administracion@la-purisima.org', NULL, NULL, 28, 1, 38),
(124, 35, 'privada', 'CCEE', '07003973', 'CCEE Mater Misericordiae', 'C/ de Francesc Julià 54  ', '07008', 'Palma', 'Palma', 'Mallorca', '971274959', '971240473', 'mater@orgmater.org', NULL, NULL, 25, 1, 38),
(125, 36, 'privada', 'CCEE', '07006779', 'CCEE Pinyol Vermell', 'Ctra. Vella de Bunyola PK 8,2  ', '07141', 'Son Daviu Nou', 'Marratxí', 'Mallorca', '971796282', '971796241', 'aspacebaleares@aspaceib.org', NULL, NULL, 2, 1, 33),
(126, 37, 'privada', 'CCEE', '07006469', 'CCEE Princesa de Asturias', 'Ctra. de Palma - Alcúdia PK 7,5  ', '07141', 'Es Pla de na Tesa', 'Marratxí', 'Mallorca', '971604914', '971604998', 'asnimo@asnimo.com', NULL, NULL, 2, 1, 33),
(127, 832, 'privada', 'CCEE', '07015525', 'CCEE Quatre per Quatre', 'C/ de Ca na Tavernera 13-14  ', '07007', 'Palma', 'Palma', 'Mallorca', '971479407', NULL, 'secretaria@totheducatiu.com', NULL, NULL, 2, 1, 38),
(128, 845, 'privada', 'CCEE', '07015616', 'CCEE Quatre per Quatre Eivissa', 'C/ de Madrid 64  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '871112530', NULL, 'amadiba@amadiba.org', '0000-00-00', NULL, 4, 3, 63),
(129, 844, 'privada', 'CCEE', '07015604', 'CCEE Sant Josep', 'Av. dels Cubells 18', '07830', 'Sant Josep de sa Talaia', 'Sant Josep de sa Talaia', 'Eivissa', '871112530', NULL, 'amadiba@amadiba.org', '0000-00-00', NULL, 10, 3, 47),
(130, 51, 'privada', 'CCEI', '07000303', 'CCEI Es Poriol', 'C/ de Tarragona s/n  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971383326', '971383326', 'esporiol@poriol.com', NULL, NULL, 8, 2, 62),
(131, 54, 'privada', 'CCEI', '07008260', 'CCEI Ítaca', 'C/ de la Valldargent 20  ', '07013', 'Palma', 'Palma', 'Mallorca', '971453643', '971452409', 'direccio@escolaitaca.com', NULL, NULL, 28, 1, 38),
(132, 69, 'privada', 'CCEI', '07002737', 'CCEI Jardines de la Infancia Pureza de María', 'C/ de Cayetana Alberta Jiménez 11  ', '07010', 'Establiments', 'Palma', 'Mallorca', '971768302', '971728056', 'directorapedagogica@jardinesdelainfancia.org', NULL, NULL, 21, 1, 38),
(133, 56, 'privada', 'CCEI', '07008533', 'CCEI Joguina', 'Pl. de Don Joan de Borbó comte de Barcelona s/n  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971384258', '971384258', 'escolajoguina@joguinaedu.es', NULL, NULL, 8, 2, 62),
(134, 64, 'privada', 'CCEI', '07002695', 'CCEI Nuestra Señora de la Providencia', 'C/ de la Blatera 25-27  ', '07198', 'Son Ferriol', 'Palma', 'Mallorca', '971429092', '971429872', 'xisca.veny@edu.providenciasf.com', NULL, NULL, 29, 1, 38),
(135, 65, 'privada', 'CCEI', '07003365', 'CCEI Nuestra Señora de la Providencia', 'C/ del Bisbe 10  ', '07003', 'Palma', 'Palma', 'Mallorca', '971723265', '971713941', 'provpalma@hotmail.com', NULL, NULL, 28, 1, 38),
(136, 67, 'privada', 'CCEI', '07008636', 'CCEI Pinocho', 'C/ de Mas 10  baixos', '07014', 'Palma', 'Palma', 'Mallorca', '971731235', '971731235', 'centro@ceipinocho.com', NULL, NULL, 23, 1, 38),
(137, 598, 'privada', 'CCEI', '07002609', 'CCEI Popeye', 'C/ del Maestro Chapí 42  ', '07008', 'Palma', 'Palma', 'Mallorca', '971473539', NULL, 'ceipopeye@ceipopeye.es', NULL, NULL, 2, 1, 38),
(138, 71, 'privada', 'CCEI', '07001733', 'CCEI Sagrados Corazones', 'C/ des Vall 72  ', '07620', 'Llucmajor', 'Llucmajor', 'Mallorca', '971660847', '971664498', 'ceisagratscors@educacio.caib.es', NULL, NULL, 30, 1, 29),
(139, 73, 'privada', 'CCEI', '07004451', 'CCEI San Vicente de Paúl', 'Pg. de Saralegui 44  ', '07470', 'Port de Pollença', 'Pollença', 'Mallorca', '971866557', '971867309', 'centre@svpaulpp.com', NULL, NULL, 5, 1, 40),
(140, 72, 'privada', 'CCEI', '07005696', 'CCEI Sant Francesc d\'Assís', 'C/ del Doctor Esteva 8  ', '07550', 'Son Servera', 'Son Servera', 'Mallorca', '971567795', '971567795', 'sonservera@sfassis.org', NULL, NULL, 33, 1, 59),
(141, 74, 'privada', 'CCEI', '07012937', 'CCEI Sant Francesc d\'Assís', 'Camí de la Muntanya 383-385  ', '07600', 'Es Pil·larí', 'Palma', 'Mallorca', '971494000', '971494400', 'sfassis@cire.es', NULL, NULL, 25, 1, 38),
(142, 76, 'privada', 'CCEI', '07002415', 'CCEI Santa Catalina Thomàs', 'C/ de Sor Amparo Matheu 6  ', '07141', 'Es Pont d\'Inca', 'Marratxí', 'Mallorca', '971607811', '971600752', 'scatalinathomas@gmail.com', NULL, NULL, 22, 1, 33),
(143, 82, 'privada', 'CCEI', '07008491', 'CCEI Sol Ixent', 'C/ de Llorenç Maria Duran 74  ', '07300', 'Inca', 'Inca', 'Mallorca', '971500220', '971500220', 'solixentinca@hotmail.com', NULL, NULL, 35, 1, 25),
(144, 39, 'privada', 'CCEI', '07001216', 'CCEI Virgen Milagrosa', 'Pl. de l\'Església 14  ', '07860', 'Sant Francesc de Formentera', 'Formentera', 'Formentera', '971322059', '971322059', 'ceivmformentera@gmail.com', NULL, NULL, 36, 4, 23),
(145, 20, 'privada', 'CDE', '07006445', 'CDE Baleares International College', 'Ctra. de Cala Figuera 3  ', '07181', 'Sa Porrassa', 'Calvià', 'Mallorca', '971133167', '971700319', 'office@balearesint.net', NULL, NULL, 32, 1, 11),
(146, 869, 'privada', 'CDE', '07015768', 'CDE Baleares International College San Agustín', 'C/ de Marià Villangómez 17', '07015', 'Sant Agustí', 'Palma', 'Mallorca', '971403161', NULL, 'office.san@balearesint.net', '0000-00-00', NULL, 32, 1, 38),
(147, 23, 'privada', 'CDE', '07006411', 'CDE Bellver International College', 'C/ de José Costa Ferrer 5  ', '07015', 'Palma', 'Palma', 'Mallorca', '971404263', '971447335', 'info@bellvercollege.com', NULL, NULL, 3, 1, 38),
(148, 114, 'privada', 'CDE', '07008521', 'CDE Colegio Sueco', 'C/ de la Infanta 15  ', '07014', 'Palma', 'Palma', 'Mallorca', '971282350', '971822161', 'info@svskmallorca.se', NULL, NULL, 3, 1, 38),
(149, 331, 'privada', 'CDE', '07013036', 'CDE Deutsche Schule Mallorca, Eurocampus', 'Av. del Fra Joan Llabrés 1  ', '07600', 'S\'Arenal', 'Palma', 'Mallorca', '971733730', '971282161', 'info@dsmallorca.de', NULL, NULL, 3, 1, 38),
(150, 773, 'privada', 'CDE', '07014958', 'CDE EDIB', 'V. de Portugal 1A  ', '07012', 'Palma', 'Palma', 'Mallorca', '971761808', '971721388', 'info@escuelaedib.com', NULL, NULL, 3, 1, 38),
(151, 811, 'privada', 'CDE', '07015276', 'CDE Escola Global', 'Ctra. de Valldemossa PK 7,4 (Parc Bit)', '07121', 'Palma', 'Palma', 'Mallorca', '971431602', NULL, 'info@escola-global.com', NULL, NULL, 3, 1, 38),
(152, 899, 'privada', 'CDE', '07016189', 'CDE Escolasofia Waldorf School', 'C/ del Gremi dels Velluters 14', '07009', 'Sa Indioteria', 'Palma', 'Mallorca', '654390679', NULL, 'escolasofia@waldorfpalma.com', '0000-00-00', NULL, 32, 1, 38),
(153, 876, 'privada', 'CDE', '07015707', 'CDE Green Valley School', 'Camí de Sa Vileta 210  ', '07011', 'Sa Vileta', 'Palma', 'Mallorca', '971160817', NULL, 'office@edu.greenvalleyschool.es', '0000-00-00', NULL, 32, 1, 38),
(154, 826, 'privada', 'CDE', '07015252', 'CDE Happy Faces', 'C/ de Robert Graves 91  ', '07015', 'Palma', 'Palma', 'Mallorca', '971287335', NULL, 'happyfaceskinder@gmail.com', NULL, NULL, 3, 1, 38),
(155, 506, 'privada', 'CDE', '07012861', 'CDE King Richard III College', 'C/ de l\'Oratori 4  ', '07181', 'Portals Nous', 'Calvià', 'Mallorca', '971675850', '971676820', 'office@kingrichardcollege.com', NULL, NULL, 32, 1, 11),
(156, 115, 'privada', 'CDE', '07006408', 'CDE Lycée Français International d\'Ibiza', 'Ctra. de Sant Josep PK 2,3 (Can Llambias)', '07830', 'Sant Josep de sa Talaia', 'Sant Josep de sa Talaia', 'Eivissa', '971395258', '971395258', 'secretariat@lfi-ibiza.com', NULL, NULL, 4, 3, 47),
(157, 116, 'privada', 'CDE', '07006433', 'CDE Lycée Français International de Palma', 'C/ de la Salut 4  ', '07014', 'Palma', 'Palma', 'Mallorca', '971739260', '971737942', 'secretaria.palma@mlfmonde.org', NULL, NULL, 3, 1, 38),
(158, 843, 'privada', 'CDE', '07015586', 'CDE Mallorca International School', 'C/ del Llorer 1', '07420', 'Sa Pobla', 'Sa Pobla', 'Mallorca', '971570110', NULL, 'info@mallorcainternationalschool.com', '0000-00-00', NULL, 32, 1, 68),
(159, 527, 'privada', 'CDE', '07015045', 'CDE Morna International College', 'Ctra. de Sant Miquel PK 5  ', '07814', 'Santa Gertrudis de Fruitera', 'Santa Eulària des Riu', 'Eivissa', '971335164', '971326078', 'info@mornainternationalcollege.com', NULL, NULL, 36, 3, 51),
(160, 543, 'privada', 'CDE', '07006421', 'CDE Queen\'s College', 'C/ de Juan de Saridakis 64  ', '07015', 'Palma', 'Palma', 'Mallorca', '971401011', '971400153', 'info@queenscollege.es', NULL, NULL, 3, 1, 38),
(161, 839, 'privada', 'CDE', '07015471', 'CDE Rafa Nadal International School', 'Ctra. Ma-4015 PK 8  polígon  34', '07500', 'Manacor', 'Manacor', 'Mallorca', '971171676', NULL, 'info@rafanadalschool.com', '0000-00-00', NULL, 3, 1, 30),
(162, 954, 'privada', 'CDE', '07016839', 'CDE Raoul Wallemberg International School', 'C/ Oblates 23', '07013', 'Sa Vileta', 'Palma', 'Mallorca', '629464796', NULL, 'info@rwiss.eu', NULL, NULL, 3, 1, 38),
(163, 587, 'privada', 'CDE', '07007346', 'CDE The Academy International School', 'C/ de Son Ametller Vell 16  ', '07141', 'Es Pla de na Tesa', 'Marratxí', 'Mallorca', '971605008', '971605008', 'info@theacademyschool.com', NULL, NULL, 3, 1, 33),
(164, 841, 'privada', 'CDE', '07015550', 'CDE The Montessori School of Mallorca', 'C/ del Batle Josep Canyelles 9', '07320', 'Santa Maria del Camí', 'Santa Maria del Camí', 'Mallorca', '971140170', NULL, 'info@montessorimallorca.org', '0000-00-00', NULL, 3, 1, 53),
(165, 38, 'pública', 'CEE', '07004023', 'CEE Son Ferriol', 'Av. del Cid s/n  ', '07198', 'Son Ferriol', 'Palma', 'Mallorca', '971427127', '971428086', 'ceesonferriol@educaib.eu', NULL, NULL, 30, 1, 38),
(166, 636, 'privada', 'CEI', '07013760', 'CEI Angelets 2008', 'C/ de Sant Llorenç 77  ', '07620', 'Llucmajor', 'Llucmajor', 'Mallorca', '971661594', NULL, 'info@eiangelets.es', NULL, NULL, 30, 1, 29),
(167, 831, 'privada', 'CEI', '07015513', 'CEI Angelets de Llum', 'C/ de Jorge Sepúlveda 5  ', '07010', 'Palma', 'Palma', 'Mallorca', '971202523', NULL, 'info@angeletsdellum.com', NULL, NULL, 32, 1, 38),
(168, 759, 'privada', 'CEI', '07014557', 'CEI Angelets de Llum Campos', 'C/ de Girona 43  ', '07630', 'Campos', 'Campos', 'Mallorca', '971652665', NULL, 'info@angeletsdellum.com', NULL, NULL, 29, 1, 13),
(169, 40, 'privada', 'CEI', '07013188', 'CEI ASIMA', 'C/ del Gremi dels Boters 21  ', '07009', 'Sa Indioteria', 'Palma', 'Mallorca', '971433493', NULL, 'escoleta@asima.com', NULL, NULL, 35, 1, 38),
(170, 948, 'privada', 'CEI', '07016694', 'CEI Atlas Escoleta', 'C/ Andreu Torrens 5  ', '07011', 'Palma', 'Palma', 'Mallorca', NULL, NULL, 'atlasescoleta@hotmail.com', NULL, NULL, 20, 1, 38),
(171, 684, 'privada', 'CEI', '07014648', 'CEI Baberitos', 'C/ de Guasp 72  ', '07007', 'Es Coll d\'en Rabassa', 'Palma', 'Mallorca', '971490265', NULL, 'infocei@escoletababeritos.es', NULL, NULL, 30, 1, 38),
(172, 830, 'privada', 'CEI', '07015501', 'CEI Baberitos Tenis', 'C/ de Can Baró 9  ', '07014', 'Palma', 'Palma', 'Mallorca', '971903908', NULL, 'infocei@escoletababeritos.es', NULL, NULL, 28, 1, 38),
(173, 879, 'privada', 'CEI', '07015562', 'CEI Babyland', 'C/ de sa Capelleta 11', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '659378670', NULL, 'babylandibiza@gmail.com', '0000-00-00', NULL, 11, 3, 63),
(174, 796, 'privada', 'CEI', '07015161', 'CEI Bella Aurora', 'C/ dels Almogàvers 69-71  ', '07300', 'Inca', 'Inca', 'Mallorca', '971502872', NULL, 'escoleta.bellaaurora@gmail.com', NULL, NULL, 35, 1, 25),
(175, 730, 'privada', 'CEI', '07014326', 'CEI Blancanieves', 'C/ d\'Itàlia 2  ', '07840', 'Santa Eulària des Riu', 'Santa Eulària des Riu', 'Eivissa', '971330521', NULL, 'escoletablancanieves@hotmail.com', NULL, NULL, 11, 3, 51),
(176, 797, 'privada', 'CEI', '07015173', 'CEI Blaucel', 'C/ del Doctor Fleming 41  ', '07300', 'Inca', 'Inca', 'Mallorca', '871914444', NULL, 'escoletablaucel@gmail.com', NULL, NULL, 35, 1, 25),
(177, 920, 'pública', 'CEI', '07016517', 'CEI Castell Encantat', 'C/ de Jeroni Pou 24  local A', '07006', 'Palma', 'Palma', 'Mallorca', '971914445', NULL, 'sitocastell@hotmail.com', '0000-00-00', NULL, 30, 1, 38),
(178, 643, 'privada', 'CEI', '07013966', 'CEI Confits', 'C/ de Lluc 45  ', '07420', 'Sa Pobla', 'Sa Pobla', 'Mallorca', '971540549', NULL, 'ceiconfits@yahoo.es', NULL, NULL, 21, 1, 68),
(179, 809, 'privada', 'CEI', '07015239', 'CEI Corrillos', 'V. Púnica 12  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971399303', NULL, 'corrillos@hotmail.es', NULL, NULL, 11, 3, 63),
(180, 44, 'privada', 'CEI', '07013930', 'CEI d\'Arrel', 'C/ d\'Antoni Maura 55  ', '07630', 'Campos', 'Campos', 'Mallorca', '971651546', NULL, 'escoletadarrel@gmail.com', NULL, NULL, 29, 1, 13),
(181, 808, 'privada', 'CEI', '07015227', 'CEI Dues Llunes', 'Av. de Picasso 59  ', '07014', 'Palma', 'Palma', 'Mallorca', '971455927', NULL, 'escoletaduesllunes@gmail.com', NULL, NULL, 9, 1, 38),
(182, 857, 'privada', 'CEI', '07015677', 'CEI Dulces Sueños', 'C/ de Lluís Alemany i Pujol 8  ', '07010', 'Palma', 'Palma', 'Mallorca', '971900811', NULL, 'escoletadulces@gmail.com', '0000-00-00', NULL, 32, 1, 38),
(183, 931, 'privada', 'CEI', '07016581', 'CEI Dune', 'C/ de Madrid 56B  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971316636', NULL, 'eljardinencantado@hotmail.es', '0000-00-00', NULL, 11, 3, 63),
(184, 707, 'privada', 'CEI', '07014818', 'CEI El Trenet Blau', 'C/ del Riu Miño 7 (Sa Carroca)', '07817', 'Sant Jordi de ses Salines', 'Sant Josep de sa Talaia', 'Eivissa', '971306755', NULL, 'ceieltrenetblau@gmail.com', NULL, NULL, 4, 3, 47),
(185, 944, 'privada', 'CEI', '07016682', 'CEI Els Petits de l\'Assumpció', NULL, '07350', 'Binissalem', 'Binissalem', 'Mallorca', '971870377', NULL, 'petitsassumpcio@assumpcio.fecib.net', '0000-00-00', NULL, 5, 1, 8),
(186, 697, 'privada', 'CEI', '07014764', 'CEI Es Llaüt', 'C/ de Xaloc 9  ', '07610', 'Can Pastilla', 'Palma', 'Mallorca', '670473746', NULL, 'escolainfantilesllaut@hotmail.com', NULL, NULL, 25, 1, 38),
(187, 917, 'privada', 'CEI', '07016441', 'CEI Es Niu de Sinapsis', 'Rda. de l\'Institut s/n  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '601027951', NULL, 'hola@somsinapsis.com', '0000-00-00', NULL, 19, 1, 30),
(188, 638, 'privada', 'CEI', '07013851', 'CEI Es Petit Castell', 'C/ de Sor Elionor Ortiz 8  ', '07011', 'Sa Vileta', 'Palma', 'Mallorca', '971606945', NULL, 'espetitcastell@hotmail.com', NULL, NULL, 1, 1, 38),
(189, 731, 'privada', 'CEI', '07014855', 'CEI Es Pontet', 'C/ de Gabriel Maura 8  baixos', '07005', 'Palma', 'Palma', 'Mallorca', '971245431', NULL, 'escoletaespontet@gmail.com', NULL, NULL, 23, 1, 38),
(190, 693, 'privada', 'CEI', '07014739', 'CEI Escola Nova', 'C/ de Pablo Iglesias 76  ', '07004', 'Palma', 'Palma', 'Mallorca', '971293373', '971293373', 'escoletanova@hotmail.com', NULL, NULL, 6, 1, 38),
(191, 932, 'privada', 'CEI', '07016578', 'CEI Escoleta Antoni Costa', 'C/ de Sant Antoni 25  ', '07660', 'Cala d\'Or', 'Santanyí', 'Mallorca', '971657147', NULL, 'escoletaantonicosta@sfassis.org', '0000-00-00', NULL, 27, 1, 54),
(192, 922, 'privada', 'CEI', '07016487', 'CEI Escoleta de Pa amb Oli', 'C/ d\'Andreu Coll 10  ', '07100', 'Sóller', 'Sóller', 'Mallorca', '676345256', NULL, 'escoletadepaamboli@gmail.com', '0000-00-00', NULL, 20, 1, 58),
(193, 945, 'privada', 'CEI', '07016773', 'CEI Escoleta Kinder Marratxí', 'C/ de Felip II 3', '07141', 'Sa Cabaneta', 'Marratxí', 'Mallorca', '630845957', NULL, 'kindermarratxi@gmail.com', '0000-00-00', NULL, 22, 1, 33),
(194, 783, 'privada', 'CEI', '07015070', 'CEI Escoleta Lluna', 'Camí de Cas Jurat 15  baixos', '07100', 'Sóller', 'Sóller', 'Mallorca', '616855439', NULL, 'escoletalluna@hotmail.com', NULL, NULL, 20, 1, 58),
(195, 895, 'privada', 'CEI', '07015902', 'CEI Escoleta Luis Vives', 'C/ de Can Domenge 3  ', '07003', 'Palma', 'Palma', 'Mallorca', '971290150', '971290011', 'informacion@colegioluisvives.es', '0000-00-00', NULL, 21, 1, 38),
(196, 930, 'privada', 'CEI', '07016566', 'CEI Escoleta Nostra Senyora de la Consolació', 'C/ de Sant Roc 4  ', '07340', 'Alaró', 'Alaró', 'Mallorca', '971510355', '971518507', 'director@consolacioalaro.com', '0000-00-00', NULL, 32, 1, 1),
(197, 941, 'privada', 'CEI', '07016669', 'CEI Escoleta Pessigolles', 'C/ de Guillem Massot 50', '07003', 'Palma', 'Palma', 'Mallorca', '871574282', NULL, 'escoletapessigolles@gmail.com', '0000-00-00', NULL, 32, 1, 38),
(198, 913, 'privada', 'CEI', '07016414', 'CEI Escoleta Picarol', 'C/ de Vicenç Buades 42  ', '07470', 'Port de Pollença', 'Pollença', 'Mallorca', '971867283', NULL, 'escoletapicarol@gmail.com', '0000-00-00', NULL, 5, 1, 40),
(199, 943, 'privada', 'CEI', '07016712', 'CEI Escoleta Somnis', 'C/ de na Bastera 19', '07010', 'Es Secar de la Real', 'Palma', 'Mallorca', '697218951', NULL, 'escoletasomnis@gmail.com', '0000-00-00', NULL, 35, 1, 38),
(200, 781, 'privada', 'CEI', '07015057', 'CEI Estrelletes', 'C/ d\'Adrià Ferran 33  ', '07007', 'Palma', 'Palma', 'Mallorca', '971271177', NULL, 'pekes.mallorca@gmail.com', NULL, NULL, 25, 1, 38),
(201, 694, 'privada', 'CEI', '07014740', 'CEI Gianni Rodari', 'Av. de l\'Arquitecte Gaspar Bennàzar 46  ', '07004', 'Palma', 'Palma', 'Mallorca', '971299086', '971299086', 'grodari@gmail.com', NULL, NULL, 6, 1, 38),
(202, 825, 'privada', 'CEI', '07015240', 'CEI Happy Faces', 'C/ de Robert Graves 91  ', '07015', 'Palma', 'Palma', 'Mallorca', '971287335', NULL, 'happyfaceskinder@gmail.com', NULL, NULL, 3, 1, 38),
(203, 654, 'privada', 'CEI', '07014004', 'CEI Hobbiton', 'C/ del Bisbe Rafael Josep Verger 4  locals 1 i 2', '07010', 'Palma', 'Palma', 'Mallorca', '971909988', NULL, 'hobbit@hobbiton.cat', NULL, NULL, 32, 1, 38),
(204, 596, 'privada', 'CEI', '07013589', 'CEI Ítaca Nova', 'C/ de Son Espanyolet 3  ', '07014', 'Palma', 'Palma', 'Mallorca', '971451788', '971286084', 'info@itacanova.com', NULL, NULL, 28, 1, 38),
(205, 57, 'privada', 'CEI', '07013061', 'CEI Koala', 'C/ de Joan Mas 3  ', '07010', 'Palma', 'Palma', 'Mallorca', '971292401', NULL, 'vicky_valles@hotmail.com', NULL, NULL, 6, 1, 38),
(206, 732, 'privada', 'CEI', '07014867', 'CEI Koala Polígon', 'C/ del Setze de Juliol 87  2n', '07009', 'Palma', 'Palma', 'Mallorca', '971904057', NULL, 'contacto@escoletakoala.es', NULL, NULL, 21, 1, 38),
(207, 58, 'privada', 'CEI', '07008090', 'CEI La Cuna', 'C/ de Francesc Moragues 1  ', '07620', 'Llucmajor', 'Llucmajor', 'Mallorca', '971660574', NULL, 'nsgracia@planalfa.es', NULL, NULL, 30, 1, 29),
(208, 59, 'privada', 'CEI', '07013711', 'CEI La Vall', 'C/ de n\'Olesa 11  ', '07141', 'Sa Cabaneta', 'Marratxí', 'Mallorca', '971603709', '971605779', 'escoletalavall@escoletalavall.com', NULL, NULL, 22, 1, 33),
(209, 760, 'privada', 'CEI', '07014946', 'CEI Lluna de Paper', 'C/ de l\'Ametler 16  ', '07008', 'Palma', 'Palma', 'Mallorca', '971470849', NULL, 'ceipopeye@ceipopeye.es', NULL, NULL, 2, 1, 38),
(210, 621, 'privada', 'CEI', '07013701', 'CEI Mafalda', 'C/ de les Begònies 28  ', '07817', 'Sant Jordi de ses Salines', 'Sant Josep de sa Talaia', 'Eivissa', '971307183', NULL, 'ceimafaldaibiza@gmail.com', NULL, NULL, 4, 3, 47),
(211, 61, 'privada', 'CEI', '07013012', 'CEI Mamá Osa', 'C/ de Son Calbet 5-7  ', '07013', 'Palma', 'Palma', 'Mallorca', '971733837', NULL, 'info@mamaosa.es', NULL, NULL, 1, 1, 38),
(212, 708, 'privada', 'CEI', '07014661', 'CEI Escoleta Pequeño Da Vinci', 'C/ de Maria Agnesi 53-55 (Parc Bit)', '07010', 'Palma', 'Palma', 'Mallorca', '629618716', NULL, 'info@escoletamariaserra.com', NULL, NULL, 9, 1, 38),
(213, 683, 'privada', 'CEI', '07014636', 'CEI Menudall', 'C/ d\'Antoni Torrandell s/n  ', '07350', 'Binissalem', 'Binissalem', 'Mallorca', '971511459', NULL, 'menudall@outlook.es', NULL, NULL, 5, 1, 8),
(214, 602, 'privada', 'CEI', '07013759', 'CEI Món Petit', 'C/ dels Pins 17  ', '07400', 'Port d\'Alcúdia', 'Alcúdia', 'Mallorca', '971547854', NULL, 'carolmonpetit5@gmail.com', NULL, NULL, 3, 1, 2),
(215, 726, 'privada', 'CEI', '07014545', 'CEI Món Petitó', 'Pl. de Miquel Riera Perelló 11  ', '07009', 'Sa Indioteria', 'Palma', 'Mallorca', '871962067', NULL, 'escoletamonpetito@hotmail.com', NULL, NULL, 2, 1, 38),
(216, 676, 'privada', 'CEI', '07014120', 'CEI Mondaura', 'Camí de sa Figuera 68  ', '07100', 'L\'Horta', 'Sóller', 'Mallorca', '971633605', NULL, 'escoletamondaura@hotmail.com', NULL, NULL, 20, 1, 58),
(217, 938, 'privada', 'CEI', '07016670', 'CEI Nanai', 'C/ de Joan Mascaró i Fornés 84  ', '07010', 'Es Secar de la Real', 'Palma', 'Mallorca', '648197522', NULL, 'escoletananai@gmail.com', '0000-00-00', NULL, 3, 1, 38),
(218, 912, 'privada', 'CEI', '07015938', 'CEI Parròquia de Sant Josep', 'Pl. de l\'Esglèsia s/n  ', '07830', 'Sant Josep de sa Talaia', 'Sant Josep de sa Talaia', 'Eivissa', '618230188', NULL, 'santjosepescoleta@gmail.com', '0000-00-00', NULL, 11, 3, 47),
(219, 680, 'privada', 'CEI', '07014181', 'CEI Patim-Patam', 'C/ de la Tanca d\'Abaix 13  ', '07013', 'Sa Vileta', 'Palma', 'Mallorca', '971798345', NULL, 'anacarmonaextremera@gmail.com', NULL, NULL, 23, 1, 38),
(220, 653, 'privada', 'CEI', '07014016', 'CEI Pekes', 'C/ d\'Alfons el Magnànim 94  ', '07004', 'Palma', 'Palma', 'Mallorca', '971755767', NULL, 'pekes.mallorca@gmail.com', NULL, NULL, 35, 1, 38),
(221, 774, 'privada', 'CEI', '07014971', 'CEI Peter Pan', 'C/ del Gladiol 23  ', '07141', 'Es Pont d\'Inca', 'Marratxí', 'Mallorca', '971601901', '971601901', 'peterpanmarratxi@hotmail.com', NULL, NULL, 22, 1, 33),
(222, 778, 'privada', 'CEI', '07015008', 'CEI Petit Angelet', 'C/ de Son Oliva 7B  ', '07004', 'Palma', 'Palma', 'Mallorca', '971290391', NULL, 'petitangelet@hotmail.com', NULL, NULL, 32, 1, 38),
(223, 685, 'privada', 'CEI', '07014651', 'CEI Petit Món', 'Rda. de l\'Oest 88  ', '07680', 'Porto Cristo', 'Manacor', 'Mallorca', '971822841', NULL, 'escoletapetitmon@gmail.com', NULL, NULL, 33, 1, 30),
(224, 910, 'privada', 'CEI', '07016104', 'CEI Petitó', 'Av. d\'Amèrica 21  ', '07600', 'S\'Arenal', 'Palma', 'Mallorca', '971491252', NULL, 'ed@colegioborjamoll.net', '0000-00-00', NULL, 14, 1, 38),
(225, 690, 'privada', 'CEI', '07014673', 'CEI Petits', 'C/ de Ramón y Cajal 54B  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '971344123', NULL, 'escoletepetits@hotmail.com', NULL, NULL, 10, 3, 44),
(226, 671, 'privada', 'CEI', '07014119', 'CEI Petits Ferrerets', 'C/ d\'Aubarca 19  local 10', '07141', 'Es Pont d\'Inca', 'Marratxí', 'Mallorca', '648775622', NULL, 'petitsferrerets03@gmail.com', NULL, NULL, 22, 1, 33),
(227, 66, 'privada', 'CEI', '07013887', 'CEI Pica-Sol', 'Pg. de Jaume III 24  baixos', '07620', 'Llucmajor', 'Llucmajor', 'Mallorca', '971661445', NULL, 'info@pica-sol.es', NULL, NULL, 30, 1, 29),
(228, 68, 'privada', 'CEI', '07013449', 'CEI Poporiol', 'C/ del Barracar Alt 51  ', '07520', 'Petra', 'Petra', 'Mallorca', '971561910', NULL, 'poporiol@hotmail.com', NULL, NULL, 7, 1, 39),
(229, 70, 'privada', 'CEI', '07013723', 'CEI Rin Tin Tin', 'C/ de l\'Arxiduc Lluís Salvador 54  ', '07004', 'Palma', 'Palma', 'Mallorca', '971750289', NULL, 'escoletarintintin@hotmail.com', NULL, NULL, 6, 1, 38),
(230, 692, 'privada', 'CEI', '07014697', 'CEI Ropit', 'C/ de Ramon Muntaner 10-12  ', '07003', 'Palma', 'Palma', 'Mallorca', '971209068', NULL, 'escoletaropit@gmail.com', NULL, NULL, 35, 1, 38),
(231, 599, 'privada', 'CEI', '07008764', 'CEI Ohana', 'C/ de Sant Cristòfol 55  ', '07600', 'S\'Arenal', 'Llucmajor', 'Mallorca', '971440064', NULL, 'cei@saucellet.com', NULL, NULL, 14, 1, 29),
(232, 733, 'privada', 'CEI', '07014341', 'CEI S\'Estel', 'C/ de la Missió 29  baixos', '07003', 'Palma', 'Palma', 'Mallorca', '971722872', NULL, 'escoletaestel@gmail.com', NULL, NULL, 1, 1, 38),
(233, 929, 'privada', 'CEI', '07016591', 'CEI Sa Cabanya', 'C/ de Llorenç Villalonga 39  ', '07350', 'Binissalem', 'Binissalem', 'Mallorca', '670511850', NULL, 'info@sacabanya.com', '0000-00-00', NULL, 5, 1, 8);
INSERT INTO `centres` (`id`, `Ubi_Codi`, `Titularitat`, `Sigla`, `Codi`, `Centre`, `Adreca`, `CP`, `Localitat`, `Municipi`, `Illa`, `Telefon`, `Fax`, `email`, `Alta`, `Baixa`, `Inspector_id`, `id_illa`, `id_municipi`) VALUES
(234, 695, 'privada', 'CEI', '07014752', 'CEI Sa Capçaneta', 'C/ de Ca\'s Quitxero 25  ', '07199', 'Sant Jordi', 'Palma', 'Mallorca', '971742816', NULL, 'xiscaestrany59@gmail.com', NULL, NULL, 25, 1, 38),
(235, 775, 'privada', 'CEI', '07014961', 'CEI Sa Miloca', 'C/ de Manacor 59  baixos', '07005', 'Palma', 'Palma', 'Mallorca', '971465715', NULL, 'escoletasamiloca@hotmail.com', NULL, NULL, 34, 1, 38),
(236, 766, 'privada', 'CEI', '07014624', 'CEI Sant Agustí', 'C/ de Victorio Luzuriaga 14  ', '07015', 'Sant Agustí', 'Palma', 'Mallorca', '971403499', NULL, 'ceisanagustin@gmail.com', NULL, NULL, 1, 1, 38),
(237, 837, 'privada', 'CEI', '07015380', 'CEI Sant Francesc d\'Assís', 'C/ del Convent 13  ', '07669', 'S\'Horta', 'Felanitx', 'Mallorca', '971837136', NULL, 'shortaadmon@gmail.com', '0000-00-00', NULL, 27, 1, 21),
(238, 80, 'privada', 'CEI', '07013462', 'CEI Siervas de Jesús. Sagrado Corazón', 'C/ de Sant Alonso 26  ', '07001', 'Palma', 'Palma', 'Mallorca', '971721830', NULL, 'ceiscorazon@gmail.com', NULL, NULL, 1, 1, 38),
(239, 679, 'privada', 'CEI', '07014171', 'CEI Siete Enanitos', 'C/ del Bisbe Cabanelles 3A  ', '07005', 'Palma', 'Palma', 'Mallorca', '971245228', NULL, 'ceisieteenanitos@gmail.com', NULL, NULL, 23, 1, 38),
(240, 840, 'privada', 'CEI', '07015495', 'CEI Sol Solet', 'C/ de General Riera 88  baixos', '07010', 'Palma', 'Palma', 'Mallorca', '971202786', NULL, 'info@escoletasolsolet.com', '0000-00-00', NULL, 21, 1, 38),
(241, 877, 'privada', 'CEI', '07015801', 'CEI Somnis', 'C/ de Canàries 40', '07800', 'Eivissa', 'Eivissa', 'Eivissa', NULL, NULL, 'somniscentreinfantil@gmail.com', '0000-00-00', NULL, 11, 3, 63),
(242, 921, 'pública', 'CEI', '07016463', 'CEI Son Espases', 'Ctra. de Valldemossa 79, bloc K, pis 1 (HU Son Espases) ', '07120', 'Palma', 'Palma', 'Mallorca', NULL, NULL, 'info@chsonespases.com', '0000-00-00', NULL, 23, 1, 38),
(243, 644, 'privada', 'CEI', '07013954', 'CEI Son Llàtzer', 'Ctra. de Manacor PK 4  ', '07198', 'Palma', 'Palma', 'Mallorca', '971426629', NULL, 'escoletasonllatzer@gmail.com', NULL, NULL, 9, 1, 38),
(244, 85, 'privada', 'CEI', '07013486', 'CEI Teringa', 'C/ de Pau Piferrer 7  ', '07011', 'Palma', 'Palma', 'Mallorca', '971286383', NULL, 'direccio@escoletateringa.com', NULL, NULL, 28, 1, 38),
(245, 918, 'privada', 'CEI', '07016451', 'CEI Vilanens', 'C/ del músic Vicent Mayans Marí 2  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '657405293', NULL, 'civilanens@gmail.com', '0000-00-00', NULL, 4, 3, 63),
(246, 705, 'privada', 'CEI', '07014791', 'CEI Voliaina', 'C/ de Philip Newman 5  ', '07460', 'Pollença', 'Pollença', 'Mallorca', '971531273', NULL, 'cei.voliaina@gmail.com', NULL, NULL, 5, 1, 40),
(247, 696, 'privada', 'CEI', '07015628', 'CEI Wabi Sabi', 'C/ de Bartomeu Oliver de Can Tunis 39  ', '07198', 'Son Ferriol', 'Palma', 'Mallorca', '971420151', NULL, 'escoletawabisabi@gmail.com', NULL, NULL, 25, 1, 38),
(248, 933, 'privada', 'CEI', '07016608', 'CEI Xin-Xirineu', 'C/ de ses Jovades 8  baixos', '07450', 'Santa Margalida', 'Santa Margalida', 'Mallorca', '871850091', NULL, 'xinxirineu@gmail.com', '0000-00-00', NULL, 34, 1, 52),
(249, 885, 'privada', 'CEI', '07015926', 'CEI Xin-Xirineu Can Picafort', 'Ctra. de Santa Margalida 5  ', '07458', 'Can Picafort', 'Santa Margalida', 'Mallorca', '871251757', NULL, 'xinxirineu@gmail.com', '0000-00-00', NULL, 34, 1, 52),
(250, 946, 'privada', 'CEI', '07016785', 'CEI Little Rainbow', 'C/ de Son Busquets 2  ', '07010', 'Palma', 'Palma', 'Mallorca', '676701327', NULL, 'info@littlerainbow.es', '0000-00-00', NULL, 32, 1, 38),
(251, 87, 'privada', 'CEI', '07008570', 'CEI Xipell', 'C/ de Sor Àgueda s/n  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971381808', '971381808', 'ceixipell@gmail.com', NULL, NULL, 8, 2, 62),
(252, 176, 'pública', 'CEIP', '07002774', 'CEIP Aina Moll i Marquès', 'Pl. de Berenguer de Palou 6  ', '07003', 'Palma', 'Palma', 'Mallorca', '971710019', '971723073', 'ceipainamoll@educaib.eu', NULL, NULL, 23, 1, 38),
(253, 126, 'pública', 'CEIP', '07002907', 'CEIP Alexandre Rosselló', 'C/ de Miquel Santandreu 48  ', '07006', 'Palma', 'Palma', 'Mallorca', '971771694', '971469469', 'ceipalexandrerossello@educaib.eu', NULL, NULL, 25, 1, 38),
(254, 127, 'pública', 'CEIP', '07005751', 'CEIP Àngel Ruiz i Pablo', 'C/ de s\'Escola s/n  ', '07720', 'Es Castell', 'Es Castell', 'Menorca', '971363454', '971353957', 'ceipangelruizipablo@educaib.eu', NULL, NULL, 16, 2, 64),
(255, 128, 'pública', 'CEIP', '07004321', 'CEIP Anselm Turmeda', 'C/ del Cap Blanc 15  ', '07011', 'Sa Vileta', 'Palma', 'Mallorca', '971791388', '971798615', 'ceipanselmturmeda@educaib.eu', NULL, NULL, 9, 1, 38),
(256, 129, 'pública', 'CEIP', '07001812', 'CEIP Antoni Juan Alemany', 'C/ de Santa Eulàlia 89  ', '07702', 'Maó', 'Maó', 'Menorca', '971364842', '971364842', 'ceipantonijuanalemany@educaib.eu', NULL, NULL, 18, 2, 34),
(257, 131, 'pública', 'CEIP', '07001599', 'CEIP Antònia Alzina', 'Ptge. Baix de sa Riba s/n  ', '07518', 'Lloret de Vistalegre', 'Lloret de Vistalegre', 'Mallorca', '971524291', '971524339', 'ceipantoniaalzina@educaib.eu', NULL, NULL, 7, 1, 26),
(258, 132, 'pública', 'CEIP', '07008041', 'CEIP Badies', 'C/ de la Fragata s/n  ', '07609', 'Badia Gran', 'Llucmajor', 'Mallorca', '971741365', '971749572', 'ceipbadies@educaib.eu', NULL, NULL, 27, 1, 29),
(259, 133, 'pública', 'CEIP', '07004931', 'CEIP Balansat', 'Ctra. d\'Eivissa s/n  ', '07815', 'Sant Miquel de Balansat', 'Sant Joan de Labritja', 'Eivissa', '971334870', '971334870', 'ceipbalansat@educaib.eu', NULL, NULL, 36, 3, 46),
(260, 134, 'pública', 'CEIP', '07000881', 'CEIP Bartomeu Ordines', 'Av. de Francisca Homar i Pasqual 20  ', '07330', 'Consell', 'Consell', 'Mallorca', '971622051', '971622051', 'ceipbartomeuordines@educaib.eu', NULL, NULL, 5, 1, 15),
(261, 226, 'pública', 'CEIP', '07006263', 'CEIP Bendinat', 'C/ de l\'Arquitecte Francesc Casas 14  ', '07181', 'Bendinat', 'Calvià', 'Mallorca', '971700127', '971405141', 'ceipbendinat@educaib.eu', NULL, NULL, 1, 1, 11),
(262, 135, 'pública', 'CEIP', '07005398', 'CEIP Blai Bonet', 'C/ de Gómez Ulla s/n  ', '07650', 'Santanyí', 'Santanyí', 'Mallorca', '971653955', '971654027', 'ceipblaibonet@educaib.eu', NULL, NULL, 17, 1, 54),
(263, 136, 'pública', 'CEIP', '07002439', 'CEIP Blanquerna', 'C/ des Caülls 21  ', '07141', 'Es Pont d\'Inca', 'Marratxí', 'Mallorca', '971795170', '971795170', 'ceipblanquerna@educaib.eu', NULL, NULL, 22, 1, 33),
(264, 248, 'pública', 'CEIP', '07012858', 'CEIP Bocchoris', 'C/ del Mestre Albertí 1  ', '07470', 'Port de Pollença', 'Pollença', 'Mallorca', '971866129', '971866129', 'ceipbocchoris@educaib.eu', NULL, NULL, 5, 1, 40),
(265, 137, 'pública', 'CEIP', '07004667', 'CEIP Buscastell', 'Ctra. de Santa Agnès PK 5,7  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '971345836', '971345836', 'ceipbuscastell@educaib.eu', NULL, NULL, 10, 3, 44),
(266, 138, 'pública', 'CEIP', '07012883', 'CEIP Calonge', 'Pl. de Sant Miquel s/n  ', '07669', 'Calonge', 'Santanyí', 'Mallorca', '971839119', '971839118', 'ceipcalonge@educaib.eu', NULL, NULL, 17, 1, 54),
(267, 139, 'pública', 'CEIP', '07005994', 'CEIP Camilo José Cela', 'C/ de Perú 2  ', '07007', 'Palma', 'Palma', 'Mallorca', '971240625', '971256308', 'ceipcamilojosecela@educaib.eu', NULL, NULL, 25, 1, 38),
(268, 140, 'pública', 'CEIP', '07004758', 'CEIP Can Bril', 'C/ de Ramon Llull s/n  ', '07140', 'Sencelles', 'Sencelles', 'Mallorca', '971872653', '971874438', 'ceipcanbril@educaib.eu', NULL, NULL, 7, 1, 56),
(269, 141, 'pública', 'CEIP', '07007814', 'CEIP Can Cantó', 'C/ de Jondal s/n  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971307278', '971307278', 'ceipcancanto@educaib.eu', NULL, NULL, 4, 3, 63),
(270, 142, 'pública', 'CEIP', '07004680', 'CEIP Can Coix', 'Ctra. de Santa Agnès PK 1,5  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '971344768', '971344768', 'ceipcancoix@educaib.eu', NULL, NULL, 10, 3, 44),
(271, 143, 'pública', 'CEIP', '07007541', 'CEIP Can Guerxo', 'C/ de Can Guerxo s/n  ', '07817', 'Sant Jordi de ses Salines', 'Sant Josep de sa Talaia', 'Eivissa', '971395017', '971395017', 'ceipcanguerxo@educaib.eu', NULL, NULL, 4, 3, 47),
(272, 144, 'pública', 'CEIP', '07001393', 'CEIP Can Misses', 'Ctra. de la Corona s/n  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971314376', '971314376', 'ceipcanmisses@educaib.eu', NULL, NULL, 11, 3, 63),
(273, 145, 'pública', 'CEIP', '07002610', 'CEIP Can Pastilla', 'C/ de Sertori 2  ', '07610', 'Can Pastilla', 'Palma', 'Mallorca', '971265554', '971265558', 'ceipcanpastilla@educaib.eu', NULL, NULL, 25, 1, 38),
(274, 146, 'pública', 'CEIP', '07013361', 'CEIP Can Raspalls', 'Fca. de Can Raspalls s/n  ', '07817', 'Sant Jordi de ses Salines', 'Sant Josep de sa Talaia', 'Eivissa', '971303262', '971303262', 'ceipcanraspalls@educaib.eu', NULL, NULL, 4, 3, 47),
(275, 147, 'pública', 'CEIP', '07013127', 'CEIP Cas Capiscol', 'C/ de Leocadia de Togores 8  ', '07010', 'Palma', 'Palma', 'Mallorca', '971762129', '971755335', 'ceipcascapiscol@educaib.eu', NULL, NULL, 32, 1, 38),
(276, 148, 'pública', 'CEIP', '07007255', 'CEIP Cas Saboners', 'C/ dels Coloms 15  ', '07181', 'Magaluf', 'Calvià', 'Mallorca', '971681692', '971681028', 'ceipcassaboners@educaib.eu', NULL, NULL, 23, 1, 11),
(277, 149, 'pública', 'CEIP', '07001435', 'CEIP Cas Serres', 'C/ del músic Fermí Marí 2  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971303811', '971303811', 'ceipcasserres@educaib.eu', NULL, NULL, 4, 3, 63),
(278, 150, 'pública', 'CEIP', '07001149', 'CEIP Castell de Santa Àgueda', 'Av. de Son Morera s/n  ', '07750', 'Ferreries', 'Ferreries', 'Menorca', '971373264', '971373264', 'ceipcastelldesantaagueda@educaib.eu', NULL, NULL, 18, 2, 22),
(279, 151, 'pública', 'CEIP', '07006962', 'CEIP Cervantes', 'C/ de Marino Riquer s/n  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '971341423', '971341423', 'ceipcervantes@educaib.eu', NULL, NULL, 10, 3, 44),
(280, 174, 'pública', 'CEIP', '07004503', 'CEIP Climent Serra i Servera', 'C/ de Lluís Vives 1  ', '07260', 'Porreres', 'Porreres', 'Mallorca', '971647604', '971166735', 'ceipclimentserraiservera@educaib.eu', NULL, NULL, 14, 1, 41),
(281, 161, 'pública', 'CEIP', '07002658', 'CEIP Coll d\'en Rabassa, Guillem Lladó Coll', 'C/ de Bailén 38  ', '07007', 'Es Coll d\'en Rabassa', 'Palma', 'Mallorca', '971267369', '971267369', 'ceipcolldenrabassa@educaib.eu', NULL, NULL, 30, 1, 38),
(282, 152, 'pública', 'CEIP', '07007085', 'CEIP Colònia de Sant Jordi', 'C/ de s\'Escola s/n  ', '07638', 'Colònia de Sant Jordi', 'Ses Salines', 'Mallorca', '971655477', '971655477', 'ceipcoloniadesantjordi@educaib.eu', NULL, NULL, 29, 1, 43),
(283, 154, 'pública', 'CEIP', '07002831', 'CEIP de Pràctiques', 'Ctra. de Valldemossa 15  ', '07010', 'Palma', 'Palma', 'Mallorca', '971756704', '971756704', 'ceipdepractiques@educaib.eu', NULL, NULL, 32, 1, 38),
(284, 155, 'pública', 'CEIP', '07001642', 'CEIP Duran Estrany', 'C/ del Doctor Fleming 35  ', '07430', 'Llubí', 'Llubí', 'Mallorca', '971522507', '971522507', 'ceipduranestrany@educaib.eu', NULL, NULL, 7, 1, 28),
(285, 156, 'pública', 'CEIP', '07001174', 'CEIP El Pilar', 'C/ de Nostra Senyora del Pilar s/n  ', '07872', 'El Pilar de la Mola', 'Formentera', 'Formentera', '971327053', '971327053', 'ceipelpilar@educaib.eu', NULL, NULL, 36, 4, 23),
(286, 218, 'pública', 'CEIP', '07003791', 'CEIP El Terreno', 'C/ de Robert Graves 45  ', '07015', 'Palma', 'Palma', 'Mallorca', '971455075', '971732877', 'ceipelterreno@educaib.eu', NULL, NULL, 24, 1, 38),
(287, 157, 'pública', 'CEIP', '07005261', 'CEIP Eleonor Bosch', 'C/ de Guillem Crespí i Coll 1  ', '07450', 'Santa Margalida', 'Santa Margalida', 'Mallorca', '971523431', '971523431', 'ceipeleonorbosch@educaib.eu', NULL, NULL, 34, 1, 52),
(288, 158, 'pública', 'CEIP', '07000418', 'CEIP Els Molins', 'C/ dels Molins 57  ', '07311', 'Búger', 'Búger', 'Mallorca', '971516978', '971516978', 'ceipelsmolins.buger@educaib.eu', NULL, NULL, 21, 1, 9),
(289, 159, 'pública', 'CEIP', '07007231', 'CEIP Els Molins', 'Camí des Castellàs 18  ', '07159', 'S\'Arracó', 'Andratx', 'Mallorca', '971674152', '971674152', 'molins@ceipmolins.com', NULL, NULL, 12, 1, 4),
(290, 595, 'pública', 'CEIP', '07002592', 'CEIP Els Tamarells', 'Camí de Ca na Gabriela 36  ', '07600', 'S\'Arenal', 'Palma', 'Mallorca', '971268511', '971268511', 'ceipelstamarells@educaib.eu', NULL, NULL, 25, 1, 38),
(291, 162, 'pública', 'CEIP', '07005787', 'CEIP Es Cremat', 'C/ de Joan Miró 4  ', '07250', 'Vilafranca de Bonany', 'Vilafranca de Bonany', 'Mallorca', '971560167', '971832291', 'ceipescremat@educaib.eu', NULL, NULL, 14, 1, 61),
(292, 163, 'pública', 'CEIP', '07005593', 'CEIP Es Fossaret', 'C/ de Joan Marquès Arbona 9  ', '07100', 'Sóller', 'Sóller', 'Mallorca', '971633315', '971634482', 'ceipesfossaret@educaib.eu', NULL, NULL, 20, 1, 58),
(293, 191, 'pública', 'CEIP', '07003225', 'CEIP Es Molinar, Infant Felip', 'C/ de Llucmajor 81  ', '07006', 'Palma', 'Palma', 'Mallorca', '971276006', '971257459', 'ceipesmolinarinfantfelip@educaib.eu', NULL, NULL, 25, 1, 38),
(294, 164, 'pública', 'CEIP', '07005933', 'CEIP Es Pil·larí', 'Camí de Son Fangos 241  ', '07600', 'Es Pil·larí', 'Palma', 'Mallorca', '971490252', '971743414', 'ceipespillari@educaib.eu', NULL, NULL, 25, 1, 38),
(295, 165, 'pública', 'CEIP', '07006691', 'CEIP Es Pont', 'C/ d\'Indalecio Prieto s/n  ', '07008', 'Palma', 'Palma', 'Mallorca', '971240781', '971240781', 'ceipespont@educaib.eu', NULL, NULL, 17, 1, 38),
(296, 166, 'pública', 'CEIP', '07001629', 'CEIP Es Puig', 'Camí des Puig s/n  ', '07360', 'Lloseta', 'Lloseta', 'Mallorca', '971519436', '971519787', 'ceipespuig.lloseta@educaib.eu', NULL, NULL, 6, 1, 27),
(297, 167, 'pública', 'CEIP', '07005660', 'CEIP Es Puig', 'Ctra. de Pollença s/n  ', '07100', 'Sóller', 'Sóller', 'Mallorca', '971630372', '971630372', 'ceipespuig.soller@educaib.eu', NULL, NULL, 20, 1, 58),
(298, 168, 'pública', 'CEIP', '07005453', 'CEIP Es Putxet', 'C/ de ses Escoles 14  ', '07313', 'Selva', 'Selva', 'Mallorca', '971515043', '971515043', 'ceipesputxet@educaib.eu', NULL, NULL, 6, 1, 55),
(299, 169, 'pública', 'CEIP', '07004138', 'CEIP Es Secar de la Real', 'C/ de Can Vicari 9  ', '07010', 'Es Secar de la Real', 'Palma', 'Mallorca', '971769221', '971769221', 'ceipessecardelareal@educaib.eu', NULL, NULL, 35, 1, 38),
(300, 170, 'pública', 'CEIP', '07006561', 'CEIP Es Torrentet', 'C/ de Selva 17  ', '07369', 'Biniamar', 'Selva', 'Mallorca', '971514728', '971514728', 'ceipestorrentet@educaib.eu', NULL, NULL, 6, 1, 55),
(301, 171, 'pública', 'CEIP', '07004795', 'CEIP Es Vedrà', 'C/ de les Escoles Noves s/n  ', '07839', 'Sant Agustí des Vedrà', 'Sant Josep de sa Talaia', 'Eivissa', '971341629', '971341629', 'ceipesvedra@educaib.eu', NULL, NULL, 10, 3, 47),
(302, 172, 'pública', 'CEIP', '07000194', 'CEIP Es Vinyet', 'C/ de Galícia 66  ', '07150', 'Andratx', 'Andratx', 'Mallorca', '971137707', '971136709', 'ceipesvinyet@educaib.eu', NULL, NULL, 12, 1, 4),
(303, 173, 'pública', 'CEIP', '07002932', 'CEIP Es Vivero', 'C/ del Crèdit Balear 15  ', '07008', 'Palma', 'Palma', 'Mallorca', '971471457', '971477575', 'ceipesvivero@educaib.eu', NULL, NULL, 2, 1, 38),
(304, 181, 'pública', 'CEIP', '07003304', 'CEIP Escola Graduada', 'C/ de l\'Escola Graduada 6  ', '07002', 'Palma', 'Palma', 'Mallorca', '971725806', '971775324', 'ceipescolagraduada@educaib.eu', NULL, NULL, 34, 1, 38),
(305, 175, 'pública', 'CEIP', '07002749', 'CEIP Establiments', 'Camí de Sarrià s/n  ', '07010', 'Establiments', 'Palma', 'Mallorca', '971768285', '971768677', 'ceipestabliments@educaib.eu', NULL, NULL, 35, 1, 38),
(306, 177, 'pública', 'CEIP', '07004011', 'CEIP Tramuntana (antic CEIP Felip Bauçà).', 'C/ dels Germans García Peñaranda 11  ', '07010', 'Palma', 'Palma', 'Mallorca', '971295885', '971295885', 'ceipfelipbauca@educaib.eu', NULL, NULL, 32, 1, 38),
(307, 178, 'pública', 'CEIP', '07008788', 'CEIP Fornalutx', 'C/ de sa Rutlana s/n  ', '07109', 'Fornalutx', 'Fornalutx', 'Mallorca', '971633723', '971633723', 'ceipfornalutx@educaib.eu', NULL, NULL, 20, 1, 24),
(308, 179, 'pública', 'CEIP', '07005970', 'CEIP Fornells', 'Av. de sa Punta Gran s/n  ', '07748', 'Fornells', 'Es Mercadal', 'Menorca', '971376359', '971376359', 'ceipfornells@educaib.eu', NULL, NULL, 16, 2, 35),
(309, 180, 'pública', 'CEIP', '07002531', 'CEIP Francesc d\'Albranca', 'Camí de la Mala Garba s/n  ', '07749', 'Es Migjorn Gran', 'Es Migjorn Gran', 'Menorca', '971370343', '971370367', 'ceipfrancescdalbranca@educaib.eu', NULL, NULL, 16, 2, 65),
(310, 182, 'pública', 'CEIP', '07000960', 'CEIP Gabriel Comas i Ribas', 'C/ de Ca l\'Amet 5  ', '07190', 'Esporles', 'Esporles', 'Mallorca', '971610096', '971610096', 'ceipgabrielcomasiribas@educaib.eu', NULL, NULL, 24, 1, 19),
(311, 183, 'pública', 'CEIP', '07002397', 'CEIP Gabriel Janer Manila', 'C/ de Weyler 1  ', '07141', 'Es Pla de na Tesa', 'Marratxí', 'Mallorca', '971795146', '971794085', 'ceipgabrieljanermanila@educaib.eu', NULL, NULL, 22, 1, 33),
(312, 184, 'pública', 'CEIP', '07000984', 'CEIP Gabriel Palmer', 'C/ de Gabriel Palmer 1  ', '07192', 'Estellencs', 'Estellencs', 'Mallorca', '971618641', '971149004', 'ceipgabrielpalmer@educaib.eu', NULL, NULL, 12, 1, 20),
(313, 186, 'pública', 'CEIP', '07000534', 'CEIP Galatzó', 'C/ de l\'Església 44  ', '07196', 'Es Capdellà', 'Calvià', 'Mallorca', '971233167', '971233167', 'ceipgalatzo@educaib.eu', NULL, NULL, 28, 1, 11),
(314, 187, 'pública', 'CEIP', '07007243', 'CEIP Gaspar Sabater', 'C/ de les Gardènies 8  ', '07193', 'Palmanyola', 'Bunyola', 'Mallorca', '971149630', '971149631', 'ceipgasparsabater@educaib.eu', NULL, NULL, 20, 1, 10),
(315, 188, 'pública', 'CEIP', '07002750', 'CEIP Gènova', 'C/ del Barranc 2  ', '07015', 'Gènova', 'Palma', 'Mallorca', '971400001', '971400001', 'ceipgenova@educaib.eu', NULL, NULL, 9, 1, 38),
(316, 189, 'pública', 'CEIP', '07002567', 'CEIP Guillem Ballester i Cerdó', 'C/ del Molí de Can Moragues s/n  ', '07440', 'Muro', 'Muro', 'Mallorca', '971537862', '971860651', 'ceipguillemballester@educaib.eu', NULL, NULL, 35, 1, 37),
(317, 190, 'pública', 'CEIP', '07007061', 'CEIP Guillem de Montgrí', 'Ctra. de Santa Agnès s/n  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '971344818', '971344818', 'ceipguillemdemontgri@educaib.eu', NULL, NULL, 10, 3, 44),
(318, 153, 'pública', 'CEIP', '07004345', 'CEIP Guillem Frontera Pascual', 'C/ Major s/n  ', '07529', 'Ariany', 'Ariany', 'Mallorca', '971561320', '971561320', 'ceipguillemfronterapascual@educaib.eu', NULL, NULL, 7, 1, 5),
(319, 192, 'pública', 'CEIP', '07000091', 'CEIP Inspector Doctor Comas Camps', 'Av. de la Verge del Toro 84  ', '07730', 'Alaior', 'Alaior', 'Menorca', '971371887', '971378808', 'ceipinspectorcomascamps@educaib.eu', NULL, NULL, 18, 2, 69),
(320, 193, 'pública', 'CEIP', '07001010', 'CEIP Inspector Joan Capó', 'C/ del Bellpuig 22  ', '07200', 'Felanitx', 'Felanitx', 'Mallorca', '971580206', '971580206', 'ceipinspectorjoancapo@educaib.eu', NULL, NULL, 27, 1, 21),
(321, 194, 'pública', 'CEIP', '07003250', 'CEIP Jafudà Cresques', 'C/ de Faust Morell 27  ', '07005', 'Palma', 'Palma', 'Mallorca', '971274164', '971279734', 'ceipjafudacresques@educaib.eu', NULL, NULL, 34, 1, 38),
(322, 195, 'pública', 'CEIP', '07005684', 'CEIP Jaume Fornaris i Taltavull', 'C/ de les Creus s/n  ', '07550', 'Son Servera', 'Son Servera', 'Mallorca', '971567186', '971567880', 'ceipjaumefornaris@educaib.eu', NULL, NULL, 19, 1, 59),
(323, 196, 'pública', 'CEIP', '07006809', 'CEIP Jaume I', 'C/ de Lleó 8  ', '07181', 'Palmanova', 'Calvià', 'Mallorca', '971681932', '971682372', 'ceipjaumei@educaib.eu', NULL, NULL, 1, 1, 11),
(324, 197, 'pública', 'CEIP', '07007711', 'CEIP Jaume Vidal i Alcover', 'C/ des  Serralt s/n  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971844082', '971844539', 'ceipjaumevidal@educaib.eu', NULL, NULL, 19, 1, 30),
(325, 198, 'pública', 'CEIP', '07000790', 'CEIP Joan Benejam', 'Pl. des Born s/n  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971380632', '971482675', 'ceipjoanbenejam@educaib.eu', NULL, NULL, 16, 2, 62),
(326, 199, 'pública', 'CEIP', '07002889', 'CEIP Joan Capó', 'C/ de Santa Florentina 63  ', '07008', 'Palma', 'Palma', 'Mallorca', '971277805', '971256301', 'ceipjoancapo@educaib.eu', NULL, NULL, 17, 1, 38),
(327, 200, 'pública', 'CEIP', '07004424', 'CEIP Joan Mas', 'Ctra. del Port s/n  ', '07460', 'Pollença', 'Pollença', 'Mallorca', '971534630', '971534630', 'ceipjoanmas@educaib.eu', NULL, NULL, 5, 1, 40),
(328, 201, 'pública', 'CEIP', '07002543', 'CEIP Joan Mas i Verd', 'C/ d\'Emili Pou s/n  ', '07230', 'Montuïri', 'Montuïri', 'Mallorca', '971161550', '971644022', 'ceipjoanmasiverd@educaib.eu', NULL, NULL, 14, 1, 36),
(329, 202, 'pública', 'CEIP', '07000583', 'CEIP Joan Veny i Clar', 'C/ de ses Estrelles 34A i 34B  ', '07630', 'Campos', 'Campos', 'Mallorca', '971652194', '971652194', 'ceipjoanvenyiclar@educaib.eu', NULL, NULL, 29, 1, 13),
(330, 203, 'pública', 'CEIP', '07004382', 'CEIP Juníper Serra', 'C/ de l\'Escultor Galmés s/n  ', '07520', 'Petra', 'Petra', 'Mallorca', '971561269', '971561269', 'ceipjuniperserra@educaib.eu', NULL, NULL, 7, 1, 39),
(331, 208, 'pública', 'CEIP', '07004771', 'CEIP L\'Urgell', 'Av. del Diputat Josep Ribas s/n  ', '07830', 'Sant Josep de sa Talaia', 'Sant Josep de sa Talaia', 'Eivissa', '971801651', '971800325', 'ceiplurgell@educaib.eu', NULL, NULL, 10, 3, 47),
(332, 204, 'pública', 'CEIP', '07002804', 'CEIP La Soledat', 'C/ del Regal 16  ', '07007', 'Palma', 'Palma', 'Mallorca', '971274929', '971274929', 'ceiplasoledat@educaib.eu', NULL, NULL, 14, 1, 38),
(333, 205, 'pública', 'CEIP', '07004904', 'CEIP Labritja', 'Ctra. d\'Eivissa s/n  ', '07810', 'Sant Joan de Labritja', 'Sant Joan de Labritja', 'Eivissa', '971333071', '971333071', 'ceiplabritja@educaib.eu', NULL, NULL, 36, 3, 46),
(334, 206, 'pública', 'CEIP', '07001514', 'CEIP Llevant', 'Av. del Rei Jaume I s/n  ', '07300', 'Inca', 'Inca', 'Mallorca', '971500914', '971507261', 'ceipllevant@educaib.eu', NULL, NULL, 35, 1, 25),
(335, 207, 'pública', 'CEIP', '07000561', 'CEIP Llorenç Riber', 'Camí de Son Perelló s/n  ', '07310', 'Campanet', 'Campanet', 'Mallorca', '971516309', '971516309', 'ceipllorencriber@educaib.eu', NULL, NULL, 21, 1, 12),
(336, 209, 'pública', 'CEIP', '07001836', 'CEIP Mare de Déu de Gràcia', 'Av. de Vives Llull 17  ', '07703', 'Maó', 'Maó', 'Menorca', '971360141', '971360141', 'ceipmarededeudegracia@educaib.eu', NULL, NULL, 8, 2, 34),
(337, 213, 'pública', 'CEIP', '07006342', 'CEIP Mare de Déu de la Consolació', 'C/ del Convent 13  ', '07691', 'S\'Alqueria Blanca', 'Santanyí', 'Mallorca', '971654143', '971654075', 'ceipmarededeudelaconsolacio@educaib.eu', NULL, NULL, 17, 1, 54),
(338, 210, 'pública', 'CEIP', '07001800', 'CEIP Mare de Déu del Carme', 'C/ de Màrius Verdaguer 7  ', '07702', 'Maó', 'Maó', 'Menorca', '971361832', '971356657', 'ceipmarededeudelcarme@educaib.eu', NULL, NULL, 18, 2, 34),
(339, 211, 'pública', 'CEIP', '07000777', 'CEIP Mare de Déu del Toro', 'C/ de la Pau s/n  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971381172', '971381172', 'ceipmarededeudeltoro.ciutadella@educaib.eu', NULL, NULL, 18, 2, 62),
(340, 212, 'pública', 'CEIP', '07002518', 'CEIP Mare de Déu del Toro', 'Av. del Mestre Garí 1  ', '07740', 'Es Mercadal', 'Es Mercadal', 'Menorca', '971375338', '971375338', 'ceipmarededeudeltoro.esmercadal@educaib.eu', NULL, NULL, 16, 2, 35),
(341, 214, 'pública', 'CEIP', '07012974', 'CEIP Margalida Florit', 'Ctra. de Gustau Mas 91  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971382323', '971385683', 'ceipmargalidaflorit@educaib.eu', NULL, NULL, 8, 2, 62),
(342, 215, 'pública', 'CEIP', '07004229', 'CEIP Maria Antònia Salvà', 'C/ del Passatemps 125  ', '07120', 'Son Sardina', 'Palma', 'Mallorca', '971439119', '971439553', 'ceipmariaantoniasalva@educaib.eu', NULL, NULL, 32, 1, 38),
(343, 130, 'pública', 'CEIP', '07002348', 'CEIP Maria de la Salut', 'C/ de l\'Escola de Nins s/n  ', '07519', 'Maria de la Salut', 'Maria de la Salut', 'Mallorca', '971525083', '971525252', 'ceipmariadelasalut@educaib.eu', NULL, NULL, 7, 1, 32),
(344, 779, 'pública', 'CEIP', '07015021', 'CEIP Maria Lluïsa Serra', 'Camí d\'en Guixo s/n  ', '07702', 'Maó', 'Maó', 'Menorca', '971362658', NULL, 'ceipmarialluisaserra@educaib.eu', NULL, NULL, 8, 2, 34),
(345, 216, 'pública', 'CEIP', '07003821', 'CEIP Marian Aguiló', 'C/ de Salvador Dalí 15  ', '07011', 'Palma', 'Palma', 'Mallorca', '971286621', '971286621', 'ceipmarianaguilo@educaib.eu', NULL, NULL, 1, 1, 38),
(346, 217, 'pública', 'CEIP', '07006378', 'CEIP Mateu Fontirroig', 'Av. de Vives Llull 1  ', '07703', 'Maó', 'Maó', 'Menorca', '971365011', '971355625', 'ceipmateufontirroig@educaib.eu', NULL, NULL, 16, 2, 34),
(347, 219, 'pública', 'CEIP', '07005295', 'CEIP Melcior Rosselló i Simonet', 'Camí del Cementiri s/n (carretera comarcal PM-301)', '07320', 'Santa Maria del Camí', 'Santa Maria del Camí', 'Mallorca', '971621547', '971621256', 'ceipmelciorrossello@educaib.eu', NULL, NULL, 2, 1, 53),
(348, 220, 'pública', 'CEIP', '07000467', 'CEIP Mestre Colom', 'C/ de Nunyo Sanç 9  ', '07110', 'Bunyola', 'Bunyola', 'Mallorca', '971613814', '971148221', 'ceipmestrecolom@educaib.eu', NULL, NULL, 24, 1, 10),
(349, 639, 'pública', 'CEIP', '07013632', 'CEIP Mestre Duran', 'C/ des Migjorn s/n  ', '07730', 'Alaior', 'Alaior', 'Menorca', '971371055', '971378879', 'ceipmestreduran@educaib.eu', NULL, NULL, 18, 2, 69),
(350, 221, 'pública', 'CEIP', '07005003', 'CEIP Mestre Guillem Galmés', 'C/ de les Escoles 57  ', '07530', 'Sant Llorenç des Cardassar', 'Sant Llorenç des Cardassar', 'Mallorca', '971569483', '971569829', 'ceipmestreguillemgalmes@educaib.eu', NULL, NULL, 33, 1, 48),
(351, 222, 'pública', 'CEIP', '07005076', 'CEIP Mestre Guillemet', 'C/ de Josep Balaguer s/n  ', '07142', 'Santa Eugènia', 'Santa Eugènia', 'Mallorca', '971144244', '971144244', 'ceipmestreguillemet@educaib.eu', NULL, NULL, 2, 1, 50),
(352, 223, 'pública', 'CEIP', '07007644', 'CEIP Mestre Lluís Andreu', 'Av. de Porto Saler s/n  ', '07860', 'Sant Francesc de Formentera', 'Formentera', 'Formentera', '971322497', '971322497', 'ceipmestrelluisandreu@educaib.eu', NULL, NULL, 36, 4, 23),
(353, 224, 'pública', 'CEIP', '07002300', 'CEIP Mestre Pere Garau', 'C/ de l\'Escola s/n  ', '07509', 'Son Macià', 'Manacor', 'Mallorca', '971551762', '971551762', 'ceipmestreperegarau@educaib.eu', NULL, NULL, 19, 1, 30),
(354, 225, 'pública', 'CEIP', '07006184', 'CEIP Migjorn', 'Ctra. de Santanyí 123  ', '07208', 'Cas Concos d\'es Cavaller', 'Felanitx', 'Mallorca', '971842252', '971842490', 'ceipmigjorn@educaib.eu', NULL, NULL, 27, 1, 21),
(355, 227, 'pública', 'CEIP', '07004461', 'CEIP Miquel Capllonch', 'C/ de Vicent Buades 13  ', '07470', 'Port de Pollença', 'Pollença', 'Mallorca', '971866591', '971866591', 'ceipmiquelcapllonch@educaib.eu', NULL, NULL, 5, 1, 40),
(356, 228, 'pública', 'CEIP', '07002464', 'CEIP Miquel Costa i Llobera', 'Ctra. de Pòrtol s/n  ', '07141', 'Pòrtol', 'Marratxí', 'Mallorca', '971603130', '971603130', 'ceipmiquelcostaillobera.portol@educaib.eu', NULL, NULL, 22, 1, 33),
(357, 230, 'pública', 'CEIP', '07002919', 'CEIP Miquel Costa i Llobera', 'C/ de General Riera 61  ', '07010', 'Palma', 'Palma', 'Mallorca', '971755169', '971755169', 'ceipmiquelcostaillobera.palma@educaib.eu', NULL, NULL, 32, 1, 38),
(358, 229, 'pública', 'CEIP', '07006317', 'CEIP Miquel Costa i Llobera', 'C/ de Sor Cifre de Colonya s/n  ', '07460', 'Pollença', 'Pollença', 'Mallorca', '971531020', '971532154', 'ceipmiquelcostaillobera.pollenca@educaib.eu', NULL, NULL, 5, 1, 40),
(359, 591, 'pública', 'CEIP', '07013644', 'CEIP Miquel Duran i Saurina', 'C/ de Severa de Madariaga 145  ', '07300', 'Inca', 'Inca', 'Mallorca', '971505258', '971505893', 'ceipmiquelduranisaurina@educaib.eu', NULL, NULL, 35, 1, 25),
(360, 231, 'pública', 'CEIP', '07002865', 'CEIP Miquel Porcel', 'Camí de Son Cladera 1  ', '07009', 'Palma', 'Palma', 'Mallorca', '971471520', '971471520', 'ceipmiquelporcel@educaib.eu', NULL, NULL, 2, 1, 38),
(361, 232, 'pública', 'CEIP', '07007097', 'CEIP Mitjà de Mar', 'C/ d\'Estribord s/n  ', '07680', 'Porto Cristo', 'Manacor', 'Mallorca', '971821975', '971821975', 'ceipmitjademar@educaib.eu', NULL, NULL, 33, 1, 30),
(362, 641, 'pública', 'CEIP', '07013863', 'CEIP Molí d\'en Xema', 'Pg. del Ferrocarril s/n  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971843865', '971843865', 'ceipmolidenxema@educaib.eu', NULL, NULL, 19, 1, 30),
(363, 233, 'pública', 'CEIP', '07002324', 'CEIP Montaura', 'C/ de Salvador Beltran s/n  ', '07312', 'Mancor de la Vall', 'Mancor de la Vall', 'Mallorca', '971505991', '971505991', 'ceipmontaura@educaib.eu', NULL, NULL, 6, 1, 31),
(364, 234, 'pública', 'CEIP', '07006688', 'CEIP Na Caragol', 'C/ de Pere Amorós Esteva 2  ', '07570', 'Artà', 'Artà', 'Mallorca', '971835841', '971836019', 'ceipnacaragol@educaib.eu', NULL, NULL, 33, 1, 6),
(365, 235, 'pública', 'CEIP', '07007334', 'CEIP Na Penyal', 'C/ dels Afores s/n  ', '07560', 'Cala Millor', 'Son Servera', 'Mallorca', '971587595', '971587514', 'ceipnapenyal@educaib.eu', NULL, NULL, 33, 1, 59),
(366, 319, 'pública', 'CEIP', '07000911', 'CEIP Nadal Campaner Arrom', 'C/ de Rafel Horrach s/n  ', '07144', 'Costitx', 'Costitx', 'Mallorca', '971876036', '971876036', 'ceipnadalcampanerarrom@educaib.eu', NULL, NULL, 7, 1, 16),
(367, 236, 'pública', 'CEIP', '07006330', 'CEIP Nicolau Calafat', 'C/ dels Ametllers s/n  ', '07170', 'Valldemossa', 'Valldemossa', 'Mallorca', '971612364', '971612364', 'ceipnicolaucalafat@educaib.eu', NULL, NULL, 24, 1, 60),
(368, 237, 'pública', 'CEIP', '07007361', 'CEIP Norai', 'C/ de Balears 12  ', '07400', 'Port d\'Alcúdia', 'Alcúdia', 'Mallorca', '971547651', '971546880', 'ceipnorai@educaib.eu', NULL, NULL, 3, 1, 2),
(369, 238, 'pública', 'CEIP', '07007073', 'CEIP Nostra Senyora de Jesús', 'C/ de ses Vinyes 10  ', '07819', 'Nostra Senyora de Jesús', 'Santa Eulària des Riu', 'Eivissa', '971315968', '971315968', 'ceipnsdejesus@educaib.eu', NULL, NULL, 4, 3, 51),
(370, 862, 'pública', 'CEIP', '07015641', 'CEIP Nou d\'Inca', 'Av. del Raiguer s/n  ', '07300', 'Inca', 'Inca', 'Mallorca', NULL, NULL, 'ceipponent@educaib.eu', '0000-00-00', NULL, 35, 1, 25),
(371, 743, 'pública', 'CEIP', '07014910', 'CEIP Nou de Campos', 'C/ de Cabrera s/n  ', '07630', 'Campos', 'Campos', 'Mallorca', '971652194', '971652194', 'ceipjoanvenyiclar@educaib.eu', NULL, NULL, 29, 1, 13),
(372, 870, 'pública', 'CEIP', '07015781', 'CEIP Nou de sa Pobla', 'C/ de Traginers s/n  ', '07420', 'Sa Pobla', 'Sa Pobla', 'Mallorca', '601988187', '971862466', 'ceipnoudesapobla@educaib.eu', '0000-00-00', NULL, 21, 1, 68),
(373, 270, 'pública', 'CEIP', '07013358', 'CEIP Nova Cabana', 'C/ del Gladiol s/n  ', '07141', 'Es Pont d\'Inca', 'Marratxí', 'Mallorca', '971607992', '971600740', 'ceipnovacabana@educaib.eu', NULL, NULL, 22, 1, 33),
(374, 241, 'pública', 'CEIP', '07000157', 'CEIP Pare Bartomeu Pou', 'C/ de la Ribera 37  ', '07210', 'Algaida', 'Algaida', 'Mallorca', '971665348', '971125429', 'ceipparebartomeupou@educaib.eu', NULL, NULL, 30, 1, 3),
(375, 640, 'pública', 'CEIP', '07013735', 'CEIP Pedra Viva', 'Camí de Pedaç s/n  ', '07350', 'Binissalem', 'Binissalem', 'Mallorca', '971886657', '971886712', 'ceippedraviva@educaib.eu', NULL, NULL, 5, 1, 8),
(376, 242, 'pública', 'CEIP', '07000868', 'CEIP Pere Casasnovas', 'Camí Vell s/n  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971382762', '971382762', 'ceipperecasasnovas@educaib.eu', NULL, NULL, 16, 2, 62),
(377, 243, 'pública', 'CEIP', '07006287', 'CEIP Pere Cerdà', 'C/ del Canonge Oliver 12  ', '07108', 'Port de Sóller', 'Sóller', 'Mallorca', '971630101', '971630101', 'ceipperecerda@educaib.eu', NULL, NULL, 20, 1, 58),
(378, 277, 'pública', 'CEIP', '07000029', 'CEIP Pere Rosselló Oliver', 'C/ de Pere Rosselló i Oliver 46  ', '07340', 'Alaró', 'Alaró', 'Mallorca', '971518014', '971518014', 'ceippererossellooliver@educaib.eu', NULL, NULL, 32, 1, 1),
(379, 245, 'pública', 'CEIP', '07007701', 'CEIP Pintor Torrent', 'C/ del Pintor Torrent s/n  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971383800', '971384773', 'ceippintortorrent@educaib.eu', NULL, NULL, 18, 2, 62),
(380, 246, 'pública', 'CEIP', '07007279', 'CEIP Poeta Villangómez', 'C/ de Felip Curtois i Valls s/n (Cas Serres)', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971307535', '971307535', 'ceippoetavillangomez@educaib.eu', NULL, NULL, 11, 3, 63),
(381, 249, 'pública', 'CEIP', '07000108', 'CEIP Porta des Moll', 'Pl. de Carles V 9  ', '07400', 'Alcúdia', 'Alcúdia', 'Mallorca', '971545367', '971549688', 'ceipportadesmoll@educaib.eu', NULL, NULL, 3, 1, 2),
(382, 250, 'pública', 'CEIP', '07001289', 'CEIP Portal Nou', 'C/ de Madrid s/n  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971191154', '971191154', 'ceipportalnou@educaib.eu', NULL, NULL, 11, 3, 63),
(383, 254, 'pública', 'CEIP', '07005091', 'CEIP Puig d\'en Valls', 'C/ del Puig d\'en Valls s/n  ', '07800', 'Puig d\'en Valls', 'Santa Eulària des Riu', 'Eivissa', '971315427', '971315427', 'ceippuigdenvalls@educaib.eu', NULL, NULL, 4, 3, 51),
(384, 251, 'pública', 'CEIP', '07004621', 'CEIP Puig de na Fàtima', 'Camí de sa Vela 65  ', '07194', 'Puigpunyent', 'Puigpunyent', 'Mallorca', '971614215', '971614215', 'ceippuigdenafatima@educaib.eu', NULL, NULL, 20, 1, 42),
(385, 252, 'pública', 'CEIP', '07007048', 'CEIP Puig de sa Ginesta', 'Av. de Son Pillo 3  ', '07180', 'Santa Ponça', 'Calvià', 'Mallorca', '971699093', '971699093', 'ceippuigdesaginesta@educaib.eu', NULL, NULL, 28, 1, 11),
(386, 253, 'pública', 'CEIP', '07008466', 'CEIP Puig de sa Morisca', 'Av. del Puig de sa Morisca s/n  ', '07180', 'Santa Ponça', 'Calvià', 'Mallorca', '971699247', '971699247', 'ceippuigdesamorisca@educaib.eu', NULL, NULL, 28, 1, 11),
(387, 855, 'pública', 'CEIP', '07015653', 'CEIP Puig de Sant Martí', 'Av. de Suècia 3  ', '07400', 'Port d\'Alcúdia', 'Alcúdia', 'Mallorca', '606521824', NULL, 'ceippuigdesantmarti@educaib.eu', '0000-00-00', NULL, 3, 1, 2),
(388, 255, 'pública', 'CEIP', '07007310', 'CEIP Punta de n\'Amer', 'C/ de les Roselles s/n  ', '07560', 'Sa Coma', 'Sant Llorenç des Cardassar', 'Mallorca', '971810097', '971810097', 'ceippuntadenamer@educaib.eu', NULL, NULL, 33, 1, 48),
(389, 256, 'pública', 'CEIP', '07005982', 'CEIP Rafal Nou', 'C/ de Selva 11  ', '07008', 'Palma', 'Palma', 'Mallorca', '971476991', '971473521', 'ceiprafalnou@educaib.eu', NULL, NULL, 2, 1, 38),
(390, 257, 'pública', 'CEIP', '07003213', 'CEIP Rafal Vell', 'C/ d\'Indalecio Prieto 50  ', '07008', 'Palma', 'Palma', 'Mallorca', '971473247', '971470618', 'ceiprafalvell@educaib.eu', NULL, NULL, 17, 1, 38),
(391, 258, 'pública', 'CEIP', '07002841', 'CEIP Rei Jaume I', 'Pl. de sa Feixina 1  ', '07011', 'Palma', 'Palma', 'Mallorca', '971731339', '971220043', 'ceipreijaumei@educaib.eu', NULL, NULL, 1, 1, 38),
(392, 259, 'pública', 'CEIP', '07001745', 'CEIP Rei Jaume III', 'Pl. de Rufino Carpena s/n  ', '07620', 'Llucmajor', 'Llucmajor', 'Mallorca', '971660555', '971120062', 'ceipreijaumeiii@educaib.eu', NULL, NULL, 30, 1, 29),
(393, 260, 'pública', 'CEIP', '07005921', 'CEIP Reina Sofia', 'C/ de la Rectoria 21  ', '07669', 'S\'Horta', 'Felanitx', 'Mallorca', '971837188', '971837188', 'ceipreinasofia@educaib.eu', NULL, NULL, 27, 1, 21),
(394, 261, 'pública', 'CEIP', '07000935', 'CEIP Robert Graves', 'Camí des Vinyet s/n  ', '07179', 'Deià', 'Deià', 'Mallorca', '971639489', '971639489', 'ceiprobertgraves@educaib.eu', NULL, NULL, 24, 1, 17),
(395, 239, 'pública', 'CEIP', '07000388', 'CEIP Robines', 'Camí de s\'Aigua 38  ', '07350', 'Binissalem', 'Binissalem', 'Mallorca', '971512102', '971511604', 'ceiprobines@educaib.eu', NULL, NULL, 5, 1, 8),
(396, 272, 'pública', 'CEIP', '07005532', 'CEIP Rodamilans', 'C/ dels Bous 18  ', '07510', 'Sineu', 'Sineu', 'Mallorca', '971520226', '971520930', 'ceiprodamilans@educaib.eu', NULL, NULL, 7, 1, 57),
(397, 262, 'pública', 'CEIP', '07006524', 'CEIP Rosa dels Vents', 'C/ dels Vivers 16  ', '07579', 'Colònia de Sant Pere', 'Artà', 'Mallorca', '971589242', '971589242', 'ceiprosadelsvents@educaib.eu', NULL, NULL, 33, 1, 6),
(398, 273, 'pública', 'CEIP', '07007826', 'CEIP S\'Albufera', 'C/ d\'Antoni Maria Alcover 2  ', '07400', 'Port d\'Alcúdia', 'Alcúdia', 'Mallorca', '971546332', '971897211', 'ceipsalbufera@educaib.eu', NULL, NULL, 3, 1, 2),
(399, 274, 'pública', 'CEIP', '07001681', 'CEIP S\'Algar', 'C/ de Sant Bartomeu s/n  ', '07600', 'S\'Arenal', 'Llucmajor', 'Mallorca', '971443309', '971441872', 'ceipsalgar.sarenal@educaib.eu', NULL, NULL, 14, 1, 29),
(400, 275, 'pública', 'CEIP', '07006275', 'CEIP S\'Algar', 'Ctra. de Felanitx - Portocolom s/n  ', '07670', 'Portocolom', 'Felanitx', 'Mallorca', '971824758', '971824758', 'ceipsalgar.portocolom@educaib.eu', NULL, NULL, 27, 1, 21),
(401, 276, 'pública', 'CEIP', '07000716', 'CEIP S\'Alzinar', 'C/ de les Dones de la Llata s/n  ', '07580', 'Capdepera', 'Capdepera', 'Mallorca', '971563085', '971564252', 'ceipsalzinar@educaib.eu', NULL, NULL, 31, 1, 14),
(402, 294, 'pública', 'CEIP', '07004114', 'CEIP S\'Aranjassa', 'Ctra. Militar s/n  ', '07199', 'S\'Aranjassa', 'Palma', 'Mallorca', '971742853', '971742853', 'ceipsaranjassa@educaib.eu', NULL, NULL, 25, 1, 38),
(403, 295, 'pública', 'CEIP', '07006354', 'CEIP S\'Auba', 'Av. de Floreal 37  ', '07590', 'Cala Ratjada', 'Capdepera', 'Mallorca', '971564275', '971564116', 'ceipsauba@educaib.eu', NULL, NULL, 31, 1, 14),
(404, 303, 'pública', 'CEIP', '07008752', 'CEIP S\'Hort des Fassers', 'C/ de l\'Eclipsi s/n  ', '07400', 'Alcúdia', 'Alcúdia', 'Mallorca', '971897375', '971897376', 'ceipshortdesfassers@educaib.eu', NULL, NULL, 3, 1, 2),
(405, 305, 'pública', 'CEIP', '07007723', 'CEIP S\'Olivar', 'C/ d\'Alfonso XIII 10  ', '07316', 'Moscari', 'Selva', 'Mallorca', '971875158', '971875158', 'ceipsolivar@educaib.eu', NULL, NULL, 6, 1, 55),
(406, 306, 'pública', 'CEIP', '07013048', 'CEIP S\'Olivera', 'Fca. de s\'Olivera s/n  ', '07800', 'Puig d\'en Valls', 'Santa Eulària des Riu', 'Eivissa', '971190547', '971190547', 'ceipsolivera@educaib.eu', NULL, NULL, 10, 3, 51),
(407, 263, 'pública', 'CEIP', '07006366', 'CEIP Sa Blanca Dona', 'Ctra. de Sant Antoni PK 1,2  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971314668', '971314668', 'ceipsablancadona@educaib.eu', NULL, NULL, 10, 3, 63),
(408, 264, 'pública', 'CEIP', '07001307', 'CEIP Sa Bodega', 'C/ de Josep Riquer Llobet 13  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971301996', '971306659', 'ceipsabodega@educaib.eu', NULL, NULL, 4, 3, 63),
(409, 265, 'pública', 'CEIP', '07006551', 'CEIP Sa Casa Blanca', 'Pl. dels Molins de Vent 6  ', '07199', 'Sa Casa Blanca', 'Palma', 'Mallorca', '971427269', '971427269', 'ceipsacasablanca@educaib.eu', NULL, NULL, 25, 1, 38),
(410, 780, 'pública', 'CEIP', '07014156', 'CEIP Sa Garriga', 'C/ de Teresa Pons Cardona s/n  ', '07710', 'Sant Lluís', 'Sant Lluís', 'Menorca', '971151993', NULL, 'ceipsagarriga@educaib.eu', NULL, NULL, 8, 2, 49),
(411, 266, 'pública', 'CEIP', '07001277', 'CEIP Sa Graduada', 'Av. d\'Abel Matutes Juan 1  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971194484', '971193580', 'ceipsagraduada.eivissa@educaib.eu', NULL, NULL, 11, 3, 63),
(412, 268, 'pública', 'CEIP', '07001824', 'CEIP Sa Graduada', 'Av. de Josep Maria Quadrado 12  ', '07703', 'Maó', 'Maó', 'Menorca', '971360430', '971360430', 'ceipsagraduada.mao@educaib.eu', NULL, NULL, 8, 2, 34),
(413, 267, 'pública', 'CEIP', '07004576', 'CEIP Sa Graduada', 'C/ dels Fadrins s/n  ', '07420', 'Sa Pobla', 'Sa Pobla', 'Mallorca', '971540148', '971541040', 'ceipsagraduada.sapobla@educaib.eu', NULL, NULL, 21, 1, 68),
(414, 269, 'pública', 'CEIP', '07004163', 'CEIP Sa Indioteria', 'C/ del Gremi dels Tintorers 2  ', '07009', 'Sa Indioteria', 'Palma', 'Mallorca', '971430095', '971430095', 'ceipsaindioteria@educaib.eu', NULL, NULL, 2, 1, 38),
(415, 642, 'pública', 'CEIP', '07013577', 'CEIP Sa Joveria', 'C/ de la Corona 14-16  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971312944', NULL, 'ceipsajoveria@educaib.eu', NULL, NULL, 4, 3, 63),
(416, 592, 'pública', 'CEIP', '07013553', 'CEIP Sa Marina de Llucmajor', 'C/ de Sant Isidre Llaurador s/n  ', '07620', 'Llucmajor', 'Llucmajor', 'Mallorca', '971661096', '971120383', 'ceipsamarinadellucmajor@educaib.eu', NULL, NULL, 30, 1, 29),
(417, 348, 'pública', 'CEIP', '07002245', 'CEIP Sa Torre', 'C/ de Rosselló 3  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971550303', '971550303', 'ceipsatorre@educaib.eu', NULL, NULL, 19, 1, 30),
(418, 590, 'pública', 'CEIP', '07013565', 'CEIP Sant Antoni de Portmany', 'C/ des Corb Marí s/n  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '971933048', '971933048', 'ceipsantantoni@educaib.eu', NULL, NULL, 11, 3, 44),
(419, 278, 'pública', 'CEIP', '07006202', 'CEIP Sant Carles', 'Ctra. de Sant Carles s/n  ', '07850', 'Sant Carles de Peralta', 'Santa Eulària des Riu', 'Eivissa', '971335068', '971355068', 'ceipsantcarles@educaib.eu', NULL, NULL, 36, 3, 51),
(420, 279, 'pública', 'CEIP', '07005192', 'CEIP Sant Ciriac', 'Camí del Puig de Missa s/n  ', '07840', 'Santa Eulària des Riu', 'Santa Eulària des Riu', 'Eivissa', '971331200', '971331200', 'ceipsantciriac@educaib.eu', NULL, NULL, 11, 3, 51),
(421, 280, 'pública', 'CEIP', '07007784', 'CEIP Sant Domingo', 'C/ de Sant Domingo s/n  ', '07690', 'Es Llombards', 'Santanyí', 'Mallorca', '971163143', '971163143', 'ceipsantdomingo@educaib.eu', NULL, NULL, 17, 1, 54),
(422, 281, 'pública', 'CEIP', '07001186', 'CEIP Sant Ferran de ses Roques', 'C/ de la Mestra Maria Mayans Ferrer s/n  ', '07871', 'Sant Ferran de ses Roques', 'Formentera', 'Formentera', '971328700', '971328700', 'ceipsantferran@educaib.eu', NULL, NULL, 36, 4, 23),
(423, 282, 'pública', 'CEIP', '07004102', 'CEIP Sant Jordi', 'Pl. del Bisbe Planas s/n  ', '07199', 'Sant Jordi', 'Palma', 'Mallorca', '971742286', '971742904', 'ceipsantjordi.mallorca@educaib.eu', NULL, NULL, 25, 1, 38),
(424, 283, 'pública', 'CEIP', '07004825', 'CEIP Sant Jordi', 'Ctra. de l\'Aeroport s/n  ', '07817', 'Sant Jordi de ses Salines', 'Sant Josep de sa Talaia', 'Eivissa', '971395167', '971395167', 'ceipsantjordi.eivissa@educaib.eu', NULL, NULL, 4, 3, 47),
(425, 284, 'pública', 'CEIP', '07005064', 'CEIP Sant Lluís', 'C/ d\'Allemand 122  ', '07710', 'Sant Lluís', 'Sant Lluís', 'Menorca', '971151006', '971151006', 'ceipsantlluis@educaib.eu', NULL, NULL, 8, 2, 49),
(426, 285, 'pública', 'CEIP', '07006706', 'CEIP Sant Mateu de Baix', 'Ctra. de Santa Gertrudis PK 6  ', '07816', 'Sant Mateu d\'Albarca', 'Sant Antoni de Portmany', 'Eivissa', '971805022', '971805022', 'ceipsantmateudebaix@educaib.eu', NULL, NULL, 10, 3, 44),
(427, 286, 'pública', 'CEIP', '07006329', 'CEIP Sant Miquel', 'C/ de s\'Estació 8  ', '07540', 'Son Carrió', 'Sant Llorenç des Cardassar', 'Mallorca', '971569155', '971569155', 'ceipsantmiquel@educaib.eu', NULL, NULL, 33, 1, 48),
(428, 287, 'pública', 'CEIP', '07004710', 'CEIP Sant Rafel', 'Ctra. de Sant Antoni PK 10  ', '07816', 'Sant Rafel de sa Creu', 'Sant Antoni de Portmany', 'Eivissa', '971198062', '971198062', 'ceipsantrafel@educaib.eu', NULL, NULL, 11, 3, 44),
(429, 288, 'pública', 'CEIP', '07004734', 'CEIP Santa Agnès de Corona', 'Ctra. de Corona PK 11,5  ', '07828', 'Santa Agnès de Corona', 'Sant Antoni de Portmany', 'Eivissa', '971805021', '971805570', 'ceipsantaagnes@educaib.eu', NULL, NULL, 10, 3, 44),
(430, 289, 'pública', 'CEIP', '07002956', 'CEIP Santa Catalina', 'C/ de Caro 36  ', '07013', 'Palma', 'Palma', 'Mallorca', '971731801', '971454058', 'ceipsantacatalina@educaib.eu', NULL, NULL, 9, 1, 38),
(431, 290, 'pública', 'CEIP', '07007322', 'CEIP Santa Eulària', 'C/ de Margalida Ankermann s/n  ', '07840', 'Santa Eulària des Riu', 'Santa Eulària des Riu', 'Eivissa', '971331201', '971331201', 'ceipsantaeularia@educaib.eu', NULL, NULL, 11, 3, 51),
(432, 291, 'pública', 'CEIP', '07005234', 'CEIP Santa Gertrudis', 'Ctra. de Sant Miquel PK 10  ', '07814', 'Santa Gertrudis de Fruitera', 'Santa Eulària des Riu', 'Eivissa', '971197029', '971197029', 'ceipsantagertrudis@educaib.eu', NULL, NULL, 36, 3, 51),
(433, 292, 'pública', 'CEIP', '07002853', 'CEIP Santa Isabel', 'Pl. de Santa Isabel 1  ', '07005', 'Palma', 'Palma', 'Mallorca', '971273697', '971273697', 'ceipsantaisabel@educaib.eu', NULL, NULL, 34, 1, 38),
(434, 293, 'pública', 'CEIP', '07006937', 'CEIP Santa Maria del Mar', 'C/ de Sant Antoni s/n  ', '07660', 'Cala d\'Or', 'Santanyí', 'Mallorca', '971659514', '971659514', 'ceipsantamariadelmar@educaib.eu', NULL, NULL, 27, 1, 54),
(435, 353, 'pública', 'CEIP', '07000251', 'CEIP Ses Bassetes', 'C/ del Llaüt s/n  ', '07157', 'Port d\'Andratx', 'Andratx', 'Mallorca', '971671657', '971671657', 'ceipsesbassetes@educaib.eu', NULL, NULL, 12, 1, 4),
(436, 296, 'pública', 'CEIP', '07013221', 'CEIP Ses Cases Noves', 'C/ de Joan Pons i Marquès s/n  ', '07141', 'Es Pont d\'Inca', 'Marratxí', 'Mallorca', '971608180', '971600595', 'ceipsescasesnoves@educaib.eu', NULL, NULL, 22, 1, 33),
(437, 297, 'pública', 'CEIP', '07002257', 'CEIP Ses Comes', 'C/ de les Caravel·les 44  ', '07680', 'Porto Cristo', 'Manacor', 'Mallorca', '971820790', '971820790', 'ceipsescomes@educaib.eu', NULL, NULL, 33, 1, 30),
(438, 298, 'pública', 'CEIP', '07005601', 'CEIP Ses Marjades', 'Camí de ses Marjades s/n  ', '07100', 'Sóller', 'Sóller', 'Mallorca', '971633885', '971633885', 'ceipsesmarjades@educaib.eu', NULL, NULL, 20, 1, 58),
(439, 833, 'pública', 'CEIP', '07015537', 'CEIP Ses Planes', 'C/ de Sant Agustí 1  ', '07839', 'Sant Agustí des Vedrà', 'Sant Josep de sa Talaia', 'Eivissa', NULL, NULL, 'ceipsesplanes@educaib.eu', NULL, NULL, 10, 3, 47),
(440, 299, 'pública', 'CEIP', '07000509', 'CEIP Ses Quarterades', 'C/ de ses Quarterades s/n  ', '07184', 'Calvià', 'Calvià', 'Mallorca', '971670275', '971670757', 'ceipsesquarterades@educaib.eu', NULL, NULL, 28, 1, 11),
(441, 300, 'pública', 'CEIP', '07006573', 'CEIP Ses Roques', 'C/ de la Lluna 14  ', '07314', 'Caimari', 'Selva', 'Mallorca', '971515653', '971515653', 'ceipsesroques@educaib.eu', NULL, NULL, 6, 1, 55),
(442, 301, 'pública', 'CEIP', '07007516', 'CEIP Ses Rotes Velles', 'C/ de Sil 21  ', '07180', 'Santa Ponça', 'Calvià', 'Mallorca', '971691650', '971691539', 'ceipsesrotesvelles@educaib.eu', NULL, NULL, 28, 1, 11),
(443, 302, 'pública', 'CEIP', '07005490', 'CEIP Ses Salines', 'C/ de la Pau s/n  ', '07640', 'Ses Salines', 'Ses Salines', 'Mallorca', '971649172', '971649172', 'ceipsessalines@educaib.eu', NULL, NULL, 29, 1, 43),
(444, 307, 'pública', 'CEIP', '07006861', 'CEIP Son Anglada', 'C/ de Mossèn Gabriel Bestard 38  ', '07011', 'Sa Vileta', 'Palma', 'Mallorca', '971790016', '971790016', 'ceipsonanglada@educaib.eu', NULL, NULL, 23, 1, 38),
(445, 271, 'pública', 'CEIPIESO', '07013334', 'CEIPIESO Son Basca', 'C/ del Mestre Arabí 18', '07420', 'Sa Pobla', 'Sa Pobla', 'Mallorca', '971862344', '971862344', 'ceipsonbasca@educaib.eu', NULL, NULL, 21, 1, 68),
(446, 308, 'pública', 'CEIP', '07012998', 'CEIP Son Caliu', 'C/ de Saragossa 6  ', '07181', 'Palmanova', 'Calvià', 'Mallorca', '971134798', '971134949', 'ceipsoncaliu@educaib.eu', NULL, NULL, 1, 1, 11),
(447, 309, 'pública', 'CEIP', '07002968', 'CEIP Son Canals', 'C/ del Bisbe Cabanelles 25  ', '07005', 'Palma', 'Palma', 'Mallorca', '971277786', '971277786', 'ceipsoncanals@educaib.eu', NULL, NULL, 34, 1, 38),
(448, 310, 'pública', 'CEIP', '07007267', 'CEIP Son Ferrer', 'C/ de l\'Ocell del Paradís 113  ', '07181', 'Son Ferrer', 'Calvià', 'Mallorca', '971230017', '971238007', 'ceipsonferrer@educaib.eu', NULL, NULL, 23, 1, 11),
(449, 311, 'pública', 'CEIP', '07002683', 'CEIP Son Ferriol', 'C/ de Margalida Monlau 59  ', '07198', 'Son Ferriol', 'Palma', 'Mallorca', '971427903', '971427903', 'ceipsonferriol@educaib.eu', NULL, NULL, 29, 1, 38),
(450, 312, 'pública', 'CEIP', '07004862', 'CEIP Son Juny', 'Pg. de Joan Mas i Matas s/n  ', '07240', 'Sant Joan', 'Sant Joan', 'Mallorca', '971526251', '971858518', 'ceipsonjuny@educaib.eu', NULL, NULL, 7, 1, 45),
(451, 313, 'pública', 'CEIP', '07006007', 'CEIP Son Oliva', 'C/ de Tomás Luís de Victoria 9  ', '07004', 'Palma', 'Palma', 'Mallorca', '971292739', '971292739', 'ceipsonoliva@educaib.eu', NULL, NULL, 32, 1, 38),
(452, 314, 'pública', 'CEIP', '07013401', 'CEIP Son Pisà', 'C/ de Fèlix Escobar 3  ', '07013', 'Palma', 'Palma', 'Mallorca', '971730522', '971281047', 'ceipsonpisa@educaib.eu', NULL, NULL, 23, 1, 38),
(453, 316, 'pública', 'CEIP', '07012895', 'CEIP Son Rullan', 'C/ dels Pavellons de Son Rullan s/n  ', '07009', 'Palma', 'Palma', 'Mallorca', '971472202', '971472202', 'ceipsonrullan@educaib.eu', NULL, NULL, 2, 1, 38),
(454, 318, 'pública', 'CEIP', '07007000', 'CEIP Son Verí', 'C/ de Sa Dragonera 17  ', '07600', 'S\'Arenal', 'Llucmajor', 'Mallorca', '971442470', '971443493', 'ceipsonveri@educaib.eu', NULL, NULL, 14, 1, 29),
(455, 320, 'pública', 'CEIP', '07008031', 'CEIP Talaiot', 'C/ de l\'Anfós s/n  ', '07687', 'S\'Illot - Cala Morlanda', 'Manacor', 'Mallorca', '971811082', '971811082', 'ceiptalaiot@educaib.eu', NULL, NULL, 33, 1, 30),
(456, 321, 'pública', 'CEIP', '07006160', 'CEIP Torres de Balàfia', 'C/ de Sant Llorenç 3  ', '07812', 'Sant Llorenç de Balàfia', 'Sant Joan de Labritja', 'Eivissa', '971325032', '971325032', 'ceiptorresdebalafia@educaib.eu', NULL, NULL, 36, 3, 46),
(457, 322, 'pública', 'CEIP', '07001861', 'CEIP Tramuntana', 'Ctra. del Far de Favàritx s/n  ', '07701', 'Favàritx', 'Maó', 'Menorca', '971188214', '971188214', 'ceiptramuntana@educaib.eu', NULL, NULL, 16, 2, 34),
(458, 323, 'pública', 'CEIP', '07007887', 'CEIP Tresorer Cladera', 'C/ del Mercat 63  ', '07420', 'Sa Pobla', 'Sa Pobla', 'Mallorca', '971862086', '971542749', 'ceiptresorercladera@educaib.eu', NULL, NULL, 21, 1, 68),
(459, 324, 'pública', 'CEIP', '07013395', 'CEIP Urbanitzacions de Llucmajor', 'C/ del Tord 40 (urbanització Puig de Ros)', '07609', 'Badia Gran', 'Llucmajor', 'Mallorca', '971785353', '971785476', 'ceipurbanitzacionsdellucmajor@educaib.eu', NULL, NULL, 27, 1, 29);
INSERT INTO `centres` (`id`, `Ubi_Codi`, `Titularitat`, `Sigla`, `Codi`, `Centre`, `Adreca`, `CP`, `Localitat`, `Municipi`, `Illa`, `Telefon`, `Fax`, `email`, `Alta`, `Baixa`, `Inspector_id`, `id_illa`, `id_municipi`) VALUES
(460, 325, 'pública', 'CEIP', '07004631', 'CEIP Vara de Rey', 'C/ de Vara de Rey 32  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '971342021', '971342021', 'ceipvaraderey@educaib.eu', NULL, NULL, 11, 3, 44),
(461, 326, 'pública', 'CEIP', '07013206', 'CEIP Vénda d\'Arabí', 'Camí de Can Frígoles s/n  ', '07840', 'Santa Eulària des Riu', 'Santa Eulària des Riu', 'Eivissa', '971332829', '971319798', 'ceipvendadarabi@educaib.eu', NULL, NULL, 36, 3, 51),
(462, 327, 'pública', 'CEIP', '07002981', 'CEIP Verge de Lluc', 'C/ de Goya 1  ', '07009', 'Palma', 'Palma', 'Mallorca', '971444533', '971444533', 'ceipvergedelluc@educaib.eu', NULL, NULL, 2, 1, 38),
(463, 240, 'pública', 'CEIP', '07004564', 'CEIP Vialfàs', 'C/ del Renou 159  ', '07420', 'Sa Pobla', 'Sa Pobla', 'Mallorca', '971540648', '971862410', 'ceipvialfas@educaib.eu', NULL, NULL, 21, 1, 68),
(464, 328, 'pública', 'CEIP', '07005246', 'CEIP Vora Mar', 'C/ de Bona Vista 93  ', '07458', 'Can Picafort', 'Santa Margalida', 'Mallorca', '971850806', '971853049', 'ceipvoramar@educaib.eu', NULL, NULL, 34, 1, 52),
(465, 329, 'pública', 'CEIP', '07000546', 'CEIP Xaloc', 'C/ de Palmira s/n  ', '07160', 'Peguera', 'Calvià', 'Mallorca', '971687864', '971686953', 'ceipxaloc@educaib.eu', NULL, NULL, 12, 1, 11),
(466, 304, 'pública', 'CEIPIEEM', '07002026', 'CEIPIEEM Simó Ballester', 'Av. de Salvador Juan 20  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971551935', '971550260', 'ceipieemsimoballester@educaib.eu', NULL, NULL, 19, 1, 30),
(467, 317, 'pública', 'CEIPIEEM', '07005945', 'CEIPIEEM Son Serra', 'C/ de Maribel 48  ', '07013', 'Sa Vileta', 'Palma', 'Mallorca', '971798769', '971783005', 'ceipieemsonserra@educaib.eu', NULL, NULL, 12, 1, 38),
(468, 185, 'pública', 'CEIPIESO', '07003900', 'CEIPIESO Gabriel Vallseca', 'C/ de la Mare de Déu de la Victòria 36  ', '07008', 'Palma', 'Palma', 'Mallorca', '971243526', '971248321', 'ceipiesogabrielvallseca@educaib.eu', NULL, NULL, 17, 1, 38),
(469, 244, 'pública', 'CEIPIESO', '07006895', 'CEIPIESO Pintor Joan Miró', 'Av. de Mèxic 3  ', '07007', 'Palma', 'Palma', 'Mallorca', '971240869', '971244817', 'ceipiesopintorjoanmiro@educaib.eu', NULL, NULL, 30, 1, 38),
(470, 315, 'pública', 'CEIPIESO', '07004311', 'CEIPIESO Son Quint', 'C/ de Catalina March 4  ', '07013', 'Sa Vileta', 'Palma', 'Mallorca', '971792019', '971792019', 'ceipiesosonquint@educaib.eu', NULL, NULL, 12, 1, 38),
(471, 247, 'pública', 'CEIPIESO', '07001575', 'CEIPIESO Ponent', 'Av. del Raiguer s/n  ', '07300', 'Inca', 'Inca', 'Mallorca', '971503964', '971504454', 'ceipponent@educaib.eu', NULL, NULL, 35, 1, 25),
(472, 901, 'pública', 'CEP', '07016219', 'CEP CFIDFP Illes Balears', 'C/ de Blaise Pascual 3  bloc B local 8 (Parc Bit, Edifici Naorte) ', '07121', 'Palma', 'Palma', 'Mallorca', NULL, NULL, 'direccio@cfinfp.cat', '0000-00-00', NULL, 24, 1, 38),
(473, 898, 'pública', 'CEP', '07016207', 'CEP CFIRDE-IB', 'C/ de Gregorio Marañón s/n  ', '07007', 'Palma', 'Palma', 'Mallorca', NULL, NULL, 'mperellobeau@educaib.eu', '0000-00-00', NULL, 29, 1, 38),
(474, 98, 'pública', 'CEP', '07700027', 'CEP d\'Eivissa', 'V. Púnica 23  baixos dreta', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971300519', '971300351', 'cepeivissa@educaib.eu', NULL, NULL, 4, 3, 63),
(475, 100, 'pública', 'CEP', '07700209', 'CEP d\'Inca', 'C/ del Mestre Torrandell 59  ', '07300', 'Inca', 'Inca', 'Mallorca', '971507044', '971881052', 'cepinca@educaib.eu', NULL, NULL, 35, 1, 25),
(476, 861, 'pública', 'CEP', '07700349', 'CEP de Calvià', 'Pg. d\'Illetes 4  local 15-16', '07181', 'Ses Illetes', 'Calvià', 'Mallorca', '971594099', NULL, 'cepdecalvia@educaib.eu', '0000-00-00', NULL, 20, 1, 11),
(477, 99, 'pública', 'CEP', '07700234', 'CEP de Formentera', 'Av. de Porto Saler s/n  ', '07860', 'Sant Francesc de Formentera', 'Formentera', 'Formentera', '971322340', '971322258', 'cepformentera@educaib.eu', NULL, NULL, 36, 4, 23),
(478, 94, 'pública', 'CEP', '07700039', 'CEP de Manacor', 'Camí de Bendrís s/n  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971555912', '971843324', 'cepmanacor@educaib.eu', NULL, NULL, 19, 1, 30),
(479, 95, 'pública', 'CEP', '07700015', 'CEP de Menorca', 'C/ de Mallorca 67  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971384408', '971381014', 'cepmenorca@educaib.eu', NULL, NULL, 8, 2, 62),
(480, 889, 'pública', 'CEP', '07700386', 'CEP IBSTEAM', 'C/ de Gregorio Marañón s/n  ', '07007', 'Palma', 'Palma', 'Mallorca', '871002610', NULL, 'ibsteam@ibsteam.es', NULL, NULL, 29, 1, 38),
(481, 97, 'pública', 'CEP', '07700040', 'CEP Jaume Cañellas Mut', 'C/ de Gregorio Marañón s/n  ', '07007', 'Palma', 'Palma', 'Mallorca', '971420748', '971249532', 'ceppalma@educaib.eu', NULL, NULL, 29, 1, 38),
(482, 101, 'pública', 'CEPA', '07008247', 'CEPA Alcúdia', 'C/ de Bennàssar 8  ', '07400', 'Alcúdia', 'Alcúdia', 'Mallorca', '971548488', '971548488', 'cepaalcudia@educaib.eu', NULL, NULL, 22, 1, 2),
(483, 104, 'pública', 'CEPA', '07013279', 'CEPA Amanecer', 'Ctra. de Sóller PK 3 (centre penitenciari)', '07120', 'Palma', 'Palma', 'Mallorca', '971224200 ext. 2254', NULL, 'cepaamanecer@educaib.eu', NULL, NULL, 7, 1, 38),
(484, 647, 'pública', 'CEPA', '07008171', 'CEPA Artà', 'C/ de Pere Amorós Esteva 4  ', '07570', 'Artà', 'Artà', 'Mallorca', '971829300', '971829771', 'cepaarta@educaib.eu', NULL, NULL, 33, 1, 6),
(485, 102, 'pública', 'CEPA', '07008235', 'CEPA Calvià', 'Ctra. de la Porrassa 6  ', '07181', 'Magaluf', 'Calvià', 'Mallorca', '971131350', '971131625', 'cepacalvia@educaib.eu', NULL, NULL, 33, 1, 11),
(486, 103, 'pública', 'CEPA', '07008223', 'CEPA Camp Rodó', 'C/ de Joan Capó s/n  ', '07010', 'Palma', 'Palma', 'Mallorca', '971753158', '971751239', 'cepacamprodo@educaib.eu', NULL, NULL, 7, 1, 38),
(487, 105, 'pública', 'CEPA', '07007668', 'CEPA Pilar Benejam', 'C/ Mallorca 67 porta A 1r planta ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971386124', '971386124', 'cepaciutadella@educaib.eu', NULL, NULL, 16, 2, 62),
(488, 111, 'pública', 'CEPA', '07000649', 'CEPA Es Raiguer', 'C/ de l\'Escola Graduada 13  ', '07350', 'Binissalem', 'Binissalem', 'Mallorca', '971512157', NULL, 'cepaesraiguer@educaib.eu', NULL, NULL, 22, 1, 8),
(489, 106, 'pública', 'CEPA', '07007671', 'CEPA Francesc de Borja Moll', 'C/ de Llorenç Maria Duran 37  ', '07300', 'Inca', 'Inca', 'Mallorca', '971880535', '971501598', 'cepafrancescdeborjamoll@educaib.eu', NULL, NULL, 22, 1, 25),
(490, 107, 'pública', 'CEPA', '07007127', 'CEPA Joan Mir i Mir', 'C/ de Sant Joan 10  ', '07702', 'Maó', 'Maó', 'Menorca', '971364758', '971351498', 'cepajoanmirimir@educaib.eu', NULL, NULL, 16, 2, 34),
(491, 108, 'pública', 'CEPA', '07007693', 'CEPA La Balanguera', 'C/ de Rafael Rodríguez Méndez 14  ', '07011', 'Palma', 'Palma', 'Mallorca', '971730265', '971732971', 'cepalabalanguera@educaib.eu', NULL, NULL, 22, 1, 38),
(492, 109, 'pública', 'CEPA', '07007681', 'CEPA Llevant', 'Av. d\'Antoni Maura 57  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971844785', '971844819', 'cepallevant@educaib.eu', NULL, NULL, 19, 1, 30),
(493, 110, 'pública', 'CEPA', '07008181', 'CEPA es Pla', 'C/ de s\'Escorxador 2  ', '07250', 'Vilafranca de Bonany', 'Vilafranca de Bonany', 'Mallorca', '971832144', '971832151', 'cepaespla@educaib.eu', NULL, NULL, 19, 1, 61),
(494, 112, 'pública', 'CEPA', '07007115', 'CEPA Pitiüses', 'C/ de Canàries 12  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971305368', '971305368', 'cepapitiuses@educaib.eu', NULL, NULL, 11, 3, 63),
(495, 600, 'pública', 'CEPA', '07001757', 'CEPA S\'Arenal', 'C/ de Diego Zaforteza 7  ', '07600', 'S\'Arenal', 'Palma', 'Mallorca', '971263477', '971264789', 'cepasarenal@educaib.eu', NULL, NULL, 22, 1, 38),
(496, 649, 'pública', 'CEPA', '07013905', 'CEPA Sa Pobla', 'C/ de Sagasta s/n  ', '07420', 'Sa Pobla', 'Sa Pobla', 'Mallorca', '971542705', '971542705', 'cepasapobla@educaib.eu', NULL, NULL, 22, 1, 68),
(497, 650, 'pública', 'CEPA', '07008211', 'CEPA Sant Antoni', 'C/ de Cervantes 25A  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '971305368', '971348595', 'cepasantantoni@educaib.eu', NULL, NULL, 11, 3, 44),
(498, 113, 'pública', 'CEPA', '07006998', 'CEPA Son Canals', 'C/ de Son Canals 10  ', '07008', 'Palma', 'Palma', 'Mallorca', '971250479', '971250582', 'cepasoncanals@educaib.eu', NULL, NULL, 7, 1, 38),
(499, 648, 'pública', 'CEPA', '07013899', 'CEPA Sud', 'Camí des Rovellat s/n (finca na Llarga)', '07630', 'Campos', 'Campos', 'Mallorca', '971651942', NULL, 'cepasud@educaib.eu', NULL, NULL, 33, 1, 13),
(500, 815, 'pública', 'CEPA-Aula', '07015318', 'CEPA-Aula Alaior', 'C/ des Coll des Palmer 4  ', '07730', 'Alaior', 'Alaior', 'Menorca', NULL, NULL, 'cepajoanmirimir@educaib.eu', NULL, NULL, 16, 2, 69),
(501, 790, 'pública', 'CEPA-Aula', '07001265', 'CEPA-Aula Andratx', 'C/ d\'Alemany 3  ', '07150', 'Andratx', 'Andratx', 'Mallorca', '971131350', NULL, 'cepacalvia@educaib.eu', NULL, NULL, 33, 1, 4),
(502, 822, 'pública', 'CEPA-Aula', '07015392', 'CEPA-Aula Capdepera', 'C/ de l\'Agulla 50  ', '07590', 'Cala Ratjada', 'Capdepera', 'Mallorca', NULL, NULL, 'cepaarta@gmail.com', NULL, NULL, 33, 1, 14),
(503, 678, 'pública', 'CEPA-Aula', '07015483', 'CEPA-Aula Centre Penitenciari d\'Eivissa', 'Can Fita', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971300864', '971300653', 'cepapitiuses@educaib.eu', NULL, NULL, 11, 3, 63),
(504, 793, 'pública', 'CEPA-Aula', '07014168', 'CEPA-Aula Centre Penitenciari de Maó', 'Ctra. de Sant Lluís s/n  ', '07702', 'Maó', 'Maó', 'Menorca', '971364758', NULL, 'cepajoanmirimir@educaib.eu', NULL, NULL, 16, 2, 34),
(505, 816, 'pública', 'CEPA-Aula', '07015331', 'CEPA-Aula Es Castell', 'C/ de Biniatap s/n  ', '07720', 'Es Castell', 'Es Castell', 'Menorca', NULL, NULL, 'cepajoanmirimir@educaib.eu', NULL, NULL, 16, 2, 64),
(506, 818, 'pública', 'CEPA-Aula', '07015321', 'CEPA-Aula Es Mercadal', 'Rda. de ses Costes s/n  ', '07740', 'Es Mercadal', 'Es Mercadal', 'Menorca', NULL, NULL, 'escolaadults.esmercadal@gmail.com', NULL, NULL, 16, 2, 35),
(507, 819, 'pública', 'CEPA-Aula', '07015355', 'CEPA-Aula Es Migjorn Gran', 'Camí de sa Malagarba s/n  ', '07749', 'Es Migjorn Gran', 'Es Migjorn Gran', 'Menorca', NULL, NULL, 'escolaadults.esmigjorngran@gmail.com', NULL, NULL, 16, 2, 65),
(508, 674, 'pública', 'CEPA-Aula', '07000625', 'CEPA-Aula Felanitx', 'C/ de Salas 1  ', '07200', 'Felanitx', 'Felanitx', 'Mallorca', '971844785', NULL, 'cepasud@gmail.com', NULL, NULL, 33, 1, 21),
(509, 792, 'pública', 'CEPA-Aula', '07001046', 'CEPA-Aula Ferreries', 'Av. de Son Morera s/n (CEIP Castell de Santa Àgueda)', '07750', 'Ferreries', 'Ferreries', 'Menorca', '971386124', NULL, 'escolaadults.ferreries@gmail.com', NULL, NULL, 16, 2, 22),
(510, 820, 'pública', 'CEPA-Aula', '07015367', 'CEPA-Aula Formentera', 'Av. de Porto Saler s/n  ', '07860', 'Sant Francesc de Formentera', 'Formentera', 'Formentera', NULL, NULL, 'cepapitiuses@educaib.eu', NULL, NULL, 11, 4, 23),
(511, 821, 'pública', 'CEPA-Aula', '07015379', 'CEPA-Aula Muro', 'C/ de Joan Massanet 51  ', '07440', 'Muro', 'Muro', 'Mallorca', NULL, NULL, 'cepasapobla@educaib.eu', NULL, NULL, 22, 1, 37),
(512, 817, 'pública', 'CEPA-Aula', '07015343', 'CEPA-Aula Sant Lluís', 'C/ d\'Allemand 122  ', '07710', 'Sant Lluís', 'Sant Lluís', 'Menorca', NULL, NULL, 'cepajoanmirimir@educaib.eu', NULL, NULL, 16, 2, 49),
(513, 687, 'pública', 'CEPA-Aula', '07008201', 'CEPA-Aula Santa Eulària', 'C/ de Sant Josep 71  ', '07840', 'Santa Eulària des Riu', 'Santa Eulària des Riu', 'Eivissa', '971319500', NULL, 'cepapitiuses@educaib.eu', NULL, NULL, 11, 3, 51),
(514, 675, 'pública', 'CEPA-Aula', '07013917', 'CEPA-Aula Sóller', 'C/ de la Victòria s/n (centre parroquial Victòria)', '07100', 'Sóller', 'Sóller', 'Mallorca', '971634256', NULL, 'cepacamprodo@educaib.eu', NULL, NULL, 7, 1, 58),
(515, 791, 'pública', 'CEPA-Aula', '07008168', 'CEPA-Aula Son Servera', 'C/ de Sant Antoni 23  ', '07550', 'Son Servera', 'Son Servera', 'Mallorca', '971829300', NULL, 'cepaarta@gmail.com', NULL, NULL, 33, 1, 59),
(516, 745, 'pública', 'CIFP', '07014922', 'CIFP Can Marines', 'Ctra. de Sant Carles PK 8  ', '07840', 'Santa Eulària des Riu', 'Santa Eulària des Riu', 'Eivissa', '971339106', NULL, 'cifpcanmarines@educaib.eu', NULL, NULL, 11, 3, 51),
(517, 863, 'pública', 'CIFP', '07015720', 'CIFP Centre de la Mar', 'C/ de Ruiz i Pablo 13  ', '07702', 'Maó', 'Maó', 'Menorca', '971369000', '971354417', 'cifpcentredelamar@educaib.eu', '0000-00-00', NULL, 8, 2, 34),
(518, 455, 'pública', 'CIFP', '07015884', 'CIFP Francesc de Borja Moll', 'C/ de Caracas 6  ', '07007', 'Palma', 'Palma', 'Mallorca', '971278150', '971278155', 'cifpfrancescdeborjamoll@educaib.eu', NULL, NULL, 30, 1, 38),
(519, 463, 'pública', 'CIFP', '07013498', 'CIFP Joan Taix', 'C/ de Sagasta s/n  ', '07420', 'Sa Pobla', 'Sa Pobla', 'Mallorca', '971540008', '971862461', 'cifpjoantaix@educaib.eu', NULL, NULL, 21, 1, 68),
(520, 469, 'pública', 'CIFP', '07015872', 'CIFP Juníper Serra', 'Camí de Son Cladera 20  ', '07009', 'Palma', 'Palma', 'Mallorca', '971470774', '971706062', 'cifpjuniperserra@educaib.eu', NULL, NULL, 34, 1, 38),
(521, 915, 'pública', 'CIFP', '07016438', 'CIFP L\'Embat', 'C/ del Gremi dels Teixidors 33  ', '07009', 'Sa Indioteria', 'Palma', 'Mallorca', NULL, NULL, 'cifplembat@educaib.eu', '0000-00-00', NULL, 2, 1, 38),
(522, 601, 'pública', 'CIFP', '07013620', 'CIFP Nauticopesquera', 'Ctra. del Dic de l\'Oest s/n  ', '07015', 'Palma', 'Palma', 'Mallorca', '971700068', '971700967', 'cifpnauticopesquera@educaib.eu', NULL, NULL, 9, 1, 38),
(523, 480, 'pública', 'CIFP', '07015860', 'CIFP Pau Casesnoves', 'C/ de Joan Miró 22  ', '07300', 'Inca', 'Inca', 'Mallorca', '971881710', '971881713', 'cifppaucasesnoves@educaib.eu', NULL, NULL, 21, 1, 25),
(524, 925, 'pública', 'CIFP', '07016542', 'CIFP Pere de Son Gall', 'C/ de Gràcia 73  ', '07620', 'Llucmajor', 'Llucmajor', 'Mallorca', '971660052', '971660004', 'cifpperedesongall@educaib.eu', '0000-00-00', NULL, 30, 1, 29),
(525, 926, 'pública', 'CIFP', '07016530', 'CIFP Politècnic de Llevant', 'Camí de ses Tapareres 32  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971551489', '971844464', 'cifppolitecnicdellevant@educaib.eu', '0000-00-00', NULL, 19, 1, 30),
(526, 702, 'pública', 'CIFP', '07014703', 'CIFP Son Llebre', 'Camí de Son Llebre s/n  ', '07141', 'Es Pla de na Tesa', 'Marratxí', 'Mallorca', '971607432', '971607096', 'cifpsonllebre@educaib.eu', NULL, NULL, 24, 1, 33),
(527, 806, 'pública', 'CMM', '07015215', 'CMM Felanitx', 'C/ del Rector Planes 38  ', '07200', 'Felanitx', 'Felanitx', 'Mallorca', '971584455', NULL, 'musica@felanitx.org', NULL, NULL, 31, 1, 21),
(528, 864, 'pública', 'CMM', '07015732', 'CMM Inca', 'C/ d\'en Dureta s/n  ', '07300', 'Inca', 'Inca', 'Mallorca', '971881420', '971881420', 'emmat@incaciutat.com', '0000-00-00', NULL, 31, 1, 25),
(529, 399, 'pública', 'CMM', '07015598', 'CMM Manacor', 'C/ de sa Fàbrica 2  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971551115', '971551197', 'musica@manacor.org', NULL, NULL, 31, 1, 30),
(530, 117, 'pública', 'CMM', '07013425', 'CMM Palma', 'C/ dels Blanquers 2  ', '07001', 'Palma', 'Palma', 'Mallorca', '971719127', '971714388', 'conservatori@palma.es', NULL, NULL, 31, 1, 38),
(531, 160, 'pública', 'CP', '07002038', 'CP Es Canyar', 'C/ des Canyar s/n  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971550840', '971552369', 'cpescanyar@educaib.eu', NULL, NULL, 19, 1, 30),
(532, 805, 'privada', 'CPEPA', '07015185', 'CPEPA Escuela Politécnica Balear', 'Av. de l\'Arquitecte Gaspar Bennàzar 41  ', '07004', 'Palma', 'Palma', 'Mallorca', '971755530', NULL, 'info@escuelapolitecnica.es', NULL, NULL, 7, 1, 38),
(533, 827, 'privada', 'CPEPA', '07015422', 'CPEPA Estudi 6 Centre de Formació', 'C/ de Guillem Massot 54  ', '07003', 'Palma', 'Palma', 'Mallorca', '971498181', '971499082', 'estudi6@estudi6.com', NULL, NULL, 7, 1, 38),
(534, 1, 'privada', 'CPFP', '07013310', 'CPFP Academia Fleming', 'C/ de Jesús 15  ', '07003', 'Palma', 'Palma', 'Mallorca', '971295702', '971750439', 'secretaria@grupofleming.com', NULL, NULL, 9, 1, 38),
(535, 2, 'privada', 'CPFP', '07005647', 'CPFP ADEMA', 'C/ del Gremi dels Passamaners 11', '07009', 'Sa Indioteria', 'Palma', 'Mallorca', '971777131', '971771280', 'secretaria@cfpadema.com', NULL, NULL, 30, 1, 38),
(536, 795, 'privada', 'CPFP', '07015094', 'CPFP CEF, Escuela de Artes Audiovisuales', 'Pl. de Barcelona 17  ', '07011', 'Palma', 'Palma', 'Mallorca', '971718063', '971712404', 'info@cefmallorca.com', NULL, NULL, 31, 1, 38),
(537, 916, 'privada', 'CPFP', '07016505', 'CPFP Cesur Mallorca', 'Camí de Son Rapinya 12  ', '07013', 'Palma', 'Palma', 'Mallorca', '669119272', NULL, 'rocio.angulo@grupocoremsa.com', '0000-00-00', NULL, 24, 1, 38),
(538, 951, 'privada', 'CPFP', '07016840', 'CPFP Centro de Movilidad y Seguridad Vial', 'C/ Beatriu de Pinós 21', '07005', 'Palma', 'Palma', 'Mallorca', NULL, NULL, NULL, '0000-00-00', NULL, 2, 1, 38),
(539, 330, 'privada', 'CPFP', '07008651', 'CPFP Creu Roja', 'Av. de l\'Arquitecte Gaspar Bennàzar 73  ', '07004', 'Palma', 'Palma', 'Mallorca', '971295000', '971752689', 'baleares@cruzroja.es', NULL, NULL, 21, 1, 38),
(540, 803, 'privada', 'CPFP', '07015124', 'CPFP EDIB Formació Professional', 'V. de Portugal 1A  ', '07012', 'Palma', 'Palma', 'Mallorca', '971761808', '971721388', 'info@escuelaedib.com', NULL, NULL, 9, 1, 38),
(541, 914, 'privada', 'CPFP', '07016426', 'CPFP Escola CENETED', 'C/ de Sant Joan de la Salle 5  ', '07003', 'Palma', 'Palma', 'Mallorca', NULL, NULL, 'info@tecnicodeportivo.net', '0000-00-00', NULL, 35, 1, 38),
(542, 896, 'privada', 'CPFP', '07015914', 'CPFP Escola d\'Hoteleria de les Illes Balears', 'Ctra. de Valldemossa PK 7,5 (UIB, Edifici Arxiduc Lluís Salvador)', '07122', 'Palma', 'Palma', 'Mallorca', '971172608', '971172617', 'escola.hoteleria@uib.es', '0000-00-00', NULL, 24, 1, 38),
(543, 813, 'privada', 'CPFP', '07015288', 'CPFP ESERP Business School', 'C/ de Balmes 50  ', '07004', 'Palma', 'Palma', 'Mallorca', '971228108', '971713720', 'info@eserp.com', NULL, NULL, 5, 1, 38),
(544, 823, 'privada', 'CPFP', '07015409', 'CPFP Esment Escola Professional', 'Ptge. de Cala Figuera 10  ', '07009', 'Palma', 'Palma', 'Mallorca', '871805112', NULL, 'info@esmentescola.es', NULL, NULL, 2, 1, 38),
(545, 789, 'privada', 'CPFP', '07015082', 'CPFP Global Centre d\'Estudis', 'C/ de Pep Fuster 1  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971844989', NULL, 'formacio@globalmanacor.com', NULL, NULL, 19, 1, 30),
(546, 838, 'privada', 'CPFP', '07015461', 'CPFP LADAT Studios Centre de Formació', 'Ctra. de Valldemossa PK 7,4 (Parc Bit, Edifici Europa)', '07121', 'Palma', 'Palma', 'Mallorca', '971439801', NULL, 'ladat@uib.es', '0000-00-00', NULL, 9, 1, 38),
(547, 953, 'privada', 'CPFP', '07016827', 'CPFP María y José', 'C/ Volta de la Mercè, 4 baixos', '07002', 'Palma', 'Palma', 'Mallorca', '971726834', NULL, 'info@mariayjose.com', NULL, NULL, 34, 1, 38),
(548, 952, 'privada', 'CPFP', '07008806', 'CPFP ETB Felipe Moreno', 'C/ València 36', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971362266', NULL, 'info.menorca@etb-baleares.es', NULL, NULL, 8, 2, 62),
(549, 902, 'privada', 'CPFP', '07016244', 'CPFP Vila', 'C/ de Madrid 49  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', NULL, NULL, NULL, '0000-00-00', NULL, 11, 3, 63),
(550, 441, 'pública', 'CPIESO', '07007942', 'CPIESO Aurora Picornell', 'C/ de n\'Amer 46  ', '07007', 'Palma', 'Palma', 'Mallorca', '971420029', '971278503', 'cpiesoaurorapicornell@educaib.eu', NULL, NULL, 14, 1, 38),
(551, 120, 'pública', 'CPMD', '07008648', 'CPMD Eivissa i Formentera Catalina Bufí', 'Av. d\'Espanya 15  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971392253', '971399424', 'conservatorideivissaiformentera@ceif.info', NULL, NULL, 36, 3, 63),
(552, 119, 'pública', 'CPMD', '07006810', 'CPMD Mallorca', 'C/ d\'Alfons el Magnànim 64  ', '07004', 'Palma', 'Palma', 'Mallorca', '971763444', '971763189', 'conservatori@conservatoridemallorca.com', NULL, NULL, 31, 1, 38),
(553, 118, 'pública', 'CPMD', '07008119', 'CPMD Menorca', 'Pl. de la Miranda s/n (claustre del Carme)', '07701', 'Maó', 'Maó', 'Menorca', '971366370', '971360835', 'conservatoriprofessional.menorca@educaib.eu', NULL, NULL, 8, 2, 34),
(554, 121, 'pública', 'CSMD', '07008077', 'CSMD Illes Balears', 'C/ d\'Alfons el Magnànim 64  ', '07004', 'Palma', 'Palma', 'Mallorca', '971498935', '971498936', 'administracio@fesmae.com', NULL, NULL, 31, 1, 38),
(555, 423, 'pública', 'EA', '07004035', 'EA Escola d’Art de Mallorca', 'C/ de l\'Institut Balear 5  ', '07012', 'Palma', 'Palma', 'Mallorca', '971291577', '971760177', 'escoladartidisseny.palma@educaib.eu', NULL, NULL, 31, 1, 38),
(556, 377, 'pública', 'EA', '07001423', 'EA Eivissa', 'C/ del Riu Duero 5 (Can Cifre)', '07817', 'Sant Jordi de ses Salines', 'Sant Josep de sa Talaia', 'Eivissa', '971301228', '971391653', 'escoladart.eivissa@educaib.eu', NULL, NULL, 4, 3, 47),
(557, 950, 'pública', 'EA', '07016815', 'EA Escola Superior de Disseny de les Illes Balears', 'C/ de l’Institut Balear 5', '07012', 'Palma', 'Palma', 'Mallorca', '971290000', NULL, NULL, '0000-00-00', NULL, 31, 1, 38),
(558, 376, 'pública', 'EA', '07007188', 'EA Menorca', 'Av. de Josep Maria Quadrado 33  ', '07703', 'Maó', 'Maó', 'Menorca', '971350827', '971353044', 'escoladart.mao@educaib.eu', NULL, NULL, 16, 2, 34),
(559, 368, 'pública', 'EAP', '07700179', 'EAP Eivissa', 'V. Púnica 23  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971300324', '971300324', 'eapeivissa@educaib.eu', NULL, NULL, 4, 3, 63),
(560, 656, 'pública', 'EAP', '07700258', 'EAP Es Raiguer', 'C/ de Severo de Madariaga 145  ', '07300', 'Inca', 'Inca', 'Mallorca', '971507281', '971505893', 'eapraiguer@educaib.eu', NULL, NULL, 6, 1, 25),
(561, 728, 'pública', 'EAP', '07700301', 'EAP Formentera', 'Av. de Porto Saler s/n  ', '07860', 'Sant Francesc de Formentera', 'Formentera', 'Formentera', NULL, NULL, 'eapformentera@educaib.eu', NULL, NULL, 4, 4, 23),
(562, 655, 'pública', 'EAP', '07700246', 'EAP Llevant', 'Pg. d\'Antoni Maura 87  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971559067', '971843764', 'eapllevant@educaib.eu', NULL, NULL, 19, 1, 30),
(563, 886, 'pública', 'EAP', '07700374', 'EAP Mallorca Centre', 'Pl. d\'Andreu Torrens 4  ', '07320', 'Santa Maria del Camí', 'Santa Maria del Camí', 'Mallorca', NULL, NULL, 'eapmallorcacentre@educaib.eu', '0000-00-00', NULL, 2, 1, 53),
(564, 369, 'pública', 'EAP', '07700167', 'EAP Menorca', 'C/ de Mallorca 67  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971480501', '971484302', 'eapciutadella@educaib.eu', NULL, NULL, 18, 2, 62),
(565, 367, 'pública', 'EAP', '07700222', 'EAP Menorca (subseu Llevant-Maó)', 'C/ de Josep Maria Quadrado 33  ', '07703', 'Maó', 'Maó', 'Menorca', '971350471', NULL, 'eapmao@educaib.eu', NULL, NULL, 18, 2, 34),
(566, 659, 'pública', 'EAP', '07700283', 'EAP Nord (subseu des Raiguer)', 'Pl. de la Porta de Mallorca 3  ', '07400', 'Alcúdia', 'Alcúdia', 'Mallorca', NULL, NULL, 'eapnord@educaib.eu', NULL, NULL, 3, 1, 2),
(567, 903, 'pública', 'EAP', '07700398', 'EAP Palma I', 'C/ de Gregorio Marañón s/n  ', '07007', 'Palma', 'Palma', 'Mallorca', NULL, NULL, 'eappalma1@educaib.eu', '0000-00-00', NULL, 28, 1, 38),
(568, 904, 'pública', 'EAP', '07700404', 'EAP Palma II', 'C/ de Catalina March 4  ', '07013', 'Sa Vileta', 'Palma', 'Mallorca', '971240082', '971240168', 'eappalma2@educaib.eu', '0000-00-00', NULL, 28, 1, 38),
(569, 657, 'pública', 'EAP', '07700261', 'EAP Ponent', 'C/ dels Coloms 15  ', '07181', 'Magaluf', 'Calvià', 'Mallorca', '971100079', '971698417', 'eapponent@educaib.eu', NULL, NULL, 28, 1, 11),
(570, 658, 'pública', 'EAP', '07700271', 'EAP Sud', 'C/ de Francesc Moragues 35  ', '07620', 'Llucmajor', 'Llucmajor', 'Mallorca', '971662080', NULL, 'eapsud@educaib.eu', NULL, NULL, 30, 1, 29),
(571, 747, 'pública', 'EAP', '07700295', 'EAP Tramuntana (subseu de Ponent)', 'C/ de Mossèn Alcover 17  ', '07190', 'Esporles', 'Esporles', 'Mallorca', '971109073', NULL, 'eaptramuntana@educaib.eu', NULL, NULL, 28, 1, 19),
(572, 343, 'pública', 'EI', '07007772', 'EI Paula Torres', 'C/ de n\'Amer 53  ', '07007', 'Palma', 'Palma', 'Mallorca', '971248414', '971248414', 'eipaulatorres@educaib.eu', NULL, NULL, 14, 1, 38),
(573, 333, 'pública', 'EI', '07002233', 'EI Sa Graduada', 'Pg. d\'Antoni Maura 54  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971551937', '971552100', 'eisagraduada@educaib.eu', NULL, NULL, 19, 1, 30),
(574, 349, 'pública', 'EI', '07002002', 'EI Sant Climent', 'C/ de l\'Escola 1  ', '07712', 'Sant Climent', 'Maó', 'Menorca', '971153123', '971153123', 'eisantcliment@educaib.eu', NULL, NULL, 16, 2, 34),
(575, 872, 'pública', 'EI1', '07015823', 'EI1 Can Nebot', 'Finca de Can Nebot s/n  ', '07817', 'Sant Jordi de ses Salines', 'Sant Josep de sa Talaia', 'Eivissa', NULL, NULL, 'eicannebot@gmail.com', '0000-00-00', NULL, 4, 3, 47),
(576, 339, 'pública', 'EI1', '07013668', 'EI1 Francesc de Borja Moll', 'Camí Vell s/n  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971381862', NULL, 'eifrancescdeborjamoll@educaib.eu', NULL, NULL, 18, 2, 62),
(577, 340, 'pública', 'EI1', '07013681', 'EI1 Magdalena Humbert', 'Camí Dalt de Sant Joan s/n  ', '07701', 'Maó', 'Maó', 'Menorca', '971368519', '971361321', 'eimagdalenahumbert@educaib.eu', NULL, NULL, 18, 2, 34),
(578, 615, 'pública', 'EI1', '07013671', 'EI1 Verge de la Salut', 'Av. del General Riera 65  ', '07010', 'Palma', 'Palma', 'Mallorca', '971754750', '971758151', 'eivergedelasalut@educaib.eu', NULL, NULL, 35, 1, 38),
(579, 924, 'pública', 'EIEL', '07016475', 'EIEL Antoni Pons', 'C/. d\'Alfons XIII 10  ', '07316', 'Moscari', 'Selva', 'Mallorca', '971375440', NULL, 'secretaria@ajselva.net', '0000-00-00', NULL, 6, 1, 55),
(580, 646, 'pública', 'EIEL', '07013942', 'EIEL Arc de Sant Martí', 'C/ de Lepanto s/n  ', '07740', 'Es Mercadal', 'Es Mercadal', 'Menorca', '971375440', NULL, 'escoletainfantildesmercadal@yahoo.es', NULL, NULL, 16, 2, 35),
(581, 41, 'pública', 'EIEL', '07013051', 'EIEL Bendinat', 'C/ de les Escoles s/n  ', '07181', 'Bendinat', 'Calvià', 'Mallorca', '971405178', NULL, 'eibendinat@calvia.com', NULL, NULL, 1, 1, 11),
(582, 689, 'pública', 'EIEL', '07014511', 'EIEL Benirràs', 'C/ de la Vénda de Benirràs 144  ', '07815', 'Sant Miquel de Balansat', 'Sant Joan de Labritja', 'Eivissa', '971333102', '971323102', 'eibenirras@gmail.com  ', NULL, NULL, 36, 3, 46),
(583, 42, 'pública', 'EIEL', '07013255', 'EIEL Binipetit', 'C/ de Francesc de Borja Moll 30  ', '07350', 'Binissalem', 'Binissalem', 'Mallorca', '971870390', '971886532', 'escoletamunicipal@ajbinissalem.net', NULL, NULL, 5, 1, 8),
(584, 43, 'pública', 'EIEL', '07013000', 'EIEL Ca ses Monges', 'C/ de la Mare de Déu de les Neus 3  ', '07110', 'Bunyola', 'Bunyola', 'Mallorca', '971613524', '971615227', 'enavarroescoleta@ajbunyola.net', NULL, NULL, 24, 1, 10),
(585, 666, 'pública', 'EIEL', '07014053', 'EIEL Cala d\'Or', 'Av. de Calonge s/n  ', '07660', 'Cala d\'Or', 'Santanyí', 'Mallorca', '971643748', NULL, 'escoletalamarieta@hotmail.com', NULL, NULL, 27, 1, 54),
(586, 627, 'pública', 'EIEL', '07013841', 'EIEL Cala de Bou', 'C/ des Caló s/n  ', '07839', 'Sant Agustí des Vedrà', 'Sant Josep de sa Talaia', 'Eivissa', '971800125', NULL, 'escoletacaladebou@hotmail.com', NULL, NULL, 10, 3, 47),
(587, 865, 'pública', 'EIEL', '07015756', 'EIEL Cals Mestres de Caimari', 'C/ de la Lluna 14  ', '07314', 'Caimari', 'Selva', 'Mallorca', '971515663', NULL, 'secretaria@ajselva.net', '0000-00-00', NULL, 6, 1, 55),
(588, 798, 'pública', 'EIEL', '07015011', 'EIEL Calvià Vila', 'Pl. de l\'Església 1  ', '07184', 'Calvià', 'Calvià', 'Mallorca', '971670023', NULL, 'eicalvia@calvia.com', NULL, NULL, 12, 1, 11),
(589, 651, 'pública', 'EIEL', '07013991', 'EIEL Campanet', 'Centre de formació de Can Gaietà', '07310', 'Campanet', 'Campanet', 'Mallorca', '636831859', NULL, 'eicampanet@ajcampanet.net', NULL, NULL, 21, 1, 12),
(590, 622, 'pública', 'EIEL', '07013747', 'EIEL Can Alonso', 'C/ de l\'Arxiduc Lluís Salvador 83  ', '07004', 'Palma', 'Palma', 'Mallorca', '971751975', NULL, 'eicanalonso@pmei.palma.cat', NULL, NULL, 6, 1, 38),
(591, 770, 'pública', 'EIEL', '07014612', 'EIEL Can Cantó', 'C/ des Cubells 15  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', NULL, NULL, 'escoletacancanto@eivissa.es', NULL, NULL, 4, 3, 63),
(592, 812, 'pública', 'EIEL', '07015306', 'EIEL Can Coix', 'Camí de Cas Ramons s/n  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '971804179', NULL, 'escoletacancoix@santantoni.net', NULL, NULL, 10, 3, 44),
(593, 724, 'pública', 'EIEL', '07014491', 'EIEL Cap de Creus', 'C/ de Borja Moll 16  ', '07702', 'Maó', 'Maó', 'Menorca', '971354761', NULL, 'eicapdecreus@eicapdecreus.com', NULL, NULL, 8, 2, 34),
(594, 652, 'pública', 'EIEL', '07013981', 'EIEL Card', 'C/ de la Caritat 4  ', '07530', 'Sant Llorenç des Cardassar', 'Sant Llorenç des Cardassar', 'Mallorca', '971838416', NULL, 'eicard.sll@gmail.com', NULL, NULL, 33, 1, 48),
(595, 633, 'pública', 'EIEL', '07013784', 'EIEL Cas Serres', 'C/ de Felip Curtoys i Valls 4-6  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971390369', '971392983', 'escoleta_casserres@conselldeivissa.es', NULL, NULL, 4, 3, 63),
(596, 334, 'pública', 'EIEL', '07003778', 'EIEL Ciutat Antiga', 'C/ de Jaume Lluís Garau 4  ', '07002', 'Palma', 'Palma', 'Mallorca', '971711450', '971723156', 'eiciutatantiga@pmei.palma.cat', NULL, NULL, 27, 1, 38),
(597, 740, 'pública', 'EIEL', '07014429', 'EIEL Colònia de Sant Jordi', 'C/ de les Escoles s/n  ', '07638', 'Colònia de Sant Jordi', 'Ses Salines', 'Mallorca', '971655388', NULL, 'eicoloniasantjordi@estudi6.net', NULL, NULL, 29, 1, 43),
(598, 709, 'pública', 'EIEL', '07014247', 'EIEL Cucarells', 'C/ de Santa Bàrbara 30  ', '07250', 'Vilafranca de Bonany', 'Vilafranca de Bonany', 'Mallorca', '971832104', NULL, 'escoleta@ajvilafrancadebonany.net', NULL, NULL, 30, 1, 61),
(599, 46, 'pública', 'EIEL', '07013115', 'EIEL El Sol', 'C/ de Son Lluís 7  ', '07150', 'Andratx', 'Andratx', 'Mallorca', '971136154', NULL, 'escoletaandratx@estudi6.com', NULL, NULL, 12, 1, 4),
(600, 637, 'pública', 'EIEL', '07013802', 'EIEL Els Llapis', 'Av. de Francesca Homar 20  ', '07330', 'Consell', 'Consell', 'Mallorca', '971622019', NULL, 'escoletaelsllapis@gmail.com', NULL, NULL, 5, 1, 15),
(601, 936, 'pública', 'EIEL', '07016633', 'EIEL Els Molins', 'C/ dels Molins 17  ', '07240', 'Sant Joan', 'Sant Joan', 'Mallorca', NULL, NULL, 'ajuntament@ajsantjoan.net', '0000-00-00', NULL, 7, 1, 45),
(602, 632, 'pública', 'EIEL', '07013693', 'EIEL Eriçons', 'C/ des Clot Grau 2  ', '07580', 'Capdepera', 'Capdepera', 'Mallorca', '971565483', NULL, 'mteierissons@gmail.com', NULL, NULL, 31, 1, 14),
(603, 47, 'pública', 'EIEL', '07008302', 'EIEL Es Busquerets', 'C/ de Vives Llull 20  ', '07701', 'Maó', 'Maó', 'Menorca', '971353158', '971353158', 'eiesbusquerets@eiesbusquerets.com', NULL, NULL, 16, 2, 34),
(604, 741, 'pública', 'EIEL', '07014478', 'EIEL Es Castell', 'C/ de s\'Escola s/n  ', '07720', 'Es Castell', 'Es Castell', 'Menorca', NULL, NULL, 'eiescastell@eiescastell.com', NULL, NULL, 16, 2, 64),
(605, 630, 'pública', 'EIEL', '07013814', 'EIEL Es Fameliar', 'C/ de l\'Historiador Josep Clapés s/n  ', '07840', 'Santa Eulària des Riu', 'Santa Eulària des Riu', 'Eivissa', '971339757', '971331887', 'escoleta_esfameliar@conselldeivissa.es', NULL, NULL, 11, 3, 51),
(606, 668, 'pública', 'EIEL', '07014090', 'EIEL Es Faralló', 'Camí de Cas Vicari Mestre s/n  ', '07670', 'Portocolom', 'Felanitx', 'Mallorca', '971824120', NULL, 'escoletaesfarallo@gmail.com', NULL, NULL, 27, 1, 21),
(607, 769, 'pública', 'EIEL', '07014223', 'EIEL Es Ferreret', 'C/  Principal s/n  ', '07580', 'Capdepera', 'Capdepera', 'Mallorca', '971564565', NULL, 'eiesferreret@enequip.es', NULL, NULL, 31, 1, 14),
(608, 729, 'pública', 'EIEL', '07014843', 'EIEL Es Fiets', 'C/ de sa Punta Gran s/n  ', '07740', 'Es Mercadal', 'Es Mercadal', 'Menorca', '971158340', NULL, 'eeiesfiets@gmail.com', NULL, NULL, 16, 2, 35),
(609, 735, 'pública', 'EIEL', '07014296', 'EIEL Es Molinar', 'C/ de Llucmajor 87  ', '07006', 'Palma', 'Palma', 'Mallorca', '971277653', NULL, 'eiesmolinar@pmei.palma.cat', NULL, NULL, 27, 1, 38),
(610, 629, 'pública', 'EIEL', '07013838', 'EIEL Es Molinet', 'Ctra. de Santa Ponça - Calvià s/n  ', '07180', 'Santa Ponça', 'Calvià', 'Mallorca', '971139202', NULL, 'eigalatzo@calvia.com', NULL, NULL, 12, 1, 11),
(611, 49, 'pública', 'EIEL', '07007981', 'EIEL Es Mussol', 'Pl. de Jamma s/n  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971482095', NULL, 'eiesmussol@eiesmussol.com', NULL, NULL, 8, 2, 62),
(612, 634, 'pública', 'EIEL', '07013796', 'EIEL Es Nieró', 'C/ de Can Cladera 14  ', '07340', 'Alaró', 'Alaró', 'Mallorca', '971879203', NULL, 'esniero@gmail.com', NULL, NULL, 32, 1, 1),
(613, 50, 'pública', 'EIEL', '07013231', 'EIEL Es Passerells', 'C/ de Francesc Tudurí de la Torre 14  ', '07702', 'Maó', 'Maó', 'Menorca', '971351395', '971351395', 'eiespasserells@eiespasserells.com', NULL, NULL, 18, 2, 34),
(614, 664, 'pública', 'EIEL', '07014065', 'EIEL Es Pi Gros', 'C/ de Santa Margalida 34  ', '07320', 'Santa Maria del Camí', 'Santa Maria del Camí', 'Mallorca', '971140064', NULL, 'eeiespigros@ajsantamariadelcami.net', NULL, NULL, 2, 1, 53),
(615, 345, 'pública', 'EIEL', '07013437', 'EIEL Es Picarol', 'C/ dels Pins 16  ', '07160', 'Peguera', 'Calvià', 'Mallorca', '971687851', NULL, 'eipeguera@calvia.com', NULL, NULL, 12, 1, 11),
(616, 758, 'pública', 'EIEL', '07014077', 'EIEL Es Poriol', 'C/ de Tarragona s/n  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971383326', '971383326', 'escoleta@asima.com ', NULL, NULL, 8, 2, 62),
(617, 934, 'pública', 'EIEL', '07016621', 'EIEL Es Portet', 'C/ de la Font 12  ', '07191', 'Banyalbufar', 'Banyalbufar', 'Mallorca', NULL, NULL, 'ajuntament@ajbanyalbufar.net', '0000-00-00', NULL, 12, 1, 7),
(618, 611, 'pública', 'EIEL', '07013619', 'EIEL Es Pouet', 'C/ de Josep Mascaró Passarius 2  ', '07730', 'Alaior', 'Alaior', 'Menorca', '971379347', '971379347', 'eiespouet@eiespouet.com', NULL, NULL, 18, 2, 69),
(619, 911, 'pública', 'EIEL', '07016402', 'EIEL Es Racó de Tramuntana', 'C/ de Sa Sínia 4  ', '07192', 'Estellencs', 'Estellencs', 'Mallorca', NULL, NULL, 'direccio@ceipgabrielpalmer.org', '0000-00-00', NULL, 12, 1, 20),
(620, 725, 'pública', 'EIEL', '07014831', 'EIEL Es Roser', 'C/ d\'Aires de Muntanya 18  ', '07313', 'Selva', 'Selva', 'Mallorca', '971515233', NULL, 'escoleta.esroser.selva@gmail.com', NULL, NULL, 6, 1, 55),
(621, 739, 'pública', 'EIEL', '07014314', 'EIEL Es Saluet', 'C/ del Llaüt s/n  ', '07157', 'Port d\'Andratx', 'Andratx', 'Mallorca', NULL, NULL, 'eiessaluet@estudi6.com', NULL, NULL, 12, 1, 4),
(622, 336, 'pública', 'EIEL', '07013504', 'EIEL Es Vedellet', 'Av. de Neptuno 59  ', '07180', 'El Toro', 'Calvià', 'Mallorca', '971237493', '971237493', 'eieltoro@calvia.com', NULL, NULL, 12, 1, 11),
(623, 768, 'pública', 'EIEL', '07014521', 'EIEL Es Vedranell', 'Camí des Pou d\'en Mosson s/n  ', '07839', 'Sant Agustí des Vedrà', 'Sant Josep de sa Talaia', 'Eivissa', '971805788', NULL, 'eiesvedranell@estudi6.com', NULL, NULL, 10, 3, 47),
(624, 722, 'pública', 'EIEL', '07014430', 'EIEL Es Verger', 'C/ des Verger s/n  ', '07179', 'Deià', 'Deià', 'Mallorca', '971636418', NULL, 'eisavinyeta@gmail.com', NULL, NULL, 24, 1, 17),
(625, 45, 'pública', 'EIEL', '07013346', 'EIEL Esporles', 'C/ de Mossèn Alcover 17  ', '07190', 'Esporles', 'Esporles', 'Mallorca', '971611135', '971610445', 'escoleta@ajesporles.net', NULL, NULL, 24, 1, 19),
(626, 337, 'pública', 'EIEL', '07013280', 'EIEL Estrella de Mar', 'C/ del Nord s/n  ', '07579', 'Colònia de Sant Pere', 'Artà', 'Mallorca', '971589246', '971829086', 'estrellademar@arta.cat', NULL, NULL, 33, 1, 6),
(627, 891, 'pública', 'EIEL', '07014399', 'EIEL Fada Morgana', 'C/ de Gómez Ulla 27  ', '07620', 'Llucmajor', 'Llucmajor', 'Mallorca', '674338498', NULL, 'eifadamorgana@llucmajor.org', '0000-00-00', NULL, 30, 1, 29),
(628, 338, 'pública', 'EIEL', '07013309', 'EIEL Flor de Murta', 'C/ de la Ribera 35  ', '07210', 'Algaida', 'Algaida', 'Mallorca', '971665820', '971125040', 'escoleta@ajalgaida.net', NULL, NULL, 30, 1, 3),
(629, 52, 'pública', 'EIEL', '07008272', 'EIEL Fort de l\'Eau', 'Av. del Fort de l\'Eau s/n  ', '07701', 'Maó', 'Maó', 'Menorca', '971368890', '971368539', 'eifortdeleau@eifortdeleau.com', NULL, NULL, 18, 2, 34),
(630, 53, 'pública', 'EIEL', '07012986', 'EIEL Huialfàs', 'C/ de s\'Oli s/n  ', '07420', 'Sa Pobla', 'Sa Pobla', 'Mallorca', '971862019', '971862131', 'escoleta@sapobla.cat', NULL, NULL, 21, 1, 68),
(631, 757, 'pública', 'EIEL', '07014089', 'EIEL Joguina', 'Pl. de Don Joan de Borbó comte de Barcelona s/n  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971384258', '971384258', 'escolajoguina@joguinaedu.es', NULL, NULL, 8, 2, 62),
(632, 764, 'pública', 'EIEL', '07014260', 'EIEL La Gola', 'C/ de Magallanes 32  ', '07470', 'Port de Pollença', 'Pollença', 'Mallorca', '672399520', NULL, 'eilagola@estudi6.com', NULL, NULL, 5, 1, 40),
(633, 628, 'pública', 'EIEL', '07013875', 'EIEL La Miranda', 'Av. de Porto Saler s/n  ', '07860', 'Sant Francesc de Formentera', 'Formentera', 'Formentera', '971323415', NULL, 'escoleta@conselldeformentera.cat', NULL, NULL, 36, 4, 23),
(634, 720, 'pública', 'EIEL', '07014338', 'EIEL Lloret', 'C/ de Baix de sa Riba s/n  ', '07518', 'Lloret de Vistalegre', 'Lloret de Vistalegre', 'Mallorca', '971524588', NULL, 'eilloret3@gmail.com', NULL, NULL, 7, 1, 26),
(635, 604, 'pública', 'EIEL', '07013474', 'EIEL Magaluf', 'C/ dels Coloms 17  ', '07181', 'Magaluf', 'Calvià', 'Mallorca', '971131569', NULL, 'eimagaluf@calvia.com', NULL, NULL, 12, 1, 11),
(636, 341, 'pública', 'EIEL', '07013243', 'EIEL Maria Mut i Mandilego', 'C/ de n\'Amer 53  ', '07007', 'Palma', 'Palma', 'Mallorca', '971241148', '971241148', 'eimariamut@pmei.palma.cat', NULL, NULL, 14, 1, 38),
(637, 77, 'pública', 'EIEL', '07012901', 'EIEL Maria Sánchez Servera', 'C/ de Josep Balaguer s/n  ', '07142', 'Santa Eugènia', 'Santa Eugènia', 'Mallorca', '971144313', NULL, 'ajuntament@ajsantaeugenia.net', NULL, NULL, 2, 1, 50),
(638, 742, 'pública', 'EIEL', '07014569', 'EIEL Menuts', 'C/ de la Vénda de Cas Savions 2  ', '07814', 'Santa Gertrudis de Fruitera', 'Santa Eulària des Riu', 'Eivissa', '971197677', NULL, 'jsanchisn@arquisocial.es', NULL, NULL, 36, 3, 51),
(639, 867, 'pública', 'EIEL', '07015811', 'EIEL Mesmenuts', 'C/ de les Magnòlies s/n  ', '07193', 'Palmanyola', 'Bunyola', 'Mallorca', '654175840', NULL, 'escoletamesmenuts@gmail.com', '0000-00-00', NULL, 20, 1, 10),
(640, 897, 'pública', 'EIEL', '07016190', 'EIEL Moixaina', 'C/ de la Roca Llisa 10  ', '07430', 'Llubí', 'Llubí', 'Mallorca', NULL, NULL, 'escoletallubi@gmail.com', '0000-00-00', NULL, 7, 1, 28),
(641, 723, 'pública', 'EIEL', '07014351', 'EIEL Montaura', 'Pg. del Pont s/n  ', '07312', 'Mancor de la Vall', 'Mancor de la Vall', 'Mallorca', '971870725', NULL, 'escoletamancor@gmail.com', NULL, NULL, 6, 1, 31),
(642, 62, 'pública', 'EIEL', '07013073', 'EIEL Na Burguesa', 'C/ de Saragossa s/n  ', '07181', 'Palmanova', 'Calvià', 'Mallorca', '971134799', NULL, 'eisoncaliu@calvia.com', NULL, NULL, 1, 1, 11),
(643, 672, 'pública', 'EIEL', '07013978', 'EIEL Na Pol', 'C/ de Mareselva s/n  ', '07560', 'Sa Coma', 'Sant Llorenç des Cardassar', 'Mallorca', '971587084', NULL, 'escoletanapol@hotmail.com', NULL, NULL, 33, 1, 48),
(644, 63, 'pública', 'EIEL', '07012949', 'EIEL Nins i Nines', 'C/ de Solimà 14  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971552650', NULL, 'eininsinines@enequip.es', NULL, NULL, 19, 1, 30),
(645, 342, 'pública', 'EIEL', '07013176', 'EIEL Ocell del Paradís', 'C/ de l\'Ocell del Paradís 113A  ', '07181', 'Son Ferrer', 'Calvià', 'Mallorca', '971230078', '971231406', 'eisonferrer@calvia.com', NULL, NULL, 12, 1, 11),
(646, 704, 'pública', 'EIEL', '07014788', 'EIEL Palmanova', 'C/ de Josep Maria Quadrado 9  ', '07181', 'Palmanova', 'Calvià', 'Mallorca', '971680986', NULL, 'eipalmanova@calvia.com', NULL, NULL, 12, 1, 11),
(647, 744, 'pública', 'EIEL', '07014594', 'EIEL Penya-Segat', 'C/ de Sant Pau 27  ', '07609', 'Badia Gran', 'Llucmajor', 'Mallorca', '610174344', NULL, 'eipenyasegat@gmail.com', NULL, NULL, 14, 1, 29),
(648, 344, 'pública', 'EIEL', '07013541', 'EIEL Pere Oliver i Domenge', 'C/ de Rocabertí 1  ', '07200', 'Felanitx', 'Felanitx', 'Mallorca', '971580051', NULL, 'lledoner@lledoner.com', NULL, NULL, 27, 1, 21),
(649, 713, 'pública', 'EIEL', '07014582', 'EIEL Pont d\'Inca Nou', 'C/ del Torrent s/n  ', '07141', 'Es Pont d\'Inca', 'Marratxí', 'Mallorca', '971422102', NULL, 'ei.espontdincanou@gmail.com', NULL, NULL, 22, 1, 33),
(650, 767, 'pública', 'EIEL', '07014211', 'EIEL Pou de sa Lluna', 'Camí de Canals s/n  ', '07570', 'Artà', 'Artà', 'Mallorca', '971835056', NULL, 'poudesalluna@arta.cat', NULL, NULL, 33, 1, 6),
(651, 346, 'pública', 'EIEL', '07013267', 'EIEL Roser Gener', 'C/ de la Consolació s/n  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971480713', '971480713', 'escoleta@eirosergener.com', NULL, NULL, 18, 2, 62),
(652, 603, 'pública', 'EIEL', '07006676', 'EIEL S\'Arenal', 'C/ de Gaspar Rullan Garcia 3  ', '07600', 'S\'Arenal', 'Palma', 'Mallorca', '971265253', '971723156', 'eiarenal@pmei.palma.cat', NULL, NULL, 14, 1, 38),
(653, 612, 'pública', 'EIEL', '07013607', 'EIEL S\'Escoleta de Vila', 'C/ de Fra Vicent Nicolau 7  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971310464', '971193850', 'escoleta@eivissa.es', NULL, NULL, 4, 3, 63),
(654, 79, 'pública', 'EIEL', '07013024', 'EIEL S\'Estol del Rei en Jaume', 'C/ d\'Antoni Maria Alcover s/n  ', '07400', 'Port d\'Alcúdia', 'Alcúdia', 'Mallorca', '971549965', '971549965', 'escoleta@alcudia.net', NULL, NULL, 3, 1, 2),
(655, 763, 'pública', 'EIEL', '07014466', 'EIEL Sa Galera', 'C/ de sa Figuera s/n (urbanització Son Blanc)', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971487938', NULL, 'sagalera2010@hotmail.com', NULL, NULL, 16, 2, 62),
(656, 727, 'pública', 'EIEL', '07014405', 'EIEL Sa Gallineta Rossa', '    Polígon 10 - Parcel·la 3', '07230', 'Montuïri', 'Montuïri', 'Mallorca', '971646025', NULL, 'coop.flordemurta@hotmail.com', NULL, NULL, 30, 1, 36),
(657, 711, 'pública', 'EIEL', '07014600', 'EIEL Sa Miloca', 'Ctra. de Santanyí s/n  ', '07208', 'Cas Concos d\'es Cavaller', 'Felanitx', 'Mallorca', '971842252', NULL, 'eisamiloca@felanitx.org', NULL, NULL, 27, 1, 21),
(658, 772, 'pública', 'EIEL', '07014259', 'EIEL Sa Pilota', 'C/ de Formentera s/n  ', '07400', 'Alcúdia', 'Alcúdia', 'Mallorca', '971546583', NULL, 'sapilota@alcudia.net', NULL, NULL, 3, 1, 2),
(659, 347, 'pública', 'EIEL', '07013322', 'EIEL Sa Rota', 'C/ del Metge Bernardí s/n  ', '07510', 'Sineu', 'Sineu', 'Mallorca', '971520027', NULL, 'escoleta@ajsineu.net', NULL, NULL, 7, 1, 57),
(660, 919, 'pública', 'EIEL', '07016499', 'EIEL Sa Rutlana', 'C/ de Joan Albertí Arbona 10  ', '07109', 'Fornalutx', 'Fornalutx', 'Mallorca', '654249230', NULL, 'carolselles@hotmail.com', '0000-00-00', NULL, 20, 1, 24),
(661, 710, 'pública', 'EIEL', '07014417', 'EIEL Sa Sitra', 'C/ del Pare Francesc Molina s/n  ', '07260', 'Porreres', 'Porreres', 'Mallorca', '971168227', NULL, 'eisasitra@hotmail.com', NULL, NULL, 30, 1, 41),
(662, 756, 'pública', 'EIEL', '07008430', 'EIEL Sant Climent', 'C/ de l\'Escola 1  ', '07712', 'Sant Climent', 'Maó', 'Menorca', '971153123', '971153123', 'escola0-3@eisantcliment.com', NULL, NULL, 16, 2, 34),
(663, 881, 'pública', 'EIEL', '07015896', 'EIEL Sant Ferran', 'C/ de la Mestra Maria Mayans Ferrer s/n  ', '07871', 'Sant Ferran de ses Roques', 'Formentera', 'Formentera', '971323415', NULL, 'escoleta@conselldeformentera.cat', NULL, NULL, 36, 4, 23),
(664, 350, 'pública', 'EIEL', '07005817', 'EIEL Santa Catalina', 'C/ de Despuig 10  ', '07013', 'Palma', 'Palma', 'Mallorca', '971737395', '971723156', 'eisantacatalina@pmei.palma.cat', NULL, NULL, 20, 1, 38),
(665, 351, 'pública', 'EIEL', '07013450', 'EIEL Santa Creu', 'C/ de Sant Pere 25  ', '07012', 'Palma', 'Palma', 'Mallorca', '971715939', '971715939', 'eisantacreu@pmei.palma.cat', NULL, NULL, 23, 1, 38),
(666, 721, 'pública', 'EIEL', '07014284', 'EIEL Santa Margalida', 'C/ de Miquel Morey Joan s/n  ', '07450', 'Santa Margalida', 'Santa Margalida', 'Mallorca', '971856230', NULL, 'eisantamargalida@hotmail.com', NULL, NULL, 34, 1, 52),
(667, 352, 'pública', 'EIEL', '07013218', 'EIEL Santa Ponça', 'C/ del Puig Blanc 28  ', '07180', 'Santa Ponça', 'Calvià', 'Mallorca', '971690814', NULL, 'eisantaponsa@calvia.com', NULL, NULL, 12, 1, 11),
(668, 665, 'pública', 'EIEL', '07014041', 'EIEL Santanyí', 'C/ de Felanitx s/n  ', '07650', 'Santanyí', 'Santanyí', 'Mallorca', '971653846', NULL, 'info.eisantanyi@gmail.com', NULL, NULL, 17, 1, 54),
(669, 718, 'pública', 'EIEL', '07014375', 'EIEL Sencelles', 'C/ dels Donants de Sang s/n  ', '07140', 'Sencelles', 'Sencelles', 'Mallorca', '971874061', NULL, 'eisencelles@gmail.com', NULL, NULL, 7, 1, 56),
(670, 734, 'pública', 'EIEL', '07014442', 'EIEL Ses Alzinetes', 'C/ Major 4  ', '07194', 'Puigpunyent', 'Puigpunyent', 'Mallorca', NULL, NULL, 'escoleta@ajpuigpunyent.net', NULL, NULL, 20, 1, 42),
(671, 78, 'pública', 'EIEL', '07012950', 'EIEL Ses Canaletes', 'C/ de Sant Jacint s/n  ', '07710', 'Sant Lluís', 'Sant Lluís', 'Menorca', '971150692', NULL, 'escoleta@ajsantlluis.org', NULL, NULL, 8, 2, 49),
(672, 712, 'pública', 'EIEL', '07014363', 'EIEL Ses Cases Noves', 'C/ de Miquel Gayà s/n  ', '07141', 'Es Pont d\'Inca', 'Marratxí', 'Mallorca', '677533331', NULL, 'ei.sescasesnoves@gmail.com', NULL, NULL, 22, 1, 33),
(673, 762, 'pública', 'EIEL', '07014481', 'EIEL Ses Oronelles', 'Av. de Son Morera 5-7  ', '07750', 'Ferreries', 'Ferreries', 'Menorca', '649221020', NULL, 'coedinfe@gmail.com', NULL, NULL, 18, 2, 22),
(674, 631, 'pública', 'EIEL', '07013826', 'EIEL Ses Païsses', 'C/ de ses Pruneres s/n  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '971804142', '971348288', 'escoleta_sespaisses@conselldeivissa.es', NULL, NULL, 10, 3, 44),
(675, 935, 'pública', 'EIEL', '07016611', 'EIEL Ses Salines', 'C/ del Sitjar s/n  ', '07640', 'Ses Salines', 'Ses Salines', 'Mallorca', NULL, NULL, 'administracio@ajsessalines.net', '0000-00-00', NULL, 29, 1, 43),
(676, 802, 'pública', 'EIEL', '07015203', 'EIEL Sóller', 'C/ del Pintor Juli Ramis 10  ', '07100', 'Sóller', 'Sóller', 'Mallorca', NULL, NULL, 'escoletasoller@gmail.com', NULL, NULL, 20, 1, 58),
(677, 765, 'pública', 'EIEL', '07014570', 'EIEL Son Boga', 'C/ de Son Boga 4  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971843691', NULL, 'eisonboga@enequip.es', NULL, NULL, 19, 1, 30),
(678, 701, 'pública', 'EIEL', '07014235', 'EIEL Son Carrió', 'C/ de l\'Alegria s/n  ', '07530', 'Sant Llorenç des Cardassar', 'Sant Llorenç des Cardassar', 'Mallorca', '971838415', NULL, 'eisoncarrio@outlook.com', NULL, NULL, 33, 1, 48),
(679, 771, 'pública', 'EIEL', '07014302', 'EIEL Son Espanyolet', 'C/ de Niceto Alcalá Zamora 40  ', '07013', 'Palma', 'Palma', 'Mallorca', '971738167', NULL, 'eisonespanyolet@pmei.palma.cat', NULL, NULL, 28, 1, 38),
(680, 700, 'pública', 'EIEL', '07014201', 'EIEL Son Ferriol', 'C/ de Lleó XIII 63  ', '07198', 'Son Ferriol', 'Palma', 'Mallorca', '971426900', NULL, 'eisonferriol@pmei.palma.cat', NULL, NULL, 29, 1, 38),
(681, 354, 'pública', 'EIEL', '07013413', 'EIEL Son Fuster Nou', 'C/ de Gabriel Alzamora 33  ', '07009', 'Palma', 'Palma', 'Mallorca', '971479700', '971479700', 'eisonfuster@pmei.palma.cat', NULL, NULL, 5, 1, 38),
(682, 84, 'pública', 'EIEL', '07006603', 'EIEL Son Roca', 'C/ del Cap Enderrocat s/n  ', '07011', 'Sa Vileta', 'Palma', 'Mallorca', '971790656', '971609101', 'eisonroca@pmei.palma.cat', NULL, NULL, 23, 1, 38),
(683, 662, 'pública', 'EIEL', '07014028', 'EIEL Taperons', 'C/ del Nord s/n  ', '07630', 'Campos', 'Campos', 'Mallorca', '971652176', NULL, 'escoleta@ajcampos.org', NULL, NULL, 29, 1, 13),
(684, 86, 'pública', 'EIEL', '07008296', 'EIEL Toninaina', 'Av. del Raiguer s/n  ', '07300', 'Inca', 'Inca', 'Mallorca', '971502989', '971502989', 'toninaina@incaciutat.com', NULL, NULL, 35, 1, 25),
(685, 892, 'pública', 'EIEL', '07014387', 'EIEL Trencadors', 'C/ de Sant Bartomeu 75  ', '07600', 'S\'Arenal', 'Llucmajor', 'Mallorca', '627045650', NULL, 'eitrencadors@llucmajor.org', '0000-00-00', NULL, 14, 1, 29),
(686, 719, 'pública', 'EIEL', '07014454', 'EIEL Valldemossa', 'C/ de Joan de la Concepció Mir s/n  ', '07170', 'Valldemossa', 'Valldemossa', 'Mallorca', '971612002', NULL, 'escoletavalldemossa@gmail.com', NULL, NULL, 24, 1, 60),
(687, 635, 'pública', 'EIEL', '07013772', 'EIEL Virgen de Loreto', 'Ctra. de Manacor PK 8  ', '07199', 'Palma', 'Palma', 'Mallorca', '971497596', NULL, 'ceivirgenloreto@gmail.com', NULL, NULL, 14, 1, 38),
(688, 663, 'pública', 'EIEL', '07014031', 'EIEL Xibit', 'C/ de Malagarba s/n  ', '07749', 'Es Migjorn Gran', 'Es Migjorn Gran', 'Menorca', '971370570', NULL, 'eixibitscoop@gmail.com', NULL, NULL, 16, 2, 65),
(689, 947, 'pública', 'EIEL', '07016761', 'EIEL Escoleta Maria de la Salut', 'C/ Escola de Nines 3  ', '07519', 'Maria de la Salut', 'Maria de la Salut', 'Mallorca', NULL, NULL, 'escoletamancor@gmail.com', '0000-00-00', NULL, 7, 1, 32),
(690, 393, 'pública', 'EMM', '07016131', 'EMM Alaior', 'C/ Menor 20  ', '07730', 'Alaior', 'Alaior', 'Menorca', '971376169', NULL, 'mmertxe@telefonica.net', NULL, NULL, 8, 2, 69),
(691, 429, 'pública', 'EMM', '07016086', 'EMM Alcúdia', 'Pl. de la Porta de Mallorca 3  ', '07400', 'Alcúdia', 'Alcúdia', 'Mallorca', '971546423', '971546423', 'musica@alcudia.net', NULL, NULL, 3, 1, 2),
(692, 394, 'pública', 'EMM', '07016037', 'EMM Algaida', 'C/ d\'Anselm Turmeda 3  ', '07210', 'Algaida', 'Algaida', 'Mallorca', '971125076', NULL, 'escolamusicaalgaida@gmail.com  ', NULL, NULL, 30, 1, 3);
INSERT INTO `centres` (`id`, `Ubi_Codi`, `Titularitat`, `Sigla`, `Codi`, `Centre`, `Adreca`, `CP`, `Localitat`, `Municipi`, `Illa`, `Telefon`, `Fax`, `email`, `Alta`, `Baixa`, `Inspector_id`, `id_illa`, `id_municipi`) VALUES
(693, 391, 'pública', 'EMM', '07014272', 'EMM Andreu Torrens', 'C/ de Jaume I 16  ', '07320', 'Santa Maria del Camí', 'Santa Maria del Camí', 'Mallorca', '971620131', '971140337', 'emusica.andreutorrens@ajsantamariadelcami.net', NULL, NULL, 31, 1, 53),
(694, 395, 'pública', 'EMM', '07014533', 'EMM Artà', 'Pl. del Conqueridor s/n  ', '07570', 'Artà', 'Artà', 'Mallorca', '971562008', NULL, 'emma@arta.cat', NULL, NULL, 31, 1, 6),
(695, 396, 'pública', 'EMM', '07016268', 'EMM Binissalem', 'C/ de la Portella s/n  ', '07350', 'Binissalem', 'Binissalem', 'Mallorca', '971886531', NULL, 'elena_sureda@hotmail.com', NULL, NULL, 5, 1, 8),
(696, 397, 'pública', 'EMM', '07016165', 'EMM Campos', 'C. de la Síquia s/n', '07630', 'Campos', 'Campos', 'Mallorca', '605827423', '971652693', 'mogaso1980@gmail.com', NULL, NULL, 29, 1, 13),
(697, 688, 'privada', 'EMM', '07016359', 'EMM Can Blau', 'Camí d\'en Dentals 26  ', '07839', 'Sant Agustí des Vedrà', 'Sant Josep de sa Talaia', 'Eivissa', '971342543', '971342543', 'info@canblau.net', NULL, NULL, 36, 3, 47),
(698, 398, 'pública', 'EMM', '07016128', 'EMM Capdepera', 'C/ del Sol 1  ', '07580', 'Capdepera', 'Capdepera', 'Mallorca', '971563710', NULL, 'musica@ajcapdepera.net', NULL, NULL, 31, 1, 14),
(699, 412, 'pública', 'EMM', '07015665', 'EMM Josep Rubio i Amengual', 'Pl. de l\'Església s/n  ', '07184', 'Calvià', 'Calvià', 'Mallorca', '971670000', '971670000', 'escolademusica@calvia.com', NULL, NULL, 28, 1, 11),
(700, 413, 'pública', 'EMM', '07016098', 'EMM Miquel Tortell', 'Pl. del Convent 1  ', '07440', 'Muro', 'Muro', 'Mallorca', '971537723', '971537723', 'escolamusicamuro@gmail.com', NULL, NULL, 35, 1, 37),
(701, 853, 'pública', 'EMM', '07016384', 'EMM Palma', 'C/ dels Blanquers 2', '07001', 'Palma', 'Palma', 'Mallorca', '971719127', '971714388', 'conservatori@palma.es', '0000-00-00', NULL, 31, 1, 38),
(702, 400, 'pública', 'EMM', '07016293', 'EMM Pare Antoni Martorell i Miralles', 'C/ de Costa i Llobera s/n  ', '07230', 'Montuïri', 'Montuïri', 'Mallorca', '696123716', NULL, 'escolamusicamontuiri@hotmail.es', NULL, NULL, 14, 1, 36),
(703, 386, 'pública', 'EMM', '07016001', 'EMM Patronat de Música d\'Eivissa', 'Av. d\'Ignasi Wallis 26  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971310061', '971310121', 'patronatdemusica@eivissa.es', NULL, NULL, 36, 3, 63),
(704, 401, 'pública', 'EMM', '07016025', 'EMM Petra', 'C/ d\'en Font 24  ', '07520', 'Petra', 'Petra', 'Mallorca', '971561680', NULL, 'garcia.isa@hotmail.com', NULL, NULL, 31, 1, 39),
(705, 432, 'pública', 'EMM', '07015771', 'EMM Pollença', 'C/ de Guillem Cifre de Colonya 33  ', '07460', 'Pollença', 'Pollença', 'Mallorca', '971530015', '971530606', 'escolamusica@ajpollenca.net', NULL, NULL, 5, 1, 40),
(706, 402, 'pública', 'EMM', '07016311', 'EMM Porreres', 'C/ del Pare Molina s/n  ', '07260', 'Porreres', 'Porreres', 'Mallorca', '971168194', '971168265', 'escolademusicadeporreres@gmail.com', NULL, NULL, 14, 1, 41),
(707, 403, 'pública', 'EMM', '07016301', 'EMM Sa Pobla', 'Pl. del Mercat s/n  ', '07420', 'Sa Pobla', 'Sa Pobla', 'Mallorca', '636524123', '971862131', 'miquelpaula@hotmail.com', NULL, NULL, 21, 1, 68),
(708, 92, 'pública', 'EMM', '07016049', 'EMM Sant Llorenç des Cardassar', 'Pl. del Pou Vell s/n  ', '07530', 'Sant Llorenç des Cardassar', 'Sant Llorenç des Cardassar', 'Mallorca', '971569732', '971569732', 'emd.santllorenc@gmail.com', NULL, NULL, 31, 1, 48),
(709, 404, 'pública', 'EMM', '07016372', 'EMM Santa Margalida', 'C/ de Joan Ordines Tous 7  ', '07450', 'Santa Margalida', 'Santa Margalida', 'Mallorca', '619819946', '971523777', 'escolademusica@ajsantamargalida.net', NULL, NULL, 31, 1, 52),
(710, 405, 'pública', 'EMM', '07016153', 'EMM Santanyí', 'C/ de Palma 29  ', '07650', 'Santanyí', 'Santanyí', 'Mallorca', '971654262', '971163309', 'emusica@ajsantanyi.net', NULL, NULL, 17, 1, 54),
(711, 406, 'pública', 'EMM', '07016335', 'EMM Selva', 'C/ dels Aires de Muntanya 16  ', '07313', 'Selva', 'Selva', 'Mallorca', '687943714', NULL, 'ajuntament@ajselva.net', NULL, NULL, 6, 1, 55),
(712, 407, 'pública', 'EMM', '07016013', 'EMM Sóller', 'C/ del Bisbe Colom s/n (antic centre sanitari)', '07100', 'Sóller', 'Sóller', 'Mallorca', '971633724', NULL, 'emusicasoller@gmail.com', NULL, NULL, 20, 1, 58),
(713, 749, 'pública', 'EMM', '07016360', 'EMM Valldemossa', 'C/ dels Valldemossa s/n  ', '07170', 'Valldemossa', 'Valldemossa', 'Mallorca', '697671251', NULL, 'escolamusicaiballvalldemossa@gmail.com', NULL, NULL, 24, 1, 60),
(714, 408, 'pública', 'EMM', '07015631', 'EMM Vilafranca de Bonany', 'C/ de l\'Escorxador s/n  ', '07250', 'Vilafranca de Bonany', 'Vilafranca de Bonany', 'Mallorca', '676936682', '971832108', 'ajuntament@ajvilafrancadebonany.net', NULL, NULL, 30, 1, 61),
(715, 392, 'pública', 'EMMD', '07014508', 'EMMD Antoni Torrandell', 'C/ d\'en Dureta s/n  ', '07300', 'Inca', 'Inca', 'Mallorca', '971881420', '971881420', 'emmat@incaciutat.com', NULL, NULL, 31, 1, 25),
(716, 750, 'pública', 'EMMD', '07016347', 'EMMD Ciutadella (EMAC)', 'Pl. de la Catedral 5  1r', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971385825', NULL, 'ciutadellamusica@hotmail.com', NULL, NULL, 8, 2, 62),
(717, 409, 'pública', 'EMMD', '07016116', 'EMMD Es Mercadal', 'C/ de Llevant 9  ', '07740', 'Es Mercadal', 'Es Mercadal', 'Menorca', '971375407', NULL, 'general@esmercadal.es', NULL, NULL, 8, 2, 35),
(718, 411, 'pública', 'EMMD', '07016074', 'EMMD Esporles', 'Pl. d\'Espanya 1  ', '07190', 'Esporles', 'Esporles', 'Mallorca', '971610931', '971610445', 'esmudaesporles@gmail.com', NULL, NULL, 24, 1, 19),
(719, 380, 'pública', 'EMMD', '07015963', 'EMMD Formentera', 'Pl. de la Constitució 1  ', '07860', 'Sant Francesc de Formentera', 'Formentera', 'Formentera', '971323355', '971323355', 'escolamusicaformentera@msn.com', NULL, NULL, 36, 4, 23),
(720, 909, 'pública', 'EMMD', '07016141', 'EMMD Manacor', 'C/ de sa Fàbrica 2  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971551115', '971551197', 'musica@manacor.org', NULL, NULL, 31, 1, 30),
(721, 414, 'pública', 'EMMD', '07016062', 'EMMD Pare Aulí', 'C/ de Rocabertí 1  ', '07200', 'Felanitx', 'Felanitx', 'Mallorca', '971583352', '971580080', 'musica@felanitx.org', NULL, NULL, 31, 1, 21),
(722, 410, 'pública', 'EMMD', '07015458', 'EMMD Son Servera', 'C/ de s\'Estació s/n  ', '07550', 'Son Servera', 'Son Servera', 'Mallorca', '971567951', NULL, 'educacio@sonservera.es', NULL, NULL, 31, 1, 59),
(723, 364, 'pública', 'EOEP', '07700052', 'EOEP Calvià-Andratx', 'C/ de Saragossa 4', '07181', 'Palmanova', 'Calvià', 'Mallorca', '971682096', '971682096', 'eoepcalvia@educaib.eu', NULL, NULL, 28, 1, 11),
(724, 362, 'pública', 'EOEP', '07700064', 'EOEP Campos', 'C/ del Convent 4', '07630', 'Campos', 'Campos', 'Mallorca', '971652431', '971652497', 'eoepcampos@educaib.eu', NULL, NULL, 29, 1, 13),
(725, 356, 'pública', 'EOEP', '07700088', 'EOEP Eivissa i Formentera', 'V. Púnica 23  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971318941', '971318941', 'eoepeivissa@educaib.eu', NULL, NULL, 4, 3, 63),
(726, 357, 'pública', 'EOEP', '07700091', 'EOEP Inca', 'C/ d\'Antoni Torrandell 59  ', '07300', 'Inca', 'Inca', 'Mallorca', '971506103', '971881471', 'eoepinca@educaib.eu', NULL, NULL, 6, 1, 25),
(727, 358, 'pública', 'EOEP', '07700106', 'EOEP Manacor', 'C/ de la Residència s/n  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971550700', '971843119', 'eoepmanacor@educaib.eu', NULL, NULL, 19, 1, 30),
(728, 359, 'pública', 'EOEP', '07700118', 'EOEP Menorca', 'Av. de Josep Maria Quadrado 33  ', '07703', 'Maó', 'Maó', 'Menorca', '971350120', '971350120', 'eoepmenorca@educaib.eu', NULL, NULL, 16, 2, 34),
(729, 363, 'pública', 'EOEP', '07700076', 'EOEP Menorca (subseu Ciutadella)', 'C/ de Mallorca 67', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971481473', '971481473', 'eoepciutadella@educaib.eu', NULL, NULL, 16, 2, 62),
(730, 851, 'pública', 'EOEP', '07700313', 'EOEP Muro', 'C/ del Molí de Can Moragues s/n  ', '07440', 'Muro', 'Muro', 'Mallorca', '971860037', NULL, 'eoepinca@educacio.caib.es', '0000-00-00', NULL, 35, 1, 37),
(731, 360, 'pública', 'EOEP', '07700121', 'EOEP Palma I', 'Av. del Cid 581  ', '07198', 'Son Ferriol', 'Palma', 'Mallorca', '971427129', '971429509', 'eoeppalma1@educaib.eu', NULL, NULL, 25, 1, 38),
(732, 361, 'pública', 'EOEP', '07700143', 'EOEP Palma II', 'C/ de Gregorio Marañón s/n  ', '07007', 'Palma', 'Palma', 'Mallorca', '971249904', '971250018', 'eoeppalma2@educaib.eu', NULL, NULL, 35, 1, 38),
(733, 365, 'pública', 'EOEP', '07700131', 'EOEP Sóller', 'C/ de l\'Hospici 2, 2n', '07100', 'Sóller', 'Sóller', 'Mallorca', '971634256', NULL, 'eoepsoller@educaib.eu', NULL, NULL, 20, 1, 58),
(734, 846, 'pública', 'EOEP-EAC', '07500385', 'EOEP-EAC Eivissa i Formentera', 'V. Púnica 23  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', NULL, NULL, 'eaceivissa@educaib.eu', '0000-00-00', NULL, 4, 3, 63),
(735, 847, 'pública', 'EOEP-EAC', '07500397', 'EOEP-EAC Menorca', 'Av. de Josep Maria Quadrado 33  ', '07703', 'Maó', 'Maó', 'Menorca', NULL, NULL, 'eacmenorca@educaib.eu', '0000-00-00', NULL, 18, 2, 34),
(736, 748, 'pública', 'EOEP-EAC', '07700337', 'EOEP-EAC Mallorca', 'C/ de Salvà 14', '07013', 'Palma', 'Palma', 'Mallorca', NULL, NULL, 'eacmallorca@educaib.eu', NULL, NULL, 5, 1, 38),
(737, 923, 'pública', 'EOEP-EACI', '07700416', 'EOEP-EACI', 'C/ de Gregorio Marañón s/n  ', '07007', 'Palma', 'Palma', 'Mallorca', NULL, NULL, 'eoepeaci@educaib.eu', '0000-00-00', NULL, 5, 1, 38),
(738, 882, 'pública', 'EOEP-EADIS', '07500555', 'EOEP-EADISOC Eivissa i Formentera', 'V. Púnica 23  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971306422', NULL, NULL, NULL, NULL, 4, 3, 63),
(739, 883, 'pública', 'EOEP-EADIS', '07700325', 'EOEP-EADISOC Mallorca', 'C/ de Salvà 14  ', '07013', 'Palma', 'Palma', 'Mallorca', NULL, NULL, 'eadisoceducacio@educaib.eu', NULL, NULL, 5, 1, 38),
(740, 884, 'pública', 'EOEP-EADIS', '07500543', 'EOEP-EADISOC Menorca', 'Av. de Josep Maria Quadrado 33', '07703', 'Maó', 'Maó', 'Menorca', NULL, NULL, 'eadisocmenorca@educaib.eu', NULL, NULL, 18, 2, 34),
(741, 751, 'pública', 'EOEP-EADIV', '07500324', 'EOEP-EADIVI Eivissa i Formentera', 'V. Romana 51', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971301307', NULL, 'onceillesbalears@once.es', NULL, NULL, 4, 3, 63),
(742, 372, 'pública', 'EOEP-EADIV', '07700350', 'EOEP-EADIVI Mallorca', 'C/ de Manacor 8', '07006', 'Palma', 'Palma', 'Mallorca', '971775522 ext. 1510', '971468161', 'onceillesbalears@once.es', NULL, NULL, 5, 1, 38),
(743, 616, 'pública', 'EOEP-EADIV', '07500245', 'EOEP-EADIVI Menorca', 'C/ del Bisbe Sever 11  ', '07703', 'Maó', 'Maó', 'Menorca', '971357274', NULL, 'onceillesbalears@once.es', NULL, NULL, 18, 2, 34),
(744, 878, 'pública', 'EOEP-ECLA', '07700362', 'EOEP-ECLA', 'C/ de Salvà 14  ', '07013', 'Palma', 'Palma', 'Mallorca', NULL, NULL, 'ecla@dgpice.caib.es', '0000-00-00', NULL, 5, 1, 38),
(745, 419, 'pública', 'EOI', '07013097', 'EOI Calvià', 'C/ de l\'Arquitecte Francesc Casas s/n  ', '07181', 'Bendinat', 'Calvià', 'Mallorca', '971700150', '971405949', 'eoicalvia@educaib.eu', NULL, NULL, 17, 1, 11),
(746, 807, 'pública', 'EOI', '07015264', 'EOI Ciutadella', 'C/ de Mallorca 67  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971381742', '971481922', 'eoiciutadella@educaib.eu', NULL, NULL, 18, 2, 62),
(747, 421, 'pública', 'EOI', '07002373', 'EOI Eivissa', 'Ctra. de Sant Antoni PK 2  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971314622', '971194243', 'direccio@eoi-eivissa.com', NULL, NULL, 10, 3, 63),
(748, 417, 'pública', 'EOI', '07012834', 'EOI Inca', 'C/ de Joan Miró s/n  ', '07300', 'Inca', 'Inca', 'Mallorca', '971502154', '971881713', 'eoiinca@educaib.eu', NULL, NULL, 17, 1, 25),
(749, 418, 'pública', 'EOI', '07012846', 'EOI Manacor', 'Rda. de l\'Institut Mossèn Alcover s/n  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971554152', '971551454', 'eoimanacor@educaib.eu', NULL, NULL, 17, 1, 30),
(750, 416, 'pública', 'EOI', '07008478', 'EOI Maó', 'C/ de Francesc Femenias Andreu 2  ', '07703', 'Maó', 'Maó', 'Menorca', '971354328', '971353104', 'eoimao@educaib.eu', NULL, NULL, 18, 2, 34),
(751, 420, 'pública', 'EOI', '07007191', 'EOI Palma Andreu Crespí Plaza', 'C/ d\'Aragó 59  ', '07005', 'Palma', 'Palma', 'Mallorca', '971421314', '971421208', 'eoipalma@educaib.eu', NULL, NULL, 17, 1, 38),
(752, 12, 'pública', 'EOI-EXT', '07500439', 'EOI-EXT Eivissa (ampliació a Formentera)', 'Av. de Porto Saler s/n  ', '07860', 'Sant Francesc de Formentera', 'Formentera', 'Formentera', '971323401', '971321032', 'aeoiformentera@educaib.eu', NULL, NULL, 10, 4, 23),
(753, 871, 'pública', 'EOI-EXT', '07500521', 'EOI-EXT Eivissa (ampliació a Sant Antoni de Portmany)', 'C/ de l\'Estrella 17', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', NULL, NULL, 'direccio@eoi-eivissa.com', '0000-00-00', NULL, 10, 3, 44),
(754, 848, 'pública', 'EOI-EXT', '07500518', 'EOI-EXT Inca (ampliació a Alcúdia)', 'C/ d\'Antoni Maria Alcover s/n  ', '07400', 'Alcúdia', 'Alcúdia', 'Mallorca', '971548600', '971546304', 'eoiinca@educaib.eu', '0000-00-00', NULL, 17, 1, 2),
(755, 908, 'privada', 'EPDR', '07016396', 'EPDR ArtDansa', 'C/ de Pons i Gallarza, 5A  ', '07004', 'Palma', 'Palma', 'Mallorca', NULL, NULL, 'secretaria@artdansa.es', '0000-00-00', NULL, 32, 1, 38),
(756, 682, 'privada', 'EPDR', '07016256', 'EPDR Francisca Tomàs', 'C/ d\'Antoni Marquès 26  ', '07003', 'Palma', 'Palma', 'Mallorca', '971751022', NULL, 'escoladansafranciscatomas@gmail.com', NULL, NULL, 31, 1, 38),
(757, 670, 'privada', 'EPDR', '07015987', 'EPDR Sant Jaume', 'C/ de Pau Piferrer 15  ', '07011', 'Palma', 'Palma', 'Mallorca', '971450865', NULL, 'dansasantjaume@gmail.com', NULL, NULL, 31, 1, 38),
(758, 379, 'privada', 'EPDR', '07015999', 'EPDR Ute Dahl', 'C/ de la Verge de Gràcia 44  ', '07702', 'Maó', 'Maó', 'Menorca', '971368557', NULL, 'utedahl@infotelecom.es', NULL, NULL, 8, 2, 34),
(759, 381, 'privada', 'EPMDR', '07016281', 'EPMDR Ateneu Musical de Ferreries', 'C/ de Sant Bartomeu 55  ', '07750', 'Ferreries', 'Ferreries', 'Menorca', '610200467', '971155015', 'cultura@ajferreries.org', NULL, NULL, 8, 2, 22),
(760, 388, 'privada', 'EPMR', '07016050', 'EPMR Ireneu Segarra', 'C/ del Fra Francesc Palou 8  ', '07010', 'Palma', 'Palma', 'Mallorca', '971292111', NULL, 'emireneusegarra@hotmail.com', NULL, NULL, 32, 1, 38),
(761, 927, 'privada', 'EPMR', '07016529', 'EPMR Major 82, Espai d\'Activitats Musicals', 'C/ Major 82  ', '07141', 'Pòrtol', 'Marratxí', 'Mallorca', '971064142', NULL, 'catalina@major82.cat', NULL, NULL, 31, 1, 33),
(762, 524, 'privada', 'EPMR', '07016323', 'EPMR MésMúsica', 'C/ de Jeroni Antich 6  ', '07003', 'Palma', 'Palma', 'Mallorca', '971715151', '971714267', 'info@mesmusica.com', NULL, NULL, 1, 1, 38),
(763, 422, 'pública', 'ESAD', '07013292', 'ESAD Illes Balears', 'C/ del Morer 6  ', '07001', 'Palma', 'Palma', 'Mallorca', '971713628', '971713215', 'administracio@esadib.com', NULL, NULL, 31, 1, 38),
(764, 436, 'pública', 'IES', '07008004', 'IES Albuhaira', 'C/ de Maria i Josep s/n  ', '07440', 'Muro', 'Muro', 'Mallorca', '971860560', '971861080', 'iesalbuhaira@educaib.eu', NULL, NULL, 35, 1, 37),
(765, 437, 'pública', 'IES', '07007851', 'IES Alcúdia', 'C/ d\'Antoni Maria Alcover s/n  ', '07400', 'Port d\'Alcúdia', 'Alcúdia', 'Mallorca', '971548600', '971546304', 'iesalcudia@educaib.eu', NULL, NULL, 3, 1, 2),
(766, 438, 'pública', 'IES', '07007929', 'IES Algarb', 'C/ de Guillem de Montgrí s/n  ', '07817', 'Sant Jordi de ses Salines', 'Sant Josep de sa Talaia', 'Eivissa', '971306812', '971392112', 'iesalgarb@educaib.eu', NULL, NULL, 4, 3, 47),
(767, 439, 'pública', 'IES', '07003894', 'IES Antoni Maura', 'C/ de Perú 4  ', '07007', 'Palma', 'Palma', 'Mallorca', '971242034', '971240150', 'iesantonimaura@educaib.eu', NULL, NULL, 25, 1, 38),
(768, 440, 'pública', 'IES', '07007930', 'IES Arxiduc Lluís Salvador', 'C/ de Gilabert de Centelles 12  ', '07005', 'Palma', 'Palma', 'Mallorca', '971466391', '971771117', 'iesarxiduc@educaib.eu', NULL, NULL, 34, 1, 38),
(769, 442, 'pública', 'IES', '07012962', 'IES Balàfia', 'C/ de Can Xic Tunio s/n  ', '07812', 'Sant Llorenç de Balàfia', 'Sant Joan de Labritja', 'Eivissa', '971333489', '971325367', 'iesbalafia@educaib.eu', NULL, NULL, 36, 3, 46),
(770, 443, 'pública', 'IES', '07008338', 'IES Baltasar Porcel', 'C/ de Son Prim s/n  ', '07150', 'Andratx', 'Andratx', 'Mallorca', '971136768', '971136599', 'iesbaltasarporcel@educaib.eu', NULL, NULL, 12, 1, 4),
(771, 444, 'pública', 'IES', '07008855', 'IES Bendinat', 'C/ de l\'Arquitecte Francesc Casas s/n  ', '07181', 'Bendinat', 'Calvià', 'Mallorca', '971402565', '971402606', 'iesbendinat@educaib.eu', NULL, NULL, 1, 1, 11),
(772, 445, 'pública', 'IES', '07001551', 'IES Berenguer d\'Anoia', 'Ctra. de Palma - Alcúdia s/n  ', '07300', 'Inca', 'Inca', 'Mallorca', '971501812', '971880518', 'iesberenguerdanoia@educaib.eu', NULL, NULL, 6, 1, 25),
(773, 446, 'pública', 'IES', '07008387', 'IES Biel Martí', 'Av. de Son Morera s/n  ', '07750', 'Ferreries', 'Ferreries', 'Menorca', '971374201', '971374128', 'iesbielmarti@educaib.eu', NULL, NULL, 18, 2, 22),
(774, 447, 'pública', 'IES', '07013140', 'IES Binissalem', 'C/ del Rector Rafel Sabater s/n  ', '07350', 'Binissalem', 'Binissalem', 'Mallorca', '971886612', '971512206', 'iesbinissalem@educaib.eu', NULL, NULL, 5, 1, 8),
(775, 448, 'pública', 'IES', '07007899', 'IES Calvià', 'Av. de Son Pillo 1  ', '07180', 'Santa Ponça', 'Calvià', 'Mallorca', '971690229', '971694931', 'iescalvia@educaib.eu', NULL, NULL, 28, 1, 11),
(776, 856, 'pública', 'IES', '07015549', 'IES Can Balo', 'C/ de Francesc Salvà i Pizà s/n', '07141', 'Es Pont d\'Inca', 'Marratxí', 'Mallorca', '971176418', NULL, 'iescanbalo@educaib.eu', '0000-00-00', NULL, 29, 1, 33),
(777, 490, 'pública', 'IES', '07008107', 'IES Can Peu Blanc', 'Camí de l\'Hort d\'en Gaietà s/n  ', '07420', 'Sa Pobla', 'Sa Pobla', 'Mallorca', '971540812', '971541365', 'iescanpeublanc@educaib.eu', NULL, NULL, 21, 1, 68),
(778, 449, 'pública', 'IES', '07007954', 'IES Cap de Llevant', 'C/ de Francesc Femenias Andreu 2  ', '07703', 'Maó', 'Maó', 'Menorca', '971353582', '971353523', 'iescapdellevant@educaib.eu', NULL, NULL, 18, 2, 34),
(779, 450, 'pública', 'IES', '07008341', 'IES Capdepera', 'Camí Vell del Far s/n  ', '07580', 'Capdepera', 'Capdepera', 'Mallorca', '971818203', '971565857', 'iescapdepera@educaib.eu', NULL, NULL, 31, 1, 14),
(780, 451, 'pública', 'IES', '07013383', 'IES Centre de Tecnificació Esportiva Illes Balears', 'C/ Gran Via Asima 25B  ', '07009', 'Sa Indioteria', 'Palma', 'Mallorca', '971431727', '971431724', 'iescteib@educaib.eu', NULL, NULL, 33, 1, 38),
(781, 483, 'pública', 'IES', '07008843', 'IES Clara Hammerl', 'C/ de Roger de Flor s/n  ', '07470', 'Port de Pollença', 'Pollença', 'Mallorca', '971866332', '971866334', 'iesclarahammerl@educaib.eu', NULL, NULL, 5, 1, 40),
(782, 452, 'pública', 'IES', '07008454', 'IES Damià Huguet', 'Camí de Revellar s/n  ', '07630', 'Campos', 'Campos', 'Mallorca', '971160085', '971160213', 'iesdamiahuguet@educaib.eu', NULL, NULL, 29, 1, 13),
(783, 453, 'pública', 'IES', '07008016', 'IES Emili Darder', 'C/ de Salvador Dalí 4  ', '07011', 'Palma', 'Palma', 'Mallorca', '971457710', '971452523', 'iesemilidarder@educaib.eu', NULL, NULL, 12, 1, 38),
(784, 454, 'pública', 'IES', '07007905', 'IES Felanitx', 'Ctra. de Petra s/n  ', '07200', 'Felanitx', 'Felanitx', 'Mallorca', '971580497', '971581258', 'iesfelanitx@educaib.eu', NULL, NULL, 27, 1, 21),
(785, 456, 'pública', 'IES', '07006470', 'IES Guillem Cifre de Colonya', 'C/ de la Mare Alberta s/n  ', '07460', 'Pollença', 'Pollença', 'Mallorca', '971530115', '971533465', 'iesguillemcifredecolonya@educaib.eu', NULL, NULL, 5, 1, 40),
(786, 457, 'pública', 'IES', '07007917', 'IES Guillem Colom Casasnoves', 'Av. de Juli Ramis s/n  ', '07100', 'Sóller', 'Sóller', 'Mallorca', '971633514', '971633218', 'iesguillemcolomcasasnoves@educaib.eu', NULL, NULL, 20, 1, 58),
(787, 458, 'pública', 'IES', '07006512', 'IES Guillem Sagrera', 'C/ de Salvador Dalí 5  ', '07011', 'Palma', 'Palma', 'Mallorca', '971450000', '971451411', 'iesguillemsagrera@educaib.eu', NULL, NULL, 1, 1, 38),
(788, 859, 'pública', 'IES', '07015719', 'IES IEDIB', 'C/ de Salvà 14  ', '07013', 'Palma', 'Palma', 'Mallorca', '971170650', NULL, 'iedib@educaib.eu', '0000-00-00', NULL, 9, 1, 38),
(789, 875, 'pública', 'IES', '07015835', 'IES Inca', 'C/ de Joan Miró 22  ', '07300', 'Inca', 'Inca', 'Mallorca', NULL, NULL, 'iesinca@educaib.eu', '0000-00-00', NULL, 6, 1, 25),
(790, 459, 'pública', 'IES', '07001401', 'IES Isidor Macabich', 'C/ de sa Blanca Dona s/n  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971314669', '971317652', 'iesisidormacabich@educaib.eu', NULL, NULL, 4, 3, 63),
(791, 460, 'pública', 'IES', '07003882', 'IES Joan Alcover', 'V. d\'Alemanya 14  ', '07003', 'Palma', 'Palma', 'Mallorca', '971290200', '971759999', 'iesjoanalcover@educaib.eu', NULL, NULL, 28, 1, 38),
(792, 461, 'pública', 'IES', '07007152', 'IES Joan Maria Thomàs', 'C/ de Pablo Iglesias 93  ', '07004', 'Palma', 'Palma', 'Mallorca', '971209620', '971209454', 'iesjoanmariathomas@educaib.eu', NULL, NULL, 32, 1, 38),
(793, 462, 'pública', 'IES', '07001964', 'IES Joan Ramis i Ramis', 'Av. de Vives Llull 15  ', '07703', 'Maó', 'Maó', 'Menorca', '971360133', '971364233', 'iesjoanramisiramis@educaib.eu', NULL, NULL, 16, 2, 34),
(794, 464, 'pública', 'IES', '07013164', 'IES Josep Font i Trias', 'C/ de la Punta de Son Quint s/n  ', '07190', 'Esporles', 'Esporles', 'Mallorca', '971611896', '971611869', 'iesjosepfontitrias@educaib.eu', NULL, NULL, 24, 1, 19),
(795, 465, 'pública', 'IES', '07007796', 'IES Josep Maria Llompart', 'C/ del Pedagog Joan Capó s/n  ', '07010', 'Palma', 'Palma', 'Mallorca', '971204601', '971206805', 'direccio@iesllompart.cat', NULL, NULL, 35, 1, 38),
(796, 466, 'pública', 'IES', '07000832', 'IES Josep Maria Quadrado', 'C/ de Mallorca 65  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971480237', '971480837', 'iesjosepmariaquadrado@educaib.eu', NULL, NULL, 8, 2, 62),
(797, 467, 'pública', 'IES', '07007607', 'IES Josep Miquel Guàrdia', 'Av. de la Verge de Monte Toro s/n  ', '07730', 'Alaior', 'Alaior', 'Menorca', '971372744', '971372758', 'iesjosepmiquelguardia@educaib.eu', NULL, NULL, 18, 2, 69),
(798, 468, 'pública', 'IES', '07007747', 'IES Josep Sureda i Blanes', 'C/ de Joan Coll 2  ', '07008', 'Palma', 'Palma', 'Mallorca', '971278416', '971279832', 'iesjosepsuredaiblanes@educaib.eu', NULL, NULL, 17, 1, 38),
(799, 470, 'pública', 'IES', '07013139', 'IES La Ribera', 'C/ de Martinet s/n  ', '07610', 'Can Pastilla', 'Palma', 'Mallorca', '971494189', '971494193', 'ieslaribera@educaib.eu', NULL, NULL, 25, 1, 38),
(800, 471, 'pública', 'IES', '07006305', 'IES Llorenç Garcías i Font', 'C/ de Pere Amorós Esteva 4  ', '07570', 'Artà', 'Artà', 'Mallorca', '971836334', '971836892', 'iesllorencgarciasifont@educaib.eu', NULL, NULL, 7, 1, 6),
(801, 472, 'pública', 'IES', '07008511', 'IES Llucmajor', 'C/ de Gràcia 73  ', '07620', 'Llucmajor', 'Llucmajor', 'Mallorca', '971660052', '971660004', 'iesllucmajor@educaib.eu', NULL, NULL, 30, 1, 29),
(802, 473, 'pública', 'IES', '07007371', 'IES Madina Mayurqa', 'C/ de Miquel Arcas 4  ', '07010', 'Palma', 'Palma', 'Mallorca', '971757278', NULL, 'iesmadinamayurqa@educaib.eu', NULL, NULL, 32, 1, 38),
(803, 478, 'pública', 'IES', '07002208', 'IES Manacor', 'Camí de ses Tapareres 32  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971551489', '971844464', 'iesmanacor@educaib.eu', NULL, NULL, 19, 1, 30),
(804, 474, 'pública', 'IES', '07007802', 'IES Marc Ferrer', 'Av. de Porto Saler s/n  ', '07860', 'Sant Francesc de Formentera', 'Formentera', 'Formentera', '971321222', '971321032', 'iesmarcferrer@educaib.eu', NULL, NULL, 36, 4, 23),
(805, 475, 'pública', 'IES', '07000844', 'IES Maria Àngels Cardona', 'Rda. de Balears s/n  ', '07760', 'Ciutadella de Menorca', 'Ciutadella de Menorca', 'Menorca', '971380166', '971482757', 'iesmariaangelscardona@educaib.eu', NULL, NULL, 16, 2, 62),
(806, 476, 'pública', 'IES', '07008818', 'IES Marratxí', 'C/ de l\'Arbre de la Ciència 1  ', '07141', 'Son Ramonell', 'Marratxí', 'Mallorca', '971226622', '971226635', 'iesmarratxi@educaib.eu', NULL, NULL, 22, 1, 33),
(807, 477, 'pública', 'IES', '07002191', 'IES Mossèn Alcover', 'Rda. de l\'Institut s/n  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971551193', '971551439', 'iesmossenalcover@educaib.eu', NULL, NULL, 19, 1, 30),
(808, 873, 'pública', 'IES', '07015847', 'IES Nou Llevant', 'C/ de Caracas 6  ', '07007', 'Palma', 'Palma', 'Mallorca', '971329832', NULL, 'iesnoullevant@educaib.eu', '0000-00-00', NULL, 30, 1, 38),
(809, 479, 'pública', 'IES', '07001940', 'IES Pasqual Calbó i Caldés', 'C/ de Francesc Femenias Andreu 1  ', '07702', 'Maó', 'Maó', 'Menorca', '971369390', '971354104', 'iespasqualcalbo@educaib.eu', NULL, NULL, 8, 2, 34),
(810, 481, 'pública', 'IES', '07003869', 'IES Politècnic', 'C/ de Menorca 1  ', '07011', 'Palma', 'Palma', 'Mallorca', '971731242', '971457718', 'iespolitecnic@educaib.eu', NULL, NULL, 23, 1, 38),
(811, 482, 'pública', 'IES', '07013152', 'IES Porreres', 'Ctra. de Montuïri s/n  ', '07260', 'Porreres', 'Porreres', 'Mallorca', '971168590', '971168217', 'iesporreres@educaib.eu', NULL, NULL, 14, 1, 41),
(812, 593, 'pública', 'IES', '07013590', 'IES Moll Vell', 'C/ del Bisbe Pont s/n  ', '07400', 'Port d\'Alcúdia', 'Alcúdia', 'Mallorca', '971547246', '971897830', 'iesportdalcudia@educaib.eu', '0000-00-00', NULL, 3, 1, 2),
(813, 484, 'pública', 'IES', '07013371', 'IES Porto Cristo', 'Ctra. de Porto Cristo - Son Servera s/n  ', '07680', 'Porto Cristo', 'Manacor', 'Mallorca', '971820432', '971822701', 'iesportocristo@educaib.eu', NULL, NULL, 33, 1, 30),
(814, 485, 'pública', 'IES', '07008375', 'IES Puig de sa Font', 'C/ de sa Conillera 2  ', '07550', 'Son Servera', 'Son Servera', 'Mallorca', '971817396', '971567516', 'iespuigdesafont@educaib.eu', NULL, NULL, 33, 1, 59),
(815, 486, 'pública', 'IES', '07007553', 'IES Quartó de Portmany', 'Camí de Cas Ramons 4  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '971343101', '971343761', 'iesquartodeportmany@educaib.eu', NULL, NULL, 10, 3, 44),
(816, 824, 'pública', 'IES', '07015410', 'IES Quartó del Rei', 'C/ de Rafael Sainz de la Cuesta 5  ', '07840', 'Santa Eulària des Riu', 'Santa Eulària des Riu', 'Eivissa', '971935793', NULL, 'iesquartodelrei@educaib.eu', NULL, NULL, 36, 3, 51),
(817, 487, 'pública', 'IES', '07003870', 'IES Ramon Llull', 'V. de Portugal 2  ', '07012', 'Palma', 'Palma', 'Mallorca', '971763100', '971763238', 'iesramonllull@educaib.eu', NULL, NULL, 9, 1, 38),
(818, 495, 'pública', 'IES', '07008065', 'IES S\'Arenal', 'Ctra. Antiga de Cap Blanc s/n  ', '07600', 'S\'Arenal', 'Llucmajor', 'Mallorca', '971442391', '971442254', 'iessarenal@educaib.eu', NULL, NULL, 27, 1, 29),
(819, 488, 'pública', 'IES', '07006299', 'IES Sa Blanca Dona', 'Ctra. de Sant Antoni PK 1  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971310801', '971190347', 'iessablancadona@educaib.eu', NULL, NULL, 10, 3, 63),
(820, 489, 'pública', 'IES', '07008089', 'IES Sa Colomina', 'C/ de Vicent Serra i Orvay 36-40  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971315853', '971310649', 'iessacolomina@educaib.eu', NULL, NULL, 4, 3, 63),
(821, 738, 'pública', 'IES', '07014144', 'IES Sa Serra', 'Camí de Benimussa 7  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '971348423', '971804963', 'iessaserra@educaib.eu', NULL, NULL, 11, 3, 44),
(822, 491, 'pública', 'IES', '07008867', 'IES Sant Agustí', 'Fca. d\'Avall es Pou s/n  ', '07839', 'Sant Agustí des Vedrà', 'Sant Josep de sa Talaia', 'Eivissa', '971800636', '971800951', 'iessantagusti@educaib.eu', NULL, NULL, 10, 3, 47),
(823, 736, 'pública', 'IES', '07014879', 'IES Sant Marçal', 'C/ de la Casa del Poble s/n  ', '07141', 'Sa Cabaneta', 'Marratxí', 'Mallorca', '971797807', '971797038', 'iessantmarcal@educaib.eu', NULL, NULL, 22, 1, 33),
(824, 492, 'pública', 'IES', '07008351', 'IES Santa Margalida', 'Ctra. de Santa Margalida - Can Picafort s/n  ', '07450', 'Santa Margalida', 'Santa Margalida', 'Mallorca', '971856000', '971523728', 'iessantamargalida@educaib.eu', NULL, NULL, 34, 1, 52),
(825, 737, 'pública', 'IES', '07014909', 'IES Santa Maria', 'Av. de Margalida Calafat 5  ', '07320', 'Santa Maria del Camí', 'Santa Maria del Camí', 'Mallorca', '971140979', NULL, 'iessantamaria@educaib.eu', NULL, NULL, 2, 1, 53),
(826, 493, 'pública', 'IES', '07001371', 'IES Santa Maria d\'Eivissa', 'Av. d\'Ignasi Wallis 33  ', '07800', 'Eivissa', 'Eivissa', 'Eivissa', '971191551', '971190018', 'iessantamariadeivissa@educaib.eu', NULL, NULL, 11, 3, 63),
(827, 494, 'pública', 'IES', '07008053', 'IES Santanyí', 'C/ de Bernat Vidal i Tomàs s/n  ', '07650', 'Santanyí', 'Santanyí', 'Mallorca', '971642071', '971654098', 'iessantanyi@educaib.eu', NULL, NULL, 17, 1, 54),
(828, 496, 'pública', 'IES', '07007838', 'IES Ses Estacions', 'C/ del Marquès de Fontsanta 12  ', '07005', 'Palma', 'Palma', 'Mallorca', '971770267', '971468012', 'iessesestacions@educaib.eu', NULL, NULL, 34, 1, 38),
(829, 497, 'pública', 'IES', '07008481', 'IES Sineu', 'Ctra. de Lloret s/n  ', '07510', 'Sineu', 'Sineu', 'Mallorca', '971520268', '971855023', 'iessineu@educaib.eu', NULL, NULL, 7, 1, 57),
(830, 874, 'pública', 'IES', '07015859', 'IES Son Cladera', 'Camí de Son Cladera 20  ', '07009', 'Palma', 'Palma', 'Mallorca', '871114990', NULL, 'iessoncladera@educaib.eu', '0000-00-00', NULL, 2, 1, 38),
(831, 498, 'pública', 'IES', '07008363', 'IES Son Ferrer', 'C/ del Còndor 9  ', '07181', 'Son Ferrer', 'Calvià', 'Mallorca', '971230470', '971230895', 'iessonferrer@educaib.eu', NULL, NULL, 23, 1, 11),
(832, 499, 'pública', 'IES', '07003845', 'IES Son Pacs', 'Ctra. de Sóller 13  ', '07120', 'Son Sardina', 'Palma', 'Mallorca', '971292050', '971761545', 'iessonpacs@educaib.eu', NULL, NULL, 20, 1, 38),
(833, 500, 'pública', 'IES', '07006925', 'IES Son Rullan', 'C/ de l\'Arquebisbe Miquel Roca 10  ', '07009', 'Palma', 'Palma', 'Mallorca', '971472243', '971476372', 'iessonrullan@educaib.eu', NULL, NULL, 2, 1, 38),
(834, 501, 'pública', 'IES', '07007759', 'IES Xarc', 'Ctra. d\'es Canar s/n  ', '07840', 'Santa Eulària des Riu', 'Santa Eulària des Riu', 'Eivissa', '971339500', '971339459', 'iesxarc@educaib.eu', NULL, NULL, 11, 3, 51),
(835, 829, 'pública', 'SAED', '07500798', 'SAED Eivissa i Formentera', NULL, '07800', 'Eivissa', 'Eivissa', 'Eivissa', NULL, NULL, 'saedeivissa@educaib.eu', NULL, NULL, 4, 3, 63),
(836, 828, 'pública', 'SAED', '07500786', 'SAED Menorca', NULL, '07703', 'Maó', 'Maó', 'Menorca', NULL, NULL, 'saedmenorca@educaib.eu', NULL, NULL, 18, 2, 34),
(837, 89, 'pública', 'UD', '07500725', 'UD Es Puig des Bous', 'C/ de l\'Hospitalet 12  ', '07011', 'Sa Vileta', 'Palma', 'Mallorca', '971606394', NULL, NULL, NULL, NULL, 23, 1, 38),
(838, 850, 'pública', 'UD', '07500816', 'UD Tramuntana', 'Camí de la Real 46  ', '07120', 'Son Espanyol', 'Palma', 'Mallorca', '628132457', NULL, NULL, '0000-00-00', NULL, 32, 1, 38),
(839, 854, 'pública', 'PQI-AJ', '07600392', 'PQI-AJ Alcúdia (adscrit a l\'IES Alcúdia)', 'Pg. Marítim 1 (Alcudiamar)', '07400', 'Alcúdia', 'Alcúdia', 'Mallorca', '971897185', NULL, 'mllrusca@alcudia.net', '0000-00-00', NULL, 3, 1, 2),
(840, 5, 'pública', 'PQI-AJ', '07600033', 'PQI-AJ Calvià (adscrit a l\'IES Son Ferrer)', 'C/ de l\'Astor 12  ', '07181', 'Son Ferrer', 'Calvià', 'Mallorca', '971134613', '971683090', 'info@ifoc.es', NULL, NULL, 23, 1, 11),
(841, 880, 'privada', 'PQI-EP', '07600409', 'PQI-EP Accent (adscrit al CIFP Son Llebre)', 'Av. del Doctor Fleming 52  ', '07820', 'Sant Antoni de Portmany', 'Sant Antoni de Portmany', 'Eivissa', '871112530', NULL, 'secretaria@totheducatiu.com', '0000-00-00', NULL, 10, 3, 44),
(842, 905, 'privada', 'PQI-EP', '07600409', 'PQI-EP Accent (adscrit al CIFP Son Llebre)', 'C/ de Ca na Vinagre 11  ', '07007', 'Palma', 'Palma', 'Mallorca', '971476895', NULL, 'secretaria@totheducatiu.com', '0000-00-00', NULL, 24, 1, 38),
(843, 834, 'privada', 'PQI-EP', '07600355', 'PQI-EP AMADIBA (adscrit al CIFP Son Llebre)', 'C/ de Ca na Vinagre 11  ', '07007', 'Palma', 'Palma', 'Mallorca', '971476895', '971478352', 'amadiba@amadiba.org', NULL, NULL, 24, 1, 38),
(844, 10, 'privada', 'PQI-EP', '07600197', 'PQI-EP AMADIP.ESMENT Fundació (adscrit a l\'IES Sant Marçal)', 'Av. del Cid PK 1,1  ', '07198', 'Son Ferriol', 'Palma', 'Mallorca', '971711627', '971722332', 'amadip@amadipesment.org', NULL, NULL, 34, 1, 38),
(845, 893, 'privada', 'PQI-EP', '07600197', 'PQI-EP AMADIP.ESMENT Fundació (adscrit a l\'IES Sant Marçal)', 'Ptge. de Cala Figuera 10  ', '07009', 'Palma', 'Palma', 'Mallorca', '971711627', '971722332', 'amadip@amadipesment.org', '0000-00-00', NULL, 34, 1, 38),
(846, 761, 'privada', 'PQI-EP', '07500373', 'PQI-EP APROSCOM (adscrit al CIFP Politècnic de Llevant)', 'C/ des Canyar s/n  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971552625', '971844849', 'aproscom@aproscom.org', '0000-00-00', NULL, 19, 1, 30),
(847, 430, 'privada', 'PQI-EP', '07600148', 'PQI-EP Fundació Patronat Obrer de Sant Josep (adscrit a l\'IES Politècnic)', 'C/ de Montevideo 6  ', '07006', 'Palma', 'Palma', 'Mallorca', '971466201', '971775160', 'secretaria@patronatobrer.com', NULL, NULL, 30, 1, 38),
(848, 123, 'privada', 'PQI-EP', '07600252', 'PQI-EP Fundació per a Persones amb Discapacitat Illa de Menorca (adscrit a l\'IES Josep Miquel Guàrdia)', 'V. de Ronda de s\'Estància 55  ', '07740', 'Es Mercadal', 'Es Mercadal', 'Menorca', '971481447', '971484279', 'pqie@fundaciodiscap.org', NULL, NULL, 18, 2, 35),
(849, 435, 'privada', 'PQI-EP', '07600094', 'PQI-EP Germanes de la Caritat de Sant Vicenç de Paül (adscrit a l\'IES Guillem Sagrera)', 'C/ de Can Ferragut 4A  ', '07011', 'Sa Vileta', 'Palma', 'Mallorca', '971783019', '971799704', 'hcaridad_1@infonegocio.com', NULL, NULL, 1, 1, 38),
(850, 955, 'privada', 'CEI', '07016852', 'CEI Kaia', 'C/ Aragón, 224A', '07008', 'Palma', 'Palma', 'Mallorca', '651581696', NULL, NULL, '0000-00-00', NULL, 2, 1, 38),
(854, 0, NULL, '<br />\r\n<b', '1', 'Centre de proves', 'Prova', '07000', 'Prova', NULL, NULL, '1', '2', 'e@e.es', NULL, NULL, NULL, 1, 40);

-- --------------------------------------------------------

--
-- Estructura de la taula `centre_conveni`
--

CREATE TABLE `centre_conveni` (
  `id_centre` int(11) NOT NULL,
  `id_conveni` int(11) NOT NULL,
  `pressupost` decimal(10,2) NOT NULL,
  `observacions` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `centre_conveni`
--

INSERT INTO `centre_conveni` (`id_centre`, `id_conveni`, `pressupost`, `observacions`) VALUES
(175, 3, '101.00', 'cap');

-- --------------------------------------------------------

--
-- Estructura de la taula `conveni`
--

CREATE TABLE `conveni` (
  `id` int(11) NOT NULL,
  `codi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descripcio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ajuntament_id` int(11) NOT NULL,
  `estat_conveni_id` int(11) NOT NULL,
  `data_signatura` date DEFAULT NULL,
  `data_inici` date DEFAULT curdate(),
  `data_pagament` date DEFAULT NULL,
  `pressupost` decimal(12,2) DEFAULT NULL,
  `observacions` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `conveni`
--

INSERT INTO `conveni` (`id`, `codi`, `descripcio`, `ajuntament_id`, `estat_conveni_id`, `data_signatura`, `data_inici`, `data_pagament`, `pressupost`, `observacions`) VALUES
(3, '2025-1', 'Conveni de prova e', 51, 1, '2025-04-16', '2025-04-03', '2025-04-16', '500.01', 'Primer conveni 4');

--
-- Disparadors `conveni`
--
DELIMITER $$
CREATE TRIGGER `before_insert_convenis` BEFORE INSERT ON `conveni` FOR EACH ROW BEGIN
  DECLARE any_actual INT;
  SET any_actual = YEAR(NEW.data_inici);

  -- Assigna el codi si no s’ha proporcionat
  IF NEW.codi IS NULL THEN
    SET NEW.codi = generar_codi_conveni(any_actual);
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de la taula `conveni_seq`
--

CREATE TABLE `conveni_seq` (
  `any` int(11) NOT NULL,
  `seguent_valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `conveni_seq`
--

INSERT INTO `conveni_seq` (`any`, `seguent_valor`) VALUES
(2025, 2);

-- --------------------------------------------------------

--
-- Estructura de la taula `desti_actuacio`
--

CREATE TABLE `desti_actuacio` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `desti_actuacio`
--

INSERT INTO `desti_actuacio` (`id`, `nom`) VALUES
(1, 'CAIB'),
(2, 'IBISEC'),
(3, 'Ajuntament'),
(4, 'Centres'),
(5, 'Particular');

-- --------------------------------------------------------

--
-- Estructura de la taula `document_actuacio`
--

CREATE TABLE `document_actuacio` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` date NOT NULL DEFAULT current_timestamp(),
  `actuacio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `document_actuacio`
--

INSERT INTO `document_actuacio` (`id`, `nom`, `url`, `data`, `actuacio_id`) VALUES
(10, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ev4-PEPgeipKlf3bjAh-gZkBgSsVsV4OtDkq_dxysG5D-g?e=OUrcKu', '0000-00-00', 21),
(15, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP%5FEsFossaret%5FSoller%2F25%2D01%5FUnitatExterior%5FSistemaClimatitzaci%C3%B3&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '2025-01-10', 28),
(16, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP%5FDuran%20Estrany%2F25%2D02%5FFiltracionsCoberta&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '0000-00-00', 35),
(17, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP%5FSonSerra%5FCEIPIEEM%5FPalma%2F24%2D09%5FCarpesOmbraPati&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '0000-00-00', 34),
(18, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FIES%2FMenorca%2FIES%5FJoanRamisIRamis%5FMa%C3%B3%2F24%2D05%5FContracteMenor%5FPintarFa%C3%A7ana&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '0000-00-00', 33),
(19, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP%5FEsMolinar%5FPalma%2F2023%5FLamel%C2%B7les%20aules&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '0000-00-00', 37),
(20, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP%5FGabrielComasiRibas%2F25%2D02%5FCondicionamentAc%C3%BAsticMenjador&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '0000-00-00', 38),
(21, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?newTargetListUrl=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits&viewpath=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2FForms%2FAllItems%2Easpx&id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FIES%2FMallorca%2FIES%5FSantMarcal%2F2025%2D01%5FPressupostsGoteres&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '0000-00-00', 39),
(22, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FIES%2FMallorca%2FIES%5FGuillemCifreColonya%2F24%2D11%5FFinestresPersianesCanals%2FCanals&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '0000-00-00', 40),
(23, 'Sol·licitud del centre', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EVZ5RmpZcxhCv_4CzbBs89MBwwNqqE8XYaJ-79F6A5ClLg?e=gG8Vxj', '0000-00-00', 40),
(24, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FIES%2FMallorca%2FIES%5FGuillemCifreColonya%2F24%2D11%5FFinestresPersianesCanals%2FFinestres&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '0000-00-00', 42),
(25, 'Sol·licitud del centre', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EVZ5RmpZcxhCv_4CzbBs89MBwwNqqE8XYaJ-79F6A5ClLg?e=qYEcEy', '0000-00-00', 42),
(26, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FIES%2FMallorca%2FIES%5FGuillemCifreColonya%2F24%2D11%5FFinestresPersianesCanals%2FPersianes&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '0000-00-00', 44),
(27, 'Sol·licitud del centre', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EVZ5RmpZcxhCv_4CzbBs89MBwwNqqE8XYaJ-79F6A5ClLg?e=VTgb64', '0000-00-00', 44),
(28, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FIES%2FMallorca%2FIES%5FFelanitx%2F24%2D12%5FCanviAlarma&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '0000-00-00', 45),
(37, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMenorca%2FCEIP%5FSaGraduada%5FMao%2F25%2D01%20Reparaci%C3%B3%20mur%20de%20tancament%20del%20pati&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '0000-00-00', 56),
(38, '@ reiteració Estructures de jocs al pati', 'https://outlook.office.com/mail/infraestructureseducatives@ibeducacio.eu/inbox/id/AAQkAGI1ZDY4NGUxLTgzMWYtNDllZC04Y2ZhLWMwOGM1MDI0ZDRmYQAQAA59ONltQ3BCvLGTvDpHXkk%3D', '0000-00-00', 57),
(39, 'Projecte pati infantil', 'https://outlook.office.com/mail/infraestructureseducatives@ibeducacio.eu/inbox/id/AAQkAGI1ZDY4NGUxLTgzMWYtNDllZC04Y2ZhLWMwOGM1MDI0ZDRmYQAQAA59ONltQ3BCvLGTvDpHXkk%3D/sxs/AAMkAGI1ZDY4NGUxLTgzMWYtNDllZC04Y2ZhLWMwOGM1MDI0ZDRmYQBGAAAAAAC7xEvRbg6IT71v2mZb4WVlBwBwKrJBOS47QqhsJkUjAgfXAAAAAAEMAABwKrJBOS47QqhsJkUjAgfXAAAOPFDjAAABEgAQACFXMmyoy5hJldGv6LR2CBg%3D', '0000-00-00', 57),
(42, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ej4KbdO_hLFHjoGsr45MiE8B75vu0Ssg7ztKJi3NhChZxA?e=JOlHYd', '0000-00-00', 59),
(43, 'Mail', 'https://outlook.office.com/mail/infraestructureseducatives@ibeducacio.eu/inbox/id/AAQkAGI1ZDY4NGUxLTgzMWYtNDllZC04Y2ZhLWMwOGM1MDI0ZDRmYQAQAKnJb7P1I1xOjyT%2BRr2N6SI%3D', '0000-00-00', 60),
(44, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP%5FEstabliments%5FPalma%2F23%2D07%20i%2024%2D09%5FTendal%2F20240916%5FPetici%C3%B3Tendals&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '0000-00-00', 60),
(45, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ErnHiYZ9_SxMs7ZIU-oyHTQBsv5xMjb0VeScTwZSRiU2qw?e=Ymmd4w', '0000-00-00', 61),
(46, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EkF8gDHhn9hDvlVRerUUt0EBHBAUpPybdWmweN9B1bKlTw?e=LjU1Ut', '0000-00-00', 62),
(47, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EpiFhmhrxlxKlf1ghOuniqEB-vZjVZYH7C1f-T2fvurNyw?e=SpXFBc', '0000-00-00', 63),
(48, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EgvCk6Pwsq1FnVj9-0mj6hkBWcTqS5flgboy4XvNfTHJyw?e=7PkOF9', '0000-00-00', 64),
(49, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?ga=1&id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FIES%2FEivissa%20i%20Formentera%2FIES%5FSaSerra%5FSntAntoni%2F2025%2D03%5FSubstituci%C3%B3PlacaElectr%C3%B2nicaAireCondicioant&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '0000-00-00', 65),
(50, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ErizcQvNs4RBjP0zDZfnlyIBsC5GMMkwR6sOn_sRi5B6yQ?e=SoxOMP', '0000-00-00', 66),
(51, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EoJGVcoVjXNJgnBkSCSpbKcBgXHPH7T75dPNtJ8ac0UbSg?e=lkKI47', '2025-03-25', 67),
(52, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EhF9F757RmhLhaYvoLZUKz8BhEN1JnXXD9VCLC3MValdYg?e=ThM8h0', '0000-00-00', 70),
(53, 'Carpeta dels documents (actuacions vàries)', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Epyah1j3EjZKgQCil7_Q27cBTt986QeO_h5ByLJxSwd-YQ?e=r8uu1c', '0000-00-00', 70),
(55, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EmrKxl7HCKdNjiNFPG-3-tcB_6RytLCiFj4X75ONR0erdA?e=18ipRg', '0000-00-00', 72),
(56, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eo0KcnbZj4NGjT50s_fGuw4B4sP1S3B77tFkS3rF1eG85Q?e=kijgb7', '0000-00-00', 73),
(57, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Er32jy1y-EZHhnDpgLwDHlMBixKOMdRzLOIEnfq_jWxoiw?e=saD2ZA', '2025-03-27', 74),
(58, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EsIbubCI5LBOvvkHUtuEaVoB2TnM5iFUsXgI8gEX79CRnw?e=4LvvH1', '2025-03-18', 75),
(59, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eognf9QAHzBFlETMRudk0kUB8t1OFaa5gmzal_6bwNfp6Q?e=2vGuyq', '2025-03-27', 76),
(60, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eh8Vf4bfabxMjCsMVT0yrAwBlWUbgvhEwMJK_apINBWkVA?e=zmuG5h', '2025-03-27', 78),
(61, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eg9lFVrNf4pCgJzXwkhNKvsBdjfPxUn4pfWHXWhNf1w7ww?e=ZhmPq5', '0000-00-00', 77),
(62, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EgQXt3xJYtxGl9jlIZ9jTkUBr7vAVSPJnm2MtOKOlS7WWg?e=zMprej', '2025-03-27', 80),
(63, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eioetedy77NKrWs8NwcHuy0BnrlTD0-QtXCFXkgG2aOrjA?e=ADF6NI', '2025-03-31', 81),
(64, 'Mail', 'https://outlook.office.com/mail/infraestructureseducatives@ibeducacio.eu/inbox/id/AAQkAGI1ZDY4NGUxLTgzMWYtNDllZC04Y2ZhLWMwOGM1MDI0ZDRmYQAQAGoNdoB4EzZMta8aoQj4Duk%3D', '2025-03-31', 82),
(65, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eq0eIv5tiYRGvr9rc3FtJvoBUiKcbIapOLqNknWcVQHqNA?e=43wAej', '2025-03-31', 83),
(66, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eon6cCMCVNpGjNucEK-nW3AB9NBeiD3DqIVZwAqtH-sn9A?e=RAWRTv', '0000-00-00', 84),
(67, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eq0eIv5tiYRGvr9rc3FtJvoBUiKcbIapOLqNknWcVQHqNA?e=0IavxS', '2025-03-31', 85),
(69, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ekl72lRDQghMoa1Y_HEhulQBQ-gzZzsrDYtDUrCWtaPWaQ?e=fFqwki', '2025-03-20', 87),
(70, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP%5FSesMarjades%5FSoller%2F20250401%5FRenovaci%C3%B3Cuina&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '2025-04-01', 88),
(71, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP%5FSonJuny%5FSantJoan%2F2025%2D04%2D02%5FSol%2Elicitud%5Faula%5Fprefabricada&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '2025-04-02', 89),
(72, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP%5FBadies%2F25%2D01%5FLlistatDesperfectesCentre%2FFwd%5F%20Desperfectes&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '2025-04-02', 91),
(73, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EhQrd6vy-Z5Hg-PpdeLyCm0BHpYOVVPbnX_IeOFIHNNtPg?e=Cwfxca', '0000-00-00', 90),
(74, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ErcXCYJuSz9HmE5ANav4bLIBMLlqteI2Pgfg1iFIn6T7Eg?e=eWnaeK', '0000-00-00', 92),
(75, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ElwfGZs3KutLgVz9Xj_QAPwBvZifHIJJ9xKCl2rb32j5wg?e=9LDjOC', '2025-04-03', 93),
(76, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EnIPoP_IGeJDsIDAotZZsL4Bf-U7neW7rngFBmVFtaTeMA?e=jH01YL', '2025-04-04', 94),
(77, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EmB-O0_Nz5JPuE8ueH2da3cBwUfJlCMtlDmn9ewHnTRNdA?e=9wMRVT', '2025-04-04', 95),
(78, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP%5FPuigDeSantMart%C3%AD%5F%28anticNouAlc%C3%BAdia%29&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '2025-04-04', 96),
(79, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FEivissa%20i%20Formentera%2FCEIP%5FNostraSraDeJesus%2F25%2D03%5FFrigor%C3%ADfic', '2025-03-25', 68),
(80, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EsM-D8cZ43pFu21IAka5-YkBYNEtShGWaelTbxm5DVScIw?e=8SmYWF', '2025-04-04', 97),
(82, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eh6j0xflFDNEjWF2r_agtwgB66tr16gOJh8AMSwZ5hu9gw?e=ZM9ctb', '2025-04-10', 99),
(83, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EuWxC7tWKLJIuKm7FO8evAAB0CXHyPmNZm51Vc390i0dUQ?e=pEzU9f', '0000-00-00', 101),
(84, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ErqYRAm3ZOlLnCxGB3lwa08BhaUklWvfTf_gG6NzcbzjFw?e=2gyHKf', '2025-04-11', 102),
(85, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EtAw__QmaAVHkpBBPJpYfZ4BUxOH5DESrktKA0h79-J5mA?e=G6QoYW', '2025-04-11', 103),
(86, 'Mail', 'https://outlook.office.com/mail/infraestructureseducatives@ibeducacio.eu/inbox/id/AAQkAGI1ZDY4NGUxLTgzMWYtNDllZC04Y2ZhLWMwOGM1MDI0ZDRmYQAQAFe%2BbNGNjMBGm6kEgJqQtaE%3D', '2025-04-14', 104),
(87, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EkFi1do4gQxMtgjA2GZrw1AB1xrOo-7DX7rDbBGd6AoScA?e=3U3DkB', '2025-05-12', 106),
(88, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ErpOOesa8V5Bq32tyyYr0W8BTtEf39xulGnPJN4dZ7mbkA?e=gV4oiK', '2025-04-15', 105),
(89, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FIES%2FMallorca%2FIES%5FSArenal%5F%20Llucmajor%2F25%2D04%5FDesprenimentReixaMet%C3%A0l%C2%B7lica&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9&ga=1', '0000-00-00', 100),
(90, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EruGOIGXGp5JmWG52b9vk-cBQcIhz54VroHr5SwATY4qvA?e=nOlXEE', '2025-04-28', 107),
(91, 'Reiteració sol. aula prefabricada i informació sobre la licitació de la cuina', 'https://outlook.office.com/mail/infraestructureseducatives@ibeducacio.eu/inbox/id/AAQkAGI1ZDY4NGUxLTgzMWYtNDllZC04Y2ZhLWMwOGM1MDI0ZDRmYQAQAGzv31BSa2NPjoZZIipd0CA%3D', '2025-04-30', 89),
(92, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EcE9G_W4rkJKn3vdgqeoyxABpozPhO4CYZ22tGvseuwkew?e=TMnDwW', '2025-05-02', 108),
(93, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP%5FMarianAguilo%5FPalma%2F25%2D05%5FDescalcificadorAvariat&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9&ga=1', '2025-05-02', 109),
(94, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ElzTUpcTcCtFi3TrofwQT1oBtKiJldk_4ykk_MsZoUhlmQ?e=2UQwkb', '2025-05-02', 110),
(95, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EYp8qs_Tz_5Lo5zasmCbnCgBS9Xf9hwjXBy6KzVdAiwQ3Q?e=3L1rLd', '2025-05-06', 111),
(96, 'foto', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FIES%2FMallorca%2FIES%5FJSuredaiBlanesPalma%2F2025%2D05%5FVandalisme%5FIncendi%5FCaigudaMurPerimetral%2F1000167420%2Ejpg&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9&parent=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FIES%2FMallorca%2FIES%5FJSuredaiBlanesPalma%2F2025%2D05%5FVandalisme%5FIncendi%5FCaigudaMurPerimetral', '2025-05-06', 112),
(97, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Emh1YuxbP9FGjChd1AJmL50BQmC2GCuzPlax-YOd_i6MYg?e=gf7Emr', '2025-05-06', 112),
(98, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ElRMvEkkcalMsGT_gQsorVABml9OO7s95dG4AAlCc5MjHg?e=cZtmFJ', '2025-05-06', 113),
(99, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EqMjTusWxrJDtM0S9xgC2NwBVpdI0ZjOHEmO_e4LspHBng?e=lnpgIy', '2025-05-07', 114),
(100, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EpoSQSB8neJEpkvy6M0cMWYBeY5XhMrHK9Q2nTV9CkmVUQ?e=gAfGXV', '2025-05-07', 115),
(101, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Etoju7-ufqxBnvI0luqhm_kB1NY-Grj81fnjpkYVH4Qw-Q?e=BxTKco', '2025-05-08', 116),
(103, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ev_-kSxnfttJlHKiUY5KBMgBYPXXRdT_YUj09pqM4gBYFA?e=hykcLI', '2025-05-08', 117),
(104, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ESHbGSG1IxJCgOCBoZuyoYIBsyF5f9_ni3EjZZePPnaBww?e=Ul6jvt', '2025-05-12', 118),
(105, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EjtD9tSesm1Lm0laUOLXIV4B5dQL2fMUR5f11aokfR04YQ?e=9Hk0gk', '2025-05-12', 119),
(106, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EvYiFQP2YAJJg5w4dfOwHqEBFjNfOMg26KvdNoIaUGUDKA?e=Dcugzs', '2025-05-13', 120),
(107, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ep3ICmhSdgJPm5CEoWY2mP0BF3spVgvzPwcoWZ-u15NRyw?e=RX0tIM', '2025-05-13', 121),
(108, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ESovcOayYLtArd_-ov1LyaUBon0U4cnq3AJoAtYztxdB6g?e=DMmjEU', '2025-05-16', 122),
(109, 'Carpeta de l\'expedient', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EvRNPqiykVdOvxrNo9WRlF4B_PJ-U7p7S2aRNjfNYuG7SQ?e=ipBdzT', '2025-03-31', 86),
(110, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EspP45T1GL1DswUs7YB50pYBh8Bx29uDUULYSYjTOVOYVA?e=XLGY4o', '2025-05-16', 125),
(111, 'Pressuposts', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EqbO8DtYe7JHuN30rZLKEhQBWcQ2gVkDuoPjxHv-7PiiRg?e=6Ajn3p', '2025-05-14', 126),
(112, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EqtZEbgPE4RKrx68PHeY7OoBrEVj9jEFaqHh2Wpd6Xl5jg?e=nm0vsa', '2025-05-19', 127),
(113, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EayyVffG6_tAok180uCV8icBSf5ct4AWCUqUCdy823gXEw?e=cpdcKO', '2025-05-19', 128),
(114, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ev92d4mKZxFAqGaLBDI-wDYBdV2RWyK1rSIhnFKGqqzy8Q?e=eGXinD', '2025-05-13', 129),
(115, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EWAOsB0ozd1HjTek2MjBgF8BkTYpBfcvgvhulPVhqfCjgQ?e=gItCzA', '2025-03-12', 130),
(116, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Ee076WvCN79FgZEvOgf4q2EBjOXAUUsObDCP5Rz_axCGeQ?e=3msjX0', '2025-05-19', 131);

-- --------------------------------------------------------

--
-- Estructura de la taula `document_actuacio_conveni`
--

CREATE TABLE `document_actuacio_conveni` (
  `id` int(11) NOT NULL,
  `actuacio_id` int(11) NOT NULL,
  `tipus_id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `espai`
--

CREATE TABLE `espai` (
  `codi` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipus` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ubicacio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ocupacio_per_persona` decimal(11,1) DEFAULT NULL,
  `metres_per_unitat` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `espai`
--

INSERT INTO `espai` (`codi`, `nom`, `tipus`, `ubicacio`, `ocupacio_per_persona`, `metres_per_unitat`) VALUES
(1, 'DESPATX DIRECTOR', 'Complementari', 'Interior', '1.5', '20.00'),
(2, 'DESPATX SECRETARI', 'Complementari', 'Interior', '1.5', '15.00'),
(3, 'DESPATX CAP D\'ESTUDIS', 'Complementari', 'Interior', '1.5', '15.00'),
(4, 'DESPATX ORIENTACIÓ', 'Complementari', 'Interior', '1.5', '15.00'),
(5, 'SECRETARIA+ARXIU', 'Complementari', 'Interior', '1.5', '35.00'),
(6, 'SALA PROFESSORS', 'Complementari', 'Interior', '1.5', '55.00'),
(7, 'APIMA+ASS. ALUMNES', 'Complementari', 'Interior', '1.5', '15.00'),
(8, 'CONSERGERIA-REPROGRAFIA', 'Complementari', 'Interior', '1.5', '10.00'),
(9, 'SEMINARIS', 'Complementari', 'Interior', '1.5', '15.00'),
(10, 'BANYS PROFESSORS', 'Complementari', 'Interior', '1.5', '21.00'),
(11, 'BANYS ALUMN', 'Complementari', 'Interior', '1.5', '175.00'),
(12, 'BANY ADAPT', 'Complementari', 'Interior', '1.5', '4.00'),
(13, 'VESTUARIS+BANYS PND', 'Complementari', 'Interior', '1.5', '10.00'),
(14, 'CALDERES', 'Complementari', 'Interior', '1.5', '20.00'),
(15, 'COMPTADORS', 'Complementari', 'Interior', '1.5', '5.00'),
(16, 'CAMBRA DE NETEJA', 'Complementari', 'Interior', '1.5', '5.00'),
(17, 'CAMBRA DE FEMS', 'Complementari', 'Interior', '1.5', '5.00'),
(18, 'CAFETERIA ', 'Complementari', 'Interior', '1.5', '40.00'),
(19, 'MAGATZEM GENERAL', 'Complementari', 'Interior', '1.5', '50.00'),
(20, 'AULA UEECO', 'Docent', 'Interior', '1.5', '35.00'),
(21, 'AULES ESO', 'Docent', 'Interior', '1.5', '47.00'),
(22, 'AULES BATX', 'Docent', 'Interior', '1.5', '54.00'),
(23, 'AULES DESDOBLAMENT', 'Docent', 'Interior', '1.5', '30.00'),
(24, 'SUPORT I REFORÇ EDUCATIU', 'Docent', 'Interior', '1.5', '30.00'),
(25, 'BIBLIOTECA', 'Complementari', 'Interior', '1.5', '75.00'),
(26, 'AULA MUSICA ESO', 'Docent', 'Interior', '1.5', '60.00'),
(27, 'INFORMATICA ', 'Docent', 'Interior', '1.5', '60.00'),
(28, 'AULA PLÀSTICA ESO/BATX', 'Docent', 'Interior', '1.5', '75.00'),
(29, 'TECNOLOGIA ESO', 'Docent', 'Interior', '1.5', '100.00'),
(30, 'LABORAT. CIENCIES', 'Docent', 'Interior', '1.5', '75.00'),
(31, 'PATI', 'Complementari', 'Exterior', '1.5', '900.00'),
(32, 'PISTA POLIESPORTIVA', 'Complementari', 'Exterior', '1.5', '800.00'),
(33, 'PORXO', 'Complementari', 'Exterior', '1.5', '400.00'),
(34, 'APARCAMENT', 'Complementari', 'Exterior', '1.5', '20.00'),
(35, 'SUPERFÍCIE CONSTRUIDA  GIMNÀS I ESPAIS ANNEXOS', 'Complementari', 'Exterior', '1.5', '1500.00'),
(36, 'AULA INFANTIL', 'Docent', 'Interior', '2.0', '75.00'),
(37, 'AULA PRIMÀRIA', 'Docent', 'Interior', '1.5', '75.00');

-- --------------------------------------------------------

--
-- Estructura de la taula `estat_actuacio`
--

CREATE TABLE `estat_actuacio` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `estat_actuacio`
--

INSERT INTO `estat_actuacio` (`id`, `nom`, `color`) VALUES
(1, 'Pendent', '#f9c2b6'),
(2, 'En procés', '#f39c12'),
(3, 'Pendent centre (doc. incompleta)', '#fdc659'),
(4, 'Pendent d\'enviament', '#f9ff3c'),
(5, 'Enviat', '#c7f3f1'),
(6, 'Favorable - Contracte menor', '#87f595'),
(7, 'Favorable - Derivar IBISEC', '#87f595'),
(8, 'Favorable - Recursos del propi centre', '#b2b8ba'),
(9, 'Desfavorable', '#87f595'),
(11, 'Tancada', '#f6faf9'),
(12, 'Pendent de cap de servei', '#fb1304'),
(13, 'Favorable - Sol·licitud expedient despesa', '#6aa1e7'),
(14, 'Favorable - Derivar IBISEC URGENT', '#87f595');

-- --------------------------------------------------------

--
-- Estructura de la taula `estat_conveni`
--

CREATE TABLE `estat_conveni` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `estat_conveni`
--

INSERT INTO `estat_conveni` (`id`, `nom`) VALUES
(1, 'Rebuda sol·licitud Ajuntament'),
(2, 'Preparant annex i esborrany'),
(3, 'Esborrany enviat Ajuntament'),
(4, 'Pendent a Contractació'),
(5, 'Preparant informes'),
(6, 'Enviat a Contractació'),
(7, 'Preparar proposta aprovació'),
(8, 'Proposta enviada a Contractació'),
(9, 'Pendent registre a plataforma'),
(10, 'Registrat');

-- --------------------------------------------------------

--
-- Estructura de la taula `illa`
--

CREATE TABLE `illa` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Bolcament de dades per a la taula `illa`
--

INSERT INTO `illa` (`id`, `nom`) VALUES
(1, 'Mallorca'),
(2, 'Menorca'),
(3, 'Eivissa'),
(4, 'Formentera');

-- --------------------------------------------------------

--
-- Estructura de la taula `informe_actuacio`
--

CREATE TABLE `informe_actuacio` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` date NOT NULL DEFAULT current_timestamp(),
  `url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacions` varchar(4000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actuacio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `informe_actuacio`
--

INSERT INTO `informe_actuacio` (`id`, `nom`, `data`, `url`, `observacions`, `actuacio_id`) VALUES
(7, 'Informe tècnic sobre l\'expedient de despesa ED 2025/18', '2025-03-25', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EfLLp8flLpdAiJZJhAABSDAB3_EskHe3QWilZCthwQPvzw?e=APW8G1', 'Bon dia Andrea,\r\n\r\nAcabo de parlar amb el director del centre. Atès que es tracta d\'una actuació urgent, el centre executarà la despesa com a despesa de centre, i posteriorment des del Servei d\'Infraestructures els enviarem l\'import corresponent. D\'aquesta manera s\'agilitzarà tot el procés.\r\n\r\nSalutacions', 28),
(8, 'INFORME TÈCNIC SOBRE LA VALORACIÓ DE LES FILTRACIONS A LA COBERTA  GIMNÀS I AL PAVES DE FAÇANA', '0000-00-00', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EehdRnU2wFROtQZGVm4qejkB8yCucxOb2kfwO0rxXkYTmg?e=YWz7W5', '', 35),
(11, 'Del. Eivissa ho remet a IBISEC', '2025-04-02', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FIES%2FEivissa%20i%20Formentera%2FIES%5FMarcFerrer%5FFormentera%2F2025%2D02%5FReiteraci%C3%B3Goteres%2F20250404%5F%40%5FDelEivissa%5FDerivaci%C3%B3Actuaci%C3%B3IBISEC%5FGoteresAulesPref%5FIESMarcFerrer%2Epdf&parent=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compart', '', 70),
(12, 'Vistiplau Servei Infraestructures', '2025-03-27', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP%5FSonSerra%5FCEIPIEEM%5FPalma%2F25%2D03%5FActuacionsPatiAFA%2F%40%5FS%5FRespostaProtecci%C3%B3Pilars%2Epdf&parent=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP', 'Es dona vistiplau, pendent de l\'Ajuntament.', 80),
(13, '', '2025-05-15', '', '', 40),
(14, '', '2025-05-15', '', '', 40),
(15, '', '2025-05-15', '', '', 40);

-- --------------------------------------------------------

--
-- Estructura de la taula `mode_enviament`
--

CREATE TABLE `mode_enviament` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `mode_enviament`
--

INSERT INTO `mode_enviament` (`id`, `nom`) VALUES
(1, 'E-mail'),
(2, 'Notificació'),
(3, 'BALIB');

-- --------------------------------------------------------

--
-- Estructura de la taula `municipi`
--

CREATE TABLE `municipi` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_bin NOT NULL,
  `illa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Bolcament de dades per a la taula `municipi`
--

INSERT INTO `municipi` (`id`, `nom`, `illa_id`) VALUES
(1, 'Alaró', 1),
(2, 'Alcúdia', 1),
(3, 'Algaida', 1),
(4, 'Andratx', 1),
(5, 'Ariany', 1),
(6, 'Artà', 1),
(7, 'Banyalbufar', 1),
(8, 'Binissalem', 1),
(9, 'Búger', 1),
(10, 'Bunyola', 1),
(11, 'Calvià', 1),
(12, 'Campanet', 1),
(13, 'Campos', 1),
(14, 'Capdepera', 1),
(15, 'Consell', 1),
(16, 'Costitx', 1),
(17, 'Deià', 1),
(18, 'Escorca', 1),
(19, 'Esporles', 1),
(20, 'Estellencs', 1),
(21, 'Felanitx', 1),
(22, 'Ferreries', 2),
(23, 'Formentera', 4),
(24, 'Fornalutx', 1),
(25, 'Inca', 1),
(26, 'Lloret de Vistalegre', 1),
(27, 'Lloseta', 1),
(28, 'Llubí', 1),
(29, 'Llucmajor', 1),
(30, 'Manacor', 1),
(31, 'Mancor de la Vall', 1),
(32, 'Maria de la Salut', 1),
(33, 'Marratxí', 1),
(34, 'Maó', 2),
(35, 'Es Mercadal', 2),
(36, 'Montuïri', 1),
(37, 'Muro', 1),
(38, 'Palma', 1),
(39, 'Petra', 1),
(40, 'Pollença', 1),
(41, 'Porreres', 1),
(42, 'Puigpunyent', 1),
(43, 'Salines (Ses)', 1),
(44, 'Sant Antoni de Portmany', 3),
(45, 'Sant Joan', 1),
(46, 'Sant Joan de Labritja', 3),
(47, 'Sant Josep de sa Talaia', 3),
(48, 'Sant Llorenç des Cardassar', 1),
(49, 'Sant Lluís', 2),
(50, 'Santa Eugènia', 1),
(51, 'Santa Eulària des Riu', 3),
(52, 'Santa Margalida', 1),
(53, 'Santa Maria del Camí', 1),
(54, 'Santanyí', 1),
(55, 'Selva', 1),
(56, 'Sencelles', 1),
(57, 'Sineu', 1),
(58, 'Sóller', 1),
(59, 'Son Servera', 1),
(60, 'Valldemossa', 1),
(61, 'Vilafranca de Bonany', 1),
(62, 'Ciutadella de Menorca', 2),
(63, 'Eivissa', 3),
(64, 'Es Castell', 2),
(65, 'Es Migjorn Gran', 2),
(68, 'Sa Pobla', 1),
(69, 'Alaior', 2);

-- --------------------------------------------------------

--
-- Estructura de la taula `origen_actuacio`
--

CREATE TABLE `origen_actuacio` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `origen_actuacio`
--

INSERT INTO `origen_actuacio` (`id`, `nom`) VALUES
(1, 'E-mail'),
(2, 'Distribució'),
(3, 'VALIB'),
(4, 'IBISEC');

-- --------------------------------------------------------

--
-- Estructura de la taula `pagament_conveni`
--

CREATE TABLE `pagament_conveni` (
  `id` int(11) NOT NULL,
  `actuacio_id` int(11) NOT NULL,
  `data_pagament` date DEFAULT NULL,
  `import` decimal(12,2) DEFAULT NULL,
  `concepte` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `prioritat_actuacio`
--

CREATE TABLE `prioritat_actuacio` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `prioritat_actuacio`
--

INSERT INTO `prioritat_actuacio` (`id`, `nom`) VALUES
(3, 'Alta'),
(1, 'Baixa'),
(2, 'Mitjana');

-- --------------------------------------------------------

--
-- Estructura de la taula `seguiment_actuacio`
--

CREATE TABLE `seguiment_actuacio` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `accio` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actuacio_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `seguiment_actuacio`
--

INSERT INTO `seguiment_actuacio` (`id`, `data`, `accio`, `url`, `actuacio_id`) VALUES
(12, '2025-05-15', 'El centro se ha derrumbado y ya no hay que hacer más seguimiento', '', 118),
(13, '2025-05-14', 'S\'ha trames l\'ofici de l\'ajuntament al centre per que contractin el servei.', '', 120),
(14, '2025-03-31', '@ del centre per sol·licitar autorització per instal·lar un tendal.', '', 86),
(16, '2025-03-31', '@ de resposta al centre, proposta és adequada, amb algunes consideracions.', '', 86),
(17, '2025-05-16', 'Derivat IBISEC http://10.215.26.101:3000/registre/2025-RE-0676/', '', 63),
(19, '2025-05-15', 'En resposta al vostre correu, en primer lloc cal retirar els perfils i les plaques de cel ras amb risc de caiguda que es veuen a les fotografies. La lluminària que penja del cable s\'hauria de retirar o recolzar sobre l\'estructura de cel ras que estigui correctament fixada al sostre, no pot quedar penjada.  En segon lloc, podeu fer revisar la resta de cel ras de la sala de professors per comprovar el seu estat de conservació. Si la resta de guies tenen un sistema de fixació insuficient, es poden ', '', 123),
(21, '2025-05-19', '2ª Reiteració Goteres', '', 106),
(22, '2025-05-14', 'Reiteració Goteres https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EkFi1do4gQxMtgjA2GZrw1AB1xrOo-7DX7rDbBGd6AoScA?e=0FXsD5', '', 106),
(26, '2025-04-02', 'Reiteració: Bon dia, Vos volíem demanar com està el tema de la sol.licitud de l\'ascensor que vos férem en aquest correu el dia 12 de març.  Ens podreu informar? Gràcies', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EWAOsB0ozd1HjTek2MjBgF8BkTYpBfcvgvhulPVhqfCjgQ?e=k6wqtG', 130),
(27, '2025-05-19', 'Resposta: per atendre aquesta demanda, des del Servei d\'Infraestructures Educatives es demanarà a l\'IBISEC que es facin les actuacions necessàries per eliminar les barreres arquitectòniques del centre', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EWAOsB0ozd1HjTek2MjBgF8BkTYpBfcvgvhulPVhqfCjgQ?e=W6bFDy', 130),
(28, '2025-05-19', 'Tramesa còpia @ a IBISEC', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EWAOsB0ozd1HjTek2MjBgF8BkTYpBfcvgvhulPVhqfCjgQ?e=W6bFDy', 130);

-- --------------------------------------------------------

--
-- Estructura de la taula `subtipus_actuacio`
--

CREATE TABLE `subtipus_actuacio` (
  `id` int(11) NOT NULL,
  `tipus_id` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `subtipus_actuacio`
--

INSERT INTO `subtipus_actuacio` (`id`, `tipus_id`, `nom`) VALUES
(1, 1, 'Instal·lació d\'aire condicionat'),
(2, 1, 'Substitució de calefacció'),
(3, 1, 'Millora del sistema de ventilació'),
(4, 1, 'Instal·lació de sistemes de renovació d\'aire'),
(5, 2, 'Reforma integral d\'espais'),
(6, 2, 'Millora de l\'accessibilitat'),
(7, 2, 'Adaptació per normativa vigent'),
(8, 2, 'Ampliació d\'espais'),
(9, 3, 'Creació de noves aules'),
(10, 3, 'Adequació de laboratoris o espais tècnics'),
(11, 3, 'Espais per a atenció a la diversitat'),
(12, 3, 'Sales polivalents o d\'usos múltiples'),
(13, 4, 'Renovació de sanitaris'),
(14, 4, 'Adaptació per a persones amb mobilitat reduïda'),
(15, 4, 'Millora de la ventilació i extracció d’aire'),
(16, 4, 'Instal·lació de sistemes d’estalvi d’aigua'),
(17, 5, 'Ampliació de menjador escolar'),
(18, 5, 'Renovació de cuines i equipament'),
(19, 5, 'Millora dels sistemes d’extracció de fums'),
(20, 5, 'Habilitació d’espais per al servei de càtering'),
(21, 6, 'Renovació i instal·lació de nous jocs infantils'),
(22, 6, 'Creació d’espais inclusius de joc'),
(23, 6, 'Instal·lació de mobiliari per a jocs de taula'),
(24, 6, 'Creació d’espais d’experimentació i natura'),
(49, 7, 'Reparació de teulades i cobertes'),
(50, 7, 'Substitució de baixants i canalitzacions'),
(51, 7, 'Millora de l’aïllament de cobertes'),
(52, 7, 'Tractament d’humitats en parets i sostres'),
(53, 9, 'Restauració de façanes'),
(54, 9, 'Reparació d’esquerdes i fissures'),
(55, 9, 'Millora de l’aïllament exterior'),
(56, 9, 'Pintura i manteniment'),
(57, 10, 'Instal·lació de tendals i pèrgoles'),
(58, 10, 'Plantació d’arbres per a ombra natural'),
(59, 10, 'Millora de l’aïllament tèrmic exterior'),
(60, 10, 'Creació d’espais d’ombra en zones de joc'),
(61, 11, 'Renovació de paviments interiors'),
(62, 11, 'Millora de voreres i accessos exteriors'),
(63, 11, 'Instal·lació de paviments de seguretat en jocs'),
(64, 11, 'Adequació de rampes per a accessibilitat'),
(65, 12, 'Instal·lació de panells acústics aules'),
(66, 12, 'Millora de l’aïllament en sales polivalents'),
(67, 12, 'Reducció de soroll en menjadors i gimnasos'),
(68, 12, 'Substitució de portes i finestres per aïllants'),
(69, 14, 'Aïllament acústic'),
(70, 14, 'Banys i sanejament'),
(71, 14, 'Climatització'),
(72, 14, 'Consulta tècnica'),
(73, 14, 'Electricitat'),
(74, 14, 'Façanes i estructures exteriors'),
(75, 14, 'Goteres i impermeabilitzacions'),
(76, 14, 'Habilitació d\'espais'),
(77, 14, 'Jocs de pati i espais d’esbarjo'),
(78, 14, 'Menjadors i cuines'),
(79, 14, 'Ombres i protecció solar'),
(80, 14, 'Paviments i accessos'),
(81, 14, 'Reformes i millores generals'),
(82, 14, 'Sistemes de seguretat i protecció'),
(200, 13, 'Millora d\'instal·lació elèctrica'),
(201, 13, 'Ampliació de la instal·lació'),
(202, 13, 'OCA'),
(203, 8, 'Instal·lació de sistemes d’alarma'),
(204, 8, 'Manteniment de sistemes d’alarma'),
(205, 8, 'Instal·lació de càmeres de videovigilància'),
(206, 8, 'Manteniment de càmeres de videovigilància'),
(207, 8, 'Instal·lació de sistemes de control d’accés'),
(208, 8, 'Manteniment de sistemes de control d’accés'),
(209, 8, 'Revisió i actualització de protocols de seguretat'),
(210, 8, 'Instal·lació de portes i tanques de seguretat'),
(211, 8, 'Manteniment de portes i tanques de seguretat'),
(212, 8, 'Senyalització de seguretat i evacuació'),
(213, 8, 'Formació en mesures de seguretat'),
(214, 8, 'Simulacres d’emergència i evacuació'),
(215, 8, 'Revisió i manteniment d’extintors i sistemes contra incendis'),
(216, 8, 'Instal·lació de sistemes de detecció d’incendis'),
(217, 8, 'Manteniment de sistemes de detecció d’incendis'),
(218, 1, 'Reparació sistema de climatització'),
(219, 9, 'Finestres i tancaments'),
(220, 10, 'Persianes i altres sistemes d\'ombreig'),
(221, 9, 'Portes'),
(222, 5, 'Portes i finestres'),
(223, 4, 'Reparacions vàries'),
(224, 2, 'Intervencions generals de manteniment'),
(225, 3, 'Retirada o reubicació de mobiliari'),
(226, 8, 'Escales d\'emergència'),
(227, 3, 'Aules modulars');

-- --------------------------------------------------------

--
-- Estructura de la taula `tecnic`
--

CREATE TABLE `tecnic` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `tecnic`
--

INSERT INTO `tecnic` (`id`, `nom`) VALUES
(1, 'Miquel'),
(2, 'Helena'),
(3, 'Rosa'),
(4, 'Joan Albert'),
(5, 'Guillermo'),
(6, 'Joaquín');

-- --------------------------------------------------------

--
-- Estructura de la taula `tipus_actuacio`
--

CREATE TABLE `tipus_actuacio` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `tipus_actuacio`
--

INSERT INTO `tipus_actuacio` (`id`, `nom`) VALUES
(12, 'Aïllament acústic'),
(4, 'Banys i sanejament'),
(1, 'Climatització'),
(14, 'Consulta tècnica'),
(13, 'Electricitat'),
(9, 'Façanes i estructures exteriors'),
(7, 'Goteres i impermeabilitzacions'),
(3, 'Habilitació d\'espais'),
(6, 'Jocs de pati i espais d’esbarjo'),
(5, 'Menjadors i cuines'),
(10, 'Ombres i protecció solar'),
(11, 'Paviments i accessos'),
(2, 'Reformes i millores generals'),
(8, 'Sistemes de seguretat i protecció');

-- --------------------------------------------------------

--
-- Estructura de la taula `tipus_centre_educatiu`
--

CREATE TABLE `tipus_centre_educatiu` (
  `Sigla` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `tipus_centre_educatiu`
--

INSERT INTO `tipus_centre_educatiu` (`Sigla`, `nom`) VALUES
('C', 'Centre'),
('CA', 'Centre d’Adults'),
('CAEED', 'Centre d’Atenció Educativa Especialitzada en Discapacitat'),
('CAEEM', 'Centre d’Atenció Educativa Especialitzada en Menors'),
('CAEPAPDI', 'Centre de Suport Educatiu per a Persones amb Discapacitat Intel·lectual'),
('CAHD', 'Centre d’Atenció a la Diversitat'),
('CC', 'Centre Concertat'),
('CCEE', 'Centre Concertat d’Educació Especial'),
('CCEI', 'Centre d’Educació Infantil'),
('CDE', 'Centre de Dia Educatiu'),
('CEE', 'Centre d’Educació Especial'),
('CEI', 'Centre d’Educació Infantil'),
('CEIP', 'Centre d’Educació Infantil i Primària'),
('CEIPIEEM', 'Centre d’Educació Infantil, Primària i Ensenyament Mitjà'),
('CEIPIESO', 'Centre d’Educació Infantil, Primària i Secundària Obligatòria'),
('CEP', 'Centre de Professorat'),
('CEPA', 'Centre d’Educació de Persones Adultes'),
('CEPA-Aula', 'Aula d’un Centre d’Educació de Persones Adultes'),
('CIFP', 'Centre Integrat de Formació Professional'),
('CMM', 'Conservatori de Música Municipal'),
('CP', 'Centre Públic'),
('CPEPA', 'Centre Públic d’Educació de Persones Adultes'),
('CPFP', 'Centre Públic de Formació Professional'),
('CPIESO', 'Centre Públic d’Infantil, Primària i Secundària Obligatòria'),
('CPMD', 'Conservatori Professional de Música i Dansa'),
('CSMD', 'Conservatori Superior de Música i Dansa'),
('EA', 'Escola d’Art'),
('EAP', 'Equip d’Atenció Psicopedagògica'),
('EI', 'Escola Infantil'),
('EI1', 'Escola Infantil de Primer Cicle'),
('EIEL', 'Escola Infantil d’Educació Lliure'),
('EMM', 'Escola Municipal de Música'),
('EMMD', 'Escola Municipal de Música i Dansa'),
('EOEP', 'Equip d’Orientació Educativa i Psicopedagògica'),
('EOEP-EAC', 'Equip d’Orientació Educativa i Psicopedagògica - Educació en Àmbit Comú'),
('EOEP-EACI', 'Equip d’Orientació Educativa i Psicopedagògica - Educació en Àmbit de Compensació Integral'),
('EOEP-EADIS', 'Equip d’Orientació Educativa i Psicopedagògica - Educació en Àmbit de Discapacitat'),
('EOEP-EADIV', 'Equip d’Orientació Educativa i Psicopedagògica - Educació en Àmbit de Diversitat'),
('EOEP-ECLA', 'Equip d’Orientació Educativa i Psicopedagògica - Educació en Àmbit de Llengua i Cultura'),
('EOI', 'Escola Oficial d’Idiomes'),
('EOI-EXT', 'Extensió de l’Escola Oficial d’Idiomes'),
('EPDR', 'Ensenyament Professional de Dansa Regional'),
('EPMDR', 'Ensenyament Professional de Música i Dansa Regional'),
('EPMR', 'Ensenyament Professional de Música Regional'),
('ESAD', 'Escola Superior d’Art Dramàtic'),
('IES', 'Institut d’Educació Secundària'),
('PQI-AJ', 'Programa de Qualificació Inicial - Aula Jove'),
('PQI-EP', 'Programa de Qualificació Inicial - Emprenedoria Personal'),
('SAED', 'Servei d’Atenció Educativa Domiciliària'),
('UD', 'Unitat Didàctica');

-- --------------------------------------------------------

--
-- Estructura de la taula `tipus_document_actuacio_conveni`
--

CREATE TABLE `tipus_document_actuacio_conveni` (
  `id` int(11) NOT NULL,
  `descripcio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `tipus_document_actuacio_conveni`
--

INSERT INTO `tipus_document_actuacio_conveni` (`id`, `descripcio`) VALUES
(1, 'Documentació tècnica'),
(2, 'Informe de valoració'),
(3, 'Esmenes'),
(4, 'Factura'),
(5, 'Informe Ajuntament favorable');

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `actuacions`
--
ALTER TABLE `actuacions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codi` (`codi`),
  ADD KEY `subtipus_id` (`subtipus_id`),
  ADD KEY `fk_centre` (`centre_id`),
  ADD KEY `fk_estat` (`estat_id`),
  ADD KEY `fk_prioritat` (`prioritat_id`),
  ADD KEY `fk_actuacions_tecnic` (`tecnic_id`),
  ADD KEY `fk_origen` (`origen_id`),
  ADD KEY `fk_desti` (`desti_id`),
  ADD KEY `fk_mode_enviament` (`mode_enviament_id`);

--
-- Índexs per a la taula `actuacions_seq`
--
ALTER TABLE `actuacions_seq`
  ADD PRIMARY KEY (`any`);

--
-- Índexs per a la taula `actuacio_conveni`
--
ALTER TABLE `actuacio_conveni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_centre_conveni` (`centre_id`,`conveni_id`);

--
-- Índexs per a la taula `assignar_espais`
--
ALTER TABLE `assignar_espais`
  ADD PRIMARY KEY (`id_centre`,`id_espai`),
  ADD KEY `id_espai` (`id_espai`);

--
-- Índexs per a la taula `centres`
--
ALTER TABLE `centres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_illa` (`id_illa`),
  ADD KEY `id_municipi` (`id_municipi`);

--
-- Índexs per a la taula `centre_conveni`
--
ALTER TABLE `centre_conveni`
  ADD PRIMARY KEY (`id_centre`,`id_conveni`),
  ADD KEY `id_conveni` (`id_conveni`);

--
-- Índexs per a la taula `conveni`
--
ALTER TABLE `conveni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ajuntament_id` (`ajuntament_id`),
  ADD KEY `estat_conveni_id` (`estat_conveni_id`);

--
-- Índexs per a la taula `conveni_seq`
--
ALTER TABLE `conveni_seq`
  ADD PRIMARY KEY (`any`);

--
-- Índexs per a la taula `desti_actuacio`
--
ALTER TABLE `desti_actuacio`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `document_actuacio`
--
ALTER TABLE `document_actuacio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actuacio_id` (`actuacio_id`);

--
-- Índexs per a la taula `document_actuacio_conveni`
--
ALTER TABLE `document_actuacio_conveni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actuacio_id` (`actuacio_id`),
  ADD KEY `document_id` (`tipus_id`);

--
-- Índexs per a la taula `espai`
--
ALTER TABLE `espai`
  ADD PRIMARY KEY (`codi`);

--
-- Índexs per a la taula `estat_actuacio`
--
ALTER TABLE `estat_actuacio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Índexs per a la taula `estat_conveni`
--
ALTER TABLE `estat_conveni`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `illa`
--
ALTER TABLE `illa`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `informe_actuacio`
--
ALTER TABLE `informe_actuacio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actuacio_id` (`actuacio_id`);

--
-- Índexs per a la taula `mode_enviament`
--
ALTER TABLE `mode_enviament`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `municipi`
--
ALTER TABLE `municipi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `illa_id` (`illa_id`);

--
-- Índexs per a la taula `origen_actuacio`
--
ALTER TABLE `origen_actuacio`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `pagament_conveni`
--
ALTER TABLE `pagament_conveni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `actuacio_id` (`actuacio_id`);

--
-- Índexs per a la taula `prioritat_actuacio`
--
ALTER TABLE `prioritat_actuacio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Índexs per a la taula `seguiment_actuacio`
--
ALTER TABLE `seguiment_actuacio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_seguiment-actuacio` (`actuacio_id`);

--
-- Índexs per a la taula `subtipus_actuacio`
--
ALTER TABLE `subtipus_actuacio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipus_id` (`tipus_id`);

--
-- Índexs per a la taula `tecnic`
--
ALTER TABLE `tecnic`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `tipus_actuacio`
--
ALTER TABLE `tipus_actuacio`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Índexs per a la taula `tipus_centre_educatiu`
--
ALTER TABLE `tipus_centre_educatiu`
  ADD PRIMARY KEY (`Sigla`);

--
-- Índexs per a la taula `tipus_document_actuacio_conveni`
--
ALTER TABLE `tipus_document_actuacio_conveni`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `actuacions`
--
ALTER TABLE `actuacions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT per la taula `actuacio_conveni`
--
ALTER TABLE `actuacio_conveni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `centres`
--
ALTER TABLE `centres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=859;

--
-- AUTO_INCREMENT per la taula `conveni`
--
ALTER TABLE `conveni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `desti_actuacio`
--
ALTER TABLE `desti_actuacio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la taula `document_actuacio`
--
ALTER TABLE `document_actuacio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT per la taula `document_actuacio_conveni`
--
ALTER TABLE `document_actuacio_conveni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la taula `espai`
--
ALTER TABLE `espai`
  MODIFY `codi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT per la taula `estat_actuacio`
--
ALTER TABLE `estat_actuacio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la taula `estat_conveni`
--
ALTER TABLE `estat_conveni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la taula `illa`
--
ALTER TABLE `illa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la taula `informe_actuacio`
--
ALTER TABLE `informe_actuacio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT per la taula `mode_enviament`
--
ALTER TABLE `mode_enviament`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `municipi`
--
ALTER TABLE `municipi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT per la taula `origen_actuacio`
--
ALTER TABLE `origen_actuacio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la taula `pagament_conveni`
--
ALTER TABLE `pagament_conveni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la taula `prioritat_actuacio`
--
ALTER TABLE `prioritat_actuacio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `seguiment_actuacio`
--
ALTER TABLE `seguiment_actuacio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT per la taula `subtipus_actuacio`
--
ALTER TABLE `subtipus_actuacio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT per la taula `tecnic`
--
ALTER TABLE `tecnic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la taula `tipus_actuacio`
--
ALTER TABLE `tipus_actuacio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la taula `tipus_document_actuacio_conveni`
--
ALTER TABLE `tipus_document_actuacio_conveni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `actuacions`
--
ALTER TABLE `actuacions`
  ADD CONSTRAINT `actuacions_ibfk_1` FOREIGN KEY (`subtipus_id`) REFERENCES `subtipus_actuacio` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_actuacions_tecnic` FOREIGN KEY (`tecnic_id`) REFERENCES `tecnic` (`id`),
  ADD CONSTRAINT `fk_centre` FOREIGN KEY (`centre_id`) REFERENCES `centres` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_desti` FOREIGN KEY (`desti_id`) REFERENCES `desti_actuacio` (`id`),
  ADD CONSTRAINT `fk_estat` FOREIGN KEY (`estat_id`) REFERENCES `estat_actuacio` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_mode_enviament` FOREIGN KEY (`mode_enviament_id`) REFERENCES `mode_enviament` (`id`),
  ADD CONSTRAINT `fk_origen` FOREIGN KEY (`origen_id`) REFERENCES `origen_actuacio` (`id`),
  ADD CONSTRAINT `fk_prioritat` FOREIGN KEY (`prioritat_id`) REFERENCES `prioritat_actuacio` (`id`);

--
-- Restriccions per a la taula `actuacio_conveni`
--
ALTER TABLE `actuacio_conveni`
  ADD CONSTRAINT `fk_centre_conveni` FOREIGN KEY (`centre_id`,`conveni_id`) REFERENCES `centre_conveni` (`id_centre`, `id_conveni`);

--
-- Restriccions per a la taula `assignar_espais`
--
ALTER TABLE `assignar_espais`
  ADD CONSTRAINT `assignar_espais_ibfk_1` FOREIGN KEY (`id_centre`) REFERENCES `centres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignar_espais_ibfk_2` FOREIGN KEY (`id_espai`) REFERENCES `espai` (`codi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restriccions per a la taula `centres`
--
ALTER TABLE `centres`
  ADD CONSTRAINT `centres_ibfk_1` FOREIGN KEY (`id_illa`) REFERENCES `illa` (`id`),
  ADD CONSTRAINT `centres_ibfk_2` FOREIGN KEY (`id_municipi`) REFERENCES `municipi` (`id`);

--
-- Restriccions per a la taula `centre_conveni`
--
ALTER TABLE `centre_conveni`
  ADD CONSTRAINT `centre_conveni_ibfk_1` FOREIGN KEY (`id_centre`) REFERENCES `centres` (`id`),
  ADD CONSTRAINT `centre_conveni_ibfk_2` FOREIGN KEY (`id_conveni`) REFERENCES `conveni` (`id`);

--
-- Restriccions per a la taula `conveni`
--
ALTER TABLE `conveni`
  ADD CONSTRAINT `conveni_ibfk_1` FOREIGN KEY (`ajuntament_id`) REFERENCES `municipi` (`id`),
  ADD CONSTRAINT `conveni_ibfk_2` FOREIGN KEY (`estat_conveni_id`) REFERENCES `estat_conveni` (`id`);

--
-- Restriccions per a la taula `document_actuacio`
--
ALTER TABLE `document_actuacio`
  ADD CONSTRAINT `document_actuacio_ibfk_1` FOREIGN KEY (`actuacio_id`) REFERENCES `actuacions` (`id`) ON DELETE CASCADE;

--
-- Restriccions per a la taula `document_actuacio_conveni`
--
ALTER TABLE `document_actuacio_conveni`
  ADD CONSTRAINT `document_actuacio_conveni_ibfk_1` FOREIGN KEY (`actuacio_id`) REFERENCES `actuacio_conveni` (`id`),
  ADD CONSTRAINT `document_actuacio_conveni_ibfk_2` FOREIGN KEY (`tipus_id`) REFERENCES `tipus_document_actuacio_conveni` (`id`);

--
-- Restriccions per a la taula `informe_actuacio`
--
ALTER TABLE `informe_actuacio`
  ADD CONSTRAINT `informe_actuacio_ibfk_1` FOREIGN KEY (`actuacio_id`) REFERENCES `actuacions` (`id`) ON DELETE CASCADE;

--
-- Restriccions per a la taula `municipi`
--
ALTER TABLE `municipi`
  ADD CONSTRAINT `municipi_ibfk_1` FOREIGN KEY (`illa_id`) REFERENCES `illa` (`id`) ON DELETE CASCADE;

--
-- Restriccions per a la taula `pagament_conveni`
--
ALTER TABLE `pagament_conveni`
  ADD CONSTRAINT `pagament_conveni_ibfk_1` FOREIGN KEY (`actuacio_id`) REFERENCES `actuacio_conveni` (`id`);

--
-- Restriccions per a la taula `seguiment_actuacio`
--
ALTER TABLE `seguiment_actuacio`
  ADD CONSTRAINT `fk_seguiment-actuacio` FOREIGN KEY (`actuacio_id`) REFERENCES `actuacions` (`id`);

--
-- Restriccions per a la taula `subtipus_actuacio`
--
ALTER TABLE `subtipus_actuacio`
  ADD CONSTRAINT `subtipus_actuacio_ibfk_1` FOREIGN KEY (`tipus_id`) REFERENCES `tipus_actuacio` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
