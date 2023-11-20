
-- Drop a tabela 'clientes' do banco de dados DuckDB, caso ela já exista
-- Requer instalação da extensão spatial para ler arquivos em EXCEL:
-- INSTALL spatial;
-- LOAD spatial

DROP TABLE IF EXISTS clientes;

-- Crie a tabela 'clientes' importando dados da camada 'Clientes' do arquivo Excel, com auto detecção de tipos
CREATE TABLE clientes AS
SELECT *
FROM st_read('/content/raw/Dimensoes_DadosModelagem.xlsx', layer='Clientes', open_options=['FIELD_TYPES=AUTO']);

-- Similarmente, para a tabela 'funcionarios'
DROP TABLE IF EXISTS funcionarios;
CREATE TABLE funcionarios AS
SELECT *
FROM st_read('/content/raw/Dimensoes_DadosModelagem.xlsx', layer='Funcionarios', open_options=['FIELD_TYPES=AUTO']);

-- Para a tabela 'escritorios'
DROP TABLE IF EXISTS escritorios;
CREATE TABLE escritorios AS
SELECT *
FROM st_read('/content/raw/Dimensoes_DadosModelagem.xlsx', layer='Escritorios', open_options=['FIELD_TYPES=AUTO']);

-- Tabela 'categorias'
DROP TABLE IF EXISTS categorias;
CREATE TABLE categorias AS
SELECT *
FROM st_read('/content/raw/Dimensoes_DadosModelagem.xlsx', layer='Categoria', open_options=['FIELD_TYPES=AUTO']);

-- Tabela 'produtos'
DROP TABLE IF EXISTS produtos;
CREATE TABLE produtos AS
SELECT *
FROM st_read('/content/raw/Dimensoes_DadosModelagem.xlsx', layer='Produtos', open_options=['FIELD_TYPES=AUTO']);

-- Tabela 'fornecedores'
DROP TABLE IF EXISTS fornecedores;
CREATE TABLE fornecedores AS
SELECT *
FROM st_read('/content/raw/Dimensoes_DadosModelagem.xlsx', layer='Fornecedores', open_options=['FIELD_TYPES=AUTO']);
