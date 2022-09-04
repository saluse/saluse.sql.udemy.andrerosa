-- CONTINUAÇÂO DA AULA 031
--EXEMPLO COM UNION ALL
USE NORTHWND
	SELECT	city,
			country
	FROM customers
		WHERE Country = 'Germany'

	UNION ALL

	SELECT	city,
			country
	FROM Customers
		WHERE Country = 'Germany'
	ORDER BY City
-- AULA 032
-- DDL Criação de tabela para Exercicios.
CREATE TABLE Funcionários
(
	ID INT IDENTITY(1,1),
	NOME Varchar(50) NOT NULL,
	SALARIO DECIMAL(10,2),
	SETOR Varchar(30)
	)
-- DML SELECT

-- EXEMPLO SELECT
	SELECT * FROM Funcionários
-- EXEMPLO SELECT
	SELECT nome, setor
	FROM Funcionários
-- EXEMPLO SELECT
	SELECT nome, setor AS depto -- AS serve para dar apelidos aos campos e facilitar 
	FROM Funcionários
-- DML INSERT
	INSERT INTO Funcionários VALUES ('João',1000,'Vendas'), ('José',2000,'Atendimento'), ('Karla',3000,'Setor Pessoal')
-- OU
	INSERT INTO Funcionários (nome,salario) VALUES ('Pedro',1500)
	
-- DELETAR A TABELA
	DELETE Funcionários
