<!DOCTYPE html>
<?php
	include '../connectarBD.php';
	
	// Inicialitzar variables per als camps del formulari
	$idPagament = isset($_GET['id_pagament']) ? intval($_GET['id_pagament']) : null;
	$idActuacio = isset($_GET['id_actuacio']) ? intval($_GET['id_actuacio']) : null;
	$concepte = '';
	$import = '';
	$data = '';

	// Si es rep un `codi`, consultar la taula `pagament_conveni` per obtenir les dades
	if ($idPagament) {
		$sql = "
			SELECT	id, 
					data, 
					concepte,
					import,
					id_actuacio
			FROM pagament_conveni
			WHERE id = ?
		";
		$stmt = $connexio->prepare($sql);
		$stmt->bind_param("i", $idPagament);
		$stmt->execute();
		$resultat = $stmt->get_result();

		// Si es troben resultats, assignar els valors a les variables
		if ($resultat->num_rows > 0) {
			$row = $resultat->fetch_assoc();
			$concepte = $row['concepte'];
			$data = $row['data'];
			$import = $row['import'];
		}

		$stmt->close();
	}

?>	


<html>
	<head>

		<title>Fitxa de pagament d'actuació de conveni</title>

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
			<li class="tituloFicha"><p class="posicionTituloFicha">FITXA DE PAGAMENT D'ACTUACIÓ DE CONVENI</p></li>
		</ul>
		<div class="espacioMarron">&nbsp;</div>
		<div id="fichaEditable" style="background-color:#ffffff;">
		<div class="cabeceraFicha"></div>
		<form name="entidad" method="post" action="pagamentActuacioConveniInsertUpdate.php">
			<input type="hidden" name="id_actuacio" value="<?php echo $idActuacio ?>">
			<input type="hidden" name="id_pagament" value="<?php echo $idPagament ?>">
			<div class="contenedorFicha">
				<div class="contenidoSeccion">
					<div class="fila">	
						<label for="data" class="campoFicha_Blanca">Data:</label>
						<input type="date" id="data" name="data" class="formularioFicha" size="50" value="<?php echo $data; ?>"><br>						
						<label for="concepte" class="campoFicha_Blanca">Concepte:</label>
						<input type="text" id="concepte" name="concepte" class="formularioFicha" size="50" value="<?php echo $concepte; ?>"><br>	
						<label for="import" class="campoFicha_Blanca">Import:</label>
						<input type="text" id="import" name="import" class="formularioFicha" size="100" value="<?php echo $import; ?>"><br>					
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
		<form method="get" action="pagamentActuacioConveniDelete.php">
			<input type="hidden" name="id_pagament" value="<?php echo $idDocument ?>">
			<input type="hidden" name="id_actuacio" value="<?php echo $idActuacio ?>">
			<button type="submit" class="boton" onclick="return confirm('¿Estàs segur de borrar aquest pagament?');">Eliminar</button>
		</form>		
	</body>
</html>