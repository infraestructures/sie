<?php
	include '../connectarBD.php';

    // Recollir els valors del formulari
    $id_centre      = isset($_POST['centre_id'])    ? intval($_POST['centre_id'])    : null;
    $id_conveni     = isset($_POST['id_conveni'])   ? intval($_POST['id_conveni'])   : null;
    $pressupost     = isset($_POST['pressupost'])   ? floatval($_POST['pressupost']) : null;
    $observacions   = isset($_POST['observacions']) ? trim($_POST['observacions'])   : '';
    $operacio       = isset($_POST['operacio'])     ? trim($_POST['operacio']) : '';

    if ($operacio == "modificar") {
        // UPDATE si s'ha rebut un ID
        $sql = "UPDATE centre_conveni 
                SET observacions=?,
                    pressupost=?
                WHERE id_centre=? AND
                      id_conveni=?
                ";
        $stmt = $connexio->prepare($sql);
        if (!$stmt) {
            die("Error en la preparació de la consulta: " . $connexio->error);
        }
        if (!$stmt->bind_param("sdii", $observacions, 
                                       $pressupost,
                                       $id_centre, 
                                       $id_conveni)) {
            die("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
        }    
    } else {
        // INSERT si no hi ha ID
        $sql = "INSERT INTO centre_conveni 
                    (id_centre,
                    id_conveni,
                    observacions, 
                    pressupost) 
                VALUES 
                    (?, ?, ?, ?)";

        $stmt = $connexio->prepare($sql);
        if (!$stmt) {
            die("Error en la preparació de la consulta: " . $connexio->error);
        }        
        if (!$stmt->bind_param("iisd",  $id_centre,
                                        $id_conveni,
                                        $observacions, 
                                        $pressupost)) {
            die("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
        }
    }
    
    if ($stmt->execute()) {
        // Redirigir després de l'operació
        header("Location: conveniForm.php?id=$id_conveni");
        exit();
    } else {
        echo "Error: " . $stmt->error;
    }
    
    $stmt->close();
    $connexio->close();
?>