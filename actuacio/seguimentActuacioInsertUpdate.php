<?php
	include '../connectarBD.php';

    // Recollir els valors del formulari
    $id = isset($_POST['id_seguiment']) ? intval($_POST['id_seguiment']) : null;
    $idActuacio = isset($_POST['id_actuacio']) ? intval($_POST['id_actuacio']) : null;
    $data = isset($_POST['data']) ? trim($_POST['data']) : '';
    $accio = isset($_POST['accio']) ? trim($_POST['accio']) : '';
    $url = isset($_POST['url']) ? trim($_POST['url']) : '';

    if ($id) {
        // UPDATE si s'ha rebut un ID
        $sql = "UPDATE seguiment_actuacio 
                SET data=?,
                    accio=?,
                    url=?
                WHERE id=?
                ";
        $stmt = $connexio->prepare($sql);
        $stmt->bind_param("sssi", $data, $accio, $url, $id);
    } else {
        // INSERT si no hi ha ID
        $sql = "INSERT INTO seguiment_actuacio 
                    (data,
                    accio,
                    url,
                    actuacio_id) 
                VALUES 
                    (?, ?, ?, ?)";

        $stmt = $connexio->prepare($sql);
        if (!$stmt->bind_param("sssi", $data, $accio, $url, $idActuacio)) {
            die("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
        }
        
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