var database = require('../database/config')

function selectVendasPorCategoria() {
  var comandoMYSQL =  `SELECT p.categoria as Categoria,
  SUM(p.preco_venda) as 'Valor'
  FROM produto as p
  JOIN compra as c 
  ON c.fkProduto = p.idProduto
  WHERE c.dtCompra like '2025-01%'
  GROUP BY p.categoria;`

  return database.executar(comandoMYSQL)  
}

module.exports = {
  selectVendasPorCategoria
}