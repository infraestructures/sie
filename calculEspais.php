<!DOCTYPE html>
<?php
	include 'connectarBD.php';
	
	// Obtenir els valors des del paràmetre GET
	$idCentre = isset($_GET['id_centre']) ? intval($_GET['id_centre']) : 0;
	$nomCentre = isset($_GET['nom_centre']) ? htmlspecialchars($_GET['nom_centre']) : ''; // Nom del centre rebut com a paràmetre

    $sql = "
				SELECT 
					id_centre,
					SUM(num_alumnes_infantil) AS total_alumnes_infantil,
					SUM(num_alumnes_primaria) AS total_alumnes_primaria,
					SUM(num_alumnes_eso) AS total_alumnes_eso,
					SUM(num_alumnes_batx) AS total_alumnes_batx,
					SUM(num_alumnes_fp) AS total_alumnes_fp,
					SUM(
						num_alumnes_infantil +
						num_alumnes_primaria +
						num_alumnes_eso +
						num_alumnes_batx +
						num_alumnes_fp
					) AS total_alumnes
				FROM 
					assignar_espais
				WHERE 
					id_centre = ?
				GROUP BY 
					id_centre;
    ";

	$stmt = $connexio->prepare($sql);
	if ($stmt === false) {
    die("Prepare failed: " . $connexio->error);
}
	$stmt->bind_param("i", $idCentre);
	$stmt->execute();
	$resultat = $stmt->get_result();
	
	if ($resultat->num_rows > 0) {
		$row = $resultat->fetch_assoc();
		// Asigna los valores de la consulta a las variables
		$totalAlumnesInfantil = $row['total_alumnes_infantil'];
		$totalAlumnesPrimaria = $row['total_alumnes_primaria'];
		$totalAlumnesEso = $row['total_alumnes_eso'];
		$totalAlumnesBatx = $row['total_alumnes_batx'];
		$totalAlumnesFp = $row['total_alumnes_fp'];
		$totalAlumnes = $row['total_alumnes'];
	}	
?>

	<html>

	<head>

		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Càlcul d'espais</title>

		<link rel="stylesheet" href="css/estilos.css" type="text/css" />
		<link rel="stylesheet" href="css/estilos_ficha_2.css" type="text/css" />

		<script src="js/utiles.js" type="" language="JavaScript"></script>
		<script src="js/especificas.js" type="" language="JavaScript"></script>

	</head>

	<body class="contenido" onload="ocultarFondoPrincipal();">
	<form name="entidad">
	<ul class="botoneraListado">
		<li class="tituloListado">Càlcul d'espais del <?php echo $nomCentre ?></li>
	</ul>

	<div class="espacioMarronClaro"></div>

	<div class="formularioFichaContainer">
		<div class="formularioFichaRow">
			<label for="codiInfantil" class="campoFicha_Blanca">Total alumnes infantil:</label>
			<input type="text" id="codiInfantil" name="codiInfantil" class="formularioFicha" value="<?php echo $totalAlumnesInfantil ?>" size="5" readonly>
		</div>
		<div class="formularioFichaRow">
			<label for="codiPrimaria" class="campoFicha_Blanca">Total alumnes primària:</label>
			<input type="text" id="codiPrimaria" name="codiPrimaria" class="formularioFicha" value="<?php echo $totalAlumnesPrimaria ?>" size="5" readonly>
		</div>
		<div class="formularioFichaRow">
			<label for="codiESO" class="campoFicha_Blanca">Total alumnes ESO:</label>
			<input type="text" id="codiESO" name="codiESO" class="formularioFicha" value="<?php echo $totalAlumnesEso ?>" size="5" readonly>
		</div>
		<div class="formularioFichaRow">
			<label for="codiBatx" class="campoFicha_Blanca">Total alumnes batxillerat:</label>
			<input type="text" id="codiBatx" name="codiBatx" class="formularioFicha" value="<?php echo $totalAlumnesBatx ?>" size="5" readonly>
		</div>
		<div class="formularioFichaRow">
			<label for="codiFp" class="campoFicha_Blanca">Total alumnes FP:</label>
			<input type="text" id="codiFp" name="codiFp" class="formularioFicha" value="<?php echo $totalAlumnesFp ?>" size="5" readonly>
		</div>
		<div class="formularioFichaRow">
			<label for="codiTotal" class="campoFicha_Blanca">Total alumnes:</label>
			<input type="text" id="codiTotal" name="codiTotal" class="formularioFicha" value="<?php echo $totalAlumnes ?>" size="5" readonly>
		</div>
	</div>	
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
			/*	if ($result->num_rows > 0) {
					while ($row = $result->fetch_assoc()) {
						echo "<tr onclick=\"window.location.href='centreForm.php?id=" . $row["id"] . "'\">";
						echo "<td class='campoListadoInicial'>" . $row["Codi"] . "</td>";
						echo "<td class='campoListado'>" . $row["Centre"] . "</td>";
						echo "<td class='campoListado'>" . $row["Telefon"] . "</td>";
						echo "<td class='campoListado'>" . $row["Localitat"] . "</td>";
						echo "<td class='campoListado'>" . $row["Municipi"] . "</td>";
						echo "<td class='campoListado'>" . $row["Illa"] . "</td>";
						echo "</a></tr>";
					}
				} else {
					// Si no hi ha resultats, mostra un missatge
					echo "<tr><td colspan='6'>No s'han trobat resultats.</td></tr>";
				}*/
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

