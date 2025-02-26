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

    <form id="centre-form">
	
        <label for="codi-centre">Codi del centre</label>
        <input type="text" id="codi-centre" name="codi-centre" required>

        <label for="nom-centre">Nom del centre</label>
		<input type="text" id="nom_centre" name="nom_centre" value="CEIP Calonge" readonly>

        <label for="localitat">Localitat</label>
        <input type="text" id="localitat" name="localitat" required>

        <label for="pressupost">Pressupost</label>
        <input type="number" id="pressupost" name="pressupost" required>	
		
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
