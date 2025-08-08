<!DOCTYPE html>
<?php
	include '../connectarBD.php';

	// Recupera els valors
	$id_conveni = $_GET['id_conveni'] ?? null;
	$id_centre	= $_GET['id_centre'] ?? null;
	$id_municipi = $_GET['id_municipi'] ?? null;
	$nom_municipi = $_GET['nom_municipi'] ?? null;
	$codi_conveni = $_GET['codi_conveni'] ?? null;

	$centre_conveni = [
		'id_centre' => '',
		'id_conveni' => '',
		'codi_conveni' => '',
		'codi_centre' => '',
		'pressupost' => '',
		'observacions' => '',
		'nom_municipi' => '',
		'nom_centre' => '',
		'ajuntament_id' => ''
	];

	$operacio = "insertar";
	if ($id_centre) {
		$operacio = "modificar";
		$sql = "SELECT
			cc.id_centre,
			cc.id_conveni,	
			cc.pressupost,
			cc.observacions,
			co.codi AS codi_conveni,
			ce.Codi AS codi_centre,
			ce.Centre AS nom_centre,
			m.nom AS nom_municipi
		FROM centre_conveni cc
			JOIN centres ce ON cc.id_centre = ce.id
			JOIN conveni co ON cc.id_conveni = co.id
			JOIN municipi m ON ce.id_municipi = m.id	
		WHERE 
			cc.id_conveni = ? AND
			cc.id_centre = ?;";

		$stmt = $connexio->prepare($sql);

		if (!$stmt) {
			die("Error SQL: " . $connexio->error);
		}
		$stmt->bind_param("ii", $id_conveni, $id_centre);
		$stmt->execute();
		$result = $stmt->get_result();
		$centre_conveni = $result->fetch_assoc();
		$nom_municipi  = $centre_conveni["nom_municipi"];
		$nom_centre = $centre_conveni["nom_centre"];
		$codi_conveni = $centre_conveni["codi_conveni"];
	}

	$sql_centres = "SELECT id, Centre FROM Centres WHERE id_municipi = $id_municipi ORDER BY Centre";
	$result_centres = $connexio->query($sql_centres);

	// Llista d'actuacions associades al centre
	$sql_actuacions_centres = "SELECT 
						a.id, 
						a.descripcio,
						a.previsio_inici,
						a.previsio_final,
						a.pressupost_inicial,
						a.conveni_id,
						a.centre_id,
						a.pressupost_inicial,
						c.Centre
					FROM actuacio_conveni a
					JOIN centre_conveni cc ON cc.id_centre = a.centre_id AND cc.id_conveni = a.conveni_id
					JOIN centres c ON c.id = cc.id_centre
					WHERE a.conveni_id = $id_conveni
					AND	a.centre_id = $id_centre;";
	$result_actuacions_centres = $connexio->query($sql_actuacions_centres);

?>
<html>

