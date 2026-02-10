<?php
declare(strict_types=1);

require_once __DIR__ . '/../connectarBD.php';

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
ini_set('display_errors', '1');
error_reporting(E_ALL);

function h($v): string { return htmlspecialchars((string)$v, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8'); }

function post_bool(string $k): int { return isset($_POST[$k]) ? 1 : 0; }
function post_str(string $k): ?string { $v = trim($_POST[$k] ?? ''); return $v === '' ? null : $v; }
function post_int(string $k): ?int { $v = trim($_POST[$k] ?? ''); return $v === '' ? null : (int)$v; }
function post_dec(string $k): ?float { $v = trim($_POST[$k] ?? ''); return $v === '' ? null : (float)$v; }
function post_date(string $k): ?string { $v = trim($_POST[$k] ?? ''); return $v === '' ? null : $v; }

/** bind_params($stmt, ['i','s',...], [$a,$b,...]) */
function bind_params(mysqli_stmt $stmt, array $types, array $params): void {
  $typeStr = implode('', $types);
  $refs = [];
  foreach ($params as $k => $v) $refs[$k] = &$params[$k];
  $stmt->bind_param($typeStr, ...$refs);
}

/** Devuelve set de columnas reales de una tabla. */
function table_columns(mysqli $db, string $table): array {
  $cols = [];
  $rs = $db->query("SHOW COLUMNS FROM `$table`");
  while ($r = $rs->fetch_assoc()) $cols[$r['Field']] = true;
  return $cols;
}

/** Devuelve el solar principal asociado a un expedient (o 0 si no existe). */
function get_solar_principal_id(mysqli $db, int $expedient_id): int {
  $sql = "SELECT ass.solar_id
          FROM actuacions_solar a
          JOIN actuacions_solar_solars ass ON ass.actuacio_solar_id=a.id AND ass.rol='principal'
          WHERE a.expedient_id=?
          LIMIT 1";
  $st = $db->prepare($sql);
  $st->bind_param("i", $expedient_id);
  $st->execute();
  $row = $st->get_result()->fetch_assoc();
  return $row ? (int)$row['solar_id'] : 0;
}

$errors = [];
$expedient_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

$exp = [
  'id'=>0,'centre_id'=>0,'centre_nom'=>'','estat'=>'pendent',
  'data_sollicitud'=>'','obs_sollicitud'=>'',
  'data_topografic'=>'','obs_topografic'=>'',
  'data_acord_ple'=>'','obs_acord_ple'=>'',
];

$sol = [
  'id'=>0,'illa_id'=>'','municipi_id'=>'',
  'ref_cadastral'=>'','ref_registral'=>'','superficie_m2'=>'',
  'limits_confrontacions'=>'','num_parcelles'=>'',
  'requereix_agrupacio'=>0,'requereix_segregacio'=>0,
  'observacions_parcelles'=>'',
  'titularitat_municipal_acreditada'=>0,'lliure_carregues'=>0,'lliure_gravamens'=>0,'inventari_municipal_inclos'=>0,
  'servituds_detectades'=>0,'servituds_compatibles'=>null,'servituds_detall'=>'',
  'regim_cessio'=>'','finalitat_educativa_condicionada'=>0,'limit_temporal_text'=>'','reversio_text'=>'',
  'info_publica_rbel'=>0,'data_info_publica'=>'','assabentat_consell_insular'=>0,'data_assabentat'=>'',
  'qualificacio_urbanistica'=>'','parametres_edificatoris'=>'','usos_permesos'=>'',
  'afectacio_apr'=>0,'condicions_higienicosanitaries_ok'=>0,'data_cert_higienico'=>'','detall_apr'=>'',
  'delimitat_fisicament'=>0,'data_delimitacio'=>'','sense_obstacles'=>0,'observacions_obstacles'=>'','serveis_basics_ok'=>0,
  'accessos_ok'=>0,'estudi_mobilitat_aportat'=>0,'accessibilitat_universal_ok'=>0,'detall_accessos'=>'',
  'postobra_obra_nova_notari_feta'=>0,'data_obra_nova'=>'',
  'postobra_inscripcio_registre_feta'=>0,'data_inscripcio'=>'','postobra_cessio_us_feta'=>0,
  'notes'=>'',
];

$serveis = [
  'aigua'       => ['disponible'=>0,'cabal_m3h'=>'','pressio_kgcm2'=>'','grup_pressio_necessari'=>0],
  'electricitat'=> ['disponible'=>0,'kw_obra'=>'','kw_funcionament'=>'','requereix_ct'=>0],
  'telefonia'   => ['disponible'=>0],
  'clavegueram' => ['disponible'=>0,'cota'=>'','diametre'=>''],
  'pluvials'    => ['disponible'=>0,'solucio_pluvials'=>''],
];

$checkedTipus = ['obra_nova'=>false,'reforma_integral'=>false,'ampliacio'=>false,'urbanitzacio'=>false,'altres'=>false];

/** Documentació requerida (solar_documentacio.tipus) */
$docTypes = [
  'acord_ple' => 'Acord de ple',
  'certificat_registre_propietat' => 'Certificat Registre Propietat (lliure càrregues)',
  'certificat_cadastral' => 'Certificat cadastral',
  'topografic_georef' => 'Topogràfic georeferenciat',
  'geotecnic' => 'Geotècnic',
];
$docs = [];
foreach ($docTypes as $t => $_lbl) {
  $docs[$t] = ['aportat'=>0,'data_aportacio'=>'','observacions'=>''];
}

/** Informes sectorials (solar_informe_sectorial.tipus) */
$infTypes = [
  'aesa_servituds_aeronautiques' => 'AESA (servituds aeronàutiques)',
  'recursos_hidrics_inundabilitat' => 'Recursos hídrics / inundabilitat',
];
$infs = [];
foreach ($infTypes as $t => $_lbl) {
  $infs[$t] = ['afectacio_sel'=>'pendent','viabilitat'=>'pendent','data_informe'=>'','condicionants'=>''];
}

// =====================================================
// DELETE
// =====================================================
if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['action'] ?? '') === 'delete') {
  $expedient_id = (int)($_POST['expedient_id'] ?? 0);
  if ($expedient_id <= 0) {
    $errors[] = "No s'ha indicat l'expedient.";
  } else {
    $connexio->begin_transaction();
    try {
      $solar_id = get_solar_principal_id($connexio, $expedient_id);
      if ($solar_id <= 0) throw new Exception("No existeix solar principal per a aquest expedient.");

      foreach (['solar_documentacio','solar_informe_sectorial','solar_serveis'] as $t) {
        $st = $connexio->prepare("DELETE FROM `$t` WHERE solar_id=?");
        $st->bind_param("i", $solar_id);
        $st->execute();
      }

      $sql = "SELECT a.id
              FROM actuacions_solar a
              JOIN actuacions_solar_solars ass ON ass.actuacio_solar_id=a.id
              WHERE a.expedient_id=? AND ass.solar_id=?";
      $st = $connexio->prepare($sql);
      $st->bind_param("ii", $expedient_id, $solar_id);
      $st->execute();
      $ids = [];
      $rs = $st->get_result();
      while ($r = $rs->fetch_assoc()) $ids[] = (int)$r['id'];

      if ($ids) {
        $stDel = $connexio->prepare("DELETE FROM actuacions_solar_solars WHERE actuacio_solar_id=? AND solar_id=?");
        foreach ($ids as $aid) {
          $stDel->bind_param("ii", $aid, $solar_id);
          $stDel->execute();
        }

        $stCheck = $connexio->prepare("SELECT COUNT(*) AS c FROM actuacions_solar_solars WHERE actuacio_solar_id=?");
        $stDelAct = $connexio->prepare("DELETE FROM actuacions_solar WHERE id=?");
        foreach ($ids as $aid) {
          $stCheck->bind_param("i", $aid);
          $stCheck->execute();
          $c = (int)$stCheck->get_result()->fetch_assoc()['c'];
          if ($c === 0) {
            $stDelAct->bind_param("i", $aid);
            $stDelAct->execute();
          }
        }
      }

      $st = $connexio->prepare("DELETE FROM solars WHERE id=?");
      $st->bind_param("i", $solar_id);
      $st->execute();

      $connexio->commit();
      header("Location: solarListFiltro.php");
      exit;
    } catch (Throwable $e) {
      $connexio->rollback();
      $errors[] = "ERROR ELIMINANT: " . $e->getMessage();
    }
  }
}

