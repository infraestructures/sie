<!DOCTYPE html>
<?php
include '../connectarBD.php';

// Variables para filtros
$nombreFiltro = isset($_GET['nombre']) ? $_GET['nombre'] : '';
$illaFiltro = isset($_GET['illa']) ? $_GET['illa'] : '';
$municipiFiltro = isset($_GET['municipi']) ? $_GET['municipi'] : '';
$tipusCentreFiltro = isset($_GET['tipus_centre_filtro']) ? $_GET['tipus_centre_filtro'] : '';

// Filtre per ús principal
$usPrincipalFiltro = isset($_GET['cadastre_us_principal']) ? $_GET['cadastre_us_principal'] : 'tots';

// Filtres cadastrals
$anyConstruccioDesde = isset($_GET['any_construccio_desde']) ? $_GET['any_construccio_desde'] : '';
$anyConstruccioFins = isset($_GET['any_construccio_fins']) ? $_GET['any_construccio_fins'] : '';
$ambRefCadastral = isset($_GET['amb_ref_cadastral']) ? $_GET['amb_ref_cadastral'] : 'tots';

// Consultar datos para los desplegables
$illasQuery = "SELECT id, nom FROM Illa ORDER BY nom";
$illasResult = $connexio->query($illasQuery);

$municipisQuery = $illaFiltro
    ? "SELECT id, nom FROM Municipi WHERE illa_id = $illaFiltro ORDER BY nom"
    : "SELECT id, nom FROM Municipi ORDER BY nom";
$municipisResult = $connexio->query($municipisQuery);

// Consulta per obtenir la llista de tipus de centre educatiu
$sql_tipus_centre = "SELECT Sigla, nom FROM tipus_centre_educatiu ORDER BY nom";
$result_tipus_centre = $connexio->query($sql_tipus_centre);

// Consulta per obtenir la llista d'usos principals
$sql_us_principal = "SELECT DISTINCT cadastre_us_principal FROM CENTRES WHERE cadastre_us_principal IS NOT NULL AND TRIM(cadastre_us_principal) <> '' ORDER BY cadastre_us_principal";
$result_us_principal = $connexio->query($sql_us_principal);

// Consultar los datos de los centros utilizando códigos
$sql = "SELECT 
            CENTRES.id, 
            CENTRES.Codi, 
            CENTRES.Centre, 
            CENTRES.Telefon, 
            CENTRES.Localitat AS Localitat, 
            Municipi.nom AS Municipi, 
            Illa.nom AS Illa
        FROM CENTRES
        JOIN Municipi ON CENTRES.id_municipi = Municipi.id
        JOIN Illa ON CENTRES.id_illa = Illa.id
        WHERE 1=1";

if (!empty($nombreFiltro)) {
    $sql .= " AND CENTRES.Centre LIKE '%" . $connexio->real_escape_string($nombreFiltro) . "%'";
}
if (!empty($illaFiltro)) {
    $sql .= " AND CENTRES.id_illa = " . intval($illaFiltro);
}
if (!empty($municipiFiltro)) {
    $sql .= " AND CENTRES.id_municipi = " . intval($municipiFiltro);
}

// Filtre per ús principal
if (!empty($usPrincipalFiltro) && $usPrincipalFiltro !== 'tots') {
    $sql .= " AND CENTRES.cadastre_us_principal = '" . $connexio->real_escape_string($usPrincipalFiltro) . "'";
}

if (!empty($tipusCentreFiltro)) {
    $sigla = trim($tipusCentreFiltro);
    $regex = "^[[:space:]]*" . preg_quote($sigla, '/') . "([[:space:]]|[-–\\/,(]|$)";
    $sql .= " AND CENTRES.Sigla REGEXP '" . $connexio->real_escape_string($regex) . "'";
}

// Filtres per any de construcció (cadastre)
if ($anyConstruccioDesde !== '' && is_numeric($anyConstruccioDesde)) {
    $sql .= " AND CENTRES.cadastre_any_construccio >= " . intval($anyConstruccioDesde);
}
if ($anyConstruccioFins !== '' && is_numeric($anyConstruccioFins)) {
    $sql .= " AND CENTRES.cadastre_any_construccio <= " . intval($anyConstruccioFins);
}

// Filtre per referència cadastral
if ($ambRefCadastral === 'si') {
    $sql .= " AND (CENTRES.ref_cadastral IS NOT NULL AND TRIM(CENTRES.ref_cadastral) <> '')";
} elseif ($ambRefCadastral === 'no') {
    $sql .= " AND (CENTRES.ref_cadastral IS NULL OR TRIM(CENTRES.ref_cadastral) = '')";
}

