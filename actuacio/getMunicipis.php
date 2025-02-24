<?php
include '../connectarBD.php';

if (!isset($_POST['illa']) || empty($_POST['illa'])) {
    die("Error: No s'ha rebut cap ID d'illa.");
}

$illaID = intval($_POST['illa']);

// Escriure la consulta SQL
$query = "SELECT id, nom FROM municipi WHERE illa_id = ? ORDER BY nom ASC";

// Provar de preparar la consulta
$stmt = $connexio->prepare($query);
if (!$stmt) {
    die("Error en la consulta SQL: " . $connexio->error); // 🔥 Mostra l'error exacte de MySQL
}

$stmt->bind_param("i", $illaID);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    echo '<option value="">Selecciona un municipi</option>';
    while ($row = $result->fetch_assoc()) {
        echo '<option value="'.$row['id'].'">'.$row['nom'].'</option>';
    }
} else {
    echo '<option value="">No hi ha municipis</option>';
}
?>
