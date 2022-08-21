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
