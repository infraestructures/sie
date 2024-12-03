<!DOCTYPE html>
<?php
	// Connexió a la base de dades
	$host = "localhost";
	$user = "root";
	$password = "";
	$dbname = "sie";

	$connexio = new mysqli($host, $user, $password, $dbname);

	// Comprovar la connexió
	if ($connexio->connect_error) {
		die("Error de connexió " . $connexio->connect_error);
	}

	$connexio->set_charset("utf8mb4");
	
	// Inicializa variables para los campos del formulario
	$codi = $nom = $tipus = $ubicacio = $ocupacio = $metres = "";

	// Verifica si se ha recibido un parámetro 'codi'
	if (isset($_GET['codi'])) {
		$codi = $_GET['codi'];

		// Consulta para obtener los datos del espacio
		$sql = "SELECT * FROM espai WHERE codi = ?";
		$stmt = $connexio->prepare($sql);
		$stmt->bind_param("i", $codi);
		$stmt->execute();
		$resultat = $stmt->get_result();

		if ($resultat->num_rows > 0) {
			$fila = $resultat->fetch_assoc();
			$nom = $fila['nom'];
			$tipus = $fila['tipus'];
			$ubicacio = $fila['ubicacio'];
			$ocupacio = $fila['ocupacio_per_persona'];
			$metres = $fila['metres_per_unitat'];
		}
	}
?>	


<html>
	<head>

		<title>Fitxa de centre educatiu</title>

		<link rel="stylesheet" href="css/estilos.css" type="text/css" />
		<link rel="stylesheet" href="css/estilos_ficha_2.css" type="text/css" />
		<link rel="stylesheet" href="css/dhtmlgoodies_calendar.css" type="text/css" />

		<script src="js/utiles.js" language="javascript"></script>
		<script src="js/especificas.js" language="javascript"></script>
		<script src="js/dhtmlgoodies_calendar.js" type="text/javascript" language="JavaScript"></script>
		
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body class="contenido" onload="ocultarFondoPrincipal();">
		<!-- Formulario para insertar o actualizar -->		
		<div class="contenedorFiltro"></div>
		<ul class="botoneraFicha">
			<li class="tituloFicha"><p class="posicionTituloFicha">FITXA DE CENTRE EDUCATIU</p></li>
		</ul>
		<div class="espacioMarron">&nbsp;</div>
		<div id="fichaEditable" style="background-color:#ffffff;">
		<div class="cabeceraFicha"></div>
		<form name="entidad" method="post" action="espaiInsertUpdate.php">
			<div class="contenedorFicha">
				<div class="tituloSeccion"><p class="textoTituloSeccion">Datos generales</p></div>
				<div class="contenidoSeccion">
					<div class="fila">						
							<input type="hidden" name="codi" value="<?php echo $codi ?>">

							<label for="tipus" class="campoFicha_Blanca">Tipus d'espai:</label>
							<select id="tipus" name="tipus" class="formularioFicha" required>
								<option value="">Seleccioni un tipus d'espai</option>
                                <option value="Docent" <?php echo ($tipus == "Docent") ? 'selected' : ''; ?>>Docent</option>
								<option value="Complementari" <?php echo ($tipus == "Complementari") ? 'selected' : ''; ?>>Complementari</option>
							</select>

							<label for="nom" class="campoFicha_Blanca">Nom de l'espai:</label>
							<input type="text" id="nom" name="nom" class="formularioFicha" size="30" value="<?php echo $nom; ?>" required><br><br>
							
							<label for="ubicacio" class="campoFicha_Blanca">Ubicació:</label>
							<select id="ubicacio" name="ubicacio" class="formularioFicha" required>
								<option value="">Seleccioni un tipus d'espai</option>
                                <option value="Interior" <?php echo ($ubicacio == "Interior") ? 'selected' : ''; ?>>Interior</option>
								<option value="Exterior" <?php echo ($ubicacio == "Exterior") ? 'selected' : ''; ?>>Exterior</option>
							</select>
							
							<label for="ocupacio" class="campoFicha_Blanca">Ocupació per persona:</label>
							<input type="text" id="ocupacio" name="ocupacio" class="formularioFicha" value="<?php echo $ocupacio; ?>" required><br><br>

							<label for="metres" class="campoFicha_Blanca">Metres per unitat:</label>
							<input type="text" id="metres" name="metres" class="formularioFicha" size="30" value="<?php echo $metres; ?>" required><br><br>
					</div>
				</div>
			</div>				
		</div>
		<li class="fondoBotoneraFicha">
			<input type="submit" class="boton" value="Desar canvis">
		</li>
		<li class="volverFicha">
			<input type="button" class="boton" value="Tornar al llistat" onclick="window.history.back();">
		</li>		
		</form>
		<!-- Formulario para eliminar -->
		<form method="post" action="espaiDelete.php">
			<input type="hidden" name="codi" value="<?php echo $codi ?>">
			<button type="submit" class="boton" onclick="return confirm('¿Estàs segur de borrar aquest espai?');">Eliminar</button>
		</form>		
	</body>
</html>