-- AULA 041
-- CRIANDO TABELA CLIENTE
USE Curso
CREATE TABLE Clientes
(Cod_CLI	nchar(5) PRIMARY KEY,
Cli_Nomes	nvarchar(40) NOT NULL
)
SELECT * FROM Clientes