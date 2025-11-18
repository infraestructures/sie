<?php
include '../connectarBD.php';

// Variables rebudes
$idCentre = isset($_POST['id_centre']) ? $_POST['id_centre'] : '';
$codiFiltro = isset($_POST['codi_filtro']) ? $_POST['codi_filtro'] : '';
$centreFiltro = isset($_POST['centre_filtro']) ? $_POST['centre_filtro'] : '';
$illaFiltro = isset($_POST['illa_filtro']) ? $_POST['illa_filtro'] : '';
$municipiFiltro = isset($_POST['municipi_filtro']) ? $_POST['municipi_filtro'] : '';
$dataIniciFiltro = isset($_POST['data_inici_filtro']) ? $_POST['data_inici_filtro'] : '';
$dataFiFiltro = isset($_POST['data_fi_filtro']) ? $_POST['data_fi_filtro'] : '';
$tipusFiltro = isset($_POST['tipus_filtro']) ? $_POST['tipus_filtro'] : '';
$subtipusFiltro = isset($_POST['subtipus_filtro']) ? $_POST['subtipus_filtro'] : '';
$prioritatFiltro = isset($_POST['prioritat_filtro']) ? $_POST['prioritat_filtro'] : '';
$superestatFiltro = isset($_POST['superestat_filtro']) ? $_POST['superestat_filtro'] : '';
$estatFiltro = isset($_POST['estat_filtro']) ? $_POST['estat_filtro'] : '';
$tecnicFiltro = isset($_POST['tecnic_filtro']) ? $_POST['tecnic_filtro'] : '';
$descripcioFiltro = isset($_POST['descripcio_filtro']) ? $_POST['descripcio_filtro'] : '';

// Variables de ordenación
$order_by = isset($_GET['order_by']) ? $_GET['order_by'] : 'codi'; // Por defecto ordenar por código
$order_direction = isset($_GET['order_direction']) ? $_GET['order_direction'] : 'DESC'; // Por defecto, orden descendente

// Función para alternar la dirección de ordenación
function getOrderDirection($column, $current_order_by, $current_order_direction)
{
    if ($current_order_by == $column) {
        return ($current_order_direction == 'ASC') ? 'DESC' : 'ASC';
    } else {
        return 'ASC'; // Si se cambia de columna, se empieza por ASC
    }
}

// Consultar datos para los desplegables
$illasQuery = "SELECT id, nom FROM Illa ORDER BY nom"
;
$illasResult = $connexio->query($illasQuery);

$municipisQuery = $illaFiltro
    ? "SELECT id, nom FROM Municipi WHERE illa_id = $illaFiltro ORDER BY nom"
    : "SELECT id, nom FROM Municipi ORDER BY nom";
$municipisResult = $connexio->query($municipisQuery);

// Obtenir els tipus d'actuació
$sql = "SELECT id, nom FROM tipus_actuacio order by id";
$result_tipus_actuacio = $connexio->query($sql);

// Consulta per obtenir la llista de superestats
$sql_superestats = "SELECT id, nom FROM superestat_actuacio order by ordre";
$result_superestats = $connexio->query($sql_superestats);

// Consulta per obtenir la llista d'estats
$sql_estats = "SELECT id, nom FROM estat_actuacio order by ordre";
$result_estats = $connexio->query($sql_estats);

// Consulta per obtenir la llista de prioritats
$sql_prioritats = "SELECT id, nom FROM prioritat_actuacio order by id";
$result_prioritats = $connexio->query($sql_prioritats);

// Consulta per obtenir la llista de tècnics
$sql_tecnics = "SELECT id, nom FROM tecnic order by id";
$result_tecnics = $connexio->query($sql_tecnics);

// Consultar los datos de los centros utilizando códigos
$sql = "SELECT
                a.id,
                a.codi,
                a.descripcio,
                a.pressupost,
                a.observacions,
                a.estat_id, 
                a.prioritat_id,
                a.subtipus_id,
                a.data_entrada,
                a.tecnic_id,
                c.id_illa,
                c.id_municipi,
                a.centre_id,
                s.tipus_id,
                e.color,
                i.nom AS nom_illa,
                m.nom AS nom_municipi,
                c.Centre AS nom_centre,
                se.nom AS nom_superestat,
                e.nom AS nom_estat,
                p.nom AS nom_prioritat,
                s.nom AS nom_subtipus,
                t.nom AS nom_tipus,
                tc.nom AS nom_tecnic

            FROM actuacions a
                LEFT JOIN subtipus_actuacio s ON a.subtipus_id = s.id
                LEFT JOIN tipus_actuacio t ON s.tipus_id = t.id
                JOIN centres c ON a.centre_id = c.id
                LEFT JOIN illa i ON c.id_illa = i.id
                LEFT JOIN municipi m ON c.id_municipi = m.id
                LEFT JOIN estat_actuacio e ON a.estat_id = e.id
                LEFT JOIN superestat_actuacio se ON se.id = e.superestat_id
                LEFT JOIN prioritat_actuacio p ON a.prioritat_id = p.id
                LEFT JOIN tecnic tc ON a.tecnic_id = tc.id
            WHERE 1 = 1     
            ";

