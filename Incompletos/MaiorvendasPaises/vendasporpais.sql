WITH pq_vendas AS(
SELECT id_loja, id_produto, quantidade
FROM vendas
)
SELECT v.id_produto, l.pais, SUM(v.quantidade) AS volumes
FROM lojas l
JOIN pq_vendas v ON l.id_loja = v.id_loja
GROUP BY id_produto, pais
ORDER BY volumes DESC
;




