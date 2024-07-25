SELECT v.id_loja, l.pais, l.cidade, COUNT(id_venda) AS quantidade_vendas
FROM vendas v
JOIN lojas l ON v.id_loja = l.id_loja
GROUP BY v.id_loja, l.pais, l.cidade
ORDER BY quantidade_vendas DESC
;