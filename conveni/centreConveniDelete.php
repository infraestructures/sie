<?php
	include '../connectarBD.php';

	$id_conveni = $_POST['id_conveni'];
	$id_centre = $_POST['id_centre'];

	$sql = "DELETE FROM centre_conveni WHERE id_conveni = ? AND id_centre = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('ii', $id_conveni, $id_centre);

	if ($stmt->execute()) {
		header("Location: conveniForm.php?id=$id_conveni");
	} else {
		echo "Error: " . $connexio->error;
	}
?>