// =====================================================
// SAVE
// =====================================================
if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($_POST['action'] ?? '') !== 'delete') {
  $expedient_id = (int)($_POST['expedient_id'] ?? 0);

  $centre_id = (int)($_POST['centre_id'] ?? 0);
  if ($centre_id <= 0) $errors[] = "Has de seleccionar un centre de la llista (no text lliure).";

  if (!$errors) {
    $st = $connexio->prepare("SELECT Centre FROM centres WHERE id=? LIMIT 1");
    $st->bind_param("i", $centre_id);
    $st->execute();
    if (!$st->get_result()->fetch_assoc()) $errors[] = "El centre seleccionat no existeix (id=$centre_id).";
  }

  $estat = $_POST['estat'] ?? 'pendent';
  $data_sollicitud = post_date('data_sollicitud');
  $obs_sollicitud = post_str('obs_sollicitud');
  $data_topografic = post_date('data_topografic');
  $obs_topografic = post_str('obs_topografic');
  $data_acord_ple = post_date('data_acord_ple');
  $obs_acord_ple = post_str('obs_acord_ple');

  $illa_id = post_int('illa_id') ?? post_int('illa');
  $municipi_id = post_int('municipi_id') ?? post_int('municipi');

  $ref_cadastral = post_str('ref_cadastral');
  $ref_registral = post_str('ref_registral');
  $superficie_m2 = post_dec('superficie_m2');
  $limits_confrontacions = post_str('limits_confrontacions') ?? post_str('limits');
  $num_parcelles = post_int('num_parcelles');
  $requereix_agrupacio = post_bool('requereix_agrupacio');
  $requereix_segregacio = post_bool('requereix_segregacio');
  $observacions_parcelles = post_str('observacions_parcelles');

  $titularitat_municipal_acreditada = post_bool('titularitat_municipal_acreditada');
  $lliure_carregues = post_bool('lliure_carregues');
  $lliure_gravamens = post_bool('lliure_gravamens');
  $inventari_municipal_inclos = post_bool('inventari_municipal_inclos');

  $servituds_detectades = post_bool('servituds_detectades');
  $servituds_compatibles = (isset($_POST['servituds_compatibles']) && $_POST['servituds_compatibles'] !== '')
    ? (int)$_POST['servituds_compatibles'] : null;
  $servituds_detall = post_str('servituds_detall');

  $regim_cessio = post_str('regim_cessio');
  $finalitat_educativa_condicionada = post_bool('finalitat_educativa_condicionada');
  $limit_temporal_text = post_str('limit_temporal_text');
  $reversio_text = post_str('reversio_text');
  $info_publica_rbel = post_bool('info_publica_rbel');
  $data_info_publica = post_date('data_info_publica');
  $assabentat_consell_insular = post_bool('assabentat_consell_insular');
  $data_assabentat = post_date('data_assabentat');

  $qualificacio_urbanistica = post_str('qualificacio_urbanistica');
  $parametres_edificatoris = post_str('parametres_edificatoris');
  $usos_permesos = post_str('usos_permesos');
  $afectacio_apr = post_bool('afectacio_apr');
  $detall_apr = post_str('detall_apr') ?? post_str('detall_apr_geologia');

  $condicions_higienicosanitaries_ok = post_bool('condicions_higienicosanitaries_ok');
  $data_cert_higienico = post_date('data_cert_higienico');

  $delimitat_fisicament = post_bool('delimitat_fisicament');
  $data_delimitacio = post_date('data_delimitacio');
  $sense_obstacles = post_bool('sense_obstacles');
  $observacions_obstacles = post_str('observacions_obstacles');
  $serveis_basics_ok = post_bool('serveis_basics_ok');

  $accessos_ok = post_bool('accessos_ok');
  $estudi_mobilitat_aportat = post_bool('estudi_mobilitat_aportat');
  $accessibilitat_universal_ok = post_bool('accessibilitat_universal_ok');
  $detall_accessos = post_str('detall_accessos');

  $postobra_obra_nova_notari_feta = post_bool('postobra_obra_nova_notari_feta');
  $data_obra_nova = post_date('data_obra_nova');
  $postobra_inscripcio_registre_feta = post_bool('postobra_inscripcio_registre_feta');
  $data_inscripcio = post_date('data_inscripcio');
  $postobra_cessio_us_feta = post_bool('postobra_cessio_us_feta');

  $notes = post_str('notes');

  $serveis['aigua']['disponible'] = post_bool('aigua_disponible');
  $serveis['aigua']['cabal_m3h'] = post_dec('aigua_cabal_m3h');
  $serveis['aigua']['pressio_kgcm2'] = post_dec('aigua_pressio_kgcm2');
  $serveis['aigua']['grup_pressio_necessari'] = post_bool('aigua_grup_pressio_necessari');

  $serveis['electricitat']['disponible'] = post_bool('electricitat_disponible');
  $serveis['electricitat']['kw_obra'] = post_dec('electricitat_kw_obra');
  $serveis['electricitat']['kw_funcionament'] = post_dec('electricitat_kw_funcionament');
  $serveis['electricitat']['requereix_ct'] = post_bool('requereix_ct');

  $serveis['telefonia']['disponible'] = post_bool('telefonia_disponible');

  $serveis['clavegueram']['disponible'] = post_bool('clavegueram_disponible');
  $serveis['clavegueram']['cota'] = post_dec('clavegueram_cota');
  $serveis['clavegueram']['diametre'] = post_str('clavegueram_diametre');

  $serveis['pluvials']['disponible'] = post_bool('pluvials_disponible');
  $serveis['pluvials']['solucio_pluvials'] = post_str('solucio_pluvials');

  foreach ($checkedTipus as $k => $_) $checkedTipus[$k] = isset($_POST[$k]);
  $tipusSeleccionats = [];
  foreach (array_keys($checkedTipus) as $t) if (!empty($checkedTipus[$t])) $tipusSeleccionats[] = $t;
  if (!$tipusSeleccionats) { $tipusSeleccionats = ['altres']; $checkedTipus['altres'] = true; }

  if (!$errors) {
    $connexio->begin_transaction();
    try {
      if ($expedient_id > 0) {
        $sql = "UPDATE expedients_solar
                SET centre_id=?, estat=?,
                    data_sollicitud=?, obs_sollicitud=?,
                    data_topografic=?, obs_topografic=?,
                    data_acord_ple=?, obs_acord_ple=?
                WHERE id=?";
        $st = $connexio->prepare($sql);
        $st->bind_param(
          "isssssssi",
          $centre_id, $estat,
          $data_sollicitud, $obs_sollicitud,
          $data_topografic, $obs_topografic,
          $data_acord_ple, $obs_acord_ple,
          $expedient_id
        );
        $st->execute();
      } else {
        $sql = "INSERT INTO expedients_solar
                (centre_id, estat, data_sollicitud, obs_sollicitud, data_topografic, obs_topografic, data_acord_ple, obs_acord_ple)
                VALUES (?,?,?,?,?,?,?,?)";
        $st = $connexio->prepare($sql);
        $st->bind_param(
          "isssssss",
          $centre_id, $estat,
          $data_sollicitud, $obs_sollicitud,
          $data_topografic, $obs_topografic,
          $data_acord_ple, $obs_acord_ple
        );
        $st->execute();
        $expedient_id = (int)$connexio->insert_id;
      }

      $solar_id = get_solar_principal_id($connexio, $expedient_id);

      $sol_cols_db = table_columns($connexio, 'solars');

      $wanted = [
        'municipi_id' => ['i', $municipi_id],
        'illa_id' => ['i', $illa_id],
        'ref_cadastral' => ['s', $ref_cadastral],
        'ref_registral' => ['s', $ref_registral],
        'superficie_m2' => ['s', $superficie_m2 === null ? null : (string)$superficie_m2],
        'limits_confrontacions' => ['s', $limits_confrontacions],
        'num_parcelles' => ['i', $num_parcelles],
        'requereix_agrupacio' => ['i', $requereix_agrupacio],
        'requereix_segregacio' => ['i', $requereix_segregacio],
        'observacions_parcelles' => ['s', $observacions_parcelles],
        'titularitat_municipal_acreditada' => ['i', $titularitat_municipal_acreditada],
        'lliure_carregues' => ['i', $lliure_carregues],
        'lliure_gravamens' => ['i', $lliure_gravamens],
        'inventari_municipal_inclos' => ['i', $inventari_municipal_inclos],
        'servituds_detectades' => ['i', $servituds_detectades],
        'servituds_compatibles' => ['i', $servituds_compatibles],
        'servituds_detall' => ['s', $servituds_detall],
        'regim_cessio' => ['s', $regim_cessio],
        'finalitat_educativa_condicionada' => ['i', $finalitat_educativa_condicionada],
        'limit_temporal_text' => ['s', $limit_temporal_text],
        'reversio_text' => ['s', $reversio_text],
        'info_publica_rbel' => ['i', $info_publica_rbel],
        'data_info_publica' => ['s', $data_info_publica],
        'assabentat_consell_insular' => ['i', $assabentat_consell_insular],
        'data_assabentat' => ['s', $data_assabentat],
        'qualificacio_urbanistica' => ['s', $qualificacio_urbanistica],
        'parametres_edificatoris' => ['s', $parametres_edificatoris],
        'usos_permesos' => ['s', $usos_permesos],
        'afectacio_apr' => ['i', $afectacio_apr],
        'detall_apr' => ['s', $detall_apr],
        'condicions_higienicosanitaries_ok' => ['i', $condicions_higienicosanitaries_ok],
        'data_cert_higienico' => ['s', $data_cert_higienico],
        'delimitat_fisicament' => ['i', $delimitat_fisicament],
        'data_delimitacio' => ['s', $data_delimitacio],
        'sense_obstacles' => ['i', $sense_obstacles],
        'observacions_obstacles' => ['s', $observacions_obstacles],
        'serveis_basics_ok' => ['i', $serveis_basics_ok],
        'accessos_ok' => ['i', $accessos_ok],
        'estudi_mobilitat_aportat' => ['i', $estudi_mobilitat_aportat],
        'accessibilitat_universal_ok' => ['i', $accessibilitat_universal_ok],
        'detall_accessos' => ['s', $detall_accessos],
        'postobra_obra_nova_notari_feta' => ['i', $postobra_obra_nova_notari_feta],
        'data_obra_nova' => ['s', $data_obra_nova],
        'postobra_inscripcio_registre_feta' => ['i', $postobra_inscripcio_registre_feta],
        'data_inscripcio' => ['s', $data_inscripcio],
        'postobra_cessio_us_feta' => ['i', $postobra_cessio_us_feta],
        'notes' => ['s', $notes],
      ];

      $cols = []; $types = []; $params = [];
      foreach ($wanted as $col => [$t, $val]) {
        if (!isset($sol_cols_db[$col])) continue;
        $cols[] = $col; $types[] = $t; $params[] = $val;
      }
      if (!$cols) throw new Exception("No hi ha cap columna de solars coincident amb el formulari.");

      if ($solar_id > 0) {
        $set = implode(",", array_map(fn($c) => "$c=?", $cols));
        $sql = "UPDATE solars SET $set WHERE id=?";
        $st = $connexio->prepare($sql);
        $uTypes = $types; $uParams = $params;
        $uTypes[] = 'i'; $uParams[] = $solar_id;
        bind_params($st, $uTypes, $uParams);
        $st->execute();
      } else {
        $placeholders = rtrim(str_repeat("?,", count($cols)), ",");
        $sql = "INSERT INTO solars (" . implode(",", $cols) . ") VALUES ($placeholders)";
        $st = $connexio->prepare($sql);
        bind_params($st, $types, $params);
        $st->execute();
        $solar_id = (int)$connexio->insert_id;

        $sql = "INSERT INTO actuacions_solar (expedient_id, tipus) VALUES (?, 'altres')";
        $st = $connexio->prepare($sql);
        $st->bind_param("i", $expedient_id);
        $st->execute();
        $act_id = (int)$connexio->insert_id;

        $sql = "INSERT INTO actuacions_solar_solars (actuacio_solar_id, solar_id, rol) VALUES (?, ?, 'principal')";
        $st = $connexio->prepare($sql);
        $st->bind_param("ii", $act_id, $solar_id);
        $st->execute();
      }

      $existing = [];
      $sql = "SELECT id, tipus FROM actuacions_solar WHERE expedient_id=?";
      $st = $connexio->prepare($sql);
      $st->bind_param("i", $expedient_id);
      $st->execute();
      $rs = $st->get_result();
      while ($r = $rs->fetch_assoc()) $existing[(string)$r['tipus']] = (int)$r['id'];

      $isFirst = true;
      foreach ($tipusSeleccionats as $tipus) {
        $act_id = $existing[$tipus] ?? 0;
        if ($act_id <= 0) {
          $sql = "INSERT INTO actuacions_solar (expedient_id, tipus) VALUES (?, ?)";
          $st = $connexio->prepare($sql);
          $st->bind_param("is", $expedient_id, $tipus);
          $st->execute();
          $act_id = (int)$connexio->insert_id;
        }
        $rol = $isFirst ? 'principal' : 'auxiliar';
        $isFirst = false;

        $sql = "INSERT INTO actuacions_solar_solars (actuacio_solar_id, solar_id, rol)
                VALUES (?,?,?)
                ON DUPLICATE KEY UPDATE rol=VALUES(rol)";
        $st = $connexio->prepare($sql);
        $st->bind_param("iis", $act_id, $solar_id, $rol);
        $st->execute();
      }

      $srv_cols_db = table_columns($connexio, 'solar_serveis');
      $hasExtended =
        isset($srv_cols_db['cabal_m3h']) ||
        isset($srv_cols_db['kw_obra']) ||
        isset($srv_cols_db['solucio_pluvials']) ||
        isset($srv_cols_db['pressio_kgcm2']);

      if ($hasExtended) {
        $allSrvCols = [
          'solar_id'=>['i',null],'tipus'=>['s',null],'disponible'=>['i',null],
          'cabal_m3h'=>['s',null],'pressio_kgcm2'=>['s',null],'grup_pressio_necessari'=>['i',null],
          'kw_obra'=>['s',null],'kw_funcionament'=>['s',null],'requereix_ct'=>['i',null],
          'cota'=>['s',null],'diametre'=>['s',null],'solucio_pluvials'=>['s',null],
        ];
        $srvCols = [];
        foreach ($allSrvCols as $c => $_) if (isset($srv_cols_db[$c])) $srvCols[] = $c;

        $placeholders = rtrim(str_repeat("?,", count($srvCols)), ",");
        $updates = implode(",", array_map(
          fn($c) => "$c=VALUES($c)",
          array_filter($srvCols, fn($c) => !in_array($c, ['solar_id','tipus'], true))
        ));

        $sql = "INSERT INTO solar_serveis (" . implode(",", $srvCols) . ") VALUES ($placeholders)
                ON DUPLICATE KEY UPDATE $updates";
        $st = $connexio->prepare($sql);

        foreach ($serveis as $tipus => $v) {
          $disponible = (int)($v['disponible'] ?? 0);

          $cabal   = ($tipus==='aigua') ? ($v['cabal_m3h']===null ? null : (string)$v['cabal_m3h']) : null;
          $pressio = ($tipus==='aigua') ? ($v['pressio_kgcm2']===null ? null : (string)$v['pressio_kgcm2']) : null;
          $grup    = ($tipus==='aigua') ? (int)($v['grup_pressio_necessari'] ?? 0) : 0;

          $kw_obra = ($tipus==='electricitat') ? ($v['kw_obra']===null ? null : (string)$v['kw_obra']) : null;
          $kw_func = ($tipus==='electricitat') ? ($v['kw_funcionament']===null ? null : (string)$v['kw_funcionament']) : null;
          $req_ct  = ($tipus==='electricitat') ? (int)($v['requereix_ct'] ?? 0) : 0;

          $cota = ($tipus==='clavegueram') ? ($v['cota']===null ? null : (string)$v['cota']) : null;
          $diam = ($tipus==='clavegueram') ? ($v['diametre'] ?? null) : null;

          $sol_pluv = ($tipus==='pluvials') ? ($v['solucio_pluvials'] ?? null) : null;

          $p=[]; $t=[];
          foreach ($srvCols as $c) {
            if ($c==='solar_id'){ $t[]='i'; $p[]=$solar_id; }
            elseif ($c==='tipus'){ $t[]='s'; $p[]=$tipus; }
            elseif ($c==='disponible'){ $t[]='i'; $p[]=$disponible; }
            elseif ($c==='cabal_m3h'){ $t[]='s'; $p[]=$cabal; }
            elseif ($c==='pressio_kgcm2'){ $t[]='s'; $p[]=$pressio; }
            elseif ($c==='grup_pressio_necessari'){ $t[]='i'; $p[]=$grup; }
            elseif ($c==='kw_obra'){ $t[]='s'; $p[]=$kw_obra; }
            elseif ($c==='kw_funcionament'){ $t[]='s'; $p[]=$kw_func; }
            elseif ($c==='requereix_ct'){ $t[]='i'; $p[]=$req_ct; }
            elseif ($c==='cota'){ $t[]='s'; $p[]=$cota; }
            elseif ($c==='diametre'){ $t[]='s'; $p[]=$diam; }
            elseif ($c==='solucio_pluvials'){ $t[]='s'; $p[]=$sol_pluv; }
          }
          bind_params($st, $t, $p);
          $st->execute();
        }
      } else {
        $sql = "INSERT INTO solar_serveis (solar_id, tipus, disponible, valor1, valor2, notes)
                VALUES (?,?,?,?,?,?)
                ON DUPLICATE KEY UPDATE
                  disponible=VALUES(disponible),
                  valor1=VALUES(valor1),
                  valor2=VALUES(valor2),
                  notes=VALUES(notes)";
        $st = $connexio->prepare($sql);

        foreach ($serveis as $tipus => $v) {
          $disponible = (int)($v['disponible'] ?? 0);
          $valor1 = null; $valor2 = null; $notesSrv = null;

          if ($tipus === 'aigua') {
            $valor1 = $v['cabal_m3h']===null ? null : (string)$v['cabal_m3h'];
            $valor2 = $v['pressio_kgcm2']===null ? null : (string)$v['pressio_kgcm2'];
            $notesSrv = ($v['grup_pressio_necessari'] ?? 0) ? 'grup_pressio_necessari=1' : null;
          } elseif ($tipus === 'electricitat') {
            $valor1 = $v['kw_obra']===null ? null : (string)$v['kw_obra'];
            $valor2 = $v['kw_funcionament']===null ? null : (string)$v['kw_funcionament'];
            $notesSrv = ($v['requereix_ct'] ?? 0) ? 'requereix_ct=1' : null;
          } elseif ($tipus === 'clavegueram') {
            $valor1 = $v['cota']===null ? null : (string)$v['cota'];
            $valor2 = $v['diametre'] ?? null;
          } elseif ($tipus === 'pluvials') {
            $notesSrv = $v['solucio_pluvials'] ?? null;
          }

          $st->bind_param("isisss", $solar_id, $tipus, $disponible, $valor1, $valor2, $notesSrv);
          $st->execute();
        }
      }

      $sql = "DELETE FROM solar_documentacio WHERE solar_id=?";
      $st = $connexio->prepare($sql);
      $st->bind_param("i", $solar_id);
      $st->execute();

      $postedDocs = $_POST['doc'] ?? [];
      $sql = "INSERT INTO solar_documentacio (solar_id, tipus, aportat, data_aportacio, observacions)
              VALUES (?,?,?,?,?)";
      $stIns = $connexio->prepare($sql);

      foreach ($docTypes as $tipus => $_lbl) {
        $row = $postedDocs[$tipus] ?? [];
        $aportat = isset($row['aportat']) ? 1 : 0;
        $data_ap = trim((string)($row['data_aportacio'] ?? '')); $data_ap = ($data_ap === '') ? null : $data_ap;
        $obs = trim((string)($row['observacions'] ?? '')); $obs = ($obs === '') ? null : $obs;
        $stIns->bind_param("isiss", $solar_id, $tipus, $aportat, $data_ap, $obs);
        $stIns->execute();
      }

      $sql = "DELETE FROM solar_informe_sectorial WHERE solar_id=?";
      $st = $connexio->prepare($sql);
      $st->bind_param("i", $solar_id);
      $st->execute();

      $postedInf = $_POST['inf'] ?? [];
      $sql = "INSERT INTO solar_informe_sectorial (solar_id, tipus, afectacio, viabilitat, data_informe, condicionants)
              VALUES (?,?,?,?,?,?)";
      $stInf = $connexio->prepare($sql);

      foreach ($infTypes as $tipus => $_lbl) {
        $row = $postedInf[$tipus] ?? [];
        $afSel = (string)($row['afectacio_sel'] ?? 'pendent');
        $afectacio = ($afSel === 'si') ? 1 : 0;
        $viabilitat = (string)($row['viabilitat'] ?? 'pendent');
        $data_inf = trim((string)($row['data_informe'] ?? '')); $data_inf = ($data_inf === '') ? null : $data_inf;
        $cond = trim((string)($row['condicionants'] ?? '')); $cond = ($cond === '') ? null : $cond;

        $stInf->bind_param("isisss", $solar_id, $tipus, $afectacio, $viabilitat, $data_inf, $cond);
        $stInf->execute();
      }

      $connexio->commit();
      header("Location: solarListFiltro.php");
      exit;

    } catch (Throwable $e) {
      $connexio->rollback();
      $errors[] = "ERROR GUARDANT: " . $e->getMessage();
    }
  }
}

