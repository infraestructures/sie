<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actuació a Centre Educatiu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
            color: #333;
        }
        h1 {
            text-align: center;
            color: #8a4700;
        }
        form {
            margin-bottom: 30px;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input, select, button {
            margin-top: 5px;
            padding: 8px;
            box-sizing: border-box;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #8a4700;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
			cursor: pointer;
        }
		.formularioFichaContainer {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
    }

    .formularioFichaRow {
        display: flex;
        align-items: center;
    }

    .formularioFichaRow label {
        flex: 0 0 150px;
        text-align: right;
        margin-right: 10px;
    }

    .formularioFichaRow input,
    .formularioFichaRow textarea {
        flex: 1;
        padding: 5px;
        box-sizing: border-box;
    }

    .formularioFichaRow textarea {
        width: calc(100% - 160px); /* Ajusta el ancho del textarea */
    }


    </style>
</head>
<body>
    <h1>Actuació a Centre Educatiu</h1>

    <form id="centre-form">
		<div class="formularioFichaContainer">
			<div class="formularioFichaRow">	
				<label for="nom-centre">Nom del centre</label>
				<input type="text" id="nom_centre" name="nom_centre" value="CEIP Calonge" readonly>
			</div>

			<div class="formularioFichaRow">
				<label for="actuacio">Actuació</label>
				<input type="text" id="actuacio" name="actuacio" required>
			</div>
			<div class="formularioFichaRow">
				<label for="pressupost">Pressupost inicial</label>
				<input type="number" id="pressupost_inicial" name="pressupost_inicial" required>
			</div>
			<div class="formularioFichaRow">
				<label for="pressupost">Pressupost definitiu</label>
				<input type="number" id="pressupost_definitiu" name="pressupost" required>
			</div>
			<div class="formularioFichaRow">
				<label for="data-inici">Aprovació inicial projecte</label>
				<input type="date" id="data-inici" name="data-inici" value="2024-12-15" required>
			</div>
			<div class="formularioFichaRow">
				<label for="data-inici">Aprovació definitiva projecte</label>
				<input type="date" id="data-inici" name="data-inici" value="2025-01-15" required>
			</div>
			<div class="formularioFichaRow">
				<label for="data-inici">Previsió inici execució</label>
				<input type="date" id="data-inici" name="data-inici" value="2025-02-15" required>
			</div>
			<div class="formularioFichaRow">
				<label for="data-inici">Previsió finalització d'obres</label>
				<input type="date" id="data-inici" name="data-inici" value="2025-03-15" required>
			</div> 
			<div class="formularioFichaRow">
				<label for="data-inici">Data comissió de seguiment</label>
				<input type="date" id="data-inici" name="data-inici" value="2025-02-15" required>
			</div>
			<div class="formularioFichaRow">
				<label for="data-inici">Enllaç comissió de seguiment</label>
				<input type="date" id="data-inici" name="data-inici" value="2025-03-15" required>
			</div>                     
			<div class="formularioFichaRow">
				<label for="data-inici">Observacions</label>
				<textarea id="observacions" name="observacions" rows="4" style="width: 100%;"></textarea>
			</div>
		</div>
    </form>

    <h2>Pagaments</h2>
    <button id="afegir-pagament" onclick="window.location.href='pagamentActuacioForm.php'">Nou pagament</button>
    <table>
        <thead>
            <tr>
                <th>Nom</th>
                <th>Data</th>
                <th>Quantitat</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Primer pagament</td>
                <td>01/01/2025</td>
                <td>50.000 €</td>
            </tr>
            <tr>
                <td>Darrer pagament</td>
                <td>01/04/2025</td>
                <td>70.000 €</td>
            </tr>
        </tbody>
    </table>

    <h2>Documents d'actuacions</h2>
    <button id="afegir-document" onclick="window.location.href='documentActuacioForm.php'">Nou document</button>
    <table>
        <thead>
            <tr>
                <th>Estat</th>
                <th>Data</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Documentació tècnica</td>
                <td>01/12/2024</td>
            </tr>
            <tr>
                <td>Informe de valoració</td>
                <td>05/12/2024</td>
            </tr>		
        </tbody>
    </table>
	<button type="submit">Desar</button>
</body>
</html>
