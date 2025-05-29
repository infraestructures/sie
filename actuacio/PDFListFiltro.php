<?php
include '../connectarBD.php';

// Consultar illes
$illasQuery = "SELECT id, nom FROM Illa ORDER BY nom";
$illasResult = $connexio->query($illasQuery);
?>

<html>
<head>
    <meta charset="UTF-8">
    <title>Gestió d'actuacions</title>
    <link rel="stylesheet" href="../css/estilos.css" type="text/css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <form name="informe" method="post" action="PDFGenerarInforme.php" target="_blank">
        <label for="illa_filtre" class="formularioFiltro">Illa:</label>
        <select id="illa_filtre" name="illa_filtre" class="campoFicha_Blanca">
            <option value="">Selecciona una illa</option>
            <?php while ($row = $illasResult->fetch_assoc()): ?>
                <option value="<?= $row['id'] ?>"><?= $row['nom'] ?></option>
            <?php endwhile; ?>
        </select>

        <label for="municipi_filtre" class="formularioFiltro">Municipi:</label>
        <select id="municipi_filtre" name="municipi_filtre" class="campoFicha_Blanca">
            <option value="">Selecciona un municipi</option>
        </select>

        <label for="centre_filtre" class="formularioFiltro">Centre:</label>
        <select id="centre_filtre" name="centre_filtre" class="campoFicha_Blanca">
            <option value="">Selecciona un centre</option>
        </select>
        <button type="submit" class="boton">Generar informe</button>
    </form>

    <script>
        $(document).ready(function() {
            $('#illa_filtre').change(function() {
                var illaID = $(this).val();
                $.post('getMunicipisInforme.php', { illa: illaID }, function(data) {
                    $('#municipi_filtre').html(data);
                    $('#centre_filtre').html('<option value="">Selecciona un centre</option>');
                });
            });

            $('#municipi_filtre').change(function() {
                var municipiID = $(this).val();
                $.post('getCentres.php', { municipi: municipiID }, function(data) {
                    $('#centre_filtre').html(data);
                });
            });
        });
    </script>
</body>
</html>