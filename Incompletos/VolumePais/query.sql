SELECT l.pais, SUM(v.quantidade) AS volumes
FROM vendas v
JOIN lojas l ON v.id_loja = l.id_loja
GROUP BY l.pais
ORDER BY volumes DESC
;