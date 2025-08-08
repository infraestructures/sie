-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 16-07-2025 a les 11:14:11
-- Versió del servidor: 10.4.32-MariaDB
-- Versió de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `sie`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `actuacions`
--

CREATE TABLE `actuacions` (
  `id` int(11) NOT NULL,
  `codi` varchar(50) DEFAULT NULL,
  `codi_extern` varchar(100) DEFAULT NULL,
  `subtipus_id` int(11) NOT NULL,
  `origen` varchar(50) DEFAULT NULL,
  `descripcio` text DEFAULT NULL,
  `pressupost` decimal(10,2) DEFAULT 0.00,
  `assumit_servei` varchar(1) NOT NULL DEFAULT 'N',
  `observacions` text DEFAULT NULL,
  `centre_id` int(11) DEFAULT NULL,
  `estat_id` int(11) DEFAULT NULL,
  `prioritat_id` int(11) DEFAULT NULL,
  `data_entrada` date NOT NULL DEFAULT current_timestamp(),
  `data_enviament` date NOT NULL,
  `tecnic_id` int(11) DEFAULT NULL,
  `origen_id` int(11) DEFAULT NULL,
  `desti_id` int(11) DEFAULT NULL,
  `mode_enviament_id` int(11) DEFAULT NULL,
  `url_ibisec` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `actuacions`
--

INSERT INTO `actuacions` (`id`, `codi`, `codi_extern`, `subtipus_id`, `origen`, `descripcio`, `pressupost`, `assumit_servei`, `observacions`, `centre_id`, `estat_id`, `prioritat_id`, `data_entrada`, `data_enviament`, `tecnic_id`, `origen_id`, `desti_id`, `mode_enviament_id`, `url_ibisec`) VALUES
(21, '1-2025', '', 200, NULL, 'Més endolls', 0.00, 'N', 'Bon dia,\r\nvos escrivim per sol·licitar la instal·lació de més endolls a l\'escola. Primer ho vàrem sol·licitar a l\'Ajuntament de Palma, però ens ens han dit que això és obra nova i ho hem de sol·licitar a Conselleria.\r\n\r\nPer això ens posam en contacte amb vosaltres, esperam que ens pogue dotar d\'això i si no explicar-nos quines són les passes per fer-ho. \r\n\r\nGràcies', 462, 3, 1, '2025-02-24', '2025-03-05', 2, NULL, NULL, NULL, ''),
(28, '2-2025', '', 218, NULL, 'Reparació unitat exterior sistema climatització', 8832.73, 'N', 'Bon dia, \r\n\r\nTal com he parlat amb en Marco, gerent Ibisec, adjunt el pressupost que ens ha enviat l\'empresa per a fer la reparació dels aires del CEIP ES FOSARRET. Aquesta reparació és de caràcter urgent, ja que fa ja molt temps que tenim problemes amb aquest sistema de climatització. \r\n\r\nEns podeu anar informant de les dates aprox. del procediment. \r\n\r\nPos en còpia a na Bel Pinya, tècnica d\'educació i Marc Gradaille, ingenyier també de l\'Ajuntament de Sóller. \r\n\r\n\r\nSalutacions,', 292, 2, 3, '2025-01-10', '2025-01-27', 1, 1, 4, 1, ''),
(33, '3-2025', '', 56, NULL, 'Pintar façana', 0.00, 'N', 'Conversa telefònica Àlex. S\'haurà de fer CM.', 793, 11, 1, '2025-02-06', '0000-00-00', 1, 1, NULL, NULL, ''),
(34, '4-2025', '', 57, NULL, 'Instal·lació d’una carpa al pati', 0.00, 'N', 'Possiblement haurem d\'enviar doblers.', 467, 2, 1, '2025-03-06', '0000-00-00', 1, NULL, NULL, NULL, ''),
(35, '5-2025', '', 49, NULL, 'Filtracions coberta', 0.00, 'N', 'Enviat informe de l\'IBISEC a l\'Ajuntament de Llubí.', 284, 2, 1, '2025-03-06', '2025-02-19', 1, 1, 3, 1, ''),
(36, '1-2024', '', 9, NULL, 'Envà divisori biblioteca', 0.00, 'N', '', 273, 2, 1, '2024-10-28', '1970-01-01', NULL, 1, NULL, NULL, ''),
(37, '6-2025', '', 59, NULL, 'Lamel·les aula d\'infantil', 2093.40, 'N', 'Bon dia,\r\nvos volia informar que tenim una aula  d\'infantil  a la planta baixa de l\'edifici i que és l\'única  aula  que no té lamel·les. Això implica que, en diverses ocasions i la darrera vegada la setmana passada, intentassin  entrar a l\'aula des de l\'exterior. No ho varen aconseguir, però altres vegades sí que hem trobat l\'aula girada. Per això, demanam, i ja ho hem sol·licitat altres vegades, que es puguin instal·lar lamel·les en aquesta finestra com les que estan col·locades a les altres aules. Vos adjunt una foto  de la finestra.', 293, 11, 1, '2025-01-28', '0000-00-00', 1, 1, NULL, NULL, ''),
(38, '7-2025', '', 67, NULL, 'Condicionament acústic', 0.00, 'N', 'Bon dia\r\nEl nostre menjador escolar és gros i té aproximadament 250 usuaris diaris. Tenim molt de renou i\r\nvoldríem millorar aquest aspecte.\r\nQuan va venir el Conseller Antoni Vera havia tengut una reunió amb la representant de l\'AFA, el\r\nbatle i regidors de l\'ajuntament d\'Esporles i es va posar de manifest la possibilitat de millorar\r\nl\'aïllament acústic del menjador escolar.\r\nPer tant sol.licitam assessorament per a millorar l\' aïllament acústic del nostre menjador\r\nescolar', 310, 13, 1, '2025-02-20', '1970-01-01', 1, NULL, 4, 1, ''),
(39, '8-2025', '', 49, NULL, 'Reparació goteres', 0.00, 'N', '', 823, 11, 1, '2025-03-07', '0000-00-00', 1, 1, 4, 1, ''),
(40, '2-2024', '', 50, NULL, 'Millores en canaletes', 0.00, 'N', 'Les caneletes de l\'edifici principal i del pavelló són molt velles, es van produint forats i goteres que anam reparant però ha aribat un moment que trobam que es necessari posar-les noves.', 785, 1, 1, '2024-11-25', '0000-00-00', NULL, 1, NULL, NULL, 'https://outlook.office.com/mail/'),
(42, '3-2024', '', 219, NULL, 'Millorar finestres', 0.00, 'N', 'Les finestres de vidre-alumini de tot el centre són molt antigues. Són molt males d\'obrir i tancar i\r\nno són eficients en l\'aspecte energètic. Estaria bé posar-les noves amb vidres i perfileria eficient.', 785, 1, 1, '2024-11-25', '0000-00-00', NULL, 1, NULL, NULL, ''),
(44, '4-2024', '', 220, NULL, '', 0.00, 'N', 'Les finestres tenen unes persianes de lames de plàstic. Amb el temps s\'han anat deteriorant i\r\ncada any caven algunes lames. Durant aquest darrers anys nosatres hem anat substiuint les que es\r\ntroben més malament per persianes de lames d\'alumni però ha arribat un moment que el nombre\r\nde persines que convé substituir superen la nostra capacitat d\'actuació. Estaria bé canviar totes les\r\npersianes per persianes de lames d\'alumini', 785, 1, 1, '2024-11-25', '0000-00-00', NULL, 1, NULL, NULL, ''),
(45, '5-2024', '', 203, NULL, 'Canvi alarma contra incendis', 0.00, 'N', 'Bon dia, \r\n\r\nBon dia, hem demanat pressupost per canviar l\'alarma que la tenim digital a analògica. Ens interessa saber no només la zona del centre on es dispara, sinó que quan hi ha dispars intempestius saber el sensor.\r\n\r\nPer això, necessitam saber si tenim els sensors que toca i complim o no la normativa, ja que el pressupost que ens han presentat, indica que no complim la normativa vigent.\r\n\r\nAgrairíem si ens podeu ajudar i assessorar en aquest aspecte i si us interessa venir a veure la nostra instal·lació.\r\n\r\nGràcies', 784, 1, 1, '2024-12-05', '0000-00-00', NULL, 1, NULL, NULL, ''),
(56, '21-2025', '', 55, NULL, 'Desprendiment mur', 0.00, 'N', 'Hola Toni,\r\n\r\nEL CEIP Sa Graduada de Maó tiene un problema con muro que se está desplomando sobre la parcela colindante. Te adjunto nuestro informe.\r\n\r\nÀlex, la directora territorial, está mirando con el ayuntamiento si, al ser una medianera, tiene que pagarse a medias con el propietario. \r\n\r\nSea como sea (pagarlo a medias o pagarlo la Conselleria), podéis encargaros vosotros al ser un menor.\r\n\r\nDime cosas!!!\r\n\r\nUn abrazo', 412, 7, 1, '2025-01-02', '2025-02-24', 1, 1, 2, 1, ''),
(57, '22-2025', '', 21, NULL, 'NOVES ESTRUCTURES PEL PATI D\'EDUCACIÓ INFANTIL', 0.00, 'N', 'Dia 5 de març el centre va enviar un mail i no es va contestar referent a las estructures per a jocs que volen instal·lar al pati.', 252, 11, 2, '2025-03-05', '0000-00-00', 2, 1, NULL, NULL, ''),
(59, '24-2025', '', 9, NULL, 'Sol·licitud mòdul prefabricat mòbil infantil al pati', 0.00, 'N', 'Sol·liciten la instal·lació d’un mòdul prefabricat al pati de 143m² per disposar de dues aules i\r\npoder aprofitar al màxim l’espai útil de l’escola reformada. Així tota l’etapa d’infantil\r\npodria estar ubicada allà. Rebut per VALIB 374458', 409, 1, 1, '2025-03-20', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(60, '25-2025', '', 57, NULL, 'Tendals ombra als patis del centre', 0.00, 'N', 'En cas que finalment l\'IBE no pugui realitzar aquestes actuacions, des del Servei d\'Infraestructures Educatives us proposarem una alternativa per tal que la instal·lació d\'ombres al vostre pati sigui una realitat.', 305, 2, 1, '2025-03-21', '0000-00-00', 1, 1, NULL, NULL, ''),
(61, '26-2025', '', 56, NULL, 'Cartell nom del centre', 0.00, 'N', 'Tramesa del pressupost de la placa del nom del centre previst per a col·locar a la façana de l\'entrada principal del centre.', 449, 11, 1, '2025-03-20', '0000-00-00', 2, 1, NULL, NULL, ''),
(62, '27-2025', '', 57, NULL, 'Estructura ombra pati', 0.00, 'N', 'Tramesa de l\'escrit de l\'AFA del centre en referència a l\'estructura d\'ombra que es vol col.locar a un dels patis. ', 281, 3, 1, '2025-03-21', '0000-00-00', 1, 1, NULL, NULL, ''),
(63, '28-2025', '', 200, NULL, 'Desperfectes aula prefabricada', 0.00, 'N', 'Petició per arreglar els llums d\'una aula prefabricada.', 337, 7, 1, '2025-03-21', '0000-00-00', 1, 1, 2, NULL, ''),
(64, '29-2025', '', 57, NULL, 'Acondicionament terrasses infantil', 0.00, 'N', '', 353, 1, 1, '2025-03-21', '0000-00-00', NULL, 1, NULL, NULL, ''),
(65, '30-2025', '', 218, NULL, 'Rebut sol·licitud expedient de despesa ED2025-33', 5847.00, 'N', 'Rebut sol·licitud expedient de despesa ED2025-33. Donem el vistiplau de l\'actuació, i indicam que no és necessari ED (menys de 6.000€).', 821, 11, 1, '2025-03-24', '2025-03-24', 1, NULL, NULL, 1, ''),
(66, '31-2025', '', 72, NULL, 'Dubtes sobre tres espais del centre', 0.00, 'N', '', 375, 11, 1, '2025-03-24', '0000-00-00', NULL, 1, NULL, NULL, ''),
(67, '32-2025', '', 75, NULL, 'Desperfectes de goteres', 0.00, 'N', 'Volen informació de la qüestió de les goteres del centre que van enviar el passat 11 de Març', 797, 1, 1, '2025-03-25', '0000-00-00', NULL, 1, NULL, NULL, ''),
(68, '33-2025', '', 72, NULL, 'Frigorífic avariat', 0.00, 'N', 'Dubtes de les característiques del frigorífic.\r\n09/04 - Els enviam @, han de decidir si reparen o substitueixen frigorífic', 369, 11, 1, '2025-03-25', '0000-00-00', 1, 1, NULL, NULL, ''),
(69, '34-2025', '', 223, NULL, 'Neteja forjat sanitàri i reparació col·lector aigues fecals', 0.00, 'N', '', 831, 11, 3, '2025-03-25', '0000-00-00', 1, NULL, NULL, NULL, ''),
(70, '35-2025', '', 52, NULL, 'Goteres a les aules prefabricades', 0.00, 'N', 'Dia 25 de març hi ha una segona reiteració del tema goteres del qual ja van informar a l\'octubre 2024 en un @ amb diverses actuacions', 804, 11, 1, '2025-03-25', '0000-00-00', NULL, 1, NULL, NULL, ''),
(72, '37-2025', '', 9, NULL, 'Necessitat d\'espai al CEPA Pitiüsses', 0.00, 'N', '', 494, 1, 1, '2025-03-24', '0000-00-00', NULL, 1, NULL, NULL, ''),
(73, '38-2025', '', 72, NULL, 'Instal·lació d\'una font d\'aigua al pati', 0.00, 'N', 'Reiteració del @ de 30 de gener de la petició de instal·lació d\'una font d\'aigua al pati', 489, 11, 1, '2025-03-24', '0000-00-00', 1, 1, NULL, NULL, ''),
(74, '39-2025', '', 200, NULL, 'Sol·liciten la substitució de lluminàries a les aules', 0.00, 'N', 'sol·liciten la substitució de la lluminària fluorescent a les 37 aules de l\'edifici del carrer Joan Coll per pantalles LED. Remeten fotografies.', 798, 2, 1, '2025-03-26', '0000-00-00', 1, 1, NULL, NULL, ''),
(75, '40-2025', '', 54, NULL, 'Avaluació i sol·licitud de finançament per a la reparació de desperfectes esctructurals', 0.00, 'N', 'Esquerdes significatives, despreniments i degradació del formigó causats per humitats, filtracions i moviments estructurals.', 824, 1, 1, '2025-03-18', '0000-00-00', NULL, 1, NULL, NULL, ''),
(76, '41-2025', '', 61, NULL, 'DEFICIÈNCIES PAVIMENT DE SALES I DESPATXOS DEL CEIP ES PUIG DE SÓLLER', 0.00, 'N', 'Ha arribat l\'nforme tècnic municipal', 297, 13, 1, '2025-03-27', '0000-00-00', 1, 1, NULL, NULL, ''),
(77, '42-2025', '', 72, NULL, 'Deficiències a les instal·lacions elèctriques', 0.00, 'N', 'adjuntem els escrits rebuts per distribució electrònica de l\'Associació de pares i mares d\'alumnes del CEIP Jaume I, i de l\'associació de veinats i amics de Palmanova amb relació a les deficiències de la instal·lació electrica, i adreçades al Conseller.', 323, 11, 1, '2025-03-27', '0000-00-00', 2, 1, NULL, NULL, ''),
(78, '43-2025', '', 221, NULL, 'Sol·liciten la substitució de les portes d\'entrada al centre', 0.00, 'N', 'Envien Fotografies', 469, 1, 1, '2025-03-27', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(79, '44-2025', '', 10, NULL, 'Adequació instal·lacions audiovisuals.', 0.00, 'N', 'les instal·lacions tècniques d’àudio i enllumenat estan obsoletes', 795, 1, 1, '2025-03-27', '0000-00-00', NULL, 1, NULL, NULL, ''),
(80, '45-2025', '', 21, NULL, 'Protecció pilars, canastas minibasquet i rocòdrom', 0.00, 'N', 'Actuacions al pati: Protecció pilars, canastas minibasquet i rocòdrom', 467, 11, 1, '2025-03-26', '0000-00-00', 1, 1, NULL, NULL, ''),
(81, '46-2025', '', 53, NULL, 'Substitució de persianes i rehabilitació façanes', 0.00, 'N', '', 814, 1, 1, '2025-03-31', '0000-00-00', NULL, 1, NULL, NULL, ''),
(82, '47-2025', '', 72, NULL, 'dubtes referent als residus', 0.00, 'N', 'Volen saber com gestionar els residus, piles, fluorescents i tòners', 767, 1, 1, '2025-03-31', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(83, '48-2025', '', 71, NULL, 'Consulta amb relació a un informe tècnic de l\'Ajuntament sobre l\'estat de les màquines', 0.00, 'N', '', 310, 1, 1, '2025-03-31', '0000-00-00', NULL, 1, NULL, NULL, ''),
(84, '49-2025', '', 78, NULL, 'Equips de fred del menjador avariats', 0.00, 'N', '', 392, 3, 1, '2025-03-28', '0000-00-00', 1, 1, NULL, NULL, ''),
(85, '50-2025', '', 9, NULL, 'Reformes a la casa de la conserge', 0.00, 'N', 'han concedit la implantació del CFGS d\'Allotjaments Turístics pel proper curs 25/26', 821, 2, 1, '2025-03-31', '0000-00-00', 1, NULL, NULL, NULL, ''),
(86, '51-2025', '', 79, NULL, 'Toldos per tenir ombra davant les classes de primer cicle', 0.00, 'N', 'Petició per instal·lar tendals enrotllables a la façana d\'unes aules del centre.', 347, 11, 1, '2025-03-31', '0000-00-00', 2, 1, NULL, 1, ''),
(87, '52-2025', '', 201, NULL, 'Reiteren: Sol·liciten rosetes per cable de xarxa a les aules, sense fils la connexió no funciona bé.', 0.00, 'N', 'Amb data 31/03 reiteren la petició. AQUESTA PETICIÓ S\'HAVIA ASIGNAT PER ERROR A SA GRADUADA DE MAÓ.', 573, 1, 2, '2025-03-20', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(88, '53-2025', '', 78, NULL, 'Reformes a la cuina', 0.00, 'N', 'Bon dia, som na Maria Antònia Marroig Colom, Directora del CEiP Ses Marjades. Al nostre centre educatiu tenim una cuina que ha tornat molt vella i està en mal estat i en la que realitzam diferents activitats educatives, com el taller de cuina setmanal o els tallers puntuals quan arriben algunes festivitats. Nosaltres podem fer la gestió de demanar els pressuposts i fer el seguiment però volem saber si podem comptar amb els diners per part de la conselleria i quin són els tràmits a seguir i la documentació a aportar.', 438, 3, 1, '2025-04-01', '0000-00-00', 1, NULL, NULL, NULL, ''),
(89, '54-2025', '', 227, NULL, 'Reiteren Sol·lilcitud aula prefabricada i demanen informació sobre la licitació de la cuina', 0.00, 'N', 'En referència a les mancances d\'espai del CEIP Son Juny de Sant Joan, adjuntem informe del nostre tècnic municipal així com informe de l\'escola, per que valoreu la necessitat de una aula prefabricada si es possible dins aquest curs escolar 2024-2025 i sinó per el pròxim 2025-2026', 450, 1, 2, '2025-04-02', '0000-00-00', NULL, 1, NULL, NULL, ''),
(90, '55-2025', '', 77, NULL, 'Instal·lació de gronxadors sala psicomotricitat', 0.00, 'N', '', 326, 3, 1, '2025-04-02', '0000-00-00', 1, 1, NULL, NULL, ''),
(91, '56-2025', '', 54, NULL, 'Vàries actuacions, Existeix un ofici del conseller dirigit a la AMIPA amb compromís d\'actuacions', 0.00, 'N', '🛠️ Actuacions immediates\r\n\r\n    Reparació del mur perimetral:\r\n        Ja es disposa d’un informe tècnic i un pressupost estimatiu elaborat per l’arquitecta tècnica de l’IBISEC.\r\n\r\n    Canvi de fusteries (finestres i portes):\r\n        S’està a l’espera de l’informe corresponent.\r\n        Un cop rebut, es redactarà una memòria tècnica i es sol·licitaran pressuposts.\r\n\r\n🚽 Actuació sobre el bany amb problemes d’embussament\r\n\r\n    S’ha sol·licitat a l’IBISEC una visita per avaluar el bany que s’embussa i provoca inundacions.\r\n    Un cop identificada la causa, es definiran les mesures correctores necessàries.\r\n\r\n🏗️ Projecte a mitjà termini\r\n\r\n    Reparació de la coberta de l’edifici:\r\n        S’iniciarà la redacció del projecte.\r\n        Es valorarà incloure-hi part del sistema de climatització.\r\n        Aquestes obres requeriran un concurs públic, per tant no seran immediates.\r\n\r\n💬 Compromís institucional\r\n\r\n    El conseller reitera el compromís de la Conselleria amb unes infraestructures educatives dignes i adaptades a les necessitats actuals.\r\n    Les actuacions es finançaran amb fons de la Conselleria.', 258, 12, 1, '2025-04-02', '0000-00-00', NULL, 1, NULL, NULL, ''),
(92, '57-2025', '', 76, NULL, 'Ampliació sala de professorat', 0.00, 'N', 'Es una reiteració del assumpte de la sala de professors. Volen saber com està el tema.', 774, 1, 1, '2025-04-03', '0000-00-00', NULL, 1, NULL, NULL, ''),
(93, '58-2025', '', 75, NULL, 'Desperfectes Humitats Edifici', 0.00, 'N', 'Ens han sortit moltes taques d\'humitat a tota una ala de l\'edifici. En concret a 5 aules. L\'ambient és molt insalubre. Hem anat fent net i també posant humidificadors, però sospitam que el problema és més greu perquè es va estenent a la resta de l\'edifici i veim que va a més. Voldria saber si qualque tècnic ho pot venir a veure i dir-nos qui s\'ha d\'encarregar (ajuntament o administració) de valorar i reparar aquest desperfecte. Adjunt una fotografia com a mostra del que està succeint a totes les aules.', 351, 1, 1, '2025-04-03', '0000-00-00', NULL, 1, NULL, NULL, ''),
(94, '59-2025', '', 81, NULL, 'Obra remodelació espai equip directiu', 0.00, 'N', 'Volem sol·licitar fer obra al nostre despatx ja que tenim el rack del centre just dedins. Voldríem\r\ntancar-lo amb una paret de pladur, obrir-ne una d\'obra que està a l\'altre costat, i posar una\r\nporta. Adjuntem imatges, així i tot vos demanem una visita presencial d\'algun tècnic per veure\r\n\"in situ\" l\'espai. Vos demanem l\'autorització i l\'execució d\'aquesta obra\r\nAdjunten pressupost.\r\nReiteració: El 14/05 crida el director Joan Miquel Serra per saber si poden començar les obres el mes de juliol', 263, 1, 2, '2025-04-04', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(95, '60-2025', '', 1, NULL, 'Sol·licitud instal·lació d\'Aire Acondicionat. Hauríeu de demanar pressupost per a l\'adquisició i instal·lació de ventiladors de sostre a un tècnic especialitzat. En tenir-ho, ens ho podeu fer arribar per a la nostra valoració.', 0.00, 'N', 'Es va fer una obra d\'acondicionament de les noves instal.lacions. Des d\'IEPI ens varen informar que no havia pressupost per incloure l\'aire acondicionat.\r\nAra ens han dit que, actualment, sí es disposa de dotació econòmica per posar aire acondicional a la seu de l\'EAP, que ho hem de sol.licitat mitjançant un correu, a vosaltres, i que ens dirieu les segúents passes a fer', 567, 3, 1, '2025-04-04', '0000-00-00', 1, NULL, NULL, NULL, ''),
(96, '61-2025', '', 76, NULL, 'Reubicació aula UEECO', 0.00, 'N', 'Consulta relacionada amb la reorganització dels espais prevista de cara al proper curs, arran de l\'autorització de l\'aula UEECO.', 387, 1, 1, '2025-04-04', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(97, '62-2025', '', 13, NULL, 'Instal·lació de dues piques i griferia a l\'aula de plástica', 0.00, 'N', '', 326, 11, 1, '2025-04-04', '0000-00-00', 1, 1, NULL, NULL, ''),
(99, '64-2025', '', 78, NULL, 'Trasllat menjador escolar', 0.00, 'N', 'possibilitat de traslladar el menjador a un nou espai dins del mateix edifici. Es tracta de dues aules contigües que volem unificar en una sola, i per les quals ja comptem amb l\'aprovació del pla d\'infraestructures per part de l\'ajuntament de Sant Josep.  Ens agradaria saber si seria viable destinar aquest espai com a nou menjador', 271, 1, 1, '2025-04-10', '0000-00-00', NULL, 1, NULL, NULL, ''),
(100, '65-2025', '', 54, NULL, 'Reparació reixa metàl·lica al bar del centre.', 0.00, 'N', '📍 Incidència detectada\r\n\r\n    Centre afectat: IES s\'Arenal\r\n    Data de l’avís inicial: 10 d’abril de 2025\r\n    Problema: Desperfecte a la barana de la zona del bar, que protegeix un desnivell d’1,5 metres.\r\n    Risc: Afecta la seguretat de l’alumnat i del personal.\r\n    Causa: Oxidació i dilatació dels perns i del forjat, provocant trencaments a la base d’ancoratge i desplaçament de la barana.\r\n    Mesura provisional: Col·locació de barreres per restringir l’accés.\r\n\r\n🛠️ Proposta de reparació\r\n\r\n    Es considera més adient dur a terme una intervenció general i definitiva en lloc d’una reparació puntual.\r\n    Es consulta a la Conselleria si l’actuació ha de ser assumida pel centre o pot ser gestionada i coberta per l’administració.\r\n\r\n📄 Pressupostos i decisió\r\n\r\n    Data d’enviament dels pressupostos: 3 de juny de 2025\r\n    Es presenten tres pressupostos al Consell Escolar.\r\n    S’elegeix el pressupost Barana bar 3 de l’empresa Instalaciones y Reformas, per ser el de menor quantia en igualtat de condicions.\r\n    Tots els pressupostos inclouen la gestió de residus.\r\n\r\n✅ Aprovació\r\n\r\n    El 20 de juny de 2025, Antoni Morro Gomila (Cap del servei d’Infraestructures Educatives) dona el vistiplau per procedir, indicant que es farà amb càrrec al pressupost del centre.', 818, 11, 3, '2025-04-10', '0000-00-00', 2, NULL, NULL, NULL, ''),
(101, '66-2025', '', 224, NULL, 'Desperfectes i necessitats del centre', 0.00, 'N', 'L\'IBISEC ens reenvia el correu que ha rebut del centre amb els desperfectes.\r\n\r\nBon dia,\r\nSóc Na Maria Jesús Murcia, directora del CEIP S\'ALGAR de S\'Arenal de Llucmajor.\r\nTinc una sèrie de dubtes respecte al pla d\'emergència i evacuació, que ens agrairia em poguès aclarir.\r\n\r\n- Una vegada realitzat el Pla d\'emergència, segons es va explicar a la reunió, el tècnic ho ha de registrar en tràmit telemàtic? Em podria facilitar exactament quin és.\r\n- El Pla ha d\'estar sellat pel col.legi d\'arquitectes o no és necessari?\r\n- I una vegada que estigui registrat, tots els riscs evitables o deficiències, a qui he d\'informar? (Com per exemple extintors caducats, no estan senyalitzats o manquen, llums d\'emergència , paviments de pati..... ja que ens costa que l\'ajuntament  es faci càrrec i responsable.)\r\n\r\nHe intentat contactar telefònicament, però m\'han facilitat aquest correu per transmetre els dubtes. Avui el centre està tancat per dia de Lliure elecció, però li facilit el meu telèfon personal per si de cas 667539769', 399, 1, 1, '2025-04-10', '0000-00-00', NULL, 1, NULL, NULL, ''),
(102, '67-2025', '', 202, NULL, 'Comptador compartit IES/CEIP Son Rullan', 0.00, 'N', 'La setmana passada, els serveis de manteniment de l\'Ajuntament de Palma em varen enviar un correu sobre la inspecció OCA (per un Organisme de Control Autoritzat) del CEIP Son Rullan, que comparteix comptador amb l\'IES Son Rullan.\r\nHe arxivat els documents als dos centres, tant a la carpeta de l\'IES Son Rullan com a la carpeta del CEIP Son Rullan. S\'hauria d\'obrir una actuació per cada centre, per tenir-les presents.', 453, 3, 1, '2025-04-11', '0000-00-00', 2, NULL, NULL, NULL, ''),
(103, '68-2025', '', 202, NULL, 'Comptador compartit IES/CEIP Son Rullan', 0.00, 'N', 'La setmana passada, els serveis de manteniment de l\'Ajuntament de Palma em varen enviar un correu sobre la inspecció OCA (per un Organisme de Control Autoritzat) del CEIP Son Rullan, que comparteix comptador amb l\'IES Son Rullan.\r\nHe arxivat els documents als dos centres, tant a la carpeta de l\'IES Son Rullan com a la carpeta del CEIP Son Rullan. S\'hauria d\'obrir una actuació per cada centre, per tenir-les presents.', 833, 3, 1, '2025-04-11', '0000-00-00', 2, 1, NULL, NULL, ''),
(104, '69-2025', '', 71, NULL, 'Licitació ventiladors', 0.00, 'N', 'Bon dia,\r\na principi de curs vam ser informats que Conselleria havia adquirit una partida per a comprar ventiladors. Volíem saber com està aquest tema?\r\ngràcies', 804, 11, 1, '2025-04-14', '0000-00-00', 1, NULL, NULL, NULL, ''),
(105, '70-2025', '', 52, NULL, 'Vàries actuacions', 0.00, 'N', 'Som en Joan Ramon Mateu Torandell director del CEIP Miquel Capllonch\r\nMe posava en contacte amb vosaltres per dues qüestions:\r\n\r\n    1. Feines pendents:  a) Com ja heu estat informats en diverses vegades tenim unes humitats que ens venen del terra, suposadament es alguna tuberia de les baixants de les pluvials que ens causa el problema. L\'ajuntament de Pollença ja us ha enviat l\'informe tècnic i esperam resposta. b) A principi de curs varem rebre la visita del conseller i vàrem comunicar que ens agradari fer un tancament de les entrades d\'educació infantil, ja que estan a l\'intemperi i quan plou l\'aigua entra a les aules. Seguim esperant resposta.\r\n    2. Dubtes i mes problemes: Resulta que tenim dins la sala de màquines un acumulador d\'aigua calenta que s\'ha foradat i necessitam canviar-lo o arreglar-lo; a més a més, ens hem adonat que el desaigua que hi ha a la sala de calderes no està al lloc adequat ja que la sala te el rost canviat i el desaigua no recull l\'aigua per tant ens causa goteres interiors i més humitats. Necessitam una RESPOSTA PER SABER COM ACTUAR.\r\nAdjunt fotografies dels diferents casos.', 355, 1, 1, '2025-04-15', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(106, '71-2025', '', 52, NULL, 'Problemes greus de goteres', 0.00, 'N', 'S\'han enviat diferents emails (17 de març, 14 d\'abril i 15 d\'abril) indicant els\r\nproblemes greus de goteres que patim al CEPA Llevant i noves fissures que han\r\naparegut.\r\nDes d\'IBISEC ens han comunicat que s\'han enviat al vostre departament. Si fos\r\npossible, ens agradaria saber en quina situació es troba aquesta sol·licitud, ja que\r\ncada vegada s\'ha agreujat més la problemàtica que patim i des del dia 17 de març\r\nno hem rebut cap resposta', 492, 1, 3, '2025-04-15', '0000-00-00', NULL, 4, NULL, NULL, ''),
(107, '72-2025', '', 13, NULL, 'Sol·licitud de renovacio de tots els banys antics.', 0.00, 'N', 's\'han detectat fugues per rotura de canonades durant les\r\nvacances de Pasqua L\'Ajuntament s\'encarregarà de valorar els danys i poder donar solució\r\ndurant l\'estiu (Hauran d\'alçar el terre fins arribar a l\'escomesa del carrer)\r\nL\'entitat municipal s\'encarregarà d\'arreglar les canonades però no actualitzarà els banys que\r\ndaten de la construcció de l\'edifici 1970, les cisternes encara tenen cadena...\r\nPer aquest motiu sol·licitam la renovació de tots els banys antics del centre.', 470, 1, 1, '2025-04-28', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(108, '73-2025', '', 76, NULL, 'Canvi de lloc del despatx de la direcció. (Ja han remes els plànols i fotos sol·licitades). Veure seguiment de l\'actuació', 0.00, 'N', 'voldríem fer un canvi d\'ubicació del despatx de direcció per posar-lo en un lloc més accessible i a l\'abast de tota la comunitat (s\'adjunta plànol). \r\nWhatsApp Image 2025-05-02 at 11.08.34 (1).jpeg', 255, 1, 1, '2025-05-02', '0000-00-00', 2, 1, NULL, NULL, ''),
(109, '74-2025', '', 72, NULL, 'Descalcificador avariat', 0.00, 'N', 'tenim un problema amb el descalsificador situat a l\'edifici d\'infantil on també hi ha la cuina i el menjador. \r\nL\'aparell no funciona i això fa que els electrodomèstics es facin malbé.\r\nUn dels rentaplats ja s\'ha romput i l\'altre té avaries constants per culpa de la calç.\r\nDes de l\'Ajuntament ens asseguren que no és competència seva la reparació.\r\nVoldríem saber si des de l\'IBISEC es podria reparar o canviar aquest aparell, tal i com es va fer amb l\'aire del quarto fred el curs passat. \r\nHem de fer la compra d\'un rentaplats nou i és una despesa important que no volem fer sinó tenim arreglat el descalsificador, per evitar avaries en l\'aparell nou.\r\n\r\nEsper la vostra resposta', 345, 3, 1, '2025-05-02', '0000-00-00', 1, 1, NULL, NULL, ''),
(110, '75-2025', '', 223, NULL, 'Posible fuita d\'aigua', 0.00, 'N', 'Envio aquest correu als contactes que tenim a fi d\'accelerar la comunicació, demanam perdó si fem spam. Al dia d\'avui el centre està pendent de l\'autorització d\'una porta nova a la cafeteria; al darrer correu hem adjuntat nous pressupostos adaptats a les consideracions tècniques requerides per part seva, estam esperant una resposta per iniciar les tasques.. D\'ALTRA BANDA vos comuniquem que hem detecta una important fuita d\'aigua a la canalització d\'aigua des de l\'aljub dels edificis de sos Monjos i de Batxillerat cap els edificis. El motor d\'impulsió està permanentment en marxa i no hem vist cap aixeta ni cisterna oberta, per tant pensam que és una fuita important de la canal subterrània de la conducció d\'aigua neta. Ara mateix tenim els banys dels mencionats edificis i l\'alumnat i professorat dels dos edificis baixa per fer ús a l\'edifici principal. Esperam assessorament per part de conselleria ja que no es tracta d\'una simple feina de llanterners.', 800, 1, 3, '2025-05-02', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(111, '76-2025', '', 218, NULL, 'Contracte manteniment climatitzacio i  varis treballs de conservació pendents', 0.00, 'N', 'A partir d’aquest 2025 ja no tendrem l’empresa de manteniment que la conselleria ens va\r\nassignar (Requejo) durant els dos darrers anys. A partir d’ara el manteniment l’haurem de\r\nfer nosaltres, però el problema que tenim és amb el manteniment del sistema de\r\nclimatització. Hem demanat a la mateixa empresa per continuar amb el manteniment i el\r\ncost mensual és de 1298.22 € (annex 1) més les reparacions que se’n derivin. No podem fer\r\nfront als més de 15.000€ que suposarà el manteniment de la climatització.\r\nA part del manteniment de la climatització, hi ha una sèrie d’actuacions per a la conservació\r\nde l’edifici que no s’ha duit a terme durant aquests 2 anys en els quals l’empresa Requejo\r\nse n’ha ocupat del manteniment i que fan que l’estat i la imatge del centre es deteriori\r\n(annex 2): parets sense pintar, il·luminació molt deficient, portes de fusta rompudes,\r\ndiverses goteres a les teulades, taques d’humitat a la façana… i una urgent revisió del\r\nsistema elèctric.\r\nA més a més, després de la visita del conseller durant el curs passat, s’acordaren tres\r\nactuacions més grans que encara romanen sense data de realització: reforma de\r\nconsergeria, revisió de l’amfiteatre i asfaltat del pati.\r\nPER AIXÒ, DEMANAM\r\n1- Disposar d’una solució realista per al manteniment de la climatització i les actuacions de\r\nconservació de l’edifici.\r\n2- Tenir una data de realització de les actuacions acordades amb el conseller', 791, 1, 1, '2025-05-06', '0000-00-00', NULL, 1, NULL, NULL, ''),
(112, '77-2025', '', 219, NULL, 'Caiguda del tancament perímetral', 0.00, 'N', 'Adjunt algunes de les fotos dels efectes d\'un acte de vandalisme fet per dos al.lots (han provocat un incendi devora les aules taller) que han entrat fàcilment al pati aquest diumenge a causa del deteriorament i caiguda de part del mur perimetral. \r\nPer la qual cosa us pregam una actuació ràpida per subsanar aquesta deficiència que ja duim temps reclamant.', 798, 1, 3, '2025-05-06', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(113, '78-2025', '', 64, NULL, 'Reiteren Sol·licitud de 27/02/2025 d\'eliminació de barreres arquitectòniques', 0.00, 'N', 'Bon dia, en data del 21 de febrer varem compartir un arxiu amb fotos per justificar la necessitat de eliminar barreres arquitectòniques a l\'IES XARC.\r\nEncara no hem obtingut resposta i volem saber si s\'ha de fer a través de IBISEC o ho podem fer a través de infraestructures. El centre té alumnes amb discapacitats i necessitem poder donar tràmit a la seva petició. Ens podeu donar instruccions?\r\n\r\nD\'altra banda, el mateix centre està pendent de canviar la fusteria donat que les portes estan desfetes i ja no es poden arreglar els panys perquè la fusta està desfeta. són unes 70 portes. Aconselleu iniciar l\'actuació a través de IBISEC o considereu que serà més ràpid fer una part aquest any a través de Infraestructures i una altra part l\'any vinent?  \r\n\r\nEsperem la vostra resposta.', 834, 1, 2, '2025-05-06', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(114, '79-2025', '', 72, NULL, 'Consulta relacionada amb l\' inspecció dels ascensors', 0.00, 'N', 'L\'OCA ens ha enviat el certificat, que és favorable sense defectes però que inclou 2 deficiències que, segons ens van informar, corresponen a modificacions introduïdes a la darrera normativa sobre ascensors que es va publicar l\'any passat i que, en qualsevol cas, hauran de quedar resoltes abans de la propera inspecció d\'aquí a 2 anys.', 828, 11, 1, '2025-05-07', '0000-00-00', 1, NULL, NULL, NULL, ''),
(115, '80-2025', '', 21, NULL, 'Sol·licitud d’instal·lació d’estructura de joc per al pati d’educació infantil', 0.00, 'N', 'Tal com se’ns va indicar, aquest tipus d’equipaments no han pogut ser inclosos dins la licitació inicial per motius tècnics (vist i plau municipal, compliment de normativa específica, etc.), i és aquest Servei qui n’ha de supervisar la tramitació i execució.\r\n\r\nConsiderem aquesta estructura com una necessitat prioritària, ja que és essencial per al desenvolupament psicomotor i social dels infants de 3 a 6 anys. \r\n\r\nRestam a l’espera de les vostres indicacions sobre els passos a seguir per iniciar aquest procés, així com sobre la viabilitat i els criteris per fer aquesta sol·licitud. Restam també a la vostra disposició per ampliar qualsevol informació que pugui ser necessària.', 306, 3, 1, '2025-05-07', '0000-00-00', 1, 1, NULL, NULL, ''),
(116, '81-2025', '', 223, NULL, 'Rotura tuberia baixant i filtracions a una aula', 0.00, 'N', 'Us informam que aquest matí s’ha detectat una incidència greu a l\'aula de 5 anys A d\'Educació Infantil. Ens hem trobat amb una important acumulació d’humitat i una forta mala olor. Posteriorment, s’ha produït una filtració d\'aigua a l\'interior de l’aula.\r\n\r\nTot sembla indicar que la fuita prové d\'una baixant, possiblement vinculada a les instal·lacions de la cuina. L\'aigua ha entrat dins l\'aula amb una olor molt desagradable, fet que ens ha obligat a traslladar l’alumnat a un altre espai del centre per garantir la seva seguretat i benestar.\r\n\r\nAtesa l’ experiència dels darrers anys amb problemàtiques similars, sol·licitam la coordinació i la intervenció immediata tant de l’Ajuntament d’Esporles com de la Conselleria d’Educació per tal de solucionar aquesta situació de manera urgent i definitiva.\r\n\r\nAdjuntam fotografies preses aquest mateix matí per documentar l’estat de l’espai afectat.', 310, 1, 3, '2025-05-07', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(117, '82-2025', '', 8, NULL, 'Ampliació sala cap d\'estudis', 0.00, 'N', 'L\'equip directiu de l\'IES Cap de LLevant sol·licita poder engrandir la sala de cap d\'estudis del centre ajuntant-la amb una sala contigua. Es tracta de eliminar un mur de separació entre les dues sales, aquest mur no arriba fins la part de dalt del sostre sinó que només supera un poc el fals sostre, és un mur només de separació i per tant, és fàcil enderrocar-lo.\r\n\r\nEl centre es faria càrrec de la part econòmica de les obres i aquestes durien a terme a final d\'aquest curs quan ja no hi hagi alumnes, finals de juny, juliol o agost.\r\n\r\nRemetem plànol amb la situació exacte del mur, marcat en color vermell, que es vol suprimir. Les dues estàncies a ajuntar serien les E022 i la E024.', 778, 11, 1, '2025-05-08', '0000-00-00', 1, NULL, NULL, NULL, ''),
(118, '83-2025', '', 224, NULL, 'Sol·licitud de substitució del ascensor', 0.00, 'N', 'Em dirigeixo a vosaltres des de l\'IES Calvià, amb motiu de les deficiències detectades a l’ascensor de l’edifici A del nostre centre, que es troba fora de servei des d\'abans de les vacances de Pasqua. Aquestes deficiències han estat detallades a al missatge enviat per l’empresa de manteniment, que adjunt a aquest correu per a la vostra consideració.\r\n\r\nL’empresa responsable del manteniment m\'ha facilitat un pressupost de reparació, també adjunt, que contempla la substitució de determinades peces. Tanmateix, m\'han informat que, en cas de fallida d’altres components no inclosos en el pressupost, la reparació podria resultar inviable a causa de l’obsolescència de l’equip actual.\r\n\r\nDavant d’aquesta situació, i per garantir la seguretat i accessibilitat dels usuaris del centre, sol·licito la substitució completa de l’ascensor, incloent-hi l’execució de l’obra necessària. Adjunt igualment el pressupost corresponent a aquesta actuació per a la vostra valoració.\r\n\r\nNo obstant això, estam treballant amb altres empreses del sector per valorar altres pressupostos i així, en cas que ens doneu la possibilitat de rebre la partida pressupostària, poder realitzar l\'expedient de despesa corresponent.\r\n\r\nResto a la vostra disposició per ampliar qualsevol informació que considereu necessària i quedo a l’espera de la vostra resposta.\r\n\r\nAtentament,', 775, 2, 1, '2025-05-12', '0000-00-00', 1, 1, NULL, NULL, ''),
(119, '84-2025', '', 219, NULL, 'Sol·licitud canvi de finestres', 0.00, 'N', 'Bon dia,\r\ntal com hem quedat en conversa telefónica demanam informació sobre la sol·licitud de canvi de finestres i persianes de la nostra escola.\r\nSembla que la sol·licitud no es troba.\r\nEl curs 23-24 vàrem tenir la visita del conseller d\'educació i ens va dir que durant el curs 24-25 es canviarien  les finestres i les persianes.\r\nLes finestres són molt antigues i velles. No tanquen bé. Quan feim el simulacre d\'incendis per normativa totes les finestres han de quedar tancades. D\'algunes aules i passadissos és impossible fer-ho ràpidament i sense pujar-se a una escala.\r\nEls vidres de les finestres són molt prims i passam fred en l\'hivern i calor en l\'estiu. Els passadissos són un forn quan fa calor.\r\nMoltes finestres estan sense lames i és perillós perquè els infants poden caure i quan fa calor és necessari tancar les persianes.\r\nDemanam informació de l\'actuació requerida.', 326, 14, 1, '2025-05-12', '0000-00-00', 1, 1, NULL, NULL, ''),
(120, '85-2025', '', 224, NULL, 'Sol·licitud, per part de l\'Ajuntament de Palma, de manteniment periòdic d\'una zona enjardinada', 0.00, 'N', 'Des del Servei d’Infraestructures Educatives hem rebut una petició de l’Ajuntament de Palma, derivada d\'una queixa vecinal per tal que es dugui a terme una actuació de neteja d’herbes i manteniment a la zona enjardinada devora el Conservatori Superior de Música i Dansa, especialment a l’entorn de l’estàtua als Donants de Sang, al carrer Alfons el Magnànim.\r\n\r\nSegons s’indica, l’espai es troba en un estat de deixadesa, amb presència d’herbes i brutícia.', 554, 1, 1, '2025-05-13', '0000-00-00', NULL, 2, NULL, NULL, ''),
(121, '86-2025', '', 224, NULL, 'Tala de pins, risc de caigudes per vent o pluja', 0.00, 'N', 'tenim un jardí molt gran amb uns 20 pins, però cada vegada són més grans i ja començen a invadir l\'edifici. Vos adjunt un informe de l\'empresa de jardineria amb les recomenacions que hem de fer. Aleshores, \r\n\r\n    Podem talar els pins? Pensam que són un risc per a la comunitat educativa i per als edificis.\r\n    Qui paga aquesta despesa?\r\n    Avançam nosaltres els diners  i després la Conselleria ens fa un ingrés?\r\n\r\nQued a l\'espera de la vostra resposta per fer una següent passa,', 767, 6, 3, '2025-05-16', '0000-00-00', 1, 1, NULL, NULL, ''),
(122, '87-2025', '', 223, NULL, 'Bany amb fuites d\'aigua', 0.00, 'N', 'Des del mes de juliol tenim banys condemnats per fugues d\'aigua. \r\nEn el mes de novembre va venir l\'arquitecta Helena Guinjoan a fer la visita a les instal·lacions. No hem rebut resposta.\r\nA finals de gener vam rebre una partida econòmica en concepte d\'obres. Sense cap explicació.\r\nEsteim a l\'espera, que ens detallin el procediment a seguir.\r\nDesprés de varies telefonades i correus, no hem rebut resposta i ja és un tema preocupant, les fugues son per dins l\'infraestructura i no totes es fan visibles fàcilment. Això suposa un deterior de l\'edifici. També dir que el problema es fa extensible a altres sanitaris. Ara ja son més els banys que necessiten reparació.\r\nAgrairíem que us possessiu en contacte amb el centre per sabre com procedir.', 268, 1, 2, '2025-05-16', '0000-00-00', NULL, 1, NULL, NULL, ''),
(123, '88-2025', '', 224, NULL, 'Caiguda de lluminàries al fals sostre', 0.00, 'N', 'avui, et temps del pati, dos professors eren a una de les sales de feina que tenim al centre i ha\r\ncaigut un dels llums del fals sostre i 2 o 3 plaques. Adjunt 2 fotografies.\r\nJustament, un dels professors s\'havia aixecat per anar a cercar uns papers i no l\'ha endevinat,\r\nperò podria haver estat molt greu.\r\nAra mateix, hem tancat la sala i hem telefonat a la persona que ens du el manteniment per què\r\nvengui urgentment a arreglar el desperfecte i revisi la resta de fals sostre per tal d\'assegurar que\r\nno implica perill.\r\nAquest fet ens fa pensar en quin deu ser l\'estat del fals sostre de tota la resta del centre. Això\r\nhagués pogut passar dins una aula durant les classes.\r\nÉsper això que sol·licitam la revisió del fals sostre per poder tenir clar que la instal·lació és\r\nsegura pel nostres alumnat i professorat.', 791, 11, 1, '2025-05-19', '0000-00-00', 2, NULL, NULL, NULL, ''),
(124, '89-2025', '', 224, NULL, 'Aigua calenta, filtracions, enrajolat cuina, coberta alumini', 0.00, 'N', 'Al present correu vos comunicam, conjuntament el CIFP POLITÈCNIC DE LLEVANT i l\'IES MANACOR, una sèrie de deficiències que requereixen de la vostra intervenció:\r\n\r\n- Aigua calenta al pavelló. \r\nL\'aigua calenta del pavelló és generada per una instal·lació sobredimensionada que amb el pas dels anys s\'han anat espanyant diversos elements de cost elevat que hem anat solucionant amb petites modificacions del sistema. Durant aquest curs els problemes han persistit i no hem pogut assegurar el correcte funcionament. Per aquest motiu necessitam traçar un pla d\'actuació per tal de poder garantir el correcte funcionament de la instal·lació. Nosaltres parlant amb gent del sector pensam que la solució passa per instal·lar un sistema d\'acumuladors elèctrics o d\'aerotermia que simplifiquin la instal·lació i els possibles problemes i a la vegada s\'aprofitin de la generació solar fotovoltaica de que disposa el centre, donat que amb l\'actual sistema s\'ha de comprar gas. Ens agradaria tenir una reunió insitu per tal de valorar les possibles solucions. \r\n\r\n- Evacuació aigua quan plou de forma intensa.\r\nDurant el darrer trimestre de l\'any 2024 es va fer una intervenció per millorar el drenatge i evaquació de l\'aigua. Fa uns dies va ploure, sense un extrema intensitat, i ja va tornar entrar cap a la zona del hall. Voldríem valorar possibles solucions ja que quan entra aigua ràpidament entra al foso de l\'ascensor i a l\'aula magna que esta enmoquetada (ha bufat i dona una mala imatge de l\'aula).  (AQUESTA INCIDÈNCIA ESTÀ COMUNICADA A L\'IBISEC I HAN DIT QUE FARAN UNA NOVA INTERVENCIÓ)\r\n\r\n- Enrajolat paret cantina.\r\nA la cantina hi ha un problema de filtracions d\'aigua des del terrat de sobre i que ha fet penetrar la humitat dins  el mur de pladur que esta enrajolat. Degut a aquesta humitat les rajoles es van desferrant i van caient. Es podria fer una intervenció tapant les goteres (no sabem exactament des d\'on es filtra l\'aigua) i d\'anar arreglant el que cau, però al ser de pladur fa necessari desmontar completament el mur i refer-lo de nou. Per aquest motiu també ens agradaria que ens faceu una visita per veure quina seria la millor opció. \r\n\r\n- Ferro i onduline oxidats:\r\nVos recordam que continuam sense poder fer el manteniment de les columnes i jàceres de ferro que hi ha als passadissos i a les escales del centre, donat l\'elevat cost inassumible per qualsevol dels dos centres. A més, anteriorment, ja es va fer constar que moltes peces d\'onduline de ferro galvanitzat que hi ha damunt les escales i a la porxada que duu fins a la cantina es troben oxidades i convendria canviar aquestes peces (una arquitecta de l\'IBISEC crec que ja va fer un informe fa uns anys).', 525, 1, 1, '2025-05-19', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(125, '90-2025', '', 79, NULL, 'Ombres', 0.00, 'N', 'Bon dia. Li remet aquest correu arrel de la reunió telemàtica  mantinguda avuí amb el servei d\'infraestrutures.\r\nEl mes passat vàrem instal·lar una pérgola per donar més ombra al pati de Primària del nostre centre. La veritat és que desconeixíem la normativa referent a l\'obligació de comunicar-lo prèviament al Servei d\'Infraestrutures educatives. L\'ajuntament està informada de la instal·lació però vàrem ser nosaltres els que ho vàrem gestionar amb una empresa, donat que l\'ajuntament no tenia diners per financiar-la.\r\nEs per això que volíem posar en coneixement d\'aquest fet al servei, arrel de les indicacions donades en la reunió d\'avui.\r\nEsperant ens comuniquin què hem de fer a partir d\'ara, li saluda atentament\r\nFco. Javier Rey', 317, 1, 1, '2025-05-19', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(126, '91-2025', '', 61, NULL, 'Trispol gimnàs', 0.00, 'N', 'Adjuntam 4 pressupostos de reforma del parquet del gimnàs del CEE Son Ferriol.\r\nTambé adjuntam l\'informe fet per la tècnica Helena Guinjoan Palau-Ribes del Servei d\'Infraestructures de centres , fet el 11 de febrer de 2025.\r\nCom vàrem acordar vos facilitam aquests pressupostos abans d\'inciar l\'expedient de despesa per a què ens confirmeu si les opcions a triar entren dins dels requisits de l\'informe , malgrat les diferències entre algun ells.', 165, 2, 1, '2025-05-19', '0000-00-00', 1, NULL, NULL, NULL, ''),
(127, '92-2025', '', 72, NULL, 'Consultes vàries', 0.00, 'N', 'Bon dia,\r\nArran de la sessió formativa d\'ahir ens han sorgit alguns dubtes que voldria comentar-vos per si els podem aclarir.\r\n\r\n1. Pla d\'autoprotecció. El nostre pla d\'autoprotecció està obsolet, i el passat mes d\'abril vam registrar una instància (adjunta) a la Conselleria (VALIB identificador 380913) i a l\'Ajuntament, demanant solucions. La directora del centre ha mantingut converses amb la delegada territorial i aquesta ha assegurat que n\'està al cas i que ho tenen present, però nosaltres no tenim cap constància de res. Després de la reunió d\'avui ens ha sorgit el dubte: qui s\'ha d\'encarregar de cercar el tècnic que ha de fer el pla? qui l\'ha de pagar? com podem saber si el nostre pla està en marxa?\r\n\r\n2. Tabics. Si fos el cas que volguéssim tirar un tabic per unir dues aules i fer un espai més gran, com hauríem de procedir? l\'edifici és municipal...\r\n\r\n3. Pèrgoles. El centre disposa d\'algunes pèrgoles per fer ombra als patis. Algunes són més noves que d\'altres. En el moment que es van fer no es va demanar a un tècnic que les supervisés. Ara hem de contactar amb qualque expert que acrediti que estan ben clavades al terra i que són segures? com hem de procedir?\r\n\r\n4. Estructura. Fa unes setmanes la brigada d\'obres de l\'Ajuntament va llevar una estructura (amb el cautxú) que estava en mal estat. Ens han dit que en posaran una de nova (l\'edifici és responsabilitat de l\'Ajuntament), i mentrestant han comentat que ens posrien arena a la zona (de moment no l\'han posada). En aquest cas, si ho fa tot l\'Ajuntament (comprar i instal·lar l\'estructura), hem de fer cap sol·licitud o informar a Conselleria?', 425, 1, 1, '2025-05-19', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(128, '93-2025', '', 224, NULL, 'Substitució del terra de tres aules i la instal·lació d\'aire condicionat', 0.00, 'N', 'Sóc Eduardo Arroyo, director del CEIP Son Pisà.\r\n\r\nAmb motiu de la visita realitzada pel Conseller d’Educació i Universitats, Sr. Antoni Vera Alemany, i la Directora General de Planificació i Gestió Educativa, Sra. Catalina Maria Ginart Serrano, per a la inauguració de l’Escoleta al nostre centre, se\'ns va demanar informació sobre les necessitats actuals del centre.\r\n\r\nEn aquella ocasió, vam exposar que tres aules d\'Educació Infantil presenten un estat molt deteriorat del paviment, amb un desgast considerable que en dificulta l’ús adequat. Tant el Conseller com la Directora General van poder constatar in situ la necessitat urgent de substituir el terra d’aquestes aules.\r\n\r\nD\'altra banda, també es va comentar la manca d\'un sistema de climatització a les tres noves aules de 2 anys. Durant els mesos de primavera i estiu, aquestes aules assoleixen temperatures elevades que poden afectar el benestar dels infants, i per tant és necessari instal·lar-hi aparells d\'aire condicionat per complir amb la normativa vigent sobre condicions ambientals en espais educatius.\r\n\r\nSeguint les indicacions del Conseller i la Directora General, hem gestionat com a centre tres pressupostos de diferents empreses per a cadascuna de les actuacions esmentades. Adjuntam, per tant, els pressupostos corresponents a la substitució del terra de les tres aules d’Infantil i a la instal·lació d\'aire condicionat a les tres aules de 2 anys.\r\n\r\nAmb aquest escrit, sol·licitam a la Direcció General d\'Infraestructures la concessió dels fons necessaris per poder dur a terme aquestes millores tan necessàries.\r\n\r\nRestam a la vostra disposició per ampliar qualsevol informació que considereu oportuna.', 452, 1, 1, '2025-05-19', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(129, '94-2025', '', 51, NULL, 'Goteres poliesportiu', 0.00, 'N', 'és per informar de les inundacions que vam tenir al poliesportiu després de les pluges del passat cap de setmana. Adjunt hi trobarà un informe amb fotografies. \r\n\r\nEl tècnic IBISEC de Menorca, sr. Jordi Picot, n\'està al corrent.', 796, 1, 1, '2025-05-19', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(130, '95-2025', '', 6, NULL, 'Eliminació barreres arquitectòniques, Mateo Suñer li dona prioritat a aquesta actuació.', 0.00, 'N', 'en el nostre centre no tenim ascensor per pujar al primer pis i ens és molt necessari pel fet de tenir alumnes amb problemes de mobilitat als quals els serà impossible pujar escales per accedir a dalt.\r\nPer tant, vos demanam que ho valoreu i ho tingueu en compte. L\'eliminació de barreres arquitectòniques', 365, 2, 3, '2025-05-19', '2025-05-19', 2, NULL, 2, 1, ''),
(131, '96-2025', '', 49, NULL, 'Filtracions de la coberta', 0.00, 'N', 'Us comuniquem que amb les fortes puges d\'aquest passat diumenge hem trobat dues aules que han patit greus filtracions d\'aigua des del sostre.\r\nDemanem que algun tècnic vengui a fer una revisió i que garanteixi que no hi ha perill per l\'alumnat. Ara mateix el sostre està amerat i hem hagut de traslladar els alumnes d\'aula.', 325, 1, 1, '2025-05-19', '0000-00-00', NULL, 1, NULL, NULL, '');
INSERT INTO `actuacions` (`id`, `codi`, `codi_extern`, `subtipus_id`, `origen`, `descripcio`, `pressupost`, `assumit_servei`, `observacions`, `centre_id`, `estat_id`, `prioritat_id`, `data_entrada`, `data_enviament`, `tecnic_id`, `origen_id`, `desti_id`, `mode_enviament_id`, `url_ibisec`) VALUES
(132, '97-2025', '', 54, NULL, 'Reparació marquesina d\'accés per despreniments. A la espera de pressuposts.', 0.00, 'N', 'Se deben hacer las actuaciones siguientes:\r\n\r\n    Retirar con medios manuales (sin compresor) los fragmentos del recubrimiento de hormigón con riesgo de caída. Según conversación telefónica, esta operación ya se ha realizado como actuación preventiva.\r\n    Repicar con medios manuales (sin compresor) las zonas de la losa donde se aprecien grietas, para poder reparar el forjado. Debe revisarse todo el perímetro de la marquesina. En las fotografías se aprecian desprendimientos anteriores en algunas zonas de la marquesina.\r\n    Rascar el óxido de las armaduras con un cepillo de púas metálicas, aplicar pintura pasivante para evitar la oxidación. Aplicar un puente de unión y una capa de mortero de reparación con fibras.\r\n    Pintar la marquesina de nuevo.\r\n\r\n\r\nSi durante la ejecución de los trabajos se detectan afectaciones graves a las armaduras, podéis comunicarlo al Servicio de Infraestructuras Educativas para poder valorar la actuación.\r\n\r\nPara reparar la marquesina, desde el centro debéis pedir presupuestos para hacer las actuaciones indicadas y remitirlos al Servicio de Infraestructuras Educativas (infraestructureseducatives@ibeducacio.eu).\r\n\r\nLos presupuestos deben ser comparables (deben contener las mismas partidas y las mismas unidades). También deben incluir los medios auxiliares necesarios para realizar los trabajos (andamios, elevadores, etc), la gestión de residuos, que se deben llevar a un vertedero autorizado, y las medidas de seguridad y salud para garantizar la seguridad de los trabajadores durante la ejecución de los trabajos. Por último, en el presupuesto debe constar claramente el desglose del IVA y el importe total de las actuaciones (importe base+IVA).', 768, 3, 1, '2025-05-20', '0000-00-00', 2, NULL, NULL, 1, ''),
(133, '98-2025', '', 57, NULL, 'Arran de les reunions telemàtiques mantingudes amb l\'UGE, on ens van comunicar l\'obligació d\'informar-vos,  els comuniquem els fets per si és del vostre interès fer alguna aportació o revisió.', 0.00, 'N', 'Bon dia, us comuniquem que al nostre centre es va aprovar mitjançant el Consell Escolar la instal·lació d\'una teulada a la zona de pàrquing a l\'interior del recinte per cobrir els patinets elèctrics durant els dies de pluja i evitar així que les seves bateries s\'espanyessin. \r\n\r\nAquest fet es va comunicar a Montse de la Delegació Territorial d\'Educació el passat 12 de febrer, i avui dia estam a punt de començar la instal·lació. \r\n\r\nArran de les reunions telemàtiques mantingudes amb l\'UGE, on ens van comunicar l\'obligació d\'informar-vos,  els comuniquem els fets per si és del vostre interès fer alguna aportació o revisió. \r\n\r\nAtentament\r\nLa secretària', 766, 1, 1, '2025-05-20', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(134, '99-2025', '', 49, NULL, 'L’actuació sobre la pista esportiva és urgent. Les altres intervencions són de manteniment ordinari i es recomana que les executi l’ajuntament.', 0.00, 'N', '🏫 Context\r\n\r\n    Es va sol·licitar una valoració per filtracions i fissures al centre.\r\n    Es va realitzar una visita tècnica el 24 de gener de 2024.\r\n\r\n🔍 Principals problemes detectats\r\n\r\n    Filtracions greus als espais sota la pista esportiva (gimnàs, cuina, banys), causades per:\r\n        Mal drenatge.\r\n        Impermeabilització deficient.\r\n        Pendents inadequades i esquerdes al paviment.\r\n\r\n    Coberta plana del pati superior:\r\n        Presència d’humitat, molsa i vegetació.\r\n        Deteriorament del rejuntat i de la junta de dilatació.\r\n\r\n    Fissures a l’entrada principal:\r\n        Ja s’havien reparat, però han tornat a aparèixer.\r\n        No s’hi detecta risc estructural.\r\n\r\n🛠️ Actuacions proposades\r\n\r\n    Rehabilitació integral de la pista esportiva:\r\n        Demolició del paviment.\r\n        Nova impermeabilització, drenatge i pavimentació.\r\n        Cost estimat: 232.000 €\r\n\r\n    Manteniment de la coberta plana:\r\n        Neteja, rejuntat i reparació de juntes.\r\n        Cost estimat: 3.200 €\r\n\r\n    Reparació de fissures:\r\n        Obertura, segellat i pintat.\r\n        Cost estimat: 2.800 €\r\n\r\n✅ Conclusions\r\n\r\n    L’actuació sobre la pista esportiva és urgent.\r\n    Les altres intervencions són de manteniment ordinari i es recomana que les executi l’ajuntament.', 291, 1, 3, '2025-05-20', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(135, '100-2025', '', 229, NULL, 'Ampliació 0-3 Projecte d\'Activitat d\'Ampliació', 0.00, 'N', '', 859, 1, 1, '2025-05-20', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(136, '101-2025', '', 10, NULL, 'Reestructuració dels espais, els antics laboratoris passaran a ser els tallers', 0.00, 'N', 'Aquest curs han començat fpb de tèxtil i calçat i estan emprant una aula que han adaptat per poder començar, però per poder fer segon es necessari fer tallers. Amb aquesta reestructuració dels espais, els antics laboratoris passaran a ser els tallers que ells necessiten. És imprescindible començar lo abans possible ses obres. És per açò que demanam que doneu màxima prioritat a n\'aquest tema.', 796, 1, 1, '2025-05-21', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(137, '102-2025', '', 5, NULL, 'Ascensor', 0.00, 'N', 'Bon dia, \r\n\r\nDes del novembre estam sense ascensor en un bloc de 3 pisos de l\'institut. Mos hem comunicat amb voltros, enviat l\'únic pressupost que vam aconseguir (les altres dues empreses no van contestar) i mos urgeix arreglar-lo. És un edifici on es mouen unes 600 persones al dia i ja hi ha hagut incidents, com una nina amb crosses que va caure per l\'escala.\r\n\r\nLa darrera cosa que ens vàreu dir era que la renovació havia d\'incloure un punt d\'una llei però l\'empresa diu que no hi ha lloc al buit, que s\'hauria de fer una gran obra. Ells ens han oferit una modernització de l\'ascensor.\r\nNecessitam una solució per tal de començar el curs vinent amb l\'ascensor arreglat. Altres vegades, el que heu fet quan estaveu saturats era donar-mos permís per començar i enviar-mos els doblers.\r\n\r\nTambé volíem aprofitar per informar-vos que mos quedava un terrat fora impermeabilitzar i amb les pluges que hem tengut al llevant de l\'illa, han sortit dues goteres grans , una a la zona d\'ordinadors de la biblioteca i una altra a la sala d\'ordinadors de FPB. Hem fet venir l\'empresa que va guanyar la darrera vegada que vam necessitar impermeabilitzar els altres terrats i estam a l\'espera del pressupost. En tenir-lo, ens posarem en contacte amb voltros.\r\n\r\nAtentament,', 807, 1, 1, '2025-05-22', '0000-00-00', NULL, 1, NULL, NULL, ''),
(138, '103-2025', '', 220, NULL, 'Sistema d\'hombres', 0.00, 'N', 'Bon dia,\r\n\r\nEns posem en contacte amb vosaltres per presentar-vos un projecte Comunitari que volem posar en marxa al nostre espai natura, ubicat a un camp d\'ús agrícola colindant al centre , on no comptem amb cap tipus d\'ombra.\r\n\r\nEl projecte pretén dur-se a terme durant els mesos d\'estiu quan no hi ha alumnat i ha estat dissenyat per l\'arquitecte i dissenyador de l\'empresa MD2A amb elements integrats a la natura (emparrats, fusta...). La instal·lació del sistema correria a càrrec de la pròpia empresa.\r\n\r\nL\'Ajuntament està assabentat del projecte i subvenciona altres propostes complementàries que ha presentat la nostra AFA.\r\n\r\nAdjuntem el projecte, que esperem sigui del vostre gust i quedem a l\'espera de qualsevol cosa.\r\n\r\nEstem a la vostra disposició pel que sigui menester i preguem ens feu saber la viabilitat al abans possible per poder organitzar l\'acomesa amb temps suficient.\r\n\r\nMoltes gràcies de bell nou per la vostra tasca i el temps que dedicareu per poder fer realitat aquesta necessitat dels nostres infants.\r\n\r\nAtentament,', 289, 1, 1, '2025-05-22', '0000-00-00', NULL, 1, NULL, NULL, ''),
(139, '104-2025', '', 6, NULL, 'Sol·licitud AESA – Obres d’accessibilitat i evacuació. Pendent fer sol·licitud a AESA', 0.00, 'N', 'Amb relació a les obres d’accessibilitat i evacuació al CEIP Son Juny, adjunt us\r\ntrametem els plànols, a efectes que feu la sol·licitud a l’Agència Estatal de Seguretat\r\nAèria (AESA).', 450, 1, 1, '2025-05-23', '0000-00-00', NULL, 3, NULL, NULL, ''),
(140, '105-2025', '', 228, NULL, '', 0.00, 'N', 'Som en Toni Boyeras, director del CEIP Ses Roques de Caimari.\r\n\r\nEl passat 28 d\'abril vaig poder assistir a la visita institucional amb el conseller d\'Educació i Universitats a les obres del nou CEIP Caimari i ja vaig exposar el meu desconeixement respecte a la dotació de cablejat (fibra òptica), xarxa wifi (Escuelas Conectadas), recursos digitals (pissarres i TV interactives) amb el que trobarem el nou edifici així com també de qui, quan i com es farà el trasllat de tot l\'equipament instal·lat a l\'edifici escolar actual de Ca Ses Monges (C/ Escoles, 2) de Caimari cap al nou centre escolar.\r\n\r\nVoldria saber una mica la planificació de tot plegat i tenir la seguretat que, si pel setembre hem d\'iniciar el curs al nou edifici, disposarem de tota aquesta infraestructura i connectivitat.', 441, 1, 1, '2025-05-23', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(141, '106-2025', '', 3, NULL, 'Ventiladors aules infantil, ja hem rebut les fotos sol·licitades', 0.00, 'N', 'Bon dia,\r\nSóc Ricardo López, director del CEIP Sa Blanca Dona. Divendres 16 de maig vaig tenir una conversa telefònica amb Miquel Vicens en relació al procediment que s\'havia de demanar per poder col·locar 2 ventiladors de sostre a una aula d\'Infantil de la nostra escola. Aquests ventiladors han estat comprats per l\'AMIPA del nostre centre per ajudar a combatre les altes temperatures que tenim al mes de juny a algunes aules on la incidència del sol al llarg del matí és més intensa.\r\n\r\nAmb la intenció de probar la seva efectivitat a l\'aula 6 de la planta baixa, que pertanya a un grup 6è d\'educació infantil (el grup A), l\'AMIPA decidiria posteriorment si pot invertir en la compra d\'alguns ventiladors de sostre més per cobrir algun parell més d\'aules d\'Infantil próximament. El ventiladors serien col·locats pel bidell de la nostra escola, un al principi de l\'aula i l\'altre al final. El nostre bidell és treballador de l\'Ajuntament d\'Eivissa i s\'encarrega diàriament del manteniment de l\'edifici del centre.\r\n\r\nEn aquest mail, adjunt les factures de compra dels 2 ventiladors de sostre que l\'AMIPA ha comprat, així com el plànol de la planta baixa de la nostra escola. Moltes gràcies.\r\n\r\nSalutacions cordials.', 407, 2, 1, '2025-05-23', '0000-00-00', 1, NULL, NULL, NULL, ''),
(142, '107-2025', '', 5, NULL, 'Millora pati', 0.00, 'N', 'Per la present faig arribar al servei d\'infraestructures educatives la sol·licitud d\'aportació econòmica per a la millora del nostre pati educatiu.\r\nIgualment adjuntem el projecte amb el pressupost', 378, 1, 1, '2025-05-23', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(143, '108-2025', '', 21, NULL, 'Petició d\'un Rocòdrom', 0.00, 'N', 'Després de la reunió mantinguda el dimarts 13 de maig amb el departament d’Infraestructures, us remetem aquest correu per fer-vos arribar un resum de totes les gestions realitzades des del mes d’octubre de 2024, amb l’objectiu de:\r\n\r\n    Sol·licitar la instal·lació d’un rocòdrom al nostre centre.\r\n\r\n    Demanar la millora de la balaustrada del pis superior, ja que aquesta no compleix amb l’alçada mínima exigida segons la normativa de seguretat vigent.\r\n\r\nRelació de gestions realitzades:\r\n\r\n    11 d’octubre de 2024: Enviament, a través de  VALIB i dirigit al Sr.Mateu Suñer Servera ,Secretaria Autonòmica de Desenvolupament Educatiu, de la petició de millora de la balaustrada i de la instal·lació del rocòdrom.\r\n\r\n    16 d’octubre de 2024: Recepció d’un correu de la Sra. Helena Guinjoan confirmant la recepció de les dues sol·licituds i indicant la documentació necessària per continuar amb el procés.\r\n\r\n    5 de febrer de 2025: Enviament per correu electrònic de la documentació referent a la balaustrada (mides i fotografies), tal com se’ns havia sol·licitat. No vàrem rebre resposta.\r\n\r\n    11 d’abril de 2025: Enviament de la documentació referent al projecte del rocòdrom (plànols, pressupost i fotografies) tant al departament d’Infraestructures com a l’Ajuntament. Només rebem resposta de l’Ajuntament, informant que es necessita l’autorització de la Conselleria per tal que puguin emetre el seu vistiplau pel que fa al manteniment. També ens comuniquen que ja han solucionat un problema relacionat amb un cablejat elèctric, de manera que l’espai ja està preparat per a la instal·lació del rocòdrom.\r\n    En aquest mateix correu també sol·licitàvem informació sobre l’estat de la petició de millora de la balaustrada, però no vàrem obtenir resposta.\r\n\r\n\r\nEns trobam en una situació de certa urgència, ja que la instal·lació del rocòdrom ha de realitzar-se abans de finalitzar el curs escolar per complir amb els terminis establerts per una subvenció concedida.\r\n\r\nAgrairíem, per tant, que ens poguéssiu confirmar si teniu en consideració ambdues peticions i si es preveu una resposta pròxima per part vostra', 299, 1, 1, '2025-05-23', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(144, '109-2025', '', 224, NULL, 'Varis', 0.00, 'N', 'Bon dia,\r\n\r\nVos volem informar d\'alguns desperfectes o problemes estructurals del nostre centre, l\'Ajuntament de Manacor ja està assabentat de tots aquests problemes de fa estona (principi de curs o del curs passat) i no hem obtingut cap tipus de resposta.\r\n\r\nAula de suport AL :a principi de curs ja es va detectar aquest desperfecte i amb les pluges continuades d\'aquests mesos s\'ha agreujat, ara la tenim tancada ja que pensam que el sostre pot caure (veure vídeo)\r\n\r\nSala de psicomotricitat: Gotera que fa més de 10 anys que hi ha i el sostre també cau (veure fotos)\r\n\r\nTambé volem informar-vos que la màquina de l\'aparell climatitzadors no funciona i degota contínuament, l\'Ajuntament també ho sap i ja fa anys i no n\'ha fet res.\r\n\r\nVolem posar un joc de pati d\'infantil ( alumnes 3 a 6 anys) ja que el que teníem es va rompre, vos passam l\'enllaç per saber si compleix normativa', 324, 1, 1, '2025-05-23', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(145, '110-2025', '', 12, NULL, 'Sol·licitud contenidor tipus oficina per amagatzemar material esportiu per les obres del menjador', 0.00, 'N', 'Bon dia, \r\nDesprés de la xerrada telefònica amb el,Sr. Jaume Grimalt (IBISEC) , aquest ens va dir que havíem de fer una sol·licitud per un contenidor.\r\nEns han informat que tenim prevista l\'obra per a la realització del menjador escolar, el dia 23 de juny. S\'ha de treure tot el material  de la zona d\'obra i una part correspon al quartet de material d\'educació física. \r\nPer tal cosa, se va preveure posar un contenidor al pati per poder guardar tot el material, ja que no tenim altre espai possible.\r\nSeria molt necessari poder gaudir del contenidor abans de començar les obres i així poder anar guardant-ho tot.\r\nEn contenidor se posaria a una zona del pati i no faria falta instal·lació elèctrica, ja que podria funcionar amb llum solar o amb una llum LED recarregable, a més, se sol utilitzar de dia i no fa falta gaire llum.\r\nTampoc faria falta tomar  la paret que s\'havia pensat en un primer moment.\r\n\r\nPer tot això, sol·licitam un contenidor tipus oficina d\'uns 6m x 2,50m, amb una porta i finestra a la part més ample, si és possible. Gràcies.', 454, 1, 1, '2025-05-23', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(146, '111-2025', '', 218, NULL, 'Climatització i Varis. Ja s\'ha derivat a IBISEC (Toni)', 0.00, 'N', 'som na Nuria Cardona, directora CEIP ES VEDRÀ.\r\n\r\nPrimer de tot agraïr la reunió del dimarts amb en Pep Forteza i el cap de servei de infraestructures educatives, Antoni Morro, tot i ser una pinzellada, va ser molt útil per anar situant-nos i crec que és molt important aquesta tasca de reorganitzar i aclarir totes aquestes qüestions; tot i així, hi ha molta feina a fer i som conscients de tot el que teniu en marxa, als centres també anam saturats. \r\n\r\nDit això, necessito AJUDA:\r\n\r\n- el sistema d’instal·lació tèrmica de l\'escola (calefacció del centre): Està ATURAT  i NO es pot posar en marxa, ha deixat de funcionar!!! \r\n\r\nFins ara, amb el manteniment que anaven fent la calefacció funcionava a la part de primària (edifici nou), però  a la part d\'infantil (edifici antic)  SEMPRE hem tingut problemes, ja que NO S’ESCALFA SUFICIENT, la instal·lació és obsoleta. \r\n\r\nA dia d\'avui ja no només és la part d’infantil amb problemes, sino que la caldera NO FUNCIONA. \r\n\r\nLa comunitat educativa està MOLT PREOCUPADA i no està disposada un altre any a passar fred a l’edifici d’Infantil.\r\n\r\nAdjunt escrit per poder fer arribar el mateix a tots els implicats.\r\n\r\nA la part de l’edifici d’infantil tenim a una aula problemes d\'humitat (pensam que està relacionat amb la instal·lació obsoleta de la calefacció), la fusteria ha quedat vella i gens aïllant, fet que no ajuda (finestres alguna ja ni tanquen, queden un dit obertes, ...)...s’ha d’arreglar la caldera, però  ja no sé si és també s’ha de plantejar una reforma integral de l\'edifici d\'infantil (és la part del centre que va quedar de l\'edifici antic quan es va fer l\'ampliació l\'any 2011).\r\n\r\nALTRES DUBTES:\r\n\r\n1. A la cuina del centre (tenim catering) ens demanen poder tenir aigua calenta; com s\'ha de gestionar? a l\'escola crec que hi havia uns dipòsits d\'aigua però fa uns anys per algun tema relacionat amb la legionel·la es varen buidar i estan inutilitzats; a més, si la caldera no funciona entenc que tampoc funcionarien. Què podem fer? és obligatori tenir aigua calenta a la cuina?\r\n\r\n\r\n2. Al pati de primària tenim un sistema de recollida d\'aigües pluvials, però les reixes són de plàstic i es trenquen amb facilitat; les van reposan/canviant per part de l’ajuntament, però ara ja comença a estar rompuda la canaleta de dins i per tant no es pot col·locar les reixes i queda un forat, és perillós i ja em patit més d’un accident. L’ajuntament ha de seguir reparant o es pot plantejar un canvi?Anul·lar o substituir per un més resistent? Qui s\'hauria de fer càrrec?\r\n\r\n\r\n3. Ajuntament acaba d\'instal·larnos dos aires condicionats empotrats; ja ens informareu sobre el tema, sobre tot per si hem de deixar clar el tema del manteniment o altres coses a tenir en compte. Ara tampoc vos se dir quina potència tenen, ... si necessitau que vos passem dades ens deis quines.\r\n\r\n4. Fa temps que estam intentant instal·lar un rocódrom exterior al pati de primària; a Eivissa no hem trobat massa empreses i és difícil trobar tres pressupostos diferents (només tenim dos), això per una banda però per l\'altre i després de la reunió, entenc que vos he de sol·licitar permís o valoració/vist i plau...QUÈ HEM DE FER? PODEM CONTINUAR GESTIONANT?\r\n\r\n\r\n5. Per posar taules tipus pícnic al pati INF i al de PRIM, què hem de tenir en compte? també vos hem de sol·licitar permís? o ens indicau les característiques que han de complir?\r\n\r\nSegur que ens podeu ajudar en algun d\'aquets temes, però el més URGENT és el de la calefacció.', 301, 1, 1, '2025-05-23', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(147, '112-2025', '', 228, NULL, 'Canvi de seu EOEP Muro', 0.00, 'N', 'des del Servei d\'Inclusió per a la Comunitat Educativa us sol·licitam un canvi de seu de l\'EOEP MURO.  Us remet el correu de la directora de l\'EOEP on s\'especifica el motiu d\'aquesta sol·licitud.', 730, 1, 1, '2025-05-23', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(148, '113-2025', '', 218, NULL, 'Reparació aire condicionat i humitats', 0.00, 'N', '', 359, 1, 1, '2025-05-23', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(149, '114-2025', '', 52, NULL, 'Humitats biblioteca i laboratoris', 0.00, 'N', 'adjuntam el pressupost per impermeabilitzar la biblioteca i el bloc de laboratoris', 807, 1, 1, '2025-05-23', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(150, '115-2025', '', 224, NULL, 'Reparació mur, pèrgoles i proteccions pati', 0.00, 'N', 'Bon dia,\r\n\r\n- Volíem reparar el mur de la fotografia adjunta perquè la barrera que suporta corre perill de caure. A la reunió de dimarts passat ens varen dir que per petita que fos una reparació era necessari avisar. Hi ha cap pega?\r\n\r\n- Juntament amb l\'AFA, volíem comprar 3 pèrgoles de dimensions 5x4m, 3x3m i 3x3m. Ens podeu dir com ho podem fer correctament?\r\n\r\n- El professors d\'educació física ens han proposat comprar proteccions per als peus de les canastes de basquet (foto i pdf adjunts). A la reunió d\'equip directiu hem pensat que aquestes ja hi són des que es va fer l\'institut i que les degueren posar seguint la normativa, pel que podria ser que no fossin necessàries. Ens podríeu resoldre el dubte?\r\n\r\nGràcies per tot.', 813, 1, 1, '2025-05-23', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(151, '116-2025', '', 218, NULL, 'Aire condicionat de 2 aules modulars avariats', 0.00, 'N', 'Bon dia, dos aparells d\'aire acondicionas de les aules modulars prefabricades que tenim al nostre centre no funcionen. \r\nEns podríeu indicar com hem d\'actuar? Si enviau un tècnic) Si el cercam nosaltres????\r\nÉs un poc urgent perquè encara no fa molta calor i l\'ambient a partir de les 12h ja és molt calorós a dintre les aules.\r\nGràcies', 801, 14, 1, '2025-05-26', '0000-00-00', 1, NULL, NULL, NULL, ''),
(152, '117-2025', '', 49, NULL, 'Impermeabilització terrat', 0.00, 'N', 'Sóc na Joana Maria del CEPA Francesc de Borja Moll.\r\nVarem parlar per telèfon del tema de la impermeabilització  del terrat del nostre centre, però que està ubicat al CEP d\'Inca,  per la posterior instal·lació de les plaques solars, i ens vares dir que ens farieu la dotació econòmica pertinent.\r\nDimarts dia 20  varem fer el Consell Escolar i varem triar el pressupost de l\'empresa Impersa per  la quantia de 5441,85€.\r\nT\'adjunto còpia dels tres pressuposts perquè els puguis veure.\r\nNecessitam saber si ho podem tirar endavant i en poder ens fareu l\'ingrés dels diners o hem d\'esperar la vostra autorització?\r\nPer altra banda, en aquests moments, per part nostra podriem fer el pagament \r\nEn  aquests moments.....', 489, 13, 1, '2025-05-26', '0000-00-00', 1, NULL, NULL, NULL, ''),
(153, '118-2025', '', 72, NULL, 'Dubtes manteniment aparells i instal·lacions', 0.00, 'N', 'Bon dia, \r\n\r\nens posem en contacte amb vostès, arrel d\'una reunió mantinguda amb el vostre cap de servei i diferents secretaris/es de centres escolars. \r\n\r\nM\'encarreg una mica dels RRLL del meu centre, i la secretària m\'ha encomanat que em posi en contacte amb vostès, per a resoldre alguns dubtes. A veure si ens podeu ajudar:\r\n\r\nComençaré amb dos elements:\r\n\r\n- Les calderes. Tenim tres calderes antigues, a un sotorrani, sense sortida d\'emergència. Dum a terme un sol manteniment anual, hem de dur-lo trimestralment? necessitem dur un llibre de revisions? Com hem de procedir amb les calderes. Adjuntem fotos.\r\n\r\n- Els ventil·ladors.El 70% de les aules no disposa d\'aires acondicionats, i la manera que tenim és instal·lar ventil·ladors. Tenim previst comprar-ne més, peròo abans, voldriem saber si els tenim ben instal·lats, si es necessari un manteniment, normes de seguretat,... Adjuntem fotos.\r\n\r\nLo dit, si ens podeu donar una màs, o passar un contacte amb qui poder parlar d\'aquests temes..\r\n\r\nMoltes gràcies.', 772, 1, 1, '2025-05-27', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(154, '119-2025', '', 71, NULL, 'Consulta dubtes A/C espanyat aules prefabricades', 0.00, 'N', 'Bon dia,\r\nEls aires condicionats d\'una de les aules prefabricades han deixat de funcionar. Estam pendents del pressupost del tècnic, però pel que ha dit sembla que seran reparacions cares o s\'hauran de substituir.\r\nEn cas d\'haver-los de canviar o assumir una reparació costosa ens en feim càrrec els centres, l\'empresa arrendadora, vosaltres? \r\nSi els arreglam o substituim nosaltres hem d\'informar d\'alguna manera?\r\nSalutacions', 774, 14, 1, '2025-05-27', '0000-00-00', 1, NULL, NULL, NULL, ''),
(155, '120-2025', '', 78, NULL, 'Consulta menjador escolar', 0.00, 'N', 'Bon dia,\r\n\r\ndavant la possibilitat de tenir un menjador escolar,\r\n\r\nés possible tenir un espai per ubicar l\'officce (neveres, microones, estris...) i després dinar a una aula ordinària?\r\n\r\nGràcies.\r\n\r\nRosa Colomar', 769, 1, 1, '2025-05-27', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(156, '121-2025', '', 57, NULL, 'Sol·liciten la normativa referent a tendals', 0.00, 'N', 'Bon dia Helena,\r\nEl director del CEIP Can Raspalls està sol·licitant \"insistentment\" que se li instal·lin uns tendals al pati com més aviat millor perquè els nens no tinguin tanta calor, els dóna el sol directe i no té\r\nespai d\'ombres...\r\nEm podries enviar la normativa que han de tenir els tendals amb vista a que els pressupostos es\r\nfacin d\'acord amb les mesures establertes.\r\nMoltes gràcies.\r\n\r\nMontse Montserrat Ramón\r\nATD de la Direcció Territorial d\'Educació a Eivissa i Formentera\r\nCarrer Via Púnica 23, CP 07800 - Eivissa\r\nTel: 971176029 / Fax: 971176357\r\nExtensió: 63023', 274, 1, 1, '2025-05-27', '0000-00-00', NULL, 1, NULL, NULL, ''),
(157, '122-2025', '', 1, NULL, 'Sol·licitud d\'instal·lació d\'aire condicionat', 0.00, 'N', 'En relació a la climatització dels centres educatius, no se si estava prevista la climatització del nostre centre, però n\'estaríem interessades, ja que a les aules s\'arriba a altres temperatures que fa difícil la feina d\'infants i mestres.\r\nAtentament,\r\nLaura Galmés,\r\nSecretària.', 425, 1, 1, '2025-05-27', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(158, '123-2025', '', 230, NULL, 'Inspección y reparación del ascensor', 0.00, 'N', 'El ascensor del CEIP Guillem Frontera Pascual fue inspeccionado el 13/12/2024 y resultó desfavorable por defectos graves. El Ayuntamiento ha enviado la documentación a IBISEC, que enviará un técnico. Las reparaciones deben completarse antes del 13/06/2025. Se está haciendo seguimiento para asegurar su cumplimiento.\r\n\r\n    13/12/2024 – Inspección desfavorable\r\n    16/05/2025 – Informe de anomalías\r\n    20/05/2025 – Envío de documentación a IBISEC\r\n                 Visita técnica de IBISEC\r\n                 Reparaciones por el Ayuntamiento\r\n    13/06/2025 – Fecha límite para subsanar defectos\r\n                 Segunda inspección', 318, 2, 1, '2025-05-27', '0000-00-00', NULL, 2, NULL, NULL, ''),
(159, '124-2025', '', 229, NULL, 'Rehabilitació d\'un edifici annex a les instal·lacions principals del CEPA', 0.00, 'N', 'Resum de la petició per a intervenció al CEPA La Balanguera\r\n\r\nSeguint instruccions del Sr. Marco Alarcón, es sol·licita una valoració tècnica per a la rehabilitació d’un edifici annex al CEPA La Balanguera, conegut com l’antiga casa del conserge. L’edifici, d’uns 60 anys, presenta greus deficiències estructurals i de conservació, especialment:\r\n\r\n    Façana molt deteriorada: escales, baranes, persianes i portes de ferro en mal estat.\r\n    Tancaments i finestres: sense aïllament, amb vidres trencats que suposen un perill.\r\n    Banys antics: amb aixetes, portes i panys defectuosos.\r\n\r\nEs proposa una reforma integral o per etapes, i es demana la visita d’un tècnic per valorar l’estat i definir possibles intervencions. El centre està disposat a col·laborar econòmicament, però es necessita suport i assessorament per determinar l’abast i el repartiment de les feines.', 491, 1, 1, '2025-05-28', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(160, '125-2025', '', 21, NULL, 'Creació zona de jocs', 0.00, 'N', 'Atesa la consulta telefònica feta ahir, adjuntam el projecte del disseny de pati d\'infantil que hem elaborat per a la nostra escola. Som un centre de nova creació i el pati d\'educació infantil no té cap zona de joc. Cal millorar el paviment i afegir estructures de joc, diferenciades per espais que estimulin el desenvolupament infantil. \r\n\r\nNecessitaríem saber quina normativa han de cumplir les instal·lacions i si hi hauria possibilitat d\'una partida pressupostària per a la seva realització. \r\n\r\nA través d\'aquest enllaç podreu consultar el projecte. \r\n\r\nhttps://drive.google.com/file/d/1BYGnmwdyuOoIUiVSiVSZ0FZfgbLP5zt6/view?usp=sharing', 371, 1, 1, '2025-05-28', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(161, '126-2025', '', 13, NULL, 'Renovació banys', 0.00, 'N', 'Ens posam en contacte amb vosaltres per sol·licitar la renovació dels banys de l\'alumnat i professorat del primer pis. Aquests tenen 49 anys i ens donen molts de problemes. És una necessitat de centre', 443, 1, 1, '2025-05-30', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(162, '127-2025', '', 78, NULL, 'Sol·licitud informació estat de l\'ampliació del menjador', 0.00, 'N', 'Bon dia.\r\nDesprés de la visita de l´Ajuntament i la Conselleria, per veure les mancances d´infraestructures\r\ndel nostre centre, voldriem saber com queda el tema de l´ampliació del menjador per solventar\r\nla falta d´espai que patim i que de cada dia s´agreuja més, tal com vareu poder comprovar.\r\nQuedam a l´espera de la vostra contestació', 442, 1, 1, '2025-05-30', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(163, '128-2025', '', 72, NULL, 'OCA contra incendis, demanen un justificant que demostri l\'antiguitat dels edificis', 0.00, 'N', 'Bon dia,\r\n\r\nSoc na Sofia oliver coordinadora de riscos laborals i qualitat del centre. \r\n\r\nAquesta setmana vam passar L\'OCA Contra incendis i ens demanen un justificant (projecte, llicencia…) que demostri l\'antiguitat dels edificis.\r\n\r\n\r\nEns podríeu fer arribar alguna documentació que acrediti l\'antiguitat de les infraestructures de l\'IES Calvià. No disposa\'m de la documentació. \r\n\r\nGràcies', 775, 1, 1, '2025-06-02', '0000-00-00', NULL, 1, NULL, NULL, ''),
(164, '129-2025', '', 57, NULL, 'Envien fotos, esperen vist i plau', 0.00, 'N', 'informar-vos que volem posar una pérgola a la nostra escola d\'infantil, us passo unes fotos per que pugueu veure on la volem posar i com és aquesta pergola.\r\nEsper la vostra resposta.', 432, 1, 1, '2025-06-02', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(165, '130-2025', '', 224, NULL, 'Caiguda del mur perimetral. (Gener2025). Hi ha una altra part del mur també en mal estat.', 0.00, 'N', 'Bon dia,\r\navui ha vengut el tècnic d\'IBISEC i el constructor per reparar el mur perimetral que dóna a\r\nl\'autopista i ha pogut comprovar que hi ha una altra part del mur també en mal estat que\r\nés necessari actuar-hi. Dóna a un pàrquing públic i acostuma a estar ple.\r\nHem acordat que us en faria la incidència', 520, 1, 1, '2025-06-02', '0000-00-00', NULL, 1, NULL, NULL, ''),
(166, '131-2025', '', 224, NULL, 'Reiteració actuacions pendients i comunicació de més reparacions', 0.00, 'N', 'Infraestructures i reparacions pendents\r\n\r\n    Passadís d\'accés al pati d\'infantil\r\n        Estat: Encara no reparat des de la caiguda de l’arbre el 22 de desembre de 2024.\r\n        Impacte: Dificulta l’organització de les entrades i sortides d’infantil.\r\n\r\n    Reixa de ferro\r\n        Estat: Només es va canviar parcialment fa gairebé dos cursos.\r\n        Pendent: Canvi de la part que dona al pàrquing i al camp de futbol.\r\n        Novetat: El ferrer ha vingut recentment a fer pressupost per la reixa del fons del camp de futbet.\r\n\r\n    Pintura de la façana exterior\r\n        Estat: Iniciada al febrer/març de 2025.\r\n        Observació: Només hi ha un pintor treballant de manera molt lenta.\r\n        Dubte: No se sap si estarà acabada abans de setembre.\r\n\r\n    Espai reservat al pàrquing\r\n        Estat: Sol·licitat diverses vegades, però encara no assignat.\r\n\r\n    Pilons de protecció\r\n        Estat: Han estat arrabassats.\r\n        Necessitat: Cal reposar-los per garantir la seguretat.\r\n\r\n    Paret enfonsada al pàrquing\r\n        Estat: Incidència notificada.\r\n        Risc: Pot caure més trams, amb perill per a famílies i infants', 342, 1, 1, '2025-06-02', '0000-00-00', NULL, 1, NULL, NULL, ''),
(167, '132-2025', '', 65, NULL, 'Aprovació pressuposts, insonorització de dues aules de percussio', 0.00, 'N', 'El passat 10 d\'abril us vaig enviar aquest correu electrònic, referent a l\'aprobació \"PRESUPUESTO para el estudio de aislamiento y acondicionamiento acústico de las dos aulas de percusión del Conservatorio de Ibiza\", ens podeu donar alguna resposta. \r\n\r\nAprobación PRESUPUESTO para el estudio de aislamiento y acondicionamiento acústico de las dos aulas de percusión del Conservatorio de Ibiza.', 551, 1, 1, '2025-06-02', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(168, '133-2025', '', 62, NULL, 'Nou accés de vehicles', 0.00, 'N', '', 783, 1, 1, '2025-06-02', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(169, '134-2025', '', 17, NULL, 'Obres Menjador. Han sol·licitat info de l\'estat de la actuació.', 0.00, 'N', 'Hem contestat al centre demanant confirmació. (Veure @ adjunt)', 410, 1, 1, '2025-06-02', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(170, '135-2025', '', 9, NULL, 'Laboratori Escolar', 0.00, 'N', 'Bon dia,\r\n\r\nSom na Katia Taillefer, directora del CEIP Puig de Sant Martí (codi 07015653) i us escric per comunicar-vos que, de cara al curs 25/26, ens agradaria posar en marxa un laboratori escolar al nostre centre de primària.\r\n\r\nAdjuntam a aquest correu el projecte educatiu i el detall de les activitats que tenim previstes dur a terme, amb l’objectiu de promoure l’experimentació i el pensament científic entre l’alumnat.\r\n\r\nEns han informat que cal comptar amb el vostre vistiplau per poder habilitar aquest espai dins el centre. Volem destacar que no està previst fer servir cap element químic que pugui suposar un risc per a l’alumnat ni per al personal del centre. Es tracta d’activitats de manipulació segura i observació, completament adaptades a l’etapa d’educació primària.\r\n\r\nRestam a la vostra disposició per a qualsevol aclariment o informació addicional que pugueu necessitar', 387, 1, 1, '2025-06-02', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(171, '136-2025', '', 72, NULL, 'Consulta sobre l\'obertura d\'una cafeteria', 0.00, 'N', 'Som Nel Martí i, a partir de dia 1 de juliol, assumiré la direcció de l’IES Maria Àngels Cardona de Ciutadella. En aquest context, m’estic informant sobre diversos tràmits, entre els quals voldria fer-vos una consulta relativa a l’obertura d’una cafeteria al centre.\r\n\r\nAntecedents:\r\nActualment, al nostre institut, que imparteix ensenyaments de la família d’Hoteleria, hi ha una aula destinada al mòdul de cafeteria.\r\nSegons la planificació prevista, durant el curs 2025-2026 aquesta família professional es traslladarà a un nou edifici (l’antiga Estació Marítima de Ciutadella), per constituir-se com a centre integrat d’Hoteleria. En conseqüència, l’IES quedarà sense servei de cafeteria.\r\n\r\nVoluntat del centre:\r\nObrir, a partir de setembre de 2026, una cafeteria a l’IES, reutilitzant i adaptant l’aula que actualment acull el mòdul de cafeteria.\r\n\r\nQüestions a resoldre:\r\n\r\n    En quin moment s’hauria de presentar la sol·licitud per posar en marxa aquest servei? Cal fer-ho durant el curs 2025-2026?\r\n\r\n    Quin és el procediment o tràmit administratiu que cal seguir?\r\n\r\n    L’espai que es vol habilitar requereix alguna adequació específica per poder funcionar com a cafeteria? Qui n’ha de fer la valoració?\r\n\r\nAgrairé molt qualsevol orientació o informació que em pugueu oferir al respecte.', 805, 1, 1, '2025-06-02', '0000-00-00', NULL, 1, NULL, NULL, ''),
(172, '137-2025', '', 21, NULL, 'Estructura de jocs, necessiten autorització escrita de l\'IBISEC', 0.00, 'N', 'Bon dia, \r\nal CEIP Sa marina de Llucmajor necessitem, a la zona de terra del pati, llevar una porció de terra per substituir-la per arena i col·locar una estructura de joc que ens estan construint. Des de l\'Ajuntament han donat el vist i plau a l\'estructura i s\'ofereixen per llevar la terra i posar l\'arena però necessiten autorització escrita de l\'IBISEC per fer-ho, per això demanam si mos podeu enviar aquesta autorització.  Adjuntam fitxa tècnica de l\'estructura, plànol on s\'ha de situar i croquis de la part de terra que s\'ha de llevar.\r\nEsperam resposta, moltes gràcies', 416, 3, 1, '2025-06-02', '0000-00-00', 1, NULL, NULL, NULL, ''),
(173, '138-2025', '', 224, NULL, 'Múltipes peticions', 0.00, 'N', 'RESUM:\r\n  Deficiències comunicades prèviament (desembre 2024):\r\n\r\n    Instal·lacions de mecànica\r\n    Persianes del mòdul d’hoteleria\r\n    Asfaltatge de l’aparcament\r\n    Persianes de les aules d’administració\r\n    Paret perimetral exterior (zona sud)\r\n\r\n     Estat: Tota la documentació i pressupostos es van enviar el dia 8 de gener de 2025.\r\n     Actuacions realitzades: Cap.\r\n     Risc: L’estat de la paret sud és crític, amb risc d’esfondrament i problemes de seguretat (robatoris i desperfectes).\r\n\r\n Noves deficiències afegides:\r\n\r\n    Sostre de la porxada del claustre gran\r\n        Reparat parcialment el curs 2021-2022.\r\n        Pendent: revisió del cablejat elèctric (cables penjants).\r\n        Actualment: nous desperfectes i despreniments perillosos.\r\n\r\n    Tanca lateral del passadís exterior\r\n        Està tombant.\r\n        Cal una base de ciment per fixar-la adequadament.\r\n\r\n    Persianes de les aules 1 a 15 (zona antiga, primera planta)\r\n        Molt deteriorades.\r\n        Algunes s’han hagut de retirar o no es poden obrir pel risc de caiguda.\r\n\r\n Proposta addicional:\r\n\r\n    Cessió de la parcel·la municipal contigua (zona sud) per reubicar-hi la parada dels autobusos escolars, que actualment es troba a la vorera de la carretera.', 805, 1, 1, '2025-06-02', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(174, '139-2025', '', 224, NULL, 'Caldera i Escala d\'Emergència', 0.00, 'N', 'Bon dia Marco,\r\nEl passat 13 de gener, la directora del CEIP Joan Veny i Clar també va informar que l\'escala\r\nd\'emergència del centre, de perfils metàl·lics. Degut al seu estat de conservació, el centre no utilitza\r\nl\'escala. Adjunt les fotografies que ens han enviat per justificar la demanda.\r\nAprofitant que a l\'IBISEC teniu una actuació oberta per substituir la caldera de l\'edifici de primària,\r\npodeu revisar l\'estat d\'aquesta escala i valorar les actuacions que s\'han de fer perquè torni a estar\r\noperativa?\r\n09/06/2025: Estam a l\'espera de que des d\'IBISEC (na Cati) ens digui si revisaran ells l\'escala o correspon a l\'Ajuntament. Hem de contestar al centre.', 329, 1, 1, '2025-06-02', '0000-00-00', NULL, 1, NULL, NULL, ''),
(175, '140-2025', '', 20, NULL, 'Nou menjador', 0.00, 'N', '', 365, 1, 1, '2025-06-04', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(176, '141-2025', '', 224, NULL, 'Ampliació zona enjardinada. Transformació dels banys pis superior en aules. Piques d\'aigua', 0.00, 'N', '1. Ampliació de la zona enjardinada del centre per als estudis d’FP agrària.\r\nEn el document Plànol general de l’IES Baltasar Porcel, indiquem dues modificacions de la zona enjardinada del centre:\r\n\r\n    Anivellar la zona situada al costat de les pistes, la qual cosa implicarà apujar una paret.\r\n    Ampliar en uns 2-3 metres la segona zona enjardinada. Aquesta actuació implica reduir la zona d’aparcament del centre, que, d’altra banda, no s’utilitza des de la pandèmia.\r\n\r\n2. Transformació dels banys del pis superior en aules.\r\nEn el plànol DC070404_PLANO P1 del primer pis de l’edifici, hem marcat els banys que tenim tancats des de fa uns anys i que voldríem transformar en aules.\r\n\r\n3. Instal·lació de piques d’aigua a l’aula de Cures Auxiliars d’Infermeria.\r\nL’última modificació que volem fer és dur a terme les obres d’instal·lació de piques a l’aula d’Auxiliar d’Infermeria, de manera que quedaria completament equipada.\r\n\r\nDes del centre, agrairíem que tinguéssiu en compte la nostra sol·licitud, ja que considerem aquestes reformes essencials per millorar la qualitat dels estudis de Formació Professional al nostre centre.', 770, 1, 1, '2025-06-04', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(177, '142-2025', '', 229, NULL, 'Actuacions necessàries per garantir la seguretat i la salubritat de l’edificació actual, mentre no s\'executa el nou centre.', 0.00, 'N', 'D’acord amb el Pla d’Infraestructures, es preveu la construcció d’un nou edifici per al CIFP Nauticopesquera. Aquest nou equipament, que mantindrà l’actual oferta formativa, s’ubicarà al Moll Vell de Palma i es preveu executar-lo a mig termini.\r\nTanmateix, l’edifici actual presenta greus deficiències que s’han anat subsanant temporalment mentre no es duu a terme la nova infraestructura. L’antiguitat de l’edifici i la seva exposició constant als agents marins han provocat un deteriorament accelerat, especialment a les façanes, que es troben en un estat molt deficitari, amb pèrdues de morter que deixen a la vista el mur de fàbrica.\r\nPer tot això, us sol·licit la tramitació de l’inici de les actuacions necessàries per garantir la seguretat i la salubritat de l’edificació actual, mentre no s\'executa el nou centre.', 522, 1, 1, '2025-06-05', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(178, '143-2025', '', 224, NULL, 'Mur de tancament en perill de caiguda', 0.00, 'N', 'El mur de marès que delimita el pati de l’escoleta del CEIP S’Algar presenta un desplaçament cap a la via pública, amb esquerdes i fissures visibles.\r\n    El mur es troba al passatge de vianants entre els números 26 i 28 del carrer Sant Bartomeu, a S’Arenal (Llucmajor).\r\n    Els tècnics municipals han constatat el perill imminent de caiguda, motiu pel qual s’ha tancat l’accés al pati d’infantil i precintat la zona afectada.\r\n\r\nMesures adoptades:\r\n\r\n    S’ha emès un decret municipal (núm. 2025002033) el 5 de juny de 2025, ordenant:\r\n        Iniciar un expedient d’ordre d’execució a l’IBISEC.\r\n        Requerir a l’IBISEC que dugui a terme obres d’urgència per garantir la seguretat.\r\n        Autoritzar el tancament de la via pública i altres mesures preventives.\r\n        Advertir que, en cas d’incompliment, es podrien aplicar mesures d’execució forçosa, com execució subsidiària o multes coercitives.\r\n        Traslladar l’ordre al servei d’inspecció per fer-ne seguiment.', 399, 1, 1, '2025-06-06', '0000-00-00', NULL, 1, NULL, NULL, ''),
(179, '144-2025', '', 57, NULL, 'Espais d\'ombra. Sol·licitud d\'autorització per l\'instal·lació', 0.00, 'N', 'Ens sol·liciten: \r\n\r\nRevisar la documentació tècnica presentada.\r\nConfirmar si el projecte es pot autoritzar.\r\nInformar l’Ajuntament de Palma sobre l’estat de l’expedient.\r\n\r\n\r\n\r\nResum cronològic del projecte d\'ombra al CEIP Aina Moll\r\n\r\n    Octubre 2024\r\n        L\'AFA del CEIP Aina Moll presenta una proposta per instal·lar una pèrgola al pati.\r\n        Sol·liciten informació sobre permisos i requisits.\r\n\r\n    Octubre 2024 (resposta de la Conselleria)\r\n        S\'indica que manca documentació tècnica (ubicació exacta, fotos, etc.).\r\n        S?aclareix que l?AFA no pot ser promotor d?obres; ha de ser el propi centre.\r\n        S\'esmenta que l\'estructura ha de complir normativa i que podria afectar obres recents.\r\n\r\n    Maig 2024\r\n        Es redacta l‟avantprojecte tècnic amb un pressupost de 3.600€.\r\n\r\n    Juny 2025\r\n        L\'Ajuntament de Palma sol·licita informació sobre si el projecte va ser aprovat.\r\n        IBISEC reenvia la consulta a Infraestructures Educatives per a la seva valoració.', 252, 1, 1, '2025-06-09', '0000-00-00', NULL, 1, NULL, NULL, ''),
(180, '145-2025', '', 8, NULL, 'Adequació encabir dues aules addicionals', 0.00, 'N', 'Enviat @ a la directora sol·licitant fotografies, per a la redacció de la proposta de l’adequació de dues aules addicionals a l’edifici annex al centre.', 468, 1, 1, '2025-06-11', '0000-00-00', NULL, NULL, NULL, 1, ''),
(181, '146-2025', '', 1, NULL, 'Demanen informació per gestionar la compra d\'aires condicionats per les aules', 0.00, 'N', 'Vos escrivim per demanar informació i, en el cas que sigui possible, gestionar la compra d\'aires condicionats per les aules.\r\n\r\nAquesta sol·licitud ve donada també per part d\'una demanda enregistrada pel l\'AFA del centre, com a ordre del dia de la reunió.\r\n\r\nEntre ed. infantil i primària som un total de 24 unitats. Si bé és cert que l\'edifici d\'infantil és més nou, el de primària és molt més vell i no tenim cap tipus d\'aparell que pugui ajudar a refrescar les aules.\r\nLa nostra orografia (al Puig de Sa Font) suposa que estiguem a una zona elevada i, a tota una cara de l\'edifici, ens pega el sol directe durant un grapat d\'hores, i es fa insostenible poder romandre-hi, tot obrint les finestres perquè passi oratge, o tancant les persianes; més ara que comença a fer calor més intensa. \r\n\r\nEsperem ho pogueu tenir en consideració i ens pogueu donar una resposta.\r\n\r\nPer a qualsevol dubte o aclariment, em podeu escriure a aquest correu o al telèfon 608041833  -    971567186', 322, 1, 1, '2025-06-11', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(182, '147-2025', '', 1, NULL, 'Climatització. Volen saber en quina situació es troba ja que el curs passat es varen realitzar visitas per part dels tècnics', 0.00, 'N', 'Escric aquest email per demandar en quina situació es troba el CEE\r\npel que fa a la seva climatització.\r\nEl curs 2023/2024 en la inauguració del curs escolar les autoritats\r\nassistents van poder percebre de primera ma la l\'excessiva\r\ntemperatura que tenia el centre.\r\nArrel d\'això i amb compromís per part de les autoritats competents,\r\nel nostre centre apareixia com un dels preferents per a la\r\nclimatització .\r\nVan iniciar-se una sèrie de visites per part de diferents tècnics que\r\nvan venir a veure el centre.\r\nDesprés tot el tema de climatització va passar a mans de la UIB i es\r\nvàren instal.lar sensors a diferents llocs del nostre centre.Un dia van\r\nvenir a recollir-los sense comunicar-nos res més.\r\nNo hem tornat a tenir notícies d\'aquest tema.', 165, 1, 1, '2025-06-11', '0000-00-00', NULL, 1, NULL, NULL, ''),
(183, '148-2025', '', 61, NULL, 'Renovació del paviment al pati. Va quedar sense resposta.', 0.00, 'N', 'SOL.LICITO URGENTMENT , QUÈ ES CANVII EL TRISPOL DEL PATI PER UN\r\nPAVIMENT NOU I ADEQUAT PER A PATIS ESCOLARS.\r\nInformar que:\r\n• Aquesta sol.licitd es va realitzant des de fa més de 10 anys\r\n• El paviment actual té més de 20 anys\r\n• Contínuament hi ha accidents escolars en el pati, degut al mal estat del\r\npaviment\r\n• Des del Consell escolar, s\'ha acordat sol.licitar aquesta reforma al llarg de\r\ndiversos cursos escolars, i així s\'ha fet saber.\r\n• L\'IBAVI n\'està informat a través de diverses visites que ha anat fent al\r\ncentre i coneix les necessitats\r\n• A la visita que ens va fer el Conseller en el mes de juliol del curs passat, li\r\nvarem informar, que a nivell d\'infraestructures, aquesta era l\'urgència i la\r\nnostra prioritat\r\n• Les famílies, des de varis sectors, estan molt preocupades pel perill físic que\r\naixò comporta pels seus fills/es.\r\nEnvio una foto al respecte ( no em deixa enviar més)\r\nEsper la vostra resposta\r\nAtentament\r\nAina Maria Picó Mestre\r\nDirectora del Ceip Jafudà Cresque', 321, 1, 1, '2025-06-11', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(184, '149-2025', '', 223, NULL, 'Volen suprimir un des dos lavamans al bany de mestres', 0.00, 'N', 'De manera adjunta teniu la foto de l\'únic bany de mestres. La nostra escola és força antiga i els nostres espais són molt limitats, és per això, que volíem llevar un dels renta mans del bany que en la imatge surt amb un cercle groc.\r\nSi el llevéssim guanyaríem en netedat i higiene, també podríem col·locar la farmaciola, el material d\'higiene personal i les sabates de mestres (ja que anem amb crocs) de manera ordenada i amplia. La dona que fa net, té les coses en el bany i tot queda molt atapeït.\r\nQuan hem mirat per llevar el lavabo de l\'esquerra hem vist que té el desaigüe de l\'aire acondicionat. Podria anar la canonada al de la dreta? Qui ho hauria de fer?', 402, 1, 1, '2025-06-12', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(185, '150-2025', '', 229, NULL, 'Ampliació del centre - Rebuts plànols per donar vistiplau', 0.00, 'N', '@ d\'IBISEC amb plànols, rebuts del Consell d\'Eivissa, d\'una futura ampliació del CIPF, perquè des del servei es doni el vistiplau perquè comencin amb l\'avantprojecte.\r\nS\'encarrega el Consell d\'Eivissa de l\'ampliació.', 516, 1, 1, '2025-06-12', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(186, '151-2025', '', 8, NULL, 'Construcció d\'un gimnàs', 0.00, 'N', '', 328, 1, 1, '2025-06-12', '0000-00-00', NULL, 1, NULL, NULL, ''),
(187, '152-2025', '', 20, NULL, 'Des del servei de menjadors sol·liciten la viavilidad d\'espais', 0.00, 'N', 'us tramet, els espais que han triat des de l\'equip directiu del CEIP Urbanitzacions per ubicar provisionalment, la cuina en modalitat de càtering, fins que estigui acabat el procés de reducció d\'espai que ha impossibilitat emprar la cuina in-situ que fins ara tenien. Desconeixem si els espais triats per ells, son viables per ser tenguts en compte com a espais viables alhora de projectar momentàniament la cuina càtering. Quedam pendents de la vostra resposta. ', 459, 1, 1, '2025-06-16', '0000-00-00', NULL, NULL, NULL, NULL, '');
INSERT INTO `actuacions` (`id`, `codi`, `codi_extern`, `subtipus_id`, `origen`, `descripcio`, `pressupost`, `assumit_servei`, `observacions`, `centre_id`, `estat_id`, `prioritat_id`, `data_entrada`, `data_enviament`, `tecnic_id`, `origen_id`, `desti_id`, `mode_enviament_id`, `url_ibisec`) VALUES
(188, '153-2025', '', 224, NULL, 'Vàries Actuacions. Aula modular sostenible, climatització (han sol·licitat espedient de despesa), Instal·lació Fotovoltaica.', 0.00, 'N', 'Des del CIFP Pere de Son Gall, ens dirigim a vosaltres per tal de fer seguiment i sol·licitar una resposta clara en relació amb diferents propostes presentades al llarg dels darrers mesos, vinculades a projectes d\'eficiència energètica, sostenibilitat i innovació educativa, alineats amb els objectius estratègics de la Formació Professional a les Illes Balears.\r\n\r\n1. Aula modular sostenible.\r\nEs tracta d\'un prototip d’aula autosuficient energèticament, construïda amb criteris eco-passius i participació activa de l’alumnat i empreses col·laboradores.\r\nEstat actual: Sense resposta per part de la Conselleria.\r\nSol·licitud: Confirmació de suport econòmic necessari per a la seva execució (pressupost màxim de 40.000 € + IVA per a la construcció; instal·lacions realitzades per l’alumnat com a part del projecte formatiu).\r\n\r\n2. Climatització de la planta pis de l’edifici E\r\nProposta d’instal·lació amb bomba de calor per substituir el sistema actual de calefacció amb caldera de gasoil. Durant aquest curs 2024-25, l\'alumnat dels cicles de climatització i electricitat ha dut a terme la instal·lació hidràulica i el muntatge dels fan-coils. Resta pendent la compra del material necessari per completar la instal·lació.\r\nEstat actual: La Direcció General d\'FP ha indicat que no pot assumir el cost dels materials uns 15000 € com a màxim.\r\nSol·licitud: Possibilitat que el Servei d’Infraestructures assumeixi el cost del material pendent, atès l’impacte en eficiència energètica i l’enfocament formatiu.\r\n\r\n3. Instal·lació fotovoltaica compartida i comunitat energètica\r\nProposta de generar una comunitat energètica vinculada al centre, amb participació de l\'alumnat i possible compartició d’energia amb la comunitat local. L\'Institut Balear de l\'Energia assumeix el cost de la instal·lació i la tramitació administrativa.\r\nEstat actual: Denegada per l’IBISEC per la previsió d\'una reforma futura a llarg termini.\r\nSol·licitud: Avaluació de la viabilitat d\'una solució provisional que no comprometi futures reformes (instal·lació amb contrapès sense perforació) i permet avançar en la transició energètica.\r\n\r\nCom a centre compromès amb la innovació i la sostenibilitat, creim que aquestes iniciatives no només contribueixen a una millor eficiència energètica i formació de l’alumnat, sinó que poden servir de model per a altres centres educatius. Per això, sol·licitam poder disposar d\'un posicionament clar i coordinat per part del Servei d\'Infraestructures i la Conselleria en relació amb aquestes propostes.\r\n\r\nRestam a la vostra disposició per ampliar qualsevol informació tècnica o pressupostària que sigui necessària.', 524, 1, 1, '2025-06-16', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(189, '154-2025', '', 18, NULL, 'Compra rentaplats addicional', 0.00, 'N', 'Pel que fa a la compra del nou rentaplats addicional, es podria finançar el nou equipament per part del Servei d\'Infraestructures (en còpia). Analitzat l\'ECOIB i l\'historial de saldos i romanent, el vostre centre té saldo i romanent suficient per poder anticipar la despesa des del centre.\r\n\r\nPel que fa a la tramitació de la compra del nou rentaplats:\r\n\r\nSi l\'import de l\'actuació es inferior a 6.000€ (iva exclòs) no farà falta tramitar l\'expedient de despesa. Heu de tenir 3 pressuposts comparables i haver aprovat la despesa per consell escolar.\r\nPer actuacions de més de 6.000€ (iva exclòs) heu de tenir 3 pressuposts comparables, aprovar la despesa\r\nper consell escolar i tramitar l\'Expedient de Despesa.\r\n◦ Important no iniciar les actuacions fins que no es té l\'Expedient de Despesa favorable.\r\n◦ L\'enllaç és el següent: https://www.caib.es/seucaib/ca/202/administracions/tramites/tramite/5430798\r\n◦ Us recomanem enviar al Servei d\'Infraestructures Educatives els pressuposts abans de tramitar l\'Expedient de Despesa, així\r\npodrem revisar-los i agilitzar el procés.\r\n\r\nPel que fa a la petició d\'una dotació addicional, el passat curs se va enviar una ajuda al 4t pagament i es valorarà incloure una ajuda addicional aquest any 2025 atesa la despesa de 6.800€ justificada, però també en funció de la disponibilitat pressupostària global i necessitats de la totalitat de centres. El vostre centre disposa com hem dit d\'un romanent molt elevat al llarg dels anys i que es pot destinar també a aquestes millores.\r\nDins el pressupost de funcionament de 2025 s\'ha tengut en compte el fet que teniu nou menjador i destinat ja per tant un major import per aquest concepte.', 346, 1, 1, '2025-06-16', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(190, '155-2025', '', 224, NULL, 'Necessitats millores', 0.00, 'N', 'Adjunto escrit actualitzat , acompanyat de fotografies de l´estat instal.lacions referents a les obres i millores necessàries en el CEIP \"Santa Eulària\"\r\n\r\nQuedo a la seva disposició per a qualsevol dubte i/o aclariment', 431, 1, 1, '2025-06-16', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(191, '156-2025', '', 224, NULL, 'Banys, reforma pati...', 0.00, 'N', 'Bon dia,\r\nHem sol.licitat:\r\n- Renovació dels banys del centre.\r\n- Actualització del pla d\'autoprotecció.\r\n- Parets del gimnàs.\r\n- Ascensor.\r\n- Remodelació del pati.\r\n\r\nEn resposta al vostre correu, us faig arribar les següents consideracions:\r\n\r\n    Unificació dels banys.\r\n        El pressupost de l\'empresa FIBE-2002 no es pot comparar amb als pressupostos de les altres dues empreses, perquè inclou dues portes metàl·liques en lloc de dues portes de fusta. També especifica que subministrareu les rajoles de gres des del centre.\r\n        En els altres dos pressupostos no es fa referència a aquesta qüestió, per la qual cosa s\'entén que l\'empresa constructora subministrarà les rajoles, però cal verificar-ho abans de començar l\'actuació.\r\n        D\'acord amb la Llei de Contractes del Sector Públic, s\'hauria d\'optar pel pressupost més econòmic, que és el de l\'empresa Toni Puigserver. \r\n        També segons aquesta mateixa llei, en la contractació pública no es poden fer pagaments per avançat, només es poden pagar les partides una vegada s\'han executat.\r\n        El Consell Escolar ha d\'aprovar la despesa.\r\n        Quant a la dotació de fons per fer l\'actuació, si disposau de romanent de centre podeu iniciar l\'actuació. Des del Servei d\'Infraestructures educatives us trametrem un enviament addicional de doblers, que pot tardar uns mesos en arribar.\r\n    Pla d\'autoprotecció. En el vostre correu indiqueu que heu demanat pressupost per redactar el pla d\'autoprotecció del centre i que costa 3.000 euros. Prenent com a referència els pressupostos que hem rebut d\'altres centres similars, segurament podeu trobar altres opcions més econòmiques. Aprofit per recordar que l\'empresa encarregada de redactar el pla també l\'ha de registrar a la Direcció General d\'Emergències i Interior.', 282, 2, 1, '2025-06-17', '0000-00-00', 2, NULL, NULL, NULL, ''),
(192, '157-2025', '', 1, NULL, 'Instal.lació  d’aparells de climatització', 0.00, 'N', 'Sol.licitam l’actuació de la Conselleria d’Educació, amb la instal.lació \r\nd’aparells de climatització', 334, 1, 1, '2025-06-18', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(193, '158-2025', '', 57, NULL, 'Projecte d\'instal·lació de tendal', 0.00, 'N', 'En relación al proyecto de instalación del toldo en el patio desde esta dirección se solicita contactar , de forma urgente, con el técnico encargado de la intervención para tratar la situación y la ubicación de forma urgente después de las  recientes intervenciones en el patio por parte del AFA)\r\nEn espera de su respuesta.', 467, 1, 1, '2025-06-18', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(194, '159-2025', '', 4, NULL, 'Varis. Climatització, finestres, ombres, electricitat', 0.00, 'N', 'Sistema de refrigeración para aulas y comedor.\r\n    Refuerzo de la red eléctrica para poder instalar ventiladores.\r\n    Instalación de sombras en el patio.\r\n    Sustitución de ventanas por otras más eficientes.', 390, 1, 1, '2025-06-18', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(195, '160-2025', '', 18, NULL, 'Sol·liciten la reparació del rentavaixelles', 0.00, 'N', 'Bon dia, des del Ceip Talaiot vos informam que el renta vaixelles que tenim a l\'escola pel menjador escolar està embossat i no fa net. Necessitam urgent que venguin a arreglar-ho.\r\nEsperam la seva resposta el més aviat possible.', 455, 1, 1, '2025-06-18', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(196, '161-2025', '', 1, NULL, 'Sol·licitud climatització', 0.00, 'N', 'quins tràmits hem de fer per instal·lar climatització al nostre centre, tot i que la despesa l\'assumim des del centre.\r\n\r\nM\'agradaria saber quins tràmits he de seguir per dur aquesta instal·lació endavant.', 279, 1, 1, '2025-06-18', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(197, '162-2025', '', 218, NULL, 'Després del canvi d\'aparells de climatització molts dels fancoils han deixat de funcionar', 0.00, 'N', 'Som en Joan Ramon Mateu, director del centre\r\n\r\nCom ja sabeu, fa poc es va dur a terme una intervenció al nostre centre per al canvi de la bomba de fred i calor. La instal·lació aparentment es va realitzar sense cap incidència, però actualment ens trobem amb un problema important: molts dels fan-coils que anteriorment funcionaven, ara no ho fan.\r\n\r\nEns agradaria saber si aquesta incidència es deu a algun problema derivat de la nova instal·lació, o bé si es tracta d’un mal funcionament dels aparells, tenint en compte que van ser instal·lats l’any 2006 i ja poden estar al final de la seva vida útil.\r\n\r\nEns agradaria que us poséssiu en contacte amb nosaltres el més aviat possible, amb l’objectiu de poder solucionar aquest problema durant l’estiu i garantir que l’inici del curs al setembre es pugui fer en condicions adequades.\r\n\r\nActualment, gairebé tres quartes parts dels aparells no funcionen, fet que ens preocupa molt de cara al curs vinent.\r\n\r\nAgraïm per endavant la vostra col·laboració i esperem la vostra resposta amb urgència.\r\n\r\nAtentament,', 355, 1, 1, '2025-06-18', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(198, '163-2025', '', 229, NULL, 'Ampliació escola, envien projecte pel seu vist i plau.', 0.00, 'N', 'Tal i com vam quedar en la seva visita a la nostra escola durant el curs, els enviem el projecte de la que serà l\'ampliació de la nostra escola abans de donar tots els passos corresponents pel seu vist i plau.', 54, 1, 1, '2025-06-18', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(199, '164-2025', '', 72, NULL, 'Reclamació per accident de Álvaro Manuel Torres Villén', 0.00, 'N', '', 522, 11, 1, '2025-06-18', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(200, '165-2025', '', 229, NULL, 'Obres conservatori Maó', 0.00, 'N', '', 553, 1, 1, '2025-06-18', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(201, '166-2025', '', 218, NULL, 'Reparació en l\'antiga instal·lació d\'aire condicionat', 0.00, 'N', 'Bon dia,\r\nTal i com vam parlar amb en Jaume Grimalt Fusté, enginyer industrial de l\'IBISEC a la visita d\'obra del dimecres 11-06-25, us adjuntam fotos per veure la possibilitat de millorar l\'estat de la maquinària que s\'ha modificat en part per poder tenir aire acondicionat al nostre centre. En principi, caldrà substituir el del mig ja que té un forat enorme i per tant, tenim una fase absolutament aturada en tot moment. Si fos possible, voldríem també millorar l\'estat dels altres dos ja que en poc temps els passarà el mateix.\r\nSalutacions cordials i esperem la vostra resposta.\r\nXavi Vañó\r\nDirector IES La Ribera', 799, 1, 1, '2025-06-19', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(202, '167-2025', '', 54, NULL, 'Crulls a la façana, zona precintada, afecta a una sortida d\'emergència, sol·liciten valoració d\'un tècnic', 0.00, 'N', 'Bon dia,\r\nSom en Toni Tornero, director de l\'IES Son Pacs. Inform que tenim una zona de l\'edifici en què hi ha uns crulls que ens preocupen perquè podrien esdevenir perillosos. Ara he precintat aquesta zona, però convé saber que també això afecta una sortida d\'emergència en cas d\'evacuació del centre,\r\nPer això, sol·licit la valoració urgent d\'un tècnic  per poder actuar en conseqüència.\r\nAtentament,', 832, 1, 1, '2025-06-20', '0000-00-00', NULL, 1, NULL, NULL, ''),
(203, '168-2025', '', 72, NULL, 'Consulta Gual parking', 0.00, 'N', 'Des de l\'IES Antoni Maura fa temps que intentem demanar un VADO per a la porta del pàrquing. Abans no teníem la necessitat de demanar-lo, ja que al barri en què estem hi havia descampats, però ara hi ha molts edificis de nova construcció i cada vegada més veïns. Des de l\'Ajuntament ens han dit que hem de comptar amb un arquitecte o enginyer tècnic que elabori un expedient d\'activitats del centre, on figuri l\'espai del pàrquing i el seu ús. Actualment, no disposem d\'aquest document i no l\'hem trobat ni tan sols al Ministeri d\'Educació a Madrid.\r\n\r\nEns podeu assessorar sobre què podem fer? Hi ha algun arquitecte o enginyer a la Conselleria que pugui elaborar aquest document? Tal vegada, com que és un centre antic, té una altra normativa? Té la Conselleria aquest document d\'expedient d\'activitats?', 767, 1, 1, '2025-06-23', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(204, '169-2025', '', 54, NULL, 'Esquerdes pins', 0.00, 'N', 'Us adjuntam imatges de les esquerdes causades per les arrels del pi central del pati, que també han afectat mur separatiu amb pistes esportives (pateix esquerdes i també s\'ha començat a \"doblegar\").', 795, 1, 1, '2025-06-23', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(205, '170-2025', '', 14, NULL, 'Adequació bany adaptat. (Informe emes pel servei d\'Atenció a la Diversitat).', 0.00, 'N', 'Informe de necessitats per a l’adequació d’un bany adaptat CEIP Cas Capiscol\r\n(07013127)\r\nAntecedents\r\n\r\nL’alumna TCM, actualment escolaritzada a 3r de primària, al CEIP Cas \r\nCapiscol, presenta necessitats educatives especials associades a una \r\ndiscapacitat motriu greu (tetraplegia espàstica-distònica amb luxació de \r\nmaluc) i discapacitat intel·lectual mitjana.\r\n3. Aquesta condició fa imprescindible l’ús de múltiples productes de suport (com \r\ncadira de rodes, bipedestador, etc.) i requereix assistència contínua per part \r\nde l’Auxiliar Tècnica Educativa (ATE) per a la higiene, transferències i activitats \r\nescolars funcionals.\r\n\r\nL’augment de talla i pes de l’alumna fa que les manipulacions siguin cada \r\nvegada més complexes, incrementant el risc de lesions tant per a ella com per \r\na la professional ATE. Per aquest motiu el centre actualment disposa d’una \r\ngrua de transferència així com d’una llitera pediàtrica, que des del Servei \r\nd’inclusió per a la comunitat educativa (SICE) hem aportat però les \r\ninstal·lacions actuals no permet l’ús segur d’aquests dispositius ni l’atenció \r\nadequada a l’alumna per fer les transferències amb seguretat ni per garantir \r\nla higiene de l’alumna amb la intimitat que requereix', 275, 1, 3, '2025-05-26', '0000-00-00', NULL, 3, NULL, NULL, ''),
(206, '171-2025', '', 220, NULL, 'Al gimnàs i al menjador', 0.00, 'N', 'Climatització de l’edifici\r\n\r\n    Problema: Temperatures molt altes a les aules i espais comuns degut a les parets de vidre orientades al sud.\r\n    Solució proposada: Instal·lació de persianes al gimnàs i una pèrgola al menjador.\r\n    Estat: S\'han enviat pressupostos però no s\'ha rebut resposta.', 275, 1, 1, '2025-06-23', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(207, '172-2025', '', 218, NULL, 'Fancoils espatllats i presentacio d\'un pressupost.', 0.00, 'N', 'Bon dia.\r\n\r\nTenim fancoils espatllats al CEIP Es Fossaret, hem sol.licitat tres pressupostos diferents. Només ens ha arribat el que adjuntam en aquest correu, els altres dos pressupostos no ens arriben.\r\n\r\nDegut a la urgència de la situació i la necessitat de tenir tot el sistema de calefacció-refrigeració arreglat abans que comenci el nou curs escolar pregam s\'atengui si és possible.', 292, 1, 1, '2025-06-25', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(208, '173-2025', '', 52, NULL, 'Presentacio de pressupost.', 0.00, 'N', 'Darrera comunicació: \r\n\r\nBon dia,\r\nper a indicacions del Sr. Marco A. Alarcón Zamora, Gerent de l\'IBISEC, i després de mantenir conversa amb el Sr. Antoni Morro, cap de Servei d\'Infraestructures Educatives, us retornem la sol·licitud a efectes  que ho tramiteu des del vostre Servei utilitzant el nou programa implantat.\r\n\r\n\r\nContext i necessitat\r\n\r\n    L’Institut Balear de l’Energia (IBE) té previst instal·lar plaques fotovoltaiques a la coberta de l’ala A (la més llarga de l’edifici).\r\n    Abans de la instal·lació, cal impermeabilitzar la coberta, ja que s’han detectat filtracions d’aigua a aules del tercer pis per deteriorament de la làmina impermeable.\r\n\r\nProcés seguit\r\n\r\n    El centre ha remès plànols en format AutoCAD i mesures aproximades de la terrassa.\r\n    L’empresa Capellet Impermeabilizaciones ha visitat el centre i ha elaborat un pressupost de 66.000 €.\r\n    L’empresa indica que, si s’accepta l’oferta, es farà una mesura exacta in situ abans de començar.\r\n\r\nTramitació administrativa\r\n\r\n    El pressupost supera el límit d’un contracte menor, per tant, caldrà licitar l’obra.\r\n    El Servei d’Infraestructures Educatives sol·licita l’inici de les actuacions per substituir la làmina impermeable i, si és possible, afegir aïllament tèrmic per millorar l’eficiència energètica.\r\n\r\nResposta de l’IBISEC\r\n\r\n    El gerent Marco A. Alarcón Zamora, en coordinació amb Antoni Morro, indica que la tramitació s’ha de fer des del Servei d’Infraestructures Educatives mitjançant el nou programa implantat.', 795, 1, 1, '2025-06-25', '0000-00-00', NULL, 1, NULL, NULL, ''),
(209, '174-2025', '', 57, NULL, 'Pressupost seleccionat i fitxa tècnica enviat a l\'escola per la instal.lacio de tendals i pèrgoles', 0.00, 'N', 'Bon dia, \r\nUs trametem el pressupost seleccionat i la fitxa tècnica que ens ha fet arribar l\'empresa per demanar el vistiplau per a la seva compra i instal·lació.\r\nJa enviarem a UGE la memòria econòmica justificativa.\r\nAgrairíem una resposta.\r\nAtentament,\r\nPere Marimón Camps\r\nDirector CEIP Maria Antònia Salvà', 342, 1, 1, '2025-06-26', '0000-00-00', NULL, 1, NULL, NULL, ''),
(210, '175-2025', '', 1, NULL, 'Instal·lació d\'aire condicionat a dos espais.', 0.00, 'N', 'Hola, bon dia!\r\nTenim dos espais al centre amb necessitat d\'instal·lació de climatització. \r\n\r\nEspai 1. Taller de tecnologia. 70 metres quadrats. Havíem pensat instal·lar ventiladors, però l\'aire pot moure partícules de materials i amb orientació noroest.\r\n\r\nEspai 2. Despatx d\'orientació. Hi fan feina els dos orientadors, el PSC i la psicòloga educativa a un espai de 10 metres quadrats orientat a surest.\r\n\r\nNecessitam saber si podem instal·lar splits d\'aire condicionat.\r\nGràcies!', 830, 1, 1, '2025-06-26', '0000-00-00', NULL, 1, NULL, NULL, ''),
(211, '176-2025', '', 221, NULL, 'Autocar crea desperfecte a l\'entrada del carrer al centre.', 0.00, 'N', 'Hola bon dia!\r\nJa vaig enviar email exposant dos accidents de busos al CEE SON FERRIOL  que han deixat tocades infraestructures de defora, concretament la paret i unes barres.\r\nDes de l\'empresa de busos MOVENTIS diuen que la seva assegurança no troba amb qui possar-se en contacte, no és competència de l\'ajuntament però des de la conselleria qui pot ser el receptor de l\'assegurança que ha de reparar els desperfectes?.\r\nSento un poc d\'impotència perquè la nostra barrera està espenyada i ningú ho arregla.\r\nCom ho podem fer?\r\nTorno a enviar fotos i dades dels accidents.', 165, 11, 1, '2025-06-27', '0000-00-00', NULL, 1, NULL, NULL, ''),
(212, '177-2025', '', 57, NULL, 'Pressupost aceptat', 0.00, 'N', 'Bon dia, adjunt remet el pressupost aprovat, de les ombres a una zona del pati de primària, per part de l\'APIMA amb la subvenció de l\'Ajuntament.\r\nGràcies.', 449, 1, 1, '2025-06-27', '0000-00-00', NULL, 1, NULL, NULL, ''),
(213, '178-2025', '', 61, NULL, 'Renovacio per mal estat del pati.', 0.00, 'N', 'Bon dia, \r\n Ens posam en contacte amb vostès per sol.licitar una sèrie d\'accions urgents al nostre centre:\r\n renovar el paviment ja que, degut al desgast d\'anys ara és molt gratallós perquè està en grava viva. És com un asfalt antic. Cada vegada que algun alumne cau, les farides són molt serioses. De fet, fa unes 4 setmanes va caure un professor i ha hagut d\'estar de baixa. Hem sol.licitat un pressupost a l\'única empresa que hem aconseguit trobar. Vos l\'adjunt per tal que analitzeu la necessitat de fer aquesta inversió.\r\nFer feina a les nostres aules amb les condicions de manca de climatització que tenim , és inhumà. De fet, totes les enquestes de satisfacció passades a la comunitat educativa , (alumnat, professorat i famílies) indiquen la necessitat d\'actualitzar el nostre centre educatiu en aquest sentit. De cada vegada és més necessari disposar d\'aires condicionats i no tant de calefacció.\r\n Evident, nosaltres no podem fer aquesta despesa i vos sol.licitam que vos faceu càrrec de l\'acondicionament del nostre centre educatiu. \r\n\r\nQuedam a l\'espera de respostes.', 789, 1, 1, '2025-06-27', '0000-00-00', NULL, 1, NULL, NULL, ''),
(214, '179-2025', '', 227, NULL, 'Sol·licitut d\'aules modulars', 0.00, 'N', 'Bon dia, des del CIFP Joan Taix vos volem demanar com hem de sol·licitar aules provisionals, ja que aquest estiu inicien les obres dels tallers d\'electricitat i ens han comunicat que la durada de lesobres sera de 6 mesos.\r\nHauriem de menester com a minim 5 moduls, gracies', 519, 1, 1, '2025-06-30', '0000-00-00', NULL, 1, NULL, NULL, ''),
(215, '180-2025', '', 60, NULL, 'Sol·licitut de lones per a crear zones d\'ombres.', 0.00, 'N', 'Bon dia\r\nSoc Antònia Alemany, secretària del Ceip Es Pil.larí, voliem sol.licitar la instal.lació de lones per poder tenir alguna ombra al nostre pati.  Les temperatures que tenim actualment fant molt difícil realitzar activitats a l´aire lliure.\r\nEsperam la vostra resposta\r\nSalutacions\r\n--', 294, 1, 1, '2025-06-30', '0000-00-00', NULL, 1, NULL, NULL, ''),
(216, '181-2025', '', 224, NULL, 'Reformar les jardineres', 0.00, 'N', '🧱 Reclamacions d\'infraestructura i manteniment al pati escolar\r\nReparació del mur lateral de les jardineres:\r\n\r\nEl mur està en mal estat i s\'ha reclamat diverses vegades la seva reparació.\r\nEs demana omplir-lo amb terra per poder ajardinar-lo amb arbres i plantes.\r\nProblemes de seguretat:\r\n\r\nHan caigut tres arbres durant el curs.\r\nHi ha escombros i arena que poden ser perillosos per als infants.\r\nL’arena cau a les pistes i provoca relliscades.\r\nAccions de les famílies:\r\n\r\nLes famílies s’han organitzat per fer accions reivindicatives i denunciar la situació a la premsa al setembre.\r\nFalta de subministrament de terra:\r\n\r\nL’escola ha hagut de comprar terra per l’hort escolar per manca de resposta a les peticions.\r\nPeticions concretes:\r\n\r\nReparació del mur i omplir amb terra per crear zones verdes.\r\nManteniment de les zones de jardí (desperfectes, herbes, reg).\r\nManteniment de l’arener (neteja i reposició d’arena).\r\nProposta de calendari:\r\n\r\nEs considera que l’estiu és un bon moment per fer les reparacions, ja que hi ha menys infants.\r\nDocumentació adjunta:\r\n\r\nS’han adjuntat fotografies per mostrar l’estat actual del pati.\r\nSi vols, puc ajudar-te a redactar una resposta formal o preparar un informe per traslladar-ho als responsables corresponents. Vols que t’ajudi amb això?', 252, 1, 1, '2025-06-30', '0000-00-00', NULL, 1, NULL, NULL, ''),
(217, '182-2025', '', 228, NULL, 'Nou IES Lloseta', 0.00, 'N', '', 861, 1, 1, '2025-06-30', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(218, '183-2025', '', 7, NULL, 'Reformes generals per adaptació a la normativa vigent.', 0.00, 'N', 'Bon dia,\r\n\r\nAmb data 05/11/2021 des de la Direcció General de Planificació, Ordenació i Centres es va enviar un ofici a l\'ajuntament de Santa Margalida (adjunt) en el qual s\'analitzaven una sèrie de deficiències de dos centres (entre ells el CEIP Vora Mar) assignant la seva execució a la Conselleria de Educació o l\'ajuntament en funció del tipus de deficiència.\r\n\r\nAmb data 18/03/2025  l\'IBISEC emet informe (adjunt) on fa una valoració econòmica aproximada de diferents deficiències del centre CEIP Vora Mar.\r\n\r\nAtesos aquests informes, us sol·licitem quines de les actuacions de l\'informe de 18/03/2025 ha de dur a terme l\'IBISEC i, si es troba adient, un ordre de prioritat en les mateixes.', 464, 1, 1, '2025-06-30', '0000-00-00', NULL, 1, NULL, NULL, ''),
(219, '184-2025', '', 7, NULL, 'Reformes generals per adaptació a la normativa vigent.', 0.00, 'N', 'Bon dia,\r\n\r\nAmb data 05/11/2021 des de la Direcció General de Planificació, Ordenació i Centres es va enviar un ofici a l\'ajuntament de Santa Margalida (adjunt) en el qual s\'analitzaven una sèrie de deficiències de dos centres (entre ells el CEIP Vora Mar) assignant la seva execució a la Conselleria de Educació o l\'ajuntament en funció del tipus de deficiència.\r\n\r\nAmb data 18/03/2025  l\'IBISEC emet informe (adjunt) on fa una valoració econòmica aproximada de diferents deficiències del centre CEIP Vora Mar.\r\n\r\nAtesos aquests informes, us sol·licitem quines de les actuacions de l\'informe de 18/03/2025 ha de dur a terme l\'IBISEC i, si es troba adient, un ordre de prioritat en les mateixes.\r\n\r\nSalutacions cordials.', 287, 1, 1, '2025-06-30', '0000-00-00', NULL, 1, NULL, NULL, ''),
(220, '185-2025', '', 224, NULL, 'Volen una porta per comunicar dues aules', 0.00, 'N', 'Volem demanar la possibilitat de fer una porta (que compleixi la normativa actual que ens digueu i estigui homologada) que comuniqui dues aules en la part antiga per poder tenir una aula annexa a la de música actual i estigui comunicada millor. D\'aquesta despesa creiem que la podríem asumir del pressupost general del centre. Esperem que ens digueu si ho veis viable o no.', 799, 1, 1, '2025-07-01', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(221, '186-2025', '', 72, NULL, 'Desperfectes creats arrel d\'una reforma per part de l\'empresa realitzadora. (El centre ha contesta diguent que ja esta arreglat)', 0.00, 'N', 'Bon dia, \r\nD\'ençà que varen acabar les obres del nostre centre, mes d\'octubre, no ens han arreglat tot allò que l\'empresa La trapa va rompre fent un mal ús. \r\nVaren tallar el cablejat de la megafonia del centre i avui dia, encara no ho han arreglat. \r\nEs varen comprometre a arreglar tot allò que no estàs bé i no s\'ha complit. \r\nEns hem posat en contacte amb ells, amb alguns de vosaltres i encara no hem obtingut resposta. \r\n\r\nEns agradaria de cara al curs vinent que tot estàs arreglat. \r\n\r\nEns podeu donar alguna resposta?\r\n\r\nSalutacions,', 469, 11, 1, '2025-07-01', '0000-00-00', NULL, 1, NULL, NULL, ''),
(222, '187-2025', '', 218, NULL, 'Incidencies amb aires condicionats de les aules modulars', 0.00, 'N', 'Bon dia, \r\n\r\nDes del Ceip Nou de Sa Pobla comunicam que tenim 2 aires acondicionats que no funcionen als móduls nous que es van instal·lar el mes d\'Octubre. \r\n\r\nDesprés de la reunió d\'infraestructures vam entendre que les incidències les havíem d\'enviar a aquest correu. \r\n\r\nSi s\'ha de fer la sol·licitud amb un altre format, ens ho podeu fer sebre. \r\n\r\nMoltes gràcies.', 372, 11, 1, '2025-07-01', '0000-00-00', NULL, 1, NULL, NULL, ''),
(223, '188-2025', '', 72, NULL, 'Sol·licitud reparació de cameres de seguretat', 0.00, 'N', 'Bon dia,\r\nL’escola disposa de càmeres de seguretat, però algunes d’elles no funcionen correctament. Ens agradaria poder-les reparar, però no sabem si aquesta despesa es pot justificar a través de l’ECOIB.\r\n\r\nEns podríeu confirmar si és possible fer aquesta reparació?\r\n\r\nGràcies,\r\nAntònia Salas', 381, 1, 1, '2025-07-01', '0000-00-00', NULL, 1, NULL, NULL, ''),
(224, '189-2025', '', 17, NULL, 'OBERTURA MENJADOR CEIP POETA VILLANGÓMEZ (EIVISSA)', 0.00, 'N', '', 380, 1, 1, '2025-07-01', '0000-00-00', NULL, 3, NULL, NULL, ''),
(225, '190-2025', '', 57, NULL, 'Presentació de pressuposts per al ombratge del pati', 0.00, 'N', 'Bon dia, \r\n\r\nEl director del Ceip Es Molinar avui ha telefonat per saber en quin punt ens trobem amb el pressupost d\'ombres de patis del Ceip Es Molinar. \r\n\r\nVàrem enviar la documentació en en Miquel Torrens i després de la telefonada avui ens han dit què està de vacances i tornem a enviar al docuemtnació en aquest correu. \r\n\r\nEnviam els 3 pressuposts què ens han demanat amb els prerequisits tècnics i a consell escolar s\'ha decidit què el pressupost què més s\'ajusta al nostre centre és el de l\'empresa NOU CEL pressupost 2 i imatge. \r\n\r\nAtentament', 293, 1, 1, '2025-07-02', '0000-00-00', NULL, 1, NULL, NULL, ''),
(226, '191-2025', '', 12, NULL, 'Sol·licutud de creació d\'un nou lloc per al personal de netetja al IES Llucmajor', 0.00, 'N', 'Bon dia.\r\nDe la secció sindical USO-CAIB posem en coneixement a aquesta DG que el personal de neteja CAIB  adscrits al centre IES Llucmajor no disposen d\'espais diferents i específics per aquest personal (vestidors i zones de descans). Per tal motiu, preguem a aquesta DG, faci les comprovacions oportunes per tal de verificar aquest fet i subsanar-ho per tal de donar compliment a l\'acord entre la Conselleria d\'Educació i les organitzacions sindicals relatiu a les condicions dels treballadors públics de neteja dels centres docents (clàusula 1) Els/les delegats de USO quedem a disposició d\'aquesta DG  a l\'espera que es subsanin les deficiències.\r\nSalutacions.\r\nSecció Sindical USO-CAIB', 801, 1, 1, '2025-07-02', '0000-00-00', NULL, 1, NULL, NULL, ''),
(227, '192-2025', '', 3, NULL, 'Instal·lació de ventiladors de sostre', 0.00, 'N', 'Bon dia, \r\n\r\nEscric des del CEIP Rei Jaume III, de Llucmajor. \r\n\r\nAl darrer consell escolar del nostre centre va sortir el tema i la preocupació de les famílies per la climatització de les aules. \r\n\r\nL\'equip directiu n\'hem estat xerrant i creim que una opció seria instal·lar ventiladors de sostre a les aules. Sabem que pot ser una inversió grossa (tenim intenció de demanar ajuda a AMPA i ajuntament), però abans de moure res i demanar pressuposts, ens agradaria saber si hi ha res que s\'hagi de tenir en compte (sobretot a efectes de normativa) i si ens sabeu d\'alguna empresa amb qui poguem contactar per demanar preus.\r\n\r\nMoltes gràcies.\r\n\r\nAtentament,', 392, 1, 1, '2025-07-02', '0000-00-00', NULL, 1, NULL, NULL, ''),
(228, '193-2025', '', 224, NULL, 'Compra de noves cistelles de bàsquet per substituir les antigues', 0.00, 'N', 'Bon dia.\r\n\r\nEns posem en contacte per la necessitat de posar els aros de basquet. Al gener vam haver de retirar els 6 que hi havia perquè estaven en mal estat i podien ser un perill. Dels 6 retirats només volem restituir 4 per dedicar altres espais a altres esports. \r\n\r\nUs adjunto 3 pressupost de 3 empreses:\r\nMONDO: pressupost amb material, transport i instal·lació (però molt car 11.055,06€)\r\nSTADIOR: pressupost només material (5.543,92€) i fitxa tècnica\r\nTP SPORT: pressupost amb material i transport (5.148,55€), foto al següent enllaç:\r\nhttps://tpsport.net/es/baloncesto/canastas/canasta-baloncesto-desmontable\r\n\r\nCanasta Baloncesto desmontable - Canastas - Baloncesto\r\nJuego de canastas TP, desmontables mediante tornillos y doble placa de anclaje, fabricadas según norma UNE EN 1270:2006. Mástil metálico en tubo redondo Ø 127 x 3, galvanizado en caliente por baño de inmersión para proteger tanto el interior como el exterior del tubo contra el óxido y la corrosión. Salida de 2.25m y 1.65m con protección opcional\r\ntpsport.net\r\n\r\nDesconec aquest mon i les empreses en qüestió però vaig xerrar amb TP Sport i me van assegurar que el material és de qualitat i aguanta bé la corrosió. Entenen que en els casos de STADIOR i TP SPORT haurem de cercar una empresa que ens faci la instal·lació.\r\n\r\nJa ens deis si hem de fer algun tràmit més amb això. Agrairíem quan abans ho poguem tirar endavant millor, perquè no sabem bé els terminis d\'entrega. Voldríem tenir-los posats a principis de setembre. Gràcies\r\n\r\nSalutacions', 793, 1, 1, '2025-07-03', '0000-00-00', NULL, 1, NULL, NULL, ''),
(229, '194-2025', '', 5, NULL, 'Reformes per a millor la seguretat i adaptació d\'espais', 0.00, 'N', 'Bon dia, \r\n- A la rampa d\'accés , des del pati, a l\'edifici d\'infantil falta una barana de seguretat.\r\nA falta d\'ella, fa anys varem posar uns cossiols però no son suficients. Qualque nin i adult ja ha caigut.\r\n\r\n- els banys del primer pis d\'infantil estan vells i no adaptat als alumnes de 5 anys que l\'utilitzen.\r\n\r\n- Aquest curs han acabat les obres del costat de l\'escola, un bloc d\'edifics que fa que per l\'hivern, el pati d\'infantil estigui tot el temps sense gens de sol. El trispol està molt humit i els nins com adults patinen. I a l\'estiu, per la posció del sol, més de la meitat del pati no hi ha ombra.\r\nEn el cas de l\'hivern no veim una solució viable i ens agradaria que des d\'infraestructura ens donassiu cualque solució.\r\nEn el cas de l\'estiu,volem posar unes veles pero no sabem si compleixen normativa i com hauria d\'actuar.\r\n\r\n- Des de la finca han pujat una paret i el nostre costat té reixa. S\'acumula molta brutor impossible de llevar i per conseqüencia hi venen rates. \r\n\r\nSol·licitam:\r\n- barana de seguretat pel pati d\'infantil\r\n- reformar els banys i fer-los accessibles als alumnes d\'infantil.\r\n- llevar les reixes i posar paret.\r\n- Posar unes veles o pergoles per tenir ombra durant els mesos de calor. al pati d\'infantil\r\n- Cercar una sol·lució a la humitat del trispol d\'infantil.\r\n\r\nAdjunt fotografies.', 267, 1, 1, '2025-07-03', '0000-00-00', NULL, 1, NULL, NULL, ''),
(230, '195-2025', '', 24, NULL, 'Instal·lacio de rocodrom al poliesportiu', 0.00, 'N', 'Bon dia, \r\nEl nostre centre va rebre una donació de material per instal·lar un rocòdrom horitzontal al poliesportiu. Tenim l\'estructura i les peces principals, però ens mancaria la instal·lació a la paret. \r\nEl departament d\'EF del centre ha sol·licitat pressupostos als dos ferrers disponibles de Ciutadella i hi mancaria decidir qui ens el podria posar. L\'AFA també estaria disposada a participar econòmicament en les despeses d\'instal·lació d\'aquest material.\r\nLa meva petició és quines passes s\'han de seguir per poder instal·lar el rocòdrom, si es necessita una autorització especial o d\'altres tràmits que s\'hagin de realitzar. \r\nAdjunto memòria justificativa de la proposta i els pressupostos sol·licitats. \r\nSalutacions,', 796, 1, 1, '2025-07-03', '0000-00-00', NULL, 1, NULL, NULL, ''),
(231, '196-2025', '', 4, NULL, 'Instal·lacio de veles per a ombra i ventiladors de sostre', 0.00, 'N', 'Bon dia,\r\nDes del CEIP Joan Mas de Pollença ens dirigim a vosaltres per sol·licitar l’autorització per dur a terme dues actuacions relacionades amb la millora de les condicions de climatització del nostre centre, especialment durant els mesos de més calor.\r\n\r\nEn primer lloc, volem instal·lar veles d’ombra al pati exterior amb l’objectiu de protegir l’alumnat de l’exposició directa al sol durant les hores d’esbarjo. Aquestes veles s’anclarien parcialment a una paret de la façana del centre i, per completar la seva instal·lació, es necessitaria la col·locació d’uns pals de ferro clavats al terra del pati per sostenir l’estructura de manera segura i estable.\r\n\r\nEn segon lloc, proposem la instal·lació de ventiladors de sostre en algunes aules del centre, amb la finalitat de millorar la ventilació.\r\n\r\nAtesa la naturalesa de les actuacions, entenem que és necessari comptar amb l’autorització prèvia del Servei d’Infraestructures Educatives. Per això, restam a la vostra disposició per aportar qualsevol documentació tècnica o informació addicional que considereu oportuna.\r\n\r\nAgraïm per endavant la vostra atenció i col·laboració, i restam a l’espera de la vostra resposta.\r\n\r\nCordialment,', 327, 1, 1, '2025-07-03', '0000-00-00', NULL, 1, NULL, NULL, ''),
(232, '197-2025', '', 211, NULL, 'Cambi de porta que haria d\'esser antipànic i no ho es.', 0.00, 'N', 'Benvolguts,\r\n\r\nUs volíem demanar si des de la Direcció General  podríeu fer-vos càrrec del canvi d\'una de les portes de sortida de l\'edifici, ja que hauria de ser antipànic i no ho és. Hem demanat un pressupost, que és el que us faig arribar.\r\n\r\nGràcies,', 781, 1, 1, '2025-07-04', '0000-00-00', NULL, 1, NULL, NULL, ''),
(233, '198-2025', '', 17, NULL, 'Sol·licitud de modul per ampliar el menjador.', 0.00, 'N', 'Bon dia, \r\n\r\nDes del Ceip Nou de Sa Pobla volem sol·licitar l\'ampliació de l\'espai de menjador que tenim habilitat. \r\n\r\nFa dos cursos es va instal·lar un modular per donar cabuda als usuaris de menjador que aquest curs ja ha assolit gairebé cada dia el nombre màxim d\'infants. \r\n\r\nPer aquest motiu sol·licitam: \r\n\r\nLa instal·lació d\'un mòdul nou per ampliar l\'espai que ja tenim. \r\n\r\nPel curs vinent serà imprescindible fer una nova ampliació d\'aquest espai, tenint en compte que encara no s\'han iniciat les obres del centre definitiu i continuarem en el Parc de Ca\'n Cirera Prim mínim dos cursos més. \r\n\r\n\r\nAtentament, \r\n\r\nCEIP NOU DE SA POBLA.', 372, 1, 1, '2025-07-04', '0000-00-00', NULL, 1, NULL, NULL, ''),
(234, '199-2025', '', 219, NULL, 'Instal·lació de tendals per tal d\'aillar l\'espai per a la realització d\'activitats', 0.00, 'N', 'Bon dia, \r\n\r\nEm pos en contacte amb vosaltres com a director del CEIP Mestre Guillemet de Santa Eugènia, Miquel Vicens Sastre, per sol·licitar permís i informació referent a la possible instal·lació de tendals a una porxada del nostre centre.\r\n\r\nEs tracta d’una porxada de 49 m², que ja està parcialment tancada per dos costats: un per un mur de l’edifici i l’altre per unes vidrieres. La nostra intenció és cobrir parcialment aquest espai amb tendals per protegir-nos del vent, l’oratge i el sol, i així poder-ne fer un ús més funcional i polivalent.\r\n\r\nAquest espai esdevindria molt útil per fer-hi tallers de plàstica, desdoblaments i altres activitats pedagògiques, ja que actualment no tenim prou espais per als agrupaments.\r\n\r\nAdjunt a aquest escrit dues fotografies de la zona per tal que pugueu valorar millor la proposta. Rest a la vostra disposició per ampliar qualsevol informació o documentació que sigui necessària.\r\n\r\nGràcies per endavant per la vostra atenció.', 351, 1, 1, '2025-07-04', '0000-00-00', NULL, 1, NULL, NULL, ''),
(235, '200-2025', '', 227, NULL, 'Sol·liciten dues aules modulars provisionals a l\'espera de l\'ampliació del centre', 0.00, 'N', '- Que al centre no s’han duit a terme les tasques d’ampliació previstes de la\r\nconstrucció d’un edifici nou.\r\n- Que és necessari i urgent habilitar un espai provisional per atendre a l’alumnat.\r\nSOL·LICIT\r\n- La cessió de dues aules modulars, com espai provisional a l’espera de l’execució de\r\nl’ampliació', 800, 1, 1, '2025-07-04', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(236, '201-2025', '', 24, NULL, 'Instal·lacio de rocodrom, passarel·la d\'equilibris', 0.00, 'N', 'Bon dia, el 19 de juny en Miquel Torrens ens va dir que havien passat l\'informe tècnic favorable a firma i que després tindríem l\'autorització d\'UGE per fer unes instal·lacions al pati del nostre centre (rocòdrom, passarel·la d\'equilibris...)\r\n\r\nEl problema és que entre tant de l\'UGE ens van dir que al publicar-se la nova normativa sobre expedients de despesa, podríem acceptar el pressupost directament.\r\n\r\nEns agradaria tenir l\'informe favorable per presentar-lo a l\'Ajuntament, que ens han de donar el vistiplau de les actuacions i no ens ha arribat res.\r\n\r\nMoltes gràcies,\r\n\r\nAlazne Orfila\r\nSecretària\r\n\r\n\r\nNo hi ha correus prèvis on especifiqui el que es vol fer.', 344, 1, 1, '2025-07-04', '0000-00-00', NULL, 1, NULL, NULL, ''),
(237, '202-2025', '', 224, NULL, 'Vàries actuacions, Desplaçament de la tanca de l’hort, Cobertura del fossat', 0.00, 'N', 'Toni va respondre al centre lo seguent:\r\n\r\n1. Desplaçament de la tanca de l’hort\r\n\r\n    Autoritzat: No afecta cap itinerari crític ni incompleix requisits mínims del centre.\r\n    Objectiu: Ampliar l’espai per a l’alumnat de cuina i instal·lar un hivernacle.\r\n    Condició: L’espai ha de romandre tancat per evitar accés no controlat.\r\n\r\n2. Cobertura del fossat\r\n\r\n    Desnivell estimat: Aproximadament 1 metre.\r\n    Requisits:\r\n        Cal permís de l’Ajuntament (dret d’arrambatge).\r\n        El pressupost hauria d’incloure com es consolidarà el mur.\r\n        S’ha de complir el CTE DB SUA, especialment l’apartat 3.2.1 sobre protecció de desnivells.\r\n    Solució recomanada: Instal·lar una barrera de protecció per garantir la seguretat i agilitzar l’actuació.', 765, 1, 1, '2025-07-07', '0000-00-00', NULL, 1, NULL, NULL, ''),
(238, '203-2025', '', 57, NULL, 'Instal·lació de veles per a la creació d\'ombres als patis.', 0.00, 'N', 'Bon dia,\r\n\r\nEns adrecem a vostès per sol·licitar el vistiplau per a la instal·lació de tres veles d\'ombra al pati d\'educació infantil del CEIP MARIA DE LA SALUT. L\'objectiu és millorar les condicions de confort per als infants durant els mesos de calor, proporcionant-los un espai més protegit del sol.\r\n\r\nHem encarregat un pressupost a una empresa especialitzada, que ha realitzat les mesures pertinents i ha proposat la instal·lació de tres unitats de veles model VALA COMMERCIAL 95, amb les següents dimensions aproximades:\r\n\r\nVela 1: 4,20 x 8,80 x 5,00 x 6,80 m\r\n\r\nVela 2: 5,80 x 13,20 x 6,00 x 10,50 m\r\n\r\nVela 3: 6,30 x 13,50 x 7,00 x 13,20 m\r\n\r\nRespecte a la ubicació i els ancoratges, la proposta tècnica inclou:\r\n\r\nAncoratges als voladissos estructurals de les aules d\'Educació Infantil.\r\n\r\nAprofitament del mur de contenció que dóna al carrer (el carrer es troba a una alçada aproximada de 2 metres per sobre del pati).\r\n\r\nPer a les veles 2 i 3, i amb la finalitat de centrar-les correctament, es preveu la instal·lació d\'un tub estructural entre el voladís de l\'aula de 4 anys i el voladís de l\'aula de 3 anys, on s\'hi fixaran els ancoratges corresponents.\r\n\r\nAdjuntem a aquest correu la documentació gràfica que inclou:\r\n\r\nImatges actuals del pati.\r\n\r\nRepresentació de la ubicació proposada dels ancoratges.\r\n\r\nDetall de la posició del tub estructural.\r\n\r\nUna vista aèria de l\'espai.\r\n\r\nRestem a la seva disposició per a qualsevol aclariment o informació addicional que puguin necessitar.\r\n\r\nAgraïm la seva atenció i quedem a l\'espera de la seva favorable resposta.\r\n\r\nSalutacions cordials,', 343, 1, 1, '2025-07-07', '0000-00-00', NULL, 1, NULL, NULL, ''),
(239, '204-2025', '', 224, NULL, 'Varis, coberta i teulada, sistema calefacció i caldera, contraicendis, tancament exterior, paviment pati, altres', 0.00, 'N', 'resum detallat del contingut del document relacionat amb l’IES Can Peu Blanc, amb un enfocament específic sobre quines actuacions corresponen al Servei d’Infraestructures Educatives:\r\n\r\nSituació general del centre\r\n\r\nL’IES Can Peu Blanc ha comunicat diverses despeses sobrevingudes i necessitats urgents de manteniment i millora, moltes de les quals ja han estat assumides pel centre amb fons propis. El centre demana suport econòmic i tècnic per afrontar les següents actuacions.\r\n🔧 Actuacions ja realitzades pel centre\r\n\r\n    Reparacions elèctriques (endolls, fluorescents, quadre general).\r\n    Reparació de bombes fecals i buidatge de fossa sèptica.\r\n    Reparació de rajoles als passadissos.\r\n    Reparació de parets interiors.\r\n    Revisió i reparació del sistema contra incendis.\r\n    Pagament de factures d’electricitat endarrerides.\r\n\r\n🔍 Actuacions pendents o pressupostades\r\n1. Coberta i teulada\r\n\r\n    Teules trencades i girades a la teulada de l’edifici antic.\r\n    Accés complicat i sense mesures de seguretat (barana, línia de vida).\r\n    Risc de despreniments sobre el pati → actuació urgent.\r\n\r\n👉 Infraestructures hauria de valorar i intervenir per garantir la seguretat estructural i l’accessibilitat a cobertes.\r\n2. Sistema de calefacció i caldera\r\n\r\n    Quadre de comandament avariat.\r\n    Motor de circulació d’aigua avariat.\r\n    Funcionament manual diari.\r\n\r\n👉 Coordinació amb IBISEC per confirmar i agilitzar la intervenció prevista.\r\n3. Sistema contra incendis\r\n\r\n    Renovació obligatòria de 28 extintors i 15 mànegues (pressupost: 5.392,71 €).\r\n    Reparació de tuberia d’aigua per a bombers (1.950,31 €).\r\n    Instal·lació de col·lector de proves (1.030,35 €).\r\n\r\n👉 Infraestructures hauria de valorar si pot assumir part d’aquestes despeses, especialment les relacionades amb la seguretat.\r\n4. Tancament exterior del centre\r\n\r\n    Barrerons rovellats i en mal estat.\r\n    Risc de fugues d’alumnat i intrusions.\r\n\r\n👉 Infraestructures hauria de valorar la renovació o substitució del tancament.\r\n5. Pavimentació del pati\r\n\r\n    Zona de terra i gravilla genera fang, pols i brutor.\r\n    Dificulta les classes d’educació física i la neteja del centre.\r\n\r\n👉 Infraestructures hauria de valorar la viabilitat tècnica i econòmica de pavimentar aquesta zona.\r\n6. Altres reparacions pendents\r\n\r\n    Fugues de tuberies (banys i aula polivalent).\r\n    Rajoles que es desenganxen i cauen als passadissos.\r\n\r\n👉 Infraestructures pot valorar si és viable eliminar l’enrajolat per evitar riscos futurs.\r\n✅ Accions recomanades per Infraestructures Educatives\r\n\r\n    Visita tècnica per avaluar:\r\n        Estat de la teulada i accessos.\r\n        Tancament exterior.\r\n        Zona de pati a pavimentar.\r\n        Estat general de les instal·lacions.\r\n\r\n    Informe tècnic per prioritzar actuacions segons risc i urgència.\r\n\r\n    Coordinació amb IBISEC per:\r\n        Reparació de la caldera i sistema de calefacció.\r\n        Intervencions estructurals si escau.\r\n\r\n    Estudi de viabilitat per assumir:\r\n        Renovació del sistema contra incendis.\r\n        Pavimentació del pati.\r\n        Reparacions estructurals i de seguretat.', 777, 1, 1, '2025-07-07', '0000-00-00', NULL, 1, NULL, NULL, ''),
(240, '205-2025', '', 9, NULL, 'Sol·licitud de creacio de nova aula.', 0.00, 'N', 'Bon dia,\r\nSoc na Marga Mas, directora del CEE Son Ferriol, volia demanar quan es preveu la construcció de l\'aula nova al centre, ens agradaria que estigués a punt pel començament de curs ja que als nostres alumnes els renous forts i canvis els afecten molt.\r\n\r\nPer altra banda, volia saber si ja tenim l\'autorització de l\'UGE per a iniciar la modificació del trispol del gimnàs.\r\n\r\nSalutacions', 165, 1, 1, '2025-07-07', '0000-00-00', NULL, 1, NULL, NULL, ''),
(241, '206-2025', '', 220, NULL, 'Instal·lacio de estors a l\'escola', 0.00, 'N', 'Bon dia,\r\n\r\nescrivim aquest correu des del CEIP Blai Bonet.\r\n\r\nEl centre educatiu aquest curs escolar ha assumit la despesa de 4.747,07€ per a la instal·lació dels estors del primer i segon pis de l\'edifici, ja que només estava pressupostat la instal·lació dels estors a la planta baixa. El dia de la inauguració oficial de l’edifici, 29 de maig de 2025, i després de comentar aquesta despesa amb el senyor Marco Alarcón, ens va comunicar que havíem de fer arribar tota la documentació a infraestructures per tal de poder recuperar la inversió. \r\n\r\nEl motiu pel qual vàrem fer aquesta inversió és perquè com a centre educatiu volíem adquirir els mateixos estors a totes les plantes. Les necessitàvem ja que l\'orientació de l\'edifici i la ubicació de les pantalles digitals a les aules no afavorien la visibilitat dins les aules. Volem manifestar que vàrem assumir aquesta despesa després de fer la consulta a gestió econòmica i al Consell Escolar, el qual va aprovar el pressupost, ja que desconeixiem la possibilitat de demanar a infraestructures que assumís en aquest cost. \r\n\r\n Per aquest motiu, adjuntem en aquest correu: \r\n\r\nEl pressupost dels estors. \r\n\r\nLes dues factures i les dues transferències realitzades.\r\n\r\nL’acta d’aprovació del consell escolar i la memòria justificativa.\r\n\r\n\r\nEsperam una resposta.\r\n\r\nSalutacions, \r\n\r\nEquip directiu del CEIP Blai Bonet', 262, 1, 1, '2025-07-08', '0000-00-00', NULL, 1, NULL, NULL, ''),
(242, '207-2025', '', 224, NULL, 'Reforma del pati', 0.00, 'N', 'Bon dia:\r\nArrel de la reunió de dia 3 de juliol que va mantenir la regidora d\'educació de l\'ajuntament de Bunyola amb el servei d\'infraestructures, on va exposar el projecte de reforma del pati de primària del CEIP Mestre Colom, vos feim arribar aquest projecte.\r\nAquesta actuació és extremadament necessària, a causa de les elevades temperatures que assoleix el nostre pati. Aquest curs hem hagut d\'aplicar mesures correctores, com avançar la sessió de pati una hora i suprimir les activitats a l\'exterior a partir de les 12\'00h, ja que s\'assolien temperatures de 35 graus o més.\r\nSalutacions', 348, 1, 1, '2025-07-08', '0000-00-00', NULL, 1, NULL, NULL, '');
INSERT INTO `actuacions` (`id`, `codi`, `codi_extern`, `subtipus_id`, `origen`, `descripcio`, `pressupost`, `assumit_servei`, `observacions`, `centre_id`, `estat_id`, `prioritat_id`, `data_entrada`, `data_enviament`, `tecnic_id`, `origen_id`, `desti_id`, `mode_enviament_id`, `url_ibisec`) VALUES
(243, '208-2025', '', 3, NULL, 'Instal·lacio de ventiladors de sostre', 0.00, 'N', 'Bon dia.\r\nSeguint les seves instruccions, facilitam enllaç de la carpeta on es troben fotos d\'una aula model referència (totes tenen el sostre igual i la mateixa altura), així com una subcarpeta amb croquis de la possible ubicació dels ventiladors de sostre:\r\nhttps://drive.google.com/drive/folders/1_YfUEgr7Aj30WWIH4aokHTGv9oXTolzW?usp=sharing\r\nRespecte a l\'altura de les aules és de 3,00 m, i a les bigues 2,50 m.\r\nEl total d\'espais-aules per les quals sol·licitam la instal·lació d\'aquests ventiladors són inicialment 15. No són tots els del centre, només els que estan orientats a l\'est sud-est, i que durant gairebé tot el matí, a la primavera i tardor, rebent la insolació directa i tenen una temperatura més elevada, per sobre dels 27°.\r\nEn espera de les seves notícies, agrairíem que confirmessin la recepció del correu, restant a la seva disposició per a qualsevol aclariment.\r\nAtentament.', 786, 1, 1, '2025-07-08', '0000-00-00', NULL, 1, NULL, NULL, ''),
(244, '209-2025', '', 14, NULL, 'Adequació bany adaptat, reparació escalons accés pati, goteres i humitats', 0.00, 'N', 'Resum d’Actuacions Sol·licitades\r\n\r\n    Adaptació de bany per a persones amb mobilitat reduïda\r\n        Urgència alta: actualment no hi ha cap bany accessible.\r\n        Impacte directe: alumnat amb discapacitat no pot fer ús dels serveis, ja ha provocat una baixa.\r\n\r\n    Reparació d’escalons en mal estat\r\n        Ubicació: escala d’accés al pati.\r\n        Problema: es desfan els graons, exposant els ferros estructurals.\r\n        Risc: perill de lesions per a l’alumnat.\r\n\r\n    Goteres i humitats\r\n        Aula 9: goteres.\r\n        Aula A: humitats.\r\n        Situació: ja comunicades anteriorment, pendents de resolució.\r\n\r\n    Pagament per impermeabilització del terrat\r\n        Finalitat: instal·lació de plaques solars.\r\n        Estat: actuació ja realitzada i pagada pel centre.\r\n        Acció requerida: fer l’ingrés corresponent al centre.', 518, 1, 1, '2025-07-08', '0000-00-00', NULL, 1, NULL, NULL, ''),
(245, '210-2025', '', 72, NULL, 'Instal·lació cablejat wifi. Esperen l\'autorització a IBISEC de part nostra.', 0.00, 'N', 'Bon dia,\r\n\r\nCom a responsable del Museu de l\'Educació de les Illes Balears, ubicat al Quarter del General Luque d\'Inca, hem iniciat els tràmits per a la instal·lació de WIFI a l\'edifici esmentat, atès que és del tot necessari que en disposi perquè els visitants puguin accedir-hi i perquè les persones que hi fan feina puguin fer-ho utilitzant ordinador portàtil.\r\n\r\nPer tot això, us sol·licitam que autoritzeu i dugueu a terme el muntatge del cablejat per instal·lar les diverses antenes del WIFI que s\'ha d\'implantar al Museu de l\'Educació d\'Inca.\r\n\r\nPer a qualsevol consulta o aclariment, us podeu dirigir als tècnic del Museu.\r\n\r\nMoltes gràcies.\r\n\r\nBen cordialment,\r\n\r\nFeliça Vidal Pons\r\n\r\nServei de Normalització Lingüística i Participació Educativa\r\n\r\nDG de Primera Infància, Atenció a la Diversitat i Millora Educativa\r\nConselleria d\'Educació i Universitats\r\nC/ del Ter, 16. Pol. Son Fuster\r\n07009 Palma\r\nTel. 971 17 61 40 (ext. 62323)', 862, 1, 1, '2025-07-08', '0000-00-00', NULL, 1, NULL, NULL, ''),
(246, '211-2025', '', 224, NULL, 'Entrada principal, paret solar contigu, ombres', 0.00, 'N', '📌 Situació General\r\n\r\nEl CEIP Coll d\'en Rabassa té pendent la intervenció a l\'entrada principal del centre, que roman tancada des de fa gairebé un any. A més, hi ha una petició relacionada amb la paret del solar contigu, cedit des del 2018 però encara sense ús.\r\n🏛️ Estat del Conveni amb l’Ajuntament\r\n\r\n    El conveni de col·laboració entre l’Ajuntament de Palma i la Conselleria d’Educació encara es troba en fase de tramitació.\r\n    Fins que no es signi, no es pot intervenir a l’entrada principal.\r\n    Es notificarà al centre tan aviat com hi hagi novetats.\r\n\r\n🧱 Paret del Solar Contigu\r\n\r\n    S’ha sol·licitat actuació a l’IBISEC, però no es poden garantir terminis d’execució a causa de la saturació actual del servei.\r\n\r\n🌳 Instal·lació d’Estructura d’Ombra al Pati\r\n\r\n    S’ha aprovat la instal·lació d’una estructura d’ombra amb l’empresa Electro Toldo Balear S.L. per un import de 13.000 € (sense IVA).\r\n    Es tramitarà una resolució d’enviament de fons per 18.116,12 €, que inclou la instal·lació i els honoraris de l’arquitecte.\r\n    L’arquitecte ha de garantir:\r\n        Certificació tècnica segons el CTE DB-AE (seguretat estructural i càrrega de vent).\r\n        Compatibilitat amb el grau de protecció de l’edifici segons el PGOU de Palma.\r\n    El centre ha de comunicar l’actuació a l’Ajuntament, responsable del manteniment posterior.\r\n\r\n🧾 Procediment Administratiu\r\n\r\n    Cal aprovar els pressupostos pel Consell Escolar.\r\n    Posteriorment, fer la sol·licitud d’autorització de l’expedient de despesa.\r\n    Un cop autoritzada la despesa, es pot iniciar l’actuació.\r\n    El pagament només es pot fer un cop finalitzada l’actuació.', 281, 1, 1, '2025-07-08', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(247, '212-2025', '', 219, NULL, 'Millora de la carpinteria exterior dels banys i l\'àrea exterior infantil.', 0.00, 'N', '🛠️ Resum d’Actuacions – CEIP Punta de n’Amer\r\n\r\n    Tramesa del projecte modificat\r\n        L’Ajuntament de Sant Llorenç va enviar per error el projecte modificat a l’IBISEC en lloc del Servei d’Infraestructures Educatives.\r\n        El projecte respon a un informe previ emès per Helena Guinjoan.\r\n\r\n    Sol·licitud de prioritat\r\n        Es demana atendre la petició amb caràcter prioritari per tal de no endarrerir la tramitació de la licitació corresponent.\r\n\r\n    Documentació pendent per registre\r\n        Tot i que la documentació s’enviarà oficialment per registre, s’ha avançat per correu electrònic per guanyar temps.', 388, 1, 1, '2025-07-08', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(248, '213-2025', '', 49, NULL, 'Reiteració sobre tenir informació referent a obres que s\'haurien de dur a terme al gimnàs del CEIP de Pràctiques.', 0.00, 'N', 'Bon dia, \r\nJa vaig escriure un correu fa mesos perquè no tenim cap tipus d\'informació sobre les obres que s\'haurien de dur a terme al gimnàs del CEIP de Pràctiques perquè fa dos anys que tenim goteres. L\'Ajuntament ens diu que vos heu d\'encarregar vosaltres però no sabem si vos heu coordinat amb l\'Ajuntament de Palma i si ja està en marxa fer una actuació ni quina ni quan.\r\nAgraïríem pòder rebre informació sobre aquest tema o poder xerrar amb algú que ens pugui ajudar per aclarir en quin punt estam abans de tornar a començar el curs i tornar a trobar-nos amb el gimnàs inundat cada vegada que plou.\r\nMoltes gràcies.', 283, 1, 1, '2025-07-09', '0000-00-00', NULL, 1, NULL, NULL, ''),
(249, '214-2025', '', 72, NULL, 'Sugeriment de reforma integral del cablejat internet, electric, per tal de recuperar internet.', 0.00, 'N', 'Bon dia,\r\n\r\nAdjunto un escrit sobre l\'estat del cablejat eèctric i informàtic del centre.\r\n\r\nSalutacions,', 444, 1, 1, '2025-07-09', '0000-00-00', NULL, 1, NULL, NULL, ''),
(250, '215-2025', '', 51, NULL, 'Reparació de cobertes, aïllament tèrmic, aujub contra incendis, tancament porxos.', 744456.00, 'N', '🏫 Context i Antecedents\r\n\r\n    El CEIP Puig de na Fàtima és un centre d’educació infantil i primària amb gimnàs, inaugurat l’any 2010.\r\n    Des de 2017 presenta filtracions a la coberta. El 2021 es sol·licita la seva impermeabilització.\r\n    El juliol de 2024 es presenta un projecte redactat per l’arquitecte Diego de Rinaldis.\r\n\r\n🔧 Intervencions Proposades\r\n\r\n    Substitució i reparació de cobertes:\r\n        Vegetal a les aules, grava al gimnàs i a l’edifici central.\r\n        Incorporació d’aïllament tèrmic (millora del 68,42% en la transmitància).\r\n    Reposició de falsos sostres interiors i exteriors.\r\n    Tancament dels porxos entre aules amb fusteria practicable.\r\n    Instal·lació de pèrgoles, baranes perimetrals i un aljub contra incendis.\r\n    Incorporació de sistemes de seguretat per al manteniment (línies de vida o baranes).\r\n\r\n💶 Pressupost\r\n\r\n    Inicial del projecte: 1.286.361,89 € (IVA inclòs).\r\n    Revisat i acceptat: 744.456,56 € (IVA inclòs), després d’ajustaments tècnics i eliminació d’elements no conformes.\r\n\r\n✅ Actuacions Acceptades\r\n\r\n    Reparació de cobertes (vegetal no transitable i grava).\r\n    Aïllament tèrmic de 150 mm.\r\n    Aljub contra incendis.\r\n    Tancament dels porxos per millorar la circulació interna.\r\n\r\n❌ Actuacions No Acceptades\r\n\r\n    Coberta vegetal transitable.\r\n    Pèrgoles a les cobertes i patis (es proposen veles o tendals).\r\n    Falsos sostres de fusta tecnològica (es prefereixen de fibra o encenalls).\r\n    Baranes perimetrals (es proposa un altre sistema de seguretat).\r\n\r\n📋 Recomanacions i Requisits\r\n\r\n    Redactar un estudi de seguretat i salut.\r\n    Modificar el projecte d’activitats i el pla d’autoprotecció per complir amb el Codi Tècnic d’Edificació (CTE).\r\n    El termini d’execució serà de 6 mesos, garantint la seguretat i la continuïtat de l’ús de l’edifici.', 384, 1, 1, '2025-07-09', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(251, '216-2025', '', 218, NULL, 'Problemes amb l\'aire condicionat. Control de clima.', 0.00, 'N', 'Bon dia Miquel,\r\n\r\nT\'escric per explicar-te la situació que vivim amb el control de la climatització.\r\nL\'edifici al qual s\'ubica el nostre institut es va inaugurar l\'any 2014. La instal·lació del sistema de control de climatització i el seu posterior manteniment anual va anar a càrrec de Siemens i ha donat problemes sempre. El control es realitza a través del navegador.\r\nDes de fa 5 anys, resulta impossible visualitzar correctament cap pantalla de control, però aconseguíem posar-lo en marxa perquè tenim localitzats els controls del temporitzador i el canvi hivern-estiu. L\'empresa ens va dir que la nostra instal·lació estava ja obsoleta i que no es fabricaven recanvis. Per tant, ens va proposar fer la migració a un sistema modern amb l\'oferta adjunta en pdf. En el seu moment ens va semblar una despesa desproporcionada i, donat que aconseguíem que anés funcionant, vàrem decidir continuar igual.\r\nEl desembre de 2024, en Josep, el tècnic de Barcelona encarregat de la nostra instal·lació fins aquell moment, va venir a fer la revisió i, durant la feina, es va produir un error que va desprogramar el mòdul que conté part de l\'enginyeria (PXX-L11). Em va dir que allò només afectava la posada en marxa de forma sincronitzada i programada de tots els fancoils, però que encara es podien controlar manualment, i que, si li fèiem el favor de recuperar els codis ID dels fancoils, la pròxima visita a l\'illa (en un mes) ell passaria i ho tornaria a configurar. Des d\'aquell moment, malgrat tenir els IDs i haver-los enviat per correu, no hem rebut resposta a les diverses sol·licituds.\r\nAmb l\'arribada de la calor i el canvi al mode estiu, ens vàrem adonar que els compressors si reben l\'ordre de produir fred, però els fancoils continuen treballant com a hivern. Per les elevades temperatures, sempre estan per damunt de la temperatura de consigna i no obren l\'electrovàlvula. Per tant, no podem refredar les aules.\r\nA la petició de suport tècnic, Siemens ens va contestar que la nostra instal·lació havia passat a la delegació de Mallorca. El tècnic que va venir, va constatar tot l\'explicat i vàrem quedar que cercaria una d\'aquestes peces de segona mà per alguna de les delegacions nacionals per poder substituir-la. D\'això fa dues setmanes i encara no hem rebut resposta. Encara que l\'avaria es va produir durant la seva manipulació, va demanar costejar el cost de la reprogramació a mitges, a la qual cosa ens vàrem negar  (es pot veure una aproximació d\'aquest valor al pressupost adjunt).\r\nCrec que la possible solució passa per una de les següents opcions:\r\nAcceptar un pressupost actualitzat com el que ja ens varen presentar.\r\nTenir molta sort i que aparegui la peça en qüestió i el tècnic faci la programació.\r\nAprofitar l\'ampliació del centre per introduir un sistema que unifiqui el control del clima a tot l\'institut. Part nova més migració de l\'antiga. Aquesta pot ser la més assequible i duradora en el temps i ja la vàrem comentar a la reunió de presentació del projecte que es va fer amb la presidenta, el conseller i el gerent de l\'IBISEC.\r\nDemanar a l\'electricista del centre que faci que a les electrovàlvules dels fancoils hi hagi un 1 permanent. D\'aquesta manera, el control del clima quedarà totalment manual, però és l\'única opció que ens permetrà refredar les aules per setembre.\r\nSiemens es mostra receptiu a la proposta 3 i nosaltres pensem que és la que quedaria millor. Ho vaig xerrar amb el constructor (Tomàs) i per ell no hi hauria cap problema, però quan ell ho va proposar a la reunió d\'obra de dilluns 30/06/25, l\'arquitecte va dir que el projecte s\'ha de limitar a l\'aprovat.\r\nD\'altra banda, és evident, que les opcions 1 i 4 no són definitives. De fet, l\'opció 4 es podria desfer una vegada solucionat el problema.\r\nT\'explico tot això perquè em puguis assessorar amb la manera de procedir per solucionar el problema. \r\n\r\nDisculpa la llargària del correu.\r\n\r\nAtentament,\r\n\r\nJosé Luis Daudén Carretero\r\nSecretari IES Sant Marçal', 823, 1, 1, '2025-07-09', '0000-00-00', NULL, 1, NULL, NULL, ''),
(252, '217-2025', '', 72, NULL, 'Reiteració en la demanda de informació sobre l\'expedient ED75-2025', 0.00, 'N', 'Bon dia,\r\n\r\nUs sol·licitam informació a l\'estat de l\'expedient ED 75/2025 del nostre centre EI Paula Torres, tipus: obres i instal·lacions.\r\nel 6 de juny vàrem rebre l\'informe faborable de la UGE  de la nostra Conselleria, però per tenir una previsió, us sol·licitam en quin estat es troba aquest expedient.\r\n\r\nMoltes gràcies.\r\n\r\n\r\nAtentament,\r\n\r\n\r\nPilar Llompart Bennàsar\r\nEI Paula Torres\r\n971248414\r\nc/Amer, 53\r\nPalma 07007', 572, 1, 1, '2025-07-10', '0000-00-00', NULL, 1, NULL, NULL, ''),
(253, '218-2025', '', 224, NULL, 'Peteció per a l\'instal·lació de lloses de gespa.', 0.00, 'N', 'Bon dia,\r\n\r\nEl passat dimarts vam fer una sol·licitud a l\'Ajuntament de Palma, pregant autorització per tal que poguem instal·lar lloses de gespa articificial en un passadís exterior del pati del CEIP Gènova. El nostre pati és molt petit i no hi ha cap zona verda, està tot cimentat. A més a més, el trespol d\'aquest passadís en concret es troba en bastant mal estat de manera que ens agradaria transformar aquest espai per incloure-hi propostes de joc al terra, així com un toc de verd.\r\n\r\nLa resposta de l\'Ajuntament de Palma ha estat que aquesta autorització no és competència seva i ens remeten a la Conselleria d\'Educació. \r\n\r\nAdjunto la instància que vam enviar a l\'Ajuntament i prego ens indiqueu de quina manera hem de procedir.\r\n\r\nGràcies per endavant,\r\n\r\nAina Gordo Camps\r\nDirectora CEIP Gènova\r\n971400001', 315, 1, 1, '2025-07-10', '0000-00-00', NULL, 1, NULL, NULL, ''),
(254, '219-2025', '', 227, NULL, 'Sol·licitud d\'aules modulars per increment de cursos i alumant.', 0.00, 'N', 'Bon dia,\r\n\r\nEls escrivim des de l\'IES Sant Agustí per sol·licitar aules modulars per al nostre centre, per al curs 25/26, ja que fent els horaris i assignant espais és evident que tenim aquesta necessitat. A continuació n\'explicam els motius.\r\n\r\nDes de fa dos cursos tenim alumnat a 1r d\'ESO provinent d\'una escola adscrita més, Ses Planes, cosa que ha fet augmentar les ràtios; ara ens han atorgat un grup més de 1r d\'ESO i per tant en tendrem 6. També tendrem 6 grups de 2n d\'ESO, ja que per problemes de convivència hem decidit crear-ne un. La resta de grups es mantenen com el curs passat\r\n\r\nD\'altra banda, el curs passat vam estrenar aula UEECO i el CFGM de Cures Auxiliars d\'Infermeria, que han suposat també una inversió d\'espais fixos. \r\n\r\nSi a tot això afegim que disposam d\'Alter dos dies a la setmana, que PALIC ha augmentat d\'hores i necessita espai també, més els desdoblaments i les optatives, veiem que anam molt justos, que ara disposam només d\'una aula de suport unes hores a la setmana i que beneficiaria molt l\'alumnat poder tenir aquestes aules modulars, ja que si no ens veurem obligats a fer classes fins i tot en els departaments.\r\n\r\nUs adjuntam fotos de dos llocs diferents on podrien col·locar-se aquestes aules. No sé si hi ha alguna característica que necessitem saber per tal de buscar el lloc ideal, però el pati és suficientment gran per encabir-les.\r\n\r\nQuedam a l\'espera de la seva resposta.\r\n\r\nGràcies.\r\n\r\n--\r\nJaume Fitó Pardo\r\nDirector\r\nIES Sant Agustí', 822, 1, 1, '2025-07-11', '0000-00-00', NULL, 1, NULL, NULL, ''),
(255, '220-2025', '', 49, NULL, 'Comunicació de goteres al mensador petit. Comenten que a l\'abril ja es va a passar a fer una revisió.', 0.00, 'N', 'Bon dia,\r\nvos comunicam que després de la tormenta d\'ahir al matí han tornat sortir goteres al menjador petit.\r\nPel mes d\'abril, ja varen venir a fer una revisió perquè ja va caure aigua.\r\nCordialment,\r\n\r\n\r\n\r\n--\r\nALBERT FEO \r\nSecretari\r\nTelf. 971771694', 253, 1, 1, '2025-07-11', '0000-00-00', NULL, 1, NULL, NULL, ''),
(256, '221-2025', '', 224, NULL, 'Cuina, lamel·les, goteres, edifici gimnàs i menjador, cisternes, drenatges, interfon menjador, aula amb pica, ombres pati, bassa (connexió elèctrica), aparcabicicletes.', 0.00, 'N', '📄 1. Informe de contractació cuina CEIP Sa Marina (març 2024)\r\n\r\nObjecte del projecte:\r\nAdequació de la sala de preparació d’aliments per convertir-la en cuina escolar.\r\n\r\nDetalls principals:\r\n\r\n    Ubicació: Carrer de Francesc Moragues, 35, Llucmajor.\r\n    Pressupost total: 197.882,92 € (IVA inclòs).\r\n    Durada prevista de les obres: 4 mesos.\r\n    Autor del projecte: Guillem Sastre Manera (enginyer industrial).\r\n    Encàrrec: IBISEC (Institut Balear d’Infraestructures i Serveis Educatius i Culturals).\r\n\r\nÀmbits d’actuació:\r\n\r\n    Zona de cocció: Nova illa central amb campana extractora, sistema d’extinció, fontaneria, sanejament i il·luminació.\r\n    Cambra frigorífica: Tancament, climatització, mobiliari refrigerat i noves instal·lacions.\r\n    Zona de rentat: Nou rentavaixelles, pica i passa-plats.\r\n    Petit magatzem: Sistema de climatització.\r\n    Caseta d’emmagatzematge de GLP.\r\n\r\nAltres aspectes:\r\n\r\n    Inclou estudi de gestió de residus.\r\n    No es requereix classificació de l’empresa contractista per ser un contracte menor de 500.000 €.\r\n    Garantia proposada: 24 mesos.\r\n    No es poden utilitzar marques comercials en la licitació.\r\n\r\n🛠️ 2. Informe de deficiències i reparacions necessàries (juny 2025)\r\n\r\nContext:\r\n\r\n    L’edifici es va finalitzar el 2012. Algunes patologies persisteixen des d’aleshores.\r\n    Encara no s’ha retornat l’aval a l’empresa constructora.\r\n\r\nPrincipals deficiències detectades:\r\n\r\n    Lamel·les (celosies):\r\n        Un mòdul va ser retirat després d’un temporal el 2020 i s’ha de substituir.\r\n        Revisió completa dels ancoratges i reforços de tota la façana sud.\r\n\r\n    Goteres:\r\n        A les aules d’infantil, escales i vestíbul.\r\n        Problemes d’impermeabilització a cobertes i nuclis de maquinària.\r\n\r\n    Cobertes:\r\n        Fioles despreses.\r\n        Banda perimetral de PVC desenganxada (patologia més greu).\r\n        Filtracions als vestidors del gimnàs.\r\n\r\n    Edifici gimnàs i menjador:\r\n        Portes desajustades i danyades.\r\n        Fissures no estructurals.\r\n        Reixa de seguretat trencada.\r\n        Entrada d’aigua per la porta del porxo.\r\n        Cabines fenòliques rovellades i amb fixacions trencades.\r\n\r\n    Altres sol·licituds del centre:\r\n        Reparació de cisternes.\r\n        Millora del drenatge a patis i aparcament.\r\n        Instal·lació d’intèrfon al menjador.\r\n        Nova aula amb pica per a laboratori.\r\n        Més ombra al pati (renaturalització).\r\n        Connexió elèctrica a la zona de la bassa.\r\n        Més aparcabicicletes.', 416, 1, 1, '2025-07-11', '0000-00-00', NULL, 1, NULL, NULL, ''),
(257, '222-2025', '', 218, NULL, 'Autorització de despesa sobre la màquina d\'aire condicionat del centre', 0.00, 'N', 'A l\'atenció del Sr. Antoni Morro,\r\nS\'informa que s\'ha realitzat la sol·licitud d\'autorització de despesa de la màquina d\'aire condicionat del centre. S\'adjunta document de sol·licitud i els tres pressuposts afegits. Donam per entès que rebrem la resposta de la notificació al correu del centre i la seva resolució a la carpeta ciutadana del Sr. Nicolás lópez Vidal com a persona jurídica del centre. En qualsevol cas, pregam que, en la mesura del possible, ens pugui indicar els passos posteriors a seguir.\r\nAprofitam l\'avinentesa per agrair-li la seva ajuda amb l\'agilització de la problemàtica actual del centre i desitjar-li un bon estiu.\r\nPer qualsevol dubte o aclariment estam a la seva disposició i en cas necessari disposa dels següents números de telèfons de contacte.\r\nTel centre: 971503964\r\nNicolás López Vidal (director): 666664490\r\nToni Capó Siquier (secretaria): 625475832\r\n\r\nAtentament.\r\nSecretaria.\r\nToni Capó Siquier', 471, 1, 1, '2025-07-14', '0000-00-00', NULL, 1, NULL, NULL, ''),
(258, '223-2025', '', 207, NULL, 'Instal.lació Videoporter', 0.00, 'N', 'Bon dia,\r\n\r\nEl meu nom és Daniel Martínez Costa, secretari del Conservatori Professional de Música i Dansa d\'Eivissa i Formentera. Aquesta setmana s\'ha anunciat que el pròxim curs el Programa d\'Ensenyaments Integrats (PEI) de Conservatori i IES començarà a impartir-se íntegrament a les instal·lacions del Conservatori.\r\n\r\nAquesta novetat fa que el centre hagi de fer alguns canvis de cara al començament del curs a setembre. Un d\'aquests canvis són les portes al carrer. Al ser un Conservatori fins ara podíem tindre les portes obertes, però a partir d\'ara, almenys de matins, haurem de tindre les portes tancades i que no es puguin obrir des de dins.\r\n\r\nAra mateix tenim dues portes, una principal i una de darrere (adjunt imatges).\r\nLa porta principal té un timbre amb càmera de fora, però no de dins. També té una maneta per poder obrir per dins. Així, en aquesta porta faria falta:\r\n- Llevar la maneta per no poder obrir per dins.\r\n- Posar un altre sistema d\'obertura de porta de dins. Pot ser un altre timbre amb càmera dins? Fer un forat a la porta per poder tocar des de dins el timbre de fora? En aquest últim cas, el problema seria que la càmera del carrer no mostraria qui vol sortir.\r\n\r\nLa porta de darrere ara mateix està configurada com a una porta d\'emergència. No obstant això, de cara al curs pròxim açò hauria de canviar, ja que l\'alumnat d\'ESO podria sortir al carrer sense problema per ací. Podríem llevar el sistema de porta d\'emergència d\'aquesta porta al carrer?\r\n\r\nUs enviem aquest correu com a consulta per sabre quines serien les millors solucions amb aquestes portes, a més de si també ens podeu indicar algunes empreses que poden dur a terme aquestes actuacions.', 551, 1, 1, '2025-07-14', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(259, '224-2025', '', 3, NULL, 'Indiquen al mail que estan patint les consequències de les altes temperatures al mes de juny.', 0.00, 'N', 'Bon dia, \r\nDurant el mes de juny hem estat a 32º i 33º a les aules de la nostra escola, quan la temperatura màxima hauria de ser 27º. Enviam aquest missatge perquè quedi constància que aquestes darreres setmanes hem tenguts mals de caps, de panxa i cops de calor per aquestes temperatures extremes, tant mestres com alumnes, tot i tenir ventiladors a totes i cada una de les aules del centre i activam el vostre protocol per altes temperatures.\r\nA dia d\'avui, també dir que l\'equip directiu estam fent feina a secretaria amb unes temperatures de 30º. No són condicions de feina humanament acceptables, basta intentar imaginar com seria fer feina a l\'edifici de la Conselleria sense aire condicionat. Així vivim nosaltres la nostra feina diària.\r\nTrobam urgent trobar solucions.\r\nSalutacions.', 283, 1, 1, '2025-07-14', '0000-00-00', NULL, 1, NULL, NULL, ''),
(260, '225-2025', '', 14, NULL, 'Sol·liciten la reforma de bany per a persones amb mobilitat reduïda', 0.00, 'N', 'Bon dia\r\nAmb conversa telefònica amb el Sr. Toni Morro, sol·licitaríem la reforma del bany per persones amb discapacitat. La reforma sobretot seria per poder col·locar un bany amb inodor japonès i també col·locar-lo amb unes distàncies millors per poder introduir les cadires de rodes i també la pujada del lavabo de mans, ja que les cadires tampoc deixen accedir.\r\nUns presentam unes fotografíes per poder veure la col·locació i posterior reforma.\r\nAquesta reforma seria necessària abans de començar el proper curs acadèmic.\r\nLes rajoles fan 33 cm.\r\n\r\nMoltes gràcies per la seva atenció.\r\n\r\n--', 811, 1, 1, '2025-07-14', '0000-00-00', NULL, 1, NULL, NULL, ''),
(261, '226-2025', '', 10, NULL, 'Projecte previ a l\'obra civil de l\'hivernacle fotovoltaic al CIFP Joan Taix.', 0.00, 'N', 'Bon dia, tal i com varem quedar a la reunió de dia 2 d\'abril en relació al conveni per la instal·lació de l\'hivernacle al CIFP Joan Taix, vos remetem el projecte de l\'obra civil prèvia a la instal·lació del mateix perquè la pogueu executar.\r\nMoltes gràcies\r\n--', 519, 1, 1, '2025-07-15', '0000-00-00', NULL, 1, NULL, NULL, ''),
(262, '227-2025', '', 229, NULL, 'Sol·licitud de licitació de les obres d\'ampliació i reforma de l\'EI ES FARALLÓ', 0.00, 'N', 'Bon dia\r\n\r\nEn data d\'avui s\'ha efectuat la sol·licitud de licitació de les obres d\'ampliació i reforma de l\'EI ES FARALLÓ (REF 2025-RE-0897), per arxivar.', 606, 1, 1, '2025-07-15', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(263, '228-2025', '', 49, NULL, 'L’actuació sobre la pista esportiva és urgent. Les altres intervencions són de manteniment ordinari i es recomana que les executi l’ajuntament.', 0.00, 'N', '🏫 Context\r\n\r\n    Es va sol·licitar una valoració per filtracions i fissures al centre.\r\n    Es va realitzar una visita tècnica el 24 de gener de 2024.\r\n\r\n🔍 Principals problemes detectats\r\n\r\n    Filtracions greus als espais sota la pista esportiva (gimnàs, cuina, banys), causades per:\r\n        Mal drenatge.\r\n        Impermeabilització deficient.\r\n        Pendents inadequades i esquerdes al paviment.\r\n\r\n    Coberta plana del pati superior:\r\n        Presència d’humitat, molsa i vegetació.\r\n        Deteriorament del rejuntat i de la junta de dilatació.\r\n\r\n    Fissures a l’entrada principal:\r\n        Ja s’havien reparat, però han tornat a aparèixer.\r\n        No s’hi detecta risc estructural.\r\n\r\n🛠️ Actuacions proposades\r\n\r\n    Rehabilitació integral de la pista esportiva:\r\n        Demolició del paviment.\r\n        Nova impermeabilització, drenatge i pavimentació.\r\n        Cost estimat: 232.000 €\r\n\r\n    Manteniment de la coberta plana:\r\n        Neteja, rejuntat i reparació de juntes.\r\n        Cost estimat: 3.200 €\r\n\r\n    Reparació de fissures:\r\n        Obertura, segellat i pintat.\r\n        Cost estimat: 2.800 €\r\n\r\n✅ Conclusions\r\n\r\n    L’actuació sobre la pista esportiva és urgent.\r\n    Les altres intervencions són de manteniment ordinari i es recomana que les executi l’ajuntament.', 328, 1, 3, '2025-07-15', '0000-00-00', NULL, NULL, NULL, NULL, ''),
(264, '229-2025', '', 1, NULL, '', 0.00, 'N', 'Benvolgut/da Sr./Sra.:\r\n\r\nAl nostre centre, degut a les altíssimes temperatures a què s\'arriba, hem decidit instal·lar dues màquines d\'aire condicionat a les quatre dependències que donen a l\'est, que són les que més pateixen (aula de 3 anys, sala de mestres, secretaria i despatx de direcció). El pressupost és inferior als 5000€, per la qual cosa no s\'ha iniciat cap expedient de despesa, tot i que s\'ha informat al Consell Escolar, que hi ha estat d\'acord amb la mesura.\r\nUna vegada comunicat a l\'Ajuntament, ens demanen la conformitat per part del vostre departament, la qual cosa vos agrairia que m\'enviàssiu quan vos vagi bé.\r\nMoltes gràcies per endavant.\r\nAtentament,', 305, 1, 1, '2025-07-15', '0000-00-00', NULL, 1, NULL, NULL, '');

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
(2025, 230);

-- --------------------------------------------------------

--
-- Estructura de la taula `actuacio_conveni`
--

CREATE TABLE `actuacio_conveni` (
  `id` int(11) NOT NULL,
  `centre_id` int(11) NOT NULL,
  `conveni_id` int(11) NOT NULL,
  `codi` varchar(50) DEFAULT NULL,
  `descripcio` text DEFAULT NULL,
  `pressupost_inicial` decimal(12,2) DEFAULT NULL,
  `pressupost_definitiu` decimal(12,2) DEFAULT NULL,
  `aprovacio_inicial` date DEFAULT NULL,
  `aprovacio_definitiva` date DEFAULT NULL,
  `previsio_inici` date DEFAULT NULL,
  `previsio_final` date DEFAULT NULL,
  `observacions` text DEFAULT NULL,
  `comissio_seguiment_data` date DEFAULT NULL,
  `comissio_seguiment_enllac` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `actuacio_conveni`
--

INSERT INTO `actuacio_conveni` (`id`, `centre_id`, `conveni_id`, `codi`, `descripcio`, `pressupost_inicial`, `pressupost_definitiu`, `aprovacio_inicial`, `aprovacio_definitiva`, `previsio_inici`, `previsio_final`, `observacions`, `comissio_seguiment_data`, `comissio_seguiment_enllac`) VALUES
(1, 175, 3, NULL, 'Prova 1', 100.00, 200.00, '2025-05-05', '1970-01-01', '1970-01-01', '1970-01-01', 'cap', '1970-01-01', ''),
(2, 175, 3, NULL, 'Prova 199', 250.08, 500.07, '2025-05-06', '2025-06-07', '2025-07-08', '2025-08-09', 'dos', '2025-09-10', 'hola');

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
(9, 5000, 1000, 3, 2, 1, 1000.00, 854, 36),
(34, 99, 0, 0, 0, 0, 1000.00, 854, 37);

-- --------------------------------------------------------

--
-- Estructura de la taula `centres`
--

CREATE TABLE `centres` (
  `id` int(11) NOT NULL,
  `Ubi_Codi` int(11) NOT NULL,
  `Titularitat` varchar(50) DEFAULT NULL,
  `Sigla` varchar(10) DEFAULT NULL,
  `Codi` varchar(20) DEFAULT NULL,
  `Centre` varchar(255) DEFAULT NULL,
  `Adreca` varchar(255) DEFAULT NULL,
  `CP` varchar(10) DEFAULT NULL,
  `Localitat` varchar(100) DEFAULT NULL,
  `Municipi` varchar(100) DEFAULT NULL,
  `Illa` varchar(50) DEFAULT NULL,
  `Telefon` varchar(20) DEFAULT NULL,
  `Fax` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
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
(52, 511, 'privada', 'CC', '07000081', 'CC La Salle Alaior', 'Av. de la Verge del Toro 86  ', '07730', 'Alaior', 'Alaior', 'Menorca', '971372253', '971378120', 'alaior@lasallevp.es', NULL, NULL, 18, 2, 69),
(53, 512, 'privada', 'CC', '07001472', 'CC La Salle Inca', 'C/ de ses Coves 61  ', '07300', 'Inca', 'Inca', 'Mallorca', '971500365', '971880660', 'inca@lasallevp.es', NULL, NULL, 6, 1, 25),
(54, 516, 'privada', 'CC', '07001915', 'CC La Salle Maó', 'C/ de Vassallo 125  ', '07703', 'Maó', 'Maó', 'Menorca', '971356114', '971356319', 'mao@lasallevp.es', NULL, NULL, 16, 2, 34),
(55, 515, 'privada', 'CC', '07002181', 'CC La Salle Manacor', 'C/ de San Juan Bautista de la Salle 2  ', '07500', 'Manacor', 'Manacor', 'Mallorca', '971550278', '971843362', 'manacor@lasallevp.es', NULL, NULL, 19, 1, 30),
(56, 513, 'privada', 'CC', '07002440', 'CC La Salle Pont d\'Inca', 'C/ de la Salle 15  ', '07141', 'Es Pont d\'Inca', 'Marratxí', 'Mallorca', '971600249', '971607771', 'pontdinca@lasallevp.es', NULL, NULL, 22, 1, 33),
(57, 514, 'privada', 'CC', '07004333', 'CC La Salle Son Rapinya', 'Camí de Son Rapinya 29  ', '07013', 'Sa Vileta', 'Palma', 'Mallorca', '971606397', '971606381', 'palma@lasallevp.es', NULL, NULL, 20, 1, 38),
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
(854, 0, NULL, '<br />\r\n<b', '1', 'Centre de proves', 'Prova', '07000', 'Prova', NULL, NULL, '1', '2', 'e@e.es', NULL, NULL, NULL, 1, 40),
(859, 0, NULL, 'EI', 'nou', 'EI Santa Margalida', 'ajuntament', '07000', 'sta margalida', NULL, NULL, '.', '', 'd@d.ds', NULL, NULL, NULL, 1, 52),
(861, 0, NULL, 'IES', '0700000', 'Nou IES Lloseta', 'Lloseta', '07000', 'Lloseta', NULL, NULL, '666333333', '', 'prova@prova.eu', NULL, NULL, NULL, 1, 27),
(862, 0, NULL, 'CEP', '07509017', 'Museu de l\'Educacio', 'Avinguda del General Luque, 223', '07300', 'Inca', NULL, NULL, '971 50 42 79', '', 'museueducacioib@gmail.com', NULL, NULL, NULL, 1, 25);

-- --------------------------------------------------------

--
-- Estructura de la taula `centre_conveni`
--

CREATE TABLE `centre_conveni` (
  `id_centre` int(11) NOT NULL,
  `id_conveni` int(11) NOT NULL,
  `pressupost` decimal(10,2) NOT NULL,
  `observacions` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `centre_conveni`
--

INSERT INTO `centre_conveni` (`id_centre`, `id_conveni`, `pressupost`, `observacions`) VALUES
(175, 3, 101.00, 'cap');

-- --------------------------------------------------------

--
-- Estructura de la taula `conveni`
--

CREATE TABLE `conveni` (
  `id` int(11) NOT NULL,
  `codi` varchar(50) DEFAULT NULL,
  `descripcio` varchar(255) NOT NULL,
  `ajuntament_id` int(11) NOT NULL,
  `estat_conveni_id` int(11) NOT NULL,
  `data_signatura` date DEFAULT NULL,
  `data_inici` date DEFAULT curdate(),
  `data_pagament` date DEFAULT NULL,
  `pressupost` decimal(12,2) DEFAULT NULL,
  `observacions` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `conveni`
--

INSERT INTO `conveni` (`id`, `codi`, `descripcio`, `ajuntament_id`, `estat_conveni_id`, `data_signatura`, `data_inici`, `data_pagament`, `pressupost`, `observacions`) VALUES
(3, '2025-1', 'Conveni de prova e', 51, 1, '2025-04-16', '2025-04-03', '2025-04-16', 500.01, 'Primer conveni 4');

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
  `nom` varchar(255) NOT NULL
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
  `nom` varchar(255) NOT NULL,
  `url` varchar(1000) NOT NULL,
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
(46, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EkF8gDHhn9hDvlVRerUUt0EBHBAUpPybdWmweN9B1bKlTw?e=LjU1Ut', '2025-05-26', 62),
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
(89, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FIES%2FMallorca%2FIES%5FSArenal%5F%20Llucmajor%2F25%2D04%5FDesprenimentReixaMet%C3%A0l%C2%B7lica&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9&ga=1', '2025-05-27', 100),
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
(113, 'Carpeta dels presupots', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EayyVffG6_tAok180uCV8icBSf5ct4AWCUqUCdy823gXEw?e=cpdcKO', '2025-05-19', 128),
(114, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ev92d4mKZxFAqGaLBDI-wDYBdV2RWyK1rSIhnFKGqqzy8Q?e=eGXinD', '2025-05-13', 129),
(115, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EWAOsB0ozd1HjTek2MjBgF8BkTYpBfcvgvhulPVhqfCjgQ?e=gItCzA', '2025-03-12', 130),
(116, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Ee076WvCN79FgZEvOgf4q2EBjOXAUUsObDCP5Rz_axCGeQ?e=3msjX0', '2025-05-19', 131),
(117, '@', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EXby6H0lnFtEquFlhen8zaAB0pb8dFpq0x-OzpeurtWJqQ?e=Ywe3yE', '2025-05-20', 133),
(118, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EoEGqYw2_xhBgrNF0IW4sDkBqLW_IPSP1pe76aYCMb61_w?e=c6mjC2', '2025-05-20', 134),
(119, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EuWR2ebLF4BCuVwBsTAJyW4BglM9WxwdkAMrv6DEH6vz-A?e=RWZbbB', '2025-05-21', 136),
(120, 'Informe. Según todo lo observado podemos concluir que los ejemplares de Pinus halepensis tienen deformaciones irreversibles en su estructura, teniendo un alto riesgo de vuelco completo del  ejemplar por los fuertes vientos o lluvia. Dado que la ubicación', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ESLMb_GlxWBNjmdE5qCqQE0BfubQXmunS6AxQLIx4IvBiw?e=sjAOy3', '2025-05-21', 121),
(121, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EmlF7asjxCxNrAYV3f4yJ2oB8vwWweC-MN84qk33q1n-kg?e=7fTT4P', '2025-05-22', 137),
(122, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ESbaNO6yiRRFrMPfRMtWjqgBu-qYR6n9KTdLl1nZqjShJQ?e=DPpkyn', '2025-05-23', 139),
(123, 'Nota interna d\'IBISEC', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ESbaNO6yiRRFrMPfRMtWjqgBu-qYR6n9KTdLl1nZqjShJQ?e=ursL6H', '2025-05-23', 139),
(124, 'Plànol', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EbFTox9ZGhxLjwpK2NnorD0Bb6QI--_j8XM8IlFuRrp8xA?e=3rYxyJ', '2025-05-23', 139),
(125, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EuQezSIVETdKltPXjAtVn64Bx79b2vT-7QJoWW9-hyhb8g?e=kOIuSB', '2025-05-23', 142),
(126, 'Projecte paisatgístic', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ERbmP7h1lLxCipMAKkl0BC8BEsJCFnU1WzlO0l5LLHwWAA?e=EakpIl', '2025-05-23', 142),
(127, 'Sol·licitud', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ETZp04MNsxJCngs6YQoYengBzWqmoHB2WVq1NS_-ktCQ8A?e=j9c4Kd', '2025-05-23', 142),
(128, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ehq6Thc4_aJCtd83KIkRCqwBE5y9jPaDrjXDtE4HeHvUJw?e=8wNeCh', '2025-05-23', 143),
(129, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:v:/s/InfraestructuresEducatives/ESTWgiMlpH9CgqTzV464KTEBR65pwe2_f_szfEShbvqDWg?e=bIw9uS', '2025-05-23', 144),
(130, 'Foto', 'https://ibeducacio.sharepoint.com/:i:/s/InfraestructuresEducatives/EQjNFIn7HfBPhnxSgOUl7VQB4TIWKD0e-KOoCxPhx_dB5A?e=vYnpJt', '2025-05-23', 144),
(131, 'Video', 'https://ibeducacio.sharepoint.com/:v:/s/InfraestructuresEducatives/ESTWgiMlpH9CgqTzV464KTEBR65pwe2_f_szfEShbvqDWg?e=uhTqIY', '2025-05-23', 144),
(132, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ev7SbIc9NbhPukbPb7YsK5UBdjf-FOHmgTwIu6dlWstvoQ?e=UxBhIf', '2025-05-23', 145),
(133, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EskCWviv4s5Fvb3Pk46uZrsBnlnlns39Bkdp-aYgGuVDWA?e=17TahP', '2025-05-23', 146),
(134, '@', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ERj_49Lo8JpOrBbSQ6GnKsMB-67uKjcakrrUh3qDGexglA?e=hI6wPe', '2025-05-23', 147),
(136, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EafpZy140sZNoo6g8lSw5RUBou1hJlPfpV23h7SFzn9_nA?e=lfsy3j', '2025-05-23', 148),
(137, 'Video', 'https://ibeducacio.sharepoint.com/:v:/s/InfraestructuresEducatives/EVyHPwzvSZhEjsDcpVwNx1wBXUTMnUFRveUk9v9OIroT8A?e=7wB6Lq&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D', '2025-05-23', 148),
(138, 'Desperfectes', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EZPZv1hQLbZAtMM5mHD7f1wB-MnyX3GuMEesGpAUtrCg8A?e=xDanpB', '2025-05-23', 101),
(139, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EscZqCd_wnRBitnRwKr24EoBvTK2w8pnGLqb_QxONIzaRg?e=4tl5kN', '2025-05-24', 149),
(140, 'Pressupost', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ER_POdz3I1tFhx8qSp2qOHYBNz0kw-rWt8ssL_lQuKuN8g?e=i9MSal', '2025-05-23', 149),
(141, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EjzEN5LAi_NHrtTWg10oHLYBOS7aHL1-jBmaPu-FI4vTlA?e=PWMg6t', '2025-05-23', 150),
(142, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ERRZoq-sZY5HspuhbM16AtQBrI7GAjAF_UHXqa6Po3Z4aA?e=1ugbQS', '2025-05-26', 151),
(143, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EatVs7NBVhFEpoSCH_SPHIMBzjR1FE6v2WN5_rojvd582g?e=HMRUcE', '2025-05-26', 152),
(144, 'Pressuposts', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EatVs7NBVhFEpoSCH_SPHIMBzjR1FE6v2WN5_rojvd582g?e=nvJze2', '2025-05-26', 152),
(145, 'Pressuposts', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EviY6wox9nFPgPcD0NmfCQoBEAbxFOhm-cUX5Kms6T3rcw?e=VN6zRQ', '2025-05-26', 62),
(146, '@', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EU4hxwa1LodKiA5qBLi4R2kBQHAEnyr1NGBp4FD3aLjEQQ?e=bdtjJb', '2025-05-26', 62),
(147, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EkZ176F8to1LhGd2bI7id_MBI_VlYltK7dQ8DBAzz9SLow?e=mH81Eq', '2025-05-27', 153),
(148, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ElaYkzeLQilFuSUhKv-q-FQBtrkyNmA-XFYrZM2kHzVPRg?e=upxEag', '2025-05-27', 154),
(149, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Em5ussh5bIlDnDKAuoY0OREBL5TLW39nVn7IHsKr4jmvig?e=T04gTw', '2025-05-27', 155),
(150, '@', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ETLkM2wiC55KpK5QrnHCwKgBkcjSYlurWK25zoTbdaY_JQ?e=sKTb6t', '2025-05-27', 156),
(151, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EoRKwtQ3T-BLoi__DDVo3fYBvKeesRcCcugvlvJOLE-xwg?e=yjohzv', '2025-05-27', 157),
(152, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EThQp3wkIw1Ls2q_WAVI5q4BxvrB5awubYgqHr86jtN50w?e=5Qs7PR', '2025-05-27', 158),
(153, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Esr4zdZskR5CtgYcnpJk6XoB_j9zkgPeMytXQv6my8i1cg?e=IrV7jX', '2025-05-28', 159),
(154, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EhvvbryaZ8hPuT4MbgYlOf4BATysS4Eb1cUc0u400dGbBA?e=NE7yIO', '2025-05-28', 160),
(155, 'Projecte pati (Només online)', 'https://drive.google.com/file/d/1BYGnmwdyuOoIUiVSiVSZ0FZfgbLP5zt6/view?usp=sharing', '2025-05-28', 160),
(156, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ETsn8HT4jA5KntY6ttjcutQBP38UdV0q6oQ4GvL5iyiCrQ?e=8e4dlu', '2025-05-30', 161),
(157, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EcGuOWepRLxAs3gV0aH1StYBEW6zHWuE76HEjHKBVw0VGA?e=GBYvaj', '2025-05-30', 162),
(158, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ep2O7C5n8_ZModzRRZI16FgBIQKKugn1koDPVPITV1wfhg?e=oENPWs', '2025-06-02', 163),
(159, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ek-C7I26HaNAqEMMdClHzFgB_-kEf-6h1phYNRhHKgbx6Q?e=7Gg7lL', '2025-06-02', 164),
(160, 'Fotos', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EaKAVco7SnBNliKtY5sWJGIB_QB0kkUbY85aunb_dtGtOA?e=J2wJYn', '2025-06-02', 164),
(161, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EchpVHLikK1PiESNLFLnBTcBS9MUHQNP5-Dmv9hQnssT6w?e=6WSYbX', '2025-06-02', 165),
(162, '@ 02/06/2025', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EaQ1TZpDREdPqti8CnUA7jgBL820Rm_bms9479KRWggvNw?e=6OCgez', '2025-06-02', 165),
(163, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eg870uQBxBlCiaZc-MmQcZoBnxm6q5S_ih18xQ3rCzWxKg?e=r6WEjH', '2025-06-02', 166),
(164, '@', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EWQA92z9RkBJoH6y7IPR6DQBX7LpzqdsbVVPYh-HimrVeg?e=FzJ1Sf', '2025-06-02', 166),
(165, '@2 Mes reparacions al centre', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Ed-5VL91nE9OmCT-SJVPPLYBZh1HWuzjd7kLKq2ozh8ZCw?e=wK82H0', '2025-06-02', 166),
(166, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EvVrMlhmBdtDkOWh5sVclxABmHVQA_j1NsyDFr0LTz2YkQ?e=fKCus1', '2025-06-02', 167),
(167, 'Pressuposts', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EspE3tbeii5OuuQxumFhLdgBOSc7osBC5tWOhzP7QDm6tQ?e=tSAmVf', '2025-06-02', 167),
(168, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EeDLmIvDV7JCoqLdukVj-LkBr0LoUAmpzc3ztdFWpwwMqw?e=VrWaNs', '2025-06-02', 168),
(169, '@ resposta', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EXXPWqNajapHkU3mapXOeFgBy5xR9aiLdf6CtY1bAQcqlg?e=YCpk8j', '2025-06-02', 169),
(170, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EnS_S3wEKMlDuPGajLhWjEcBs-hCAVbLm7J9BSXOrVyzAA?e=gYjsDf', '2025-06-02', 170),
(171, 'Projecte', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eq0PeOlncQVKq_9MkXbfIF4B3RFb-u6cPu5sgEh4aVqRvQ?e=NAvtBL', '2025-06-02', 170),
(172, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ekyy6jul7V5Csw1mAr0Aj6UBriakS9KLk9hg3Zu_Cc1_Pg?e=o1GeOW', '2025-06-02', 172),
(173, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EUQ27J2H96BMrzuAdSAfcjABMbj_A8qt9TghT_lLw18DxA?e=dhL4KF', '2025-06-02', 171),
(174, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ErkazeaQSzpPuQYLAhlDrPIBQJFqovg-ZVW3GpXEdA_3Jw?e=q6J1aA', '2025-06-02', 173),
(175, 'Document de Sol·licituds amb fotos i vista aèria', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ETjZN1-e72lJiIPZrwlnPfoBkmuYt-plErhgzxnl41wLZA?e=vJ70yo', '2025-06-02', 173),
(176, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eq6-SwUaevFChmPd_T_j_2YB8vg0m9I5cLqbNFmvwPTsQg?e=fKvJmf', '2025-06-02', 174),
(177, 'Pressuposts', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eu4vgTNy8i1OrU0W2wVN2T0BuDDK2qf0a_DzrDcfSM0qjw?e=duRi6p', '2024-11-29', 137),
(178, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Ee1zOfOmE9pGtKx9qP4STB4BJw-KyVd3BiOHgcW4azCNVg?e=XQ9Rwo', '2025-06-04', 175),
(179, 'Petició Obertura', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Ee1zOfOmE9pGtKx9qP4STB4BJw-KyVd3BiOHgcW4azCNVg?e=ZM4Prk', '2025-06-04', 175),
(180, 'Pla de funcionament', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ERTOH3rbqVJMsznZaMy6bjQBLtqblb_Kf_xm-HsVt2Tyog?e=SXPOE1', '2025-06-04', 175),
(181, 'Aprovació Consell Escolar', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EeXpNMO0yJhIgfz6PqGPUjYBN2xJ5NCCFURqQl5YbmcFww?e=mbqHhw', '2025-06-04', 175),
(182, 'Ubicació', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EYPt-dGTLElMs6xKYeFx8MgBmyToSVgDOqxDrM2PrfR-hQ?e=bFnGCs', '2025-06-04', 175),
(183, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EqYpqGNJ56hLg538A9M5cH8BdhR-Ic2aAoA8JVB02zwxng?e=H6yhn4', '2025-06-04', 176),
(184, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eqv6ohUf1s5FpO-UYIPv2A0BiTex9l7WQfG1QvbJ8xG3aQ?e=rUqhTD', '2025-06-05', 177),
(185, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Ee7A4EB-ci9Chm3lYpmJqh8BspVw-vincAbOddWKV-5FSA?e=ED7R1n', '2025-06-06', 178),
(186, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EjVNtc0_W4dAiUGJje5Tmi4BHTYQZ-PIvLk3PG60CjOwuA?e=9p8bXx', '2025-06-09', 179),
(187, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EgK5cxBoPwZMivh6hp-dGr4B5B43tYqIMAGky3ZlqCg3Hw?e=QRW4ir', '2025-06-11', 180),
(188, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP%5FJaumeFornarisTaltavull%5FSonServera%2F25%2D06%5FSol%C2%B7licitud%20Climatitzaci%C3%B3&viewid=57087ec9%2Dd3e2%2D4a1c%2Da68b%2D13347f94cfc9', '2025-06-11', 181),
(189, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eh2u9MLfgGZJpF5S7N4B6d4BV9sUQ1B6sefLF4lcPoEg1w?e=fyDsYo', '2025-06-11', 183),
(190, 'Fotos', 'https://drive.google.com/drive/folders/1--sjwmM6DPodxMl6o4x17VbJKJEEI_W6', '2025-06-11', 183),
(191, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ErZx42jH0QRMuENF6Zq6CBYBJVo7tEP8815YtArk64VSog?e=DZtI6t', '2025-06-12', 184),
(192, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EhA25fPkz-9IiQ_Y-UIZ5KcBIAAQaY5_W5NYqYEVdfUWtw?e=gJX52k', '2025-06-11', 185),
(193, 'Video', 'https://ibeducacio.sharepoint.com/:v:/s/InfraestructuresEducatives/EVyHPwzvSZhEjsDcpVwNx1wBXUTMnUFRveUk9v9OIroT8A?e=khD2zr&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D', '2025-05-23', 147),
(194, 'Aprovació del projecte. Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EvnlHjjvJ01En6ss88QAxAkBuUTtZDziv10BSWvsanQa6w?e=1jLmna', '2025-06-12', 186),
(196, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EgVdyPAwejpKjKBSSwCjtegBu2wnvEimL2sYmazEofWIVg?e=yzjirS', '2025-06-16', 187),
(197, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EjzzF1PLdFhLkXaJ2rt1A2kBWsQ91Q9szvZdtu2drGx-EQ?e=cGuzgf', '2025-06-16', 188),
(198, 'Fotos', 'https://drive.google.com/drive/folders/1ylUNOEgamRfcnGjG7hrJR-qISSIsDJ2h', '2025-06-02', 171),
(199, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EmCVr_r4vupJlUX2bAd2kXMB1ANJUCeK9FOKSxp2sunYYg?e=COt1fr', '2025-05-23', 140),
(200, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Er9jj44zFktJrZzUEpgG8r4BD2_XNgL52RawT9nm5WS09A?e=DnWjC0', '2025-06-16', 189),
(201, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ElgTmPlhpzhOhjCsm9VJCI8B-UdZvD6h8lbV4rZos9ZebA?e=jesS0w', '2025-06-16', 190),
(202, 'Escrit de sol·licitud', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EfdRRmQcr9VDowX7dgbGJHwBySff-lJqfwM_x5gRX4HanQ?e=uqjjef', '2025-06-16', 190),
(203, 'Fotos', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EUGE5CFw82pEmzTV8IdRMmEBlXDyos3Ie9NHQWxXisZC-w?e=I8Y6fK', '2025-06-16', 190),
(204, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EjYAN3ZMTrVIqOr0ojikd_sBvbg-7rKfaS7NI6Xiu7kUWQ?e=Wd1pK1', '2025-06-17', 191),
(205, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EUNbrkXqMsFJvvcE-Ucj-WUBL1FzcPN_hysGRppBQTNTnA?e=J1vtx6', '2025-06-17', 191),
(206, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EWrwV7Z1YDRJkRcsQbC4dK8BU3LNheBRkRKftC_jZ2IleQ?e=RdaLi2', '2025-06-18', 192),
(207, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EukXe9576pNPnnmybZ5a4KgBGY38agYdCkayjox8IdedEw?e=VXRYTZ', '2025-06-18', 193),
(208, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EmxeW6PPXMhOh8rLoORJ0foBljQhHW9K8tvDy4gu6wRCkw?e=7ZtXsw', '2025-06-18', 194),
(209, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EiiZAi1yPRxFiUXT8iNKHsEBflCy_xbEU3hKtF34tXq2NA?e=L7YLIU', '2025-06-18', 195),
(210, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EsvmayWOxlVEqai4B32WBNwB-o25bGfVIGoGqn8ln_WMAA?e=c4hPei', '2025-06-18', 196),
(211, 'Petició rebuda a traves de Mateu Sunyer', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ETjbJIEpULtKgOXQilhvGjMBg5pD32ObiU0bAthl5rPLJA?e=Tcff2h', '2025-06-18', 196),
(212, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eitoc_w2gdhLojuqu3PRSJoBk9BYqml-UzAP7W6pHZOBJg?e=1kEghX', '2025-06-18', 197),
(213, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EvIpt_oI8eVAh82GMrQsb7MB0l10k7sZy8rTtWOcbdMAGA?e=NacHzC', '2025-06-18', 198),
(214, 'Memòria', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EX6RA90cxy5Mq3Q69AbXdGcB-WoAAL5Z_eJwaX0ptIrodQ?e=6ogpN9', '2025-06-18', 198),
(215, 'Plànols', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EXIWDmLa5TtBu5tXDNoD4WgBZFwxozFnuwyujKeemyNGtw?e=JTCqzg', '2025-06-18', 198),
(216, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EiJlyR688FJAozOC-FoGYm8BdhkxgBzRr4cFzc6shM1uqg?e=y0BuO1', '2025-06-18', 199),
(217, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EgVoqG1inqlJh5YtWecJwlQBW5mw5CmRR1cv-ELVP8p9yA?e=hR50ET', '2025-06-18', 200),
(218, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EgG8deaTjrxFvQtZgh5GwFQBE9XtAi2YI-pZ6JdLvqlZ2Q?e=rmQ3qc', '2025-06-19', 201),
(219, 'Fotos', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Emi1fqtQ46pEt2eUmBYzLdQBrEgE_gPUk2LE6HBk2dMQ-w?e=tw6XMx', '2025-06-19', 201),
(220, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ev87gFQPvadMpEV10HY4TcIBdjd_eE3XCuXvZW0UBBAYDA?e=qdMjHr', '2025-06-20', 202),
(221, 'Video', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/_layouts/15/stream.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FIES%2FMallorca%2FIES%5FSonPacs%2F20250620%5FFissures%5FFa%C3%A7ana%2FWhatsApp%20Video%202025%2D06%2D13%20at%2013%2E38%2E11%20%281%29%2Emp4&referrer=StreamWebApp%2EWeb&referrerScenario=AddressBarCopied%2Eview%2Ef517110b%2Dce5e%2D45b3%2D999d%2Dd200c160ff15', '2025-06-20', 202),
(222, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Egn2JVPgcthNgkcZKRkXBOwBu0njSOlp0aN7HHhXVn-9lg?e=IlYuQf', '2025-06-23', 204),
(223, 'Fotos', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EiC-K9IBtHBMpalKyf0adjoBktnrEBZ1PT8W6ayxp3j18A?e=mC9GNI', '2025-06-23', 204),
(224, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Egs26f14PPtDqEZ_8gMFicwBXRDbroaYtI9IZ1Pc9jMpaA?e=aESDwj', '2025-06-23', 205),
(225, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ejtjs07h0QJIqGVMRbUltokBtTB8TWKDUPVqD4QQSMydlA?e=6wIXKG', '2025-06-23', 206),
(226, 'Pressuposts', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EjL8ONgvfkRGrztHpmOswcUBvRMk8xCbafK2nn2-oS8DEQ?e=gaoB02', '2025-06-23', 206),
(227, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/sites/InfraestructuresEducatives/Documents%20compartits/Forms/AllItems.aspx?id=%2Fsites%2FInfraestructuresEducatives%2FDocuments%20compartits%2F000%5FInfraestructures%2F1%2DCentres%20Publics%2FCEIP%2FMallorca%2FCEIP%5FEsFossaret%5FSoller%2F24%2D08%5FFanCoils%5FSistemaClimatitzaci%C3%B3&p=true&ga=1', '2025-06-25', 207),
(228, 'Pressupost', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ESDyrFo7avdBoEx2A8KybsMBgAHpTxFEW5-OEGNFUWVqsg?e=bOa3nO', '2025-06-25', 207),
(229, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EooPHyZJWvhOi02ohMCfejEBkw5ocl716ahvuzOVKdU11g?e=F1ietP', '2025-06-25', 128),
(230, 'Carpeta Fotos', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eo-urqhv4GRBhTy9ZbtDUl8BHIaQ18RJ3x924Z0iRhw35Q?e=MZnWLa', '2025-06-25', 128),
(231, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EnqYplVI761JmCNTDpRshH8BFE0UDhuaWJTuILbSekkrcw?e=yfKE1z', '2025-06-25', 208),
(232, 'Oferta', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EZ3VPOdCqhtBjPys1Y3__wYBT3Z-e1Ey9M1QRVBASXzXHQ?e=EwVoyi', '2025-06-25', 208),
(233, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EuI3pS8DL5VCp7BCON0YRnABtj-ZGaQ5uGd3fmu8zax0pg?e=Ib5SwP', '2025-06-26', 209),
(234, 'Carpeta dels fotos', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ej1d6tomUdxLlELLoEMeO1gBje17jUin6kwIrTG7bw1NQg?e=QKAWQ3', '2025-06-26', 209),
(235, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eis-Fsy45-9DlmxTQRFMbiYByBXxTCrzROH1NM_yZigQkg?e=mbQpjb', '2025-06-26', 210),
(236, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EhaOKnzaOaBJqr-un8y0As8BXlch_LXgWypZyK7lMUmkJg?e=Vx5f3s', '2025-06-27', 211),
(237, 'Carpeta de Fotos', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EvvsyXyyPelDvH146xszDP8B3Vk9zH-obCDB_QX6VfL35w?e=13LPPC', '2025-06-27', 211),
(238, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ElIzMIaq3YdEgQ_B5oFaA90BWuZDC1Rq8yK4dVuBfr247w?e=aYZONA', '2025-06-27', 212),
(239, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ElIzMIaq3YdEgQ_B5oFaA90BWuZDC1Rq8yK4dVuBfr247w?e=aYZONA', '2025-06-27', 212),
(240, 'Pressupost', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ET-wPauQ80hHqXMrQQXIR6gB3zKTEKcaLPhYdNVZJAfFuw?e=SeF2XA', '2025-06-27', 212),
(241, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EkprIpynWf1Di2lbkLWeK0gBmhBNejtpmSVUtt8Qwzc6nQ?e=RUsdi4', '2025-06-27', 213),
(242, 'Carpeta de fotos', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ElTkPrYpbgNGnFge_AWiD7oBMQ-s69H9Z_8RWNSp1UWGaA?e=t9xjW8', '2025-06-27', 213),
(243, 'Pressupost', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EeQinTt3yX9DnWnFvEqtBcIBlrYYBxCcnQ81UjM4RvAaWA?e=BO3guW', '2025-06-27', 213),
(244, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EqUYnaryoE9DpLz-D92UursBah9DtarcfQh6SuWXHK6g6Q?e=W3FIuO', '2025-06-30', 214),
(245, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EgxxpSJtFChMvWc7IkpLQuEBz_zqqZkjpgTlPFxE5hbvag?e=QN3LiJ', '2025-06-30', 215),
(246, 'Carpeta dels documents ja hi ha una carpeta creada amb el nom 24-10_ JardineresLateralsPati', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EljpBAmsl31HpUjoPvaZLCsBxKLJl6lOeM48vIWtVJNr6g?e=lk50hs', '2025-06-30', 216),
(247, 'Carpeta de fotos', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EvYVBQVEOP5IiPN--gsFQH4BJWwcuTNGoz8fqMx_J4YNGg?e=QyfJE7', '2025-06-30', 216),
(248, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EnHzafwRBGtAl5XsCkUJTUQBTvZ9v-NCbdpr8XtoVjbqew?e=1ojzcX', '2025-06-30', 217),
(249, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EstoeaXujN5MkXZXfr-ex6UBIQz5QjMroa-gSYF9OVGubQ?e=tK30m1', '2025-06-30', 218),
(250, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EndelPZ2nvhPkMCnQScB6NoBPhZayHgXQ2tHd4w7KQJNqQ?e=yvsyIE', '2025-06-30', 219),
(251, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ehc1z9ca0gBFjutW8ViMOUIB5PaEl18TcQnS7i3ejDLRew?e=h46hBe', '2025-07-01', 221),
(252, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Es_jddMDEX1MgfSZckHAOWQBwYP8qvgPsAVnF9ETAKcgpw?e=EdVhEU', '2025-07-01', 222),
(253, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EjHLxReUrJRNnSpMj3hd4sYBLzKMM5J8_YKyXfG_ude5uA?e=6jSOhr', '2025-07-01', 223),
(254, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EvT-tZomzdRIkwh_hrQqpiMBQwuufOoHt3tpsCzNYYA1Mg?e=lfvqDe', '2025-07-01', 224),
(255, 'Acta Consell Escolar', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EUpAykGiNsVHnpF4KuE6dKQBG5OEOb82IF9mz1NYRCBQ6Q?e=patOcj', '2025-07-01', 224),
(256, 'PLA DE FUNCIONAMENT DEL MENJADOR ESCOLAR', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ESsgN811-e1BsHw0ZRm5iAkBDUa1_QG8fyuKsznFoqEP5g?e=5pEbQt', '2025-07-01', 224),
(257, 'Plànol Situació', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Efnva1uDv8dKtWzpUAoh75YBgLLQbbRbzU81mT1UQk7MSg?e=LMmmzq', '2025-07-01', 224),
(258, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EvOXZ4veEbBPn2AlGZpx6P4BDI_Rq0_3pq6VwWdftbioVw?e=lNq7aE', '2025-07-02', 225),
(259, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EmwxhVKVY3dBnX4fpSkwtt4Bm01X2-yHjDJ8xgylgNQYxg?e=DtFnWe', '2025-07-02', 226),
(260, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Epot1gF-6_9Mn8-Y7Vfl4hUB02xYX_aWY11o0qalR9gfmQ?e=elKMZ4', '2025-07-02', 227),
(261, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EtIuXyAKAUZGjcvBl9kYG3UBEX6uVKKL0CLmSKJzTDLO6Q?e=tDaHza', '2025-07-03', 228),
(262, 'Carpeta dels pressupots', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eoz8t1E9yvhOixYKVzpcK28BfJqDBkCuobnFEU7XPHdl9g?e=WjnSYA', '2025-07-03', 228),
(263, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ET9C9oldaupFn4-_gCXJKtUBAm1y6mBCHB5o_rcEKY1J1w?e=Wd4VrK', '2025-07-03', 229),
(264, 'Carpeta de fotos', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EtqEZ6Y5whRPq0plgXa3__MB9oD4jq4MhEWzXAEcLi3waA?e=HUB7lR', '2025-07-03', 229),
(265, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Es5cBAydFN1MnDy7grQkVhcBSZ3ewgCOor1lHUxF-Os_qg?e=lconOb', '2025-07-03', 230),
(266, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EukB4ZtgwfVMkOt0FN9zflwB3yKbZhP08AjneCAzqWia0g?e=AuX92b', '2025-07-03', 231),
(267, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ElZzHStDaCRLgsQn_aYxVtoB0xl-54mQcXe-qUCFdu3fbw?e=R8m4nN', '2025-07-04', 232),
(268, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EnIh_Frbs_NMnk-U0HBjMR8BSRuAZQrgeAHRDRJN8_BYyw?e=i8PckB', '2025-07-04', 233),
(270, 'Carpeta de fotos', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EoreIqig7WxCqKt2fDO5aA4BZHHIWm9leBWNiRlsJalENw?e=BwOXnt', '2025-07-04', 234),
(271, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EdqcevsAtrFAst9a1MJ2U8QBjpvtbFH5kCIuxqbvZBGZnA?e=NMQGSF', '2025-07-04', 234),
(272, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Evz6DTC8VLpFtK9oybbXPKMBzBnySgzIcXGeYg6RJDjccw?e=Noc0dX', '2025-07-04', 234),
(273, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EZDTAzSLDc5HqEsMAfYa_SYBQb8P1unefo5VVQh3oz-JsA?e=ltgDiW', '2025-07-04', 236),
(274, 'Carpeta de fotos', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eu5OHayvb0JJkX6a2eoGiikBs8FC6XEQ-lW6W6WKigEYoQ?e=sQjVtR', '2025-07-04', 227);
INSERT INTO `document_actuacio` (`id`, `nom`, `url`, `data`, `actuacio_id`) VALUES
(275, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EkQwCJgpPrlHj2n6Ob7v8QABQaTR4QMGVSGePL70qsj1Lw?e=QRoZRq', '2025-07-07', 237),
(276, '@ resposta Toni', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Ed3hVFluvM9MlzDSLZRSGlMBP-lKAaPENhj6KR21i9ZS0A?e=KawyGl', '2025-07-07', 237),
(277, '@ resposta Toni', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ESN0LASZhFhHu69qvwzPJowBpO2PR7XHep9BdMiMJGk8zA?e=gqEfGx', '2025-06-18', 237),
(278, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EnWyLZRrAmZMivNd6aF0sSsByhFPQLOFWTPqoC5zNfRf1A?e=Yzt6EG', '2025-07-07', 238),
(279, 'Carpeta de fotos', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EuMwdncBGHZMh3ZM5uO-4rAB8FiHuFWHI6ij3_C-lfpTmA?e=xeLuWe', '2025-07-07', 238),
(280, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ErMKcvvOu8lIkE5NCn5FcxkBSdJ4HSkFzXw01BUpAfpanw?e=4y1Txa', '2025-07-07', 239),
(281, '@ a data d\'avui', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EayUFk1SsqtHrefxVtfJQj0BqWdXAYDwimUIpuzXqJgNZg?e=aqU9o6', '2025-06-18', 239),
(282, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eu9mgg0ZS9VFlaehEjHktYQBJeQqSCoJpSauNN_AWYxbGQ?e=SLCBjs', '2025-07-07', 240),
(283, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Eu8y-wC1eG1JueOa8DqSQrkBnsASmUdpMlNKUKvRFr-QAA?e=4Lmvu0', '2025-07-08', 241),
(285, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EiBDXynnwVtAn9rdPbzys7oByzlM5TBgDV1Jn368r2Ibvg?e=SJCeED', '2025-07-08', 242),
(286, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EvvH-rPETutOp6U55OTDzUoBVf-Dw1irH4yCBrzVzvaUPA?e=AMgWKf', '2025-07-08', 242),
(287, 'Carpeta de la ubicacio dels ventiladors', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EgRV2V2dQwBLoIP20dC3qSIBVBsJMemfruyVwlnRePMouQ?e=GYECEH', '2025-07-08', 243),
(288, 'Carpeta de les aules', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EtokY6om48NAoKRdUDb0BZsBC0DeYaziT2oYigGW3dGrQQ?e=4yCdx6', '2025-07-08', 243),
(289, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Ef686kCvE85FicoUp04mehAB7gdl7aJVKhkbedS-FDZNkQ?e=DcGA3i', '2025-07-08', 243),
(290, 'Carpeta dels documents 08/07/2025', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EXV9apTjgsNPpu6LbrG9NDQBxNZFVMq1h3dcTtxrFMyXVA?e=tVKw8A', '2025-07-08', 228),
(291, 'Carpeta dels presupost 08/07/2025', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EfmQVoKViBNJo2pe74NLaWkB57H0_WuncH-Tdl0FS7gtRw?e=vxMx7i', '2025-07-08', 228),
(292, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EpKlnYg47kFDlOa5ZvYzsLIBgtYhNHLtlqPNRbbeWuLhuA?e=FUUC6I', '2025-07-08', 245),
(293, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EYLlL0zc0ftJs0oKLNOebaABiJdTYnwzoYfkkBVlvmicyA?e=4JdeAE', '2025-07-08', 246),
(294, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EgTp_sGeUW5LjllsCXhMg-wBrWc-8nQOBkocXpmTJ48qag?e=A5T5dB', '2025-07-08', 247),
(295, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Eafo_yYOX-5Pq4X9P8XgQTwBxrRDaNLlc7xcZYr0nEiGDA?e=bqNkwd', '2025-07-09', 248),
(296, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EVrnLQ5xqGlCj4G9xiYl3bQBY0sb9TkRTrqHP36Z4-_CMQ?e=588aPZ', '2025-07-09', 249),
(297, 'Informe', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EaJ_7i2xzAJKiD4dWzVCHoQBgw7fVLD_xcAyBm30WYfpQQ?e=EyWEl8', '2025-07-09', 249),
(298, 'Recepció Mail', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ET1WQSxhYsdEvvPKeXTXCyUBJQT-WMeKL2wSJmrg2GfMYA?e=EupKdv', '2025-07-09', 249),
(299, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ETDN7q5UbfVIi5hUCCkOJWMBeNK51_rZ8DkeP1zM0VtovQ?e=ol9Qci', '2025-07-09', 251),
(300, 'Oferta presupuestaria', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EXXBE8Yt2h9MhzNOg_viVwYBeafHnkHuD7dvBI-WWENsXg?e=2e0A0U', '2025-07-09', 251),
(301, 'Confirmació mail', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EXrGGAy1yzFFt6LpVPvoI8sB2qf189rcFumtafUioDrEmQ?e=tmEpkZ', '2025-07-09', 251),
(302, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EoSFKf_06VJLjo6SI6GOyZ8BptTr7NTxALn-c6suJiigcA?e=Rt3C6E', '2025-07-09', 250),
(303, 'Factures de l\'arquitecte pel projecte de canvi de coberta', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EU6xty_I3JNJg7UmKWOY8NgB-VunB11FfsMa_tbjP0y0zg?e=Ctmqfe', '2025-07-09', 250),
(306, 'Presupost camvi de nom', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EduVaofFLC1Boi7Xq_o-IBgBYEQe3SJqoBC7NNhYJbHJ-g?e=p0LbcB', '2025-07-09', 61),
(307, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ElSCtu2Kd4ZHhnhoPTuUFbIBn6PNHHKGa_Vparknft-bGg?e=L7XJWG', '2025-07-10', 252),
(308, 'Carpeta dels presuposts', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EilMLIKJ4d5IkVNSM__-SWIBJ_262dQtxBnAVZGoAL2f7Q?e=0PxZml', '2025-07-10', 192),
(309, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EkWtj9odpGFEtikR4W0IOFgBxq6c1DgiKkw9c0dvmBdOoA?e=aaC4mo', '2025-07-10', 253),
(310, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EaNLAMXUQEFLhperrlex8igBGu69UVTpmZtQAEZD-9w1QQ?e=wSe5Yw', '2025-07-11', 254),
(311, 'Fotos', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EuPtsvNHhZVIrGOR8b78G5oBvGqKacCtNAcpbnQYCAxvLQ?e=NCB5Zw', '2025-07-11', 254),
(312, 'Recepcio Mail', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EfwMbhTUIppFssT3DejuF9EBNPyG8mVS-9cY_V6TUozY4A?e=nCXl6I', '2025-07-11', 254),
(313, 'ConfirmacioRecepcioMailEscola', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Ef61MRCgYL9CumYJu6YsPhEBYPxyQ03I5UlJpKYCSy9n4A?e=sbkZgL', '2025-07-11', 249),
(314, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EsBT-ZCDw-lBj-nPm8dyQsIBKN-I_mAak2xwChxy85GwEA?e=J7BUcZ', '2025-07-11', 255),
(315, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EpgTHxOM1w1Ds4hWteCAJaoB1hTyppJAOWU8pekUWOnPJg?e=8OaXRc', '2025-07-11', 256),
(316, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ejj5HYsi6LRPuFvDy9KLYqIBhuqbJKPFvf1E5b-jAF0HwA?e=qOm60U', '2025-07-14', 257),
(317, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EjpVln4lo6NCkwl1v1kL9EkBaQqOCRO0w9ZhY5O1lPTUjw?e=BuVV2I', '2025-07-14', 258),
(318, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Et8To2Wk_45Jr_gn6-yd0gkBxvIuz4m2F4NYWYJNzh50dA?e=365G2Z', '2025-07-14', 259),
(319, 'Segón Pressupost', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EbIIWOclI61NjQNVS_WTnWgB-e71ZaXXCf1nziQiTeiimQ?e=tTx6km', '2025-07-14', 207),
(320, 'Fotos', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EtQOxNYNO2pCguTqDQgcnZkBUDWk1bXKIHEheLgTxiuhOA?e=CyeLFF', '2025-07-14', 260),
(321, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EbUqNtRFtgZBgxd4BGMLy7YBtHaMD-nllqitdAaL735PJQ?e=8EFTgv', '2025-07-14', 260),
(322, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EkaLRmW6OlhAtIufb_eAT3sBjFpa9Y7sNMhvmGLHM6ViVA?e=laIHC8', '2025-07-15', 261),
(323, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EYL0Zs7-w-NAqKMA37bQaGIBhXVQKY29EFHTIYQdoyHVSw?e=UhWCgg', '2025-07-15', 262),
(324, 'Imatge', 'https://ibeducacio.sharepoint.com/:i:/s/InfraestructuresEducatives/EQuUijTH3lVEqr9KPg8G0OoBY43ks0Rr6OCn3HSm_z0Mog?e=YmJzSg', '2025-07-15', 262),
(325, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ep8Cm9Su4FtGvX6mV0__r2oBdFZjMots8tAV2p9ccVDszA?e=NPKhrb', '2025-07-15', 263),
(328, 'Nota interna d\'IBISEC', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Eeg_rwu9dl5Oo52k8zjNdP4B14kiiwtfoqrRkKNPnvyKPA?e=lXbYIe', '2025-07-15', 134),
(329, 'Carpeta dels documents', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EgETL6L17m1LrTdHCT87cfwBS2LODrVUrwGO0Djo_C2bVg?e=0ZeILL', '2025-07-15', 264);

-- --------------------------------------------------------

--
-- Estructura de la taula `document_actuacio_conveni`
--

CREATE TABLE `document_actuacio_conveni` (
  `id` int(11) NOT NULL,
  `actuacio_id` int(11) NOT NULL,
  `tipus_id` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `data` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `document_actuacio_conveni`
--

INSERT INTO `document_actuacio_conveni` (`id`, `actuacio_id`, `tipus_id`, `nom`, `url`, `data`) VALUES
(15, 1, 1, 'Informe tècnic', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EfLLp8flLpdAiJZJhAABSDAB3_EskHe3QWilZCthwQPvzw?e=APW8G1', '2025-07-08'),
(16, 1, 2, 'Sol·licitud del centre', 'https://outlook.office.com', '2025-07-08');

-- --------------------------------------------------------

--
-- Estructura de la taula `espai`
--

CREATE TABLE `espai` (
  `codi` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `tipus` varchar(255) DEFAULT NULL,
  `ubicacio` varchar(255) DEFAULT NULL,
  `ocupacio_per_persona` decimal(11,1) DEFAULT NULL,
  `metres_per_unitat` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `espai`
--

INSERT INTO `espai` (`codi`, `nom`, `tipus`, `ubicacio`, `ocupacio_per_persona`, `metres_per_unitat`) VALUES
(1, 'DESPATX DIRECTOR', 'Complementari', 'Interior', 1.5, 20.00),
(2, 'DESPATX SECRETARI', 'Complementari', 'Interior', 1.5, 15.00),
(3, 'DESPATX CAP D\'ESTUDIS', 'Complementari', 'Interior', 1.5, 15.00),
(4, 'DESPATX ORIENTACIÓ', 'Complementari', 'Interior', 1.5, 15.00),
(5, 'SECRETARIA+ARXIU', 'Complementari', 'Interior', 1.5, 35.00),
(6, 'SALA PROFESSORS', 'Complementari', 'Interior', 1.5, 55.00),
(7, 'APIMA+ASS. ALUMNES', 'Complementari', 'Interior', 1.5, 15.00),
(8, 'CONSERGERIA-REPROGRAFIA', 'Complementari', 'Interior', 1.5, 10.00),
(9, 'SEMINARIS', 'Complementari', 'Interior', 1.5, 15.00),
(10, 'BANYS PROFESSORS', 'Complementari', 'Interior', 1.5, 21.00),
(11, 'BANYS ALUMN', 'Complementari', 'Interior', 1.5, 175.00),
(12, 'BANY ADAPT', 'Complementari', 'Interior', 1.5, 4.00),
(13, 'VESTUARIS+BANYS PND', 'Complementari', 'Interior', 1.5, 10.00),
(14, 'CALDERES', 'Complementari', 'Interior', 1.5, 20.00),
(15, 'COMPTADORS', 'Complementari', 'Interior', 1.5, 5.00),
(16, 'CAMBRA DE NETEJA', 'Complementari', 'Interior', 1.5, 5.00),
(17, 'CAMBRA DE FEMS', 'Complementari', 'Interior', 1.5, 5.00),
(18, 'CAFETERIA ', 'Complementari', 'Interior', 1.5, 40.00),
(19, 'MAGATZEM GENERAL', 'Complementari', 'Interior', 1.5, 50.00),
(20, 'AULA UEECO', 'Docent', 'Interior', 1.5, 35.00),
(21, 'AULES ESO', 'Docent', 'Interior', 1.5, 47.00),
(22, 'AULES BATX', 'Docent', 'Interior', 1.5, 54.00),
(23, 'AULES DESDOBLAMENT', 'Docent', 'Interior', 1.5, 30.00),
(24, 'SUPORT I REFORÇ EDUCATIU', 'Docent', 'Interior', 1.5, 30.00),
(25, 'BIBLIOTECA', 'Complementari', 'Interior', 1.5, 75.00),
(26, 'AULA MUSICA ESO', 'Docent', 'Interior', 1.5, 60.00),
(27, 'INFORMATICA ', 'Docent', 'Interior', 1.5, 60.00),
(28, 'AULA PLÀSTICA ESO/BATX', 'Docent', 'Interior', 1.5, 75.00),
(29, 'TECNOLOGIA ESO', 'Docent', 'Interior', 1.5, 100.00),
(30, 'LABORAT. CIENCIES', 'Docent', 'Interior', 1.5, 75.00),
(31, 'PATI', 'Complementari', 'Exterior', 1.5, 900.00),
(32, 'PISTA POLIESPORTIVA', 'Complementari', 'Exterior', 1.5, 800.00),
(33, 'PORXO', 'Complementari', 'Exterior', 1.5, 400.00),
(34, 'APARCAMENT', 'Complementari', 'Exterior', 1.5, 20.00),
(35, 'SUPERFÍCIE CONSTRUIDA  GIMNÀS I ESPAIS ANNEXOS', 'Complementari', 'Exterior', 1.5, 1500.00),
(36, 'AULA INFANTIL', 'Docent', 'Interior', 2.0, 75.00),
(37, 'AULA PRIMÀRIA', 'Docent', 'Interior', 1.5, 75.00);

-- --------------------------------------------------------

--
-- Estructura de la taula `estat_actuacio`
--

CREATE TABLE `estat_actuacio` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `color` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Bolcament de dades per a la taula `estat_actuacio`
--

INSERT INTO `estat_actuacio` (`id`, `nom`, `color`) VALUES
(1, 'Pendent', '#f9c2b6'),
(2, 'En procés', '#f39c12'),
(3, 'Pendent centre (doc. incompleta)', '#fdc659'),
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
  `nom` varchar(100) NOT NULL
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
  `nom` varchar(255) NOT NULL
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
  `nom` varchar(255) NOT NULL,
  `data` date NOT NULL DEFAULT current_timestamp(),
  `url` varchar(500) NOT NULL,
  `observacions` varchar(4000) NOT NULL,
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
(15, '', '2025-05-15', '', '', 40),
(16, 'PROYECTO DE ACTIVIDAD DE AMPLIACIÓN DE  LA ESCUELA INFANTIL DE 0 – 3 AÑOS', '2025-05-20', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EeoRl4QJFfRAqisiYrK59lQB20NfP3JgHpX7cfK480J8Kg?e=YXEL0F', '', 135),
(17, 'Informe de l\'IBISEC', '2025-07-15', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Ebrf2HQAC2BEs6pe4m-1AXgBBYisfsOm6bCeqm49EN36og?e=lb9J9S', '', 134);

-- --------------------------------------------------------

--
-- Estructura de la taula `mode_enviament`
--

CREATE TABLE `mode_enviament` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
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
  `nom` varchar(255) NOT NULL,
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
  `nom` varchar(255) NOT NULL
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
  `id_actuacio` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `import` decimal(12,2) DEFAULT NULL,
  `concepte` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de la taula `prioritat_actuacio`
--

CREATE TABLE `prioritat_actuacio` (
  `id` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL
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
  `accio` varchar(2000) NOT NULL,
  `url` varchar(500) NOT NULL,
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
(21, '2025-05-19', '2ª Reiteració Goteres', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ERBbQSaKwQtBtYPRagg8XqkBRz97Gyc4i0jj3EZ8SBlqJg?e=oUXf5z', 106),
(22, '2025-05-14', 'Reiteració Goteres', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EkFi1do4gQxMtgjA2GZrw1AB1xrOo-7DX7rDbBGd6AoScA?e=0FXsD5', 106),
(26, '2025-04-02', 'Reiteració: Bon dia, Vos volíem demanar com està el tema de la sol.licitud de l\'ascensor que vos férem en aquest correu el dia 12 de març.  Ens podreu informar? Gràcies', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EWAOsB0ozd1HjTek2MjBgF8BkTYpBfcvgvhulPVhqfCjgQ?e=k6wqtG', 130),
(27, '2025-05-19', 'Resposta: per atendre aquesta demanda, des del Servei d\'Infraestructures Educatives es demanarà a l\'IBISEC que es facin les actuacions necessàries per eliminar les barreres arquitectòniques del centre', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EWAOsB0ozd1HjTek2MjBgF8BkTYpBfcvgvhulPVhqfCjgQ?e=W6bFDy', 130),
(28, '2025-05-19', 'Tramesa còpia @ a IBISEC', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EWAOsB0ozd1HjTek2MjBgF8BkTYpBfcvgvhulPVhqfCjgQ?e=W6bFDy', 130),
(29, '2025-05-20', 'Mateo Sunyer dona prioritat a aquesta actuació', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EaprKr30Fs1GthI7BBiquW4B05eThPbUhPD6riBo11of2A?e=OiSjap', 130),
(30, '2025-05-16', 'Quedam a la espera de fotografies de l\'espai, i el plànol amb la proposta de distribució. Un cop haguem validat la proposta, podeu enviar els pressupostos per fer l\'actuació al Servei d\'Infraestructures Educa�ves', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EaO_TNIha0NPp7_4NvLaLXoB8PyApMu2Ok4-lBM1BHxxdw?e=osy2rO', 108),
(31, '2025-05-21', 'Resten a l’espera de la nostra resposta i autorització per començar la reforma i volen saber el procediment que han de seguir respecte als pagaments i cobrament de la quantitat sol·licitada per part dels industrials.', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EuWR2ebLF4BCuVwBsTAJyW4BglM9WxwdkAMrv6DEH6vz-A?e=VYeyxO', 136),
(32, '2025-05-16', 'Resposta: heu de fer la consulta a l\'arquitecte municipal de l\'Ajuntament d\'Andratx per demanar si tots els elements que voleu instal·lar en aquest àmbit són compa�bles amb la protecció territorial pròpia de la qualificació ARIP. És necessari obtenir una resposta per escrit, signada per l\'arquitecte municipal, en la qual s\'autoritzi qualsevol intervenció en aquest espai', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EcFu0d9tA7ZDkqsnjvpUMpsBb53nzjUIGF2G1f13JvtVQQ?e=fo2KlN', 138),
(33, '2025-05-23', 'Resposta. Necessitaríem que ens envieu fotografies de l\'aula, en les que es vegi l\'espai des de diferents angles i també el �pus de sostre que disposeu. Així mateix, també necessitaríem que ens indiqueu l\'altura aproximada de l\'aula', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EdqupiQ865pLufvqT2qflcwB_YMQs4tqloeQD_2dF9aM2A?e=r4Pq2B', 141),
(35, '2025-05-26', 'Resposta: Seguint la conversa telefònica, confirmar-te que a petició del Gerent de l\'IBISEC, s\'ha sol·licitat l\'informe tècnic. Aquesta és la primera passa abans de treure una licitació. Per tant, l\'IBISEC es posarà en contacte amb vosaltres per a l\'inici de les tasques. En cas que no es posin en contacte amb vosaltres en unes setmanes, podeu reiterar la petició al correu del servei (infraestructureseducatives@ibeducacio.eu).', '', 119),
(36, '2025-05-27', 'Reiteració', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EQhiM3rHCVZOlqFUY6ogLlgBJddpauEqKYyDuzayn-26iA?e=U0SnIW', 122),
(37, '2025-05-27', 'Rebuts 3 pressuposts', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Er0qPrsW29tIt9AkG_OPy1YBOAY1NJizE-WPlYR-pJBkmQ?e=nSEkYB', 100),
(38, '2024-12-13', '1. Inspección técnica (CERTIFICAT_DESFAVORABLE.pdf)      Fecha de inspección: 13/12/2024     Resultado: Desfavorable con defectos graves     Defectos detectados:         Falta de ventilación en el hueco del ascensor.         Aberturas peligrosas en el cerramiento del hueco.         Cerradura no reglamentaria en la sala de máquinas.         Falta de interruptor de alumbrado en el foso.         Falta de medios de acceso seguros al foso.         Falta de cortina fotoeléctrica en la cabina.', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EVKq_mvXqEdLvpz1_ufr23gBwsDh2eYgsWSZQL3S-VSh6w?e=EcBiRf', 158),
(39, '2025-05-16', '2. Informe de anomalías (ANOMALIAS_DETECTADAS.pdf)      Emitido por: Balear de Ascensores S.L.U.     Fecha del informe: 16/05/2025     Defectos estructurales que no pueden reparar ellos:         Aberturas en el hueco del ascensor.         Falta de ventilación en el hueco.         Cerradura no reglamentaria en la sala de máquinas.     Fecha límite para subsanar: 13/06/2025     Advertencia: Si no se corrigen, puede haber sanciones o prohibición de uso del ascensor.', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EesJXQ3SMtFGolIIYfVaWncBbAjrVGSp4q1epERPUrb9lg?e=6V19cy', 158),
(40, '2025-05-20', '3. Comunicación oficial del Ayuntamiento (OFICI_REPARACIO_EDIFICI_CEIP_GUILLEM_FRONTERA_PASCUAL.pdf)      Fecha: 20/05/2025     Acciones tomadas:         El Ayuntamiento contrató a OCA GLOBAL para la inspección.         Se reconoce que los defectos estructurales deben ser reparados por la Conselleria d’Educació i Universitats, ya que es quien construyó el edificio.         El Ayuntamiento asumirá los costes de los defectos de mantenimiento del ascensor.     Estado actual: Se ha enviado la documentación a IBISEC, que enviará un técnico para valorar y actuar.', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EThQp3wkIw1Ls2q_WAVI5q4BxvrB5awubYgqHr86jtN50w?e=HwCQw8', 158),
(41, '2025-05-27', 'Actualmente, el expediente está en manos de IBISEC.     Se está a la espera de la visita del técnico.     Es importante hacer seguimiento para asegurar que las reparaciones estructurales se realicen antes del 13 de junio de 2025.', '', 158),
(43, '2025-05-27', 'Enviament fotos: Aquí adjuntem les fotos de l\'aula de 6è d\'educació infantil on volem posar els ventiladors de sostre. L\'aula té 3 metres d\'alçada i mesura 52 metres quadrats (8 de llarg i 6,5 d\'ample). La intenció és posar un ventilador a cadascun del costats dividits per la biga de ciment del sostre que travessa per la meitat de l\'aula', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EnVZ7owRnQpOk9TrIgJzWcABetoI04Sgoc7wz6FeynIcIw?e=odN79q', 141),
(44, '2025-05-28', 'Consulta: A la pàgina 14 de la presentació sobre la formació d’equips directius, tenim un dubte: no ens queda clar si els tendals estan inclosos dins l’apartat de pèrgoles. Ens agradaria saber si seria possible adquirir 4 unitats del model següent:', 'https://www.amazon.es/HAIKUS-Triangular-Tri%C3%A1ngula-Transpirable-Resistente/dp/B0BLSK9TX2/ref=sr_1_32?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&crid=SNY6IONJ7B6N&dib=eyJ2IjoiMSJ9.hi3ejAsdUeSl-TGh3ZbE7LkQaUld-V4IjbSSP2BZF-9qOVNfjMUwyG06EEgzWUp8Oe2I5arlYdlACr7T4MM_7SfI5TSXjFasrTwOSokuo5qGlqCxRoikoqvbl9GKz_cGyuq3KlGs-blr6HoBlTFoWjZ-qsmWn_4XSo51udKbzGXbv1DjdvY2CP_Im8v8jLhYrF4amomWJhgs5MP1aP2YCe7LuN6S--jihaIbS6q4esw5dkmMdrB33XFP-e1rzO-zKnyVrc9OzATaMXj_pukkG7xdw-Gf7rBZsNwElgeDzfo.B7YirlYy4w0HcYr7G', 150),
(45, '2025-02-27', 'Ens envien les fotos sol·licitades', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EcAtO759TEdJiHYuzZbzO_kB4Bi0RdbZcim6YqxLi5OOmQ?e=jAIf2y', 161),
(46, '2025-05-30', 'Reiteració', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Eb0c2pdnuGtCvwrp3nIuucIBhAp2m5shX7ijTCJAP8cC3Q?e=xwa82O', 161),
(47, '2025-05-30', 'Derivat a IBISEC', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ETiXRKsg5l1GtzyO6XV2Z4IBucdmVTpKFAdc0QRPTmA2PQ?e=VO4NiJ', 146),
(48, '2025-06-02', 'Vistiplau actuació @', '', 143),
(49, '2025-06-02', 'Tramesa doc sol·licitada: - 3 fotos de l\'interior de l\'espai - 1 plànol dels elements actuals, de color negre (molt casolà. disculpau-nos!!) - 1 plànol de com ens agradaria fer la distribució tenint en compte els 80cm de distància entre elements, de color verd (igualment casolà) - 1 simulació amb una aplicació online de com pensam que quedaria, també tenint en compte les distàncies (enllaç aquí)', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EvM3Fy2UHUFPrUvNGIiwdp0BjdDgRy5GWZ8oNP4z9g9ABQ?e=8T5qWV', 108),
(50, '2025-06-02', 'Altres qüestions: - si, la nostra idea seria obrir una finestra i així ho vam estar valorant amb el servei de l\'ajuntament a una visita in situ qui, si no vaig entendre malament, va dir que se\'n podia fer càrrec. En tot cas, com que està en còpia en aquest correu també podrà dir la seva.  - no, la finestra no és per l\'atenció al públic (això es fa a secretaria) per tant no hi haurà taulell de cap classe - al nou despatx no hi ha punts de llum suficient i amb això necessitaríem ajuda. Ens encarregarem de demanar els pressuposts en funció del que ens heu especificitat, però voldríem saber si per part del vostre servei podem comptar amb suport econòmic per fer-ho o tota la despesa l\'ha d\'assumir el centre  Per la nostra part anirem avançant amb els pressupostos de la part elèctrica i esperarem tant les vostres valoracions com les de l\'ajuntament pel que fa a l\'autorització i viabilitat de la proposta.', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EeLGTJDoucVFk_H3hQT7YXwBfYIBeas3xWtEgCm1lzB7Fg?e=QE1SIn', 108),
(51, '2025-06-02', 'Pel que fa a la obertura de la finestra, us informam que l\'Ajuntament pot valorar la seva execució, com a darrera opció. En principi, la Conselleria hauria de fer-se càrrec d\'aquesta millora, per la qual cosa us aconsellam que el centre valori aquesta intervenció en espera a la contestació de la Conselleria', '', 108),
(52, '2025-06-03', 'Hem sol·licitat 3 pressuposts de l\'obra del despatx. Els hem valorat i duit al Consell Escolar, el qual ha donat el vist i plau a poder realitzar l\'obra triant el pressupost 1 com el més interessant per termini d\'execució d\'obra i per preu.   Adjuntem els tres pressuposts i vos demanem que ens doneu el vist i plau.', '', 94),
(53, '2024-11-29', '@ Sol·licitud', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EaE_0OhOBDhKlK1t9ZD1AC8BqLWi9PJV0qWACQYIBsdYXg?e=nJ1I0o', 137),
(54, '2025-04-08', 'Resposta: Atès que l\'ascensor és tan an�c i que cada cop és més di�cil trobar recanvis per reparar-lo, pareix que l\'opció més adequada és subs�tuirlo per un de nou.', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EUnSi3YOIB5FoOBCeMquqzIBgF0rE2cHelv-_rus8bhWpQ?e=aQWbuj', 137),
(55, '2025-06-02', 'Reiteracio', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EejgQCbYqr5JkZQuET5gvkkBSrvhLxIexgNrhkmpkUIQWQ?e=nCmPil', 137),
(56, '2025-06-04', 'Qualcú té els antecedents d, aquesta sol.licitud. En principi no hi veig inconvenient però faltaria saber:      L, espai que volen ocupar a que ho tenen destinat. (què sacrifiquen?)      Difícil de creure que sobre l, envà no hi hagi cap tipus d, instal·lació (endolls, radiadors, telecos)      Un parell de fotos ajudarien     Tal vegada un envà mòbil els hi donaria més flexibilitat  Després en parlam.', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EVfhpA6El45GmgiAqvDCJ3UBxE7fffrcco2LeQgS1m8X4A?e=a7gsVZ', 117),
(57, '2025-06-02', 'ANTEPROJECTE', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EUnjpepCx2JDgt9xZwUDSeIBWYjNK52KTPmUCtGfw1QKCw?e=V3fht6', 179),
(58, '2025-06-10', 'Enviament @ a la directora del centre sol·licitant fotos', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ETZUfExC9W1OnElvd7DQGdIBQ2sknx36XqEVUQf_Dl8agA?e=aHLbKs', 180),
(59, '2025-06-12', 'Reiteració i resposta', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EaduLHyGiUhHqw3yGwwzy8IBVaLcE1Q_v1pCDpI4JY-0Cw?e=4NHXQn', 147),
(60, '2025-06-12', '@ Recepció de les fotos sol·licitades', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EgAamB1u331Omd4n36eivtsBs4nqOiO7tInJNLZXQXmN2Q?e=Uawf5B', 180),
(61, '2025-06-09', 'Reiteram a IBISEC @ demanant tècnic per revisar escala d\'emergència', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EYKMk8wLYAlIlIfUIT_gYjYBPzG97zt2KsY_hFw-NPdBEg?e=jZWrZM', 174),
(62, '2025-06-16', 'Resposta al centre i tancament de l\'actuació', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Eap1cNjolT1On4YnZrGsg6cBjQxBhbRWCcnBv1_G7rMmYg?e=CtG2Xd', 117),
(63, '2025-05-07', 'Consulta estat de la petició i resposta', '', 95),
(64, '2025-06-09', 'Reiteració i resposta', '', 95),
(65, '2025-06-09', 'Resposta', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EXlRUVC0IAlJnZUrJ3aSX9IBhw2M7vXEzUi3EGhZfZhA3A?e=cEr8fC', 172),
(66, '2025-06-09', '@ Sol·licitud planificació desmuntatge aparells', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ES7-vfMQm6lEgIuJt9epn2IBiQxEQxEvwVuQdGhLYUaVxw?e=3gpUfp', 140),
(67, '2025-06-09', 'Resposta', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EcvYsfqwMOtCoE9t4j0KYKkB_5K8lS-v9ndb793HMia2_Q?e=5U3Xmt', 136),
(68, '2025-06-09', 'Tramesa de la petició per part del Servei de Centres', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EZ3L51v9WyFKopEpjkbrhPwB5fiisIWwKXprcxZMIf4vTg?e=C62dMM', 160),
(69, '2025-06-10', 'Resposta', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ESKWj6_7WCpDq8J6eeB0ZxIBZkCaoE5uHDGe_PswgmaZgA?e=MBA80B', 106),
(70, '2025-06-16', 'Ha telefonat Tomeu de l\'Ajuntament d\'Ariany per comunicar que precinten l\'ascensor i pot haver-hi sanció econòmica. A aquest document es troben les dades de contacte. Enviat @ a IBISEC', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EeOehu-E27JDnJodNbedLiABHY9S3AJgjZ63zIrz5I1rcg?e=vUPtBb', 158),
(71, '2025-06-17', 'resposta al centre i al Ajuntament', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EdQseTNyHxtKqo5LsW4KmxAB8vfQI0zlQQRwvw2c4oHQ1A?e=IAS4c9', 161),
(72, '2025-06-18', 'Document de petició d\'autoritzacio del sistema modular de pèrgoles', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EeWeugrxAMpGkdIhJsPuRc4BK8VPEDr8y8nX13h69li7Pw?e=dh1kDt', 179),
(73, '2025-06-17', 'Resposta unificació banys', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EQa-_9crAPBKtFJyTwE98TsBr27rPPR4MhYiH55uAK1SCA?e=sBxVf6', 191),
(74, '2024-10-23', 'Reiteracio 1 de data 23/10/2024', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EjUDgd_xLcdMhq85PTPX1SQBP5taRLUuy41JOxAAGvwwZQ?e=8ZfVxe', 216),
(75, '2025-06-30', 'Reiteracio 2', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/ErnKEIPIoWZCotgfFsqC3t4BrnnacPxYBFVv9hJKBkWnvw?e=QnF0SC', 216),
(76, '2025-07-01', 'Modificació del pressupot de pintura.', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EbdoHp9PIFdIrxOLbjM_OFQBGFkFtcO2wIlVo8SFcRjMRg?e=wKhPXk', 94),
(77, '2025-07-03', 'Reiteracio de l\'actuació', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/En7eub6SFkpMlGQxZ0XGEIEBfkSMlpZjbxaBQuJftuoLBg?e=BazmuJ', 60),
(78, '2025-07-04', 'Reiteració de la sol·licitud de canvi de trispol del pati', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ERFFLpMSpxNGgdAJAaKGmQIB0hwsNLAbe09PgsMRba9c-g?e=hUAb7Q', 183),
(79, '2025-07-04', 'Reiteració', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EXvM0atNWCVAnW7OwNAEJg0B8wHmVgLhX__QJO3M3gN6mg?e=F8yF2f', 130),
(80, '2025-06-19', 'Resposta', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/Ee79bCnfoO5DtmfpkuW2HhsBybqEzmE1zeLp5o_gDpjfoQ?e=mrZFzA', 137),
(82, '2025-07-07', 'Reiteracio de la renovacio del trispol del gimnàs. Informe UGE', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EZkSB3kPeJJLsdIDNDKKoTUBq9tnIqgE5CGXiB5WHACjuA?e=SCX3qD', 164),
(83, '2025-07-07', 'Reiteracio de la renovació del trispol', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ej4Vk-7faCtAk-qsJ2dcnWABRV_ODd4_SPyg4JWNGL1Qug?e=kIaVGw', 126),
(84, '2025-06-20', 'M\'han trucat en relació a aquest assumpte. Sembla que han Toni: seguit les recomanacions indicades per n\'Helena. En poder, atès que és una resposta ràpida,  donau-li el vist i plau per correu electrònic. Ho faran amb càrrec als pressupost del centre.', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EQecLAKjKjdMh7IR9yuTtj0BpumFU2IpASX5YG6PaI2A0Q?e=YFgbUG', 100),
(85, '2025-07-09', 'Resposta a la peticio: Hauríeu de demanar pressupost per a l\'adquisició i instal·lació de ventiladors de sostre a un tècnic especialitzat. En tenir-ho, ens ho podeu fer arribar per a la nostra valoració.', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EQfs3RSYPYJLmsvc8hs6Dq0Bfxg4US7OZGY6JoEMFgjEjQ?e=X7joMK', 95),
(86, '2025-07-09', 'Reiteracio d\'arreglar el rentavaixelles', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EZ_i_RQWEadEijRj5Qi61wEBF85-gVdxtMzd9Xsm0fCtEw?e=kGY7tN', 195),
(87, '2025-07-09', 'Factures Arquitecte', '', 188),
(89, '2025-07-10', 'Reiteracio de l\'incidència de filtratge d\'aigua', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/ERIAbrctd7xKnEyPn_2IPUMBXiZhjYHtlOgfX7slKbABmA?e=O4DnrQ', 116),
(90, '2025-07-10', 'Avís de sol·licitud d\'expedient de despesa per Climatització de la planta pis de l’edifici E', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EWV2j35qf0JGnxn-Hs_9PkUBFu6RMlpcJ_9pQkSnpSkY7w?e=7Ct08z', 188),
(91, '2025-07-11', 'Resposta Helena', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EcvDfU9vs3VDn86s27PxXdYBNqxhZVaumeV_cXYnMJF23w?e=PCJD5J', 94),
(92, '2025-07-11', 'Proposta', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EY0bToPSFN9JlJAbRhvAyiQBKk42zwFl-tkjKkD5XUjMHA?e=LuZQU6', 94),
(93, '2025-07-11', 'Ofici del conseller a la AMIPA amb el compromis d\'Infraestructures Educatives', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EbZccsB5SgxHpySN7FvEJGwBtj6pYxTKdyXNo4a0CHFHvA?e=1015v8', 91),
(94, '2025-07-14', 'Fotos i factures de l\'actuació', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/EiywKTTGbMNBvNkcAKkf668BAyX8E--Hx3aSsr2tvdRxCg?e=Ia9pgK', 37),
(95, '2025-07-14', '3ReiteracioProblemaGoteres', 'https://ibeducacio.sharepoint.com/:f:/s/InfraestructuresEducatives/Ephii3q3GKFGunoUO1G_lUoBcr5bL7hCRC1o9IMsXo43vQ?e=GSACP4', 106),
(96, '2025-07-15', 'Mail', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EY3VtCOrNNZLtdjJsb0NINQBa2XOld1eAYSfnM8YwxWChg?e=57lT0a', 135),
(97, '2025-07-15', 'Foto', 'https://ibeducacio.sharepoint.com/:b:/s/InfraestructuresEducatives/EY3VtCOrNNZLtdjJsb0NINQBa2XOld1eAYSfnM8YwxWChg?e=57lT0a', 135);

-- --------------------------------------------------------

--
-- Estructura de la taula `subtipus_actuacio`
--

CREATE TABLE `subtipus_actuacio` (
  `id` int(11) NOT NULL,
  `tipus_id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
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
(227, 3, 'Aules modulars'),
(228, 3, 'Creació de nou centre'),
(229, 3, 'Ampliació del centre'),
(230, 2, 'Ascensors i elevadors');

-- --------------------------------------------------------

--
-- Estructura de la taula `tecnic`
--

CREATE TABLE `tecnic` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL
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
  `nom` varchar(50) NOT NULL
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
  `Sigla` varchar(50) NOT NULL,
  `nom` varchar(255) NOT NULL
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
  `descripcio` varchar(255) NOT NULL
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
  ADD KEY `actuacio_id` (`id_actuacio`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT per la taula `actuacio_conveni`
--
ALTER TABLE `actuacio_conveni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `centres`
--
ALTER TABLE `centres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=863;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=330;

--
-- AUTO_INCREMENT per la taula `document_actuacio_conveni`
--
ALTER TABLE `document_actuacio_conveni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT per la taula `subtipus_actuacio`
--
ALTER TABLE `subtipus_actuacio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

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
  ADD CONSTRAINT `pagament_conveni_ibfk_1` FOREIGN KEY (`id_actuacio`) REFERENCES `actuacio_conveni` (`id`);

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
