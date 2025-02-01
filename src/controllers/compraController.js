function arroz(req, res) {
  return console.log('oi', req, res)
}

var compraModel = require('../models/compraModel.js')

function obterVendasPorCategoria(req, res) {
  res.status(400).send('madu')
}

module.exports = {
  arroz,
  obterVendasPorCategoria
}