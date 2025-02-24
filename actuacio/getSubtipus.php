<?php
include '../connectarBD.php';

if (isset($_POST['tipus_id'])) {
    $tipus_id = intval($_POST['tipus_id']);
    $sql = "SELECT id, nom FROM subtipus_actuacio WHERE tipus_id = ?";
    $stmt = $connexio->prepare($sql);
    $stmt->bind_param("i", $tipus_id);
    $stmt->execute();
    $result = $stmt->get_result();

    echo '<option value="">Selecciona un subtipus</option>';
    while ($row = $result->fetch_assoc()) {
        echo '<option value="' . $row['id'] . '">' . htmlspecialchars($row['nom']) . '</option>';
    }

    $stmt->close();
}
?>
