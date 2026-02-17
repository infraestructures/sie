<!DOCTYPE html>
<?php
include '../connectarBD.php';

// Variables para filtros
$nombreFiltro = isset($_GET['nombre']) ? $_GET['nombre'] : '';
$illaFiltro = isset($_GET['illa']) ? $_GET['illa'] : '';
$municipiFiltro = isset($_GET['municipi']) ? $_GET['municipi'] : '';
$tipusCentreFiltro = isset($_GET['tipus_centre_filtro']) ? $_GET['tipus_centre_filtro'] : '';

// Filtre per centre (autocomplete)
$centreIdFiltro = isset($_GET['centre_id']) ? $_GET['centre_id'] : '';

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

// Filtre per centre (autocomplete): si hi ha ID seleccionat, filtra per ID; si no, aplica LIKE pel nom
if (!empty($centreIdFiltro) && is_numeric($centreIdFiltro)) {
    $sql .= " AND CENTRES.id = " . intval($centreIdFiltro);
} elseif (!empty($nombreFiltro)) {
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
    <link rel="stylesheet" href="../css/estilos_ficha_2.css" type="text/css" />

    <script src="../js/utiles.js" type="" language="JavaScript"></script>
    <script src="../js/especificas.js" type="" language="JavaScript"></script>

    <!-- Maquetació específica pels filtres (sense tocar el CSS global) -->
    
    <style>
        /* Ajustos locals només pel bloc de filtres (sense tocar el CSS global) */
        .contenedorFiltro, .cajaFiltro { width: 100% !important; }
        .contenedorCamposFiltro { width: 100%; }
        .filtroForm { width: 100%; }

        /* Maquetació: grid per evitar espais buits a la dreta i fer 2-3 línies */
        .filtroFlex{
            display:grid;
            grid-template-columns: repeat(12, minmax(0, 1fr));
            gap:10px 14px;
            align-items:end;
            width:100%;
        }
        .filtroField{ display:flex; flex-direction:column; gap:6px; min-width:0; }
        .filtroField label{ margin:0; }
        .filtroField input[type="text"],
        .filtroField input[type="number"],
        .filtroField select{ width:100%; box-sizing:border-box; }

        /* Evitar desbordaments horitzontals */
        .contenedorCamposFiltro, .filtroForm, .filtroFlex{ box-sizing:border-box; }
        .filtroFlex{ overflow-x:hidden; }
        .filtroField label{ white-space:normal; }

        /* Columnes */
        .c-2{ grid-column: span 2; }
        .c-3{ grid-column: span 3; }
        .c-4{ grid-column: span 4; }
        .c-6{ grid-column: span 6; }

        /* Anys: més compactes */
        .yearInput{ max-width: 160px; }

        /* Botó alineat com a camp */
        .filtroBtn{
            grid-column: span 2;
            display:flex;
            align-items:flex-end;
        }

        /* Responsive */
        @media (max-width: 980px){
            .c-4{ grid-column: span 6; }
            .c-3{ grid-column: span 6; }
            .c-2{ grid-column: span 6; }
            .filtroBtn{ grid-column: span 6; }
        }
        @media (max-width: 620px){
            .c-6,.c-4,.c-3,.c-2,.filtroBtn{ grid-column: span 12; }
            .yearInput{ max-width: 100%; }
        }
        .filtro-centres {
            display: flex;
            flex-wrap: wrap;
            gap: 16px;
        }
        .filtro-centres .form-group {
            display: flex;
            flex-direction: column;
            min-width: 180px;
            flex: 1 1 220px;
        }
        .form-group.ref-cat {
            flex: 0 0 220px;
        }

        .form-group.ref-cat label {
            white-space: nowrap; /* una sola línia */
        }

        .form-group.ref-cat select {
            width: 140px;
        }
        .filtro-centres input[type="submit"] {
            align-self: flex-end;
            margin-left: 8px;
        }
        .form-group.ref-cat button,
        .form-group.ref-cat input[type="submit"] {
            margin-left: 8px;
        }
        /* Layout flexible del filtre */
        .filtroFlex {
            display: flex;
            flex-wrap: wrap;
            gap: 12px 16px;
            align-items: flex-end;
            width: 100%;
            box-sizing: border-box;
            overflow-x: hidden;
        }

        /* Cada camp */
        .filtroFlex .filtroField {
            box-sizing: border-box;
            min-width: 180px;
            flex: 1 1 260px; /* base en pantalles grans */
        }

        /* Mides “per columnes” (si ja tens c-4, c-3, etc. les forcem aquí) */
        /* Columnes: NO creixen, així no s'estiren ocupant tot l'espai */
        .filtroFlex .c-4 {
            flex: 0 0 360px;
        }

        .filtroFlex .c-3 {
            flex: 0 0 260px;
        }

        .filtroFlex .c-2 {
            flex: 0 0 200px;
        }

        .filtroFlex .c-1 {
            flex: 0 0 120px;
        }



        /* Camp “Amb referència cadastral”: label 1 línia + select més petit */
        .filtroFlex .ref-cat label {
            white-space: nowrap;
        }

        .filtroFlex .ref-cat select {
            width: 140px;
            min-width: 120px;
        }

        /* Separació botó Cercar si està al mateix bloc */
        .filtroFlex .ref-cat input[type="submit"],
        .filtroFlex .ref-cat button {
            margin-left: 8px;
        }

        /* Breakpoint: a 1280 (i similars) fem bases més petites perquè encaixi igual */
        @media (max-width: 1366px) {
            .filtroFlex .c-4 {
                flex-basis: 320px;
            }

            .filtroFlex .c-3 {
                flex-basis: 240px;
            }

            .filtroFlex .c-2 {
                flex-basis: 180px;
            }

            .filtroFlex .c-1 {
                flex-basis: 110px;
            }
        }

    </style>

    <script>
        function initCentreAutocompleteFiltro() {
            const input = document.getElementById('nombre_txt');
            const hidden = document.getElementById('centre_id');
            const box = document.getElementById('nombre_suggest');
            if (!input || !hidden || !box) return;

            let lastFetch = 0;
            let timer = null;
            let lastQuery = '';

            function hideBox() { box.style.display = 'none'; box.innerHTML = ''; }
            function showBox() { box.style.display = 'block'; }
            function clearSelection() { hidden.value = ''; }

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
                    row.addEventListener('mousedown', e => {
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
                try {
                    const r = await fetch('ajax_centres.php?q=' + encodeURIComponent(q));
                    if (!r.ok) return;
                    const data = await r.json();
                    if (lastFetch !== now) return;
                    render(data);
                } catch (e) { /* ignore */ }
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

        document.addEventListener('DOMContentLoaded', initCentreAutocompleteFiltro);
    </script>

</head>

<body class="contenido" onload="ocultarFondoPrincipal();">
    <div class="contenedorFiltro">
        <ul class="botoneraFicha">
          <li class="tituloFicha">
            <p class="posicionTituloFicha">GESTIÓ DE CENTRES</p>
          </li>
        </ul>
        <div class="espacioMarron">&nbsp;</div>
        <table cellpadding="0" cellspacing="0" class="cajaFiltro">
            <tr>
                <td class="contenedorCamposFiltro">
                    <div class="filtro">
                        <form method="GET" class="filtroForm">
                            <div class="filtroFlex">
                                <div class="filtroField c-4">
                                    <label for="nombre_txt" class="formularioFiltro">Nom del Centre</label>
                                    <div style="position:relative;">
                                        <input type="text" id="nombre_txt" name="nombre" value="<?= htmlspecialchars($nombreFiltro) ?>" autocomplete="off">
                                        <input type="hidden" id="centre_id" name="centre_id" value="<?= htmlspecialchars($centreIdFiltro) ?>">
                                        <div id="nombre_suggest" style="display:none; position:absolute; left:0; right:0; top:100%; z-index:9999; background:#fff; border:1px solid #ddd; border-top:none; max-height:260px; overflow:auto; box-shadow:0 6px 18px rgba(0,0,0,.08);"></div>
                                    </div>
                                </div>

                                <div class="filtroField c-4">
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

                                <div class="filtroField c-2">
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

                                <div class="filtroField c-2">
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

                                <div class="filtroField c-2">
                                    <label for="any_construccio_desde" class="formularioFiltro">Any de construcció (des de)</label>
                                    <input type="number" id="any_construccio_desde" name="any_construccio_desde" value="<?= htmlspecialchars($anyConstruccioDesde) ?>" class="campoFicha_Blanca yearInput" min="0" step="1">
                                </div>

                                <div class="filtroField c-2">
                                    <label for="any_construccio_fins" class="formularioFiltro">Any de construcció (fins a)</label>
                                    <input type="number" id="any_construccio_fins" name="any_construccio_fins" value="<?= htmlspecialchars($anyConstruccioFins) ?>" class="campoFicha_Blanca yearInput" min="0" step="1">
                                </div>

                                <div class="filtroField c-4">
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

                                <div class="form-group ref-cat">
                                    <label for="ref_cadastral" class="formularioFiltro">Amb referència cadastral</label>
                                    <select name="ref_cadastral" id="ref_cadastral" class="campoFicha_Blanca">
                                        <option value="">Tots</option>
                                        <option value="S">Sí</option>
                                        <option value="N">No</option>
                                    </select>
                                </div>


                                <div class="filtroBtn">
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