if (!empty($codiFiltro)) {
    $sql .= " AND a.codi LIKE '%" . $connexio->real_escape_string($codiFiltro) . "%'";
}
if (!empty($centreFiltro)) {
    $sql .= " AND c.Centre LIKE '%" . $connexio->real_escape_string($centreFiltro) . "%'";
}
if (!empty($illaFiltro)) {
    $sql .= " AND c.id_illa = " . intval($illaFiltro);
}
if (!empty($municipiFiltro)) {
    $sql .= " AND c.id_municipi = " . intval($municipiFiltro);
}
if (!empty($tipusFiltro)) {
    $sql .= " AND s.tipus_id = " . intval($tipusFiltro);
}
if (!empty($subtipusFiltro)) {
    $sql .= " AND a.subtipus_id = " . intval($subtipusFiltro);
}
if (!empty($prioritatFiltro)) {
    $sql .= " AND a.prioritat_id = " . intval($prioritatFiltro);
}
if (!empty($superestatFiltro)) {
    $sql .= " AND se.id = " . intval($superestatFiltro);
}
if (!empty($estatFiltro)) {
    $sql .= " AND e.id = " . intval($estatFiltro);
}
if (!empty($dataIniciFiltro)) {
    $sql .= " AND a.data_entrada >= '" . $dataIniciFiltro . "'";
}
if (!empty($dataFiFiltro)) {
    $sql .= " AND a.data_entrada <= '" . $dataFiFiltro . "'";
}
if (!empty($tecnicFiltro)) {
    $sql .= " AND a.tecnic_id = " . intval($tecnicFiltro);
}
if (!empty($descripcioFiltro)) {
    $sql .= " AND a.descripcio LIKE '%" . $connexio->real_escape_string($descripcioFiltro) . "%'";
}

//  Añadir la ordenación a la consulta
if ($order_by == 'codi') {
    $sql .= " ORDER BY CAST(SUBSTRING_INDEX(a.codi, '-', -1) AS UNSIGNED) " . $order_direction . ", 
             CAST(SUBSTRING_INDEX(a.codi, '-', 1) AS UNSIGNED) " . $order_direction . ";";
} elseif ($order_by == 'nom_centre') {
    $sql .= " ORDER BY nom_centre " . $order_direction;
} elseif ($order_by == 'data_entrada') {
    $sql .= " ORDER BY data_entrada " . $order_direction;
} elseif ($order_by == 'prioritat_id') {
    $sql .= " ORDER BY prioritat_id " . $order_direction;
} elseif ($order_by == 'nom_estat') {
    $sql .= " ORDER BY nom_estat " . $order_direction;
} elseif ($order_by == 'nom_tipus') {
    $sql .= " ORDER BY nom_tipus " . $order_direction;
} elseif ($order_by == 'nom_subtipus') {
    $sql .= " ORDER BY nom_subtipus " . $order_direction;
} elseif ($order_by == 'descripcio') {
    $sql .= " ORDER BY descripcio " . $order_direction;
} elseif ($order_by == 'nom_tecnic') {
    $sql .= " ORDER BY nom_tecnic " . $order_direction;
} else {
    $sql .= " ORDER BY a.codi " . $order_direction; // Orden por defecto
}

$result_actuacions = $connexio->query($sql);

if (!$result_actuacions) {
    die("S'ha produit un error al consultar les actuacions" . $connexio->error);
}

?>

