<?php
include '../connectarBD.php';

function h($s) { return htmlspecialchars((string)$s, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8'); }
function postBool($k) { return isset($_POST[$k]) ? 1 : 0; }

$expedient_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$errors = [];
$ok = false;

// ------- SAVE -------
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    error_reporting(E_ALL);
    ini_set('display_errors', '1');

    echo "<pre>POST RECIBIDO\n";
    print_r($_POST);
    echo "</pre>";

    function post_str(string $k): ?string
    {
        $v = trim($_POST[$k] ?? '');
        return $v === '' ? null : $v;
    }
    function post_int(string $k): ?int
    {
        $v = trim($_POST[$k] ?? '');
        return $v === '' ? null : (int) $v;
    }
    function post_dec(string $k): ?float
    {
        $v = trim($_POST[$k] ?? '');
        return $v === '' ? null : (float) $v;
    }
    function post_bool(string $k): int
    {
        return isset($_POST[$k]) ? 1 : 0;
    }

    $qualificacio_urbanistica = post_str('qualificacio_urbanistica');
    $parametres_edificatoris = post_str('parametres_edificatoris');
    $usos_permesos = post_str('usos_permesos');
    $detall_apr = trim($_POST['detall_apr'] ?? '');
    $data_delimitacio = trim($_POST['data_delimitacio'] ?? '');
    $observacions_obstacles = trim($_POST['observacions_obstacles'] ?? '');

    $expedient_id = isset($_POST['expedient_id']) ? (int)$_POST['expedient_id'] : 0;

  // En el prototipo el "Centre" es texto; para BD necesitamos centre_id.
  // Aquí lo recibimos como centre_id (te dejo abajo el select).
  $centre_id = isset($_POST['centre_id']) ? (int)$_POST['centre_id'] : 0;
  $centre_txt = trim($_POST['centre_txt'] ?? '');

  // Validació: centre_id ha d'existir realment a la taula centres
  $centre_nom = '';
  if ($centre_id > 0) {
    $stc = $connexio->prepare("SELECT Centre FROM centres WHERE id=? LIMIT 1");
    $stc->bind_param("i", $centre_id);
    if (!$stmt->execute()) {
        die("SQL ERROR: " . $stmt->error);
    }
    $rc = $stc->get_result()->fetch_assoc();
    if ($rc) $centre_nom = (string)$rc['Centre'];
    else $centre_id = 0; // invalida si no existeix
  }

  $estat = $_POST['estat'] ?? 'pendent';
  $data_sollicitud = $_POST['data_sollicitud'] ?: null;
  $obs_sollicitud = $_POST['obs_sollicitud'] ?: null;
  $data_topografic = $_POST['data_topografic'] ?: null;
  $obs_topografic = $_POST['obs_topografic'] ?: null;
  $data_acord_ple = $_POST['data_acord_ple'] ?: null;
  $obs_acord_ple = $_POST['obs_acord_ple'] ?: null;

  // Solars
  $illa_id = $_POST['illa_id'] !== '' ? (int)$_POST['illa_id'] : null;
  $municipi_id = $_POST['municipi_id'] !== '' ? (int)$_POST['municipi_id'] : null;

  $ref_cadastral = $_POST['ref_cadastral'] ?: null;
  $ref_registral = $_POST['ref_registral'] ?: null;
  $superficie_m2 = ($_POST['superficie_m2'] !== '') ? (float)$_POST['superficie_m2'] : null;
  $limits_confrontacions = $_POST['limits_confrontacions'] ?: null;

  $num_parcelles = ($_POST['num_parcelles'] !== '') ? (int)$_POST['num_parcelles'] : null;
  $requereix_agrupacio = postBool('requereix_agrupacio');
  $requereix_segregacio = postBool('requereix_segregacio');
  $observacions_parcelles = $_POST['observacions_parcelles'] ?: null;

  $titularitat_municipal_acreditada = postBool('titularitat_municipal_acreditada');
  $lliure_carregues = postBool('lliure_carregues');
  $lliure_gravamens = postBool('lliure_gravamens');
  $inventari_municipal_inclos = postBool('inventari_municipal_inclos');

  $qualificacio_urbanistica = $_POST['qualificacio_urbanistica'] ?? null;
  $parametres_edificatoris = $_POST['parametres_edificatoris'] ?? null;
  $usos_permesos = $_POST['usos_permesos'] ?? null;
  $detall_apr = $_POST['detall_apr'] ?? null;
  $data_delimitacio = $_POST['data_delimitacio'] ?? null;
  $observacions_obstacles = $_POST['observacions_obstacles'] ?? null;

  $qualificacio_urbanistica = trim($_POST['qualificacio_urbanistica'] ?? '');
  $parametres_edificatoris = trim($_POST['parametres_edificatoris'] ?? '');
  $usos_permesos = trim($_POST['usos_permesos'] ?? '');
  $detall_apr = trim($_POST['detall_apr'] ?? '');
  $data_delimitacio = trim($_POST['data_delimitacio'] ?? '');
  $observacions_obstacles = trim($_POST['observacions_obstacles'] ?? '');

  $afectacio_apr = postBool('afectacio_apr');
  $detall_apr = $_POST['detall_apr'] ?: null;

  $delimitat_fisicament = postBool('delimitat_fisicament');
  $data_delimitacio = $_POST['data_delimitacio'] ?: null;
  $sense_obstacles = postBool('sense_obstacles');
  $observacions_obstacles = $_POST['observacions_obstacles'] ?: null;
  $serveis_basics_ok = isset($_POST['serveis_basics_ok']) ? (int)$_POST['serveis_basics_ok'] : 0;

  // Tipus actuació (checkboxes del prototipo)
  $tipusChecks = [
    'obra_nova' => 'obra_nova',
    'reforma_integral' => 'reforma_integral',
    'ampliacio' => 'ampliacio',
    'urbanitzacio' => 'urbanitzacio',
    'altres' => 'altres'
  ];
  $tipusSeleccionats = [];
  foreach ($tipusChecks as $k => $tipus) {
    if (isset($_POST[$k])) $tipusSeleccionats[] = $tipus;
  }

  if ($centre_id <= 0) $errors[] = "Has de seleccionar un centre de la llista (no text lliure).";

  if (!$errors) {
    $connexio->begin_transaction();
    try {
      // UPSERT expediente
      if ($expedient_id > 0) {
        $sql = "UPDATE expedients_solar
                SET centre_id=?, estat=?,
                    data_sollicitud=?, obs_sollicitud=?,
                    data_topografic=?, obs_topografic=?,
                    data_acord_ple=?, obs_acord_ple=?
                WHERE id=?";
        $stmt = $connexio->prepare($sql);
        $stmt->bind_param(
          "isssssssi",
          $centre_id, $estat,
          $data_sollicitud, $obs_sollicitud,
          $data_topografic, $obs_topografic,
          $data_acord_ple, $obs_acord_ple,
          $expedient_id
        );
        if (!$stmt->execute()) {
            die("SQL ERROR: " . $stmt->error);
        }

        } else {
        $sql = "INSERT INTO expedients_solar
                (centre_id, estat, data_sollicitud, obs_sollicitud, data_topografic, obs_topografic, data_acord_ple, obs_acord_ple)
                VALUES (?,?,?,?,?,?,?,?)";
        $stmt = $connexio->prepare($sql);
        $stmt->bind_param(
          "isssssss",
          $centre_id, $estat,
          $data_sollicitud, $obs_sollicitud,
          $data_topografic, $obs_topografic,
          $data_acord_ple, $obs_acord_ple
        );
        if (!$stmt->execute()) {
            die("SQL ERROR: " . $stmt->error);
        }

        $expedient_id = $connexio->insert_id;
      }

      // Buscar solar principal existente (si lo hay)
      $solar_id = 0;
      $sql = "
        SELECT ass.solar_id
        FROM actuacions_solar a
        JOIN actuacions_solar_solars ass ON ass.actuacio_solar_id = a.id AND ass.rol='principal'
        WHERE a.expedient_id = ?
        LIMIT 1";
      $stmt = $connexio->prepare($sql);
      $stmt->bind_param("i", $expedient_id);
      if (!$stmt->execute()) {
          die("SQL ERROR: " . $stmt->error);
      }
      $r = $stmt->get_result()->fetch_assoc();
      if ($r) $solar_id = (int)$r['solar_id'];

      // UPSERT solar
      if ($solar_id > 0) {
        $sql = "UPDATE solars SET
                  municipi_id=?, illa_id=?,
                  ref_cadastral=?, ref_registral=?, superficie_m2=?, limits_confrontacions=?,
                  num_parcelles=?, requereix_agrupacio=?, requereix_segregacio=?, observacions_parcelles=?,
                  titularitat_municipal_acreditada=?, lliure_carregues=?, lliure_gravamens=?, inventari_municipal_inclos=?,
                  qualificacio_urbanistica=?, parametres_edificatoris=?, usos_permesos=?, afectacio_apr=?, detall_apr=?,
                  delimitat_fisicament=?, data_delimitacio=?, sense_obstacles=?, observacions_obstacles=?, serveis_basics_ok=?
                WHERE id=?";
        $stmt = $connexio->prepare($sql);
        $stmt->bind_param(
          "iissdsiii s iiiisssisisissii",
          $municipi_id, $illa_id,
          $ref_cadastral, $ref_registral, $superficie_m2, $limits_confrontacions,
          $num_parcelles, $requereix_agrupacio, $requereix_segregacio, $observacions_parcelles,
          $titularitat_municipal_acreditada, $lliure_carregues, $lliure_gravamens, $inventari_municipal_inclos,
          $qualificacio_urbanistica, $parametres_edificatoris, $usos_permesos, $afectacio_apr, $detall_apr,
          $delimitat_fisicament, $data_delimitacio, $sense_obstacles, $observacions_obstacles, $serveis_basics_ok,
          $solar_id
        );
        // El bind_param de arriba es muy sensible; si tu PHP da warning, te lo ajusto en tu estilo.
        if (!$stmt->execute()) {
            die("SQL ERROR: " . $stmt->error);
        }

        } else {
        $sql = "INSERT INTO solars (
                  municipi_id, illa_id,
                  ref_cadastral, ref_registral, superficie_m2, limits_confrontacions,
                  num_parcelles, requereix_agrupacio, requereix_segregacio, observacions_parcelles,
                  titularitat_municipal_acreditada, lliure_carregues, lliure_gravamens, inventari_municipal_inclos,
                  qualificacio_urbanistica, parametres_edificatoris, usos_permesos, afectacio_apr, detall_apr,
                  delimitat_fisicament, data_delimitacio, sense_obstacles, observacions_obstacles, serveis_basics_ok
                ) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        $stmt = $connexio->prepare($sql);
        $stmt->bind_param(
          "iissdsiiisiiiisssisisissii",
          $municipi_id, $illa_id,
          $ref_cadastral, $ref_registral, $superficie_m2, $limits_confrontacions,
          $num_parcelles, $requereix_agrupacio, $requereix_segregacio, $observacions_parcelles,
          $titularitat_municipal_acreditada, $lliure_carregues, $lliure_gravamens, $inventari_municipal_inclos,
          $qualificacio_urbanistica, $parametres_edificatoris, $usos_permesos, $afectacio_apr, $detall_apr,
          $delimitat_fisicament, $data_delimitacio, $sense_obstacles, $observacions_obstacles, $serveis_basics_ok
        );
        if (!$stmt->execute()) {
            die("SQL ERROR: " . $stmt->error);
        }

        $solar_id = $connexio->insert_id;
      }

      // Asegurar actuaciones por tipo y enlazar a solar (rol principal)
      foreach ($tipusSeleccionats as $idx => $tipus) {
        // buscar si existe actuacio (expedient_id + tipus)
        $sql = "SELECT id FROM actuacions_solar WHERE expedient_id=? AND tipus=? LIMIT 1";
        $stmt = $connexio->prepare($sql);
        $stmt->bind_param("is", $expedient_id, $tipus);
        if (!$stmt->execute()) {
            die("SQL ERROR: " . $stmt->error);
        }

        $row = $stmt->get_result()->fetch_assoc();

        if ($row) {
          $act_id = (int)$row['id'];
        } else {
          $sql = "INSERT INTO actuacions_solar (expedient_id, tipus) VALUES (?,?)";
          $stmt = $connexio->prepare($sql);
          $stmt->bind_param("is", $expedient_id, $tipus);
          $stmt->execute();
          $act_id = $connexio->insert_id;
        }

        // upsert puente
        $rol = ($idx === 0) ? 'principal' : 'auxiliar';
        $sql = "INSERT INTO actuacions_solar_solars (actuacio_solar_id, solar_id, rol)
                VALUES (?,?,?)
                ON DUPLICATE KEY UPDATE rol=VALUES(rol)";
        $stmt = $connexio->prepare($sql);
        $stmt->bind_param("iis", $act_id, $solar_id, $rol);
        if (!$stmt->execute()) {
            die("SQL ERROR: " . $stmt->error);
        }

      }

      $connexio->commit();
      $ok = true;
    } catch (Throwable $e) {
      $connexio->rollback();
      $errors[] = "Error guardant: " . $e->getMessage();
    }
  }
}

