<?php
declare(strict_types=1);
require_once __DIR__ . '/../connectarBD.php';
header('Content-Type: application/json; charset=utf-8');

$q = trim($_GET['q'] ?? '');
if (mb_strlen($q) < 2) { echo json_encode([]); exit; }

$like = '%' . $q . '%';
$st = $connexio->prepare("SELECT id, Centre AS nom FROM centres WHERE Centre LIKE ? ORDER BY Centre LIMIT 20");
if (!$st) { echo json_encode([]); exit; }
$st->bind_param("s", $like);
$st->execute();
$rs = $st->get_result();

$out = [];
while ($r = $rs->fetch_assoc()) {
  $out[] = ['id' => (int)$r['id'], 'nom' => (string)$r['nom']];
}
echo json_encode($out);
