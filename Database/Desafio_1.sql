#  Distribuição de vendas por país, região e categoria de produto
SELECT l.pais AS Pais, p.categoria AS Categoria, SUM(v.quantidade) as Quantidade
FROM vendas v
JOIN lojas l ON v.id_loja = l.id_loja
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY l.pais, p.categoria 
ORDER BY Pais, Categoria
;