<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestió d'actuacions</title>

    <link rel="stylesheet" href="../css/estilos.css" type="text/css" />
    <script src="../js/utiles.js" type="" language="JavaScript"></script>
    <script src="../js/especificas.js" type="" language="JavaScript"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#illa_filtro').change(function() {
                var illaID = $(this).val();
                console.log("Illa seleccionada:", illaID); 
                $.ajax({
                    type: 'POST',
                    url: 'getMunicipis.php',
                    data: { illa: illaID },
                    success: function(response) {
                        console.log("Resposta AJAX:", response); // DEBUG
                        $('#municipi_filtro').html(response);
                        $('#centre_filtro').html('<option value="">Selecciona un centre</option>');
                    },
                    error: function(xhr, status, error) {
                        console.error("Error en AJAX:", error);
                    }
                });
            });

            $('#municipi_filtro').change(function() {
                var municipiID = $(this).val();
                console.log("Municipi seleccionat:", municipiID);
                $.ajax({
                    type: 'POST',
                    url: 'getCentres.php',
                    data: { municipi: municipiID },
                    success: function(response) {
                        $('#centre_filtro').html(response);
                    },
                    error: function(xhr, status, error) {
                        console.error("Error en AJAX:", error);
                    }
                });
            });
            var tipusId = $("#tipus_filtro").val();
            var subtipusId = "<?php echo $subtipusFiltro; ?>"; // Captura desde PHP
            var superestatId = "<?php echo $superestatFiltro; ?>"; // Captura desde PHP
            var estatId = "<?php echo $estatFiltro; ?>"; // Captura desde PHP

            // Función para cargar subtipus
            function cargarSubtipus(tipusId, subtipusId = null) {
                if (tipusId) {
                    $.ajax({
                        url: "getSubtipus.php",
                        type: "POST",
                        data: {
                            tipus_id: tipusId,
                            subtipus_id: subtipusId
                        },
                        success: function(data) {
                            $("#subtipus_filtro").html(data);
                            $("#subtipus_filtro").prop("disabled", false);
                        }
                    });
                } else {
                    $("#subtipus_filtro").html('<option value="">Selecciona un subtipus</option>');
                    $("#subtipus_filtro").prop("disabled", true);
                }
            }

            $("#tipus_filtro").change(function() { cargarSubtipus($(this).val()); });

            // Función para cargar estados
            function cargarEstats(superestatId, estatId = null) {
                if (superestatId) {
                    $.ajax({
                        url: "getEstats.php",
                        type: "POST",
                        data: {
                            superestat_id: superestatId,
                            estat_id: estatId
                        },
                        success: function(data) {
                            $("#estat_filtro").html(data);
                            $("#estat_filtro").prop("disabled", false);
                        }
                    });
                } else {
                    $("#estat_filtro").html('<option value="">Selecciona un estat</option>');
                    $("#estat_filtro").prop("disabled", true);
                }
            }

            if (superestatId) { cargarEstats(superestatId, estatId); }
            // Carga inicial si hay valores seleccionados tras pulsar "Cercar"
            if (superestatId) {
                cargarEstats(superestatId, estatId);
            }

            // Carga dinámica al cambiar el tipus
            $("#superestat_filtro").change(function() {
                cargarEstats($(this).val());
            });
       
        });

    </script>  
</head>

