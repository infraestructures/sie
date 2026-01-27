<?php
include '../connectarBD.php';

$id = (isset($_POST['id']) && $_POST['id'] !== '') ? intval($_POST['id']) : null;

$codi = isset($_POST['codi']) ? trim($_POST['codi']) : '';
$data = $_POST['data'] ?? '';
$centre_id = (isset($_POST['centre_id']) && $_POST['centre_id'] !== '') ? intval($_POST['centre_id']) : null;
$actuacio = isset($_POST['actuacio']) ? trim($_POST['actuacio']) : '';
$descripcio = isset($_POST['descripcio']) ? trim($_POST['descripcio']) : '';
$pressupost = (isset($_POST['pressupost']) && $_POST['pressupost'] !== '') ? floatval($_POST['pressupost']) : 0.0;
$empresa_id = (isset($_POST['empresa_id']) && $_POST['empresa_id'] !== '') ? intval($_POST['empresa_id']) : null;

// Checkboxes (si no vÃ©nen, Ã©s 'N')
$rebut_solicitud = isset($_POST['rebut_solicitud']) ? 'S' : 'N';
$rebut_3_pressupost = isset($_POST['rebut_3_pressupost']) ? 'S' : 'N';
$pressuposts_correctes = isset($_POST['pressuposts_correctes']) ? 'S' : 'N';
$annex1_memoria_redactats = isset($_POST['annex1_memoria_redactats']) ? 'S' : 'N';
$annex1_memoria_enviat_firma = isset($_POST['annex1_memoria_enviat_firma']) ? 'S' : 'N';
$annex1_memoria_firmats = isset($_POST['annex1_memoria_firmats']) ? 'S' : 'N';
$annex1_memoria_enviat_uge = isset($_POST['annex1_memoria_enviat_uge']) ? 'S' : 'N';
$rebut_annex2 = isset($_POST['rebut_annex2']) ? 'S' : 'N';
$enviat_annex2_inici_actuacions_centre = isset($_POST['enviat_annex2_inici_actuacions_centre']) ? 'S' : 'N';
$rebut_dades_bancaries = isset($_POST['rebut_dades_bancaries']) ? 'S' : 'N';
$enviat_dades_banc_uge = isset($_POST['enviat_dades_banc_uge']) ? 'S' : 'N';
$rebut_notificacio_factura = isset($_POST['rebut_notificacio_factura']) ? 'S' : 'N';
$conformitat_centre = isset($_POST['conformitat_centre']) ? 'S' : 'N';
$factura_conformada = isset($_POST['factura_conformada']) ? 'S' : 'N';
$enviat_annex3_uge = isset($_POST['enviat_annex3_uge']) ? 'S' : 'N';

$tornar = 'contracteMenorListFiltro.php';

if ($id) {
    $sql = "UPDATE contracte_menor SET
                data=?,
                actuacio=?,
                descripcio=?,
                pressupost=?,
                rebut_solicitud=?,
                rebut_3_pressupost=?,
                pressuposts_correctes=?,
                annex1_memoria_redactats=?,
                annex1_memoria_enviat_firma=?,
                annex1_memoria_firmats=?,
                annex1_memoria_enviat_uge=?,
                rebut_annex2=?,
                enviat_annex2_inici_actuacions_centre=?,
                rebut_dades_bancaries=?,
                enviat_dades_banc_uge=?,
                rebut_notificacio_factura=?,
                conformitat_centre=?,
                factura_conformada=?,
                enviat_annex3_uge=?,
                empresa_id=?
            WHERE id=?";

    $stmt = $connexio->prepare($sql);
    if (!$stmt) die('Prepare failed: '.$connexio->error);

    // types: data(s) actuacio(s) descripcio(s) pressupost(d) + 15 flags(s) + empresa_id(i) + id(i)
    $types = 'sssd' . str_repeat('s', 15) . 'ii';
    $stmt->bind_param(
        $types,
        $data,
        $actuacio,
        $descripcio,
        $pressupost,
        $rebut_solicitud,
        $rebut_3_pressupost,
        $pressuposts_correctes,
        $annex1_memoria_redactats,
        $annex1_memoria_enviat_firma,
        $annex1_memoria_firmats,
        $annex1_memoria_enviat_uge,
        $rebut_annex2,
        $enviat_annex2_inici_actuacions_centre,
        $rebut_dades_bancaries,
        $enviat_dades_banc_uge,
        $rebut_notificacio_factura,
        $conformitat_centre,
        $factura_conformada,
        $enviat_annex3_uge,
        $empresa_id,
        $id
    );

} else {
    if ($centre_id === null) die('Falta el centre_id.');

    $sql = "INSERT INTO contracte_menor
                (codi, data, centre_id, actuacio, descripcio, pressupost,
                 rebut_solicitud, rebut_3_pressupost, pressuposts_correctes,
                 annex1_memoria_redactats, annex1_memoria_enviat_firma, annex1_memoria_firmats, annex1_memoria_enviat_uge,
                 rebut_annex2, enviat_annex2_inici_actuacions_centre,
                 rebut_dades_bancaries, enviat_dades_banc_uge, rebut_notificacio_factura,
                 conformitat_centre, factura_conformada, enviat_annex3_uge,
                 empresa_id)
            VALUES
                (?, ?, ?, ?, ?, ?,
                 ?, ?, ?,
                 ?, ?, ?, ?,
                 ?, ?,
                 ?, ?, ?,
                 ?, ?, ?,
                 ?)";

    $stmt = $connexio->prepare($sql);
    if (!$stmt) die('Prepare failed: '.$connexio->error);

    // codi(s) data(s) centre_id(i) actuacio(s) descripcio(s) pressupost(d) + 15 flags(s) + empresa_id(i)
    $types = 'ssissd' . str_repeat('s', 15) . 'i';
    $stmt->bind_param(
        $types,
        $codi,
        $data,
        $centre_id,
        $actuacio,
        $descripcio,
        $pressupost,
        $rebut_solicitud,
        $rebut_3_pressupost,
        $pressuposts_correctes,
        $annex1_memoria_redactats,
        $annex1_memoria_enviat_firma,
        $annex1_memoria_firmats,
        $annex1_memoria_enviat_uge,
        $rebut_annex2,
        $enviat_annex2_inici_actuacions_centre,
        $rebut_dades_bancaries,
        $enviat_dades_banc_uge,
        $rebut_notificacio_factura,
        $conformitat_centre,
        $factura_conformada,
        $enviat_annex3_uge,
        $empresa_id
    );
}

if ($stmt->execute()) {
    header("Location: $tornar");
    exit();
} else {
    echo 'Error: ' . $stmt->error;
}

$stmt->close();
$connexio->close();
?>
