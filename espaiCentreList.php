<!DOCTYPE html>
<?php
	include 'connectarBD.php';

	// Obtenir els valors des del paràmetre GET
	$idCentre = isset($_GET['id_centre']) ? intval($_GET['id_centre']) : 0;
	$nomCentre = isset($_GET['nom_centre']) ? htmlspecialchars($_GET['nom_centre']) : ''; // Nom del centre rebut com a paràmetre

	// Consulta per obtenir els espais associats al centre
	$sql = "
		SELECT 
			id_espai,
			nom AS nom_espai, 
			tipus, 
			ubicacio, 
			ocupacio_per_persona, 
			metres_per_unitat 
		FROM assignar_espais,espai  		
		WHERE assignar_espais.id_espai = espai.codi and 
			assignar_espais.id_centre = ? ";
		
	$stmt = $connexio->prepare($sql);
	if ($stmt === false) {
    die("Prepare failed: " . $connexio->error);
}
	$stmt->bind_param("i", $idCentre);
	$stmt->execute();
	$resultat = $stmt->get_result();

?>

<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Llistat de espais assignats al centre</title>

	<link rel="stylesheet" href="css/estilos.css" type="text/css" />

	<script src="js/utiles.js" type="" language="JavaScript"></script>
	<script src="js/especificas.js" type="" language="JavaScript"></script>

</head>

<body class="contenido" onload="ocultarFondoPrincipal();">
<form name="entidad">
<ul class="botoneraListado" style="margin-top: 20px">
	<li class="tituloListado">Llistat de espais assignats al <b><?php echo $nomCentre?></b></li>
	<li class="fondoBotoneraListado">
		<input type="button" class="boton" value="Assignar nou espai" onclick="location.href='espaiCentreForm.php?id_centre=<?php echo $idCentre ?>&nom_centre=<?php echo $nomCentre ?>';">
    </li> 
</ul>

<div class="espacioMarronClaro"></div>

<div id="cuerpo" class="scroll_total">
<table class="listado" cellpadding="0" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th class="campoCabeceraListadoInicial">Nom espai</th>
			<th class="campoCabeceraListado">Tipus</th>
			<th class="campoCabeceraListado">Ubicació</th>
			<th class="campoCabeceraListado">Ocupació per Persona (m²)</th>
			<th class="campoCabeceraListado">Metres per Unitat</th>
		</tr>
	</thead>
	<tbody>
	<?php
            // Verifica si hi ha resultats
            if ($resultat->num_rows > 0) {
                // Recorre cada registre i mostra-ho a la taula
                while ($fila = $resultat->fetch_assoc()) {
					echo "<tr onclick=\"window.location.href='espaiCentreForm.php?id_centre=" . $idCentre . "&nom_centre=" . $nomCentre . "&id_espai=" . $fila["id_espai"] . "'\">";                     
                    echo "<td class='campoListadoInicial'>" . $fila["nom_espai"] . "</td>";
                    echo "<td class='campoListado'>" . $fila["tipus"] . "</td>";
					echo "<td class='campoListado'>" . $fila["ubicacio"] . "</td>";
					echo "<td class='campoListado'>" . $fila["ocupacio_per_persona"] . "</td>";
                    echo "<td class='campoListado'>" . $fila["metres_per_unitat"] . "</td>";
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
$connexio->close();
?>

