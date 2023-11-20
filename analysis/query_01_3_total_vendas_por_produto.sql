-- Esta query calcula várias métricas relacionadas a vendas e fretes para cada ProdutoID.
SELECT
    dv.ProdutoID,  -- Seleciona o ID do produto da tabela detalhes_vendas.
    COUNT(DISTINCT dv.CupomID) AS QuantidadeCupons,  -- Calcula a quantidade de cupons distintos para cada produto.
    SUM(dv.Valor) AS ValorTotalVendas,     -- Calcula o valor total das vendas somando os valores individuais dos produtos.
    SUM(cv.ValorFrete) AS ValorTotalFretes,  -- Calcula o valor total dos fretes somando os valores de frete para cada produto.
    (SUM(cv.ValorFrete) / SUM(dv.Valor)) AS ProporcaoFreteSobreVendas  -- Calcula a proporção de frete sobre vendas, dividindo o valor total de frete pelo valor total de vendas para cada produto.
FROM
    detalhes_vendas dv  -- Referencia a tabela detalhes_vendas como 'dv' para simplificar a consulta.
JOIN
    cabecalho_vendas cv ON dv.CupomID = cv.CupomID  -- Realiza uma junção entre as tabelas detalhes_vendas e cabecalho_vendas usando a coluna 'CupomID' como chave de junção.
GROUP BY
    dv.ProdutoID  -- Agrupa os resultados pelo ID do produto, permitindo calcular as métricas para cada produto.
ORDER BY
    ValorTotalVendas DESC;  -- Ordena os resultados em ordem decrescente com base no valor total de vendas.
