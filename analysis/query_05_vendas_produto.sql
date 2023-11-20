-- Pergunta 5: Venda por produto
-- Esta query calcula a quantidade total de vendas por produto e ordena os resultados em ordem decrescente de quantidade total.
SELECT p.Produto,  -- Seleciona a coluna 'Produto' da tabela 'produtos' e a renomeia como 'Produto'.
       SUM(dv.Quantidade) AS QuantidadeTotal  -- Calcula a soma da coluna 'Quantidade' da tabela 'detalhes_vendas' e a renomeia como 'QuantidadeTotal'.
FROM detalhes_vendas dv  -- Referencia a tabela 'detalhes_vendas' como 'dv' para simplificar a consulta.
JOIN produtos p ON dv.ProdutoID = p.ProdutoID  -- Realiza uma junção entre 'detalhes_vendas' e 'produtos' usando a coluna 'ProdutoID' como chave de junção.
GROUP BY p.Produto  -- Agrupa os resultados por produto.
ORDER BY QuantidadeTotal DESC;  -- Ordena os resultados em ordem decrescente de 'QuantidadeTotal'.
