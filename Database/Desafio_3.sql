#Produtos Mais Vendidos
SELECT p.nome_produto, p.categoria, SUM(v.quantidade) AS Quantidade
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome_produto, p.categoria
ORDER BY SUM(v.quantidade) DESC
;

#Produtos Menos Vendidos
SELECT p.nome_produto, p.categoria, SUM(v.quantidade) AS Quantidade
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome_produto, p.categoria
ORDER BY SUM(v.quantidade)
;