<?php
	include '../connectarBD.php';

	$idPagament = isset($_POST['id_pagament']) ? intval($_POST['id_pagament']) : null;
	$idActuacio = isset($_POST['id_actuacio']) ? intval($_POST['id_actuacio']) : null;

	$sql = "DELETE FROM document_actuacio_conveni WHERE id = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('i', $idPagament);

	if ($stmt->execute()) {
		header("Location: actuacioConveniForm.php?id=". $idActuacio);
	} else {
		echo "Error: " . $connexio->error;
	}
?>