// =====================================================
// LOAD
// =====================================================
$centre_txt = '';
$centre_id = 0;
$centre_nom = '';

if ($expedient_id > 0) {
  $sql = "SELECT e.*, c.Centre AS centre_nom
          FROM expedients_solar e
          LEFT JOIN centres c ON c.id=e.centre_id
          WHERE e.id=?";
  $st = $connexio->prepare($sql);
  $st->bind_param("i", $expedient_id);
  $st->execute();
  if ($row = $st->get_result()->fetch_assoc()) {
    $exp = array_merge($exp, $row);
    $centre_id = (int)$row['centre_id'];
    $centre_nom = (string)$row['centre_nom'];
    $centre_txt = $centre_nom;
  }

  $sql = "SELECT s.*
          FROM actuacions_solar a
          JOIN actuacions_solar_solars ass ON ass.actuacio_solar_id=a.id AND ass.rol='principal'
          JOIN solars s ON s.id=ass.solar_id
          WHERE a.expedient_id=? LIMIT 1";
  $st = $connexio->prepare($sql);
  $st->bind_param("i", $expedient_id);
  $st->execute();
  if ($row = $st->get_result()->fetch_assoc()) $sol = array_merge($sol, $row);

  $sql = "SELECT DISTINCT tipus FROM actuacions_solar WHERE expedient_id=?";
  $st = $connexio->prepare($sql);
  $st->bind_param("i", $expedient_id);
  $st->execute();
  $rs = $st->get_result();
  while ($r = $rs->fetch_assoc()) {
    $t = (string)$r['tipus'];
    if (array_key_exists($t, $checkedTipus)) $checkedTipus[$t] = true;
  }

  if ((int)$sol['id'] > 0) {
    $sql = "SELECT * FROM solar_serveis WHERE solar_id=?";
    $st = $connexio->prepare($sql);
    $sid = (int)$sol['id'];
    $st->bind_param("i", $sid);
    $st->execute();
    $rs = $st->get_result();
    while ($r = $rs->fetch_assoc()) {
      $t = (string)$r['tipus'];
      if (!isset($serveis[$t])) continue;

      $serveis[$t]['disponible'] = (int)($r['disponible'] ?? 0);

      if (isset($r['cabal_m3h']) && $t === 'aigua') {
        $serveis[$t]['cabal_m3h'] = $r['cabal_m3h'];
        $serveis[$t]['pressio_kgcm2'] = $r['pressio_kgcm2'];
        $serveis[$t]['grup_pressio_necessari'] = (int)$r['grup_pressio_necessari'];
      } elseif (isset($r['kw_obra']) && $t === 'electricitat') {
        $serveis[$t]['kw_obra'] = $r['kw_obra'];
        $serveis[$t]['kw_funcionament'] = $r['kw_funcionament'];
        $serveis[$t]['requereix_ct'] = (int)$r['requereix_ct'];
      } elseif (isset($r['cota']) && $t === 'clavegueram') {
        $serveis[$t]['cota'] = $r['cota'];
        $serveis[$t]['diametre'] = $r['diametre'];
      } elseif (isset($r['solucio_pluvials']) && $t === 'pluvials') {
        $serveis[$t]['solucio_pluvials'] = $r['solucio_pluvials'];
      } else {
        if ($t === 'aigua') {
          $serveis[$t]['cabal_m3h'] = $r['valor1'] ?? '';
          $serveis[$t]['pressio_kgcm2'] = $r['valor2'] ?? '';
          $serveis[$t]['grup_pressio_necessari'] = ((string)($r['notes'] ?? '') === 'grup_pressio_necessari=1') ? 1 : 0;
        } elseif ($t === 'electricitat') {
          $serveis[$t]['kw_obra'] = $r['valor1'] ?? '';
          $serveis[$t]['kw_funcionament'] = $r['valor2'] ?? '';
          $serveis[$t]['requereix_ct'] = ((string)($r['notes'] ?? '') === 'requereix_ct=1') ? 1 : 0;
        } elseif ($t === 'clavegueram') {
          $serveis[$t]['cota'] = $r['valor1'] ?? '';
          $serveis[$t]['diametre'] = $r['valor2'] ?? '';
        } elseif ($t === 'pluvials') {
          $serveis[$t]['solucio_pluvials'] = $r['notes'] ?? '';
        }
      }
    }

    $sql = "SELECT tipus, aportat, data_aportacio, observacions
            FROM solar_documentacio WHERE solar_id=?";
    $st = $connexio->prepare($sql);
    $sid = (int)$sol['id'];
    $st->bind_param("i", $sid);
    $st->execute();
    $rs = $st->get_result();
    while ($r = $rs->fetch_assoc()) {
      $t = (string)$r['tipus'];
      if (!isset($docs[$t])) continue;
      $docs[$t]['aportat'] = (int)$r['aportat'];
      $docs[$t]['data_aportacio'] = (string)($r['data_aportacio'] ?? '');
      $docs[$t]['observacions'] = (string)($r['observacions'] ?? '');
    }

    $sql = "SELECT tipus, afectacio, viabilitat, data_informe, condicionants
            FROM solar_informe_sectorial WHERE solar_id=?";
    $st = $connexio->prepare($sql);
    $st->bind_param("i", $sid);
    $st->execute();
    $rs = $st->get_result();
    while ($r = $rs->fetch_assoc()) {
      $t = (string)$r['tipus'];
      if (!isset($infs[$t])) continue;
      $infs[$t]['afectacio_sel'] = ((int)$r['afectacio'] === 1) ? 'si' : 'no';
      $infs[$t]['viabilitat'] = (string)($r['viabilitat'] ?? 'pendent');
      $infs[$t]['data_informe'] = (string)($r['data_informe'] ?? '');
      $infs[$t]['condicionants'] = (string)($r['condicionants'] ?? '');
    }
  }
}

