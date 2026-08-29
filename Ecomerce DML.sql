INSERT INTO cliente
(primeiro_nome, nome_meio, sobrenome, cpf, endereco, data_nascimento)
VALUES
('Arthur','I','Polli','11111111111','São Bernardo do Campo - SP','2003-08-10'),
('Maria','A','Silva','22222222222','Santo André - SP','1999-05-15'),
('João','C','Souza','33333333333','São Paulo - SP','1995-10-02'),
('Ana','L','Oliveira','44444444444','São Caetano - SP','2001-01-20'),
('Carlos','M','Ferreira','55555555555','Diadema - SP','1998-12-18');

INSERT INTO fornecedor
(razao_social, cnpj)
VALUES
('Tech Distribuidora LTDA','11111111000111'),
('Mega Informática SA','22222222000122'),
('Brasil Hardware LTDA','33333333000133');

INSERT INTO terceiro_vendedor
(razao_social, nome_fantasia, local, endereco)
VALUES
('Loja Digital LTDA','Loja Digital','São Paulo','Av. Paulista'),
('Tech Store LTDA','Tech Store','Campinas','Rua Central'),
('Informática Express','Info Express','Santos','Rua do Porto');

INSERT INTO estoque
(local)
VALUES
('Centro de Distribuição - SP'),
('Centro de Distribuição - Campinas'),
('Centro de Distribuição - Santos');

INSERT INTO produto
(categoria, descricao, marca, valor, peso)
VALUES
('Notebook','Notebook Dell Inspiron','Dell',4500.00,2.30),
('Notebook','Notebook Lenovo IdeaPad','Lenovo',3900.00,2.10),
('Monitor','Monitor LG 24 Polegadas','LG',980.00,3.50),
('Teclado','Teclado Mecânico Redragon','Redragon',320.00,0.80),
('Mouse','Mouse Logitech G502','Logitech',260.00,0.35),
('Headset','Headset HyperX Cloud','HyperX',540.00,0.70),
('SSD','SSD Kingston 1TB','Kingston',480.00,0.20),
('Memória RAM','Kingston Fury 16GB','Kingston',390.00,0.10);

INSERT INTO produto_has_estoque
(produto_id, estoque_id, quantidade)
VALUES
(1,1,20),
(2,1,15),
(3,1,30),
(4,2,50),
(5,2,60),
(6,3,25),
(7,3,80),
(8,1,100);

INSERT INTO disponibilizando_produto
(fornecedor_id, produto_id)
VALUES
(1,1),
(1,2),
(2,3),
(2,4),
(2,5),
(3,6),
(3,7),
(3,8);

INSERT INTO produtos_por_vendedor
(terceiro_vendedor_id, produto_id, quantidade)
VALUES
(1,1,10),
(1,2,6),
(1,5,15),
(2,3,12),
(2,4,20),
(2,7,25),
(3,6,8),
(3,8,18);

INSERT INTO pedido
(cliente_id, status, descricao, frete)
VALUES
(1,'Entregue','Compra de notebook',35.00),
(2,'Enviado','Compra gamer',45.00),
(3,'Pendente','Upgrade computador',28.00),
(4,'Processando','Equipamentos escritório',30.00),
(5,'Cancelado','Pedido cancelado',20.00);

INSERT INTO relacao_produto_pedido
(produto_id, pedido_id, quantidade, status)
VALUES
(1,1,1,'Entregue'),
(5,2,2,'Enviado'),
(4,2,1,'Enviado'),
(7,3,1,'Separando'),
(8,3,2,'Separando'),
(3,4,2,'Separando'),
(4,4,2,'Separando'),
(2,5,1,'Cancelado');