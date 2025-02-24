<?php
	include '../connectarBD.php';

	$id = $_GET['id_document'];
	$idActuacio = isset($_GET['id_actuacio']) ? intval($_GET['id_actuacio']) : null;

	$sql = "DELETE FROM document_actuacio WHERE id = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('i', $id);

	if ($stmt->execute()) {
		header("Location: actuacioForm.php?id=". $idActuacio);
	} else {
		echo "Error: " . $connexio->error;
	}
?>
