-- Pergunta 1: Valor total das vendas e dos fretes por produto e ordem de venda
-- Esta query calcula o valor total das vendas e dos fretes para cada combinação de ProdutoID e CupomID.
SELECT
    dv.ProdutoID,  -- Seleciona o ID do produto da tabela detalhes_vendas.
    cv.CupomID,    -- Seleciona o ID do cupom da tabela cabecalho_vendas.
    SUM(dv.Valor) AS ValorTotalVendas,     -- Calcula o valor total das vendas somando os valores individuais dos produtos vendidos em cada ordem.
    SUM(cv.ValorFrete) AS ValorTotalFretes  -- Calcula o valor total dos fretes somando os valores de frete em cada ordem.
FROM
    detalhes_vendas dv  -- Referencia a tabela detalhes_vendas como 'dv' para simplificar a consulta.
JOIN
    cabecalho_vendas cv ON dv.CupomID = cv.CupomID  -- Realiza uma junção entre as tabelas detalhes_vendas e cabecalho_vendas usando a coluna 'CupomID' como chave de junção.
GROUP BY
    dv.ProdutoID, cv.CupomID;  -- Agrupa os resultados pelo ID do produto e ID do cupom para calcular os totais por combinação única de produto e ordem de venda.
