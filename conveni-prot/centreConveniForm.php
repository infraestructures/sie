<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Centre Educatiu</title>
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
        }
    </style>
</head>
<body>
    <h1>Centre Educatiu</h1>

    

<form id="form-centre-conveni">
    <label for="conveni_id">Conveni</label>
    <select id="conveni_id" name="conveni_id" required>
        <option value="">-- Selecciona un conveni --</option>
        <option value="1">Conveni 1</option>
        <option value="2">Conveni 2</option>
    </select>

    <label for="centre_id">Centre</label>
    <select id="centre_id" name="centre_id" required>
        <option value="">-- Selecciona un centre --</option>
        <option value="1">Centre A</option>
        <option value="2">Centre B</option>
    </select>

    <label for="import_total">Import total</label>
    <input type="number" id="import_total" name="import_total" step="0.01" required>
</form>



    <h2>Llista d'Actuacions a centres educatius</h2>
	<button id="afegir-actuacio" onclick="window.location.href='centreActuacioForm.php'">Afegir actuació</button>
    <table>
        <thead>
            <tr onclick="window.location.href='centreActuacioForm.php'">
                <th>Codi</th>
                <th>Nom</th>
                <th>Inici execució</th>
                <th>Fi execució</th>
                <th>Pressupost</th>
            </tr>
        </thead>
        <tbody>
            <tr onclick="window.location.href='centreActuacioForm.php'">
                <td>001</td>
                <td>Renovació de la biblioteca</td>
                <td>2024-01-15</td>
                <td>2024-06-30</td>
                <td>50.000 €</td>
            </tr>
            <tr onclick="window.location.href='centreActuacioForm.php'">
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
