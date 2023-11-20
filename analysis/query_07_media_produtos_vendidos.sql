-- Pergunta 7: Média de produtos vendidos
-- Esta query calcula a média de produtos vendidos por ano e a variação percentual em relação ao ano anterior.
WITH MediaProdutosVendidos AS (
    SELECT
        EXTRACT(YEAR FROM cv.Data) AS Ano,  -- Extrai o ano da coluna 'Data' da tabela 'cabecalho_vendas' e renomeia como 'Ano'.
        ROUND(AVG(dv.Quantidade), 2) AS MediaProdutosVendidos  -- Calcula a média da coluna 'Quantidade' da tabela 'detalhes_vendas' e arredonda para 2 casas decimais, renomeando como 'MediaProdutosVendidos'.
    FROM
        detalhes_vendas dv  -- Referencia a tabela 'detalhes_vendas' como 'dv' para simplificar a consulta.
    JOIN
        cabecalho_vendas cv ON dv.CupomID = cv.CupomID  -- Realiza uma junção entre 'detalhes_vendas' e 'cabecalho_vendas' usando a coluna 'CupomID' como chave de junção.
    GROUP BY
        Ano  -- Agrupa os resultados por ano.
    ORDER BY
        Ano  -- Ordena os resultados em ordem crescente de 'Ano'.
)

SELECT
    Ano,  -- Seleciona a coluna 'Ano'.
    MediaProdutosVendidos,  -- Seleciona a coluna 'MediaProdutosVendidos'.
    ROUND((MediaProdutosVendidos - LAG(MediaProdutosVendidos) OVER (ORDER BY Ano)) / LAG(MediaProdutosVendidos) OVER (ORDER BY Ano) * 100, 2) AS VariaçãoPercentual  -- Calcula a variação percentual entre a média de produtos vendidos em um ano e o ano anterior, arredondando para 2 casas decimais e renomeando como 'VariaçãoPercentual'.
FROM
    MediaProdutosVendidos;  -- Seleciona os resultados da consulta CTE 'MediaProdutosVendidos'.
