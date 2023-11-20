-- Pergunta 3: Quantidade e valor das vendas por dia, mês, ano:
-- Esta query calcula a quantidade total e o valor total de vendas por dia, mês e ano.
SELECT 
    EXTRACT(DAY FROM cv.Data) AS Dia,  -- Extrai o dia da coluna 'Data' da tabela 'cabecalho_vendas' e nomeia como 'Dia'.
    EXTRACT(MONTH FROM cv.Data) AS Mes,  -- Extrai o mês da coluna 'Data' da tabela 'cabecalho_vendas' e nomeia como 'Mes'.
    EXTRACT(YEAR FROM cv.Data) AS Ano,  -- Extrai o ano da coluna 'Data' da tabela 'cabecalho_vendas' e nomeia como 'Ano'.
    SUM(dv.Quantidade) AS QuantidadeTotal,  -- Calcula a soma da coluna 'Quantidade' da tabela 'detalhes_vendas' e nomeia como 'QuantidadeTotal'.
    SUM(dv.Valor) AS ValorTotal  -- Calcula a soma da coluna 'Valor' da tabela 'detalhes_vendas' e nomeia como 'ValorTotal'.
FROM detalhes_vendas dv  -- Referencia a tabela 'detalhes_vendas' como 'dv' para simplificar a consulta.
JOIN cabecalho_vendas cv ON dv.CupomID = cv.CupomID  -- Realiza uma junção entre 'detalhes_vendas' e 'cabecalho_vendas' usando a coluna 'CupomID' como chave de junção.
GROUP BY Dia, Mes, Ano  -- Agrupa os resultados por dia, mês e ano, permitindo calcular a quantidade e o valor total para cada combinação de data.
ORDER BY Dia, Mes, Ano;  -- Ordena os resultados em ordem crescente de dia, mês e ano.
