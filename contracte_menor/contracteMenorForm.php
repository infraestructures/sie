<!DOCTYPE html>
<?php
include '../connectarBD.php';

$id = $_GET['id'] ?? null;
$id_illa = $_GET['illa'] ?? '';
$id_municipi = $_GET['municipi'] ?? '';
$fechaActual = date('Y-m-d');

$empresa_id = isset($_POST['empresa_id']) ? (int) $_POST['empresa_id'] : 0;
$errors = [];
if ($empresa_id <= 0) {
    $errors[] = "Has de seleccionar o crear una empresa adjudicatària.";
}

$cm = [
    'id'=>'', 'codi'=>'', 'data'=>$fechaActual, 'centre_id'=>'', 'actuacio'=>'', 'descripcio'=>'', 'pressupost'=>'', 'empresa_id'=>'',
    'nom_illa'=>'', 'nom_municipi'=>'', 'nom_centre'=>'', 'Localitat'=>'',
    'rebut_solicitud'=>'N','rebut_3_pressupost'=>'N','pressuposts_correctes'=>'N','annex1_memoria_redactats'=>'N','annex1_memoria_enviat_firma'=>'N',
    'annex1_memoria_firmats'=>'N','annex1_memoria_enviat_uge'=>'N','rebut_annex2'=>'N','enviat_annex2_inici_actuacions_centre'=>'N','rebut_dades_bancaries'=>'N',
    'enviat_dades_banc_uge'=>'N','rebut_notificacio_factura'=>'N','conformitat_centre'=>'N','factura_conformada'=>'N','enviat_annex3_uge'=>'N'
];

if ($id) {
    $sql = "SELECT cm.*,
               c.id_illa, c.id_municipi, c.Centre AS nom_centre, c.Localitat,
               i.nom AS nom_illa, m.nom AS nom_municipi,
               e.nom AS empresa_nom, e.cif AS empresa_cif
        FROM contracte_menor cm
        JOIN centres c ON cm.centre_id = c.id
        LEFT JOIN illa i ON c.id_illa = i.id
        LEFT JOIN municipi m ON c.id_municipi = m.id
        LEFT JOIN empresa e ON cm.empresa_id = e.id
        WHERE cm.id = ?";

    $stmt = $connexio->prepare($sql);
    if (!$stmt) die('Error SQL: '.$connexio->error);
    $idInt = intval($id);
    $stmt->bind_param('i', $idInt);
    $stmt->execute();
    $row = $stmt->get_result()->fetch_assoc();
    if ($row) $cm = array_merge($cm, $row);
}

$result_illes = $connexio->query("SELECT id, nom FROM illa ORDER BY nom");
$municipisQuery = $id_illa ? "SELECT id, nom FROM municipi WHERE illa_id=".intval($id_illa)." ORDER BY nom" : "SELECT id, nom FROM municipi ORDER BY nom";
$illes = [];
if ($result_illes) {
    while ($r = $result_illes->fetch_assoc()) {
        $illes[] = $r;
    }
}
if (!$result_illes)
    die("Error llegint illes: " . $connexio->error);

// Municipis per a la modal "Nova empresa" (tots, amb illa_id)
$municipisAll = [];
$resAll = $connexio->query("SELECT id, nom, illa_id FROM municipi ORDER BY nom");
if ($resAll) {
    while ($r = $resAll->fetch_assoc())
        $municipisAll[] = $r;
}

$result_municipis = $connexio->query($municipisQuery);
$result_empreses = $connexio->query("SELECT id, nom FROM empresa ORDER BY nom");

$nomCentre = ($cm['nom_centre'] ?? '').((isset($cm['Localitat']) && $cm['Localitat']) ? ('-'.$cm['Localitat']) : '');
$centreId = $cm['centre_id'] ?? '';
$tornar = 'contracteMenorListFiltro.php';

function checkedSN($v){ return ($v === 'S') ? 'checked' : ''; }

