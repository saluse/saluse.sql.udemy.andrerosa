-- Aula 034
-- DDL Criando Tabela
USE Curso
	CREATE TABLE Funcion�riosAju
(			Matr�cula	INT IDENTITY(1,1),
			Nome		CHAR(50) NOT NULL,
			Sobrenome	CHAR(50) NOT NULL,
			Endere�o	CHAR(50),
			Cidade		CHAR(50),
			Pa�s		CHAR(25),
			Data_Nasc	DATETIME
			)
	SELECT * FROM Funcion�riosAju
	SELECT * FROM audit_salario
-- DDL CRIANDO TABELA COM CHAVE ESTRANGEIRA.

CREATE TABLE Salario
(
	matr�cula INT PRIMARY KEY NOT NULL,
	salario		DECIMAL(10,2) NOT NULL
	FOREIGN KEY(Matr�cula) 	REFERENCES salario(Matr�cula)
	)
SELECT * FROM Salario
-- AULA 035
-- DDL CRIANDO TABELA COM CHAVE PRIMARIA
CREATE TABLE audit_salario
	(
		transa��o INT IDENTITY(1,1),
		matricula INT NOT NULL,
		data_trans DATETIME NOT NULL,
		sal_antigo DECIMAL(10,2),
		sal_novo DECIMAL(10,2),
		usu�rio VARCHAR(20) NOT NULL	
		)
 SELECT * FROM audit_salario

 -- DDL CRIA��O DE INDEX

 CREATE INDEX ix_func1	ON funcion�rio(data_nasc)
 CREATE INDEX ix_func2	ON funcion�rio(Cidade, pa�s)
 
 -- ADICIONAR NOVO CAMPO NA TABELA
 ALTER TABLE Funcion�rio ADD genero CHAR(1);
 
SELECT * FROM Funcion�rio

 -- RENOMEANDO CAMPO DE TABELA 
 -- EXEC  sp_rename 'TABELA_ORIGEM.CAMPO_ORIG',	'CAMPO_ORIG', 'COLUMN' 
 EXEC Sp_rename 'Funcion�rio.Endere�o', 'Ender', 'COLUMN'

 -- AULA 036
 -- ALTERANDO TIPO DE COLUNA

 ALTER TABLE Funcion�rio ALTER COLUMN ender Varchar(30)

 -- EXCLUINDO CAMPO DA COLUNA 

 ALTER TABLE Funcion�rio DROP COLUMN genero;

 -- RENOMEANDO TABELA 
 -- EXEC Sp_rename 'Nome Antigo', 'Nome Novo'

 EXEC Sp_rename	'Funcion�rio', 'Func';

 -- EXCLUINDO DATABASE 
 CREATE DATABASE Teste
 DROP DATABASE Teste;

 -- EXCLUINDO TABLE 
DROP TABLE Salario

DROP TABLE Func;
 -- EXCLUINDO VIEW
 -- Primeiro criando a view
 CREATE VIEW v_Funcion�riosAju
	AS
	SELECT * FROM Funcion�riosAju
	ALTER VIEW v_Funcion�riosAju
	AS 
	SELECT NOME, Sobrenome, Cidade, Pa�s FROM Funcion�riosAju
DROP VIEW v_Funcion�riosAju;
-- EXCLUINDO INDEX 
