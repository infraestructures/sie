<?php
include 'connectarBD.php';

// Obtenir l'illa seleccionada
$illaId = isset($_GET['illa']) ? intval($_GET['illa']) : 0;

// Consulta per obtenir els municipis de l'illa seleccionada
if ($illaId > 0) {
    $query = "SELECT id, nom FROM Municipi WHERE illa_id = ? ORDER BY nom";
    $stmt = $connexio->prepare($query);
    $stmt->bind_param("i", $illaId);
    $stmt->execute();
    $result = $stmt->get_result();

    $municipis = [];
    while ($row = $result->fetch_assoc()) {
        $municipis[] = $row;
    }
    echo json_encode($municipis);
} else {
    echo json_encode([]);
}
?>
