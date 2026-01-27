<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Gestió de contractes menors</title>

    <!-- Mateix look&feel que actuacions -->
    <link rel="stylesheet" href="../css/estilos.css" type="text/css" />
    <link rel="stylesheet" href="../css/estilos_ficha_2.css" type="text/css" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        // Dades de prova de contractes menors (mock)
        const CONTRACTES = [
            {
                id: 1,
                codi: "CM-2024-001",
                tipus: "Obres",
                data: "2024-02-01",
                centre: "IES Sa Serra",
                illa: "Eivissa",
                descripcio: "Pintar i reparar façana",
                importSenseIVA: 36996.78,
                importAmbIVA: 44766.10,
                empresa: "Argenis Pareja Buritica (MIRAPA)",
                seguiment: "Annex 2 favorable. Enviat a delegació i UGE. Conformitat del centre pendent de factura."
            },
            {
                id: 2,
                codi: "CM-2024-002",
                tipus: "Obres",
                data: "2024-02-01",
                centre: "CEIP Es Fossaret",
                illa: "Mallorca",
                descripcio: "Reparació de goteres",
                importSenseIVA: 7256.09,
                importAmbIVA: 8779.87,
                empresa: "Promocions i Construccions Jam Sóller S.L.",
                seguiment: "Annex 2 favorable. Enviat al centre i UGE. Annex 3 pendent."
            },
            {
                id: 3,
                codi: "CM-2024-003",
                tipus: "Obres",
                data: "2024-03-01",
                centre: "CEIP Es Molinar",
                illa: "Mallorca",
                descripcio: "Reconversió de tres lavabos en dues sales",
                importSenseIVA: 9173.10,
                importAmbIVA: 11099.45,
                empresa: "Construcciones y Mejoras Sa Torre S.L.",
                seguiment: "Pendent ampliar partida i trametre a UGE. Annex 3 preparat."
            },
            {
                id: 4,
                codi: "CM-2024-004",
                tipus: "Equipament",
                data: "2024-03-01",
                centre: "CEIP Sant Lluís i CEIP Mare de Déu del Carme",
                illa: "Menorca",
                descripcio: "Equipament cuina: fregidora i trituradora",
                importSenseIVA: 10000,
                importAmbIVA: null,
                empresa: "NET NET S.C.",
                seguiment: "Enviat a UGE. Annexos en tramitació amb els centres."
            },
            {
                id: 5,
                codi: "CM-2024-005",
                tipus: "Equipament",
                data: "2024-04-01",
                centre: "CEIP Can Pastilla",
                illa: "Mallorca",
                descripcio: "Cistelles d’equipament esportiu",
                importSenseIVA: 6931.68,
                importAmbIVA: null,
                empresa: "Vallados Ibiza S.L.",
                seguiment: "Enviat a UGE. Pendent confirmació d’instal·lació i factura."
            }
        ];

        const formatter = new Intl.NumberFormat("ca-ES", {
            style: "currency",
            currency: "EUR",
            minimumFractionDigits: 2
        });

        function formatEuro(v) {
            if (v == null || v === "" || isNaN(v)) return "-";
            return formatter.format(v);
        }

        function getEstat(c) {
            const txt = (c.seguiment || "").toLowerCase();
            if (txt.includes("finalitzad") || txt.includes("tancat") || txt.includes("factura registrada")) {
                return "Tancat";
            }
            if (txt.includes("pendent")) {
                return "En tràmit";
            }
            return "En curs";
        }

        function aplicaFiltres() {
            const codi = $("#codi_filtro").val().toLowerCase().trim();
            const centre = $("#centre_filtro").val().toLowerCase().trim();
            const illa = $("#illa_filtro").val();
            const tipus = $("#tipus_filtro").val();
            const estat = $("#estat_filtro").val();

            return CONTRACTES.filter(c => {
                if (codi && !c.codi.toLowerCase().includes(codi)) return false;
                if (centre && !c.centre.toLowerCase().includes(centre)) return false;
                if (illa && c.illa !== illa) return false;
                if (tipus && c.tipus !== tipus) return false;

                const e = getEstat(c);
                if (estat && estat !== e) return false;
                return true;
            });
        }

        function renderLlistat() {
            const tbody = $("#llistatContractes");
            tbody.empty();

            const filtrats = aplicaFiltres();
            let total = filtrats.length;

            if (total === 0) {
                tbody.append(
                    "<tr><td colspan='8' class='campoListado'>No s'han trobat contractes amb aquests filtres.</td></tr>"
                );
                $("#resumTotal").text("Total contractes: 0");
                return;
            }

            filtrats.forEach((c, idx) => {
                const estat = getEstat(c);
                const fons = (idx % 2 === 0) ? "fondoListadoCalle" : "fondoListadoCalleAlterno";
                const row = $(`
                    <tr class="${fons}" data-id="${c.id}">
                        <td class="campoListadoInicial">${c.codi}</td>
                        <td class="campoListado">${c.centre}</td>
                        <td class="campoListado">${c.illa}</td>
                        <td class="campoListado">${c.tipus}</td>
                        <td class="campoListado">${c.data}</td>
                        <td class="campoListado">${formatEuro(c.importSenseIVA)}</td>
                        <td class="campoListado">${c.empresa || ""}</td>
                        <td class="campoListado">${estat}</td>
                    </tr>
                `);
                row.on("click", function () {
                    const id = $(this).data("id");
                    // En l’app real: location.href = 'cmForm.php?id=' + id;
                    window.location.href = 'cmForm.php?id=' + id;
                });
                tbody.append(row);
            });

            $("#resumTotal").text("Total contractes: " + total);
        }

        $(function () {
            // Esdeveniments filtres
            $("#codi_filtro, #centre_filtro").on("input", renderLlistat);
            $("#illa_filtro, #tipus_filtro, #estat_filtro").on("change", renderLlistat);

            $("#btnReset").on("click", function () {
                $("#codi_filtro").val("");
                $("#centre_filtro").val("");
                $("#illa_filtro").val("");
                $("#tipus_filtro").val("");
                $("#estat_filtro").val("");
                renderLlistat();
            });

            $("#btnNova").on("click", function () {
                // En l’app real: location.href = 'cmForm.php';
                alert("Obriria la pantalla d'ALTA de contracte menor (cmForm.php)");
            });

            renderLlistat();
        });
    </script>
