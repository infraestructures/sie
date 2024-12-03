<!DOCTYPE html>
<?php
// Connexió a la base de dades
$host = "localhost";
$user = "root";
$password = "";
$dbname = "sie";

$connexio = new mysqli($host, $user, $password, $dbname);

// Comprovar la connexió
if ($connexio->connect_error) {
    die("Error de connexió: " . $connexio->connect_error);
}

$connexio->set_charset("utf8mb4");

// Consulta para obtener los registros de la tabla espai
$sql = "SELECT codi, nom, metres_per_unitat FROM espai";
$resultat = $connexio->query($sql);

?>

<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Llistat de Espais</title>

	<link rel="stylesheet" href="css/estilos.css" type="text/css" />

	<script src="js/utiles.js" type="" language="JavaScript"></script>
	<script src="js/especificas.js" type="" language="JavaScript"></script>

</head>

<body class="contenido" onload="ocultarFondoPrincipal();">
<form name="entidad">
<ul class="botoneraListado" style="margin-top: 20px">
	<li class="tituloListado">LLISTAT D'ESPAIS</li>
	<li class="fondoBotoneraListado">
		<input type="button" class="boton" value="Insertar Espai" onclick="location.href='espaiForm.php';">
		<input type="button" class="boton" value="Assignar Espai" onclick="location.href='assignarEspai.php';">
    </li> 
</ul>

<div class="espacioMarronClaro"></div>

<div id="cuerpo" class="scroll_total">
<table class="listado" cellpadding="0" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th class="campoCabeceraListadoInicial">Codi</th>
			<th class="campoCabeceraListado">Nom espai</th>
			<th class="campoCabeceraListado">Metres per unitat</th>
		</tr>
	</thead>
	<tbody>
	<?php
            // Verifica si hi ha resultats
            if ($resultat->num_rows > 0) {
                // Recorre cada registre i mostra-ho a la taula
                while ($fila = $resultat->fetch_assoc()) {
					echo "<tr onclick=\"window.location.href='espaiForm.php?codi=" . $fila["codi"] . "'\">";                     
                    echo "<td class='campoListadoInicial'>" . $fila["codi"] . "</td>";
                    echo "<td class='campoListado'>" . $fila["nom"] . "</td>";
                    echo "<td class='campoListado'>" . $fila["metres_per_unitat"] . "</td>";
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
</form>
</body>
</html>
<?php
// Tancar la connexió
$connexio->close();
?>

