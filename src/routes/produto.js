var express = require('express');
var router = express.Router();

var controllerProduto = require('../controllers/produtoController')

router.get('/estoqueCategoria', (req,res) => {
  controllerProduto.obterEstoquePorCategoria(req,res)
})


router.post('/registro', (req, res) => {
  console.log('ok')
  
})

module.exports = router;