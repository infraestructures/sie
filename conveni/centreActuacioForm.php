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
            color: #0056b3;
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
            background-color: #0056b3;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
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
			<label for="informe">Informe actuacions:</label>
			<select id="informe" name="informe">
				<option value="">Selecciona</option>
				<option value="demanat">"Demanat a l'ajuntament"</option>
				<option value="parcialment">"Rebut parcialment"</option>
				<option value="definitiu">"Rebut informe definitiu"</option>
			</select>		
			<select id="memoria" name="memoria">
				<option value="">Selecciona</option>
				<option value="demanat">"Pendent d'enviar a firma"</option>
				<option value="parcialment">"Enviat a firma"</option>
				<option value="definitiu">"Firmat"</option>
			</select>				
			<div class="formularioFichaRow">
				<label for="data-inici">Observacions</label>
				<textarea id="observacions" name="observacions" rows="4" style="width: 100%;"></textarea>
			</div>
		</div>
    </form>

    <h2>Pagaments</h2>
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

    <h2>Informe d'actuacions</h2>
    <table>
        <thead>
            <tr>
                <th>Estat</th>
                <th>Data</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Demanat a l'ajuntament</td>
                <td>01/12/2024</td>
            </tr>
            <tr>
                <td>Rebut parcialment</td>
                <td>05/12/2024</td>
            </tr>
            <tr>
                <td>Rebut informe definitiu</td>
                <td>10/12/2024</td>
            </tr>			
        </tbody>
    </table>
	
    <h2>Seguiment de l'actuació</h2>
    <table>
        <thead>
            <tr>
                <th>Codi</th>
                <th>Nom</th>
                <th>Inici execució</th>
                <th>Fi execució</th>
                <th>Pressupost</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>001</td>
                <td>Renovació de la biblioteca</td>
                <td>2024-01-15</td>
                <td>2024-06-30</td>
                <td>50.000 €</td>
            </tr>
            <tr>
                <td>002</td>
                <td>Millora de les instal·lacions esportives</td>
                <td>2024-03-01</td>
                <td>2024-09-01</td>
                <td>120.000 €</td>
            </tr>
        </tbody>
    </table>
	<button type="submit">Desar</button>
</body>
</html>
