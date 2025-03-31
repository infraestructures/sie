<!DOCTYPE html>
<html lang="ca">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fitxa de Pagament</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f5f5f5;
        }
        h1 {
            color: #8a4700;
        }
        form {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 600px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input, textarea, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #8a4700;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #6d3600;
        }
    </style>
</head>
<body>
    <h1>Fitxa de Pagament</h1>
    <form id="pagament-form">
        <label for="actuacio_id">Actuació</label>
        <select id="actuacio_id" name="actuacio_id" required>
            <option value="">-- Selecciona una actuació --</option>
            <option value="1">Renovació biblioteca (Centre A)</option>
            <option value="2">Millora pista esportiva (Centre B)</option>
        </select>

        <label for="nom">Nom del pagament</label>
        <input type="text" id="nom" name="nom" required>

        <label for="data">Data</label>
        <input type="date" id="data" name="data" required>

        <label for="quantitat">Quantitat (€)</label>
        <input type="number" id="quantitat" name="quantitat" step="0.01" required>

        <label for="justificant_url">Enllaç al justificant</label>
        <input type="url" id="justificant_url" name="justificant_url">

        <label for="observacions">Observacions</label>
        <textarea id="observacions" name="observacions" rows="4"></textarea>

        <button type="submit">Desar</button>
    </form>
</body>
</html>