?>
<html>
<head>
    <title>Fitxa de contracte menor</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="../css/estilos.css" type="text/css" />
    <link rel="stylesheet" href="../css/estilos_ficha_2.css" type="text/css" />
    <script>
      window.__MUNICIPIS_ALL = <?= json_encode($municipisAll, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES) ?>;
    </script>

    <script src="../js/utiles.js" language="javascript"></script>
    <script src="../js/especificas.js" language="javascript"></script>
    <script src="../js/empresaAdjudicataria.js" defer></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#illa').change(function() {
                var illaID = $(this).val();
                $.ajax({
                    type: 'POST',
                    url: 'getMunicipis.php',
                    data: { illa: illaID },
                    success: function(response) {
                        $('#municipi').html(response);
                        $('#centre').html('<option value="">Selecciona un centre</option>');
                        $('#centre_id').val('');
                    }
                });
            });

            $('#municipi').change(function() {
                var municipiID = $(this).val();
                $.ajax({
                    type: 'POST',
                    url: 'getCentres.php',
                    data: { municipi: municipiID },
                    success: function(response) {
                        $('#centre').html(response);
                    }
                });
            });
        });

        function actualitzaCentreId() {
            const select = document.getElementById('centre');
            document.getElementById('centre_id').value = select.value;
        }

        function obrirCentre() {
            const codiCentre = document.getElementById('centre_id').value;
            if (!codiCentre) { alert('Selecciona un centre.'); return; }
            const url = `../centre/centreForm.php?id=${encodeURIComponent(codiCentre)}`;
            window.open(url, 'Centre', 'width=800,height=600,scrollbars=yes,resizable=yes');
        }
    </script>
</head>

