<?php
	include '../connectarBD.php';

    // Recollir els valors del formulari
    $id = isset($_POST['id']) ? intval($_POST['id']) : null;
    $id_centre = isset($_POST['centre_id']) ? intval($_POST['centre_id']) : null;
    $id_conveni = isset($_POST['id_conveni']) ? intval($_POST['id_conveni']) : null;
    $descripcio = trim($_POST['descripcio'] ?? null);
    $observacions = trim($_POST['observacions'] ?? '');
    $operacio = trim($_POST['operacio'] ?? '');

    $pressupost_inicial = isset($_POST['pressupost_inicial']) ? floatval($_POST['pressupost_inicial']) : null;
    $pressupost_definitiu = isset($_POST['pressupost_definitiu']) ? floatval($_POST['pressupost_definitiu']) : null;
    $aprovacio_inicial = trim($_POST['aprovacio_inicial'] ?? null);
    $aprovacio_definitiva = trim($_POST['aprovacio_definitiva'] ?? null);
    $previsio_inic = trim($_POST['previsio_inic'] ?? null);
    $previsio_final = trim($_POST['previsio_final'] ?? null);
    $comissio_seguiment_data = trim($_POST['comissio_seguiment_data'] ?? null);
    $comissio_seguiment_enllac = trim($_POST['comissio_seguiment_enllac'] ?? null);


    if ($operacio == "modificar") {
        // UPDATE si s'ha rebut un ID
        $sql = "UPDATE actuacio_conveni SET
                descripcio=?,
                observacions=?,
                pressupost_inicial=?,
                pressupost_definitiu=?,
                aprovacio_inicial=?,
                aprovacio_definitiva=?,
                previsio_inic=?,
                previsio_final=?,
                comissio_seguiment_data=?,
                comissio_seguiment_enllac=?
            WHERE id=?";

        $stmt = $connexio->prepare($sql);
        if (!$stmt) {
            die("Error en la preparació de la consulta: " . $connexio->error);
        }

        if (
            !$stmt->bind_param(
                "ssddssssssi",
                $descripcio,
                $observacions,
                $pressupost_inicial,
                $pressupost_definitiu,
                $aprovacio_inicial,
                $aprovacio_definitiva,
                $previsio_inic,
                $previsio_final,
                $comissio_seguiment_data,
                $comissio_seguiment_enllac,
                $id
            )
        ) {
            die("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
        }

    } else {
        // INSERT si no hi ha ID
        $sql = "INSERT INTO actuacio_conveni (
                centre_id,
                conveni_id,
                descripcio,
                observacions,
                pressupost_inicial,
                pressupost_definitiu,
                aprovacio_inicial,
                aprovacio_definitiva,
                previsio_inic,
                previsio_final,
                comissio_seguiment_data,
                comissio_seguiment_enllac
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        $stmt = $connexio->prepare($sql);
        if (!$stmt) {
            die("Error en la preparació de la consulta: " . $connexio->error);
        }

        if (
            !$stmt->bind_param(
                "iissddssssss",
                $id_centre,
                $id_conveni,
                $descripcio,
                $observacions,
                $pressupost_inicial,
                $pressupost_definitiu,
                $aprovacio_inicial,
                $aprovacio_definitiva,
                $previsio_inic,
                $previsio_final,
                $comissio_seguiment_data,
                $comissio_seguiment_enllac
            )
        ) {
            die("Bind failed: (" . $stmt->errno . ") " . $stmt->error);
        }

    }
    
    if ($stmt->execute()) {
        // Redirigir després de l'operació
        header("Location: centreConveniForm.php?id_conveni=$id_conveni&id_centre=$id_centre");
        exit();
    } else {
        echo "Error: " . $stmt->error;
    }
    
    $stmt->close();
    $connexio->close();
?>