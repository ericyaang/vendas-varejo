-- Esta consulta atualiza a coluna Valor para o tipo DECIMAL.
-- Utiliza a função CAST e REPLACE para substituir vírgulas por pontos e realizar a conversão correta.
ALTER TABLE detalhes_vendas
ALTER COLUMN Valor TYPE DECIMAL USING CAST(REPLACE(Valor, ',', '.') AS DECIMAL);

-- Esta consulta atualiza a coluna Desconto para o tipo DECIMAL.
-- Utiliza a função CAST e REPLACE para substituir vírgulas por pontos e realizar a conversão correta.
ALTER TABLE detalhes_vendas
ALTER COLUMN Desconto TYPE DECIMAL USING CAST(REPLACE(Desconto, ',', '.') AS DECIMAL);

-- Esta consulta atualiza a coluna Custo para o tipo DECIMAL.
-- Utiliza a função CAST e REPLACE para substituir vírgulas por pontos e realizar a conversão correta.
ALTER TABLE detalhes_vendas
ALTER COLUMN Custo TYPE DECIMAL USING CAST(REPLACE(Custo, ',', '.') AS DECIMAL);

-- Esta consulta atualiza a coluna ValorLiquido para o tipo DECIMAL.
-- Utiliza a função CAST e REPLACE para substituir vírgulas por pontos e realizar a conversão correta.
ALTER TABLE detalhes_vendas
ALTER COLUMN ValorLiquido TYPE DECIMAL USING CAST(REPLACE(ValorLiquido, ',', '.') AS DECIMAL);
