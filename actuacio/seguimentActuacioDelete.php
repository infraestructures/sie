<?php
	include '../connectarBD.php';

	$id = $_GET['id_seguiment'];
	$idActuacio = isset($_GET['id_actuacio']) ? intval($_GET['id_actuacio']) : null;

	$sql = "DELETE FROM seguiment_actuacio WHERE id = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('i', $id);
echo "id: $id";
	if ($stmt->execute()) {
		header("Location: actuacioForm.php?id=". $idActuacio);
	} else {
		echo "Error: " . $connexio->error;
	}
?>
