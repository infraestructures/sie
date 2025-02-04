<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LLISTA DE CONVENIS</title>
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
        h3 {
            text-align: left;
            color: #0056b3;
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
			cursor: pointer;
        }
    </style>
</head>
<body>
	<h3>FILTRE DE CERCA</h3>
	<div class="filters">
	<label for="illa">Illa:</label>
	<select id="illa" name="illa">
		<option value="">Totes</option>
		<option value="Mallorca">Mallorca</option>
		<option value="Menorca">Menorca</option>
		<option value="Eivissa">Eivissa</option>
		<option value="Formentera">Formentera</option>
	</select>
	
	<label for="illa">Ajuntament:</label>
	<select id="illa" name="illa">
		<option value="">Totes</option>
		<option value="Inca">Mallorca</option>
		<option value="Manacor">Menorca</option>
		<option value="Palma">Eivissa</option>
		<option value="Porreres">Formentera</option>
	</select>
	
	<label for="any">Any:</label>
	<select id="any" name="any">
		<option value="">Tots</option>
		<option value="2024">2024</option>
		<option value="2023">2023</option>
		<option value="2022">2022</option>
	</select>

	<button id="cerca">Cerca</button>
</div>
	<button id="afegir-conveni" onclick="window.location.href='conveniForm.php">Afegir conveni</button>
    <h1>LLISTA DE CONVENIS</h1>
    <table>
        <thead>
            <tr onclick="window.location.href='conveniForm.php">
                <th>Ajuntament</th>
                <th>Núm centres</th>
				<th>Data creació</th>
                <th>Data darrer pagament</th>
                <th>Pressupost</th>
            </tr>
        </thead>
        <tbody>
            <tr onclick="window.location.href='conveniForm.php'">
                <td>Santanyí</td>
                <td>12</td>
                <td>01/12/2024</td>
				<td>31/12/2026</td>
                <td>1.500.000 €</td>
            </tr onclick="window.location.href='conveniForm.php'">
            <tr>
                <td>Eivissa</td>
                <td>8</td>
                <td>15/11/2024</td>
				<td>31/12/2026</td>
                <td>800.000 €</td>
            </tr>
            <tr onclick="window.location.href='conveniForm.php'">
                <td>Ciutadella</td>
                <td>5</td>
                <td>20/10/2024</td>
				<td>31/12/2026</td>
                <td>500.000 €</td>
            </tr>
            <tr onclick="window.location.href='conveniForm.php'">
                <td>Marratxí</td>
                <td>10</td>
                <td>05/12/2024</td>
				<td>31/12/2026</td>
                <td>1.200.000 €</td>
            </tr>
        </tbody>
    </table>
</body>
</html>
