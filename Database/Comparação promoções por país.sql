# Com Promoção
SELECT l.pais, v.data_venda, SUM(v.quantidade) AS volumes
FROM vendas v
JOIN promocoes p ON (v.id_produto = p.id_produto) AND (v.data_venda BETWEEN p.data_inicio AND p.data_fim)
JOIN lojas l ON v.id_loja = l.id_loja
GROUP BY l.pais, v.data_venda
ORDER BY l.pais
;

# Sem Promoção
SELECT l.pais, v.data_venda, SUM(v.quantidade) AS volumes
FROM vendas v
LEFT JOIN promocoes p ON (v.id_produto = p.id_produto) AND (v.data_venda BETWEEN p.data_inicio AND p.data_fim)
JOIN lojas l ON v.id_loja = l.id_loja
WHERE p.id_promocao IS NULL
GROUP BY l.pais, v.data_venda
ORDER BY l.pais
;



# Juntando tabelas

SELECT 'Com Promoção' AS tipo_promocao, l.pais, v.data_venda, SUM(v.quantidade) AS volumes
FROM vendas v
JOIN promocoes p ON (v.id_produto = p.id_produto) AND (v.data_venda BETWEEN p.data_inicio AND p.data_fim)
JOIN lojas l ON v.id_loja = l.id_loja
GROUP BY l.pais, v.data_venda

UNION ALL

SELECT 'Sem Promoção' AS tipo_promocao, l.pais, v.data_venda, SUM(v.quantidade) AS volumes
FROM vendas v
LEFT JOIN promocoes p ON (v.id_produto = p.id_produto) AND (v.data_venda BETWEEN p.data_inicio AND p.data_fim)
JOIN lojas l ON v.id_loja = l.id_loja
WHERE p.id_promocao IS NULL
GROUP BY l.pais, v.data_venda

ORDER BY pais, tipo_promocao, data_venda;



# Testando

SELECT  tipo_promocao, 
		pais, 
        COUNT(data_venda) AS Dias, 
        SUM(volumes) AS Volumes,
        (SUM(volumes))/(COUNT(data_venda)) AS media
FROM (
SELECT 'Com Promoção' AS tipo_promocao, l.pais, v.data_venda, SUM(v.quantidade) AS volumes
FROM vendas v
JOIN promocoes p ON (v.id_produto = p.id_produto) AND (v.data_venda BETWEEN p.data_inicio AND p.data_fim)
JOIN lojas l ON v.id_loja = l.id_loja
GROUP BY l.pais, v.data_venda
UNION ALL
SELECT 'Sem Promoção' AS tipo_promocao, l.pais, v.data_venda, SUM(v.quantidade) AS volumes
FROM vendas v
LEFT JOIN promocoes p ON (v.id_produto = p.id_produto) AND (v.data_venda BETWEEN p.data_inicio AND p.data_fim)
JOIN lojas l ON v.id_loja = l.id_loja
WHERE p.id_promocao IS NULL
GROUP BY l.pais, v.data_venda

ORDER BY pais, tipo_promocao, data_venda
) vp
GROUP BY tipo_promocao, pais
;