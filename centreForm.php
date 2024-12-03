<!DOCTYPE html>
<?php
	// Connexió a la base de dades
	$host = "localhost";
	$user = "root";
	$password = "";
	$dbname = "sie";

	$conn = new mysqli($host, $user, $password, $dbname);

	// Comprovar la connexió
	if ($conn->connect_error) {
		die("Error de connexió " . $conn->connect_error);
	}

	$conn->set_charset("utf8mb4");
	
	// Recupera el id de la solicitud GET
	$id = isset($_GET['id']) ? $_GET['id'] : null;

	// Datos del centro (inicialmente en blanco)
	$codi = "";
	$sigla = "";
	$centre = "";
	$adreca = "";
	$cp = "";
	$localitat = "";
	$id_municipi = "";
	$id_illa = "";
	$telefon = "";
	$fax = "";
	$email = "";

	// Si s'ha proporcionat un id, recupera les dades del centre
	if ($id) {
		$sql = "SELECT * FROM centres WHERE id = $id";
		$result = $conn->query($sql);

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
	}

	// Consulta per obtenir la llista d'illes, municipis i localitats
	$sql_illes = "SELECT id, nom FROM Illa";
	$result_illes = $conn->query($sql_illes);

	$sql_municipis = "SELECT id, nom FROM Municipi";
	$result_municipis = $conn->query($sql_municipis);

	$sql_localitats = "SELECT id, nom FROM Localitat";
	$result_localitats = $conn->query($sql_localitats);

    // Consulta para obtener las siglas y nombres de la tabla "tipus_centre_educatiu "
    $sql_siglas = "SELECT Sigla, nom FROM tipus_centre_educatiu ";
    $result_siglas = $conn->query($sql_siglas);

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
                                <option value="<?php echo $sigla_item['Siglas']; ?>" <?php echo ($sigla == $sigla_item['Sigla']) ? 'selected' : ''; ?>>
                                    <?php echo $sigla_item['Sigla']; ?>
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
		<form method="post" action="centreDelete.php">
			<input type="hidden" name="id" value="<?php echo $id ?>">
			<button type="submit" class="boton" onclick="return confirm('¿Estás seguro de eliminar este centro?');">Eliminar</button>
		</form>		
	</body>
</html>