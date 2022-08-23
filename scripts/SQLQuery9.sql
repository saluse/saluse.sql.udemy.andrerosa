-- AULA 038
-- DEFINI��ES DA LINGUAGEM DCL - REVOKE
/* Mant�m os us�arios de permiss�o de leitura / grava��o em objetos.*/
-- PARTE 01 CONCEDE - GRANT
-- CRIA UM LOGIN E D� PERMISS�O NO BANCO.
EXEC master.dbo.sp_addlogin 'UsrTeste','SenhaTeste'

-- Concedendo acesso de ATUALIZA��O PARA UsrTeste.
GRANT UPDATE ON Funcion�rio TO UsrTeste;

-- Concedendo acesso de INSERT para UsrTeste.
GRANT INSERT ON Funcion�rio TO UsrTeste;
SELECT * from UsrTeste