-- Esta query calcula várias métricas relacionadas a vendas e fretes para cada CupomID.
SELECT
    dv.CupomID,  -- Seleciona o ID do cupom da tabela detalhes_vendas.
    COUNT(DISTINCT dv.ProdutoID) AS QuantidadeProdutos,  -- Calcula a quantidade de produtos distintos em cada ordem de venda.
    SUM(dv.Valor) AS ValorTotalVendas,     -- Calcula o valor total das vendas somando os valores individuais dos produtos em cada ordem de venda.
    SUM(cv.ValorFrete) AS ValorTotalFretes,  -- Calcula o valor total dos fretes somando os valores de frete em cada ordem de venda.
    (SUM(cv.ValorFrete) / SUM(dv.Valor)) AS ProporcaoFreteSobreVendas  -- Calcula a proporção de frete sobre vendas, dividindo o valor total de frete pelo valor total de vendas.
FROM
    detalhes_vendas dv  -- Referencia a tabela detalhes_vendas como 'dv' para simplificar a consulta.
JOIN
    cabecalho_vendas cv ON dv.CupomID = cv.CupomID  -- Realiza uma junção entre as tabelas detalhes_vendas e cabecalho_vendas usando a coluna 'CupomID' como chave de junção.
GROUP BY
    dv.CupomID  -- Agrupa os resultados pelo ID do cupom, permitindo calcular as métricas para cada ordem de venda.
ORDER BY
    ValorTotalVendas DESC;  -- Ordena os resultados em ordem decrescente com base no valor total de vendas.
