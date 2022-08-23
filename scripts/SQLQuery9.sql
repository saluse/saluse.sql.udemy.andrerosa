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
GRANT UPDATE ON FUNCIONARIOS TO UsrTeste;