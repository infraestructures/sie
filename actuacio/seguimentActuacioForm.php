<!DOCTYPE html>
<?php
	include '../connectarBD.php';
	
	// Inicialitzar variables per als camps del formulari
	$idSeguiment = isset($_GET['id_seguiment']) ? intval($_GET['id_seguiment']) : null;
	$idActuacio = isset($_GET['id_actuacio']) ? intval($_GET['id_actuacio']) : null;
	$nom = '';
	$url = '';
	$accio = '';
$data = '';

	// Si es rep un `codi`, consultar la taula `informe_actuacio` per obtenir les dades
	if ($idSeguiment) {
		$sql = "
			SELECT id, data, accio, url, actuacio_id
			FROM seguiment_actuacio 
			WHERE id = ?
		";
		$stmt = $connexio->prepare($sql);
		$stmt->bind_param("i", $idSeguiment);
		$stmt->execute();
		$resultat = $stmt->get_result();

		// Si es troben resultats, assignar els valors a les variables
		if ($resultat->num_rows > 0) {
			$row = $resultat->fetch_assoc();
			$data = $row['data'];
			$accio = $row['accio'];
			$url = $row['url'];
		}

		$stmt->close();
	}
?>	


<html>
	<head>

		<title>Seguiment d'actuació</title>

		<link rel="stylesheet" href="../css/estilos.css" type="text/css" />
		<link rel="stylesheet" href="../css/estilos_ficha_2.css" type="text/css" />

		<script src="../js/utiles.js" language="javascript"></script>
		<script src="../js/especificas.js" language="javascript"></script>
		
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body class="contenido" onload="ocultarFondoPrincipal();">
		<!-- Formulario para insertar o actualizar -->		
		<div class="contenedorFiltro"></div>
		<ul class="botoneraFicha">
			<li class="tituloFicha"><p class="posicionTituloFicha">SEGUIMENT D'ACTUACIÓ</p></li>
		</ul>
		<div class="espacioMarron">&nbsp;</div>
		<div id="fichaEditable" style="background-color:#ffffff;">
		<div class="cabeceraFicha"></div>
		<form name="entidad" method="post" action="seguimentActuacioInsertUpdate.php">
			<input type="hidden" name="id_actuacio" value="<?php echo $idActuacio ?>">
			<input type="hidden" name="id_seguiment" value="<?php echo $idSeguiment ?>">
			<div class="contenedorFicha">
				<div class="contenidoSeccion">
					<div class="fila">						
						<label for="data" class="campoFicha_Blanca">Data:</label>
						<input type="date" id="data" name="data" class="formularioFicha" size="50" value="<?php echo $data; ?>"><br>
						<label for="accio" class="campoFicha_Blanca">Acció:</label>
						<input type="text" id="accio" name="accio" class="formularioFicha" size="150" value="<?php echo $accio; ?>"><br>
						<label for="url" class="campoFicha_Blanca">URL:</label>
						<input type="text" id="url" name="url" class="formularioFicha" size="150" value="<?php echo $url; ?>"><br>
					</div>
				</div>
			</div>				
		</div>
		<li class="fondoBotoneraFicha">
			<button type="submit" class="boton">Desar canvis</button>
		</li>
		<li class="volverFicha">
			<button type="button" class="boton"onclick="window.history.back();">Tornar al llistat</button>
		</li>		
		</form>
		<!-- Formulario para eliminar -->
		<form method="get" action="seguimentActuacioDelete.php">
			<input type="hidden" name="id_seguiment" value="<?php echo $idSeguiment ?>">
			<input type="hidden" name="id_actuacio" value="<?php echo $idActuacio ?>">
			<button type="submit" class="boton" onclick="return confirm('¿Estàs segur de borrar aquesta acció?');">Eliminar</button>
		</form>		
	</body>
</html>