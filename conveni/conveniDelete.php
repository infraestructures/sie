<?php
	include '../connectarBD.php';

	$id = $_POST['id'];

	$sql = "DELETE FROM conveni WHERE id = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('i', $id);

	if ($stmt->execute()) {
		header("Location: conveniListFiltro.php");
	} else {
		echo "Error: " . $connexio->error;
	}
?>
