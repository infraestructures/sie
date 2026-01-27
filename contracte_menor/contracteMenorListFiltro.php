<?php
include '../connectarBD.php';

// Filtres
$codiFiltro      = $_POST['codi_filtro'] ?? '';
$centreFiltro    = $_POST['centre_filtro'] ?? '';
$illaFiltro      = $_POST['illa_filtro'] ?? '';
$municipiFiltro  = $_POST['municipi_filtro'] ?? '';
$dataIniciFiltro = $_POST['data_inici_filtro'] ?? '';
$dataFiFiltro    = $_POST['data_fi_filtro'] ?? '';
$actuacioFiltro  = $_POST['actuacio_filtro'] ?? '';
$empresaFiltro   = $_POST['empresa_filtro'] ?? '';
$rebutSolicitudFiltro = $_POST['rebut_solicitud_filtro'] ?? '';
$rebut3PresFiltro     = $_POST['rebut_3_pressupost_filtro'] ?? '';
$facturaFiltro        = $_POST['factura_conformada_filtro'] ?? '';

$order_by = $_GET['order_by'] ?? 'codi';
$order_direction = $_GET['order_direction'] ?? 'DESC';

function getOrderDirection($col, $ob, $od){
    if ($ob === $col) return ($od === 'ASC') ? 'DESC' : 'ASC';
    return 'ASC';
}

$illasResult = $connexio->query("SELECT id, nom FROM Illa ORDER BY nom");
$municipisQuery = $illaFiltro ? "SELECT id, nom FROM Municipi WHERE illa_id=".intval($illaFiltro)." ORDER BY nom" : "SELECT id, nom FROM Municipi ORDER BY nom";
$municipisResult = $connexio->query($municipisQuery);
$empresesResult = $connexio->query("SELECT id, nom FROM empresa ORDER BY nom");

$sql = "SELECT cm.id, cm.codi, cm.data, cm.actuacio, cm.pressupost,
               cm.rebut_solicitud, cm.rebut_3_pressupost, cm.factura_conformada,
               c.Centre AS nom_centre,
               e.nom AS nom_empresa
        FROM contracte_menor cm
        JOIN centres c ON cm.centre_id = c.id
        LEFT JOIN empresa e ON cm.empresa_id = e.id
        WHERE 1=1";

if ($codiFiltro !== '')   $sql .= " AND cm.codi LIKE '%".$connexio->real_escape_string($codiFiltro)."%'";
if ($centreFiltro !== '') $sql .= " AND c.Centre LIKE '%".$connexio->real_escape_string($centreFiltro)."%'";
if ($illaFiltro !== '')   $sql .= " AND c.id_illa = ".intval($illaFiltro);
if ($municipiFiltro !== '') $sql .= " AND c.id_municipi = ".intval($municipiFiltro);
if ($dataIniciFiltro !== '') $sql .= " AND cm.data >= '".$connexio->real_escape_string($dataIniciFiltro)."'";
if ($dataFiFiltro !== '')  $sql .= " AND cm.data <= '".$connexio->real_escape_string($dataFiFiltro)."'";
if ($actuacioFiltro !== '') $sql .= " AND cm.actuacio LIKE '%".$connexio->real_escape_string($actuacioFiltro)."%'";
if ($empresaFiltro !== '')  $sql .= " AND cm.empresa_id = ".intval($empresaFiltro);

$validSN = ['S','N'];
if (in_array($rebutSolicitudFiltro, $validSN, true)) $sql .= " AND cm.rebut_solicitud='".$rebutSolicitudFiltro."'";
if (in_array($rebut3PresFiltro, $validSN, true))     $sql .= " AND cm.rebut_3_pressupost='".$rebut3PresFiltro."'";
if (in_array($facturaFiltro, $validSN, true))        $sql .= " AND cm.factura_conformada='".$facturaFiltro."'";

$allowed_order = ['codi','data','nom_centre','pressupost','actuacio','nom_empresa'];
if (!in_array($order_by, $allowed_order, true)) $order_by = 'codi';
$order_direction = ($order_direction === 'ASC') ? 'ASC' : 'DESC';

if ($order_by === 'codi') {
    $sql .= " ORDER BY CAST(SUBSTRING_INDEX(cm.codi,'-',-1) AS UNSIGNED) $order_direction, CAST(SUBSTRING_INDEX(cm.codi,'-',1) AS UNSIGNED) $order_direction";
} elseif ($order_by === 'nom_centre') {
    $sql .= " ORDER BY nom_centre $order_direction";
} else {
    $sql .= " ORDER BY $order_by $order_direction";
}

