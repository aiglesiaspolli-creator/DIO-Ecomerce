SELECT *
FROM cliente;


SELECT *
FROM produto;


SELECT descricao, valor
FROM produto
WHERE valor > 1000;


SELECT *
FROM pedido
WHERE status = 'Entregue';


SELECT descricao, valor,
    valor * 0.90 AS valor_promocional
FROM produto;


SELECT
    CONCAT(primeiro_nome,' ',sobrenome) AS cliente
FROM cliente;


SELECT descricao, valor
FROM produto
ORDER BY valor DESC;


SELECT c.id,
    CONCAT(c.primeiro_nome,' ',c.sobrenome) AS cliente,
    COUNT(p.id) AS total_pedidos
FROM cliente c
LEFT JOIN pedido p
ON c.id = p.cliente_id
GROUP BY c.id, cliente;


SELECT e.local,
    SUM(pe.quantidade) AS total_produtos
FROM estoque e
JOIN produto_has_estoque pe
ON e.id = pe.estoque_id
GROUP BY e.local;


SELECT e.local,
    SUM(pe.quantidade) AS quantidade
FROM estoque e
JOIN produto_has_estoque pe
ON e.id = pe.estoque_id
GROUP BY e.local
HAVING quantidade > 50;