<body class="contenido" onload="ocultarFondoPrincipal();">

    <div class="contenedorFiltro"></div>

    <ul class="botoneraFicha">
        <li class="tituloFicha"><p class="posicionTituloFicha">FITXA DE CONTRACTE MENOR</p></li>
    </ul>

    <div class="espacioMarron">&nbsp;</div>

    <div id="fichaEditable" style="background-color:#ffffff;">
        <div class="cabeceraFicha"></div>

        <form name="entidad" method="post" action="contracteMenorInsertUpdate.php">
            <div class="contenedorFicha">

                <div class="tituloSeccion"><p class="textoTituloSeccion">Dades generals</p></div>

                <input type="hidden" name="id" value="<?php echo htmlspecialchars($id ?? ''); ?>">
                <input type="hidden" id="centre_id" name="centre_id" value="<?php echo htmlspecialchars($centreId); ?>">

                <table>
                    <tr>
                        <td>
                            <label class="campoFicha_Blanca">Codi:</label>
                            <input type="text" id="codi" name="codi" class="formularioFicha" value="<?= htmlspecialchars($cm['codi']) ?>" <?= $id ? 'disabled' : '' ?>>
                            <br><br>
                        </td>
                        <td>
                            <label class="campoFicha_Blanca">Data:</label>
                            <input type="date" id="data" name="data" class="formularioFicha" value="<?= htmlspecialchars(date('Y-m-d', strtotime($cm['data']))) ?>">
                            <br><br>
                        </td>
                        <td>
                            <label class="campoFicha_Blanca">Pressupost:</label>
                            <input type="number" step="0.01" id="pressupost" name="pressupost" class="formularioFicha" value="<?= htmlspecialchars($cm['pressupost']) ?>">
                            <br><br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label class="campoFicha_Blanca">Illa:</label>
                            <?php if ($id): ?>
                                <input type="text" value="<?= htmlspecialchars($cm['nom_illa'] ?? '') ?>" readonly>
                            <?php else: ?>
                                <select name="illa" id="illa" class="campoFicha_Blanca" required>
                                    <option value="">Selecciona una illa</option>
                                    <?php foreach (($illes ?? []) as $row): ?>
                                      <option value="<?= (int) $row['id'] ?>" <?= ((string) $row['id'] === (string) $id_illa) ? 'selected' : '' ?>>
                                        <?= htmlspecialchars($row['nom']) ?>
                                      </option>
                                    <?php endforeach; ?>

                                </select>
                            <?php endif; ?>
                        </td>

                        <td>
                            <label class="campoFicha_Blanca">Municipi:</label>
                            <?php if ($id): ?>
                                <input type="text" value="<?= htmlspecialchars($cm['nom_municipi'] ?? '') ?>" readonly>
                            <?php else: ?>
                                <select id="municipi" name="municipi" class="campoFicha_Blanca" required>
                                    <option value="">Selecciona un municipi</option>
                                    <?php while ($row = $result_municipis->fetch_assoc()): ?>
                                        <option value="<?= $row['id'] ?>" <?= $row['id'] == $id_municipi ? 'selected' : '' ?>><?= htmlspecialchars($row['nom']) ?></option>
                                    <?php endwhile; ?>
                                </select>
                            <?php endif; ?>
                        </td>

                        <td colspan="2">
                            <label class="campoFicha_Blanca">Centre:</label>
                            <?php if ($id): ?>
                                <input type="text" value="<?= htmlspecialchars($nomCentre) ?>" readonly>
                            <?php else: ?>
                                <select id="centre" name="centre" class="campoFicha_Blanca" onchange="actualitzaCentreId()" required>
                                    <option value="">Selecciona un centre</option>
                                </select>
                            <?php endif; ?>
                            <button type="button" onclick="obrirCentre()">Veure centre</button>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="3">
                            <label class="campoFicha_Blanca">Actuació:</label>
                            <input type="text" id="actuacio" name="actuacio" class="formularioFicha" value="<?= htmlspecialchars($cm['actuacio']) ?>">
                            <br><br>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <label class="campoFicha_Blanca">Descripció:</label><br>
                            <textarea id="descripcio" name="descripcio" rows="6" style="width:98%;"><?= htmlspecialchars($cm['descripcio'] ?? '') ?></textarea>
                        </td>
                    </tr>
                </table>

                <div class="tituloSeccion">
                    <p class="textoTituloSeccion">Seguiment del tràmit</p>
                </div>

                <table width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="rebut_solicitud" value="S" <?= checkedSN($cm['rebut_solicitud']) ?>>
                            <span class="textoCheck">Rebut sol·licitud</span>
                        </td>

                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="rebut_3_pressupost" value="S" <?= checkedSN($cm['rebut_3_pressupost']) ?>>
                            <span class="textoCheck">Rebut 3 pressuposts</span>
                        </td>

                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="pressuposts_correctes" value="S" <?= checkedSN($cm['pressuposts_correctes']) ?>>
                            <span class="textoCheck">Pressuposts correctes</span>
                        </td>

                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="annex1_memoria_redactats" value="S" <?= checkedSN($cm['annex1_memoria_redactats']) ?>>
                            <span class="textoCheck">Annex1/Memòria redactats</span>
                        </td>
                    </tr>

                    <tr>
                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="annex1_memoria_enviat_firma" value="S" <?= checkedSN($cm['annex1_memoria_enviat_firma']) ?>>
                            <span class="textoCheck">Annex1/Memòria enviat a firma</span>
                        </td>

                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="annex1_memoria_firmats" value="S" <?= checkedSN($cm['annex1_memoria_firmats']) ?>>
                            <span class="textoCheck">Annex1/Memòria firmats</span>
                        </td>

                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="annex1_memoria_enviat_uge" value="S" <?= checkedSN($cm['annex1_memoria_enviat_uge']) ?>>
                            <span class="textoCheck">Annex1/Memòria enviat UGE</span>
                        </td>

                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="rebut_annex2" value="S" <?= checkedSN($cm['rebut_annex2']) ?>>
                            <span class="textoCheck">Rebut Annex2</span>
                        </td>
                    </tr>

                    <tr>
                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="enviat_annex2_inici_actuacions_centre" value="S" <?= checkedSN($cm['enviat_annex2_inici_actuacions_centre']) ?>>
                            <span class="textoCheck">Enviat Annex2 inici actuacions</span>
                        </td>

                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="rebut_dades_bancaries" value="S" <?= checkedSN($cm['rebut_dades_bancaries']) ?>>
                            <span class="textoCheck">Rebut dades bancàries</span>
                        </td>

                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="enviat_dades_banc_uge" value="S" <?= checkedSN($cm['enviat_dades_banc_uge']) ?>>
                            <span class="textoCheck">Enviat dades banc UGE</span>
                        </td>

                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="rebut_notificacio_factura" value="S" <?= checkedSN($cm['rebut_notificacio_factura']) ?>>
                            <span class="textoCheck">Rebut notificació factura</span>
                        </td>
                    </tr>

                    <tr>
                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="conformitat_centre" value="S" <?= checkedSN($cm['conformitat_centre']) ?>>
                            <span class="textoCheck">Conformitat centre</span>
                        </td>

                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="factura_conformada" value="S" <?= checkedSN($cm['factura_conformada']) ?>>
                            <span class="textoCheck">Factura conformada</span>
                        </td>

                        <td class="campoFicha_Blanca">
                            <input type="checkbox" name="enviat_annex3_uge" value="S" <?= checkedSN($cm['enviat_annex3_uge']) ?>>
                            <span class="textoCheck">Enviat Annex3 UGE</span>
                        </td>

                        <td class="campoFicha_Blanca">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="campoFicha_Blanca"><br><br>
                            <!-- EMPRESA ADJUDICATÀRIA -->
                            <div class="form-group">
                                <div class="tituloSeccion">
                                <p class="textoTituloSeccion">Emprea adjudicatària</p>
                            </div>

                              <!-- id_empresa és el que desaràs a contracte_menor -->
                              <input type="hidden" name="empresa_id" id="empresa_id" value="<?= isset($cm['empresa_id']) ? (int) $cm['empresa_id'] : '' ?>">

                              <div style="display:flex; gap:8px; align-items:flex-start; flex-wrap:wrap;">
                                <div style="flex: 1 1 380px; min-width:260px;">
                                  <input
                                    type="text"
                                    id="empresa_search"
                                    class="form-control"
                                    placeholder="Cerca per nom o CIF…"
                                    autocomplete="off"
                                  >
                                  <div id="empresa_results" class="empresa-results" style="margin-top:6px;"></div>

                                  <small class="text-muted">
                                    Escriu almenys 2 caràcters. Selecciona una empresa del llistat.
                                  </small>
                                </div>

                                <div>
                                  <button type="button" id="btn_nova_empresa" class="btn btn-secondary">
                                    + Nova empresa
                                  </button>
                                  <button type="button" id="btn_neteja_empresa" class="btn btn-light" style="margin-left:6px;">
                                    Neteja
                                  </button>
                                </div>
                              </div>

                              <div id="empresa_seleccionada"
                                 class="empresa-selected"
                                 style="display: <?php echo !empty($cm['empresa_id']) ? 'block' : 'none'; ?>;">
                              <strong>Empresa seleccionada:</strong>
                              <?php echo htmlspecialchars($cm['empresa_nom'] ?? ''); ?>

                              <div class="empresa-meta">
                                CIF: <?php echo htmlspecialchars($cm['empresa_cif'] ?? ''); ?>
                              </div>
                            </div>

                            </div>

                            <!-- MODAL/CAIXA "NOVA EMPRESA" (sense framework) -->
                            <div id="nova_empresa_box" class="nova-empresa-box" style="display:none; margin-top:10px;">
                              <h5 style="margin-top:0;">Nova empresa</h5>

                              <div class="nova-empresa-grid">
                                <label for="nova_nom">Nom</label>
                                <input type="text" id="nova_nom" maxlength="255">

                                <label for="nova_cif">CIF</label>
                                <input type="text" id="nova_cif" maxlength="15">

                                <label for="nova_adreca">Adreça</label>
                                <input type="text" id="nova_adreca" maxlength="255">

                                <label for="nova_codi_postal">Codi postal</label>
                                <input type="text" id="nova_codi_postal" maxlength="10" placeholder="07000">

                                <label for="nova_illa_id">Illa</label>
                                <select id="nova_illa_id">
                                  <option value="">Selecciona una illa</option>
                                  <?php foreach (($illes ?? []) as $il): ?>
                                    <option value="<?php echo (int) $il['id']; ?>"><?php echo htmlspecialchars($il['nom']); ?></option>
                                  <?php endforeach; ?>
                                </select>

                                <label for="nova_municipi_id">Municipi</label>
                                <select id="nova_municipi_id" disabled>
                                  <option value="">Selecciona un municipi</option>
                                </select>

                                <label for="nova_telefon">Telèfon</label>
                                <input type="text" id="nova_telefon" maxlength="30">

                                <label for="nova_email">Email</label>
                                <input type="email" id="nova_email" maxlength="150">

                                <label for="nova_persona_contacte">Persona contacte</label>
                                <input type="text" id="nova_persona_contacte" maxlength="150">

                                <label for="nova_observacions">Observacions</label>
                                <textarea id="nova_observacions" rows="3"></textarea>
                              </div>

                              <div class="nova-empresa-actions" style="margin-top:10px; display:flex; gap:8px; justify-content:flex-end;">
                                <button type="button" id="btn_guardar_nova_empresa" class="boton">Desar empresa</button>
                                <button type="button" id="btn_cancelar_nova_empresa" class="boton">Cancel·lar</button>
                              </div>

                              <div id="nova_empresa_msg" style="margin-top:10px; display:none;"></div>
                            </div>                        
                        </td>

                    </tr>
                </table>

            </div>

            <li class="fondoBotoneraFicha">
                <input type="submit" class="boton" onclick="return confirm('Estàs segur de desar els canvis?');" value="Desar canvis">
            </li>
        </form>

        <form method="post" action="contracteMenorDelete.php">
            <li class="fondoBotoneraFicha">
                <input type="hidden" name="id" value="<?php echo htmlspecialchars($id ?? ''); ?>">
                <button type="submit" class="boton" onclick="return confirm('Estàs segur de borrar aquest contracte menor?');">Eliminar</button>
            </li>
        </form>

        <li class="volverFicha"><input type="button" class="boton" value="Tornar al llistat" onclick="window.location.href='<?php echo $tornar ?>'"> </li>

    </div>

</body>
</html>
<?php $connexio->close(); ?>
