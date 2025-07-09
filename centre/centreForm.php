<!DOCTYPE html>
<?php
	include '../connectarBD.php';
	
	// Recupera el id de la solicitud GET
	$id = isset($_GET['id']) ? $_GET['id'] : null;
	$id_illa = isset($_GET['id_illa']) ? $_GET['id_illa'] : null;

	// Datos del centro (inicialmente en blanco)
	$codi = "";
	$sigla = "";
	$centre = "";
	$adreca = "";
	$cp = "";
	$localitat = "";
	$id_municipi = "";
	$telefon = "";
	$fax = "";
	$email = "";

	// Si s'ha proporcionat un id, recupera les dades del centre
	if ($id) {
		$sql = "SELECT * FROM centres WHERE id = $id";
		$result = $connexio->query($sql);

		if ($result->num_rows > 0) {
			$row = $result->fetch_assoc();
			// Asigna los valores de la consulta a las variables
			$codi = $row['Codi'];
			$sigla = $row['Sigla'];
			$centre = $row['Centre'];
			$adreca = $row['Adreca'];
			$cp = $row['CP'];
			$localitat = $row['Localitat'];
			$id_municipi = $row['id_municipi'];
			$id_illa = $row['id_illa'];
			$telefon = $row['Telefon'];
			$fax = $row['Fax'];
			$email = $row['email'];
		}
		$sql_actuacions = "SELECT
					a.id,
					a.codi,
					a.descripcio,
					a.pressupost,
					a.observacions,
					a.estat_id, 
					a.prioritat_id,
					a.subtipus_id,
					a.data_entrada,
					a.tecnic_id,
					c.id_illa,
					c.id_municipi,
					a.centre_id,
					s.tipus_id,
					e.color,
					i.nom AS nom_illa,
					m.nom AS nom_municipi,
					c.Centre AS nom_centre,
					e.nom AS nom_estat,
					p.nom AS nom_prioritat,
					s.nom AS nom_subtipus,
					t.nom AS nom_tipus,
					tc.nom AS nom_tecnic

				FROM actuacions a
					JOIN subtipus_actuacio s ON a.subtipus_id = s.id
					JOIN tipus_actuacio t ON s.tipus_id = t.id
					JOIN centres c ON a.centre_id = c.id
					JOIN illa i ON c.id_illa = i.id
					JOIN municipi m ON c.id_municipi = m.id
					JOIN estat_actuacio e ON a.estat_id = e.id
					JOIN prioritat_actuacio p ON a.prioritat_id = p.id
					LEFT JOIN tecnic tc ON a.tecnic_id = tc.id
				WHERE a.centre_id = $id     
				ORDER BY CAST(SUBSTRING_INDEX(a.codi, '-', -1) AS UNSIGNED)
				";

		$result_actuacions = $connexio->query($sql_actuacions);

		if (!$result_actuacions) {
			die("S'ha produit un error al consultar les actuacions: " . $connexio->error);
		}
	}

	// Consulta per obtenir la llista d'illes, municipis i localitats
	$sql_illes = "SELECT id, nom FROM Illa";
	$result_illes = $connexio->query($sql_illes);

	$sql_municipis = $id_illa
		? "SELECT id, nom FROM Municipi WHERE illa_id = $id_illa ORDER BY nom"
		: "SELECT id, nom FROM Municipi ORDER BY nom";
	$result_municipis = $connexio->query($sql_municipis);
	
    // Consulta para obtener las siglas y nombres de la tabla "tipus_centre_educatiu "
    $sql_siglas = "SELECT Sigla, nom FROM tipus_centre_educatiu ";
    $result_siglas = $connexio->query($sql_siglas);

    $siglas_lista = [];
    if ($result_siglas->num_rows > 0) {
        while ($row = $result_siglas->fetch_assoc()) {
            $siglas_lista[] = $row;
        }
    }

	
?>	


