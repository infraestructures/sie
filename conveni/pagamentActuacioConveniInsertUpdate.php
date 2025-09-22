<?php
	include '../connectarBD.php';

    // Recuperar dades de la fitxa del centre
    $id_centre = $_POST['id_centre'] ?? '';
    $id_conveni = $_POST['id_conveni'] ?? '';
    
    // Recollir els valors del formulari
    $idPagament = isset($_POST['id_pagament']) ? intval($_POST['id_pagament']) : null;
    $concepte = isset($_POST['concepte']) ? trim($_POST['concepte']) : '';
    $data = isset($_POST['data']) ? trim($_POST['data']) : '';
    $import = isset($_POST['import']) ? doubleval($_POST['import']) : '';

    if ($idPagament) {
        // UPDATE si s'ha rebut un ID
        $sql = "UPDATE pagament_conveni 
                SET concepte=?, 
                    data=?,
                    import=?
                WHERE id=?
                ";
        $stmt = $connexio->prepare($sql);
        if (!$stmt) {
            die("Error en la preparació de la consulta: " . $connexio->error);
        }
        if (!$stmt->bind_param("ssdi", $concepte, $data, $import, $idPagament)) {
            die("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
        }
    } else {
        // INSERT si no hi ha ID
        $sql = "INSERT INTO pagament_conveni 
                    (concepte, 
                    data,
                    import,
                    conveni_id) 
                VALUES 
                    (?, ?, ?, ?)";
        $stmt = $connexio->prepare($sql);
        if (!$stmt) {
            die("Error en la preparació de la consulta: " . $connexio->error);
        }
        if (!$stmt->bind_param("ssdi", $concepte, $data, $import, $id_conveni)) {
            die("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
        }
    }

    if ($stmt->execute()) {
        // Redirigir després de l'operació
        header("Location: conveniForm.php?id=". $id_conveni);
        exit();
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $connexio->close();
?>