$result = $connexio->query($sql);
if (!$result) die("Error consulta contractes menors: ".$connexio->error);
?>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GestiÃ³ de contractes menors</title>

    <link rel="stylesheet" href="../css/estilos.css" type="text/css" />
    <script src="../js/utiles.js" language="JavaScript"></script>
    <script src="../js/especificas.js" language="JavaScript"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#illa_filtro').change(function() {
                var illaID = $(this).val();
                $.ajax({
                    type: 'POST',
                    url: 'getMunicipis.php',
                    data: { illa: illaID },
                    success: function(response) {
                        $('#municipi_filtro').html(response);
                    }
                });
            });
        });
    </script>
</head>

<body class="contenido" onload="ocultarFondoPrincipal();">

<div class="contenedorFiltro">
    <h2>Gestió de contractes menors</h2>

    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="formularioFiltro">
        <form id="formularioFiltroBusqueda" name="formularioFiltroBusqueda" action="contracteMenorListFiltro.php" method="post">

        <tr>
            <td class="contenedorCamposFiltro">
                <label class="formularioFiltro">Codi:</label>
                <input type="text" name="codi_filtro" value="<?= htmlspecialchars($codiFiltro) ?>">
            </td>
            <td class="contenedorCamposFiltro">
                <label class="formularioFiltro">Centre:</label>
                <input type="text" name="centre_filtro" value="<?= htmlspecialchars($centreFiltro) ?>">
            </td>
            <td class="contenedorCamposFiltro">
                <label class="formularioFiltro">Illa:</label>
                <select id="illa_filtro" name="illa_filtro" class="campoFicha_Blanca">
                    <option value="">Seleccioni una illa</option>
                    <?php while ($row = $illasResult->fetch_assoc()): ?>
                        <option value="<?= $row['id'] ?>" <?= $row['id'] == $illaFiltro ? 'selected' : '' ?>><?= htmlspecialchars($row['nom']) ?></option>
                    <?php endwhile; ?>
                </select>
            </td>
            <td class="contenedorCamposFiltro">
                <label class="formularioFiltro">Municipi:</label>
                <select id="municipi_filtro" name="municipi_filtro" class="campoFicha_Blanca">
                    <option value="">Seleccioni un municipi</option>
                    <?php while ($row = $municipisResult->fetch_assoc()): ?>
                        <option value="<?= $row['id'] ?>" <?= $row['id'] == $municipiFiltro ? 'selected' : '' ?>><?= htmlspecialchars($row['nom']) ?></option>
                    <?php endwhile; ?>
                </select>
            </td>
        </tr>

        <tr>
            <td class="contenedorCamposFiltro">
                <label class="formularioFiltro">Data inici:</label>
                <input type="date" name="data_inici_filtro" value="<?= htmlspecialchars($dataIniciFiltro) ?>">
            </td>
            <td class="contenedorCamposFiltro">
                <label class="formularioFiltro">Data fi:</label>
                <input type="date" name="data_fi_filtro" value="<?= htmlspecialchars($dataFiFiltro) ?>">
            </td>
            <td class="contenedorCamposFiltro">
                <label class="formularioFiltro">Actuació:</label>
                <input type="text" name="actuacio_filtro" value="<?= htmlspecialchars($actuacioFiltro) ?>">
            </td>
            <td class="contenedorCamposFiltro">
                <label class="formularioFiltro">Empresa:</label>
                <select name="empresa_filtro" class="campoFicha_Blanca">
                    <option value="">Totes</option>
                    <?php if ($empresesResult): while ($row = $empresesResult->fetch_assoc()): ?>
                        <option value="<?= $row['id'] ?>" <?= $row['id'] == $empresaFiltro ? 'selected' : '' ?>><?= htmlspecialchars($row['nom']) ?></option>
                    <?php endwhile; endif; ?>
                </select>
            </td>
        </tr>

        <tr>
            <td class="contenedorCamposFiltro">
                <label class="formularioFiltro">Rebut sol·licitud:</label>
                <select name="rebut_solicitud_filtro" class="campoFicha_Blanca">
                    <option value="">Tots</option>
                    <option value="S" <?= $rebutSolicitudFiltro==='S'?'selected':'' ?>>S</option>
                    <option value="N" <?= $rebutSolicitudFiltro==='N'?'selected':'' ?>>N</option>
                </select>
            </td>
            <td class="contenedorCamposFiltro">
                <label class="formularioFiltro">Rebut 3 pressup.:</label>
                <select name="rebut_3_pressupost_filtro" class="campoFicha_Blanca">
                    <option value="">Tots</option>
                    <option value="S" <?= $rebut3PresFiltro==='S'?'selected':'' ?>>S</option>
                    <option value="N" <?= $rebut3PresFiltro==='N'?'selected':'' ?>>N</option>
                </select>
            </td>
            <td class="contenedorCamposFiltro">
                <label class="formularioFiltro">Factura:</label>
                <select name="factura_conformada_filtro" class="campoFicha_Blanca">
                    <option value="">Tots</option>
                    <option value="S" <?= $facturaFiltro==='S'?'selected':'' ?>>S</option>
                    <option value="N" <?= $facturaFiltro==='N'?'selected':'' ?>>N</option>
                </select>
            </td>
            <td class="contenedorCamposFiltro" style="vertical-align: bottom;">
                <input type="submit" class="btnBuscar" name="btnConsultar" value="Cercar">
            </td>
        </tr>

        </form>
    </table>
