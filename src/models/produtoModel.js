var database = require('../database/config')

function selectEstoquePorCategoria() {

var comandoMYSQL = `
  SELECT p.categoria as Categoria,
  SUM((p.preco_venda * p.qtd_estoque)) as 'ValorEstoque'
  FROM produto as p
  GROUP BY p.categoria;`

  return database.executar(comandoMYSQL)
}

module.exports = {
    selectEstoquePorCategoria
}