SELECT l.nome_loja, C.satisfacao, COUNT(satisfacao)
FROM vendas V
INNER JOIN clientes C ON V.id_cliente = C.id_cliente
INNER JOIN lojas L ON V.id_loja = L.id_loja
GROUP BY L.nome_loja, C.satisfacao
ORDER BY L.nome_loja
;

#VER MÉDIA DE AVALIAÇÃO POR LOJA
SELECT l.nome_loja, AVG(C.satisfacao) AS Media_Satisfacao
FROM vendas V
INNER JOIN clientes C ON V.id_cliente = C.id_cliente
INNER JOIN lojas L ON V.id_loja = L.id_loja
GROUP BY L.nome_loja
ORDER BY L.nome_loja
;


#LISTA DE PRODUTOS MAIS/MENOS VENDIDOS
SELECT p.nome_produto, SUM(v.quantidade) AS quantidade_vendida
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome_produto
ORDER BY quantidade_vendida DESC #ASC
;


#LISTA DE PRODUTOS MAIS/MENOS VENDIDOS POR PAÍS
SELECT l.pais, p.nome_produto, SUM(v.quantidade) AS quantidade_vendida
FROM vendas v 
JOIN lojas l ON v.id_loja = l.id_loja
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome_produto, l.pais
ORDER BY quantidade_vendida DESC
;


#LISTA CLIENTES MAIS VALIOSOS E SEUS PAÍSES
SELECT l.pais AS País, v.id_cliente AS ID_Cliente, SUM(v.quantidade) AS Num_Compras, c.satisfacao
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN lojas l ON v.id_loja = l.id_loja
GROUP BY ID_Cliente, l.pais
ORDER BY satisfacao DESC
;


SELECT l.pais,e.tipo_engajamento, e.rede_social, c.id_cliente, c.satisfacao
FROM engajamento e
JOIN clientes c ON e.id_cliente = c.id_cliente
JOIN vendas v ON c.id_cliente = v.id_cliente
JOIN lojas l ON v.id_loja = l.id_loja
;




#LISTA DE PRODUTOS MAIS/MENOS VENDIDOS POR PAÍS
SELECT l.pais, p.nome_produto, SUM(v.quantidade) AS quantidade_vendida
FROM vendas v 
JOIN lojas l ON v.id_loja = l.id_loja
JOIN produtos p ON v.id_produto = p.id_produto
JOIN cliente c ON v.id_cliente = c.id_cliente
GROUP BY p.nome_produto, l.pais
ORDER BY quantidade_vendida DESC;




SELECT c.id_cliente, p.nome_produto, c.satisfacao, p.id_produto
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN produtos p ON v.id_produto = p.id_produto
;

#AVALIACAO POR PRODUTO
SELECT p.categoria, p.nome_produto AS "Nome Produto",
SUM(CASE WHEN c.satisfacao = 1 THEN 1 ELSE 0 END) AS "Av.1",
SUM(CASE WHEN c.satisfacao = 2 THEN 1 ELSE 0 END) AS "Av.2",
SUM(CASE WHEN c.satisfacao = 3 THEN 1 ELSE 0 END) AS "Av.3",
SUM(CASE WHEN c.satisfacao = 4 THEN 1 ELSE 0 END) AS "Av.4",
SUM(CASE WHEN c.satisfacao = 5 THEN 1 ELSE 0 END) AS "Av.5",
SUM(v.quantidade) AS Quantidade_Vendida
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN produtos p ON v.id_produto = p.id_produto
WHERE (MONTH(v.data_venda) = c.mes_inicio) AND (YEAR(v.data_venda) = c.ano_inicio) AND p.nome_produto LIKE "Infantil 468%"
GROUP BY p.nome_produto, p.categoria
;



#AVALIACAO POR CATEGORIA
SELECT p.categoria AS Categoria,
SUM(CASE WHEN c.satisfacao = 1 THEN 1 ELSE 0 END) AS "Av.1",
SUM(CASE WHEN c.satisfacao = 2 THEN 1 ELSE 0 END) AS "Av.2",
SUM(CASE WHEN c.satisfacao = 3 THEN 1 ELSE 0 END) AS "Av.3",
SUM(CASE WHEN c.satisfacao = 4 THEN 1 ELSE 0 END) AS "Av.4",
SUM(CASE WHEN c.satisfacao = 5 THEN 1 ELSE 0 END) AS "Av.5",
SUM(v.quantidade) AS Quantidade_Vendida
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN produtos p ON v.id_produto = p.id_produto
WHERE (MONTH(v.data_venda) = c.mes_inicio) AND (YEAR(v.data_venda) = c.ano_inicio)
GROUP BY Categoria
;


SELECT c.id_cliente, v.data_venda, c.mes_inicio, c.ano_inicio, p.id_produto, c.satisfacao
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
JOIN clientes c ON v.id_cliente = c.id_cliente
ORDER BY c.id_cliente, v.data_venda
;

SELECT e.id_cliente, e.data_engajamento 
FROM engajamento e
ORDER BY id_cliente
;