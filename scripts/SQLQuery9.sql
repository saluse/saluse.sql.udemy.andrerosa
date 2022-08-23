-- AULA 038
-- DEFINIÇÕES DA LINGUAGEM DCL - REVOKE
/* Mantém os usúarios de permissão de leitura / gravação em objetos.*/
-- PARTE 01 CONCEDE - GRANT
-- CRIA UM LOGIN E DÁ PERMISSÂO NO BANCO.
EXEC master.dbo.sp_addlogin 'UsrTeste','SenhaTeste'

-- Concedendo acesso de ATUALIZAÇÃO PARA UsrTeste.
GRANT UPDATE ON Funcionário TO UsrTeste;

-- Concedendo acesso de INSERT para UsrTeste.
GRANT INSERT ON Funcionário TO UsrTeste;
SELECT * from UsrTeste