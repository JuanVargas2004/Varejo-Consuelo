SELECT l.pais, ROUND(SUM((v.preco_unitario * v.quantidade) - v.desconto), 2) AS receita
FROM vendas v
JOIN lojas l ON v.id_loja = l.id_loja
GROUP BY l.pais
ORDER BY receita DESC
;