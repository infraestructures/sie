<?php
	// Configuració de la base de dades
	$servidor = "localhost";
	$usuari = "root";
	$contrasenya = "";
	$base_dades = "sie";

	// Crear connexió
	$connexio = new mysqli($servidor, $usuari, $contrasenya, $base_dades);

	// Comprovar connexió
	if ($connexio->connect_error) {
		die("Error connectant amb la BD: " . $connexio->connect_error);
	}

	// Establir codificació de caràcters
	$connexio->set_charset("utf8mb4");
?>
