<!DOCTYPE html>
<?php
    include '../connectarBD.php';

    // Variables rebudes
    $idCentre = isset($_POST['id_centre'])? $_POST['id_centre']: '';
    $centreFiltro = isset($_POST['centre_filtro'])? $_POST['centre_filtro']: '';
    $illaFiltro = isset($_POST['illa_filtro'])? $_POST['illa_filtro']: '';
    $municipiFiltro = isset($_POST['municipi_filtro'])? $_POST['municipi_filtro']: '';
    $dataIniciFiltro = isset($_POST['data_inici_filtro'])? $_POST['data_inici_filtro']: '';
    $dataFiFiltro = isset($_POST['data_fi_filtro'])? $_POST['data_fi_filtro']: '';
    $estatFiltro = isset($_POST['estat_filtro'])? $_POST['estat_filtro']: '';

    // Consultar datos para los desplegables
    $illasQuery = "SELECT id, nom FROM Illa ORDER BY nom";
    $illasResult = $connexio->query($illasQuery);

    $municipisQuery = $illaFiltro
    ? "SELECT id, nom FROM Municipi WHERE illa_id = $illaFiltro ORDER BY nom"
    : "SELECT id, nom FROM Municipi ORDER BY nom";
    $municipisResult = $connexio->query($municipisQuery);

    // Consultar la llista de convenis
    $sql = "SELECT
                conv.id,
                conv.codi,
                conv.descripcio,
                conv.pressupost,
                conv.estat_id, 
                conv.data_inici,
                conv.data_pagament,
                conv.data_signatura,
                conv.ajuntament_id,
                i.nom AS nom_illa,
                m.nom AS nom_municipi,
                e.nom AS nom_estat
            FROM conveni conv
                JOIN illa i ON m.ila_id = i.id
                JOIN municipi m ON c.id_municipi = m.id
                JOIN estat_conveni e ON a.estat_conveni_id = e.id
            WHERE 1 = 1			
            ";

    if (!empty($illaFiltro)) {
        $sql.= " AND c.id_illa = ". intval($illaFiltro);
    }
    if (!empty($municipiFiltro)) {
        $sql.= " AND c.id_municipi = ". intval($municipiFiltro);
    }
    if (!empty($estatFiltro)) {
        $sql.= " AND e.id = ". intval($estatFiltro);
    }   
    if (!empty($dataIniciFiltro)) {
        $sql.= " AND a.data_entrada >= '". $dataIniciFiltro . "'";
    }
    if (!empty($dataFiFiltro)) {
        $sql.= " AND a.data_entrada <= '". $dataFiFiltro . "'";
    }  
    $sql.= " ORDER BY CAST(SUBSTRING_INDEX(a.codi, '-', -1) AS UNSIGNED) DESC, 
             CAST(SUBSTRING_INDEX(a.codi, '-', 1) AS UNSIGNED) DESC;";

    $result_convenis = $connexio->query($sql);

    if (!$result_actuacions) {
        die("Query failed: " . $connexio->error);
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
        });

    </script>	
</head>

<body class="contenido" onload="ocultarFondoPrincipal();">
    <div class="contenedorFiltro">
	<h2>Gestió de convenis</h2>
        <table cellpadding="0" cellspacing="0" class="cajaFiltro">
            <tr>		
                <td class="contenedorCamposFiltro">
                    <div class="filtro">
                        <form method="POST" action="conveniListFiltro.php">
                            <label for="centre_filtro" class="formularioFiltro">Centre:</label>
                            <input type="text" name="centre_filtro" value="<?= htmlspecialchars($centreFiltro) ?>">						
                            <label for="illa_filtro" class="formularioFiltro">Illa:</label>
                            <select id="illa_filtro" name="illa_filtro" class="campoFicha_Blanca">
                                <option value="">Seleccioni una illa</option>
                                <?php while ($row = $illasResult->fetch_assoc()):?>
                                    <option value="<?= $row['id']?>" <?= $row['id'] == $illaFiltro? 'selected': ''?>>
                                        <?= htmlspecialchars($row['nom'])?>
                                    </option>
                                <?php endwhile;?>
                            </select>

                            <label for="municipi_filtro" class="formularioFiltro">Municipi:</label>
                            <select id="municipi_filtro" name="municipi_filtro" class="campoFicha_Blanca">
                                <option value="">Seleccioni un municipi</option>
                                <?php while ($row = $municipisResult->fetch_assoc()):?>
                                    <option value="<?= $row['id']?>" <?= $row['id'] == $municipiFiltro? 'selected': ''?>>
                                        <?= htmlspecialchars($row['nom'])?>
                                    </option>
                                <?php endwhile;?>
                            </select>						                                                
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="contenedorCamposFiltro">
                        <div class="filtro">
                            <label for="data_inici_filtro" class="formularioFiltro">Data Inici:</label>
                            <input type="date" name="data_inici_filtro" value="<?= htmlspecialchars($dataIniciFiltro) ?>">

                            <label for="data_fi_filtro" class="formularioFiltro">Data Fi:</label>
                            <input type="date" name="data_fi_filtro" value="<?= htmlspecialchars($dataFiFiltro) ?>">

                            <button type="submit" class="boton">Cercar</button>					        
                        </div>                                          
				    </td>
			    </tr>
            </table>
        </form>
    </div>
    <ul class="botoneraListado">
        <li class="tituloListado">LLISTAT DE CONVENIS</li>
        <li class="fondoBotoneraListado">
            <input type="button" class="boton" value="Nou conveni" onclick="location.href='conveniForm.php';">
        </li>
    </ul>

    <div class="espacioMarronClaro"></div>

    <div id="cuerpo" class="scroll_total">
        <table class="listado" cellpadding="0" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th class="campoCabeceraListadoInicial">Codi conveni</th>
                    <th class="campoCabeceraListado">Ajuntament</th>
                    <th class="campoCabeceraListado">Data entrada</th>
                    <th class="campoCabeceraListado">Data signatura</th>
                    <th class="campoCabeceraListado">Estat</th>
                    <th class="campoCabeceraListado">Descripció</th>                    
                </tr>
            </thead>
            <tbody>
                <?php
                // Recorre els resultats i mostra cada centre en una fila
                if ($result_actuacions->num_rows > 0) {
                    while ($row = $result_actuacions->fetch_assoc()) {
                        $color = $row["color"];
                        echo "<tr style='background-color: ".$color."' onclick=\"window.location.href='conveniForm.php?id=". $row["id"]. "'\">";
                        echo "<td class='campoListadoInicial'>". $row["codi"]. "</td>";
                        echo "<td class='campoListado'>". $row["Ajuntament"]. "</td>";
                        echo "<td class='campoListado'>". $row["data_entrada"]. "</td>";
                        echo "<td class='campoListado'>". $row["data_signatura"]. "</td>";
                        echo "<td class='campoListado'>". $row["nom_estat"]. "</td>";
                        echo "<td class='campoListado'>". $row["descripcio"]. "</td>";
                        echo "</a></tr>";
                    }
                } else {
                    // Si no hi ha resultats, mostra un missatge
                    echo "<tr><td colspan='5'>No s'han trobat resultats.</td></tr>";
                }
              ?>
            </tbody>
        </table>
    </div>
    </form>
</body>

</html>
<?php
// Tancar la connexió
$connexio->close();?>