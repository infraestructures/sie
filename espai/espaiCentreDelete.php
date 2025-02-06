<?php
	include 'connectarBD.php';

	$idEspai = $_POST['id_espai'];
	$idCentre = $_POST['id_centre'];
	$nomCentre = $_POST['nom_centre'];

	$sql = "DELETE FROM ASSIGNAR_ESPAIS WHERE id_espai = ? && id_centre = ?";
	$stmt = $connexio->prepare($sql);
	$stmt->bind_param('ii', $idEspai, $idCentre);

	if ($stmt->execute()) {
		header('Location: espaiCentreList.php?id_centre=' . $idCentre . '&nom_centre=' . $nomCentre);
	} else {
		echo "Error: " . $connexio->error;
	}
?>
