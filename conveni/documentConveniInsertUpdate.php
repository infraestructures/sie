<?php
	include '../connectarBD.php';

    // Recollir els valors del formulari
    $id = isset($_POST['id_document']) ? intval($_POST['id_document']) : null;
    $idConveni = isset($_POST['id_conveni']) ? intval($_POST['id_conveni']) : null;
    $nom = isset($_POST['nom']) ? trim($_POST['nom']) : '';
    $data = isset($_POST['data']) ? trim($_POST['data']) : '';
    $url = isset($_POST['url']) ? trim($_POST['url']) : '';

    if ($id) {
        // UPDATE si s'ha rebut un ID
        $sql = "UPDATE document_conveni 
                SET nom=?, 
                    data=?,
                    url=?
                WHERE id=?
                ";
        $stmt = $connexio->prepare($sql);
        $stmt->bind_param("sssi", $nom, $data, $url, $id);
    } else {
        // INSERT si no hi ha ID
        $sql = "INSERT INTO document_conveni 
                    (nom, 
                    data,
                    url,
                    conveni_id) 
                VALUES 
                    (?, ?, ?, ?)";

        $stmt = $connexio->prepare($sql);
        $stmt->bind_param("sssi", $nom, $data, $url, $idConveni);
    }

    if ($stmt->execute()) {
        // Redirigir després de l'operació
        header("Location: conveniForm.php?id=". $idConveni);
        exit();
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $connexio->close();
?>