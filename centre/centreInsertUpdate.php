<?php
	include '../connectarBD.php';

	$id = $_POST['id'] ?? null;
	$codi = $_POST['codi'];
	$sigla = $_POST['sigla'];
	$centre = $_POST['centre'];
	$id_illa = $_POST['id_illa'];
	$id_municipi = $_POST['id_municipi'];
	$telefon = $_POST['telefon'];
	$fax = $_POST['fax'];
	$email = $_POST['email'];
	$cp = $_POST['cp'];
	$localitat = $_POST['localitat'];
	$adreca = $_POST['adreca'];
	$ref_cadastral = $_POST['ref_cadastral'] ?? null;
	$cadastre_localitzacio = $_POST['cadastre_localitzacio'] ?? null;
	$cadastre_classe = $_POST['cadastre_classe'] ?? null;
	$cadastre_us_principal = $_POST['cadastre_us_principal'] ?? null;
	$cadastre_sup_construida_m2 = $_POST['cadastre_sup_construida_m2'] ?? null;
	$cadastre_any_construccio = $_POST['cadastre_any_construccio'] ?? null;
	$cadastre_parcela_tipus = $_POST['cadastre_parcela_tipus'] ?? null;
	$cadastre_parcela_localitzacio = $_POST['cadastre_parcela_localitzacio'] ?? null;
	$cadastre_sup_grafica_m2 = $_POST['cadastre_sup_grafica_m2'] ?? null;
	$cadastre_font = $_POST['cadastre_font'] ?? 'SEC-OVC';
	if ($id != null || $id != "") {
		// Actualizar
		$sql = "UPDATE CENTRES SET 
					Codi = ?, Sigla = ?, Centre = ?, id_illa = ?, id_municipi = ?, 
					Telefon = ?, Fax = ?, email = ?, CP = ?, Localitat = ?, Adreca = ?, ref_cadastral = ?, 
					cadastre_localitzacio = ?, cadastre_classe = ?, cadastre_us_principal = ?, 
					cadastre_sup_construida_m2 = ?, cadastre_any_construccio = ?, cadastre_parcela_tipus = ?, 
					cadastre_parcela_localitzacio = ?, cadastre_sup_grafica_m2 = ?, 
					cadastre_data_consulta = CURRENT_TIMESTAMP, cadastre_font = ?
				WHERE id = ?";
		$stmt = $connexio->prepare($sql);
		$stmt->bind_param(
			'sssiissssssssssssssssi',
			$codi, $sigla, $centre, $id_illa, $id_municipi,
			$telefon, $fax, $email, $cp, $localitat, $adreca, $ref_cadastral,
			$cadastre_localitzacio, $cadastre_classe, $cadastre_us_principal,
			$cadastre_sup_construida_m2, $cadastre_any_construccio, $cadastre_parcela_tipus,
			$cadastre_parcela_localitzacio, $cadastre_sup_grafica_m2, $cadastre_font, $id
		);
	} else {
		// Insertar
		$sql = "INSERT INTO CENTRES 
			(Codi, Sigla, Centre, id_illa, id_municipi, Telefon, Fax, email, CP, Localitat, Adreca, ref_cadastral, 
			 cadastre_localitzacio, cadastre_classe, cadastre_us_principal, cadastre_sup_construida_m2, 
		     cadastre_any_construccio, cadastre_parcela_tipus, cadastre_parcela_localitzacio, cadastre_sup_grafica_m2, 
			 cadastre_data_consulta, cadastre_font) 
			VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP, ?)";
		$stmt = $connexio->prepare($sql);
		$stmt->bind_param(
			'sssiissssssssssssssss',
			$codi, $sigla, $centre, $id_illa, $id_municipi,
			$telefon, $fax, $email, $cp, $localitat, $adreca
		);
	}
	if ($stmt->execute()) {
		header("Location: centreListFiltro.php");
	} else {
		echo "Error: " . $connexio->error;
	}
?>