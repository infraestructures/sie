<?php
	include '../connectarBD.php';

    // Recollir els valors del formulari
    $id = isset($_POST['id_informe']) ? intval($_POST['id_informe']) : null;
    $idActuacio = isset($_POST['id_actuacio']) ? intval($_POST['id_actuacio']) : null;
    $data = isset($_POST['data']) ? trim($_POST['data']) : '';
    $nom = isset($_POST['nom']) ? trim($_POST['nom']) : '';
    $url = isset($_POST['url']) ? trim($_POST['url']) : '';
    $observacions = isset($_POST['observacions']) ? trim($_POST['observacions']) : '';

    if ($id) {
        // UPDATE si s'ha rebut un ID
        $sql = "UPDATE informe_actuacio 
                SET nom=?, 
                    data=?,
                    url=?,
                    observacions=?
                WHERE id=?
                ";
        $stmt = $connexio->prepare($sql);
        $stmt->bind_param("ssssi", $nom, $data, $url, $observacions, $id);
    } else {
        // INSERT si no hi ha ID
        $sql = "INSERT INTO informe_actuacio 
                    (nom, 
                    data,
                    url,
                    observacions,
                    actuacio_id) 
                VALUES 
                    (?, ?, ?, ?, ?)";

        $stmt = $connexio->prepare($sql);
        $stmt->bind_param("ssssi", $nom, $data, $url, $observacions, $idActuacio);
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