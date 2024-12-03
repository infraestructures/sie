<?php
$host = "localhost";
$user = "root";
$password = "";
$dbname = "sie";

$conn = new mysqli($host, $user, $password, $dbname);

if ($conn->connect_error) {
	die("Error de conexión: " . $conn->connect_error);
}

$id = $_POST['id'];

$sql = "DELETE FROM CENTRES WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param('i', $id);

if ($stmt->execute()) {
	header("Location: centreListFiltro.php");
} else {
	echo "Error: " . $conn->error;
}
?>
