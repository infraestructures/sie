<?php
include '../connectarBD.php';

$municipiID = isset($_POST['municipi']) ? intval($_POST['municipi']) : (isset($_GET['municipi']) ? intval($_GET['municipi']) : 0);

if ($municipiID === 0) {
    die("Error: No s'ha rebut cap ID de municipi.");
}

echo "ID de municipi rebut: " . $municipiID . "<br>"; // 🔥 Debug per veure si arriba el municipiID

// Escriure la consulta SQL
$query = "SELECT id, Centre, Localitat FROM centres WHERE id_municipi = ? ORDER BY Centre ASC";

$stmt = $connexio->prepare($query);
if (!$stmt) {
    die("Error en la consulta SQL: " . $connexio->error);
}

$stmt->bind_param("i", $municipiID);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    echo '<option value="">Selecciona un centre</option>';
    while ($row = $result->fetch_assoc()) {
        $nomCentre = $row['Centre']."-".$row['Localitat'];
        echo '<option value="'.$row['id'].'">'.$nomCentre.'</option>';
    }
} else {
    echo "No hi ha centres per a aquest municipi."; // 🔥 Debug per veure si realment no hi ha dades
}
?>