$illes = $connexio->query("SELECT id, nom FROM illa ORDER BY nom")->fetch_all(MYSQLI_ASSOC);
$solarExists = ((int)$sol['id'] > 0);
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Fitxa d’expedient de solar</title>

  <link rel="stylesheet" href="../css/estilos.css" type="text/css" />
  <link rel="stylesheet" href="../css/estilos_ficha_2.css" type="text/css" />

  <script src="../js/utiles.js" language="javascript"></script>
  <script src="../js/especificas.js" language="javascript"></script>

  <script>
    async function onIllaChange() {
      const illa = document.getElementById('illa_id').value;
      const municipi = document.getElementById('municipi_id');
      municipi.innerHTML = '<option value="">Selecciona un municipi</option>';
      if (!illa) return;

      const r = await fetch('ajax_municipis.php?illa_id=' + encodeURIComponent(illa));
      const data = await r.json();
      data.forEach((m) => {
        const opt = document.createElement('option');
        opt.value = m.id;
        opt.textContent = m.nom;
        municipi.appendChild(opt);
      });

      const selected = municipi.dataset.selected;
      if (selected) municipi.value = selected;
    }

    function initCentreAutocomplete() {
      const input = document.getElementById('centre_txt');
      const hidden = document.getElementById('centre_id');
      const box = document.getElementById('centre_suggest');
      const label = document.getElementById('centre_selected_label');
      if (!input || !hidden || !box) return;

      let lastFetch = 0;
      let timer = null;
      let lastQuery = '';

      function hideBox(){ box.style.display='none'; box.innerHTML=''; }
      function showBox(){ box.style.display='block'; }
      function clearSelection(){ hidden.value=''; if (label) label.textContent=''; }

      function render(items){
        box.innerHTML = '';
        if (!items.length) {
          const div=document.createElement('div');
          div.style.padding='8px';
          div.style.color='#666';
          div.textContent='Sense resultats';
          box.appendChild(div);
          showBox();
          return;
        }
        items.forEach(it => {
          const row=document.createElement('div');
          row.style.padding='8px';
          row.style.cursor='pointer';
          row.style.borderBottom='1px solid #eee';
          row.textContent=it.nom;
          row.addEventListener('mousedown', e => {
            e.preventDefault();
            input.value=it.nom;
            hidden.value=it.id;
            if (label) label.textContent=it.nom;
            hideBox();
          });
          box.appendChild(row);
        });
        showBox();
      }

      async function fetchCentres(q){
        const now = Date.now();
        lastFetch = now;
        try{
          const r = await fetch('ajax_centres.php?q=' + encodeURIComponent(q));
          if (!r.ok) return;
          const data = await r.json();
          if (lastFetch !== now) return;
          render(data);
        }catch(e){ /* ignore */ }
      }

      input.addEventListener('input', () => {
        const q = input.value.trim();
        clearSelection();
        if (timer) clearTimeout(timer);
        if (q.length < 2) { hideBox(); return; }
        timer = setTimeout(() => {
          if (q === lastQuery) return;
          lastQuery = q;
          fetchCentres(q);
        }, 200);
      });

      input.addEventListener('focus', () => {
        const q = input.value.trim();
        if (q.length >= 2) fetchCentres(q);
      });

      document.addEventListener('click', (e) => {
        if (!box.contains(e.target) && e.target !== input) hideBox();
      });

      input.addEventListener('blur', () => setTimeout(hideBox, 150));
    }

    function confirmGuardar() {
      const centreId = document.getElementById('centre_id')?.value || '';
      const centreTxt = document.getElementById('centre_txt')?.value || '';
      const illaSel = document.getElementById('illa_id');
      const munSel = document.getElementById('municipi_id');

      const illaTxt = illaSel?.options[illaSel.selectedIndex]?.text || '';
      const munTxt = munSel?.options[munSel.selectedIndex]?.text || '';

      const refCat = document.querySelector('input[name="ref_cadastral"]')?.value || '';
      const sup = document.querySelector('input[name="superficie_m2"]')?.value || '';

      if (!centreId) {
        alert("Selecciona el centre DES DE LA LLISTA (autocomplete).");
        return false;
      }

      const msg =
        "Confirmes que vols guardar?\n\n" +
        "Centre: " + centreTxt + " (id " + centreId + ")\n" +
        "Illa/Municipi: " + illaTxt + " / " + munTxt + "\n" +
        "Ref. cadastral: " + refCat + "\n" +
        "Superfície (m²): " + sup + "\n\n" +
        "Es guardaran també Serveis, Documentació i Informes sectorials.";
      return confirm(msg);
    }

    function confirmEliminar() {
      return confirm("ATENCIÓ: eliminaràs el solar i les seves dades associades (serveis, documentació, informes...).\n\nVols continuar?");
    }

    window.addEventListener('DOMContentLoaded', () => {
      initCentreAutocomplete();
      if (document.getElementById('illa_id')?.value) onIllaChange();
      const municipi = document.getElementById('municipi_id');
      if (municipi) municipi.dataset.selected = municipi.dataset.selected || municipi.value;
    });
  </script>
