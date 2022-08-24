-- AULA 038
-- DEFINI��ES DA LINGUAGEM DCL - REVOKE
/* Mant�m os us�arios de permiss�o de leitura / grava��o em objetos.*/
-- PARTE 01 CONCEDE - GRANT
-- CRIA UM LOGIN E D� PERMISS�O NO BANCO.
EXEC master.dbo.sp_addlogin 'UsrTeste','SenhaTeste';
EXEC sp_grantdbaccess 'UsrTeste','SenhaTeste';

EXEC sp_revokedbaccess 'UsrTeste';

-- Concedendo acesso de ATUALIZA��O PARA UsrTeste.
GRANT UPDATE ON Funcion�rio TO UsrTeste;

-- Concedendo acesso de INSERT para UsrTeste.
GRANT INSERT ON Funcion�rio TO UsrTeste;
SELECT * from UsrTeste

-- Concedendo acesso de leitura para UsrTeste.
GRANT SELECT ON Funcion�rio TO UsrTeste;

-- Concedendo acesso de DELETE para UsrTeste.
GRANT DELETE ON Funcion�rio TO UsrTeste;

-- Criando uma PROCEDURE
CREATE PROCEDURE testproc
AS 
SELECT * FROM Cidades

-- Executando uma Procedure.
EXEC testproc

DROP LOGIN UsrTeste;



--Parte 1 CONCEDE-GRANT
-- Cria um login e d� permiss�es no banco
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
GRANT UPDATE ON FUNCION�RIO TO UsrTeste;


-- AULA 039
-- Verificando o Usu�rio logado 
SELECT CURRENT_USER 

-- Alterando Usu�rio Logado
SETUSER 'UsrTeste'
SETUSER 'dbo'
-- Executando PROCEDURE Com usu�rio UsrTeste
EXEC testproc

-- Testando SELECT
SELECT * FROM Funcion�rio

--Testando Insert
INSERT INTO Sal�rios VALUES ('Maria','TI','1200')
SELECT * FROM Sal�rios

-- Testando UPDATE
UPDATE Sal�rios SET Nome='Maria'
WHERE Matr�cula='5'

USE Curso
-- Testando DELETE 
DELETE FROM Sal�rios
WHERE Matr�cula='5'

INSERT INTO Sal�rios VALUES ('Weverton','Analytcs','4500') 

-- Revogando acesso de atualiza��o UsrTeste.
REVOKE UPDATE ON Sal�rios TO UsrTeste;