</head>

<body class="contenido">
    <div class="contenedorFiltro">
        <h2>Gestió de contractes menors</h2>

        <!-- Filtres, amb mateixa estructura que actuacioListFiltro -->
        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="formularioFiltro">
            <tr>
                <td class="contenedorCamposFiltro">
                    <label for="codi_filtro" class="formularioFiltro">Codi de contracte:</label>
                    <input type="text" id="codi_filtro" name="codi_filtro">
                </td>
                <td class="contenedorCamposFiltro">
                    <label for="centre_filtro" class="formularioFiltro">Centre:</label>
                    <input type="text" id="centre_filtro" name="centre_filtro">
                </td>
                <td class="contenedorCamposFiltro">
                    <label for="illa_filtro" class="formularioFiltro">Illa:</label>
                    <select id="illa_filtro" name="illa_filtro" class="campoFicha_Blanca">
                        <option value="">Totes</option>
                        <option value="Mallorca">Mallorca</option>
                        <option value="Menorca">Menorca</option>
                        <option value="Eivissa">Eivissa</option>
                        <option value="Formentera">Formentera</option>
                    </select>
                </td>
                <td class="contenedorCamposFiltro">
                    <label for="tipus_filtro" class="formularioFiltro">Tipus:</label>
                    <select id="tipus_filtro" name="tipus_filtro" class="campoFicha_Blanca">
                        <option value="">Tots</option>
                        <option value="Obres">Obres</option>
                        <option value="Equipament">Equipament</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="contenedorCamposFiltro">
                    <label for="estat_filtro" class="formularioFiltro">Estat:</label>
                    <select id="estat_filtro" name="estat_filtro" class="campoFicha_Blanca">
                        <option value="">Tots</option>
                        <option value="En tràmit">En tràmit</option>
                        <option value="En curs">En curs</option>
                        <option value="Tancat">Tancat</option>
                    </select>
                </td>
                <td colspan="3" class="contenedorCamposFiltro" style="vertical-align: bottom;">
                    <input type="button" class="boton" id="btnReset" value="Neteja filtres">
                </td>
            </tr>
        </table>
    </div>

    <!-- Botonera llistat -->
    <ul class="botoneraListado">
        <li class="tituloListado">LLISTAT DE CONTRACTES MENORS</li>
        <li class="fondoBotoneraListado">
            <input type="button" class="boton" id="btnNova" value="Nou contracte menor">
        </li>
    </ul>

    <div class="contenedorListado">
        <table class="listado" cellpadding="0" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th class="campoCabeceraListadoInicial">Codi</th>
                    <th class="campoCabeceraListado">Centre</th>
                    <th class="campoCabeceraListado">Illa</th>
                    <th class="campoCabeceraListado">Tipus</th>
                    <th class="campoCabeceraListado">Data</th>
                    <th class="campoCabeceraListado">Import (sense IVA)</th>
                    <th class="campoCabeceraListado">Empresa</th>
                    <th class="campoCabeceraListadoFinal">Estat</th>
                </tr>
            </thead>
            <tbody id="llistatContractes">
                <!-- Files generades per JS -->
            </tbody>
        </table>
    </div>

    <div class="finalListado">
        <span id="resumTotal" class="campoListado" style="padding-left:10px;">Total contractes: 0</span>
    </div>
</body>

</html>
