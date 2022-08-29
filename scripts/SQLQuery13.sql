-- AULA 044
-- Diferenças entre JOINs
-- * (INNER JOIN) Retorna registros que tem valores correspondentes em amnbas as tabelas
-- * LEFT (OUTER) JOIN: Retorna todos os registros da tabela a esquerda e os registros correspondentes da tabela da direita.
-- * RIGHT (OUTER) JOIN: Retorna todos os registros	da tabela a direta e os registros correspondentes da tabela a esquerda.
-- * FULL (OUTER) JOIN: Retorna todos os registros qunado houver uma correspondência na tabela a equerda ou a direita. 
USE Curso
-- DROP TABLE Aluno
-- CRIAÇÃO DA TABELA ALUNO
CREATE TABLE Alunos
(Id_Aluno INT IDENTITY(1,1),
Nome Varchar(20) NOT NULL
)
SELECT * FROM Alunos
SELECT * FROM Disciplina
SELECT * FROM Matricula

-- DROP TABLE DICIPLINA
CREATE TABLE Disciplina
(
Id_Diciplina INT IDENTITY(1,1),
Nome_Discip Varchar(20)
)

-- DROP TABLE MATRICULA
CREATE TABLE Matricula
(Id_Aluno INT,
Id_Disciplina INT,
Período Varchar(10)
)

-- ALTERANDO TABELA CAMPO Id_Aluno PARA NÂO PERMITIR NOT NULL
ALTER TABLE Matricula ALTER COLUMN Id_Aluno INT NOT NULL

-- ALTERANDO TABELA
ALTER TABLE MAtricula ALTER COLUMN Id_Disciplina INT NOT NULL
-- CRIANDO CHAVE PRIMÁRIA COMPOSTA
ALTER TABLE Matricula ADD CONSTRAINT PK_1 PRIMARY KEY (Id_Aluno, Id_Disciplina)

-- ADICIONANDO CHAVE PRIMÁRIA NA TABELA DISCIPLINA
ALTER TABLE Disciplina ADD CONSTRAINT PK_2 PRIMARY KEY (Id_Diciplina) 

-- ADICIONANDO CHAVE PRIMÁRIA NA TABELA ALUNOS
ALTER TABLE Alunos ADD CONSTRAINT PL_1 PRIMARY KEY (Id_Aluno)

-- ADICIONANDO CHAVE ESTRANGEIRA A TABELA MATRICULA CAMPO ID_Aluno
ALTER TABLE	Matricula
ADD CONSTRAINT FK_Mat1 FOREIGN KEY (Id_Aluno) REFERENCES Alunos (Id_Aluno)

-- ADICIONANDO CHAVE ESTRANGEIRA  A TABELA MATRICULA CAMPO Id_Aluno
ALTER TABLE	Matricula
ADD CONSTRAINT FK_Mat2 FOREIGN KEY (Id_Disciplina) REFERENCES Alunos (Id_Aluno)

-- INSERINDO REGISTROS NA TABELA ALUNOS 
INSERT INTO Alunos VALUES ('João'),('Pedro'),('Maria'),('Tiago'),('Henrique')
SELECT * FROM Alunos

-- INSERINDO REGISTROS NA TABELA DISCIPLINA
INSERT INTO Disciplina VALUES ('Fisica'),('Quimica'),('Matemática'),('Banco de Dados'),('Programação')
SELECT * FROM Disciplina
-- INSERINDO MATRICULAS DE ALUNOS

SELECT * FROM Matricula

INSERT INTO	Matricula VALUES ('1','1','Noturno')
INSERT INTO Matricula VALUES ('1','2','Vespertino')
INSERT INTO Matricula VALUES ('1','3','Matutino')

INSERT INTO Matricula VALUES ('2','3','Noturno')
INSERT INTO Matricula VALUES ('2','4','Noturno')

INSERT INTO Matricula VALUES ('3','1','Noturno')
INSERT INTO Matricula VALUES ('3','3','Noturno')
INSERT INTO Matricula VALUES ('3','4','Noturno')

INSERT INTO Matricula VALUES ('5','1','Matutino')
INSERT INTO Matricula VALUES ('5','2','Vespertino')
INSERT INTO Matricula VALUES ('5','4','Noturno')
