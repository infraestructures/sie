<?php
	include '../connectarBD.php';

	$id = $_GET['id_document'];
	$idConveni = isset($_GET['id_conveni']) ? intval($_GET['id_conveni']) : null;

	$sql = "DELETE FROM document_conveni WHERE id = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('i', $id);

	if ($stmt->execute()) {
		header("Location: conveniForm.php?id=". $idConveni);
	} else {
		echo "Error: " . $connexio->error;
	}
?>
