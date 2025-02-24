<?php
	include '../connectarBD.php';

	$id = $_GET['id_informe'];
	$idActuacio = isset($_GET['id_actuacio']) ? intval($_GET['id_actuacio']) : null;

	$sql = "DELETE FROM informe_actuacio WHERE id = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('i', $id);

	if ($stmt->execute()) {
		header("Location: actuacioForm.php?id=". $idActuacio);
	} else {
		echo "Error: " . $connexio->error;
	}
?>
