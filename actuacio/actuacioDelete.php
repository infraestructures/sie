<?php
	include '../connectarBD.php';

	$id = $_POST['id'];

	$sql = "DELETE FROM actuacions WHERE id = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('i', $id);

	if ($stmt->execute()) {
		header("Location: actuacioListFiltro.php");
	} else {
		echo "Error: " . $connexio->error;
	}
?>
