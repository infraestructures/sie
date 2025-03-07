<!DOCTYPE html>
<?php
	include '../connectarBD.php';
	
	// Inicialitzar variables per als camps del formulari
	$idEspai = isset($_GET['id_espai']) ? intval($_GET['id_espai']) : null;
	$idCentre = isset($_GET['id_centre']) ? intval($_GET['id_centre']) : null;
	$nomCentre = isset($_GET['nom_centre']) ? htmlspecialchars($_GET['nom_centre']) : ''; // Nom del centre rebut com a paràmetre
	$numUnitats = $numAlumnesInfantil = $numAlumnesPrimaria = $numAlumnesESO = $numAlumnesBatx = $numAlumnesFP = $preuMetreConstruit = $nomEspai = "";
	$operacio = "insert";

	// Obtenir els espais per al desplegable
	$sql_espais = "SELECT codi, nom FROM espai order by nom";
	$resultat_espais = $connexio->query($sql_espais);

	// Si es rep un `codi`, consultar la taula `assignar_espais` per obtenir les dades
	if ($idEspai) {
		$operacio = "update";
		$sql = "
			SELECT 
				assignar_espais.id_espai,
				assignar_espais.id_centre,
				assignar_espais.num_unitats, 
				assignar_espais.num_alumnes_infantil, 
				assignar_espais.num_alumnes_primaria, 
				assignar_espais.num_alumnes_eso, 
				assignar_espais.num_alumnes_batx, 
				assignar_espais.num_alumnes_fp, 
				assignar_espais.preu_metre_construit, 
				espai.nom AS nom_espai
			FROM assignar_espais 
			JOIN espai ON assignar_espais.id_espai = espai.codi -- Unió amb la taula espai
			JOIN centres ON assignar_espais.id_centre = centres.id -- Unió amb la taula centres
			WHERE assignar_espais.id_espai = ? and
				  assignar_espais.id_centre = ?

		";
		$stmt = $connexio->prepare($sql);
		$stmt->bind_param("ii", $idEspai, $idCentre);
		$stmt->execute();
		$resultat = $stmt->get_result();

		// Si es troben resultats, assignar els valors a les variables
		if ($resultat->num_rows > 0) {
			$row = $resultat->fetch_assoc();
			$numUnitats = $row['num_unitats'];
			$numAlumnesInfantil = $row['num_alumnes_infantil'];
			$numAlumnesPrimaria = $row['num_alumnes_primaria'];
			$numAlumnesESO = $row['num_alumnes_eso'];
			$numAlumnesBatx = $row['num_alumnes_batx'];
			$numAlumnesFP = $row['num_alumnes_fp'];
			$preuMetreConstruit = $row['preu_metre_construit'];
			$nomEspai = $row['nom_espai'];
		}

		$stmt->close();
	}
?>	


