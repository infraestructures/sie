<?php
$host = "localhost";
$user = "root";
$password = "";
$dbname = "sie";

$conn = new mysqli($host, $user, $password, $dbname);

if ($conn->connect_error) {
	die("Error de conexión: " . $conn->connect_error);
}

$codi = $_POST['codi'];

$sql = "DELETE FROM ESPAI WHERE codi = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param('i', $codi);

if ($stmt->execute()) {
	header("Location: espaiList.php");
} else {
	echo "Error: " . $conn->error;
}
?>
