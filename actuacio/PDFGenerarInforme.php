<?php
require_once('../TCPDF/tcpdf.php');
include '../connectarBD.php';

class MYPDF extends TCPDF
{
    public function Header()
    {
        $this->Image('../imagenes/sade.png', 15, 10, 50);
        if ($this->PageNo() === 1) {
            $this->SetY(35);
            $this->SetFont('helvetica', 'B', 14);
            $this->Cell(0, 10, "LLISTAT D'ACTUACIONS A CENTRES EDUCATIUS", 0, 1, 'C');
        }
        $this->SetY(45); // marca l'inici real del contingut
    }

    public function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('helvetica', 'I', 8);
        $this->Cell(0, 10, 'Pàgina ' . $this->getAliasNumPage() . ' de ' . $this->getAliasNbPages() . ' | ' . date('d/m/Y'), 0, false, 'C');
    }
}

$illaID = isset($_POST['illa_filtre']) ? intval($_POST['illa_filtre']) : 0;
$municipiID = isset($_POST['municipi_filtre']) ? intval($_POST['municipi_filtre']) : 0;
$centreID = isset($_POST['centre_filtre']) ? intval($_POST['centre_filtre']) : 0;

$filtreMunicipi = $municipiID ? "AND c.id_municipi = $municipiID" : "";
$filtreCentre = $centreID ? "AND c.id = $centreID" : "";
$filtreIlla = $illaID ? "AND c.id_illa = $illaID" : "";

$query = "
    SELECT 
        c.Centre AS nom_centre,
        a.codi,
        a.descripcio,
        a.data_entrada,
        a.pressupost,
        e.nom AS nom_estat,
        t.nom AS nom_tecnic
    FROM centres c
    INNER JOIN actuacions a ON c.id = a.centre_id
    LEFT JOIN estat_actuacio e ON e.id = a.estat_id
    LEFT JOIN tecnic t ON t.id = a.tecnic_id
    WHERE 1=1 $filtreMunicipi $filtreCentre $filtreIlla
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

$pdf = new MYPDF();
$pdf->SetMargins(15, 45, 15);
$pdf->SetAutoPageBreak(true, 20);
$pdf->AddPage();
$pdf->SetFont('helvetica', '', 10);

foreach ($centres as $nomCentre => $actuacions) {
    $minRowHeight = 10;
    $espaiBlocCentre = 10 + 7 + $minRowHeight;
    if ($pdf->GetY() + $espaiBlocCentre > $pdf->getPageHeight() - $pdf->getBreakMargin()) {
        $pdf->AddPage();
    }

    $pdf->SetFont('', 'B', 12);
    $pdf->Cell(0, 10, "Centre: $nomCentre", 0, 1, 'L');
    $pdf->Ln(2);

    $pdf->SetLineWidth(0.2);
    $pdf->SetFont('', 'B', 10);
    $pdf->SetFillColor(230, 230, 230);
    $pdf->Cell(25, 7, 'Codi', 1, 0, 'C', 1);
    $pdf->Cell(50, 7, 'Descripció', 1, 0, 'C', 1);
    $pdf->Cell(20, 7, 'Estat', 1, 0, 'C', 1);
    $pdf->Cell(25, 7, 'Data inici', 1, 0, 'C', 1);
    $pdf->Cell(30, 7, 'Tècnic', 1, 0, 'C', 1);
    $pdf->Cell(25, 7, 'Pressupost', 1, 1, 'C', 1);
    $pdf->SetFont('', '', 10);

    foreach ($actuacions as $act) {
        $colWidths = [25, 50, 20, 25, 30, 25];
        $hCodi = $pdf->getStringHeight($colWidths[0], $act['codi'] ?? '');
        $hDesc = $pdf->getStringHeight($colWidths[1], $act['descripcio'] ?? '');
        $hEstat = $pdf->getStringHeight($colWidths[2], $act['nom_estat'] ?? '');
        $hData = $pdf->getStringHeight($colWidths[3], $act['data_entrada'] ?? '');
        $hTecnic = $pdf->getStringHeight($colWidths[4], $act['nom_tecnic'] ?? '');
        $hPress = $pdf->getStringHeight($colWidths[5], number_format($act['pressupost'] ?? 0, 2, ',', '.') . ' €');
        $maxHeight = max($hCodi, $hDesc, $hEstat, $hData, $hTecnic, $hPress);

        if ($pdf->GetY() + $maxHeight > $pdf->getPageHeight() - $pdf->getBreakMargin()) {
            $pdf->AddPage();
            $pdf->SetFont('', 'B', 10);
            $pdf->SetFillColor(230, 230, 230);
            $pdf->Cell(25, 7, 'Codi', 1, 0, 'C', 1);
            $pdf->Cell(50, 7, 'Descripció', 1, 0, 'C', 1);
            $pdf->Cell(20, 7, 'Estat', 1, 0, 'C', 1);
            $pdf->Cell(25, 7, 'Data inici', 1, 0, 'C', 1);
            $pdf->Cell(30, 7, 'Tècnic', 1, 0, 'C', 1);
            $pdf->Cell(25, 7, 'Pressupost', 1, 1, 'C', 1);
            $pdf->SetFont('', '', 10);
        }

        $x = $pdf->GetX();
        $y = $pdf->GetY();
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
        $pdf->MultiCell($colWidths[5], $maxHeight, number_format($act['pressupost'] ?? 0, 2, ',', '.') . ' €', 1, 'R', 0, 0, $x, $y);
        $pdf->SetXY(15, $y + $maxHeight);
    }

    $pdf->Ln(3);
    $totalPressupost = array_sum(array_map(function ($a) {
        return floatval($a['pressupost'] ?? 0);
    }, $actuacions));
    $pdf->SetFont('', 'B', 10);
    $pdf->Cell(150, 7, 'Total pressupost del centre', 1, 0, 'R');
    $pdf->Cell(25, 7, number_format($totalPressupost, 2, ',', '.') . ' €', 1, 1, 'R');
    $pdf->Ln(6);
}

$totalGeneral = 0;
foreach ($centres as $actuacions) {
    $totalGeneral += array_sum(array_map(function ($a) {
        return floatval($a['pressupost'] ?? 0);
    }, $actuacions));
}
$pdf->SetFont('', 'B', 11);
$pdf->Cell(150, 10, 'TOTAL GENERAL', 1, 0, 'R');
$pdf->Cell(25, 10, number_format($totalGeneral, 2, ',', '.') . ' €', 1, 1, 'R');

$pdf->Output('Actuacions.pdf', 'I');
?>
