<!DOCTYPE html>
<?php
	include '../connectarBD.php';
	
	// Inicialitzar variables per als camps del formulari
	$idInforme = isset($_GET['id_informe']) ? intval($_GET['id_informe']) : null;
	$idActuacio = isset($_GET['id_actuacio']) ? intval($_GET['id_actuacio']) : null;
	$nom = '';
	$url = '';
	$observacions = '';

	// Si es rep un `codi`, consultar la taula `informe_actuacio` per obtenir les dades
	if ($idInforme) {
		$sql = "
			SELECT id, nom, data, url, observacions, actuacio_id
			FROM informe_actuacio 
			WHERE id = ?
		";
		$stmt = $connexio->prepare($sql);
		$stmt->bind_param("i", $idInforme);
		$stmt->execute();
		$resultat = $stmt->get_result();

		// Si es troben resultats, assignar els valors a les variables
		if ($resultat->num_rows > 0) {
			$row = $resultat->fetch_assoc();
			$nom = $row['nom'];
			$data = $row['data'];
			$url = $row['url'];
			$observacions = $row['observacions'];
		}

		$stmt->close();
	}
?>	


<html>
	<head>

		<title>Fitxa d'informe tècnic d'actuació</title>

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
			<li class="tituloFicha"><p class="posicionTituloFicha">FITXA D'INFORME D'ACTUACIÓ</p></li>
		</ul>
		<div class="espacioMarron">&nbsp;</div>
		<div id="fichaEditable" style="background-color:#ffffff;">
		<div class="cabeceraFicha"></div>
		<form name="entidad" method="post" action="informeActuacioInsertUpdate.php">
			<input type="hidden" name="id_actuacio" value="<?php echo $idActuacio ?>">
			<input type="hidden" name="id_informe" value="<?php echo $idInforme ?>">
			<div class="contenedorFicha">
				<div class="contenidoSeccion">
					<div class="fila">						
						<label for="data" class="campoFicha_Blanca">Data:</label>
						<input type="date" id="data" name="data" class="formularioFicha" size="50" value="<?php echo $nom; ?>"><br>						
						<label for="nom" class="campoFicha_Blanca">Nom de l'informe:</label>
						<input type="text" id="nom" name="nom" class="formularioFicha" size="50" value="<?php echo $nom; ?>"><br>						
						<label for="url" class="campoFicha_Blanca">URL:</label>
						<input type="text" id="url" name="url" class="formularioFicha" size="150" value="<?php echo $url; ?>"><br>
						<label for="observacions" class="campoFicha_Blanca" style="align-self:start; display:grid">Observacions:</label>
						<textarea name="observacions" id="observacions" rows="6" cols="100"><?= $observacions ?></textarea>

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
		<form method="get" action="informeActuacioDelete.php">
			<input type="hidden" name="id_informe" value="<?php echo $idInforme ?>">
			<input type="hidden" name="id_actuacio" value="<?php echo $idActuacio ?>">
			<button type="submit" class="boton" onclick="return confirm('¿Estàs segur de borrar aquest informe?');">Eliminar</button>
		</form>		
	</body>
</html>