<body class="contenido" onload="ocultarFondoPrincipal();">
    <div class="contenedorFiltro">
  <h2>Gestió d'actuacions</h2>
        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="formularioFiltro">
  <form id="formularioFiltroBusqueda" name="formularioFiltroBusqueda" action="actuacioListFiltro.php" method="post">
    <!-- Fila 1 -->
    <tr>
      <td class="contenedorCamposFiltro">
        <label for="codi_filtro" class="formularioFiltro">Codi d'actuació:</label>
        <input type="text" name="codi_filtro" value="<?= htmlspecialchars($codiFiltro) ?>">
      </td>
      <td class="contenedorCamposFiltro">
        <label for="centre_filtro" class="formularioFiltro">Centre:</label>
        <input type="text" name="centre_filtro" value="<?= htmlspecialchars($centreFiltro) ?>">
      </td>
      <td class="contenedorCamposFiltro">
        <label for="illa_filtro" class="formularioFiltro">Illa:</label>
        <select id="illa_filtro" name="illa_filtro" class="campoFicha_Blanca">
          <option value="">Seleccioni una illa</option>
          <?php while ($row = $illasResult->fetch_assoc()): ?>
            <option value="<?= $row['id'] ?>" <?= $row['id'] == $illaFiltro ? 'selected' : '' ?>>
              <?= htmlspecialchars($row['nom']) ?>
            </option>
          <?php endwhile; ?>
        </select>
      </td>
      <td class="contenedorCamposFiltro">
        <label for="municipi_filtro" class="formularioFiltro">Municipi:</label>
        <select id="municipi_filtro" name="municipi_filtro" class="campoFicha_Blanca">
          <option value="">Seleccioni un municipi</option>
          <?php while ($row = $municipisResult->fetch_assoc()): ?>
            <option value="<?= $row['id'] ?>" <?= $row['id'] == $municipiFiltro ? 'selected' : '' ?>>
              <?= htmlspecialchars($row['nom']) ?>
            </option>
          <?php endwhile; ?>
        </select>
      </td>
    </tr>

    <!-- Fila 2 -->
    <tr>
      <td class="contenedorCamposFiltro">
        <label for="tipus_filtro" class="formularioFiltro">Tipus:</label>
        <select name="tipus_filtro" id="tipus_filtro" class="campoFicha_Blanca">
          <option value="">Tots</option>
          <?php while ($row = $result_tipus_actuacio->fetch_assoc()): ?>
            <option value="<?= $row['id'] ?>" <?= $row['id'] == $tipusFiltro ? 'selected' : '' ?>>
              <?= htmlspecialchars($row['nom']) ?>
            </option>
          <?php endwhile; ?>
        </select>
      </td>
      <td class="contenedorCamposFiltro">
        <label for="subtipus_filtro" class="formularioFiltro">Subtipus:</label>
        <select name="subtipus_filtro" id="subtipus_filtro" class="campoFicha_Blanca">
          <option value="">Tots</option>
        </select>
      </td>
      <td class="contenedorCamposFiltro">
        <label for="superestat_filtro" class="formularioFiltro">Estat:</label>
        <select name="superestat_filtro" id="superestat_filtro" class="campoFicha_Blanca">
          <option value="">Tots</option>
          <?php while ($row = $result_superestats->fetch_assoc()): ?>
            <option value="<?= $row['id'] ?>" <?= $row['id'] == $superestatFiltro ? 'selected' : '' ?>>
              <?= htmlspecialchars($row['nom']) ?>
            </option>
          <?php endwhile; ?>
        </select>
      </td>
      <td class="contenedorCamposFiltro">
        <label for="estat_filtro" class="formularioFiltro">Subestat:</label>
        <select name="estat_filtro" id="estat_filtro" class="campoFicha_Blanca">
          <option value="">Tots</option>
        </select>
      </td>
    </tr>

    <!-- Fila 3 -->
    <tr>
      <td class="contenedorCamposFiltro">
        <label for="prioritat_filtro" class="formularioFiltro">Prioritat:</label>
        <select name="prioritat_filtro" class="campoFicha_Blanca">
          <option value="">Totes</option>
          <?php while ($row = $result_prioritats->fetch_assoc()): ?>
            <option value="<?= $row['id'] ?>" <?= $row['id'] == $prioritatFiltro ? 'selected' : '' ?>>
              <?= htmlspecialchars($row['nom']) ?>
            </option>
          <?php endwhile; ?>
        </select>
      </td>
      <td class="contenedorCamposFiltro">
        <label for="data_inici_filtro" class="formularioFiltro">Data Inici:</label>
        <input type="date" name="data_inici_filtro" value="<?= htmlspecialchars($dataIniciFiltro) ?>">
      </td>
      <td class="contenedorCamposFiltro">
        <label for="data_fi_filtro" class="formularioFiltro">Data Fi:</label>
        <input type="date" name="data_fi_filtro" value="<?= htmlspecialchars($dataFiFiltro) ?>">
      </td>
      <td class="contenedorCamposFiltro">
        <label for="descripcio_filtro" class="formularioFiltro">Descripció</label>
        <input type="text" name="descripcio_filtro" value="<?= htmlspecialchars($descripcioFiltro) ?>" class="campoFicha_Blanca">
      </td>
    </tr>

    <!-- Fila 4 -->
    <tr>
      <td class="contenedorCamposFiltro">
        <label for="tecnic_filtro" class="formularioFiltro">Tècnic:</label>
        <select name="tecnic_filtro" class="campoFicha_Blanca">
          <option value="">Tots</option>
          <?php while ($row = $result_tecnics->fetch_assoc()): ?>
            <option value="<?= $row['id'] ?>" <?= $row['id'] == $tecnicFiltro ? 'selected' : '' ?>>
              <?= htmlspecialchars($row['nom']) ?>
            </option>
          <?php endwhile; ?>
        </select>
      </td>
      <td colspan="3" class="contenedorCamposFiltro" style="vertical-align: bottom;">
        <input type="submit" class="btnBuscar" name="btnConsultar" value="Cercar">
          <button type="button" class="boton" onclick="location.href='PDFListFiltro.php'">Informes PDF</button>
      </td>
    </tr>
  </form>
