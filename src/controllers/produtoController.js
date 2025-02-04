var produtoModel = require('../models/produtoModel.js');

function obterEstoquePorCategoria(req, res) {
    console.log('Estou no controller das estoque');

    produtoModel.selectEstoquePorCategoria()
        .then((result) => {
            if (result.length > 0) {
                res.status(200).json(result); 
            }
        })
        .catch((err) => {
            console.log(err);
            res.status(500).json({ error: 'Erro' }); 
        });
}

module.exports = {
    obterEstoquePorCategoria
}