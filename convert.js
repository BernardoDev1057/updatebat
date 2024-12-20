const fs = require('fs');
const path = require('path');

// Define the file path
const filePath = path.join(__dirname, 'resultado.txt');

// Read the file
fs.readFile(filePath, 'utf8', (err, data) => {
    if (err) {
        console.error('Error reading the file:', err);
        return;
    }

    // Process the file content
    const lines = data.trim().split("\n");

    // Define the headers
    const headers = [
        "IDPRODUTO",
        "DESCRICAO_PRODUTO",
        "PRECO_VENDA",
        "IDSUBGRUPO_PRODUTO",
        "PRECO_PROMOCIONAL",
        "DATA_LIMITE_PROM",
        "DATA_INICIO_PROM",
        "CODIGO_BARRA"
    ];

    // Parse the data rows
    const dataRows = lines.slice(2).map(line => {
        const data = line.match(/.{1,15}/g).map(col => col.trim());
        return headers.reduce((obj, header, index) => {
            obj[header] = data[index];
            return obj;
        }, {});
    });

    // Convert to JSON
    const jsonData = JSON.stringify(dataRows, null, 2);

    // Save JSON to a file
    const outputFilePath = path.join(__dirname, 'resultado.json');
    fs.writeFile(outputFilePath, jsonData, 'utf8', (err) => {
        if (err) {
            console.error('Error writing JSON file:', err);
            return;
        }
        console.log('JSON file created successfully:', outputFilePath);
    });
});
