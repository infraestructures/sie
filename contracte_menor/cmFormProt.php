<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Fitxa de contracte menor</title>

    <link rel="stylesheet" href="../css/estilos.css" type="text/css" />
    <link rel="stylesheet" href="../css/estilos_ficha_2.css" type="text/css" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        // Només per demo: omple la fitxa amb un contracte de prova
        const DEMO_CONTRACTE = {
            id: 1,
            codi: "CM-2024-001",
            any: "2024",
            tipus: "Obres",
            illa: "Eivissa",
            municipi: "Sant Antoni de Portmany",
            centre: "IES Sa Serra",
            data: "2024-02-01",
            importSenseIVA: 36996.78,
            importAmbIVA: 44766.10,
            empresa: "Argenis Pareja Buritica (MIRAPA)",
            partida: "227.99.01",
            estat: "En tràmit",
            seguiment: "Annex 2 favorable. Enviat a delegació i UGE. Conformitat del centre pendent de factura.",
            observacions: "Contracte d'exemple per a maqueta. En real vindria de BD."
        };

        const formatter = new Intl.NumberFormat("ca-ES", {
            style: "currency",
            currency: "EUR",
            minimumFractionDigits: 2
        });

        function formatEuro(v) {
            if (v == null || v === "" || isNaN(v)) return "";
            return formatter.format(v);
        }

        $(function () {
            // Omplim la maqueta amb les dades d’exemple
            $("#codi").val(DEMO_CONTRACTE.codi);
            $("#any").val(DEMO_CONTRACTE.any);
            $("#tipus").val(DEMO_CONTRACTE.tipus);
            $("#illa").val(DEMO_CONTRACTE.illa);
            $("#municipi").val(DEMO_CONTRACTE.municipi);
            $("#centre").val(DEMO_CONTRACTE.centre);
            $("#data_contracte").val(DEMO_CONTRACTE.data);
            $("#import_sense_iva").val(DEMO_CONTRACTE.importSenseIVA);
            $("#import_amb_iva").val(DEMO_CONTRACTE.importAmbIVA);
            $("#empresa").val(DEMO_CONTRACTE.empresa);
            $("#partida").val(DEMO_CONTRACTE.partida);
            $("#estat").val(DEMO_CONTRACTE.estat);
            $("#seguiment").val(DEMO_CONTRACTE.seguiment);
            $("#observacions").val(DEMO_CONTRACTE.observacions);

            // Només demo: no enviarem el formulari
            $("form#formContracte").on("submit", function (e) {
                e.preventDefault();
                alert("En una versió real, aquí es faria el POST a cmInsertUpdate.php");
            });

            $("#btnEliminar").on("click", function () {
                if (confirm("Estàs segur de borrar aquest contracte menor?")) {
                    alert("En una versió real, faria POST a cmDelete.php");
                }
            });

            $("#btnTornar").on("click", function () {
                // En real: window.location.href = 'cmListFiltro.php';
				window.location.href = 'cmListFiltro.php';
            });
        });
    </script>
</head>

<body class="contenido">
    <div class="contenedorFiltro"></div>

    <!-- Botonera superior de la fitxa -->
    <ul class="botoneraFicha">
        <li class="tituloFicha">
            <p class="posicionTituloFicha">FITXA DE CONTRACTE MENOR</p>
        </li>
    </ul>

    <div class="espacioMarron">&nbsp;</div>

    <div id="fichaEditable" style="background-color:#ffffff;">
        <div class="cabeceraFicha"></div>

        <form id="formContracte" name="formContracte" method="post" action="#">
            <div class="contenedorFicha">
                <div class="tituloSeccion">
                    <p class="textoTituloSeccion">Dades generals</p>
                </div>

                <table>
                    <tr>
                        <td>
                            <label for="codi" class="campoFicha_Blanca">Codi de contracte:</label>
                            <input type="text" id="codi" name="codi" class="formularioFicha" size="20" readonly>
                        </td>
                        <td>
                            <label for="any" class="campoFicha_Blanca">Any:</label>
                            <input type="text" id="any" name="any" class="formularioFicha" size="4">
                        </td>
                        <td>
                            <label for="tipus" class="campoFicha_Blanca">Tipus:</label>
                            <select id="tipus" name="tipus" class="campoFicha_Blanca">
                                <option value="">Selecciona...</option>
                                <option value="Obres">Obres</option>
                                <option value="Equipament">Equipament</option>
                            </select>
                        </td>
                        <td>
                            <label for="estat" class="campoFicha_Blanca">Estat:</label>
                            <select id="estat" name="estat" class="campoFicha_Blanca">
                                <option value="En tràmit">En tràmit</option>
                                <option value="En curs">En curs</option>
                                <option value="Tancat">Tancat</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="illa" class="campoFicha_Blanca">Illa:</label>
                            <input type="text" id="illa" name="illa" class="formularioFicha">
                        </td>
                        <td>
                            <label for="municipi" class="campoFicha_Blanca">Municipi:</label>
                            <input type="text" id="municipi" name="municipi" class="formularioFicha">
                        </td>
                        <td colspan="2">
                            <label for="centre" class="campoFicha_Blanca">Centre:</label>
                            <input type="text" id="centre" name="centre" class="formularioFicha" size="60">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="data_contracte" class="campoFicha_Blanca">Data de contracte:</label>
                            <input type="date" id="data_contracte" name="data_contracte" class="formularioFicha">
                        </td>
                        <td>
                            <label for="partida" class="campoFicha_Blanca">Partida pressupostària:</label>
                            <input type="text" id="partida" name="partida" class="formularioFicha">
                        </td>
                        <td>
                            <label for="empresa" class="campoFicha_Blanca">Empresa adjudicatària:</label>
                            <input type="text" id="empresa" name="empresa" class="formularioFicha" size="40">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="import_sense_iva" class="campoFicha_Blanca">Import previst (sense IVA):</label>
                            <input type="number" step="0.01" id="import_sense_iva" name="import_sense_iva"
                                   class="formularioFicha">
                        </td>
                        <td>
                            <label for="import_amb_iva" class="campoFicha_Blanca">Import execució / amb IVA:</label>
                            <input type="number" step="0.01" id="import_amb_iva" name="import_amb_iva"
                                   class="formularioFicha">
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <label for="seguiment" class="campoFicha_Blanca">Seguiment:</label>
                            <textarea id="seguiment" name="seguiment" class="contenedorFicha_Blanca" rows="6" cols="100"></textarea>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="4">
                            <label for="observacions" class="campoFicha_Blanca">Observacions internes:</label>
                            <textarea id="observacions" name="observacions" class="contenedorFicha_Blanca" rows="6" cols="100"></textarea>
                        </td>
                    </tr>
                </table>
            </div>

            <br><br>

            <!-- Aquí podries afegir llistats relacionats, igual que a actuacioForm:
                 documents, seguiment detallat, etc. Per ara ho deixo com a maqueta senzilla. -->

            <!-- Botons d’acció, estil actuacions -->
            <ul class="botoneraFicha">
                <li class="fondoBotoneraFicha">
                    <input type="submit" class="boton" value="Desar canvis">
                </li>
                <li class="fondoBotoneraFicha">
                    <input type="button" id="btnEliminar" class="boton" value="Eliminar">
                </li>
                <li class="volverFicha">
                    <input type="button" id="btnTornar" class="boton" value="Tornar al llistat">
                </li>
            </ul>
        </form>
    </div>
</body>

</html>
