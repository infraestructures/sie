<?php
	include 'connectarBD.php';

	// Recollir dades del formulari amb variables en camelCase
	$idCentre = $_POST['id_centre'];
	$nomCentre = $_POST['nom_centre'];
	$idEspai = $_POST['id_espai'];
	$operacio = $_POST['operacio'];
	$numUnitats = $_POST['num_unitats'];
	$numAlumnesInfantil = $_POST['num_alumnes_infantil'];
	$numAlumnesPrimaria = $_POST['num_alumnes_primaria'];
	$numAlumnesEso = $_POST['num_alumnes_eso'];
	$numAlumnesBatx = $_POST['num_alumnes_batx'];
	$numAlumnesFp = $_POST['num_alumnes_fp'];
	$preuMetreConstruït = $_POST['preu_metre_construit'];

	if ($operacio == 'update') {
		// Actualitzar
		echo "hola: ".$numAlumnesPrimaria;
		$sql = "UPDATE assignar_espais SET 
					num_unitats = ?, 
					num_alumnes_infantil = ?, 
					num_alumnes_primaria = ?, 
					num_alumnes_eso = ?, 
					num_alumnes_batx = ?, 
					num_alumnes_fp = ?, 
					preu_metre_construit = ?
				WHERE id_centre = ? AND id_espai = ?";
		$stmt = $connexio->prepare($sql);
		$stmt->bind_param(
			"iiiiiidii",
			$numUnitats, $numAlumnesInfantil, 
			$numAlumnesPrimaria, $numAlumnesEso, $numAlumnesBatx, 
			$numAlumnesFp, $preuMetreConstruït, $idCentre, $idEspai
		);
	} else {
		// Insertar
		$sql = "INSERT INTO assignar_espais 
					(id_centre, id_espai, num_unitats, num_alumnes_infantil, num_alumnes_primaria, num_alumnes_eso, num_alumnes_batx, num_alumnes_fp, preu_metre_construit)
				VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		$stmt = $connexio->prepare($sql);
		$stmt->bind_param(
			"iiiiiiiid", 
			$idCentre, $idEspai, $numUnitats, $numAlumnesInfantil, 
			$numAlumnesPrimaria, $numAlumnesEso, $numAlumnesBatx, 
			$numAlumnesFp, $preuMetreConstruït
		);
	}
	
	if ($stmt->execute()) {
		header('Location: espaiCentreList.php?id_centre=' . $idCentre . '&nom_centre=' . $nomCentre);
	} else {
		echo "Error: " . $connexio->error;
	}
	
	// Tancar la connexió
	$stmt->close();
	$connexio->close();
?>
