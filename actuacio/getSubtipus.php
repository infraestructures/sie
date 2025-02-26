<?php
include '../connectarBD.php';

echo "inici";
if (isset($_POST['tipus_id'])) {
    $tipus_id = intval($_POST['tipus_id']);
    $subtipus_id = isset($_POST['subtipus_id']) ? intval($_POST['subtipus_id']) : null;
echo "tipus: $tipus_id, subtipus: $subtipus_id";
    $sql = "SELECT id, nom FROM subtipus_actuacio WHERE tipus_id = ?";
    $stmt = $connexio->prepare($sql);
    $stmt->bind_param("i", $tipus_id);
    $stmt->execute();
    $result = $stmt->get_result();

    echo '<option value="">Tots</option>';
    while ($row = $result->fetch_assoc()) {
        $selected = ($subtipus_id !== null && $row['id'] == $subtipus_id) ? 'selected' : '';
        echo '<option value="' . $row['id'] . '" ' . $selected . '>' . htmlspecialchars($row['nom']) . '</option>';
    }

    $stmt->close();
}
?>