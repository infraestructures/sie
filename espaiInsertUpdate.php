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

$codi = $_POST['codi'] ?? null;
$nom = $_POST['nom'];
$tipus = $_POST['tipus'];
$ubicacio = $_POST['ubicacio'];
$ocupacio = $_POST['ocupacio'];
$metres= $_POST['metres'];

if ($codi != null || $codi != "") {
	// Actualizar
	$sql = "UPDATE ESPAI SET 
		nom = ?, tipus = ?, ubicacio=?, ocupacio_per_persona = ?, metres_per_unitat = ?
		WHERE codi = ?";
	$stmt = $conn->prepare($sql);
	$stmt->bind_param(
		'sssddi',
		$nom, $tipus, $ubicacio, $ocupacio, $metres, $codi
	);
} else {
	// Insertar
	$sql = "INSERT INTO ESPAI 
		(nom, tipus, ubicacio, ocupacio_per_persona, metres_per_unitat) 
		VALUES (?, ?, ?, ?, ?)";
	$stmt = $conn->prepare($sql);
	$stmt->bind_param(
		'sssdd',
		$nom, $tipus, $ubicacio, $ocupacio, $metres
	);
}
if ($stmt->execute()) {
	header("Location: espaiList.php");
} else {
	echo "Error: " . $conn->error;
}
?>