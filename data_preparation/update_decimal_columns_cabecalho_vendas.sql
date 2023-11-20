-- Esta consulta atualiza a coluna ValorFrete para o tipo DECIMAL na tabela cabecalho_vendas.
-- Utiliza a função CAST e REPLACE para substituir vírgulas por pontos e realizar a conversão correta.
ALTER TABLE cabecalho_vendas
ALTER COLUMN ValorFrete TYPE DECIMAL USING CAST(REPLACE(ValorFrete, ',', '.') AS DECIMAL);
