<!DOCTYPE html>

<?php
$centreFixat = false;
if (isset($_GET['centre_id']) && !isset($_GET['id'])) {
    $centre_id = intval($_GET['centre_id']);
    $centreFixat = true;
}
?>

<?php
	include '../connectarBD.php';

	// Recupera el id de la solicitud GET
	$id = $_GET['id'] ?? null;
	$origen = $_GET['origen'] ?? null;

	$id_illa = isset($_GET['illa']) ? $_GET['illa'] : '';
	$id_municipi = isset($_GET['municipi']) ? $_GET['municipi'] : '';

	$fechaActual = date('Y-m-d');
	$actuacio = [
		'codi' => '',
		'codi_extern' => '',
		'descripcio' => '',
		'pressupost' => '',
		'assumit_servei' => '',
		'observacions' => '',
		'estat_id' => '',
		'subtipus_id' => '',
		'tipus_id' => '',
		'prioritat_id' => '',
		'nom_illa' => '',
		'nom_municipi' => '',
		'nom_centre' => '',
		'Localitat' => '',
		'data_entrada' => $fechaActual,
		'data_enviament' => '',
		'centre_id' => '',
		'illa_id' => '',
		'municipi_id' => '',
		'tecnic_id' => '',
		'origen_id' => '',
		'desti_id' => '',
		'mode_enviament_id' => '',
		'color' => '',
		'url_ibisec' => ''
	];

	if ($id) {
		$sql = "SELECT
					a.id,
					a.codi,
					a.codi_extern,
					a.descripcio,
					a.pressupost,
					a.observacions,
					a.estat_id, 
					a.prioritat_id,
					a.subtipus_id,
					a.data_entrada,
					a.data_enviament,
					a.tecnic_id,
					a.origen_id,
					a.desti_id,
					a.mode_enviament_id,
					a.assumit_servei,
					a.url_ibisec,
					c.id_illa,
					c.id_municipi,
					a.centre_id,
					s.tipus_id,
					e.color,
					c.Localitat,
					i.nom AS nom_illa,
					m.nom AS nom_municipi,
					c.Centre AS nom_centre,
					e.nom AS nom_estat,
					p.nom AS nom_prioritat,
					s.nom AS nom_subtipus,
					t.nom AS nom_tipus

				FROM actuacions a
					JOIN subtipus_actuacio s ON a.subtipus_id = s.id
					JOIN tipus_actuacio t ON s.tipus_id = t.id
					JOIN centres c ON a.centre_id = c.id
					JOIN illa i ON c.id_illa = i.id
					JOIN municipi m ON c.id_municipi = m.id
					JOIN estat_actuacio e ON a.estat_id = e.id
					JOIN prioritat_actuacio p ON a.prioritat_id = p.id
				WHERE a.id = ?;			
				";
		$stmt = $connexio->prepare($sql);

		if (!$stmt) {
			die("Error SQL: " . $connexio->error);
		}
		$stmt->bind_param("i", $id);
		$stmt->execute();
		$result = $stmt->get_result();
		$actuacio = $result->fetch_assoc();
	}

	// Consulta per obtenir la llista d'illes i municipis
	$sql_illes = "SELECT id, nom FROM Illa";
	$result_illes = $connexio->query($sql_illes);

	$sql_municipis = $id_illa
		? "SELECT id, nom FROM Municipi WHERE illa_id = $id_illa ORDER BY nom"
		: "SELECT id, nom FROM Municipi ORDER BY nom";
	$result_municipis = $connexio->query($sql_municipis);

	$sql_centres = "SELECT id, nom FROM Centres WHERE municipi_id = $id_municipi ORDER BY nom";
	$result_centres = $connexio->query($sql_centres);

	// Obtenir els tipus d'actuació
	$sql = "SELECT id, nom FROM tipus_actuacio";
	$result = $connexio->query($sql);
	$tipus_actuacions = [];
	while ($row = $result->fetch_assoc()) {
		$tipus_actuacions[] = $row;
	}

	// Obtenir els subtipus d'actuació
	$id_subtipus = $actuacio['subtipus_id'];
	$id_tipus = $actuacio['tipus_id'];
	$sql_subtipus = $id_tipus
		? "SELECT id, nom FROM subtipus_actuacio WHERE tipus_id = $id_tipus ORDER BY nom"
		: "SELECT id, nom FROM subtipus_actuacio ORDER BY id";
	$result_subtipus = $connexio->query($sql_subtipus);

	// Consulta per obtenir la llista d'estats
	$sql_estats = "SELECT id, nom FROM estat_actuacio order by ordre";
	$result_estats = $connexio->query($sql_estats);

	// Consulta per obtenir la llista de prioritats
	$sql_prioritats = "SELECT id, nom FROM prioritat_actuacio order by id";
	$result_prioritats = $connexio->query($sql_prioritats);

	// Consulta per obtenir la llista de tècnics
	$sql_tecnics = "SELECT id, nom FROM tecnic order by id";	
	$result_tecnics = $connexio->query($sql_tecnics);	    

		// Consulta per obtenir la llista d'origens d'actuació
	$sql_origen = "SELECT id, nom FROM origen_actuacio order by id";	
	$result_origen = $connexio->query($sql_origen);

	// Consulta per obtenir la llista de destins d'actuació
	$sql_desti = "SELECT id, nom FROM desti_actuacio order by id";	
	$result_desti = $connexio->query($sql_desti);
	
	// Consulta per obtenir la llista de modes d'enviament
	$sql_mode = "SELECT id, nom FROM mode_enviament order by id";	
	$result_mode = $connexio->query($sql_mode);

	// Obtenir la llista de documents i informes relacionats
	$documents = [];
	$informes = [];

	if ($id) {
		// Documents
		$stmt = $connexio->prepare("SELECT id, nom, data, url FROM document_actuacio WHERE actuacio_id = ?");
		$stmt->bind_param("i", $id);
		$stmt->execute();
		$result_documents = $stmt->get_result();
		// Informes
		$stmt = $connexio->prepare("SELECT id, nom, data, url FROM informe_actuacio WHERE actuacio_id = ?");
		$stmt->bind_param("i", $id);
		$stmt->execute();
		$result_informes = $stmt->get_result();
		// Seguiment
		$stmt = $connexio->prepare("SELECT id, data, url, accio FROM seguiment_actuacio WHERE actuacio_id = ?");
		$stmt->bind_param("i", $id);
		$stmt->execute();
		$result_seguiment = $stmt->get_result();
	}

	$nomCentre = $actuacio['nom_centre']."-".$actuacio['Localitat'];
	$assumitServei = $actuacio['assumit_servei'];
	$centreId = $actuacio['centre_id'];
	if ($origen != null)
		$tornar = "../centre/centreForm.php?id=$centreId";

	else
		$tornar = "actuacioListFiltro.php";		

