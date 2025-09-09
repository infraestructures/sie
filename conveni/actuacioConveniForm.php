<!DOCTYPE html>
<?php
	include '../connectarBD.php';

	// Recupera el id de la solicitud GET
	$id = $_GET['id'] ?? null;
	$id_centre = $_GET['id_centre'] ?? '';
	$id_conveni = $_GET['id_conveni'] ?? '';
	$nom_centre = $_GET['nom_centre'] ?? '';

	$fechaActual = date('Y-m-d');
	$actuacio = [
		'id' => '',
		'centre_id' => '',
		'descripcio' => '',
		'pressupost_inicial' => '',
		'pressupost_definitiu' => '',
		'aprovacio_inicial' => '',
		'aprovacio_definitiva' => '',
		'previsio_inici' => '',
		'previsio_final' => '',
		'observacions' => '',
		'comissio_seguiment_data' => '',
		'comissio_seguiment_enllac' => ''
	];

	if ($id) {
		$sql = "SELECT
			act.id, 
			act.centre_id,
			act.descripcio,
			act.pressupost_inicial,
			act.pressupost_definitiu,
			act.aprovacio_inicial,
			act.aprovacio_definitiva,
			act.previsio_inici,
			act.previsio_final,
			act.observacions,
			act.comissio_seguiment_data,
			act.comissio_seguiment_enllac
		FROM actuacio_conveni act
		WHERE act.id = ?;";
		$stmt = $connexio->prepare($sql);

		if (!$stmt) {
			die("Error SQL: " . $connexio->error);
		}
		$stmt->bind_param("i", $id);
		$stmt->execute();
		$result = $stmt->get_result();
		$actuacio = $result->fetch_assoc();
	}

	// Obtenir la llista de documents i pagaments relacionats
	$documents = [];
	$pagaments = [];

	if ($id) {
		// Documents
		$stmt = $connexio->prepare("SELECT id, nom, data, url, tipus_id FROM document_actuacio_conveni WHERE actuacio_id = ?");
		$stmt->bind_param("i", $id);
		$stmt->execute();
		$result_documents = $stmt->get_result();
		// Pagaments
		$stmt = $connexio->prepare("SELECT id, concepte, data, import FROM pagament_conveni WHERE id_actuacio = ?");	
		$stmt->bind_param("i", $id);
		$stmt->execute();
		$result_pagaments = $stmt->get_result();
	}
?>

<html>

