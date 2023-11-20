-- Pergunta 2: Valor de venda por tipo de produto
-- Esta query calcula o valor total de vendas para cada categoria de produtos.
-- Primeiro, cria uma tabela temporária 'CategoriaTotal' usando uma CTE (Common Table Expression).
WITH CategoriaTotal AS (
    SELECT c.Categoria,  -- Seleciona a coluna 'Categoria' da tabela 'categorias'.
           SUM(dv.Valor) AS ValorTotal  -- Calcula a soma dos valores de vendas (dv.Valor) para cada categoria.
    FROM detalhes_vendas dv  -- Referencia a tabela 'detalhes_vendas' como 'dv' para simplificar a consulta.
    JOIN produtos p ON dv.ProdutoID = p.ProdutoID  -- Realiza uma junção entre 'detalhes_vendas' e 'produtos' usando a coluna 'ProdutoID' como chave de junção.
    JOIN categorias c ON p.CategoriaID = c.CategoriaID  -- Realiza uma junção entre 'produtos' e 'categorias' usando a coluna 'CategoriaID' como chave de junção.
    GROUP BY c.Categoria  -- Agrupa os resultados por categoria, permitindo calcular o valor total de vendas para cada uma delas.
)

-- A consulta principal seleciona a categoria e o valor total de vendas de 'CategoriaTotal'.
SELECT Categoria, ValorTotal
FROM CategoriaTotal
ORDER BY ValorTotal DESC;  -- Ordena os resultados em ordem decrescente com base no valor total de vendas.
