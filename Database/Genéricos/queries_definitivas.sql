# Vendas Totais por Mês:
SELECT	YEAR(data_venda) AS ano,
		MONTH(data_venda) AS mes,
        SUM((quantidade * preco_unitario) - desconto) AS receita
FROM vendas
GROUP BY ano, mes
ORDER BY ano, mes
;

# Desempenho por Produto:
SELECT p.nome_produto, SUM(v.quantidade) AS quantidade_vendida, SUM((v.quantidade * v.preco_unitario) - desconto) AS receita
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome_produto
ORDER BY receita DESC;

# Eficácia das Promoções
SELECT	promocao, 
	SUM(quantidade) AS quantidade_vendida, 
    SUM((quantidade * preco_unitario) - desconto) AS receita
FROM vendas
GROUP BY promocao;
