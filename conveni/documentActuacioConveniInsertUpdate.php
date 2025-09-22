<?php
	include '../connectarBD.php';

    // Recollir els valors del formulari
    $idDocument = isset($_POST['id_document']) ? intval($_POST['id_document']) : null;
    $idActuacio = isset($_POST['id_actuacio']) ? intval($_POST['id_actuacio']) : null;
    $idConveni = isset($_POST['id_conveni']) ? intval($_POST['id_conveni']) : null;
    $idCentre = isset($_POST['id_centre']) ? intval($_POST['id_centre']) : null;
    $nom = isset($_POST['nom']) ? trim($_POST['nom']) : '';
    $tipus_id = isset($_POST['tipus_id']) ? trim($_POST['tipus_id']) : '';
    $data = isset($_POST['data']) ? trim($_POST['data']) : '';
    $url = isset($_POST['url']) ? trim($_POST['url']) : '';

    if ($idDocument) {
        // UPDATE si s'ha rebut un ID
        $sql = "UPDATE document_actuacio_conveni 
                SET nom=?, 
                    data=?,
                    tipus_id=?,
                    url=?
                WHERE id=?
                ";
        $stmt = $connexio->prepare($sql);
        if (!$stmt) {
            die("Error en la preparació de la consulta: " . $connexio->error);
        }
        if (!$stmt->bind_param("ssisi", $nom, $data, $tipus_id, $url, $idDocument)) {
            die("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
        }
    } else {
        // INSERT si no hi ha ID
        $sql = "INSERT INTO document_actuacio_conveni 
                    (nom, 
                    data,
                    tipus_id,
                    url,
                    actuacio_id) 
                VALUES 
                    (?, ?, ?, ?, ?)";
        $stmt = $connexio->prepare($sql);
        if (!$stmt) {
            die("Error en la preparació de la consulta: " . $connexio->error);
        }
        if (!$stmt->bind_param("ssisi", $nom, $data, $tipus_id, $url, $idActuacio)) {
            die("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
        }
    }

    if ($stmt->execute()) {
        // Redirigir després de l'operació
        header("Location: actuacioConveniForm.php?id=$idActuacio&id_conveni=$idConveni&id_centre=$idCentre");
        exit();
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $connexio->close();
?>