</table>

    </div>
        <ul class="botoneraListado">
        <li class="tituloListado">LLISTAT D'ACTUACIONS</li>
        <li class="fondoBotoneraListado">
            <input type="button" class="boton" value="Nova actuació" onclick="location.href='actuacioForm.php';">
        </li>
    </ul>
    <div class="contenedorListado">
        <table class="listado" cellpadding="0" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th class="campoCabeceraListadoInicial">
                        <a href="?order_by=codi&order_direction=<?= getOrderDirection('codi', $order_by, $order_direction) ?>">
                            Codi Actuació
                        </a>
                    </th>
                    <th class="campoCabeceraListado">
                        <a href="?order_by=nom_centre&order_direction=<?= getOrderDirection('nom_centre', $order_by, $order_direction) ?>">
                            Centre
                        </a>
                    </th>
                    <th class="campoCabeceraListado" style="min-width:90px; white-space:nowrap;">
                        <a href="?order_by=data_entrada&order_direction=<?= getOrderDirection('data_entrada', $order_by, $order_direction) ?>">
                            Data Entrada
                        </a>
                    </th>
                    <th class="campoCabeceraListado">
                        <a href="?order_by=prioritat_id&order_direction=<?= getOrderDirection('prioritat_id', $order_by, $order_direction) ?>">
                            Prioritat
                        </a>
                    </th>

                    <th class="campoCabeceraListado">
                        <a href="?order_by=nom_estat&order_direction=<?= getOrderDirection('nom_estat', $order_by, $order_direction) ?>">
                            Estat
                        </a>
                    </th>

                    <th class="campoCabeceraListado">
                        <a href="?order_by=nom_tipus&order_direction=<?= getOrderDirection('nom_tipus', $order_by, $order_direction) ?>">
                            Tipus
                        </a>
                    </th>

                    <th class="campoCabeceraListado">
                        <a href="?order_by=nom_subtipus&order_direction=<?= getOrderDirection('nom_subtipus', $order_by, $order_direction) ?>">
                            Subtipus
                        </a>
                    </th>

                    <th class="campoCabeceraListado">
                        <a href="?order_by=descripcio&order_direction=<?= getOrderDirection('descripcio', $order_by, $order_direction) ?>">
                            Descripció
                        </a>
                    </th>

                    <th class="campoCabeceraListado">
                        <a href="?order_by=nom_tecnic&order_direction=<?= getOrderDirection('nom_tecnic', $order_by, $order_direction) ?>">
                            Tècnic
                        </a>
                    </th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Recorre els resultats i mostra cada centre en una fila
                $total = 0;
                if ($result_actuacions->num_rows > 0) {
                    while ($row = $result_actuacions->fetch_assoc()) {
                        $color = $row["color"];
                        echo "<tr style='background-color: " . $color . "' onclick=\"window.location.href='actuacioForm.php?id=" . $row["id"] . "'\">";
                        echo "<td class='campoListadoInicial'>" . $row["codi"] . "</td>";
                        echo "<td class='campoListado'>" . $row["nom_centre"] . "</td>";
                        echo "<td class='campoListado'>" . $row["data_entrada"] . "</td>";
                        echo "<td class='campoListado'>" . $row["nom_prioritat"] . "</td>";
                        echo "<td class='campoListado'>" . $row["nom_estat"] . "</td>";
                        echo "<td class='campoListado'>" . $row["nom_tipus"] . "</td>";
                        echo "<td class='campoListado'>" . $row["nom_subtipus"] . "</td>";
                        echo "<td class='campoListado'>" . $row["descripcio"] . "</td>";
                        echo "<td class='campoListado'>" . $row["nom_tecnic"] . "</td>";
                        echo "</a></tr>";
                        $total++;
                    }
                } else {
                    // Si no hi ha resultats, mostra un missatge
                    echo "<tr><td colspan='9' class='campoListado'>No s'han trobat resultats.</td></tr>";
                }
                echo "<tr><td colspan='9' class='campoListado'>Total actuacions: " . $total;
                ?>
            </tbody>
        </table>
    </div>
    </form>
</body>

</html>
<?php
// Tancar la connexió
$connexio->close(); ?>
