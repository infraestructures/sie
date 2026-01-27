<?php declare(strict_types=1);

include '../connectarBD.php';

ini_set('display_errors', '0');
error_reporting(E_ALL);

header('Content-Type: application/json; charset=utf-8');

function jexit($arr, $code = 200)
{
    http_response_code($code);
    echo json_encode($arr, JSON_UNESCAPED_UNICODE);
    exit;
}

try {
    if (!isset($connexio) || !($connexio instanceof mysqli)) {
        jexit(['ok' => false, 'error' => 'Connexió BD no disponible'], 500);
    }

    // Recoger POST (ajusta nombres si tus inputs se llaman distinto)
    $nom = trim((string) ($_POST['nom'] ?? $_POST['nova_nom'] ?? ''));
    $cif = trim((string) ($_POST['cif'] ?? $_POST['nova_cif'] ?? ''));
    $adreca = trim((string) ($_POST['adreca'] ?? $_POST['nova_adreca'] ?? ''));
    $cp = trim((string) ($_POST['codi_postal'] ?? $_POST['nova_codi_postal'] ?? ''));
    $municipi_id = (int) ($_POST['municipi_id'] ?? $_POST['nova_municipi_id'] ?? 0);
    $telefon = trim((string) ($_POST['telefon'] ?? $_POST['nova_telefon'] ?? ''));
    $email = trim((string) ($_POST['email'] ?? $_POST['nova_email'] ?? ''));
    $persona_contacte = trim((string) ($_POST['persona_contacte'] ?? $_POST['nova_persona_contacte'] ?? ''));
    $observacions = trim((string) ($_POST['observacions'] ?? $_POST['nova_observacions'] ?? ''));

    if ($nom === '') {
        jexit(['ok' => false, 'error' => 'El nom és obligatori'], 400);
    }

    // Si cif es opcional (cuando ya cambies la tabla a NULL):
    $cif = ($cif === '') ? null : $cif;
    $municipi_id = ($municipi_id > 0) ? $municipi_id : null;

    $connexio->begin_transaction();

    $sql = "INSERT INTO empresa
            (nom, cif, adreca, codi_postal, municipi_id, telefon, email, persona_contacte, observacions, activa, data_alta, data_baixa)
          VALUES
            (?, ?, ?, ?, ?, ?, ?, ?, ?, 'S', CURDATE(), NULL)";

    $stmt = $connexio->prepare($sql);
    if (!$stmt) {
        throw new RuntimeException("prepare: " . $connexio->error);
    }

    // Tipos: s s s s i s s s s  (pero municipi_id puede ser null ? usamos bind_param con variable y luego set null)
    // En mysqli, para NULL hay que pasar variable y usar mysqli_stmt_bind_param igualmente; funciona si el valor es null.
    $stmt->bind_param(
        "ssssiisss",
        $nom,
        $cif,          // null o string
        $adreca,
        $cp,
        $municipi_id,  // null o int
        $telefon,
        $email,
        $persona_contacte,
        $observacions
    );

    if (!$stmt->execute()) {
        throw new RuntimeException("execute: " . $stmt->error);
    }

    $newId = (int) $stmt->insert_id;

    $connexio->commit();

    jexit(['ok' => true, 'id' => $newId, 'nom' => $nom, 'cif' => $cif ?? '', 'municipi_id' => $municipi_id], 200);

} catch (Throwable $e) {
    if (isset($connexio) && $connexio instanceof mysqli) {
        @$connexio->rollback();
    }
    error_log("empresaCreate.php ERROR: " . $e->getMessage());
    jexit(['ok' => false, 'error' => 'Error intern creant empresa.'], 500);
}
