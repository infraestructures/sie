<?php
declare(strict_types=1);
require_once __DIR__ . '/../connectarBD.php';
header('Content-Type: application/json; charset=utf-8');

$illa_id = isset($_GET['illa_id']) ? (int)$_GET['illa_id'] : 0;
if ($illa_id <= 0) { echo json_encode([]); exit; }

$st = $connexio->prepare("SELECT id, nom FROM municipi WHERE illa_id=? ORDER BY nom");
if (!$st) { echo json_encode([]); exit; }
$st->bind_param("i", $illa_id);
$st->execute();
$rs = $st->get_result();

$out = [];
while ($r = $rs->fetch_assoc()) {
  $out[] = ['id' => (int)$r['id'], 'nom' => (string)$r['nom']];
}
echo json_encode($out);
