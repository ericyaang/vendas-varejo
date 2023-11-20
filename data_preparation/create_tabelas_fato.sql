-- Remove a tabela 'cabecalho_vendas', caso ela já exista, como parte do processo de preparação de dados.
DROP TABLE IF EXISTS cabecalho_vendas;

-- Cria a tabela 'cabecalho_vendas' importando dados do arquivo 'FatoCabecalho_DadosModelagem.txt' usando a função 'read_csv_auto'. Esta tabela contém informações relacionadas aos cabeçalhos das vendas.
CREATE TABLE cabecalho_vendas AS
SELECT *
FROM read_csv_auto('/content/raw/FatoCabecalho_DadosModelagem.txt');

-- Remove a tabela 'detalhes_vendas', se ela já existir, como parte do processo de preparação de dados.
DROP TABLE IF EXISTS detalhes_vendas;

-- Cria a tabela 'detalhes_vendas' importando dados do arquivo 'FatoDetalhes_DadosModelagem.csv' usando a função 'read_csv_auto'. Esta tabela contém informações detalhadas sobre as vendas.
CREATE TABLE detalhes_vendas AS
SELECT *
FROM read_csv_auto('/content/raw/FatoDetalhes_DadosModelagem.csv');