// ------- LOAD (para pintar el form) -------
$centre_id = 0;
$centre_txt = '';
$centre_nom = '';

$exp = [
  'id' => $expedient_id,
  'centre_id' => '',
  'estat' => 'pendent',
  'data_sollicitud' => '',
  'obs_sollicitud' => '',
  'data_topografic' => '',
  'obs_topografic' => '',
  'data_acord_ple' => '',
  'obs_acord_ple' => ''
];

$sol = [
  'illa_id' => '',
  'municipi_id' => '',
  'ref_cadastral' => '',
  'ref_registral' => '',
  'superficie_m2' => '',
  'limits_confrontacions' => '',
  'num_parcelles' => '',
  'requereix_agrupacio' => 0,
  'requereix_segregacio' => 0,
  'observacions_parcelles' => '',
  'titularitat_municipal_acreditada' => 0,
  'lliure_carregues' => 0,
  'lliure_gravamens' => 0,
  'inventari_municipal_inclos' => 0,
  'qualificacio_urbanistica' => '',
  'parametres_edificatoris' => '',
  'usos_permesos' => '',
  'afectacio_apr' => 0,
  'detall_apr' => '',
  'delimitat_fisicament' => 0,
  'data_delimitacio' => '',
  'sense_obstacles' => 0,
  'observacions_obstacles' => '',
  'serveis_basics_ok' => 0
];

