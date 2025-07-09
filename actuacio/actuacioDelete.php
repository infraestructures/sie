<?php
	include '../connectarBD.php';

	$id = $_POST['id'];
	$origen = isset($_POST['origen']) ? trim($_POST['origen']) : '';
	$centre_id = isset($_POST['centre_id']) ? intval($_POST['centre_id']) : null;

	if ($origen != null)
		$tornar = "../centre/centreForm.php?id=$centre_id";
	else
		$tornar = "actuacioListFiltro.php";

	$sql = "DELETE FROM actuacions WHERE id = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('i', $id);

	if ($stmt->execute()) {
		header("Location: $tornar");
	} else {
		echo "Sha produït un error a l'eliminar l'actuació: " . $connexio->error;
	}
?>
