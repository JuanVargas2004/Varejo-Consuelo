#-------------------------------------------------------------------------------------------------------------#
SELECT v.id_produto, v.data_venda, SUM((v.quantidade * v.preco_unitario) - v.desconto) AS Receita_Promo
FROM vendas v
JOIN promocoes promo ON (v.id_produto = promo.id_produto) AND (v.data_venda BETWEEN promo.data_inicio AND promo.data_fim)
GROUP BY v.id_produto, v.data_venda
ORDER BY v.id_produto
;


SELECT id_produto, COUNT(data_venda) AS Dias_Promo, SUM(Receita_Promo) AS Receita_Promo
FROM (
SELECT v.id_produto, v.data_venda, SUM((v.quantidade * v.preco_unitario) - v.desconto) AS Receita_Promo
FROM vendas v
JOIN promocoes promo ON (v.id_produto = promo.id_produto) AND (v.data_venda BETWEEN promo.data_inicio AND promo.data_fim)
GROUP BY v.id_produto, v.data_venda
ORDER BY v.id_produto
) somarvcp
GROUP BY id_produto
;
#-------------------------------------------------------------------------------------------------------------#

SELECT v.id_produto, v.data_venda, SUM((v.quantidade * v.preco_unitario) - v.desconto) AS Receita_SemPromo
FROM vendas v
LEFT JOIN promocoes promo ON (v.id_produto = promo.id_produto) AND (v.data_venda BETWEEN promo.data_inicio AND promo.data_fim)
WHERE promo.id_promocao IS NULL
GROUP BY v.id_produto, v.data_venda
ORDER BY v.id_produto
;


SELECT id_produto, COUNT(data_venda) AS Dias_SemPromo, SUM(Receita_SemPromo) as Receita_SemPromo
FROM (
SELECT v.id_produto, v.data_venda, SUM((v.quantidade * v.preco_unitario) - v.desconto) AS Receita_SemPromo
FROM vendas v
LEFT JOIN promocoes promo ON (v.id_produto = promo.id_produto) AND (v.data_venda BETWEEN promo.data_inicio AND promo.data_fim)
WHERE promo.id_promocao IS NULL
GROUP BY v.id_produto, v.data_venda
ORDER BY v.id_produto
) somarvsp
GROUP BY id_produto
;



WITH vcp AS (
SELECT id_produto, COUNT(data_venda) AS Dias_Promo, SUM(Receita_Promo) AS Receita_Promo
FROM (
SELECT v.id_produto, v.data_venda, SUM((v.quantidade * v.preco_unitario) - v.desconto) AS Receita_Promo
FROM vendas v
JOIN promocoes promo ON (v.id_produto = promo.id_produto) AND (v.data_venda BETWEEN promo.data_inicio AND promo.data_fim)
GROUP BY v.id_produto, v.data_venda
ORDER BY v.id_produto
) somarvcp
GROUP BY id_produto
), vsp AS (
SELECT id_produto, COUNT(data_venda) AS Dias_SemPromo, SUM(Receita_SemPromo) as Receita_SemPromo
FROM (
SELECT v.id_produto, v.data_venda, SUM((v.quantidade * v.preco_unitario) - v.desconto) AS Receita_SemPromo
FROM vendas v
LEFT JOIN promocoes promo ON (v.id_produto = promo.id_produto) AND (v.data_venda BETWEEN promo.data_inicio AND promo.data_fim)
WHERE promo.id_promocao IS NULL
GROUP BY v.id_produto, v.data_venda
ORDER BY v.id_produto
) somarvsp
GROUP BY id_produto
)
SELECT *
FROM vcp
JOIN vsp ON vcp.id_produto = vsp.id_produto
;