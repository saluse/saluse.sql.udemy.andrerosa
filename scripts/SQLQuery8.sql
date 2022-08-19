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
	SELECT * FROM Salario
-- DDL Criando tabela com chave estrangeira.
USE Curso
	CREATE TABLE Salário
(
	Matrícula INT PRIMARY KEY NOT NULL,
	Salario		DECIMAL(10,2) NOT NULL,
	FOREIGN KEY(Matrícula) REFERENCES funcionário(Matrícula)
	)