<html>
	<head>

		<title>Fitxa d'assignació d'espai de centre educatiu</title>

		<link rel="stylesheet" href="css/estilos.css" type="text/css" />
		<link rel="stylesheet" href="css/estilos_ficha_2.css" type="text/css" />

		<script src="js/utiles.js" language="javascript"></script>
		<script src="js/especificas.js" language="javascript"></script>
		
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body class="contenido" onload="ocultarFondoPrincipal();">
		<!-- Formulario para insertar o actualizar -->		
		<div class="contenedorFiltro"></div>
		<ul class="botoneraFicha">
			<li class="tituloFicha"><p class="posicionTituloFicha">FITXA D'ASSIGNACIÓ D'ESPAI DE CENTRE EDUCATIU</p></li>
		</ul>
		<div class="espacioMarron">&nbsp;</div>
		<div id="fichaEditable" style="background-color:#ffffff;">
		<div class="cabeceraFicha"></div>
		<form name="entidad" method="post" action="espaiCentreInsertUpdate.php">
			<input type="hidden" name="operacio" value="<?php echo $operacio ?>">
			<input type="hidden" name="id_centre" value="<?php echo $idCentre ?>">
			<input type="hidden" name="nom_centre" value="<?php echo $nomCentre ?>">
			<div class="contenedorFicha">
				<div class="tituloSeccion"><p class="textoTituloSeccion">Dades generals</p></div>
				<div class="contenidoSeccion">
					<div class="fila">						
						<label for="nom_centre" class="campoFicha_Blanca">Nom del centre:</label>
						<input type="text" id="nom_centre" name="nom" class="formularioFicha" size="30" value="<?php echo $nomCentre; ?>" readonly><br>
						
						<label for="id_espai" class="campoFicha_Blanca">Espai:</label>
						<select id="id_espai" name="id_espai" class="<?php echo $idEspai ? 'formularioFicha_readonlyselect':'formularioFicha' ?>" required >
							<option value="">Selecciona un espai</option>
							<?php while ($row = $resultat_espais->fetch_assoc()) : ?>
								<option value="<?php echo $row['codi']; ?>" <?php echo ($row['codi'] == $idEspai) ? 'selected' : ''; ?>>
									<?php echo $row['nom']; ?>
								</option>
							<?php endwhile; ?>
						</select><br>
						
						<label for="num_unitats" class="campoFicha_Blanca">Número d'Unitats:</label>
						<input type="number" id="num_unitats" class="formularioFicha" name="num_unitats" value="<?php echo $numUnitats ?>" required><br>

						<label for="num_alumnes_infantil" class="campoFicha_Blanca">Número d'Alumnes Infantil:</label>
						<input type="number" id="num_alumnes_infantil" class="formularioFicha" name="num_alumnes_infantil" value="<?php echo $numAlumnesInfantil ?>"><br>

						<label for="num_alumnes_primaria" class="campoFicha_Blanca">Número d'Alumnes Primària:</label>
						<input type="number" id="num_alumnes_primaria" name="num_alumnes_primaria" class="formularioFicha" value="<?php echo $numAlumnesPrimaria ?>"><br>

						<label for="num_alumnes_eso" class="campoFicha_Blanca">Número d'Alumnes ESO:</label>
						<input type="number" id="num_alumnes_eso" name="num_alumnes_eso" class="formularioFicha" value="<?php echo $numAlumnesESO ?>"><br>

						<label for="num_alumnes_batx" class="campoFicha_Blanca">Número d'Alumnes Batxillerat:</label>
						<input type="number" id="num_alumnes_batx" name="num_alumnes_batx" class="formularioFicha" value="<?php echo $numAlumnesBatx ?>"><br>

						<label for="num_alumnes_fp" class="campoFicha_Blanca">Número d'Alumnes FP:</label>
						<input type="number" id="num_alumnes_fp" name="num_alumnes_fp" class="formularioFicha" value="<?php echo $numAlumnesFP ?>"><br>

						<label for="preu_metre_construit" class="campoFicha_Blanca">Preu per Metre Construït (€):</label>
						<input type="number" step="0.01" id="preu_metre_construit" class="formularioFicha" name="preu_metre_construit" value="<?php echo $preuMetreConstruit ?>" required>

					</div>
				</div>
			</div>				
		</div>
		<li class="fondoBotoneraFicha">
			<button type="submit" class="boton">Assignar espai</button>
		</li>
		<li class="volverFicha">
			<button type="button" class="boton"onclick="window.history.back();">Tornar al llistat</button>
		</li>		
		</form>
		<!-- Formulario para eliminar -->
		<form method="post" action="espaiCentreDelete.php">
			<input type="hidden" name="id_espai" value="<?php echo $idEspai ?>">
			<input type="hidden" name="id_centre" value="<?php echo $idCentre ?>">
			<input type="hidden" name="nom_centre" value="<?php echo $nomCentre ?>">
			<button type="submit" class="boton" onclick="return confirm('¿Estàs segur de borrar aquesta assignació espai?');">Eliminar</button>
		</form>		
	</body>
</html>