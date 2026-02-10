<?php
// solarListFiltro.php
// Listado de expedientes con filtros + autocomplete de centre (centre_id real)
declare(strict_types=1);

include '../connectarBD.php';

function h($v): string {
  return htmlspecialchars((string)$v, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
}

$centre_id = isset($_POST['centre_id']) ? (int)$_POST['centre_id'] : 0;
$centre_txt = trim($_POST['centre_txt'] ?? '');

$illa_id = trim($_POST['illa_filtro'] ?? '');
$municipi_id = trim($_POST['municipi_filtro'] ?? '');
$estat = trim($_POST['estat_filtro'] ?? '');
$data_ini = trim($_POST['data_inici_filtro'] ?? '');
$data_fi = trim($_POST['data_fi_filtro'] ?? '');

// Si han escrito texto pero no han seleccionado id, anulamos el texto para evitar búsquedas "falsas"
if ($centre_txt !== '' && $centre_id <= 0) {
  $centre_txt = '';
}

$where = [];
$params = [];
$types = "";

// Centro por id (FK)
if ($centre_id > 0) {
  $where[] = "e.centre_id = ?";
  $types .= "i";
  $params[] = $centre_id;
}

if ($illa_id !== '') {
  $where[] = "s.illa_id = ?";
  $types .= "i";
  $params[] = (int)$illa_id;
}

if ($municipi_id !== '') {
  $where[] = "s.municipi_id = ?";
  $types .= "i";
  $params[] = (int)$municipi_id;
}

if ($estat !== '') {
  $where[] = "e.estat = ?";
  $types .= "s";
  $params[] = $estat;
}

if ($data_ini !== '') {
  $where[] = "e.data_sollicitud >= ?";
  $types .= "s";
  $params[] = $data_ini;
}

if ($data_fi !== '') {
  $where[] = "e.data_sollicitud <= ?";
  $types .= "s";
  $params[] = $data_fi;
}

$sql = "
SELECT
  e.id AS expedient_id,
  c.Centre AS centre_nom,
  m.nom AS municipi_nom,
  i.nom AS illa_nom,
  COALESCE(GROUP_CONCAT(DISTINCT a.tipus ORDER BY a.tipus SEPARATOR ', '), '') AS tipus_actuacio,
  e.data_sollicitud,
  e.data_topografic,
  e.data_acord_ple,
  e.estat
FROM expedients_solar e
LEFT JOIN centres c ON c.id = e.centre_id
LEFT JOIN actuacions_solar a ON a.expedient_id = e.id
LEFT JOIN actuacions_solar_solars ass ON ass.actuacio_solar_id = a.id AND ass.rol = 'principal'
JOIN solars s ON s.id = ass.solar_id
LEFT JOIN municipi m ON m.id = s.municipi_id
LEFT JOIN illa i ON i.id = s.illa_id
";

if ($where) {
  $sql .= " WHERE " . implode(" AND ", $where);
}

$sql .= "
GROUP BY e.id, c.Centre, m.nom, i.nom, e.data_sollicitud, e.data_topografic, e.data_acord_ple, e.estat
ORDER BY e.updated_at DESC, e.id DESC
LIMIT 500
";

$stmt = $connexio->prepare($sql);
if ($types !== "") {
  $stmt->bind_param($types, ...$params);
}
$stmt->execute();
$res = $stmt->get_result();

// Illes para el select
$illes = $connexio->query("SELECT id, nom FROM illa ORDER BY nom")->fetch_all(MYSQLI_ASSOC);
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Gestió de solars</title>

  <link rel="stylesheet" href="../css/estilos.css" type="text/css" />
  <script src="../js/utiles.js" language="JavaScript"></script>
  <script src="../js/especificas.js" language="JavaScript"></script>

  <script>
    async function onIllaChange() {
      const illa = document.getElementById('illa_filtro').value;
      const municipi = document.getElementById('municipi_filtro');
      municipi.innerHTML = '<option value="">Seleccioni un municipi</option>';
      if (!illa) return;

      const r = await fetch('ajax_municipis.php?illa_id=' + encodeURIComponent(illa));
      const data = await r.json();
      data.forEach((m) => {
        const opt = document.createElement('option');
        opt.value = m.id;
        opt.textContent = m.nom;
        municipi.appendChild(opt);
      });

      const sel = document.getElementById('municipi_filtro').dataset.selected;
      if (sel) municipi.value = sel;
    }

    // --- Centre autocomplete (mismo patrón que en el form) ---
    function initCentreAutocomplete() {
      const input = document.getElementById('centre_txt');
      const hidden = document.getElementById('centre_id');
      const box = document.getElementById('centre_suggest');

      let lastFetch = 0;
      let timer = null;
      let lastQuery = '';

      function hideBox() {
        box.style.display = 'none';
        box.innerHTML = '';
      }
      function showBox() { box.style.display = 'block'; }

      function clearSelectionIfTextChanged() {
        hidden.value = '';
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
            hideBox();
          });

          box.appendChild(row);
        });

        showBox();
      }

      async function fetchCentres(q) {
        const now = Date.now();
        lastFetch = now;
        const r = await fetch('ajax_centres.php?q=' + encodeURIComponent(q));
        const data = await r.json();
        if (lastFetch !== now) return;
        render(data);
      }

      input.addEventListener('input', () => {
        const q = input.value.trim();
        clearSelectionIfTextChanged();

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

      input.addEventListener('blur', () => {
        setTimeout(() => hideBox(), 150);
      });
    }

    window.addEventListener('DOMContentLoaded', () => {
      // Municipis si illa seleccionada
      const illa = document.getElementById('illa_filtro').value;
      if (illa) onIllaChange();
      initCentreAutocomplete();
    });
  </script>
</head>

<body class="contenido" onload="ocultarFondoPrincipal();">
  <div class="contenedorFiltro">
    <h2>Gestió de solars</h2>

    <form method="POST" action="solarListFiltro.php">
      <table cellpadding="0" cellspacing="0" class="cajaFiltro">
        <tr>
          <td class="contenedorCamposFiltro">
            <div class="filtro">
              <label for="centre_txt" class="formularioFiltro">Centre:</label>

              <div style="position:relative; display:inline-block; width:420px; vertical-align:middle;">
                <input
                  type="text"
                  id="centre_txt"
                  name="centre_txt"
                  value="<?= h($centre_txt) ?>"
                  placeholder="Escriu per cercar el centre..."
                  autocomplete="off"
                  style="width:100%;"
                />
                <input type="hidden" id="centre_id" name="centre_id" value="<?= (int)$centre_id ?>" />
                <div
                  id="centre_suggest"
                  style="display:none; position:absolute; z-index:9999; left:0; right:0; top:100%;
                         background:#fff; border:1px solid #ccc; max-height:260px; overflow:auto;">
                </div>
              </div>

              <label for="illa_filtro" class="formularioFiltro">Illa:</label>
              <select id="illa_filtro" name="illa_filtro" class="campoFicha_Blanca" onchange="onIllaChange()">
                <option value="">Seleccioni una illa</option>
                <?php foreach ($illes as $il): ?>
                  <option value="<?= (int)$il['id'] ?>" <?= ((string)$il['id'] === (string)$illa_id) ? 'selected' : '' ?>>
                    <?= h($il['nom']) ?>
                  </option>
                <?php endforeach; ?>
              </select>

              <label for="municipi_filtro" class="formularioFiltro">Municipi:</label>
              <select id="municipi_filtro" name="municipi_filtro" class="campoFicha_Blanca" data-selected="<?= h($municipi_id) ?>">
                <option value="">Seleccioni un municipi</option>
              </select>

              <label for="estat_filtro" class="formularioFiltro">Estat:</label>
              <select id="estat_filtro" name="estat_filtro" class="campoFicha_Blanca">
                <option value="" <?= $estat===''?'selected':'' ?>>Tots</option>
                <option value="pendent" <?= $estat==='pendent'?'selected':'' ?>>Pendent</option>
                <option value="en_tramit" <?= $estat==='en_tramit'?'selected':'' ?>>En tràmit</option>
                <option value="tancat" <?= $estat==='tancat'?'selected':'' ?>>Tancat</option>
              </select>
            </div>
          </td>
        </tr>

        <tr>
          <td class="contenedorCamposFiltro">
            <div class="filtro">
              <label for="data_inici_filtro" class="formularioFiltro">Data sol·licitud (des de):</label>
              <input type="date" id="data_inici_filtro" name="data_inici_filtro" value="<?= h($data_ini) ?>">

              <label for="data_fi_filtro" class="formularioFiltro">Fins a:</label>
              <input type="date" id="data_fi_filtro" name="data_fi_filtro" value="<?= h($data_fi) ?>">

              <button type="submit" class="boton">Cercar</button>
              <button type="button" class="boton" onclick="window.location.href='solarListFiltro.php'">Netejar</button>
            </div>
          </td>
        </tr>
      </table>
    </form>
  </div>

  <ul class="botoneraListado">
    <li class="tituloListado">LLISTAT D’EXPEDIENTS DE SOLARS</li>
    <li class="fondoBotoneraListado">
      <input type="button" class="boton" value="Nou expedient" onclick="location.href='solarForm.php';">
    </li>
  </ul>

  <div class="espacioMarronClaro"></div>

  <div id="cuerpo" class="scroll_total">
    <table class="listado" cellpadding="0" cellspacing="0" width="100%">
      <thead>
        <tr>
          <th class="campoCabeceraListadoInicial">Centre</th>
          <th class="campoCabeceraListado">Municipi</th>
          <th class="campoCabeceraListado">Illa</th>
          <th class="campoCabeceraListado">Tipus actuació</th>
          <th class="campoCabeceraListado">Sol·licitud</th>
          <th class="campoCabeceraListado">Topogràfic</th>
          <th class="campoCabeceraListado">Acord de ple</th>
          <th class="campoCabeceraListado">Estat</th>
        </tr>
      </thead>

      <tbody>
        <?php while ($r = $res->fetch_assoc()): ?>
          <tr style="cursor:pointer" onclick="window.location.href='solarForm.php?id=<?= (int)$r['expedient_id'] ?>'">
            <td class="campoListadoInicial"><?= h($r['centre_nom']) ?></td>
            <td class="campoListado"><?= h($r['municipi_nom']) ?></td>
            <td class="campoListado"><?= h($r['illa_nom']) ?></td>
            <td class="campoListado"><?= h($r['tipus_actuacio']) ?></td>
            <td class="campoListado"><?= h($r['data_sollicitud']) ?></td>
            <td class="campoListado"><?= h($r['data_topografic']) ?></td>
            <td class="campoListado"><?= h($r['data_acord_ple']) ?></td>
            <td class="campoListado"><?= h($r['estat']) ?></td>
          </tr>
        <?php endwhile; ?>
      </tbody>
    </table>
  </div>
</body>
</html>