<html>
	<head>

		<title>Fitxa de centre educatiu</title>

		<link rel="stylesheet" href="../css/estilos.css" type="text/css" />
		<link rel="stylesheet" href="../css/estilos_ficha_2.css" type="text/css" />

		<script src="../js/utiles.js" language="javascript"></script>
		<script src="../js/especificas.js" language="javascript"></script>
		<script>
            function mostrarNombre(select) {
                var selectedOption = select.options[select.selectedIndex];
                // Use el atributo data-nombre para obtener el nombre correspondiente a la sigla
                var nombre = selectedOption.getAttribute('data-nombre');
                document.getElementById("nombreSigla").textContent = nombre;
				
				// Se actualiza el valor del hidden input con la Sigla seleccionada
				document.getElementById("sigla").value = selectedOption.value;
            }
        </script>		
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
		<form name="entidad" method="post" action="centreInsertUpdate.php">
			<div class="contenedorFicha">
				<div class="tituloSeccion"><p class="textoTituloSeccion">Datos generales</p></div>
				<div class="contenidoSeccion">
					<div class="fila">						
							<input type="hidden" name="id" value="<?php echo $id ?>">

							<label for="codi" class="campoFicha_Blanca">Codi:</label>
							<input type="text" id="codi" name="codi" class="formularioFicha" value="<?php echo $codi; ?>" required><br><br>

							<label for="sigla" class="campoFicha_Blanca">Sigla:</label>
							<select id="sigla" name="sigla" class="formularioFicha" onchange="mostrarNombre(this)" required>
                            <option value="">Seleccione una sigla</option>
                            <?php foreach ($siglas_lista as $sigla_item): ?>
								<option value="<?php echo $sigla_item['Sigla'];?>" 
										<?php echo ($sigla == $sigla_item['Sigla'])? 'selected': '';?>
										data-nombre="<?php echo $sigla_item['nom'];?>"> 
									<?php echo $sigla_item['Sigla'];?>
								</option>
                            <?php endforeach; ?>
							</select>
							<span id="nombreSigla" class="formularioFicha"><?php 
								if ($sigla) {
									foreach ($siglas_lista as $sigla_item) {
										if ($sigla_item['Sigla'] == $sigla) {
											echo $sigla_item['nom'];
											break;
										}
									}
								}
							?></span><br><br>

							<label for="centre" class="campoFicha_Blanca">Centre:</label>
							<input type="text" id="centre" name="centre" class="formularioFicha" size="30" value="<?php echo $centre; ?>" required><br><br>
							
							<label for="adreca" class="campoFicha_Blanca">Adreça:</label>
							<input type="text" id="adreca" name="adreca" class="formularioFicha" size="30" value="<?php echo $adreca; ?>" required><br><br>

							<label for="cp" class="campoFicha_Blanca">Codi Postal:</label>
							<input type="text" id="cp" name="cp" class="formularioFicha" value="<?php echo $cp; ?>" required><br><br>
								<label for="id_illa" class="campoFicha_Blanca">Illa:</label>
								<select id="id_illa" name="id_illa" class="formularioFicha" required>
									<option value="">Selecciona una illa</option>
									<?php while ($row = $result_illes->fetch_assoc()) : ?>
										<option value="<?php echo $row['id']; ?>" <?php echo ($row['id'] == $id_illa) ? 'selected' : ''; ?>>
											<?php echo $row['nom']; ?>
										</option>
									<?php endwhile; ?>
								</select><br><br>

								<label for="id_municipi" class="campoFicha_Blanca">Municipi:</label>
								<select id="id_municipi" name="id_municipi" class="formularioFicha" required>
									<option value="">Selecciona un municipi</option>
									<?php while ($row = $result_municipis->fetch_assoc()) : ?>
										<option value="<?php echo $row['id']; ?>" <?php echo ($row['id'] == $id_municipi) ? 'selected' : ''; ?>>
											<?php echo $row['nom']; ?>
										</option>
									<?php endwhile; ?>
								</select><br><br>

							<label for="localitat" class="campoFicha_Blanca">Localitat:</label>
							<input type="text" id="localitat" name="localitat" class="formularioFicha" size="30" value="<?php echo $localitat; ?>" required><br><br>

							<label for="telefon" class="campoFicha_Blanca">Telèfon:</label>
							<input type="text" id="telefon" name="telefon" class="formularioFicha" value="<?php echo $telefon; ?>" required><br><br>

							<label for="fax" class="campoFicha_Blanca">Fax:</label>
							<input type="text" id="fax" name="fax" class="formularioFicha" value="<?php echo $fax; ?>"><br><br>

							<label for="email" class="campoFicha_Blanca">Email:</label>
							<input type="email" id="email" name="email" class="formularioFicha" size="30" value="<?php echo $email; ?>" required><br><br>
							<div class="espacioMarronClaro"></div>
					</div>
				</div>
			</div>				
		</div>
	<?php if ($id) { ?>
    <ul class="botoneraListado">
        <li class="tituloListado">LLISTAT D'ACTUACIONS</li>
        <!--<li class="fondoBotoneraListado">
            <input type="button" class="boton" value="Nova actuació" onclick="location.href='../actuacio/actuacioForm.php?origen=centre';">
        </li>-->
    </ul>
    <div id="cuerpo" class="scroll_total">
        <table class="listado" cellpadding="0" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th class="campoCabeceraListadoInicial">Codi Actuació</th>
                    <th class="campoCabeceraListado">Centre</th>
                    <th class="campoCabeceraListado">Data entrada</th>
                    <th class="campoCabeceraListado">Prioritat</th>
                    <th class="campoCabeceraListado">Estat</th>
                    <th class="campoCabeceraListado">Tipus</th>
                    <th class="campoCabeceraListado">Subtipus</th>
                    <th class="campoCabeceraListado">Descripció</th>
                    <th class="campoCabeceraListado">Tècnic</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // Recorre els resultats i mostra cada centre en una fila
                $total = 0;
                if ($result_actuacions->num_rows > 0) {
                    while ($row = $result_actuacions->fetch_assoc()) {
                        $color = $row["color"];
                        echo "<tr style='background-color: " . $color . "' onclick=\"window.location.href='../actuacio/actuacioForm.php?origen=centre&id=" . $row["id"] . "'\">";
                        echo "<td class='campoListadoInicial'>" . $row["codi"] . "</td>";
                        echo "<td class='campoListado'>" . $row["nom_centre"] . "</td>";
                        echo "<td class='campoListado'>" . $row["data_entrada"] . "</td>";
                        echo "<td class='campoListado'>" . $row["nom_prioritat"] . "</td>";
                        echo "<td class='campoListado'>" . $row["nom_estat"] . "</td>";
                        echo "<td class='campoListado'>" . $row["nom_tipus"] . "</td>";
                        echo "<td class='campoListado'>" . $row["nom_subtipus"] . "</td>";
                        echo "<td class='campoListado'>" . $row["descripcio"] . "</td>";
                        echo "<td class='campoListado'>" . $row["nom_tecnic"] . "</td>";
                        echo "</a></tr>";
                        $total++;
                    }
                } else {
                    // Si no hi ha resultats, mostra un missatge
                    echo "<tr><td colspan='6' class='campoListado'>No s'han trobat resultats.</td></tr>";
                }
                echo "<tr><td colspan='6' class='campoListado'>Total actuacions: " . $total;
                ?>
            </tbody>
        </table>
    </div>
		<?php } ?>
		<li class="fondoBotoneraFicha">
			<input type="submit" class="boton" value="Desar canvis">
		</li>		
		</form>
		<!-- Formulario para eliminar -->
		<form method="post" action="centreDelete.php">
			<li class="fondoBotoneraFicha">
				<input type="hidden" name="id" value="<?php echo $id ?>">
				<button type="submit" class="boton" onclick="return confirm('Estàs segur de borrar aquest centre?');">Eliminar</button>
			</li>
		</form>	
		<!-- Botó Assignar 
		<li class="fondoBotoneraFicha">
			<button type="button" class="boton" onclick="location.href='espaiCentreList.php?id_centre=<?= htmlspecialchars($id) ?>&nom_centre=<?= htmlspecialchars($centre) ?>'">
				Assignar Espais
			</button>	
		</li>
		 Botó Actuacions
		<li class="fondoBotoneraFicha">
			<button type="button" class="boton" onclick="location.href='../actuacio/actuacioListFiltro.php?id_centre=<?= htmlspecialchars($id) ?>&nom_centre=<?= htmlspecialchars($centre) ?>'">
				Actuacions
			</button>	
		</li>		-->
		<li class="volverFicha">
			<input type="button" class="boton" value="Tornar al llistat" onclick="window.location.href='centreListFiltro.php?id=<?php echo $id ?>';">
		</li>			
	</div>
	<br />
	
</body>


</html>