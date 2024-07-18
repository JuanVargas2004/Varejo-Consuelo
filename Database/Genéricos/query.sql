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


SELECT l.pais, p.nome_produto, SUM(v.quantidade) AS quantidade_vendida
FROM vendas v 
JOIN lojas l ON v.id_loja = l.id_loja
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome_produto, l.pais
ORDER BY quantidade_vendida
;



