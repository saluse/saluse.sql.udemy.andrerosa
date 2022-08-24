-- AULA 038
-- DEFINIÇÕES DA LINGUAGEM DCL - REVOKE
/* Mantém os usúarios de permissão de leitura / gravação em objetos.*/
-- PARTE 01 CONCEDE - GRANT
-- CRIA UM LOGIN E DÁ PERMISSÂO NO BANCO.
EXEC master.dbo.sp_addlogin 'UsrTeste','SenhaTeste';
EXEC sp_grantdbaccess 'UsrTeste','SenhaTeste';

EXEC sp_revokedbaccess 'UsrTeste';

-- Concedendo acesso de ATUALIZAÇÃO PARA UsrTeste.
GRANT UPDATE ON Funcionário TO UsrTeste;

-- Concedendo acesso de INSERT para UsrTeste.
GRANT INSERT ON Funcionário TO UsrTeste;
SELECT * from UsrTeste

-- Concedendo acesso de leitura para UsrTeste.
GRANT SELECT ON Funcionário TO UsrTeste;

-- Concedendo acesso de DELETE para UsrTeste.
GRANT DELETE ON Funcionário TO UsrTeste;

-- Criando uma PROCEDURE
CREATE PROCEDURE testproc
AS 
SELECT * FROM Cidades

-- Executando uma Procedure.
EXEC testproc

DROP LOGIN UsrTeste;



--Parte 1 CONCEDE-GRANT
-- Cria um login e dá permissões no banco
-- Revoga acesso do usuario.
EXEC sp_revokedbaccess 'UsrTeste';
-- dropa login
DROP LOGIN [UsrTeste];
-- adiciona login
exec master.dbo.sp_addlogin 'UsrTeste','SenhaTeste';
-- grant de acesso usuario
EXEC sp_grantdbaccess 'UsrTeste','UsrTeste';
-- seta o banco
use curso;
--Concedendo Acesso DE ATUALIZACAO PARA UsrTeste.
GRANT UPDATE ON FUNCIONÁRIO TO UsrTeste;


-- AULA 039
-- Verificando o Usuário logado 
SELECT CURRENT_USER 

-- Alterando Usuário Logado
SETUSER 'UsrTeste'
SETUSER 'dbo'
-- Executando PROCEDURE Com usuário UsrTeste
EXEC testproc

-- Testando SELECT
SELECT * FROM Funcionário

--Testando Insert
INSERT INTO Salários VALUES ('Maria','TI','1200')
SELECT * FROM Salários

-- Testando UPDATE
UPDATE Salários SET Nome='Maria'
WHERE Matrícula='5'

USE Curso
-- Testando DELETE 
DELETE FROM Salários
WHERE Matrícula='5'

INSERT INTO Salários VALUES ('Weverton','Analytcs','4500') 

-- Revogando acesso de atualização UsrTeste.
REVOKE UPDATE ON Salários TO UsrTeste;