$checkedTipus = [
  'obra_nova' => false,
  'reforma_integral' => false,
  'ampliacio' => false,
  'urbanitzacio' => false,
  'altres' => false
];

if ($expedient_id > 0) {
  $stmt = $connexio->prepare("SELECT e.*, c.Centre AS centre_nom FROM expedients_solar e JOIN centres c ON c.id=e.centre_id WHERE e.id=?");
  $stmt->bind_param("i", $expedient_id);
  if (!$stmt->execute()) {
      die("SQL ERROR: " . $stmt->error);
  }

    $row = $stmt->get_result()->fetch_assoc();
  if ($row) $exp = array_merge($exp, $row);

  $centre_id = (int)($exp['centre_id'] ?? 0);
  $centre_txt = (string)($exp['centre_nom'] ?? '');
  $centre_nom = $centre_txt;

  // solar principal si existe
  $sql = "
    SELECT s.*
    FROM actuacions_solar a
    JOIN actuacions_solar_solars ass ON ass.actuacio_solar_id=a.id AND ass.rol='principal'
    JOIN solars s ON s.id = ass.solar_id
    WHERE a.expedient_id=?
    LIMIT 1";
  $stmt = $connexio->prepare($sql);
  $stmt->bind_param("i", $expedient_id);
  if (!$stmt->execute()) {
      die("SQL ERROR: " . $stmt->error);
  }

  $row = $stmt->get_result()->fetch_assoc();
  if ($row) $sol = array_merge($sol, $row);

  // tipos marcados
  $stmt = $connexio->prepare("SELECT DISTINCT tipus FROM actuacions_solar WHERE expedient_id=?");
  $stmt->bind_param("i", $expedient_id);
  if (!$stmt->execute()) {
      die("SQL ERROR: " . $stmt->error);
  }

  $res = $stmt->get_result();
  while ($r = $res->fetch_assoc()) {
    $t = $r['tipus'];
    if (isset($checkedTipus[$t])) $checkedTipus[$t] = true;
  }
}

