var express = require('express');
var router = express.Router();

var controllerCompra = require('../controllers/compraController.js')

router.post('/registro', (req, res) => {
  console.log('ok')  
})

module.exports = router;