// Filtre per ús principal
if (!empty($usPrincipalFiltro) && $usPrincipalFiltro !== 'tots') {
    $sql .= " AND CENTRES.cadastre_us_principal = '" . $connexio->real_escape_string($usPrincipalFiltro) . "'";
}
$sql .= " ORDER BY CENTRES.Centre";
$result = $connexio->query($sql); ?>

<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Llistat de Centres</title>

    <link rel="stylesheet" href="../css/estilos.css" type="text/css" />

    <script src="../js/utiles.js" type="" language="JavaScript"></script>
    <script src="../js/especificas.js" type="" language="JavaScript"></script>

    <!-- Maquetació específica pels filtres (sense tocar el CSS global) -->
    
    <style>
        /* Ajustos locals només pel bloc de filtres */
        .contenedorFiltro, .cajaFiltro { width: 100% !important; }
        .contenedorCamposFiltro { width: 100%; }

        .filtroForm { width: 100%; }
        .filtroFlex{
            display:flex;
            flex-wrap:wrap;
            gap:10px 14px;
            align-items:flex-end;
            width:100%;
        }
        .filtroField{ display:flex; flex-direction:column; gap:6px; }
        .filtroField label{ margin:0; }

        /* Amplades per controlar que quedi en 2-3 línies */
        .w-name{ flex: 2 1 420px; min-width: 320px; }
        .w-tipus{ flex: 2 1 420px; min-width: 320px; }
        .w-illa{ flex: 1 1 240px; min-width: 220px; }
        .w-muni{ flex: 1 1 260px; min-width: 220px; }
        .w-any{  flex: 0 1 170px; min-width: 150px; }
        .w-actions{ flex: 1 1 260px; min-width: 240px; display:flex; gap:12px; align-items:center; justify-content:flex-start; }

        .filtroField input[type="text"],
        .filtroField select{ width:100%; box-sizing:border-box; }

        /* Inputs d'any més compactes */
        .yearInput{
            width: 140px;
            max-width: 100%;
        }

        @media (max-width: 720px){
            .w-any{ flex: 1 1 200px; }
            .w-actions{ flex: 1 1 100%; }
            }
    </style>


</head>

