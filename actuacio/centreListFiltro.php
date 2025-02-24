<!DOCTYPE html>
<?php
include '../connectarBD.php';

// Variables para filtros
$nombreFiltro = isset($_GET['nombre'])? $_GET['nombre']: '';
$illaFiltro = isset($_GET['illa'])? $_GET['illa']: '';
$municipiFiltro = isset($_GET['municipi'])? $_GET['municipi']: '';

// Consultar datos para los desplegables
$illasQuery = "SELECT id, nom FROM Illa ORDER BY nom";
$illasResult = $connexio->query($illasQuery);

$municipisQuery = $illaFiltro
  ? "SELECT id, nom FROM Municipi WHERE illa_id = $illaFiltro ORDER BY nom"
  : "SELECT id, nom FROM Municipi ORDER BY nom";
$municipisResult = $connexio->query($municipisQuery);

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
    $sql.= " AND CENTRES.Centre LIKE '%". $connexio->real_escape_string($nombreFiltro). "%'";
}
if (!empty($illaFiltro)) {
    $sql.= " AND CENTRES.id_illa = ". intval($illaFiltro);
}
if (!empty($municipiFiltro)) {
    $sql.= " AND CENTRES.id_municipi = ". intval($municipiFiltro);
}

$sql.= " ORDER BY CENTRES.Centre";
$result = $connexio->query($sql);?>

<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Llistat de Centres</title>

    <link rel="stylesheet" href="../css/estilos.css" type="text/css" />

    <script src="../js/utiles.js" type="" language="JavaScript"></script>
    <script src="../js/especificas.js" type="" language="JavaScript"></script>

</head>

<body class="contenido" onload="ocultarFondoPrincipal();">
    <div class="contenedorFiltro">
        <table cellpadding="0" cellspacing="0" class="cajaFiltro">
            <tr>
                <td class="contenedorCamposFiltro">
                    <div class="filtro">
                        <form method="GET">
                            <label for="nombre" class="formularioFiltro">Nom del Centre:</label>
                            <input type="text" id="nombre" name="nombre" value="<?= htmlspecialchars($nombreFiltro)?>">

                            <label for="illa" class="formularioFiltro">Illa:</label>
                            <select id="illa" name="illa" onchange="this.form.submit()">
                                <option value="">Seleccioni una illa</option>
                                <?php while ($row = $illasResult->fetch_assoc()):?>
                                    <option value="<?= $row['id']?>" <?= $row['id'] == $illaFiltro? 'selected': ''?>>
                                        <?= htmlspecialchars($row['nom'])?>
                                    </option>
                                <?php endwhile;?>
                            </select>

                            <label for="municipi" class="formularioFiltro">Municipi:</label>
                            <select id="municipi" name="municipi" onchange="this.form.submit()">
                                <option value="">Seleccioni un municipi</option>
                                <?php while ($row = $municipisResult->fetch_assoc()):?>
                                    <option value="<?= $row['id']?>" <?= $row['id'] == $municipiFiltro? 'selected': ''?>>
                                        <?= htmlspecialchars($row['nom'])?>
                                    </option>
                                <?php endwhile;?>
                            </select>
                            <button type="submit" class="boton">Cercar</button>
                        </form>
                    </div>
                </td>
            </tr>
        </table>

    </div>
    <ul class="botoneraListado">
        <li class="tituloListado">LLISTAT DE CENTRES</li>
        <li class="fondoBotoneraListado">
            <input type="button" class="boton" value="Insertar" onclick="location.href='centreForm.php';">
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
                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr onclick=\"window.location.href='centreForm.php?id=". $row["id"]. "'\">";
                        echo "<td class='campoListadoInicial'>". $row["Codi"]. "</td>";
                        echo "<td class='campoListado'>". $row["Centre"]. "</td>";
                        echo "<td class='campoListado'>". $row["Telefon"]. "</td>";
                        echo "<td class='campoListado'>". $row["Localitat"]. "</td>";
                        echo "<td class='campoListado'>". $row["Municipi"]. "</td>";
                        echo "<td class='campoListado'>". $row["Illa"]. "</td>";
                        echo "</a></tr>";
                    }
                } else {
                    // Si no hi ha resultats, mostra un missatge
                    echo "<tr><td colspan='6'>No s'han trobat resultats.</td></tr>";
                }
              ?>
            </tbody>
        </table>
    </div>
    </form>
</body>

</html>
<?php
// Tancar la connexioexió
$connexio->close();?>