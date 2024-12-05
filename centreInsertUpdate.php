<?php
	include 'connectarBD.php';

	$id = $_POST['id'] ?? null;
	$codi = $_POST['codi'];
	$sigla = $_POST['sigla'];
	$centre = $_POST['centre'];
	$id_illa = $_POST['id_illa'];
	$id_municipi = $_POST['id_municipi'];
	$telefon = $_POST['telefon'];
	$fax = $_POST['fax'];
	$email = $_POST['email'];
	$cp = $_POST['cp'];
	$localitat = $_POST['localitat'];
	$adreca = $_POST['adreca'];

	if ($id != null || $id != "") {
		// Actualizar
		$sql = "UPDATE CENTRES SET 
			Codi = ?, Sigla = ?, Centre = ?, id_illa = ?, id_municipi = ?, 
			Telefon = ?, Fax = ?, email = ?, CP = ?, Localitat = ?, Adreca = ?
			WHERE id = ?";
		$stmt = $connexio->prepare($sql);
		$stmt->bind_param(
			'ssssiisssssssi',
			$codi, $sigla, $centre, $id_illa, $id_municipi,
			$telefon, $fax, $email, $cp, $localitat, $adreca, $id_centro
		);
	} else {
		// Insertar
		$sql = "INSERT INTO CENTRES 
			(Codi, Sigla, Centre, id_illa, id_municipi, Telefon, Fax, email, CP, Localitat, Adreca) 
			VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		$stmt = $connexio->prepare($sql);
		$stmt->bind_param(
			'sssiissssss',
			$codi, $sigla, $centre, $id_illa, $id_municipi,
			$telefon, $fax, $email, $cp, $localitat, $adreca
		);
	}
	if ($stmt->execute()) {
		header("Location: centreListFiltro.php");
	} else {
		echo "Error: " . $connexio->error;
	}
?>