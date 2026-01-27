<?php
include '../connectarBD.php';

$id = $_POST['id'] ?? null;
if ($id === null || $id === '') {
    die('Falta l\'id.');
}

$tornar = 'contracteMenorListFiltro.php';

$sql = 'DELETE FROM contracte_menor WHERE id = ?';
$stmt = $connexio->prepare($sql);
if (!$stmt) die('Prepare failed: '.$connexio->error);

$idInt = intval($id);
$stmt->bind_param('i', $idInt);

if ($stmt->execute()) {
    header("Location: $tornar");
} else {
    echo "S'ha produÃ¯t un error a l'eliminar el contracte menor: " . $connexio->error;
}
?>