<head>

	<title>Fitxa de conveni</title>

	<link rel="stylesheet" href="../css/estilos.css" type="text/css" />
	<link rel="stylesheet" href="../css/estilos_ficha_2.css" type="text/css" />

	<script src="../js/utiles.js" language="javascript"></script>
	<script src="../js/especificas.js" language="javascript"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function obrirCentre() {
			const codiCentre = document.getElementById('centre_id').value;
			if (!codiCentre) {
				alert("Selecciona un centre.");
				return;
			}		
			const url = `../centre/centreForm.php?id=${encodeURIComponent(codiCentre)}`;
			window.open(url, 'Centre', 'width=800,height=600,scrollbars=yes,resizable=yes');
		}		

		function actualitzaCentreId() {
			const select = document.getElementById('centre');
			const centreId = select.value;
			document.getElementById('centre_id').value = centreId;
		}		
	</script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body class="contenido" onload="ocultarFondoPrincipal();">
	<!-- Formulario para insertar o actualizar -->
	<div class="contenedorFiltro"></div>
	<ul class="botoneraFicha">
		<li class="tituloFicha">
			<p class="posicionTituloFicha">FITXA D'ACTUACIÓ A CENTRE EDUCATIU</p>
		</li>
	</ul>
	<div class="espacioMarron">&nbsp;</div>
	<div id="fichaEditable" style="background-color:#ffffff;">
		<div class="cabeceraFicha"></div>
			<form name="entidad" method="post" action="actuacioConveniInsertUpdate.php">
				<div class="contenedorFicha">
					<div class="tituloSeccion">
						<p class="textoTituloSeccion">Dades generals</p>
					</div>
					<input type="hidden" name="id" value="<?php echo $id ?>">
					<input type="hidden" name="id_conveni" value="<?php echo $id_conveni ?>">
					<input type="hidden" name="id_centre" value="<?php echo $id_centre ?>">
					<table>
						<tr>
							<td>
								<!-- Codi d'actuació -->
								<label for="codi" class="campoFicha_Blanca">Codi d'actuació:</label>
								<input type="text" id="codi" name="codi" class="formularioFicha" value="<?= $actuacio['id'] ?>" disabled ><br><br>
							</td>	
							<td>
								<!-- Centre -->
								<label class="campoFicha_Blanca">Centre:</label>
								<input type="text" name="centre" value="<?= $nom_centre ?>" readonly>
								<input type="hidden" id="centre_id" name="centre_id" value="<?= $id_centre ?>">
								<button type="button" onclick="obrirCentre()">Veure centre</button>
							</td>							
						</tr>
						<tr>
							<td colspan="3">
								<!-- Descripció -->
								<label for="descripcio" class="campoFicha_Blanca">Descripció:</label>
								<input type="text" id="descripcio" name="descripcio" class="formularioFicha" SIZE="50" value="<?= $actuacio['descripcio'] ?>"><br><br>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<!-- Pressupost inicial -->
								<label for="pressupost_inicial" class="campoFicha_Blanca">Pressupost inicial en euros (IVA inclòs):</label>
								<input type="text" id="pressupost_inicial" name="pressupost_inicial" class="formularioFicha" value="<?= $actuacio['pressupost_inicial'] ?>"><br><br>
							</td>
							<td>
								<!-- Pressupost definitiu -->
								<label for="pressupost_definitiu" class="campoFicha_Blanca">Pressupost definitiuen euros (IVA inclòs):</label>
								<input type="text" id="pressupost_definitiu" name="pressupost_definitiu" class="formularioFicha" value="<?= $actuacio['pressupost_definitiu'] ?>"><br><br>
							</td>
						</tr>	
						<tr>
							<td>
								<!-- Data d'aprovació inicial -->
								<label for="aprovacio_inicial" class="campoFicha_Blanca">Data d'aprovació inicial:</label>
								<input type="date" id="aprovacio_inicial" name="aprovacio_inicial" class="formularioFicha"
									value="<?= !empty($actuacio['aprovacio_inicial']) ? date('Y-m-d', strtotime($actuacio['aprovacio_inicial'])) : '' ?>"><br><br>
							</td>
							<td>
								<!-- Data d'aprovació definitiva -->
								<label for="aprovacio_definitiva" class="campoFicha_Blanca">Data d'aprovació definitiva:</label>
								<input type="date" id="aprovacio_definitiva" name="aprovacio_definitiva" class="formularioFicha" value="<?= !empty($actuacio['aprovacio_definitiva']) ? date('Y-m-d', strtotime($actuacio['aprovacio_definitiva'])) : '' ?>"><br><br>
							</td>
						</tr>
						<tr>
							<td>
								<!-- Data previsió inici -->
								<label for="previsio_inici" class="campoFicha_Blanca">Data de previsió d'inicial:</label>
								<input type="date" id="previsio_inici" name="previsio_inici" class="formularioFicha" value="<?= date('Y-m-d', strtotime($actuacio['previsio_inici'])) ?>"><br><br>
							</td>
							<td>
								<!-- Data previsió final -->
								<label for="previsio_final" class="campoFicha_Blanca">Data de previsió final:</label>
								<input type="date" id="previsio_final" name="previsio_final" class="formularioFicha" value="<?= date('Y-m-d', strtotime($actuacio['previsio_final'])) ?>"><br><br>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<label for="observacions" class="campoFicha_Blanca" style="align-self:start; display:grid">Observacions:</label>
								<textarea name="observacions" id="observacions" class="contenedorFicha_Blanca" rows="6" cols="100"><?= $actuacio['observacions'] ?></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="comissio_seguiment_data" class="campoFicha_Blanca" style="align-self:start; display:grid">Data de comissió de seguiment:</label>
								<input type="date" id="comissio_seguiment_data" name="comissio_seguiment_data" class="formularioFicha" value="<?= date('Y-m-d', strtotime($actuacio['comissio_seguiment_data'])) ?>"><br><br>
							</td>
							<td>
								<label for="comissio_seguiment_enllac" class="campoFicha_Blanca" style="align-self:start; display:grid">Enllaç de comissió de seguiment:</label>
								<input type="text" id="comissio_seguiment_enllac" name="comissio_seguiment_enllac" class="formularioFicha" value="<?= $actuacio['comissio_seguiment_enllac'] ?>"><br><br>
							</td>
						</tr>
					</table>
				</div>
				<br><br>
				<?php if ($id): ?>
				<div class="contenedorFicha">
					<ul class="botoneraListado">
						<li class="tituloListado">LLISTAT DE DOCUMENTS</li>
						<li class="fondoBotoneraListado">
							<input type="button" class="boton" value="Nou document" onclick="location.href='documentActuacioConveniForm.php?id_actuacio=<?php echo $id ?>';">
						</li>
					</ul>

					<div class="espacioMarronClaro"></div>

					<div id="cuerpo" class="scroll_total">
						<table class="listado" cellpadding="0" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="campoCabeceraListadoInicial">Data</th>
									<th class="campoCabeceraListado">Nom</th>
									<th class="campoCabeceraListado">URL</th>
								</tr>
							</thead>
							<tbody>
								<?php
								// Recorre els resultats i mostra cada document en una fila
								if ($result_documents && $result_documents->num_rows > 0) {
									while ($row = $result_documents->fetch_assoc()) {
										echo "<tr onclick=\"window.location.href='documentActuacioConveniForm.php?id_document=". $row["id"]. "&id_actuacio=". $id."'\">";
										echo "<td class='campoListadoInicial'>". date('Y-m-d', strtotime($row["data"])). "</td>";
										echo "<td class='campoListadoInicial'>". $row["nom"]. "</td>";
										echo "<td class='campoListado'>";
										if (!empty($row['url'])) {
											echo "<a href='" . htmlspecialchars($row['url']) . "' onclick=\"event.preventDefault(); event.stopPropagation(); window.open(this.href, '_blank');\">Veure Document</a>";
										}
										echo "</td>";										
										echo "</a></tr>";
									}
								} else {
									// Si no hi ha resultats, mostra un missatge
									echo "<tr><td colspan='3'>No s'han trobat resultats.</td></tr>";
								}
							?>
							</tbody>
						</table>
					</div>			
				</div>
				<?php endif; ?>	
				<?php if ($id): ?>
				<br><br>
				<div class="contenedorFicha">
					<ul class="botoneraListado">
						<li class="tituloListado">LLISTAT DE PAGAMENTS</li>
						<li class="fondoBotoneraListado">
							<input type="button" class="boton" value="Nou pagament" onclick="location.href='pagamentActuacioConveniForm.php?id_actuacio=<?php echo $id ?>';">
						</li>
					</ul>

					<div class="espacioMarronClaro"></div>

					<div id="cuerpo" class="scroll_total">
						<table class="listado" cellpadding="0" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="campoCabeceraListadoInicial">Data</th>
									<th class="campoCabeceraListado">Concepte</th>
									<th class="campoCabeceraListado">Import</th>
								</tr>
							</thead>
							<tbody>
								<?php
								// Recorre els resultats i mostra cada document en una fila
								if ($result_pagaments && $result_pagaments->num_rows > 0) {
									while ($row = $result_pagaments->fetch_assoc()) {
										echo "<tr onclick=\"window.location.href='pagamentActuacioConveniForm.php?id_pagament=". $row["id"]. "&id_actuacio=". $id. "&id_conveni=" . $id_conveni . "&id_centre=$id_centre'\">";
										echo "<td class='campoListadoInicial'>". date('Y-m-d', strtotime($row["data"])). "</td>";
										echo "<td class='campoListado'>". $row["concepte"]. "</td>";
                                        echo "<td class='campoListado'>" . $row["import"] . "</td>";
										echo "<td class='campoListado'>";
										echo "</td>";										
										echo "</a></tr>";
									}
								} else {
									// Si no hi ha resultats, mostra un missatge
									echo "<tr><td colspan='3'>No s'han trobat resultats.</td></tr>";
								}
							?>
							</tbody>
						</table>
					</div>			
				</div>
				<?php endif; ?>	
			</div>
			
			<li class="fondoBotoneraFicha">
				<input type="submit" class="boton" onclick="return confirm('Estàs segur de desar els canvis?');" value="Desar canvis">
			</li>
		</div>	
	</form>
	<!-- Formulario para eliminar -->
	<form method="get" action="actuacioConveniDelete.php">
		<li class="fondoBotoneraFicha">
			<input type="hidden" name="id_actuacio" value="<?php echo $id ?>">
			<button type="submit" class="boton" onclick="return confirm('Estàs segur de borrar aquesta actuació?');">Eliminar</button>
		</li>
	</form>

	<li class="volverFicha">
		<input type="button" class="boton" value="Tornar al llistat" onclick="window.location.href='centreConveniForm.php?id_centre=<?php echo $id_centre ?>&id_conveni=<?php echo $id_conveni ?>'">

	</li>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			document.querySelectorAll('.abrirEnlace').forEach(function(link) {
				link.addEventListener('click', function(event) {
					event.preventDefault();  // Evita la recarga
					window.open(this.dataset.url, '_blank');
				});
			});
		});
</script>

</body>

</html>