-- Aula 034
-- DDL Criando Tabela
USE Curso
	CREATE TABLE FuncionáriosAju
(			Matrícula	INT IDENTITY(1,1),
			Nome		CHAR(50) NOT NULL,
			Sobrenome	CHAR(50) NOT NULL,
			Endereço	CHAR(50),
			Cidade		CHAR(50),
			País		CHAR(25),
			Data_Nasc	DATETIME
			)
	SELECT * FROM FuncionáriosAju
	SELECT * FROM audit_salario
-- DDL CRIANDO TABELA COM CHAVE ESTRANGEIRA.

CREATE TABLE Salario
(
	matrícula INT PRIMARY KEY NOT NULL,
	salario		DECIMAL(10,2) NOT NULL
	FOREIGN KEY(Matrícula) 	REFERENCES salario(Matrícula)
	)
SELECT * FROM Salario
-- AULA 035
-- DDL CRIANDO TABELA COM CHAVE PRIMARIA
CREATE TABLE audit_salario
	(
		transação INT IDENTITY(1,1),
		matricula INT NOT NULL,
		data_trans DATETIME NOT NULL,
		sal_antigo DECIMAL(10,2),
		sal_novo DECIMAL(10,2),
		usuário VARCHAR(20) NOT NULL	
		)
 SELECT * FROM audit_salario

 -- DDL CRIAÇÂO DE INDEX

 CREATE INDEX ix_func1	ON funcionário(data_nasc)
 CREATE INDEX ix_func2	ON funcionário(Cidade, país)
 
 -- ADICIONAR NOVO CAMPO NA TABELA
 ALTER TABLE Funcionário ADD genero CHAR(1);
 
SELECT * FROM Funcionário

 -- RENOMEANDO CAMPO DE TABELA 
 -- EXEC  sp_rename 'TABELA_ORIGEM.CAMPO_ORIG',	'CAMPO_ORIG', 'COLUMN' 
 EXEC Sp_rename 'Funcionário.Endereço', 'Ender', 'COLUMN'

 -- AULA 036
 -- ALTERANDO TIPO DE COLUNA

 ALTER TABLE Funcionário ALTER COLUMN ender Varchar(30)

 -- EXCLUINDO CAMPO DA COLUNA 

 ALTER TABLE Funcionário DROP COLUMN genero;

 -- RENOMEANDO TABELA 
 -- EXEC Sp_rename 'Nome Antigo', 'Nome Novo'

 EXEC Sp_rename	'Funcionário', 'Func';

 -- EXCLUINDO DATABASE 
 CREATE DATABASE Teste
 DROP DATABASE Teste;

 -- EXCLUINDO TABLE 
DROP TABLE Salario

DROP TABLE Func;
 -- EXCLUINDO VIEW
 -- Primeiro criando a view
 CREATE VIEW v_FuncionáriosAju
	AS
	SELECT * FROM FuncionáriosAju
	ALTER VIEW v_FuncionáriosAju
	AS 
	SELECT NOME, Sobrenome, Cidade, País FROM FuncionáriosAju
DROP VIEW v_FuncionáriosAju;
-- EXCLUINDO INDEX 
