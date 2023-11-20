-- Pergunta 8: Média de compras que um cliente faz
-- Esta query calcula a média geral de compras por cliente, a média anual e a variação percentual anual das médias.
WITH MediaComprasCliente AS (
    SELECT
        cl.Cliente,  -- Seleciona a coluna 'Cliente'.
        EXTRACT(YEAR FROM cv.Data) AS Ano,  -- Extrai o ano da coluna 'Data' da tabela 'cabecalho_vendas' e renomeia como 'Ano'.
        AVG(dv.Quantidade) AS MediaComprasCliente  -- Calcula a média da coluna 'Quantidade' da tabela 'detalhes_vendas' e renomeia como 'MediaComprasCliente'.
    FROM
        detalhes_vendas dv  -- Referencia a tabela 'detalhes_vendas' como 'dv' para simplificar a consulta.
    JOIN
        cabecalho_vendas cv ON dv.CupomID = cv.CupomID  -- Realiza uma junção entre 'detalhes_vendas' e 'cabecalho_vendas' usando a coluna 'CupomID' como chave de junção.
    JOIN
        clientes cl ON cv.ClienteID = cl.ClienteID  -- Realiza uma junção entre 'cabecalho_vendas' e 'clientes' usando a coluna 'ClienteID' como chave de junção.
    GROUP BY
        cl.Cliente, Ano  -- Agrupa os resultados por cliente e ano.
)

SELECT
    Ano,  -- Seleciona o ano.
    ROUND(AVG(MediaComprasCliente), 2) AS MediaGeralCompras,  -- Calcula a média geral das médias de compras por cliente e arredonda para 2 casas decimais, renomeando como 'MediaGeralCompras'.
    ROUND((AVG(MediaComprasCliente) - LAG(AVG(MediaComprasCliente)) OVER (ORDER BY Ano)) / LAG(AVG(MediaComprasCliente)) OVER (ORDER BY Ano) * 100, 2) AS VariacaoPercentual  -- Calcula a variação percentual anual das médias de compras por cliente em relação ao ano anterior e arredonda para 2 casas decimais, renomeando como 'VariacaoPercentual'.
FROM
    MediaComprasCliente  -- Seleciona os resultados da consulta CTE 'MediaComprasCliente'.
GROUP BY
    Ano  -- Agrupa os resultados por ano.
ORDER BY
    Ano;  -- Ordena os resultados por ano.
