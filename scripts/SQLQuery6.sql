-- CONTINUA��O DA AULA 031
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
-- DDL Cria��o de tabela para Exercicios.
CREATE TABLE Funcion�rios
(
	ID INT IDENTITY(1,1),
	NOME Varchar(50) NOT NULL,
	SALARIO DECIMAL(10,2),
	SETOR Varchar(30)
	)
-- DML SELECT

-- EXEMPLO SELECT
	SELECT * FROM Funcion�rios
-- EXEMPLO SELECT
	SELECT nome, setor
	FROM Funcion�rios
-- EXEMPLO SELECT
	SELECT nome, setor AS depto -- AS serve para dar apelidos aos campos e facilitar 
	FROM Funcion�rios
-- DML INSERT
	INSERT INTO Funcion�rios VALUES ('Jo�o',1000,'Vendas'), ('Jos�',2000,'Atendimento'), ('Karla',3000,'Setor Pessoal')
-- OU
	INSERT INTO Funcion�rios (nome,salario) VALUES ('Pedro',1500)
	
-- DELETAR A TABELA
	DELETE Funcion�rios
