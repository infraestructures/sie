<!DOCTYPE html>
<?php
	include '../connectarBD.php';

	// Recupera el id de la solicitud GET
	$id = $_GET['id'] ?? null;

	$id_illa = $_GET['illa'] ?? '';
	$id_municipi = $_GET['municipi'] ?? '';	

	$fechaActual = date('Y-m-d');
	$conveni = [
		'codi' => '',
		'descripcio' => '',
		'pressupost' => '',
		'observacions' => '',
		'estat_conveni_id' => '',
		'nom_illa' => '',
		'nom_municipi' => '',
		'nom_centre' => '',
		'data_inici' => $fechaActual,
		'data_signatura' => '',
		'data_pagament' => '',
		'illa_id' => '',
		'ajuntament_id' => ''
	];

	if ($id) {
		$sql = "SELECT
			conv.id,
			conv.codi,
			conv.descripcio,
			conv.pressupost,
			conv.estat_conveni_id, 
			conv.data_inici,
			conv.data_pagament,
			conv.data_signatura,
			conv.ajuntament_id,
			conv.observacions,
			i.nom AS nom_illa,
			m.nom AS nom_municipi,
			e.nom AS nom_estat
		FROM conveni conv
			JOIN municipi m ON conv.ajuntament_id = m.id
			JOIN illa i ON m.illa_id = i.id
			JOIN estat_conveni e ON conv.estat_conveni_id = e.id
		WHERE conv.id = ?;";
		$stmt = $connexio->prepare($sql);

		if (!$stmt) {
			die("Error SQL: " . $connexio->error);
		}
		$stmt->bind_param("i", $id);
		$stmt->execute();
		$result = $stmt->get_result();
		$conveni = $result->fetch_assoc();
	}

	// Consulta per obtenir la llista d'illes i municipis
	$sql_illes = "SELECT id, nom FROM Illa";
	$result_illes = $connexio->query($sql_illes);

	$sql_municipis = $id_illa
		? "SELECT id, nom FROM Municipi WHERE illa_id = $id_illa ORDER BY nom"
		: "SELECT id, nom FROM Municipi ORDER BY nom";
	$result_municipis = $connexio->query($sql_municipis);

	// Consulta per obtenir la llista d'estats
	$sql_estats = "SELECT id, nom FROM estat_conveni order by id";
	$result_estats = $connexio->query($sql_estats);

	// Llista de centres associats al conveni
	$sql_centres = "SELECT 
						CENTRES.id, 
						CENTRES.Codi, 
						CENTRES.Centre, 
						CENTRES.Telefon, 
						CENTRES.Localitat AS Localitat, 
						Municipi.nom AS Municipi, 
						Illa.nom AS Illa,
						centre_conveni.id_conveni,
						centre_conveni.pressupost				
					FROM CENTRES
					JOIN centre_conveni ON CENTRES.id = centre_conveni.id_centre
					JOIN Municipi ON CENTRES.id_municipi = Municipi.id
					JOIN Illa ON CENTRES.id_illa = Illa.id
					WHERE centre_conveni.id_conveni = $id;";
	$result_centres = $connexio->query($sql_centres);

	// Variables a enviar al centre
	$codi_conveni = $conveni["codi"];
	$nom_municipi = $conveni["nom_municipi"];
	$id_municipi_get = $conveni['ajuntament_id'];

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
		$(document).ready(function() {
			$('#illa').change(function() {
				var illaID = $(this).val();
				console.log("Illa seleccionada:", illaID);
				$.ajax({
					type: 'POST',
					url: '../actuacio/getMunicipis.php',
					data: {
						illa: illaID
					},
					success: function(response) {
						console.log("Resposta AJAX:", response); // DEBUG
						$('#municipi').html(response);
						$('#centre').html('<option value="">Selecciona un centre</option>');
					},
					error: function(xhr, status, error) {
						console.error("Error en AJAX:", error);
					}
				});
			});
		});

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
			<p class="posicionTituloFicha">FITXA DE CONVENI</p>
		</li>
	</ul>
	<div class="espacioMarron">&nbsp;</div>
	<form name="entidad" method="post" action="conveniInsertUpdate.php">
	<div id="fichaEditable" style="background-color:#ffffff;">
		<div class="cabeceraFicha"></div>
			<div class="contenedorFicha">
				<div class="tituloSeccion">
					<p class="textoTituloSeccion">Dades generals</p>
				</div>
				<input type="hidden" name="id" value="<?php echo $id ?>">
				<table>
					<tr>
						<td>
							<!-- Codi de conveni -->
							<label for="codi" class="campoFicha_Blanca">Codi de conveni:</label>
							<input type="text" id="codi" name="codi" class="formularioFicha" value="<?= $conveni['codi'] ?>" disabled ><br><br>
						</td>	
						<td>
							<!-- Estat -->
							<label for="estat" class="campoFicha_Blanca">Estat:</label>
							<select id="estat" name="estat" class="campoFicha_Blanca">
							<option value="">Selecciona un estat</option>
								<?php while ($row = $result_estats->fetch_assoc()): ?>
									<option value="<?= $row['id'] ?>" <?= $row['id'] == $conveni['estat_conveni_id'] ? 'selected' : '' ?>>
										<?= htmlspecialchars($row['nom']) ?>
									</option>
								<?php endwhile; ?>
							</select>
						</td>												
					</tr>
					<tr>
						<td>
							<!-- Data d'inici -->
							<label for="data_inici" class="campoFicha_Blanca">Data d'inici:</label>
							<input type="date" id="data_inici" name="data_inici" class="formularioFicha" value="<?= date('Y-m-d', strtotime($conveni['data_inici'])) ?>"><br><br>
						</td>		
						<td>
							<!-- Data de signatura -->
							<label for="data_signatura" class="campoFicha_Blanca">Data de signatura:</label>
							<input type="date" id="data_signatura" name="data_signatura" class="formularioFicha" value="<?= date('Y-m-d', strtotime($conveni['data_signatura'])) ?>"><br><br>
						</td>	
						<td>
							<!-- Data de pagament -->
							<label for="data_pagament" class="campoFicha_Blanca">Data de pagament:</label>
							<input type="date" id="data_pagament" name="data_pagament" class="formularioFicha" value="<?= date('Y-m-d', strtotime($conveni['data_pagament'])) ?>"><br><br>
						</td>								
					</tr>
					<tr>
						<td>
							<!-- Illa -->
							<label class="campoFicha_Blanca">Illa:</label>
							<?php if ($id): ?>
								<input type="text" name="illa" value="<?= $conveni['nom_illa'] ?>" readonly>
							<?php else: ?>
								<select name="illa" id="illa" class="campoFicha_Blanca" required>
									<option value="">Selecciona una illa</option>
									<?php while ($row = $result_illes->fetch_assoc()): ?>
										<option value="<?= $row['id'] ?>" <?= $row['id'] == $id_illa ? 'selected' : '' ?>>
											<?= htmlspecialchars($row['nom']) ?>
										</option>
									<?php endwhile; ?>
								</select>
							<?php endif; ?>
						</td>
						<td>
							<!-- Ajuntament -->
							<label class="campoFicha_Blanca">Ajuntament:</label>
							<?php if ($id): ?>
								<input type="text" name="municipi" value="<?= $conveni['nom_municipi'] ?>" readonly>
								<input type="hidden" id="municipi" name="municipi" value="<?= $conveni['ajuntament_id'] ?>">
							<?php else: ?>
								<select id="municipi" name="municipi" class="campoFicha_Blanca" required>
									<option value="">Selecciona un municipi</option>
								</select>
							<?php endif; ?>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<!-- Descripció -->
							<label for="descripcio" class="campoFicha_Blanca">Descripció:</label>
							<input type="text" id="descripcio" name="descripcio" class="formularioFicha" SIZE="50" value="<?= $conveni['descripcio'] ?>"><br><br>
						</td>
						<td>
							<!-- Pressupost -->
							<label for="pressupost" class="campoFicha_Blanca">Pressupost en euros (IVA inclòs):</label>
							<input type="text" id="pressupost" name="pressupost" class="formularioFicha" value="<?= $conveni['pressupost'] ?>"><br><br>
						</td>	
					</tr>
					<tr>
						<td colspan="3">
							<label for="observacions" class="campoFicha_Blanca" style="align-self:start; display:grid">Observacions:</label>
							<textarea name="observacions" id="observacions" class="contenedorFicha_Blanca" rows="6" cols="100"><?= $conveni['observacions'] ?></textarea>
						</td>
					</tr>
				</table>
			</div>
			<br><br>
			<?php if ($id): ?>
			<div class="contenedorFicha">
				<ul class="botoneraListado">
					<li class="tituloListado">LLISTAT DE CENTRES</li>
					<li class="fondoBotoneraListado">
						<input type="button" class="boton" value="Nou centre" onclick="location.href='centreConveniForm.php?id_conveni=<?php echo $id ?>&codi_conveni=<?php echo $codi_conveni ?>&id_municipi=<?php echo $id_municipi_get ?>&nom_municipi=<?php echo $nom_municipi ?>';">
					</li>
				</ul>

				<div class="espacioMarronClaro"></div>

				<div id="cuerpo" class="scroll_total">
					<table class="listado" cellpadding="0" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="campoCabeceraListadoInicial">Codi del centre</th>
								<th class="campoCabeceraListado">Nom del centre</th>
								<th class="campoCabeceraListado">Localitat</th>
								<th class="campoCabeceraListado">Pressupost</th>
							</tr>
						</thead>
						<tbody>
							<?php
							// Recorre els resultats i mostra cada centre en una fila
							if ($result_centres && $result_centres->num_rows > 0) {
								while ($row = $result_centres->fetch_assoc()) {
									echo "<tr onclick=\"window.location.href='centreConveniForm.php?id_centre=". $row["id"]. "&id_conveni=". $id."'\">";
									echo "<td class='campoListadoInicial'>". $row["Codi"]. "</td>";
                                    echo "<td class='campoListado'>" . $row["Centre"] . "</td>";
									echo "<td class='campoListado'>". $row["Localitat"]. "</td>";
									echo "<td class='campoListado'>". $row["pressupost"]. "</td>";
									echo "</tr>";										
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
		<br /><br />
		<ul class="botoneraFicha">
		<li class="fondoBotoneraFicha">
			<input type="submit" class="boton" onclick="return confirm('Estàs segur de desar els canvis?');" value="Desar canvis">
		</li>
		</ul>
	</form>
	<!-- Formulari per eliminar -->
	<form method="post" action="conveniDelete.php">
	<ul class="botoneraFicha" style="display: flex; justify-content: flex-end;">
		<li class="fondoBotoneraFicha">
			<input type="hidden" name="id" value="<?php echo $id ?>">
			<button type="submit" class="boton" onclick="return confirm('Estàs segur de borrar aquest conveni?');">Eliminar</button>
		</li>
		<li class="fondoBotoneraFicha">
			<input type="button" class="boton" value="Tornar al llistat" onclick="window.location.href='conveniListFiltro.php'">
		</li>
	</ul>
	</form>

</body>
</html>