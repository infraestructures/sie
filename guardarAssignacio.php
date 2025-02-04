<?php
	include 'connectarBD.php';

	// Recoge los datos del formulario
	$id_centre = $_POST['id_centre'];
	$id_espai = $_POST['id_espai'];
	$num_unitats = $_POST['num_unitats'];
	$num_alumnes_infantil = $_POST['num_alumnes_infantil'];
	$num_alumnes_primaria = $_POST['num_alumnes_primaria'];
	$num_alumnes_eso = $_POST['num_alumnes_eso'];
	$num_alumnes_batx = $_POST['num_alumnes_batx'];
	$num_alumnes_fp = $_POST['num_alumnes_fp'];
	$preu_metre_construit = $_POST['preu_metre_construit'];

	// Inserta los datos en la tabla assignar_espais
	$sql = "INSERT INTO assignar_espais 
			(id_centre, id_espai, num_unitats, num_alumnes_infantil, num_alumnes_primaria, num_alumnes_eso, num_alumnes_batx, num_alumnes_fp, preu_metre_construit)
			VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

	$stmt = $connexio->prepare($sql);
	$stmt->bind_param("iiiiiiiid", $id_centre, $id_espai, $num_unitats, $num_alumnes_infantil, $num_alumnes_primaria, $num_alumnes_eso, $num_alumnes_batx, $num_alumnes_fp, $preu_metre_construit);

	if ($stmt->execute()) {
		echo "Assignació registrada correctament.";
	} else {
		echo "Error en registrar l'assignació: " . $stmt->error;
	}

	$stmt->close();
	$connexio->close();
?>
