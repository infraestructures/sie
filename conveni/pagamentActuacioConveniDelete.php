<?php
	include '../connectarBD.php';

	$idPagament = isset($_POST['id_pagament']) ? intval($_POST['id_pagament']) : null;
	
	// Recuperar dades de la fitxa del centre
	$id_centre = $_GET['id_centre'] ?? '';
	$id_conveni = $_GET['id_conveni'] ?? '';

	$sql = "DELETE FROM pagament_conveni WHERE id = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('i', $idPagament);

	if ($stmt->execute()) {
		header("Location: conveniForm.php?id=" . $idActuacio . "&id_conveni=" . $id_conveni . "");
	} else {
		echo "Error: " . $connexio->error;
	}
?>
