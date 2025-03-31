<!DOCTYPE html>
<html lang="ca">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Fitxa Document Actuació</title>
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
  <h1>Fitxa de Document d'Actuació</h1>
  <form id="document-form">
    <label for="actuacio_id">Actuació</label>
    <select id="actuacio_id" name="actuacio_id" required>
      <option value="">-- Selecciona una actuació --</option>
      <option value="1">Renovació biblioteca (Centre A)</option>
      <option value="2">Millora pista esportiva (Centre B)</option>
    </select>

    <label for="titol">Títol del document</label>
    <input type="text" id="titol" name="titol" required>

    <label for="tipus">Tipus de document</label>
    <select id="tipus" name="tipus" required>
      <option value="">-- Selecciona un tipus --</option>
      <option value="informe">Informe</option>
      <option value="pressupost">Pressupost</option>
      <option value="acta">Acta</option>
      <option value="altre">Altres</option>
    </select>

    <label for="data">Data</label>
    <input type="date" id="data" name="data">

    <label for="fitxer_url">Enllaç al fitxer</label>
    <input type="url" id="fitxer_url" name="fitxer_url">

    <label for="observacions">Observacions</label>
    <textarea id="observacions" name="observacions" rows="4"></textarea>

    <button type="submit">Desar</button>
  </form>
</body>
</html>
