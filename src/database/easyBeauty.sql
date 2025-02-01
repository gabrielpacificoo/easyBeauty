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


/* INSERT DE 50 PRODUTOS */
INSERT INTO produto(nome, preco_compra, preco_venda, descricao, categoria, qtd_estoque) VALUES 
  ('Máscara Capilar L\'Oréal', 25, 59.90, 'Máscara de Reconstrução 500g', 'Cabelos', 35),
  ('Batom Matte Vult', 8, 19.90, 'Batom Matte Durabilidade Extrema', 'Maquiagem', 42),
  ('Base Liquida Maybelline', 30, 69.90, 'Base Fit Me Matte + Poreless', 'Maquiagem', 28),
  ('Paleta de Sombras Ruby Rose', 50, 99.90, 'Paleta de Sombras 12 Cores', 'Maquiagem', 15),
  ('Delineador Líquido Risqué', 10, 24.90, 'Delineador Precision Liner', 'Maquiagem', 37),
  ('Pó Compacto Vult', 12, 29.90, 'Pó Compacto Matte HD', 'Maquiagem', 20),
  ('Creme Hidratante Nivea', 15, 39.90, 'Creme Hidratante Corporal 400ml', 'Pele', 45),
  ('Protetor Solar Neutrogena', 40, 89.90, 'Protetor Solar FPS 70', 'Pele', 30),
  ('Esfoliante Facial La Roche-Posay', 35, 79.90, 'Esfoliante Facial Suave', 'Pele', 18),
  ('Água Micelar Garnier', 20, 49.90, 'Água Micelar 400ml', 'Pele', 25),
  ('Serum Facial Hyalu B5', 60, 129.90, 'Serum Anti-Idade', 'Pele', 12),
  ('Shampoo Anticaspa Head & Shoulders', 18, 39.90, 'Shampoo Anticaspa 400ml', 'Cabelos', 40),
  ('Condicionador Tresemmé', 22, 49.90, 'Condicionador Hidratação Profunda', 'Cabelos', 33),
  ('Óleo Corporal Natura', 28, 59.90, 'Óleo Corporal Hidratante', 'Pele', 22),
  ('Perfume Eudora', 50, 119.90, 'Perfume Feminino 100ml', 'Fragrâncias', 14),
  ('Desodorante Rexona', 10, 24.90, 'Desodorante Aerosol 150ml', 'Higiêne', 50),
  ('Creme para Mãos Nivea', 12, 29.90, 'Creme para Mãos 75ml', 'Pele', 27),
  ('Máscara Facial Argila Verde', 15, 34.90, 'Máscara Facial Purificante', 'Pele', 19),
  ('Esmalte Risqué', 5, 12.90, 'Esmalte Cremoso 8ml', 'Maquiagem', 48),
  ('Gel de Cabelo L\'Oréal', 18, 39.90, 'Gel Fixador Cabelos Cacheados', 'Cabelos', 23),
  ('Creme para Pentear Salon Line', 20, 44.90, 'Creme para Pentear 300g', 'Cabelos', 31),
  ('Batom Líquido Ruby Rose', 25, 59.90, 'Batom Líquido Matte', 'Maquiagem', 16),
  ('Blush em Pó Vult', 10, 24.90, 'Blush em Pó 4g', 'Maquiagem', 38),
  ('Iluminador Facial Vult', 15, 34.90, 'Iluminador Líquido 10ml', 'Maquiagem', 21),
  ('Lenços Demaquilantes Garnier', 8, 19.90, 'Lenços Demaquilantes 25 unidades', 'Pele', 44),
  ('Sabonete Líquido Dove', 12, 29.90, 'Sabonete Líquido 200ml', 'Higiêne', 36),
  ('Creme Dental Colgate', 6, 14.90, 'Creme Dental Tripla Ação', 'Higiêne', 49),
  ('Hidratante Labial Nivea', 5, 12.90, 'Hidratante Labial 4.8g', 'Pele', 29),
  ('Máscara de Cílios Maybelline', 20, 49.90, 'Máscara de Cílios Colossal', 'Maquiagem', 17),
  ('Lápis de Olho Vult', 8, 19.90, 'Lápis de Olho Preto', 'Maquiagem', 41),
  ('Creme para Assaduras Hipoglós', 15, 34.90, 'Creme para Assaduras 60g', 'Pele', 26),
  ('Loção Pós-Barba Nivea', 18, 39.90, 'Loção Pós-Barba 100ml', 'Pele', 24),
  ('Gel de Limpeza Facial Neutrogena', 25, 59.90, 'Gel de Limpeza Facial 200ml', 'Pele', 13),
  ('Tônico Facial La Roche-Posay', 30, 69.90, 'Tônico Facial Adstringente', 'Pele', 11),
  ('Máscara de Cílios L\'Oréal', 22, 49.90, 'Máscara de Cílios Volume Million Lashes', 'Maquiagem', 34),
  ('Batom Hidratante Nivea', 7, 16.90, 'Batom Hidratante 4.8g', 'Maquiagem', 43),
  ('Creme para Pé Nivea', 10, 24.90, 'Creme para Pé 100ml', 'Pele', 32),
  ('Desodorante Roll-On Dove', 9, 22.90, 'Desodorante Roll-On 50ml', 'Higiêne', 47),
  ('Sabonete em Barra Dove', 4, 9.90, 'Sabonete em Barra 90g', 'Higiêne', 39),
  ('Creme de Barbear Gillette', 12, 29.90, 'Creme de Barbear 200ml', 'Higiêne', 28),
  ('Loção Hidratante Cetaphil', 35, 79.90, 'Loção Hidratante 500ml', 'Pele', 20),
  ('Protetor Labial Nivea', 6, 14.90, 'Protetor Labial FPS 30', 'Pele', 45),
  ('Creme para Olhos La Roche-Posay', 40, 89.90, 'Creme para Olhos Anti-Idade', 'Pele', 14),
  ('Máscara Capilar Salon Line', 18, 39.90, 'Máscara Capilar Hidratação Intensa', 'Cabelos', 37),
  ('Shampoo Clear', 20, 44.90, 'Shampoo Anticaspa 400ml', 'Cabelos', 25),
  ('Condicionador Pantene', 22, 49.90, 'Condicionador Restauração Total', 'Cabelos', 30),
  ('Perfume Natura', 55, 129.90, 'Perfume Masculino 100ml', 'Fragrâncias', 16),
  ('Desodorante Aerosol Axe', 12, 29.90, 'Desodorante Aerosol 150ml', 'Higiêne', 42),
  ('Creme para Mãos Granado', 14, 34.90, 'Creme para Mãos 75ml', 'Pele', 23);



  INSERT INTO usuario(nome, dtNascimento, cpf, email, senha, nivelAcesso) VALUES 
  ('Ana Silva', '1990-05-12', '12345678901', 'ana.silva@gmail.com', 'senha123', 0),
  ('Carlos Oliveira', '1985-08-25', '23456789012', 'carlos.oliveira@hotmail.com', 'carlos123', 0),
  ('Mariana Costa', '1995-11-30', '34567890123', 'mariana.costa@yahoo.com', 'mariana456', 0),
  ('João Santos', '1988-03-17', '45678901234', 'joao.santos@gmail.com', 'joao789', 0),
  ('Fernanda Lima', '1992-07-22', '56789012345', 'fernanda.lima@outlook.com', 'fernanda321', 0),
  ('Ricardo Almeida', '1987-09-14', '67890123456', 'ricardo.almeida@gmail.com', 'ricardo654', 0),
  ('Patrícia Souza', '1993-12-05', '78901234567', 'patricia.souza@hotmail.com', 'patricia987', 0),
  ('Lucas Pereira', '1991-04-18', '89012345678', 'lucas.pereira@yahoo.com', 'lucas123', 0),
  ('Juliana Rocha', '1989-06-20', '90123456789', 'juliana.rocha@gmail.com', 'juliana456', 0),
  ('Roberto Fernandes', '1986-10-11', '01234567890', 'roberto.fernandes@outlook.com', 'roberto789', 0);

  SELECT * from usuario;

