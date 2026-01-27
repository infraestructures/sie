<?php
declare(strict_types=1);

header('Content-Type: application/json; charset=utf-8');

include '../connectarBD.php';

$connexio = $connexio ?? ($con ?? ($mysqli ?? null));
if (!$connexio) {
    http_response_code(500);
    echo json_encode(['ok' => false, 'error' => 'Connexió BD no disponible'], JSON_UNESCAPED_UNICODE);
    exit;
}

$q = trim((string) ($_GET['q'] ?? ''));
if (mb_strlen($q) < 2) {
    echo json_encode([], JSON_UNESCAPED_UNICODE);
    exit;
}

try {
    // En tu DDL: activa = 'S' por defecto
    $sql = "
        SELECT e.id, e.nom, e.cif, m.nom AS municipi
        FROM empresa e
        LEFT JOIN municipi m ON m.id = e.municipi_id
        WHERE e.activa = 'S'
          AND (e.nom LIKE ? OR e.cif LIKE ?)
        ORDER BY e.nom
        LIMIT 10
    ";

    $like = '%' . $q . '%';
    $stmt = mysqli_prepare($connexio, $sql);
    if (!$stmt) {
        throw new RuntimeException('mysqli_prepare: ' . mysqli_error($connexio));
    }

    mysqli_stmt_bind_param($stmt, "ss", $like, $like);

    if (!mysqli_stmt_execute($stmt)) {
        throw new RuntimeException('mysqli_execute: ' . mysqli_stmt_error($stmt));
    }

    $result = mysqli_stmt_get_result($stmt);
    if ($result === false) {
        throw new RuntimeException('mysqli_get_result: ' . mysqli_error($connexio));
    }

    $out = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $out[] = [
            'id' => (int) $row['id'],
            'nom' => $row['nom'],
            'cif' => $row['cif'] ?? '',
            'municipi' => $row['municipi'] ?? '',
        ];
    }

    echo json_encode($out, JSON_UNESCAPED_UNICODE);

} catch (Throwable $e) {
    // Log interno para ver el motivo real
    error_log("empresaSearch.php error: " . $e->getMessage());
    http_response_code(500);
    echo json_encode(['ok' => false, 'error' => 'Error intern cercant empreses'], JSON_UNESCAPED_UNICODE);
}
