CREATE DATABASE easyBeauty;
-- DROP DATABASE easyBeauty;
USE easyBeauty;

CREATE TABLE usuario (
  idUsuario INT PRIMARY KEY AUTO_INCREMENT not null,
  nome VARCHAR(45) not null,
  dtNascimento DATE not null,
  cpf CHAR(11) not null,
  email VARCHAR(60) not null,
  senha VARCHAR(45) not null,
  nivelAcesso TINYINT not null /* 0 - Usuario Comum // 1 - Administrador */
)

CREATE TABLE produto (
  idProduto INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) not null,
  preco_compra DECIMAL(10, 2) not null,
  preco_venda DECIMAL(10, 2) not null,
  descricao VARCHAR(60) not null,
  categoria VARCHAR(45) not null,
  qtd_estoque INT not null
)

CREATE TABLE compra (
  idCompra INT PRIMARY KEY AUTO_INCREMENT,
  fkUsuario INT not null,
  fkProduto INT not null,
  dtCompra DATETIME DEFAULT CURRENT_TIMESTAMP(),
  CONSTRAINT fkCompraUsuario FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
  CONSTRAINT fkCompraProduto FOREIGN KEY (fkProduto) REFERENCES produto(idProduto)
)

--
INSERT INTO usuario(nome, dtNascimento, cpf, email, senha, nivelAcesso) VALUES 
  ('Gabriel', '2006-02-15', '43819218271', 'gabriel@gmail.com', '12345678', '1')

INSERT INTO produto(nome, preco_compra, preco_venda, descricao, categoria, qtd_estoque) VALUES 
  ('Wella Professionals', 130, 374.80, 'Kit Fusion Salon Duo (2 Produtos)', 'Cabelos', 10),
  ('Tangle Teezer', 40, 89.90, 'The Wet Detangler Pink - Escova de Cabelo', 'Cabelos', 10),
  ('Sebastian Professional', 100, 125.90, 'Dark Oil - Óleo Capilar 95ml', 'Cabelos', 9)

SELECT * FROM compra;
SELECT * from produto;
SELECT * FROM pedido;

SELECT SUM((preco_venda - preco_compra)) as Lucro FROM produto;

/* SIMULAÇÃO DE COMPRA */
INSERT INTO compra(fkUsuario, fkProduto) VALUES 
  (1, 3),
  (1, 3),
  (1, 3);
UPDATE produto SET qtd_estoque = (qtd_estoque - 3) WHERE idProduto = 3;
SELECT p.nome as Produto,
  c.dtCompra,
  sum(p.preco_venda)
  FROM produto as p
  JOIN compra as c
  ON c.fkProduto = p.idProduto
  GROUP BY p.nome, c.dtCompra;
/* Comando para diminuir quantidade de produto no estoque */
/* 
fkProduto = idProdutoComprado
qtdCompra = Quantidade selecionada
 */
UPDATE produto SET qtd_estoque = (qtd_estoque - $QtdCompra) WHERE idProduto = $fkProduto;

INSERT INTO pedido(fkCompra, fkProduto) VALUES
  (1, 1),
  (1, 2),
  (1, 3)
