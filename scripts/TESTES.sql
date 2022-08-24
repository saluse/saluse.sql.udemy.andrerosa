SELECT * FROM FuncionáriosAju

SELECT * FROM Funcionário

SELECT * FROM Colaborador

INSERT INTO Colaborador VALUES ('Tom', 'Seixas', 'Rua Esperança', 'Aracaju', 'Brasil', 1987-12-20)
INSERT INTO Colaborador VALUES ('Karla', 'Seixas', 'TV Esperança', 'Aracaju', 'Brasil', 1992-07-26)

USE Curso
	CREATE TABLE Salários
(			Matrícula	INT IDENTITY(1,1),
			Nome		CHAR(50) NOT NULL,
			Função		CHAR(50) NOT NULL,
			Salário		DECIMAL (10,2),
			)

SELECT * FROM Salários