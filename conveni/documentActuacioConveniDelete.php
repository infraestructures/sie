<?php
	include '../connectarBD.php';

	$idDocument = isset($_POST['id_document']) ? intval($_POST['id_document']) : null;
	$idActuacio = isset($_POST['id_actuacio']) ? intval($_POST['id_actuacio']) : null;
	$idConveni = isset($_POST['id_conveni']) ? intval($_POST['id_conveni']) : null;
	$idCentre = isset($_POST['id_centre']) ? intval($_POST['id_centre']) : null;
	$sql = "DELETE FROM document_actuacio_conveni WHERE id = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('i', $idDocument);
echo "idDoc: $idDocument";
	if ($stmt->execute()) {
		header("Location: actuacioConveniForm.php?id=$idActuacio&id_conveni=$idConveni&id_centre=$idCentre");
	} else {
		echo "Error: " . $connexio->error;
	}
?>
