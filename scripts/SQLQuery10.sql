-- AULA 040
-- CRIANDO TESTE
CREATE TABLE Cadastro
(
Nome varchar(50) NOT NULL,
docto varchar(20) NOT NULL
)

-- INICIA A TRANSA��O
BEGIN TRANSACTION

-- INSERIR REGISTROS
INSERT INTO Cadastro VALUES ('KARLA','123456789')
INSERT INTO Cadastro VALUES ('WEVERTON','123789456')
INSERT INTO Cadastro VALUES ('NALVA','789456123')

-- SELECT DO REGISTRO
SELECT * FROM Cadastro