</head>

<body class="contenido" onload="ocultarFondoPrincipal();">
  <div class="contenedorFiltro"></div>

  <ul class="botoneraFicha">
    <li class="tituloFicha">
      <p class="posicionTituloFicha">FITXA D’EXPEDIENT DE SOLAR</p>
    </li>
  </ul>

  <div class="espacioMarron">&nbsp;</div>

  <?php if ($errors): ?>
    <div style="margin:10px 20px; padding:10px; background:#ffe4e4; border:1px solid #ffb2b2;">
      <?php foreach ($errors as $e): ?>
        <div><?php echo h($e); ?></div>
      <?php endforeach; ?>
    </div>
  <?php endif; ?>

  <form name="entidad"
        method="post"
        onsubmit="return confirmGuardar();"
        action="solarForm.php<?php echo $expedient_id ? '?id=' . (int)$expedient_id : ''; ?>">

    <input type="hidden" name="action" value="save">
    <input type="hidden" name="expedient_id" value="<?php echo (int)$expedient_id; ?>">

    <div id="fichaEditable" style="background-color:#ffffff;">
      <div class="cabeceraFicha"></div>

      <div class="contenedorFicha">

        <div class="tituloSeccion"><p class="textoTituloSeccion">Dades generals</p></div>

        <table>
          <tr>
            <td>
              <label class="campoFicha_Blanca">Estat:</label>
              <select id="estat" name="estat" class="campoFicha_Blanca">
                <option value="pendent"   <?php echo ($exp['estat']==='pendent'   ? 'selected' : ''); ?>>Pendent</option>
                <option value="en_tramit" <?php echo ($exp['estat']==='en_tramit' ? 'selected' : ''); ?>>En tràmit</option>
                <option value="tancat"    <?php echo ($exp['estat']==='tancat'    ? 'selected' : ''); ?>>Tancat</option>
              </select>
            </td>

            <td>
              <label class="campoFicha_Blanca">Centre:</label>
              <div style="position:relative; display:inline-block; width:520px;">
                <input type="text" id="centre_txt" name="centre_txt" class="formularioFicha"
                       style="width:100%;" autocomplete="off"
                       placeholder="Escriu per cercar el centre..."
                       value="<?php echo h($centre_txt ?: ($centre_nom ?? '')); ?>" />
                <input type="hidden" id="centre_id" name="centre_id" value="<?php echo (int)($centre_id ?: ($exp['centre_id'] ?? 0)); ?>" />
                <div id="centre_suggest"
                     style="display:none; position:absolute; z-index:9999; left:0; right:0; top:100%;
                            background:#fff; border:1px solid #ccc; max-height:260px; overflow:auto;"></div>
                <div style="font-size:12px; margin-top:4px; opacity:0.85;">
                  <span id="centre_selected_label"><?php echo h($centre_nom ?? ''); ?></span>
                </div>
              </div>
            </td>
          </tr>

          <tr>
            <td>
              <label class="campoFicha_Blanca">Illa:</label>
              <select name="illa_id" id="illa_id" class="campoFicha_Blanca" onchange="onIllaChange()">
                <option value="">Selecciona una illa</option>
                <?php foreach ($illes as $il): ?>
                  <option value="<?php echo (int)$il['id']; ?>" <?php echo ((string)$sol['illa_id']===(string)$il['id'] ? 'selected' : ''); ?>>
                    <?php echo h($il['nom']); ?>
                  </option>
                <?php endforeach; ?>
              </select>
            </td>
            <td>
              <label class="campoFicha_Blanca">Municipi:</label>
              <select id="municipi_id" name="municipi_id" class="campoFicha_Blanca" data-selected="<?php echo h($sol['municipi_id']); ?>">
                <option value="">Selecciona un municipi</option>
              </select>
            </td>
          </tr>
        </table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Tipus d’actuació</p></div>
        <table><tr><td>
          <?php foreach (['obra_nova'=>'Obra nova','reforma_integral'=>'Reforma integral','ampliacio'=>'Ampliació','urbanitzacio'=>'Urbanització','altres'=>'Altres'] as $k=>$lbl): ?>
            <label class="campoFicha_Blanca" style="display:inline-block; margin-right:10px;">
              <input type="checkbox" name="<?php echo $k; ?>" value="1" <?php echo ($checkedTipus[$k] ? 'checked' : ''); ?>> <?php echo h($lbl); ?>
            </label>
          <?php endforeach; ?>
        </td></tr></table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Tràmits</p></div>
        <table>
          <tr>
            <td>
              <label class="campoFicha_Blanca">Data sol·licitud:</label>
              <input type="date" name="data_sollicitud" class="formularioFicha" value="<?php echo h($exp['data_sollicitud']); ?>">
            </td>
            <td colspan="2">
              <label class="campoFicha_Blanca" style="align-self:start; display:grid">Obs. sol·licitud:</label>
              <textarea name="obs_sollicitud" class="contenedorFicha_Blanca" rows="3" cols="70"><?php echo h($exp['obs_sollicitud']); ?></textarea>
            </td>
          </tr>
          <tr>
            <td>
              <label class="campoFicha_Blanca">Data topogràfic:</label>
              <input type="date" name="data_topografic" class="formularioFicha" value="<?php echo h($exp['data_topografic']); ?>">
            </td>
            <td colspan="2">
              <label class="campoFicha_Blanca" style="align-self:start; display:grid">Obs. topogràfic:</label>
              <textarea name="obs_topografic" class="contenedorFicha_Blanca" rows="3" cols="70"><?php echo h($exp['obs_topografic']); ?></textarea>
            </td>
          </tr>
          <tr>
            <td>
              <label class="campoFicha_Blanca">Data acord ple:</label>
              <input type="date" name="data_acord_ple" class="formularioFicha" value="<?php echo h($exp['data_acord_ple']); ?>">
            </td>
            <td colspan="2">
              <label class="campoFicha_Blanca" style="align-self:start; display:grid">Obs. acord ple:</label>
              <textarea name="obs_acord_ple" class="contenedorFicha_Blanca" rows="3" cols="70"><?php echo h($exp['obs_acord_ple']); ?></textarea>
            </td>
          </tr>
        </table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Identificació jurídica del solar</p></div>
        <table>
          <tr>
            <td><label class="campoFicha_Blanca">Ref. cadastral:</label>
              <input type="text" name="ref_cadastral" class="formularioFicha" value="<?php echo h($sol['ref_cadastral']); ?>" size="30"></td>
            <td><label class="campoFicha_Blanca">Ref. registral:</label>
              <input type="text" name="ref_registral" class="formularioFicha" value="<?php echo h($sol['ref_registral']); ?>" size="45"></td>
            <td><label class="campoFicha_Blanca">Superfície (m²):</label>
              <input type="number" step="0.01" name="superficie_m2" class="formularioFicha" value="<?php echo h($sol['superficie_m2']); ?>"></td>
          </tr>
          <tr>
            <td colspan="3">
              <label class="campoFicha_Blanca" style="align-self:start; display:grid">Límits / confrontacions:</label>
              <textarea name="limits_confrontacions" class="contenedorFicha_Blanca" rows="3" cols="110"><?php echo h($sol['limits_confrontacions']); ?></textarea>
            </td>
          </tr>
        </table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Parcel·lació / operacions prèvies</p></div>
        <table>
          <tr>
            <td><label class="campoFicha_Blanca">Núm. parcel·les:</label>
              <input type="number" name="num_parcelles" class="formularioFicha" value="<?php echo h($sol['num_parcelles']); ?>"></td>
            <td>
              <label class="campoFicha_Blanca">
                <input type="checkbox" name="requereix_agrupacio" value="1" <?php echo ((int)$sol['requereix_agrupacio']===1 ? 'checked' : ''); ?>> Requereix agrupació
              </label>
              <label class="campoFicha_Blanca">
                <input type="checkbox" name="requereix_segregacio" value="1" <?php echo ((int)$sol['requereix_segregacio']===1 ? 'checked' : ''); ?>> Requereix segregació
              </label>
            </td>
          </tr>
          <tr>
            <td colspan="3">
              <label class="campoFicha_Blanca" style="align-self:start; display:grid">Observacions parcel·les:</label>
              <textarea name="observacions_parcelles" class="contenedorFicha_Blanca" rows="3" cols="110"><?php echo h($sol['observacions_parcelles']); ?></textarea>
            </td>
          </tr>
        </table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Estat legal (propietat, càrregues i servituds)</p></div>
        <table><tr><td>
          <?php foreach ([
            'titularitat_municipal_acreditada'=>'Titularitat municipal acreditada',
            'lliure_carregues'=>'Lliure de càrregues',
            'lliure_gravamens'=>'Lliure de gravàmens',
            'inventari_municipal_inclos'=>'Inclòs a inventari municipal'
          ] as $k=>$lbl): ?>
            <label class="campoFicha_Blanca" style="display:inline-block; margin-right:10px;">
              <input type="checkbox" name="<?php echo $k; ?>" value="1" <?php echo ((int)$sol[$k]===1 ? 'checked' : ''); ?>> <?php echo h($lbl); ?>
            </label>
          <?php endforeach; ?>
        </td></tr></table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Servituds</p></div>
        <table>
          <tr><td>
            <label class="campoFicha_Blanca" style="display:inline-block; margin-right:10px;">
              <input type="checkbox" name="servituds_detectades" value="1" <?php echo ((int)$sol['servituds_detectades']===1 ? 'checked' : ''); ?>> Hi ha servituds
            </label>

            <label class="campoFicha_Blanca" style="display:inline-block;">
              Servituds compatibles?
              <select name="servituds_compatibles" class="campoFicha_Blanca">
                <option value="" <?php echo ($sol['servituds_compatibles']===null ? 'selected' : ''); ?>>Selecciona</option>
                <option value="1" <?php echo ((string)$sol['servituds_compatibles']==='1' ? 'selected' : ''); ?>>Sí</option>
                <option value="0" <?php echo ((string)$sol['servituds_compatibles']==='0' ? 'selected' : ''); ?>>No</option>
              </select>
            </label>
          </td></tr>
          <tr><td>
            <label class="campoFicha_Blanca" style="align-self:start; display:grid">Detall servituds / notes jurídiques:</label>
            <textarea name="servituds_detall" class="contenedorFicha_Blanca" rows="3" cols="110"><?php echo h($sol['servituds_detall']); ?></textarea>
          </td></tr>
        </table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Règim de cessió i condicions</p></div>
        <table>
          <tr>
            <td>
              <label class="campoFicha_Blanca">Règim:</label>
              <select name="regim_cessio" class="campoFicha_Blanca">
                <option value="" <?php echo ($sol['regim_cessio']==='' ? 'selected':''); ?>>(selecciona)</option>
                <option value="posada_disposicio" <?php echo ($sol['regim_cessio']==='posada_disposicio' ? 'selected':''); ?>>Posada a disposició (CEIP)</option>
                <option value="cessio_titularitat" <?php echo ($sol['regim_cessio']==='cessio_titularitat' ? 'selected':''); ?>>Cessió de titularitat (IES)</option>
              </select>
            </td>
            <td>
              <label class="campoFicha_Blanca">
                <input type="checkbox" name="finalitat_educativa_condicionada" value="1" <?php echo ((int)$sol['finalitat_educativa_condicionada']===1 ? 'checked':''); ?>>
                Finalitat educativa condicionada
              </label>
            </td>
          </tr>
          <tr>
            <td>
              <label class="campoFicha_Blanca">Límit temporal (text):</label>
              <input type="text" name="limit_temporal_text" class="formularioFicha" value="<?php echo h($sol['limit_temporal_text']); ?>" size="35">
            </td>
            <td>
              <label class="campoFicha_Blanca">Reversió (text):</label>
              <input type="text" name="reversio_text" class="formularioFicha" value="<?php echo h($sol['reversio_text']); ?>" size="45">
            </td>
          </tr>
          <tr>
            <td>
              <label class="campoFicha_Blanca">
                <input type="checkbox" name="info_publica_rbel" value="1" <?php echo ((int)$sol['info_publica_rbel']===1 ? 'checked':''); ?>>
                Informació pública (RBEL)
              </label>
              <label class="campoFicha_Blanca">Data:</label>
              <input type="date" name="data_info_publica" class="formularioFicha" value="<?php echo h($sol['data_info_publica']); ?>">
            </td>
            <td>
              <label class="campoFicha_Blanca">
                <input type="checkbox" name="assabentat_consell_insular" value="1" <?php echo ((int)$sol['assabentat_consell_insular']===1 ? 'checked':''); ?>>
                Assabentat Consell Insular
              </label>
              <label class="campoFicha_Blanca">Data:</label>
              <input type="date" name="data_assabentat" class="formularioFicha" value="<?php echo h($sol['data_assabentat']); ?>">
            </td>
          </tr>
        </table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Urbanisme i riscos</p></div>
        <table>
          <tr><td colspan="3">
            <label class="campoFicha_Blanca" style="align-self:start; display:grid">Qualificació urbanística:</label>
            <textarea name="qualificacio_urbanistica" class="contenedorFicha_Blanca" rows="2" cols="110"><?php echo h($sol['qualificacio_urbanistica']); ?></textarea>
          </td></tr>
          <tr><td colspan="3">
            <label class="campoFicha_Blanca" style="align-self:start; display:grid">Paràmetres edificatoris:</label>
            <textarea name="parametres_edificatoris" class="contenedorFicha_Blanca" rows="2" cols="110"><?php echo h($sol['parametres_edificatoris']); ?></textarea>
          </td></tr>
          <tr><td colspan="3">
            <label class="campoFicha_Blanca" style="align-self:start; display:grid">Usos permesos:</label>
            <textarea name="usos_permesos" class="contenedorFicha_Blanca" rows="2" cols="110"><?php echo h($sol['usos_permesos']); ?></textarea>
          </td></tr>
          <tr>
            <td>
              <label class="campoFicha_Blanca">
                <input type="checkbox" name="afectacio_apr" value="1" <?php echo ((int)$sol['afectacio_apr']===1 ? 'checked':''); ?>>
                Afectació APR (riscos)
              </label>
            </td>
            <td>
              <label class="campoFicha_Blanca">Cert. higienicosanitàries OK?</label>
              <label class="campoFicha_Blanca" style="margin-left:10px;">
                <input type="checkbox" name="condicions_higienicosanitaries_ok" value="1" <?php echo ((int)$sol['condicions_higienicosanitaries_ok']===1 ? 'checked':''); ?>>
                Sí
              </label>
              <label class="campoFicha_Blanca">Data:</label>
              <input type="date" name="data_cert_higienico" class="formularioFicha" value="<?php echo h($sol['data_cert_higienico']); ?>">
            </td>
          </tr>
          <tr><td colspan="3">
            <label class="campoFicha_Blanca" style="align-self:start; display:grid">Detall APR / geologia / notes:</label>
            <textarea name="detall_apr" class="contenedorFicha_Blanca" rows="3" cols="110"><?php echo h($sol['detall_apr']); ?></textarea>
          </td></tr>
        </table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Serveis i accessos</p></div>
        <table>
          <tr>
            <td>
              <label class="campoFicha_Blanca"><input type="checkbox" name="aigua_disponible" value="1" <?php echo ($serveis['aigua']['disponible'] ? 'checked' : ''); ?>> Aigua disponible</label><br>
              <label class="campoFicha_Blanca">Cabal (m³/h):</label>
              <input type="number" step="0.01" name="aigua_cabal_m3h" class="formularioFicha" value="<?php echo h($serveis['aigua']['cabal_m3h']); ?>"><br>
              <label class="campoFicha_Blanca">Pressió (kg/cm²):</label>
              <input type="number" step="0.01" name="aigua_pressio_kgcm2" class="formularioFicha" value="<?php echo h($serveis['aigua']['pressio_kgcm2']); ?>"><br>
              <label class="campoFicha_Blanca"><input type="checkbox" name="aigua_grup_pressio_necessari" value="1" <?php echo ($serveis['aigua']['grup_pressio_necessari'] ? 'checked' : ''); ?>> Requereix grup de pressió</label>
            </td>

            <td>
              <label class="campoFicha_Blanca"><input type="checkbox" name="electricitat_disponible" value="1" <?php echo ($serveis['electricitat']['disponible'] ? 'checked' : ''); ?>> Electricitat disponible</label><br>
              <label class="campoFicha_Blanca">kW obres:</label>
              <input type="number" step="0.01" name="electricitat_kw_obra" class="formularioFicha" value="<?php echo h($serveis['electricitat']['kw_obra']); ?>"><br>
              <label class="campoFicha_Blanca">kW funcionament:</label>
              <input type="number" step="0.01" name="electricitat_kw_funcionament" class="formularioFicha" value="<?php echo h($serveis['electricitat']['kw_funcionament']); ?>"><br>
              <label class="campoFicha_Blanca"><input type="checkbox" name="requereix_ct" value="1" <?php echo ($serveis['electricitat']['requereix_ct'] ? 'checked' : ''); ?>> Requereix CT</label>
            </td>
          </tr>

          <tr>
            <td>
              <label class="campoFicha_Blanca"><input type="checkbox" name="telefonia_disponible" value="1" <?php echo ($serveis['telefonia']['disponible'] ? 'checked' : ''); ?>> Telefonia disponible</label>
            </td>

            <td>
              <label class="campoFicha_Blanca"><input type="checkbox" name="clavegueram_disponible" value="1" <?php echo ($serveis['clavegueram']['disponible'] ? 'checked' : ''); ?>> Clavegueram disponible</label>
              &nbsp;&nbsp;
              <label class="campoFicha_Blanca">Cota:</label>
              <input type="number" step="0.01" name="clavegueram_cota" class="formularioFicha" value="<?php echo h($serveis['clavegueram']['cota']); ?>">
              &nbsp;&nbsp;
              <label class="campoFicha_Blanca">Diàmetre:</label>
              <input type="text" name="clavegueram_diametre" class="formularioFicha" value="<?php echo h($serveis['clavegueram']['diametre']); ?>">
            </td>
          </tr>

          <tr>
            <td>
              <label class="campoFicha_Blanca"><input type="checkbox" name="pluvials_disponible" value="1" <?php echo ($serveis['pluvials']['disponible'] ? 'checked' : ''); ?>> Xarxa pluvials disponible</label>
            </td>
            <td>
              <label class="campoFicha_Blanca">Solució pluvials (si no hi ha xarxa):</label>
              <textarea name="solucio_pluvials" class="contenedorFicha_Blanca" rows="2" cols="70"><?php echo h($serveis['pluvials']['solucio_pluvials']); ?></textarea>
            </td>
          </tr>

          <tr>
            <td colspan="2">
              <label class="campoFicha_Blanca">
                <input type="checkbox" name="accessos_ok" value="1" <?php echo ((int)$sol['accessos_ok']===1 ? 'checked' : ''); ?>> Accessos OK
              </label>
              &nbsp;&nbsp;
              <label class="campoFicha_Blanca">
                <input type="checkbox" name="estudi_mobilitat_aportat" value="1" <?php echo ((int)$sol['estudi_mobilitat_aportat']===1 ? 'checked' : ''); ?>> Estudi mobilitat aportat
              </label>
              &nbsp;&nbsp;
              <label class="campoFicha_Blanca">
                <input type="checkbox" name="accessibilitat_universal_ok" value="1" <?php echo ((int)$sol['accessibilitat_universal_ok']===1 ? 'checked' : ''); ?>> Accessibilitat universal OK
              </label>
              <br><br>
              <label class="campoFicha_Blanca">Detall accessos / mobilitat:</label>
              <input type="text" name="detall_accessos" class="formularioFicha" value="<?php echo h($sol['detall_accessos']); ?>" size="80">
            </td>
          </tr>
        </table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Documentació requerida</p></div>

        <table class="listado" cellpadding="0" cellspacing="0" width="100%">
          <thead>
            <tr>
              <th class="campoCabeceraListadoInicial">Document</th>
              <th class="campoCabeceraListado">Aportat</th>
              <th class="campoCabeceraListado">Data</th>
              <th class="campoCabeceraListado">Observacions</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($docTypes as $tipus => $lbl): ?>
              <tr>
                <td class="campoListadoInicial"><?php echo h($lbl); ?></td>
                <td class="campoListado" style="text-align:center;">
                  <input type="checkbox" name="doc[<?php echo h($tipus); ?>][aportat]" value="1" <?php echo ((int)$docs[$tipus]['aportat']===1 ? 'checked' : ''); ?>>
                </td>
                <td class="campoListado">
                  <input type="date" name="doc[<?php echo h($tipus); ?>][data_aportacio]" value="<?php echo h($docs[$tipus]['data_aportacio']); ?>">
                </td>
                <td class="campoListado">
                  <input type="text" name="doc[<?php echo h($tipus); ?>][observacions]" value="<?php echo h($docs[$tipus]['observacions']); ?>" size="60">
                </td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Informes sectorials</p></div>

        <table class="listado" cellpadding="0" cellspacing="0" width="100%">
          <thead>
            <tr>
              <th class="campoCabeceraListadoInicial">Tipus</th>
              <th class="campoCabeceraListado">Afectació</th>
              <th class="campoCabeceraListado">Viabilitat</th>
              <th class="campoCabeceraListado">Data</th>
              <th class="campoCabeceraListado">Condicionants</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($infTypes as $tipus => $lbl): ?>
              <tr>
                <td class="campoListadoInicial"><?php echo h($lbl); ?></td>

                <td class="campoListado">
                  <select class="campoFicha_Blanca" name="inf[<?php echo h($tipus); ?>][afectacio_sel]">
                    <?php
                      $sel = (string)$infs[$tipus]['afectacio_sel'];
                      $opts = ['pendent'=>'pendent','si'=>'Sí','no'=>'No'];
                      foreach ($opts as $v=>$t) {
                        $s = ($sel===$v) ? 'selected' : '';
                        echo '<option value="'.h($v).'" '.$s.'>'.h($t).'</option>';
                      }
                    ?>
                  </select>
                </td>

                <td class="campoListado">
                  <select class="campoFicha_Blanca" name="inf[<?php echo h($tipus); ?>][viabilitat]">
                    <?php
                      $selV = (string)$infs[$tipus]['viabilitat'];
                      $optsV = ['pendent'=>'Pendent','viable'=>'Viable','viable_condicionat'=>'Viable condicionat','no_viable'=>'No viable'];
                      foreach ($optsV as $v=>$t) {
                        $s = ($selV===$v) ? 'selected' : '';
                        echo '<option value="'.h($v).'" '.$s.'>'.h($t).'</option>';
                      }
                    ?>
                  </select>
                </td>

                <td class="campoListado">
                  <input type="date" name="inf[<?php echo h($tipus); ?>][data_informe]" value="<?php echo h($infs[$tipus]['data_informe']); ?>">
                </td>

                <td class="campoListado">
                  <input type="text" name="inf[<?php echo h($tipus); ?>][condicionants]" value="<?php echo h($infs[$tipus]['condicionants']); ?>" size="50">
                </td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Preparació del solar i post-obra</p></div>

        <table>
          <tr>
            <td>
              <label class="campoFicha_Blanca">
                <input type="checkbox" name="delimitat_fisicament" value="1" <?php echo ((int)$sol['delimitat_fisicament']===1 ? 'checked':''); ?>>
                Delimitat físicament
              </label>
              <label class="campoFicha_Blanca">Data:</label>
              <input type="date" name="data_delimitacio" class="formularioFicha" value="<?php echo h($sol['data_delimitacio']); ?>">
            </td>

            <td>
              <label class="campoFicha_Blanca">
                <input type="checkbox" name="sense_obstacles" value="1" <?php echo ((int)$sol['sense_obstacles']===1 ? 'checked':''); ?>>
                Sense obstacles
              </label>
              <label class="campoFicha_Blanca">Serveis bàsics OK?</label>
              <label class="campoFicha_Blanca" style="margin-left:10px;">
                <input type="checkbox" name="serveis_basics_ok" value="1" <?php echo ((int)$sol['serveis_basics_ok']===1 ? 'checked':''); ?>>
                Sí
              </label>
            </td>
          </tr>

          <tr>
            <td colspan="2">
              <label class="campoFicha_Blanca" style="align-self:start; display:grid">Observacions obstacles / estat físic:</label>
              <textarea name="observacions_obstacles" class="contenedorFicha_Blanca" rows="2" cols="110"><?php echo h($sol['observacions_obstacles']); ?></textarea>
            </td>
          </tr>

          <tr>
            <td>
              <label class="campoFicha_Blanca">
                <input type="checkbox" name="postobra_obra_nova_notari_feta" value="1" <?php echo ((int)$sol['postobra_obra_nova_notari_feta']===1 ? 'checked':''); ?>>
                Obra nova notari feta
              </label>
              <label class="campoFicha_Blanca">Data:</label>
              <input type="date" name="data_obra_nova" class="formularioFicha" value="<?php echo h($sol['data_obra_nova']); ?>">
            </td>

            <td>
              <label class="campoFicha_Blanca">
                <input type="checkbox" name="postobra_inscripcio_registre_feta" value="1" <?php echo ((int)$sol['postobra_inscripcio_registre_feta']===1 ? 'checked':''); ?>>
                Inscripció registre feta
              </label>
              <label class="campoFicha_Blanca">Data:</label>
              <input type="date" name="data_inscripcio" class="formularioFicha" value="<?php echo h($sol['data_inscripcio']); ?>">
              &nbsp;&nbsp;
              <label class="campoFicha_Blanca">
                <input type="checkbox" name="postobra_cessio_us_feta" value="1" <?php echo ((int)$sol['postobra_cessio_us_feta']===1 ? 'checked':''); ?>>
                Cessió d’ús feta (CEIP)
              </label>
            </td>
          </tr>
        </table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Notes / prioritats</p></div>
        <textarea name="notes" class="contenedorFicha_Blanca" rows="5" cols="110"><?php echo h($sol['notes']); ?></textarea>

        <div style="margin-top: 20px;">
          <input type="submit" class="boton" value="Guardar">
          <input type="button" class="boton" value="Tornar al llistat" onclick="location.href='solarListFiltro.php';">
        </div>

      </div>
    </div>
  </form>

  <?php if ($solarExists && $expedient_id > 0): ?>
    <form method="post"
          action="solarForm.php?id=<?php echo (int)$expedient_id; ?>"
          onsubmit="return confirmEliminar();"
          style="margin: 20px;">
      <input type="hidden" name="action" value="delete">
      <input type="hidden" name="expedient_id" value="<?php echo (int)$expedient_id; ?>">
      <button type="submit" class="boton" style="background:#b30000; color:#fff;">Eliminar solar</button>
    </form>
  <?php endif; ?>

</body>
</html>
