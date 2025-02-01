var express = require('express');
var router = express.Router();

var controllerCompra = require('../controllers/compraController.js')

router.get('/vendasCategoria', (req, res) => {
  controllerCompra.obterVendasPorCategoria(req, res)
})

router.post('/registro', (req, res) => {
  console.log('ok')  
})

module.exports = router;

/* fetch('/compra/vendasCategoria', {
  method: 'get',
  headers: {
    "Content-Type": "application/json",
  },
})

fetch(`/compra/vendasCategoria`, { cache: 'no-store' }) */