<head>

	<title>Fitxa de centre</title>

	<link rel="stylesheet" href="../css/estilos.css" type="text/css" />
	<link rel="stylesheet" href="../css/estilos_ficha_2.css" type="text/css" />

	<script src="../js/utiles.js" language="javascript"></script>
	<script src="../js/especificas.js" language="javascript"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body class="contenido" onload="ocultarFondoPrincipal();">
	<!-- Formulario para insertar o actualizar -->
	<div class="contenedorFiltro"></div>
	<ul class="botoneraFicha">
		<li class="tituloFicha">
			<p class="posicionTituloFicha">FITXA DE CENTRE</p>
		</li>
	</ul>
	<div class="espacioMarron">&nbsp;</div>
	<form name="entidad" method="post" action="centreConveniInsertUpdate.php">
	<div id="fichaEditable" style="background-color:#ffffff;">
		<div class="cabeceraFicha"></div>
			<div class="contenedorFicha">
				<div class="tituloSeccion">
					<p class="textoTituloSeccion">Dades generals</p>
				</div>
				<input type="hidden" name="id_conveni" value="<?php echo $id_conveni ?>">
				<input type="hidden" name="operacio" value="<?php echo $operacio ?>">
				<table>
					<tr>
						<td>
							<!-- Codi de conveni -->
							<label for="codi" class="campoFicha_Blanca">Codi de conveni:</label>
							<input type="text" id="codi" name="codi" class="formularioFicha" value="<?= $codi_conveni ?>" disabled ><br><br>
						</td>	
						<td>
							<!-- Ajuntament -->
							<label class="campoFicha_Blanca">Ajuntament:</label>
							<input type="text" name="municipi" value="<?= $nom_municipi ?>" readonly>
							<input type="hidden" id="municipi" name="municipi" value="<?= $id_municipi ?>">
						</td>	
					</tr>
					<tr>
						<td>
							<!-- Centre -->
							<label class="campoFicha_Blanca">Centre:</label>
							<?php if ($id_centre): ?>
								<input type="text" name="centre" value="<?= $nom_centre ?>" readonly>
							<?php else: ?>
								<select id="centre" name="centre" class="campoFicha_Blanca" onchange="actualitzaCentreId()" required>
									<option value="">Selecciona un centre</option>
									<?php while ($row = $result_centres->fetch_assoc()): ?>
										<option value="<?= $row['id'] ?>" <?= $row['id'] == $id_centre ? 'selected' : '' ?>>
											<?= htmlspecialchars($row['Centre']) ?>
										</option>
									<?php endwhile; ?>
								</select>
							<?php endif; ?>

							<!-- Solo un input oculto para el JS -->
							<input type="hidden" id="centre_id" name="centre_id" value="<?= $id_centre ?>">

							<button type="button" onclick="obrirCentre()">Veure centre</button>
						</td>	
						<td>
							<!-- Pressupost -->
							<label for="pressupost" class="campoFicha_Blanca">Pressupost en euros (IVA inclòs):</label>
							<input type="text" id="pressupost" name="pressupost" class="formularioFicha" value="<?= $centre_conveni['pressupost'] ?>"><br><br>
						</td>							
					</tr>
					<tr>
						<td colspan="3">
							<label for="observacions" class="campoFicha_Blanca" style="align-self:start; display:grid">Observacions:</label>
							<textarea name="observacions" id="observacions" class="contenedorFicha_Blanca" rows="6" cols="100"><?= $centre_conveni['observacions'] ?></textarea>
						</td>
					</tr>
				</table>
			</div>
			<br><br>
			<?php if ($id_centre): ?>
			<div class="contenedorFicha">
				<ul class="botoneraListado">
					<li class="tituloListado">LLISTAT D'ACTUACIONS</li>
					<li class="fondoBotoneraListado">
						<input type="button" class="boton" value="Nova actuació" onclick="location.href='actuacioConveniForm.php?id_conveni=<?php echo $id_conveni ?>&id_centre=<?php echo $id_centre ?>&nom_centre=<?php echo $nom_centre ?>';">
					</li>
				</ul>

				<div class="espacioMarronClaro"></div>

				<div id="cuerpo" class="scroll_total">
					<table class="listado" cellpadding="0" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="campoCabeceraListadoInicial">Codi de l'actuació</th>
								<th class="campoCabeceraListado">Descripció</th>
								<th class="campoCabeceraListado">Inici execució</th>
								<th class="campoCabeceraListado">Fi execució</th>
								<th class="campoCabeceraListado">Pressupost</th>
							</tr>
						</thead>
						<tbody>
							<?php
							// Recorre els resultats i mostra cada actuacio en una fila
							if ($result_actuacions_centres && $result_actuacions_centres->num_rows > 0) {
								while ($row = $result_actuacions_centres->fetch_assoc()) {
									echo "<tr onclick=\"window.location.href='actuacioConveniForm.php?id=". $row["id"]."&id_conveni=" . $row["conveni_id"] . "&id_centre= ". $row["centre_id"]."&nom_centre=" . $row["Centre"] . "'\">";
									echo "<td class='campoListadoInicial'>". $row["id"]. "</td>";
									echo "<td class='campoListado'>". $row["descripcio"]. "</td>";
									echo "<td class='campoListado'>". $row["previsio_inici"]. "</td>";
                                    echo "<td class='campoListado'>" . $row["previsio_final"] . "</td>";
                                    echo "<td class='campoListado'>" . $row["pressupost_inicial"] . "</td>";
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
	<form method="post" action="centreConveniDelete.php">
	<ul class="botoneraFicha" style="display: flex; justify-content: flex-end;">
		<li class="fondoBotoneraFicha">
			<input type="hidden" name="id_conveni" value="<?php echo $id_conveni ?>">
			<input type="hidden" name="id_centre" value="<?php echo $id_centre ?>">
			<button type="submit" class="boton" onclick="return confirm('Estàs segur de borrar aquest centre?');">Eliminar</button>
		</li>
		<li class="fondoBotoneraFicha">
			<input type="button" class="boton" value="Tornar al conveni" onclick="window.location.href='conveniForm.php?id=<?php echo $id_conveni ?>'">
		</li>
	</ul>
	</form>
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
			if (!select) {
				console.log('⚠️ No hi ha <select> perquè el centre ja està seleccionat.');
				return;
			}
			const centreId = select.value;
			const hidden = document.getElementById('centre_id');
			if (hidden) {
				hidden.value = centreId;
				hidden.setAttribute('value', centreId);
				console.log('✅ centre_id actualitzat:', hidden.value);
			}
		}

		window.addEventListener('DOMContentLoaded', function () {
			const hidden = document.getElementById('centre_id');
			console.log('centre_id trobat?', hidden);
		});
	</script>
</body>
</html>