// centros para select
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Fitxa d’expedient de solar</title>
  <link rel="stylesheet" href="../css/estilos.css" type="text/css" />
  <link rel="stylesheet" href="../css/estilos_ficha_2.css" type="text/css" />
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

      const sel = "<?php echo h($sol['municipi_id']); ?>";
      if (sel) municipi.value = sel;
    }

    window.addEventListener('DOMContentLoaded', () => {
      if (document.getElementById('illa_id').value) onIllaChange();
    });

    // --- Autocomplete centres ---
    (function () {
      const input = document.getElementById('centre_txt');
      const hidden = document.getElementById('centre_id');
      const box = document.getElementById('centre_suggest');
      const label = document.getElementById('centre_selected_label');
      if (!input || !hidden || !box) return;

      let lastToken = 0;
      let timer = null;

      function hideBox() {
        box.style.display = 'none';
        box.innerHTML = '';
      }
      function showBox() { box.style.display = 'block'; }

      function invalidateSelection() {
        hidden.value = '';
        if (label) label.textContent = '';
      }

      function render(items) {
        box.innerHTML = '';
        if (!items.length) {
          const div = document.createElement('div');
          div.style.padding = '8px';
          div.style.color = '#666';
          div.textContent = 'Sense resultats';
          box.appendChild(div);
          showBox();
          return;
        }
        items.forEach(it => {
          const row = document.createElement('div');
          row.style.padding = '8px';
          row.style.cursor = 'pointer';
          row.style.borderBottom = '1px solid #eee';
          row.textContent = it.nom;

          row.addEventListener('mousedown', (e) => {
            e.preventDefault();
            input.value = it.nom;
            hidden.value = it.id;
            if (label) label.textContent = it.nom;
            hideBox();
          });

          box.appendChild(row);
        });
        showBox();
      }

      async function fetchCentres(q) {
        const token = ++lastToken;
        const r = await fetch('ajax_centres.php?q=' + encodeURIComponent(q));
        const data = await r.json();
        if (token !== lastToken) return;
        render(Array.isArray(data) ? data : []);
      }

      input.addEventListener('input', () => {
        const q = input.value.trim();
        invalidateSelection();
        if (timer) clearTimeout(timer);
        if (q.length < 2) { hideBox(); return; }
        timer = setTimeout(() => fetchCentres(q), 200);
      });

      input.addEventListener('focus', () => {
        const q = input.value.trim();
        if (q.length >= 2) fetchCentres(q);
      });

      document.addEventListener('click', (e) => {
        if (!box.contains(e.target) && e.target !== input) hideBox();
      });

      input.addEventListener('blur', () => {
        setTimeout(hideBox, 150);
      });
    })();

  </script>
