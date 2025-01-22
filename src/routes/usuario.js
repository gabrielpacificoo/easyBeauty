var express = require('express');
var router = express.Router();

router.post('/cadastro', (req, res) => {
  console.log('ok')
})

router.get('/autenticar/:emailUsuario/:senhaUsuario', (req, res) => {
  console.log('ok')
})

module.exports = router;