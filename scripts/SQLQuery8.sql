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
	SELECT * FROM Salario
-- DDL Criando tabela com chave estrangeira.
USE Curso
	CREATE TABLE Sal�rio
(
	Matr�cula INT PRIMARY KEY NOT NULL,
	Salario		DECIMAL(10,2) NOT NULL,
	FOREIGN KEY(Matr�cula) REFERENCES funcion�rio(Matr�cula)
	)