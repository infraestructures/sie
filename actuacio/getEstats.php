<?php
// getEstats.php
// Devuelve <option> de estados (subestats) filtrados por superestat_id
// Respuesta pensada para ser inyectada directamente en un <select>

header('Content-Type: text/html; charset=UTF-8');

require_once '../connectarBD.php';

// Si no llega superestat_id, devolvemos sólo la opción por defecto
if (!isset($_POST['superestat_id']) || $_POST['superestat_id'] === '') {
    echo '<option value="">Selecciona un estat</option>';
    exit;
}

$superestat_id = intval($_POST['superestat_id']);
$estat_id = isset($_POST['estat_id']) && $_POST['estat_id'] !== '' ? intval($_POST['estat_id']) : null;

// Consulta segura con prepared statement
$sql = "SELECT id, nom FROM estat_actuacio WHERE superestat_id = ? ORDER BY ordre, nom";
$stmt = $connexio->prepare($sql);
if (!$stmt) {
    // En caso de error, devolvemos igualmente HTML válido para no romper el front
    echo '<option value="">Error al preparar la consulta</option>';
    exit;
}

$stmt->bind_param('i', $superestat_id);
$stmt->execute();
$result = $stmt->get_result();

// Primera opción
echo '<option value="">Tots</option>';

while ($row = $result->fetch_assoc()) {
    $selected = ($estat_id !== null && (int) $row['id'] === $estat_id) ? ' selected' : '';
    echo '<option value="' . (int) $row['id'] . '"' . $selected . '>' . htmlspecialchars($row['nom']) . '</option>';
}

$stmt->close();
$connexio->close();