</div>

<ul class="botoneraListado">
    <li class="tituloListado">LLISTAT DE CONTRACTES MENORS</li>
    <li class="fondoBotoneraListado">
        <input type="button" class="boton" value="Nou contracte menor" onclick="location.href='contracteMenorForm.php';">
    </li>
</ul>

<div class="contenedorListado">
    <table class="listado" cellpadding="0" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th class="campoCabeceraListadoInicial"><a href="?order_by=codi&order_direction=<?= getOrderDirection('codi',$order_by,$order_direction) ?>">Codi</a></th>
                <th class="campoCabeceraListado" style="min-width:90px; white-space:nowrap;"><a href="?order_by=data&order_direction=<?= getOrderDirection('data',$order_by,$order_direction) ?>">Data</a></th>
                <th class="campoCabeceraListado"><a href="?order_by=nom_centre&order_direction=<?= getOrderDirection('nom_centre',$order_by,$order_direction) ?>">Centre</a></th>
                <th class="campoCabeceraListado"><a href="?order_by=actuacio&order_direction=<?= getOrderDirection('actuacio',$order_by,$order_direction) ?>">Actuació</a></th>
                <th class="campoCabeceraListado"><a href="?order_by=nom_empresa&order_direction=<?= getOrderDirection('nom_empresa',$order_by,$order_direction) ?>">Empresa</a></th>
                <th class="campoCabeceraListado"><a href="?order_by=pressupost&order_direction=<?= getOrderDirection('pressupost',$order_by,$order_direction) ?>">Pressupost</a></th>
                <th class="campoCabeceraListado">Sol·licitud</th>
                <th class="campoCabeceraListado">3 pressup.</th>
                <th class="campoCabeceraListado">Factura</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $total = 0;
            if ($result && $result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    echo "<tr onclick=\"window.location.href='contracteMenorForm.php?id=".intval($row['id'])."'\">";
                    echo "<td class='campoListadoInicial'>".htmlspecialchars($row['codi'])."</td>";
                    echo "<td class='campoListado'>".htmlspecialchars($row['data'])."</td>";
                    echo "<td class='campoListado'>".htmlspecialchars($row['nom_centre'])."</td>";
                    echo "<td class='campoListado'>".htmlspecialchars($row['actuacio'])."</td>";
                    echo "<td class='campoListado'>".htmlspecialchars($row['nom_empresa'] ?? '')."</td>";
                    echo "<td class='campoListado'>".number_format((float)$row['pressupost'],2,',','.')."</td>";
                    echo "<td class='campoListado'>".htmlspecialchars($row['rebut_solicitud'])."</td>";
                    echo "<td class='campoListado'>".htmlspecialchars($row['rebut_3_pressupost'])."</td>";
                    echo "<td class='campoListado'>".htmlspecialchars($row['factura_conformada'])."</td>";
                    echo "</tr>";
                    $total++;
                }
            } else {
                echo "<tr><td colspan='9' class='campoListado'>No s'han trobat resultats.</td></tr>";
            }
            echo "<tr><td colspan='9' class='campoListado'>Total contractes: $total</td></tr>";
            ?>
        </tbody>
    </table>
</div>

</body>
</html>

<?php $connexio->close(); ?>
