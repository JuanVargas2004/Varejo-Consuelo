SELECT v.id_produto AS Produto, 
		COUNT(v.data_venda) AS Dias, 
        SUM(v.quantidade) AS Volumes
        #SUM((v.preco_unitario * v.quantidade) - v.desconto) AS Receita
FROM vendas v
JOIN promocoes p ON (v.id_produto = p.id_produto) AND (v.data_venda BETWEEN p.data_inicio AND p.data_fim)
GROUP BY v.id_produto
ORDER BY Produto
;

SELECT v.id_produto AS Produto, 
		COUNT(v.data_venda) AS Dias, 
        SUM(v.quantidade) AS Volumes
        #SUM((v.preco_unitario * v.quantidade) - v.desconto) AS Receita
FROM vendas v
LEFT JOIN promocoes p ON (v.id_produto = p.id_produto) AND (v.data_venda BETWEEN p.data_inicio AND p.data_fim)
WHERE p.id_promocao IS NULL
GROUP BY v.id_produto
ORDER BY Produto
;


WITH vcp AS (
SELECT v.id_produto AS Produto, 
		COUNT(v.data_venda) AS Dias, 
        SUM(v.quantidade) AS Volumes
        #SUM((v.preco_unitario * v.quantidade) - v.desconto) AS Receita
FROM vendas v
JOIN promocoes p ON (v.id_produto = p.id_produto) AND (v.data_venda BETWEEN p.data_inicio AND p.data_fim)
GROUP BY v.id_produto
ORDER BY Produto
), vsp AS (
SELECT v.id_produto AS Produto, 
		COUNT(v.data_venda) AS Dias, 
        SUM(v.quantidade) AS Volumes
        #SUM((v.preco_unitario * v.quantidade) - v.desconto) AS Receita
FROM vendas v
LEFT JOIN promocoes p ON (v.id_produto = p.id_produto) AND (v.data_venda BETWEEN p.data_inicio AND p.data_fim)
WHERE p.id_promocao IS NULL
GROUP BY v.id_produto
ORDER BY Produto)
SELECT  vcp.Produto, 
		vcp.Dias AS Dias_Promo,
        vcp.Volumes AS Volumes_Promo,
        vsp.Dias AS Dias_SemPromo,
        vsp.Volumes AS Volumes_SemPromo,
        ( (vcp.Volumes)/(vcp.Dias) ) / ( (vsp.Volumes)/(vsp.Dias) ) AS Diferença
FROM vcp
JOIN vsp ON vcp.produto = vsp.produto
ORDER BY Produto
;