<?php
$host = "localhost";
$user = "root";
$password = "";
$dbname = "sie";

$conn = new mysqli($host, $user, $password, $dbname);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

$conn->set_charset("utf8mb4");

$id_illa = isset($_GET['id_illa']) ? (int)$_GET['id_illa'] : 0;

if ($id_illa > 0) {
    $result = $conn->query("SELECT id_municipi, nom_municipi FROM municipi WHERE id_illa = $id_illa");
    while ($municipi = $result->fetch_assoc()) {
        echo "<option value='{$municipi['id_municipi']}'>{$municipi['nom_municipi']}</option>";
    }
} else {
    echo "<option value=''>Selecciona un municipio</option>";
}
?>
