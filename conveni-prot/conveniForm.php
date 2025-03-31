<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FITXA DE CONVENI</title>
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
        input, button {
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
        }
        .buttons {
            margin-top: 20px;
            text-align: left;
        }
        .buttons button {
            margin: 0 10px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
        tr:hover {
            background-color: #ddd;
			cursor: pointer;
        }		
    </style>
	<script>
		function removeFormat() {
			const input = document.getElementById("pressupost");
			input.value = input.value.replace(/\./g, '').replace('€', '').trim();
		}

		function applyFormat() {
			const input = document.getElementById("pressupost");
			let value = parseInt(input.value.replace(/\./g, '').trim(), 10);
			if (!isNaN(value)) {
				input.value = new Intl.NumberFormat('es-ES', { style: 'currency', currency: 'EUR' }).format(value).replace('€', '') + '€';
			} else {
				input.value = '';
			}
		}

		// Apply initial format on page load
		document.addEventListener("DOMContentLoaded", applyFormat);
	</script>
</head>
<body>
    <h1>FITXA DE CONVENI</h1>

    
<form id="form-conveni">
    <label for="ajuntament_id">Ajuntament</label>
    <select id="ajuntament_id" name="ajuntament_id" required>
        <option value="">-- Selecciona un ajuntament --</option>
        <option value="1">Santanyí</option>
        <option value="2">Palma</option>
        <option value="3">Inca</option>
    </select>

    <label for="data_inici">Data d'inici</label>
    <input type="date" id="data_inici" name="data_inici" required>

    <label for="data_fi">Data de finalització</label>
    <input type="date" id="data_fi" name="data_fi" required>

    <label for="pressupost">Pressupost</label>
    <input type="number" id="pressupost" name="pressupost" step="0.01" required>

    <label for="estat">Estat</label>
    <select id="estat" name="estat" required>
        <option value="">-- Selecciona estat --</option>
        <option value="pendent">Pendent</option>
        <option value="vigent">Vigent</option>
        <option value="finalitzat">Finalitzat</option>
    </select>

    <label for="observacions">Observacions</label>
    <textarea id="observacions" name="observacions" rows="4" style="width:100%;"></textarea>
</form>


    <h2>LLISTAT DE CENTRES</h2>
	<button id="afegir-centre" onclick="window.location.href='centreForm.php'">Afegir centre</button>
    <table>
        <thead>
            <tr onclick="window.location.href='centreConveniForm.php'">
                <th>Codi de centre</th>
                <th>Nom del centre</th>
                <th>Localitat</th>
                <th>Pressupost</th>
            </tr>
        </thead>
        <tbody id="llistat-centres">
            <tr onclick="window.location.href='centreConveniForm.php'">
                <td>07005416</td>
                <td>CC Bisbe Verger</td>
                <td>Santanyí</td>
                <td>500.000 €</td>
            </tr>
            <tr onclick="window.location.href='centreConveniForm.php'">
                <td>07012883</td>
                <td>CEIP Calonge</td>
                <td>Calonge</td>
                <td>300.000 €</td>
            </tr>
            <tr onclick="window.location.href='centreConveniForm.php'">
                <td>07007784</td>
                <td>CEIP Sant Domingo</td>
                <td>Es Llombards</td>
                <td>200.000 €</td>
            </tr>
        </tbody>
    </table>    

    <div class="buttons">
        <button id="desar">Desar</button>
        <button id="eliminar">Eliminar</button>
        <button id="tornar">Tornar al llistat de convenis</button>
    </div>
</body>
</html>