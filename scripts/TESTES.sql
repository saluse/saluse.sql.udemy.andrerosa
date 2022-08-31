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

CREATE DATABASE Hashtag

USE Hashtag
CREATE TABLE Vendas
(
	ID_Venda INT,
	Curso Varchar(100),
	Aluno Varchar(100),
	Estado Varchar(50),
	Valor Decimal(10,2)
	)
INSERT INTO Vendas VALUES(1,'Excel','João','SP',100)
INSERT INTO Vendas VALUES(2,'VBA','Lucas','RJ',150)
INSERT INTO Vendas VALUES(3,'Excel','Alice','SP',100)
INSERT INTO Vendas VALUES(4,'Excel','Pedro','PE',100)

INSERT INTO Vendas VALUES(5,'VBA','Amanda','RS',150)
INSERT INTO Vendas VALUES(6,'BI','Rita','SE',120)

INSERT INTO Vendas VALUES(7,'Excel','Julia','BA',100)
INSERT INTO Vendas VALUES(8,'BI','Caio','MG',120)
INSERT INTO Vendas VALUES(9,'BI','Lara','AC',120)
INSERT INTO Vendas VALUES(10,'Excel','Rogério','SE',100)

SELECT * FROM Vendas
SELECT Aluno, Curso, Valor FROM Vendas

SELECT * FROM Vendas
ORDER BY Aluno -- ORDER BY ordena a consulta pela coluna que vem descrita após. EX: Order By ALUNO.

SELECT * FROM Vendas
WHERE Estado = 'RJ'



		