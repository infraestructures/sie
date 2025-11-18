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
    $centre_id = isset($_POST['centre_id']) ? intval($_POST['centre_id']) : null;
    $pressupost = isset($_POST['pressupost']) ? floatval($_POST['pressupost']) : null;
    $assumitServei = isset($_POST['assumit_servei']) ? 'S' : 'N';
    $tecnic_id = isset($_POST['tecnic']) ? intval($_POST['tecnic']) : null;
    $origen_id = isset($_POST['origen_id']) ? intval($_POST['origen_id']) : null;
    $desti_id = isset($_POST['desti']) ? intval($_POST['desti']) : null;
    $origen = isset($_POST['origen']) ? trim($_POST['origen']) : '';

    if ($subtipus_id == 0) $subtipus_id = null;
    if ($tecnic_id == 0) $tecnic_id = null;
    if ($origen_id == 0) $origen_id = null;
    if ($desti_id == 0) $desti_id = null;

    if ($origen != null)
        $tornar = "../centre/centreForm.php?id=$centre_id";
    else
        $tornar = "actuacioListFiltro.php";
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
                    data_enviament=?
                WHERE id=?
                ";
        $stmt = $connexio->prepare($sql);
        if (!$stmt->bind_param("ssssiiidsiiisi", $codi_extern, $descripcio, $data_entrada, $observacions, $estat_id, $subtipus_id, $prioritat_id,$pressupost, $assumitServei, $tecnic_id, $origen_id, $desti_id,$data_enviament,$id)) {
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
                    data_enviament
                )     
                VALUES 
                    (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        $stmt = $connexio->prepare($sql);
        $stmt->bind_param("ssssiiiidsiiis", $codi_extern, $descripcio, $data_entrada, $observacions, $estat_id, $subtipus_id, $prioritat_id, $centre_id, $pressupost, $assumitServei, $tecnic_id,$origen_id, $desti_id,$data_enviament);
    }

    if ($stmt->execute()) {
        // Redirigir després de l'operació
        header("Location: $tornar");
        exit();
    } else {
        echo "Error: " . $stmt->error;
    }
    
    $stmt->close();
    $connexio->close();
?>