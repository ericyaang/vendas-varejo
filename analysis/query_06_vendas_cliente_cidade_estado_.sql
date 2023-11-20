-- Pergunta 6: Venda por cliente, cidade do cliente e estado
-- Esta query calcula a quantidade total de vendas por cliente, cidade e país e ordena os resultados em ordem decrescente de quantidade total.
SELECT
    cl.Cliente,  -- Seleciona a coluna 'Cliente' da tabela 'clientes'.
    cl.Cidade,   -- Seleciona a coluna 'Cidade' da tabela 'clientes'.
    cl.Pais,     -- Seleciona a coluna 'Pais' da tabela 'clientes'.
    SUM(dv.Quantidade) AS QuantidadeTotal  -- Calcula a soma da coluna 'Quantidade' da tabela 'detalhes_vendas' e a renomeia como 'QuantidadeTotal'.
FROM
    detalhes_vendas dv  -- Referencia a tabela 'detalhes_vendas' como 'dv' para simplificar a consulta.
JOIN
    cabecalho_vendas cv ON dv.CupomID = cv.CupomID  -- Realiza uma junção entre 'detalhes_vendas' e 'cabecalho_vendas' usando a coluna 'CupomID' como chave de junção.
JOIN
    clientes cl ON cv.ClienteID = cl.ClienteID  -- Realiza uma junção entre 'cabecalho_vendas' e 'clientes' usando a coluna 'ClienteID' como chave de junção.
GROUP BY
    cl.Cliente,   -- Agrupa os resultados por cliente.
    cl.Cidade,    -- Agrupa os resultados por cidade.
    cl.Pais       -- Agrupa os resultados por país.
ORDER BY
    QuantidadeTotal DESC;  -- Ordena os resultados em ordem decrescente de 'QuantidadeTotal'.
