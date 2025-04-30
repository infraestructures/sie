<?php
	include '../connectarBD.php';

	$id = $_POST['id'];

	$sql = "DELETE FROM actuacio_conveni WHERE id = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('i', $id);

	if ($stmt->execute()) {
		header("Location: centreConveniForm.php?id_conveni=$id_conveni&id_centre=$id_centre");
	} else {
		echo "Error: " . $connexio->error;
	}
?>