</head>
<body class="contenido">
  <div class="contenedorFiltro"></div>

  <ul class="botoneraFicha">
    <li class="tituloFicha">
      <p class="posicionTituloFicha">FITXA D’EXPEDIENT DE SOLAR</p>
    </li>
  </ul>

  <div class="espacioMarron">&nbsp;</div>

  <?php if ($ok): ?>
    <div style="padding:10px; background:#dff0d8;">Guardat correctament.</div>
  <?php endif; ?>
  <?php foreach ($errors as $e): ?>
    <div style="padding:10px; background:#f2dede;"><?php echo h($e); ?></div>
  <?php endforeach; ?>

  <form method="post" action="solarForm.php<?php echo $expedient_id ? '?id='.(int)$expedient_id : ''; ?>">
    <div id="fichaEditable" style="background-color:#ffffff;">
      <div class="contenedorFicha">
        <input type="hidden" name="expedient_id" value="<?php echo (int)$expedient_id; ?>">

        <div class="tituloSeccion"><p class="textoTituloSeccion">Dades generals</p></div>
        <table>
          <tr>
            <td>
              <label class="campoFicha_Blanca">Estat:</label>
              <select id="estat" name="estat" class="campoFicha_Blanca">
                <option value="pendent" <?php echo ($exp['estat']==='pendent'?'selected':''); ?>>Pendent</option>
                <option value="en_tramit" <?php echo ($exp['estat']==='en_tramit'?'selected':''); ?>>En tràmit</option>
                <option value="tancat" <?php echo ($exp['estat']==='tancat'?'selected':''); ?>>Tancat</option>
              </select>
            </td>
            <td>
              <label class="campoFicha_Blanca">Centre:</label>
              <div style="position:relative; display:inline-block; width:520px;">
                <input
                  type="text"
                  id="centre_txt"
                  name="centre_txt"
                  class="formularioFicha"
                  style="width:100%;"
                  autocomplete="off"
                  placeholder="Escriu per cercar el centre..."
                  value="<?php echo h($centre_txt ?? ''); ?>"
                />
                <input type="hidden" id="centre_id" name="centre_id" value="<?php echo (int)($centre_id ?? 0); ?>" />
                <div
                  id="centre_suggest"
                  style="display:none; position:absolute; z-index:9999; left:0; right:0; top:100%;
                         background:#fff; border:1px solid #ccc; max-height:260px; overflow:auto;">
                </div>
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
                <option value="1" <?php echo ((string)$sol['illa_id']==='1'?'selected':''); ?>>Mallorca</option>
                <option value="2" <?php echo ((string)$sol['illa_id']==='2'?'selected':''); ?>>Menorca</option>
                <option value="3" <?php echo ((string)$sol['illa_id']==='3'?'selected':''); ?>>Eivissa</option>
                <option value="4" <?php echo ((string)$sol['illa_id']==='4'?'selected':''); ?>>Formentera</option>
              </select>
            </td>
            <td>
              <label class="campoFicha_Blanca">Municipi:</label>
              <select id="municipi_id" name="municipi_id" class="campoFicha_Blanca">
                <option value="">Selecciona un municipi</option>
              </select>
            </td>
          </tr>
        </table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Tipus d’actuació</p></div>
        <table><tr><td>
          <label class="campoFicha_Blanca" style="display:inline-block; margin-right:10px;">
            <input type="checkbox" name="obra_nova" value="1" <?php echo ($checkedTipus['obra_nova']?'checked':''); ?>> Obra nova
          </label>
          <label class="campoFicha_Blanca" style="display:inline-block; margin-right:10px;">
            <input type="checkbox" name="reforma_integral" value="1" <?php echo ($checkedTipus['reforma_integral']?'checked':''); ?>> Reforma integral
          </label>
          <label class="campoFicha_Blanca" style="display:inline-block; margin-right:10px;">
            <input type="checkbox" name="ampliacio" value="1" <?php echo ($checkedTipus['ampliacio']?'checked':''); ?>> Ampliació
          </label>
          <label class="campoFicha_Blanca" style="display:inline-block; margin-right:10px;">
            <input type="checkbox" name="urbanitzacio" value="1" <?php echo ($checkedTipus['urbanitzacio']?'checked':''); ?>> Urbanització
          </label>
          <label class="campoFicha_Blanca" style="display:inline-block; margin-right:10px;">
            <input type="checkbox" name="altres" value="1" <?php echo ($checkedTipus['altres']?'checked':''); ?>> Altres
          </label>
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
              <label class="campoFicha_Blanca">Data acord de ple:</label>
              <input type="date" name="data_acord_ple" class="formularioFicha" value="<?php echo h($exp['data_acord_ple']); ?>">
            </td>
            <td colspan="2">
              <label class="campoFicha_Blanca" style="align-self:start; display:grid">Obs. acord de ple:</label>
              <textarea name="obs_acord_ple" class="contenedorFicha_Blanca" rows="3" cols="70"><?php echo h($exp['obs_acord_ple']); ?></textarea>
            </td>
          </tr>
        </table>

        <div class="tituloSeccion" style="margin-top: 15px;"><p class="textoTituloSeccion">Identificació jurídica del solar</p></div>
        <table>
          <tr>
            <td>
              <label class="campoFicha_Blanca">Ref. cadastral:</label>
              <input type="text" name="ref_cadastral" class="formularioFicha" value="<?php echo h($sol['ref_cadastral']); ?>" size="30">
            </td>
            <td>
              <label class="campoFicha_Blanca">Ref. registral:</label>
              <input type="text" name="ref_registral" class="formularioFicha" value="<?php echo h($sol['ref_registral']); ?>" size="45">
            </td>
          </tr>
          <tr>
            <td>
              <label class="campoFicha_Blanca">Superfície (m²):</label>
              <input type="number" step="0.01" name="superficie_m2" class="formularioFicha" value="<?php echo h($sol['superficie_m2']); ?>">
            </td>
            <td>
              <label class="campoFicha_Blanca">Núm. parcel·les:</label>
              <input type="number" name="num_parcelles" class="formularioFicha" value="<?php echo h($sol['num_parcelles']); ?>">
              &nbsp;&nbsp;
              <label class="campoFicha_Blanca" style="display:inline-block; margin-right:10px;">
                <input type="checkbox" name="requereix_agrupacio" value="1" <?php echo ($sol['requereix_agrupacio']?'checked':''); ?>> Requereix agrupació
              </label>
              <label class="campoFicha_Blanca" style="display:inline-block;">
                <input type="checkbox" name="requereix_segregacio" value="1" <?php echo ($sol['requereix_segregacio']?'checked':''); ?>> Requereix segregació
              </label>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <label class="campoFicha_Blanca" style="align-self:start; display:grid">Límits:</label>
              <textarea name="limits_confrontacions" class="contenedorFicha_Blanca" rows="3" cols="100"><?php echo h($sol['limits_confrontacions']); ?></textarea>
            </td>
          </tr>
          <tr>
            <td colspan="2">
              <label class="campoFicha_Blanca" style="align-self:start; display:grid">Observacions parcel·les:</label>
              <textarea name="observacions_parcelles" class="contenedorFicha_Blanca" rows="2" cols="100"><?php echo h($sol['observacions_parcelles']); ?></textarea>
            </td>
          </tr>
        </table>

        <div style="margin-top:15px;">
          <input type="submit" class="boton" value="Desar canvis">
          <input type="button" class="boton" value="Tornar al llistat" onclick="window.location.href='solarListFiltro.php'">
        </div>
      </div>
    </div>
  </form>
  <script src="../js/centre_autocomplete.js"></script>
</body>
</html>
