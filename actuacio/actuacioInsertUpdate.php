<?php
	include '../connectarBD.php';

    // Recollir els valors del formulari
    $id = isset($_POST['id']) ? intval($_POST['id']) : null;
    $codi_extern = isset($_POST['codi_extern']) ? $_POST['codi_extern'] : null;
    $descripcio = isset($_POST['descripcio']) ? trim($_POST['descripcio']) : '';
    $data_entrada = isset($_POST['data_entrada']) ? $_POST['data_entrada'] : '';
    $data_enviament = isset($_POST['data_enviament']) ? $_POST['data_enviament'] : '';
    $observacions = isset($_POST['observacions']) ? trim($_POST['observacions']) : '';
    $estat_id = isset($_POST['estat']) ? intval($_POST['estat']) : null;
    $subtipus_id = isset($_POST['subtipus_actuacio']) ? intval($_POST['subtipus_actuacio']) : null;
    $prioritat_id = isset($_POST['prioritat']) ? intval($_POST['prioritat']) : null;
    $centre_id = isset($_POST['centre']) ? intval($_POST['centre']) : null;
    $pressupost = isset($_POST['pressupost']) ? floatval($_POST['pressupost']) : null;
    $assumitServei = isset($_POST['assumit_servei']) ? 'S' : 'N';
    $tecnic_id = isset($_POST['tecnic']) ? intval($_POST['tecnic']) : null;
    $origen_id = isset($_POST['origen']) ? intval($_POST['origen']) : null;
    $desti_id = isset($_POST['desti']) ? intval($_POST['desti']) : null;
    $mode_enviament_id = isset($_POST['mode']) ? intval($_POST['mode']) : null;
    $url_ibisec = isset($_POST['url_ibisec']) ? trim($_POST['url_ibisec']) : null;

    if ($subtipus_id == 0) $subtipus_id = null;
    if ($tecnic_id == 0) $tecnic_id = null;
    if ($origen_id == 0) $origen_id = null;
    if ($desti_id == 0) $desti_id = null;
    if ($mode_enviament_id == 0) $mode_enviament_id = null;

    if ($id) {
        // UPDATE si s'ha rebut un ID
        $sql = "UPDATE actuacions 
                SET codi_extern=?,
                    descripcio=?, 
                    data_entrada=?, 
                    observacions=?,
                    estat_id=?,
                    subtipus_id=?,
                    prioritat_id=?,
                    pressupost=?,
                    assumit_servei=?,
                    tecnic_id=?,
                    origen_id=?,
                    desti_id=?,
                    mode_enviament_id=?,
                    data_enviament=?,
                    url_ibisec=?
                WHERE id=?
                ";
        $stmt = $connexio->prepare($sql);
        if (!$stmt->bind_param("ssssiiidsiiiissi", $codi_extern, $descripcio, $data_entrada, $observacions, $estat_id, $subtipus_id, $prioritat_id,$pressupost, $assumitServei, $tecnic_id, $origen_id, $desti_id,$mode_enviament_id,$data_enviament,$url_ibisec,$id)) {
            die("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
        }    
    } else {
        // INSERT si no hi ha ID
        $sql = "INSERT INTO actuacions 
                    (codi_extern,
                    descripcio, 
                    data_entrada, 
                    observacions, 
                    estat_id, 
                    subtipus_id, 
                    prioritat_id,
                    centre_id,
                    pressupost,
                    assumit_servei,
                    tecnic_id,
                    origen_id,
                    desti_id,
                    mode_enviament_id,
                    data_enviament,
                    url_ibisec)     
                VALUES 
                    (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        $stmt = $connexio->prepare($sql);
        $stmt->bind_param("ssssiiiidsiiiiss", $codi_extern, $descripcio, $data_entrada, $observacions, $estat_id, $subtipus_id, $prioritat_id, $centre_id, $pressupost, $assumitServei, $tecnic_id,$origen_id, $desti_id,$mode_enviament_id,$data_enviament,$url_ibisec);
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