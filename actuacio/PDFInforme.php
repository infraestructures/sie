<?php
include '../connectarBD.php';

// Consultar datos para los desplegables
$illasQuery = "SELECT id, nom FROM Illa ORDER BY nom";
$illasResult = $connexio->query($illasQuery);

$municipisQuery = $illafiltre
    ? "SELECT DISTINCT id, nom FROM Municipi WHERE illa_id = $illafiltre ORDER BY nom"
    : "SELECT id, nom FROM Municipi ORDER BY nom";
$municipisResult = $connexio->query($municipisQuery);

$centresQuery = "SELECT 
                    c.id, 
                    c.Centre 
                FROM centres c 
                INNER JOIN actuacions a ON c.id = a.centre_id
                WHERE municipi_id = $municipiFiltre
                ORDER BY Centre";
$centresResult = $connexio->query($centresQuery);
?>

<html>

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestió d'actuacions</title>

    <link rel="stylesheet" href="../css/estilos.css" type="text/css" />
    <script src="../js/utiles.js" type="" language="JavaScript"></script>
    <script src="../js/especificas.js" type="" language="JavaScript"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#illa_filtre').change(function() {
                var illaID = $(this).val();
                console.log("Illa seleccionada:", illaID); 
                $.ajax({
                    type: 'POST',
                    url: 'getMunicipis.php',
                    data: { illa: illaID },
                    success: function(response) {
                        console.log("Resposta AJAX:", response); // DEBUG
                        $('#municipi_filtre').html(response);
                        $('#centre_filtre').html('<option value="">Selecciona un centre</option>');
                    },
                    error: function(xhr, status, error) {
                        console.error("Error en AJAX:", error);
                    }
                });
            });

            $('#municipi_filtre').change(function() {
                var municipiID = $(this).val();
                console.log("Municipi seleccionat:", municipiID);
                $.ajax({
                    type: 'POST',
                    url: 'getCentres.php',
                    data: { municipi: municipiID },
                    success: function(response) {
                        $('#centre_filtre').html(response);
                    },
                    error: function(xhr, status, error) {
                        console.error("Error en AJAX:", error);
                    }
                });
            });  
        });

    </script>  
</head>

<body class="contenido" onload="ocultarFondoPrincipal();">
    <div class="contenedorfiltre">
  <h2>Gestió d'actuacions</h2>
    <form method="POST" action="PDFInforme.php">
        <table cellpadding="0" cellspacing="0" class="cajafiltre">
            <tr>    
                <td class="contenedorCamposfiltre">
                    <div class="filtre">
                        <label for="centre_filtre" class="formulariofiltre">Centre:</label>
                        <input type="text" name="centre_filtre" value="<?= htmlspecialchars($centrefiltre) ?>">            
                        <label for="illa_filtre" class="formulariofiltre">Illa:</label>
                        <select id="illa_filtre" name="illa_filtre" class="campoFicha_Blanca">
                            <option value="">Seleccioni una illa</option>
                            <?php while ($row = $illasResult->fetch_assoc()): ?>
                                <option value="<?= $row['id'] ?>" <?= $row['id'] == $illafiltre ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($row['nom']) ?>
                                </option>
                            <?php endwhile; ?>
                        </select>

                        <label for="municipi_filtre" class="formulariofiltre">Municipi:</label>
                        <select id="municipi_filtre" name="municipi_filtre" class="campoFicha_Blanca">
                            <option value="">Seleccioni un municipi</option>
                            <?php while ($row = $municipisResult->fetch_assoc()): ?>
                                <option value="<?= $row['id'] ?>" <?= $row['id'] == $municipiFiltre ? 'selected' : '' ?>>
                                    <?= htmlspecialchars($row['nom']) ?>
                                </option>
                            <?php endwhile; ?>
                        </select>  

                        <label for="centre_filtre">Centre:</label>
                        <select name="centre_filtre" id="centre_filtre">
                            <option value="">-- Selecciona un centre --</option>
                            <?php
                            if ($municipiFiltre) {
                                while ($row = mysqli_fetch_assoc($result)) {
                                    $selected = ($centrefiltre == $row['id']) ? 'selected' : '';
                                    echo "<option value='{$row['id']}' $selected>{$row['nom']}</option>";
                                }
                            }
                            ?>
                        </select>
                        <button type="submit" class="boton">Cercar</button>                  
                    </div>                                          
                </td>
            </tr>
        </table>
    </form>
    <ul class="botoneraListado">
        <li class="tituloListado">LLISTAT D'ACTUACIONS</li>
        <li class="fondoBotoneraListado">
            <input type="button" class="boton" value="Nova actuació" onclick="location.href='actuacioForm.php';">
        </li>
    </ul>
<form method="GET" action="generar_pdf.php">
    <label for="municipi">Municipi:</label>
    <select name="municipi" id="municipi">
        <option value="">-- Tots --</option>
        <?php while ($row = $municipis->fetch_assoc()): ?>
            <option value="<?= htmlspecialchars($row['municipi']) ?>"><?= htmlspecialchars($row['municipi']) ?></option>
        <?php endwhile; ?>
    </select>

    <label for="centre">Centre:</label>
    <select name="centre" id="centre">
        <option value="">-- Tots --</option>
        <?php while ($row = $centres->fetch_assoc()): ?>
            <option value="<?= $row['id'] ?>"><?= htmlspecialchars($row['nom_centre']) ?></option>
        <?php endwhile; ?>
    </select>

    <button type="submit">Generar PDF</button>
</form>

</body>

</html>
<?php
// Tancar la connexió
$connexio->close(); ?>

