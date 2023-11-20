-- Esta consulta atualiza a coluna "Extensao" para o tipo INTEGER na tabela "funcionarios".
-- Utiliza uma expressão CASE para lidar com o caso em que o valor da coluna "Extensao" é igual a 'NULL',
-- convertendo-o corretamente para NULL, enquanto os outros valores são convertidos para INTEGER.
ALTER TABLE funcionarios
ALTER COLUMN Extensao TYPE INTEGER USING 
  CASE 
    WHEN Extensao = 'NULL' THEN NULL
    ELSE CAST(Extensao AS INTEGER)
  END;
