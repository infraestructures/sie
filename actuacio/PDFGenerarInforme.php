<?php
require_once('../TCPDF/tcpdf.php');
include '../connectarBD.php';

$municipiID = isset($_POST['municipi_filtre']) ? intval($_POST['municipi_filtre']) : 0;
$centreID = isset($_POST['centre_filtre']) ? intval($_POST['centre_filtre']) : 0;

$filtreMunicipi = $municipiID ? "AND c.id_municipi = $municipiID" : "";
$filtreCentre = $centreID ? "AND c.id = $centreID" : "";

$query = "
    SELECT 
        c.Centre AS nom_centre,
        a.codi,
        a.descripcio,
        a.data_entrada,
        a.pressupost,
        e.nom AS nom_estat,
        t.nom AS nom_tecnic
    FROM actuacions a
    INNER JOIN centres c ON c.id = a.centre_id
    LEFT JOIN estat_actuacio e ON e.id = a.estat_id
    LEFT JOIN tecnic t ON t.id = a.tecnic_id
    WHERE 1=1 $filtreMunicipi $filtreCentre
    ORDER BY c.Centre, a.data_entrada
";

$result = $connexio->query($query);
if (!$result) {
    die('Error: ' . $connexio->error);
}

$centres = [];
while ($row = $result->fetch_assoc()) {
    $centres[$row['nom_centre']][] = $row;
}

// Crear PDF
$pdf = new TCPDF();
$pdf->setPrintHeader(false);
$pdf->SetMargins(15, 20, 15);
$pdf->AddPage();
$pdf->SetFont('helvetica', '', 10);

// Logo
$pdf->Image('../imagenes/sade.png', 15, 10, 50);
$pdf->Ln(25);

foreach ($centres as $nomCentre => $actuacions) {
    $pdf->SetFont('', 'B', 12);
    $pdf->Cell(0, 10, "Centre: $nomCentre", 0, 1, 'L');
    $pdf->Ln(2);
    $pdf->SetLineWidth(0.2);

    // Capçalera taula
    $pdf->SetFont('', 'B', 10);
    $pdf->SetFillColor(230, 230, 230);
    $pdf->Cell(18, 7, 'Codi', 1, 0, 'C', 1);
    $pdf->Cell(60, 7, 'Descripció', 1, 0, 'C', 1);
    $pdf->Cell(30, 7, 'Estat', 1, 0, 'C', 1);
    $pdf->Cell(25, 7, 'Data inici', 1, 0, 'C', 1);
    $pdf->Cell(25, 7, 'Tècnic', 1, 0, 'C', 1);
    $pdf->Cell(25, 7, 'Pressupost', 1, 1, 'C', 1);
    $pdf->SetFont('', '', 10);

    foreach ($actuacions as $act) {
        $colWidths = [18, 60, 30, 25, 25, 25];
        $x = $pdf->GetX();
        $y = $pdf->GetY();

        $hCodi = $pdf->getStringHeight($colWidths[0], $act['codi'] ?? '');
        $hDesc = $pdf->getStringHeight($colWidths[1], $act['descripcio'] ?? '');
        $hEstat = $pdf->getStringHeight($colWidths[2], $act['nom_estat'] ?? '');
        $hData = $pdf->getStringHeight($colWidths[3], $act['data_entrada'] ?? '');
        $hTecnic = $pdf->getStringHeight($colWidths[4], $act['nom_tecnic'] ?? '');
        $hPress = $pdf->getStringHeight($colWidths[5], number_format($act['pressupost'] ?? 0, 2, ',', '.') . " €");
        $maxHeight = max($hCodi, $hDesc, $hEstat, $hData, $hTecnic, $hPress);
        if ($pdf->GetY() + $maxHeight > $pdf->getPageHeight() - $pdf->getBreakMargin()) {
            $pdf->AddPage();
        }

        $pdf->MultiCell($colWidths[0], $maxHeight, $act['codi'] ?? '', 1, 'L', 0, 0, $x, $y);
        $x += $colWidths[0];
        $pdf->MultiCell($colWidths[1], $maxHeight, $act['descripcio'] ?? '', 1, 'L', 0, 0, $x, $y);
        $x += $colWidths[1];
        $pdf->MultiCell($colWidths[2], $maxHeight, $act['nom_estat'] ?? '', 1, 'L', 0, 0, $x, $y);
        $x += $colWidths[2];
        $pdf->MultiCell($colWidths[3], $maxHeight, $act['data_entrada'] ?? '', 1, 'L', 0, 0, $x, $y);
        $x += $colWidths[3];
        $pdf->MultiCell($colWidths[4], $maxHeight, $act['nom_tecnic'] ?? '', 1, 'L', 0, 0, $x, $y);
        $x += $colWidths[4];
        $pdf->MultiCell($colWidths[5], $maxHeight, number_format($act['pressupost'] ?? 0, 2, ',', '.') . " €", 1, 'R', 0, 0, $x, $y);

        $pdf->SetXY(15, $y + $maxHeight);
    }

    $pdf->Ln(6);
}

$pdf->Output('Actuacions.pdf', 'I');
?>