<body class="contenido" onload="ocultarFondoPrincipal();">
    <div class="contenedorFiltro">
        <table cellpadding="0" cellspacing="0" class="cajaFiltro">
            <tr>
                <td class="contenedorCamposFiltro">
                    <div class="filtro">
                        <form method="GET" class="filtroForm">
                            <div class="filtroFlex">
                                <div class="filtroField w-name">
                                    <label for="nombre" class="formularioFiltro">Nom del Centre</label>
                                    <input type="text" id="nombre" name="nombre" value="<?= htmlspecialchars($nombreFiltro) ?>">
                                </div>

                                <div class="filtroField w-tipus">
                                    <label for="tipus_centre_filtro" class="formularioFiltro">Tipus de centre</label>
                                    <select name="tipus_centre_filtro" id="tipus_centre_filtro" class="campoFicha_Blanca">
                                        <option value="">Tots</option>
                                        <?php while ($row = $result_tipus_centre->fetch_assoc()): ?>
                                            <option value="<?= htmlspecialchars($row['Sigla']) ?>" <?= $row['Sigla'] == $tipusCentreFiltro ? 'selected' : '' ?>>
                                                <?= htmlspecialchars($row['nom']) ?> (<?= htmlspecialchars($row['Sigla']) ?>)
                                            </option>
                                        <?php endwhile; ?>
                                    </select>
                                </div>

                                <div class="filtroField w-illa">
                                    <label for="illa" class="formularioFiltro">Illa</label>
                                    <select id="illa" name="illa" onchange="this.form.submit()">
                                        <option value="">Seleccioni una illa</option>
                                        <?php while ($row = $illasResult->fetch_assoc()): ?>
                                            <option value="<?= $row['id'] ?>" <?= $row['id'] == $illaFiltro ? 'selected' : '' ?>>
                                                <?= htmlspecialchars($row['nom']) ?>
                                            </option>
                                        <?php endwhile; ?>
                                    </select>
                                </div>

                                <div class="filtroField w-muni">
                                    <label for="municipi" class="formularioFiltro">Municipi</label>
                                    <select id="municipi" name="municipi" onchange="this.form.submit()">
                                        <option value="">Seleccioni un municipi</option>
                                        <?php while ($row = $municipisResult->fetch_assoc()): ?>
                                            <option value="<?= $row['id'] ?>" <?= $row['id'] == $municipiFiltro ? 'selected' : '' ?>>
                                                <?= htmlspecialchars($row['nom']) ?>
                                            </option>
                                        <?php endwhile; ?>
                                    </select>
                                </div>

                                <div class="filtroField w-any">
                                    <label for="any_construccio_desde" class="formularioFiltro">Any de construcció (des de)</label>
                                    <input type="number" id="any_construccio_desde" name="any_construccio_desde" value="<?= htmlspecialchars($anyConstruccioDesde) ?>" class="campoFicha_Blanca yearInput" min="0" step="1">
                                </div>

                                <div class="filtroField w-any">
                                    <label for="any_construccio_fins" class="formularioFiltro">Any de construcció (fins a)</label>
                                    <input type="number" id="any_construccio_fins" name="any_construccio_fins" value="<?= htmlspecialchars($anyConstruccioFins) ?>" class="campoFicha_Blanca yearInput" min="0" step="1">
                                </div>

                                <div class="w-actions">
                                    <div class="filtroField" style="min-width:220px;">
                                        <label for="cadastre_us_principal" class="formularioFiltro">Ús principal</label>
                                        <select id="cadastre_us_principal" name="cadastre_us_principal" class="campoFicha_Blanca">
                                            <option value="tots" <?= $usPrincipalFiltro === 'tots' ? 'selected' : '' ?>>Tots</option>
                                            <?php if ($result_us_principal) {
                                                while ($row = $result_us_principal->fetch_assoc()):
                                                    $val = $row['cadastre_us_principal']; ?>
                                                <option value="<?= htmlspecialchars($val) ?>" <?= $val === $usPrincipalFiltro ? 'selected' : '' ?>>
                                                    <?= htmlspecialchars($val) ?>
                                                </option>
                                            <?php endwhile;
                                            } ?>
                                        </select>
                                    </div>
                                    <div class="filtroField" style="min-width:220px;">
    <label for="amb_ref_cadastral" class="formularioFiltro">Amb referència cadastral</label>
    <select id="amb_ref_cadastral" name="amb_ref_cadastral" class="campoFicha_Blanca">
        <option value="tots" <?= $ambRefCadastral === 'tots' ? 'selected' : '' ?>>Tots</option>
        <option value="si" <?= $ambRefCadastral === 'si' ? 'selected' : '' ?>>Sí</option>
        <option value="no" <?= $ambRefCadastral === 'no' ? 'selected' : '' ?>>No</option>
    </select>
</div>
<button type="submit" class="boton">Cercar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </td>
            </tr>
        </table>

    </div>
    <ul class="botoneraListado">
        <li class="tituloListado">LLISTAT DE CENTRES</li>
        <li class="fondoBotoneraListado">
            <input type="button" class="boton" value="Nou centre" onclick="location.href='centreForm.php';">
        </li>
    </ul>

    <div class="espacioMarronClaro"></div>

    <div id="cuerpo" class="scroll_total">
        <table class="listado" cellpadding="0" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th class="campoCabeceraListadoInicial">Codi</th>
                    <th class="campoCabeceraListado">Centre</th>
                    <th class="campoCabeceraListado">Telèfon</th>
                    <th class="campoCabeceraListado">Localitat</th>
                    <th class="campoCabeceraListado">Municipi</th>
                    <th class="campoCabeceraListado">Illa</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Recorre els resultats i mostra cada centre en una fila
                $total = 0;
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr onclick=\"window.location.href='centreForm.php?id=" . $row["id"] . "'\">";
                        echo "<td class='campoListadoInicial'>" . $row["Codi"] . "</td>";
                        echo "<td class='campoListado'>" . $row["Centre"] . "</td>";
                        echo "<td class='campoListado'>" . $row["Telefon"] . "</td>";
                        echo "<td class='campoListado'>" . $row["Localitat"] . "</td>";
                        echo "<td class='campoListado'>" . $row["Municipi"] . "</td>";
                        echo "<td class='campoListado'>" . $row["Illa"] . "</td>";
                        echo "</a></tr>";
                        $total++;
                    }
                } else {
                    // Si no hi ha resultats, mostra un missatge
                    echo "<tr><td colspan='6'>No s'han trobat resultats.</td></tr>";
                }
                echo "<tr><td colspan='9' class='campoListado'>Total centres: " . $total;
                ?>
            </tbody>
        </table>
    </div>
</body>

</html>
<?php
// Tancar la connexioexió
$connexio->close(); ?>