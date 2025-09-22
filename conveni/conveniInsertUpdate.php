<?php
	include '../connectarBD.php';

    // Recollir els valors del formulari
    $data_inici     = $_POST['data_inici']     ?? '';
    $data_signatura = $_POST['data_signatura'] ?? '';
    $data_pagament  = $_POST['data_signatura'] ?? '';
    $id             = isset($_POST['id'])           ? intval($_POST['id'])           : null;
    $ajuntament_id  = isset($_POST['municipi'])     ? intval($_POST['municipi'])     : null;
    $descripcio     = isset($_POST['descripcio'])   ? trim($_POST['descripcio'])     : '';
    $observacions   = isset($_POST['observacions']) ? trim($_POST['observacions'])   : '';
    $observacions   = isset($_POST['observacions']) ? trim($_POST['observacions'])   : '';
    $estat_id       = isset($_POST['estat'])        ? intval($_POST['estat'])        : null;
    $pressupost     = isset($_POST['pressupost'])   ? floatval($_POST['pressupost']) : null;

    if ($id) {
        // UPDATE si s'ha rebut un ID
        $sql = "UPDATE conveni 
                SET descripcio=?, 
                    data_inici=?, 
                    data_signatura=?,
                    data_pagament=?,
                    observacions=?,
                    estat_conveni_id=?,
                    pressupost=?,
                    ajuntament_id=?
                WHERE id=?
                ";
        $stmt = $connexio->prepare($sql);
        if (!$stmt) {
            die("Error en la preparació de la consulta: " . $connexio->error);
        }
        if (!$stmt->bind_param("sssssidii", $descripcio, 
                                            $data_inici,
                                            $data_signatura,
                                            $data_pagament, 
                                            $observacions, 
                                            $estat_id, 
                                            $pressupost,
                                            $ajuntament_id, 

                                            $id)) {
            die("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
        }    
    } else {
        // INSERT si no hi ha ID
        $sql = "INSERT INTO conveni 
                    (descripcio, 
                    data_inici, 
                    data_signatura,
                    data_pagament,
                    observacions, 
                    estat_conveni_id, 
                    pressupost,
                    ajuntament_id,) 
                VALUES 
                    (?, ?, ?, ?, ?, ?, ?, ?)";

        $stmt = $connexio->prepare($sql);
        if (!$stmt) {
            die("Error en la preparació de la consulta: " . $connexio->error);
        }        
        if (!$stmt->bind_param("sssssidiss", $descripcio, 
        $data_inici,
               $data_signatura,
               $data_pagament, 
               $observacions, 
               $estat_id, 
               $pressupost,
               $ajuntament_id)) {
            die("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
        }
    }
    
    if ($stmt->execute()) {
        // Redirigir després de l'operació
        header("Location: conveniListFiltro.php");
        exit();
    } else {
        echo "Error: " . $stmt->error;
    }
    
    $stmt->close();
    $connexio->close();
?>