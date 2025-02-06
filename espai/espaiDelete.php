<?php
	include 'connectarBD.php';

	$codi = $_POST['codi'];

	$sql = "DELETE FROM ESPAI WHERE codi = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('i', $codi);

	if ($stmt->execute()) {
		header("Location: espaiList.php");
	} else {
		echo "Error: " . $conn->error;
	}
?>
