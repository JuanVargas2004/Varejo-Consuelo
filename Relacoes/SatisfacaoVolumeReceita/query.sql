SELECT *
FROM clientes
;

SELECT *
FROM vendas
;

SELECT v.id_cliente, 
	c.satisfacao, 
	COUNT(v.data_venda) AS dias, 
    SUM(v.quantidade) as volumes,
    SUM((v.quantidade * v.preco_unitario) - v.desconto) AS receita
FROM vendas v
JOIN clientes c ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.satisfacao
ORDER BY v.id_cliente
;