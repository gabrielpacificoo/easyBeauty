CREATE DATABASE easyBeauty2;
USE easyBeauty2;

CREATE TABLE produto (
  idProduto INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45),
  descricao VARCHAR(60),
  preco DECIMAL(10,2)
)

CREATE TABLE estoque (
  idEstoque INT PRIMARY KEY AUTO_INCREMENT,
  quantidade INT,
  fkProduto INT,
  CONSTRAINT fkEstoqueProduto FOREIGN KEY (fkProduto) REFERENCES produto(idProduto)
)

INSERT INTO produto VALUES 
  (DEFAULT, 'Shampoo', 'Lavar o cabelo', 150),
  (DEFAULT, 'Condicionador', 'Condicionar o cabelo', 120);

INSERT INTO estoque VALUES 
  (DEFAULT, 10, 1),
  (DEFAULT, 5, 1);

SELECT * from estoque;

UPDATE estoque SET quantidade = (quantidade - 1) WHERE fkProduto = 1;