<!DOCTYPE html>
<?php
	include '../connectarBD.php';
	
	// Inicialitzar variables per als camps del formulari
	$idDocument = isset($_GET['id']) ? intval($_GET['id']) : null;
	$idActuacio = isset($_GET['id_actuacio']) ? intval($_GET['id_actuacio']) : null;
	$nom = '';
	$url = '';
	$data = '';

	// Si es rep un `codi`, consultar la taula `document_actuacio` per obtenir les dades
	if ($idDocument) {
		$sql = "
			SELECT	id, 
					tipus_id, 
					nom, 
					url, 
					data, 
					id_actuacio
			FROM document_conveni
			WHERE id = ?
		";
		$stmt = $connexio->prepare($sql);
		$stmt->bind_param("i", $idDocument);
		$stmt->execute();
		$resultat = $stmt->get_result();

		// Si es troben resultats, assignar els valors a les variables
		if ($resultat->num_rows > 0) {
			$row = $resultat->fetch_assoc();
			$tipus_id = $row['tipus_id'];
			$nom = $row['nom'];
			$data = $row['data'];
			$url = $row['url'];
		}

		$stmt->close();
	}

	// Obtenir els tipus de document d'actuació de conveni
	$sql = "SELECT id, descripcio FROM tipus_document_actuacio_conveni";
	$result = $connexio->query($sql);
	$tipus_document_actuacio_conveni = [];
	while ($row = $result->fetch_assoc()) {
		$tipus_document_actuacio_conveni[] = $row;
	}
?>	


<html>
	<head>

		<title>Fitxa de document d'actuació de conveni</title>

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
			<li class="tituloFicha"><p class="posicionTituloFicha">FITXA DE DOCUMENT D'ACTUACIÓ DE CONVENI</p></li>
		</ul>
		<div class="espacioMarron">&nbsp;</div>
		<div id="fichaEditable" style="background-color:#ffffff;">
		<div class="cabeceraFicha"></div>
		<form name="entidad" method="post" action="documentActuacioConveniInsertUpdate.php">
			<input type="hidden" name="id_actuacio" value="<?php echo $idActuacio ?>">
			<input type="hidden" name="id_document" value="<?php echo $idDocument ?>">
			<div class="contenedorFicha">
				<div class="contenidoSeccion">
					<div class="fila">												
						<label for="nom" class="campoFicha_Blanca">Nom del document:</label>
						<input type="text" id="nom" name="nom" class="formularioFicha" size="50" value="<?php echo $nom; ?>"><br>	
						<label class="campoFicha_Blanca">Tipus d'actuació:</label>
						<select id="tipus_actuacio_conveni" name="tipus_actuacio_conveni" class="campoFicha_Blanca" required>
							<option value="">Selecciona un tipus</option>
							<?php foreach ($tipus_document_actuacio_conveni as $tipus): ?>
								<option value="<?= $tipus['id'] ?>" <?= $tipus['id'] == $row['tipus_id'] ? 'selected' : '' ?>>
									<?= htmlspecialchars($tipus['descripcio']) ?></option>
							<?php endforeach; ?>
						</select>						
					</div>
					<div class="fila">	
						<label for="data" class="campoFicha_Blanca">Data:</label>
						<input type="date" id="data" name="data" class="formularioFicha" size="50" value="<?php echo $data; ?>"><br>
						<label for="url" class="campoFicha_Blanca">URL:</label>
						<input type="text" id="url" name="url" class="formularioFicha" size="100" value="<?php echo $url; ?>"><br>
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
		<form method="get" action="documentActuacioDelete.php">
			<input type="hidden" name="id_document" value="<?php echo $idDocument ?>">
			<input type="hidden" name="id_actuacio" value="<?php echo $idActuacio ?>">
			<button type="submit" class="boton" onclick="return confirm('¿Estàs segur de borrar aquest document?');">Eliminar</button>
		</form>		
	</body>
</html>