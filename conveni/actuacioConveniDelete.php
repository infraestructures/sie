<?php
	include '../connectarBD.php';

	$id = $_GET['id'];
	$id_centre = isset($_GET['id_centre']) ? intval($_GET['id_centre']) : null;
	$id_conveni = isset($_GET['id_conveni']) ? intval($_GET['id_conveni']) : null;

	$sql = "DELETE FROM actuacio_conveni WHERE id = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('i', $id);

	if ($stmt->execute()) {
		header("Location: centreConveniForm.php?id_conveni=$id_conveni&id_centre=$id_centre");
	} else {
		echo "Error: " . $connexio->error;
	}
?>
