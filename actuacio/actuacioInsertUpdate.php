<?php
	include '../connectarBD.php';

    // Recollir els valors del formulari
    $id = isset($_POST['id']) ? intval($_POST['id']) : null;
    $descripcio = isset($_POST['descripcio']) ? trim($_POST['descripcio']) : '';
    $data_entrada = isset($_POST['data_entrada']) ? $_POST['data_entrada'] : '';
    $observacions = isset($_POST['observacions']) ? trim($_POST['observacions']) : '';
    $estat_id = isset($_POST['estat']) ? intval($_POST['estat']) : null;
    $subtipus_id = isset($_POST['subtipus_actuacio']) ? intval($_POST['subtipus_actuacio']) : null;
    $prioritat_id = isset($_POST['prioritat']) ? intval($_POST['prioritat']) : null;
    $centre_id = isset($_POST['centre']) ? intval($_POST['centre']) : null;
    $pressupost = isset($_POST['pressupost']) ? floatval($_POST['pressupost']) : null;
    $tecnic_id = isset($_POST['tecnic']) ? intval($_POST['tecnic']) : null;

    if ($tecnic_id == 0) $tecnic_id = null;

    if ($id) {
        // UPDATE si s'ha rebut un ID
        $sql = "UPDATE actuacions 
                SET descripcio=?, 
                    data_entrada=?, 
                    observacions=?,
                    estat_id=?,
                    subtipus_id=?,
                    prioritat_id=?,
                    pressupost=?,
                    tecnic_id=?
                WHERE id=?
                ";
        $stmt = $connexio->prepare($sql);
        //$stmt->bind_param("sssiiidii", $descripcio, $data_entrada, $observacions, $estat_id, $subtipus_id, $prioritat_id,$pressupost, $tecnic_id, $id);
        if (!$stmt->bind_param("sssiiidii", $descripcio, $data_entrada, $observacions, $estat_id, $subtipus_id, $prioritat_id,$pressupost, $tecnic_id, $id)) {
            die("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
        }    
    } else {
        // INSERT si no hi ha ID
        $sql = "INSERT INTO actuacions 
                    (descripcio, 
                    data_entrada, 
                    observacions, 
                    estat_id, 
                    subtipus_id, 
                    prioritat_id,
                    centre_id,
                    pressupost,
                    tecnic_id) 
                VALUES 
                    (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        $stmt = $connexio->prepare($sql);
        $stmt->bind_param("sssiiiidi", $descripcio, $data_entrada, $observacions, $estat_id, $subtipus_id, $prioritat_id, $centre_id, $pressupost, $tecnic_id);
    }

    if ($stmt->execute()) {
        // Redirigir després de l'operació
        header("Location: actuacioListFiltro.php");
        exit();
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $connexio->close();
?>