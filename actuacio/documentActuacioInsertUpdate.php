<?php
	include '../connectarBD.php';

    // Recollir els valors del formulari
    $id = isset($_POST['id_document']) ? intval($_POST['id_document']) : null;
    $idActuacio = isset($_POST['id_actuacio']) ? intval($_POST['id_actuacio']) : null;
    $nom = isset($_POST['nom']) ? trim($_POST['nom']) : '';
    $url = isset($_POST['url']) ? trim($_POST['url']) : '';

    if ($id) {
        // UPDATE si s'ha rebut un ID
        $sql = "UPDATE document_actuacio 
                SET nom=?, 
                    data=?,
                    url=?
                WHERE id=?
                ";
        $stmt = $connexio->prepare($sql);
        $stmt->bind_param("sssi", $nom, $data, $url, $id);
    } else {
        // INSERT si no hi ha ID
        $sql = "INSERT INTO document_actuacio 
                    (nom, 
                    data,
                    url,
                    actuacio_id) 
                VALUES 
                    (?, ?, ?, ?)";

        $stmt = $connexio->prepare($sql);
        $stmt->bind_param("ssi", $nom, $data, $url, $idActuacio);
    }

    if ($stmt->execute()) {
        // Redirigir després de l'operació
        header("Location: actuacioForm.php?id=". $idActuacio);
        exit();
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $connexio->close();
?>