?>

<html>

<head>

	<title>Fitxa d'actuació a centre educatiu</title>

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
					url: 'getMunicipis.php',
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

			$('#municipi').change(function() {
				var municipiID = $(this).val();
				console.log("Municipi seleccionat:", municipiID);
				$.ajax({
					type: 'POST',
					url: 'getCentres.php',
					data: {
						municipi: municipiID
					},
					success: function(response) {
						$('#centre').html(response);
					},
					error: function(xhr, status, error) {
						console.error("Error en AJAX:", error);
					}
				});
			});
		});

		$(document).ready(function() {
			$("#tipus_actuacio").change(function() {
				var tipusId = $(this).val();
				if (tipusId) {
					$.ajax({
						url: "getSubtipus.php",
						type: "POST",
						data: {
							tipus_id: tipusId
						},
						success: function(data) {
							$("#subtipus_actuacio").html(data);
							$("#subtipus_actuacio").prop("disabled", false);
							
							// Selecciona el subtipus correcte
							var subtipusId = '<?php echo $actuacio["subtipus_id"]?>';
							if (subtipusId != '') {
								$("#subtipus_actuacio").val(subtipusId);
							}							
						}
					});
				} else {
					$("#subtipus_actuacio").html('<option value="">Selecciona un subtipus</option>');
					$("#subtipus_actuacio").prop("disabled", true);
				}
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
			<p class="posicionTituloFicha">FITXA D'ACTUACIÓ A CENTRE EDUCATIU</p>
		</li>
	</ul>
	<div class="espacioMarron">&nbsp;</div>
	<div id="fichaEditable" style="background-color:#ffffff;">
		<div class="cabeceraFicha"></div>
			<form name="entidad" method="post" action="actuacioInsertUpdate.php">
				<div class="contenedorFicha">
					<div class="tituloSeccion">
						<p class="textoTituloSeccion">Dades generals</p>
					</div>
					<input type="hidden" name="id" value="<?php echo $id ?>">
					<input type="hidden" name="origen" value="<?php echo $origen ?>">
					<input type="hidden" name="centre_id" value="<?php echo $centreId ?>">
					<table>
						<tr>
							<td>
								<!-- Codi d'actuació -->
								<label for="codi" class="campoFicha_Blanca">Codi d'actuació:</label>
								<input type="text" id="codi" name="codi" class="formularioFicha" value="<?= $actuacio['codi'] ?>" disabled ><br><br>
							</td>						
							<td>
								<!-- Origen actuació -->
								<label for="origen_id" class="campoFicha_Blanca">Origen:</label>
								<select id="origen_id" name="origen_id" class="campoFicha_Blanca">
									<option value="">Selecciona un origen</option>
									<?php while ($row = $result_origen->fetch_assoc()): ?>
										<option value="<?= $row['id'] ?>" <?= $row['id'] == $actuacio['origen_id'] ? 'selected' : '' ?>>
											<?= htmlspecialchars($row['nom']) ?>
										</option>
									<?php endwhile; ?>
								</select>
							</td>
							<td>
								<!-- Codi extern -->
								<label for="codi_extern" class="campoFicha_Blanca">Codi extern:</label>
								<input type="text" id="codi_extern" name="codi_extern" class="formularioFicha" value="<?= $actuacio['codi_extern'] ?>"><br><br>
							</td>
							<td>
								<!-- Data d'entrada -->
								<label for="data_entrada" class="campoFicha_Blanca">Data d'entrada:</label>
								<input type="date" id="data_entrada" name="data_entrada" class="formularioFicha" value="<?= date('Y-m-d', strtotime($actuacio['data_entrada'])) ?>"><br><br>
							</td>
						</tr>
						<tr>
							<td>
								<!-- Illa -->
								<label class="campoFicha_Blanca">Illa:</label>
								<?php if ($id): ?>
									<input type="text" name="illa" value="<?= $actuacio['nom_illa'] ?>" readonly>
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
								<!-- Municipi -->
								<label class="campoFicha_Blanca">Municipi:</label>
								<?php if ($id): ?>
									<input type="text" name="municipi" value="<?= $actuacio['nom_municipi'] ?>" readonly>
								<?php else: ?>
									<select id="municipi" name="municipi" class="campoFicha_Blanca" required>
										<option value="">Selecciona un municipi</option>
									</select>
								<?php endif; ?>
							</td>
							<td>
								<!-- Centre -->
								<label class="campoFicha_Blanca">Centre:</label>
								<?php if ($id): ?>
									<input type="text" name="centre" value="<?= $nomCentre ?>" readonly>
									<input type="hidden" id="centre_id" name="centre_id" value="<?= $centreId ?>">
								<?php else: ?>
									<select id="centre" name="centre" class="campoFicha_Blanca" onchange="actualitzaCentreId()" required>
										<option value="">Selecciona un centre</option>
									</select>
									<input type="hidden" id="centre_id" name="centre_id" value="">
								<?php endif; ?>								
								<button type="button" onclick="obrirCentre()">Veure centre</button>
							</td>
						</tr>
						<tr>
							<td>
								<!-- Tipus d'actuació -->
								<label class="campoFicha_Blanca">Tipus d'actuació:</label>
								<select id="tipus_actuacio" name="tipus_actuacio" class="campoFicha_Blanca" required>
									<option value="">Selecciona un tipus</option>
									<?php foreach ($tipus_actuacions as $tipus): ?>
										<option value="<?= $tipus['id'] ?>" <?= $tipus['id'] == $actuacio['tipus_id']? 'selected': ''?>>
											<?= htmlspecialchars($tipus['nom']) ?></option>
									<?php endforeach; ?>
								</select>
							</td>
							<td>
								<!-- Subtipus d'actuació -->
								<label for="subtipus_actuacio" class="campoFicha_Blanca">Subtipus d'Actuació:</label>
								<?php if ($id_subtipus): ?>
									<select name="subtipus_actuacio" id="subtipus_actuacio" class="campoFicha_Blanca" required>
										<option value="">Selecciona un subtipus</option>
										<?php while ($row = $result_subtipus->fetch_assoc()): ?>
											<option value="<?= $row['id'] ?>" <?= $row['id'] == $id_subtipus ? 'selected' : '' ?>>
												<?= htmlspecialchars($row['nom']) ?>
											</option>
										<?php endwhile; ?>
									</select>
								<?php else: ?>
									<select id="subtipus_actuacio" name="subtipus_actuacio" class="campoFicha_Blanca" disabled>
										<option value="">Selecciona un subtipus</option>
									</select>
								<?php endif; ?>							
							</td>
							<td>
								<!-- Prioritat -->
								<label for="prioritat" class="campoFicha_Blanca">Prioritat:</label>
								<select id="prioritat" name="prioritat" class="campoFicha_Blanca">
									<?php while ($row = $result_prioritats->fetch_assoc()): ?>
										<option value="<?= $row['id'] ?>" <?= $row['id'] == $actuacio['prioritat_id'] ? 'selected' : '' ?>>
											<?= htmlspecialchars($row['nom']) ?>
										</option>
									<?php endwhile; ?>
								</select>
							</td>	
						</tr>
						<tr>
							<td colspan="3">
								<!-- Descripció -->
								<label for="descripcio" class="campoFicha_Blanca">Descripció:</label>
								<input type="text" id="descripcio" name="descripcio" class="formularioFicha" size="150" value="<?= $actuacio['descripcio'] ?>"><br><br>
							</td>
						</tr>
						<tr>
							<td>
								<!-- Pressupost -->
								<label for="pressupost" class="campoFicha_Blanca">Pressupost en euros (IVA inclòs):</label>
								<input type="text" id="pressupost" name="pressupost" class="formularioFicha" value="<?= $actuacio['pressupost'] ?>"><br><br>
							</td>
							<td>
								<label label for="assumit_servei" class="campoFicha_Blanca"></label>
								<input type="checkbox" id="assumit_servei" name="assumit_servei" class="formularioFicha" <?php echo $assumitServei == "S"? "checked" : ""?>>
								<label label class="campoFicha_Blanca">Assumit pel servei</label>								
							</td>

						</tr>
						<tr>
							<td>
								<!-- Estat -->
								<label for="estat" class="campoFicha_Blanca">Estat:</label>
								<select id="estat" name="estat" class="campoFicha_Blanca">
									<?php while ($row = $result_estats->fetch_assoc()): ?>
										<option value="<?= $row['id'] ?>" <?= $row['id'] == $actuacio['estat_id'] ? 'selected' : '' ?>>
											<?= htmlspecialchars($row['nom']) ?>
										</option>
									<?php endwhile; ?>
								</select>
							</td>
							<td>
								<!-- Mode d'enviament -->
								<label for="mode" class="campoFicha_Blanca">Mode d'enviament:</label>
								<select id="mode" name="mode" class="campoFicha_Blanca">
									<option value="">Selecciona un mode</option>
									<?php while ($row = $result_mode->fetch_assoc()): ?>
										<option value="<?= $row['id'] ?>" <?= $row['id'] == $actuacio['mode_enviament_id'] ? 'selected' : '' ?>>
											<?= htmlspecialchars($row['nom']) ?>
										</option>
									<?php endwhile; ?>
								</select>
							</td>							
							<td>
								<!-- Data d'enviament -->
								<label for="data_enviament" class="campoFicha_Blanca">Data d'enviament:</label>
								<input type="date" id="data_enviament" name="data_enviament" class="formularioFicha" value="<?= !empty($actuacio['data_enviament']) ? date('Y-m-d', strtotime($actuacio['data_enviament'])) : '' ?>">
								<br><br>
							</td>														
						</tr>	
						<tr>
							<td>
								<label for="desti" class="campoFicha_Blanca">Destí:</label>
								<select id= "desti" name="desti" class="campoFicha_Blanca">
									<option value="">Selecciona un destí</option>
									<?php while ($row = $result_desti->fetch_assoc()):?>
										<option value="<?= $row['id']?>" <?= $row['id'] ==  $actuacio['desti_id'] ? 'selected': ''?>>
											<?= htmlspecialchars($row['nom'])?>
										</option>
									<?php endwhile;?>
								</select> 
							</td>
							<td>
								<label for="tecnic" class="campoFicha_Blanca">Tècnic:</label>
								<select id= "tecnic" name="tecnic" class="campoFicha_Blanca">
									<option value="">Sense assignar</option>
									<?php while ($row = $result_tecnics->fetch_assoc()):?>
										<option value="<?= $row['id']?>" <?= $row['id'] ==  $actuacio['tecnic_id'] ? 'selected': ''?>>
											<?= htmlspecialchars($row['nom'])?>
										</option>
									<?php endwhile;?>
								</select> 
							</td>
						</tr>	
						<tr>
							<td>
								<label for="url_ibisec" class="campoFicha_Blanca">URL IBISEC:</label>
								<input type="text" id="url_ibisec" name="url_ibisec" class="formularioFicha" value="<?= $actuacio['url_ibisec'] ?>"><br><br>
							</td>
							<td>
							<?php if ($actuacio['url_ibisec']): ?>							
							  <a href="#" 
								 onclick="event.preventDefault(); event.stopPropagation(); window.open(document.getElementById('url_ibisec').value, '_blank')">
								 Obrir enllaç
							  </a>
							</td>
							<?php endif; ?>
						</tr>						
						<tr>
							<td colspan="5">
								<label for="observacions" class="campoFicha_Blanca" style="align-self:start; display:grid">Observacions:</label>
								<textarea name="observacions" id="observacions" class="contenedorFicha_Blanca" rows="12" cols="100"><?= $actuacio['observacions'] ?></textarea>
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
							<input type="button" class="boton" value="Nou document" onclick="location.href='documentActuacioForm.php?id_actuacio=<?php echo $id ?>';">
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
										echo "<tr onclick=\"window.location.href='documentActuacioForm.php?id_document=". $row["id"]. "&id_actuacio=". $id."'\">";
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
									echo "<tr class='campoListado'><td colspan='3'>No s'han trobat resultats.</td></tr>";
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
						<li class="tituloListado">LLISTAT D'INFORMES TÈCNICS</li>
						<li class="fondoBotoneraListado">
							<input type="button" class="boton" value="Nou informe" onclick="location.href='informeActuacioForm.php?id_actuacio=<?php echo $id ?>';">
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
								if ($result_informes && $result_informes->num_rows > 0) {
									while ($row = $result_informes->fetch_assoc()) {
										echo "<tr onclick=\"window.location.href='informeActuacioForm.php?id_informe=". $row["id"]. "&id_actuacio=". $id."'\">";
										echo "<td class='campoListadoInicial'>". date('Y-m-d', strtotime($row["data"])). "</td>";
										echo "<td class='campoListado'>". $row["nom"]. "</td>";
										echo "<td class='campoListado'>";
										if (!empty($row['url'])) {
											echo "<a href='" . htmlspecialchars($row['url']) . "' onclick=\"event.preventDefault(); event.stopPropagation(); window.open(this.href, '_blank');\">Veure Document</a>";
										}
										echo "</td>";										
										echo "</a></tr>";
									}
								} else {
									// Si no hi ha resultats, mostra un missatge
									echo "<tr class='campoListado'><td colspan='3'>No s'han trobat resultats.</td></tr>";
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
						<li class="tituloListado">SEGUIMENT DE L'ACTUACIÓ</li>
						<li class="fondoBotoneraListado">
							<input type="button" class="boton" value="Nova acció" onclick="location.href='seguimentActuacioForm.php?id_actuacio=<?php echo $id ?>';">
						</li>
					</ul>

					<div class="espacioMarronClaro"></div>

					<div id="cuerpo" class="scroll_total">
						<table class="listado" cellpadding="0" cellspacing="0" width="100%">
							<thead>
								<tr>
									<th class="campoCabeceraListadoInicial">Data</th>
									<th class="campoCabeceraListado">Acció</th>
									<th class="campoCabeceraListado">URL</th>
								</tr>
							</thead>
							<tbody>
								<?php
                                // Recorre els resultats i mostra cada document en una fila
                                if ($result_seguiment && $result_seguiment->num_rows > 0) {
                                    while ($row = $result_seguiment->fetch_assoc()) {
                                        echo "<tr onclick=\"window.location.href='seguimentActuacioForm.php?id_seguiment=" . $row["id"] . "&id_actuacio=" . $id . "'\">";
                                        echo "<td class='campoListadoInicial'>" . date('Y-m-d', strtotime($row["data"])) . "</td>";
                                        echo "<td class='campoListado'>" . $row["accio"] . "</td>";
                                        echo "<td class='campoListado'>";
                                        if (!empty($row['url'])) {
                                            echo "<a href='" . htmlspecialchars($row['url']) . "' onclick=\"event.preventDefault(); event.stopPropagation(); window.open(this.href, '_blank');\">Veure Document</a>";
                                        }
                                        echo "</td>";
                                        echo "</a></tr>";
                                    }
                                } else {
                                    // Si no hi ha resultats, mostra un missatge
                                    echo "<tr class='campoListado'><td colspan='3'>No s'han trobat resultats.</td></tr>";
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
		</form>
	</div>	
	<!-- Formulario para eliminar -->
	<form method="post" action="actuacioDelete.php">
		<li class="fondoBotoneraFicha">
			<input type="hidden" name="id" value="<?php echo $id ?>">
			<button type="submit" class="boton" onclick="return confirm('Estàs segur de borrar aquesta actuació?');">Eliminar</button>
		</li>
	</form>

	<li class="volverFicha">
		<input type="button" class="boton" value="Tornar al llistat" onclick="window.location.href='<?php echo $tornar ?>'">
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