-- Pergunta 4: Lucro dos meses
-- Esta query calcula o lucro mensal para os anos de 2014 a 2018.
SELECT
    EXTRACT(MONTH FROM cv.Data) AS Mes,  -- Extrai o mês da coluna 'Data' da tabela 'cabecalho_vendas' e nomeia como 'Mes'.
    SUM(CASE WHEN EXTRACT(YEAR FROM cv.Data) = 2014 THEN ROUND(dv.Valor - dv.Custo, 2) ELSE 0 END) AS Lucro_2014,  -- Calcula o lucro para o ano de 2014.
    SUM(CASE WHEN EXTRACT(YEAR FROM cv.Data) = 2015 THEN ROUND(dv.Valor - dv.Custo, 2) ELSE 0 END) AS Lucro_2015,  -- Calcula o lucro para o ano de 2015.
    SUM(CASE WHEN EXTRACT(YEAR FROM cv.Data) = 2016 THEN ROUND(dv.Valor - dv.Custo, 2) ELSE 0 END) AS Lucro_2016,  -- Calcula o lucro para o ano de 2016.
    SUM(CASE WHEN EXTRACT(YEAR FROM cv.Data) = 2017 THEN ROUND(dv.Valor - dv.Custo, 2) ELSE 0 END) AS Lucro_2017,  -- Calcula o lucro para o ano de 2017.
    SUM(CASE WHEN EXTRACT(YEAR FROM cv.Data) = 2018 THEN ROUND(dv.Valor - dv.Custo, 2) ELSE 0 END) AS Lucro_2018   -- Calcula o lucro para o ano de 2018.
FROM detalhes_vendas dv  -- Referencia a tabela 'detalhes_vendas' como 'dv' para simplificar a consulta.
JOIN cabecalho_vendas cv ON dv.CupomID = cv.CupomID  -- Realiza uma junção entre 'detalhes_vendas' e 'cabecalho_vendas' usando a coluna 'CupomID' como chave de junção.
GROUP BY Mes  -- Agrupa os resultados por mês.
ORDER BY Mes;  -- Ordena os resultados em ordem crescente de mês.