INSERT INTO compra(fkUsuario, fkProduto, dtCompra) VALUES 
  (2, 5, '2025-01-20 10:00:00'),
  (2, 3, '2025-01-20 10:00:00'),
  (2, 12, '2025-01-20 10:00:00'),
  (5, 19, '2025-01-20 10:00:00'),
  (4, 15, '2025-01-20 10:00:00'),
  
  (5, 24, '2025-01-25 10:00:00'),
  (9, 34, '2025-01-25 10:00:00'),
  (9, 37, '2025-01-25 10:00:00'),
  (9, 18, '2025-01-25 10:00:00'),
  (9, 17, '2025-01-25 10:00:00'),
  
  (6, 45, '2025-01-30 10:00:00'),
  (1, 27, '2025-01-30 10:00:00'),
  (1, 27, '2025-01-30 10:00:00'),
  (4, 27, '2025-01-30 10:00:00'),
  (3, 27, '2025-01-30 10:00:00'),
  
  (9, 19,'2025-02-05 10:00:00'),
  (7, 33,'2025-02-05 10:00:00'),
  (6, 42,'2025-02-05 10:00:00'),
  (3, 28,'2025-02-05 10:00:00'),
  (3, 49,'2025-02-05 10:00:00'),
  (2, 26,'2025-02-05 10:00:00');

SELECT p.nome as Produto,
  count(p.nome) as Quantidade,
  c.dtCompra as 'Data da compra',
  p.preco_compra as 'Preço de Compra',
  p.preco_venda as 'Preço de Venda',
  sum((p.preco_venda - p.preco_compra)) as Lucro 
  FROM produto as p
  JOIN compra as c
  ON c.fkProduto = p.idProduto
  WHERE c.dtCompra like '2025-01-25%'
  GROUP BY p.nome, c.dtCompra, p.preco_compra, p.preco_venda;

SELECT p.categoria as Categoria,
  COUNT(p.categoria) as Quantidade,
  CONCAT('R$', SUM((p.preco_venda * p.qtd_estoque))) as 'Valor de estoque'
  FROM produto as p
  GROUP BY p.categoria

SELECT 