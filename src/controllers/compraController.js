var compraModel = require('../models/compraModel.js')

function obterVendasPorCategoria(req, res) {

  console.log('Estou no controller das Compras')

  compraModel.selectVendasPorCategoria()
  .then((result) => {
    console.log(result)

    if (result.length > 0) {
      res.status(200).json(result)
    }

  }).catch((err) => {
    console.log(err)
    
  });
}

module.exports = {
  obterVendasPorCategoria
}