<?php
	include 'connectarBD.php';

	$id = $_POST['id'];

	$sql = "DELETE FROM CENTRES WHERE id = ?";
	$stmt = $conn->prepare($sql);
	$stmt->bind_param('i', $id);

	if ($stmt->execute()) {
		header("Location: centreListFiltro.php");
	} else {
		echo "Error: " . $conn->error;
	}
?>
