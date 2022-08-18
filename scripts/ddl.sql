--DDL CRIANDO TABELA
use curso
CREATE TABLE funcionario   
(      matricula INT IDENTITY(1,1),      
	    nome      CHAR(50) NOT NULL,      
		sobrenome CHAR(50) NOT NULL,      
		endereco  CHAR(50),      
		cidade    CHAR(50),      
		pais      CHAR(25),      
		data_nasc DATETIME
		) 

--DDL CRIANDO TABELA COM CHAVE ESTRANGEIRA
CREATE TABLE salario   
(      
	matricula INT PRIMARY KEY NOT NULL,      
	salario   DECIMAL(10, 2) NOT NULL, 
    FOREIGN KEY(matricula) REFERENCES funcionario(matricula)
  ) 
--CORRINGO ERRO PRA CRIAR A TABELA SALARIO
--DDL PARA ADICIONAR CHAVE PRIMARIA NA TAB FUNCIONARIO
  ALTER TABLE FUNCIONARIO ADD PRIMARY KEY (MATRICULA)



--DDL CRIACAO DE TABELA COM CHAVE PRIMARIA
CREATE TABLE audit_salario   
	(  
		transacao int identity(1,1),    
		matricula  INT NOT NULL,      
		data_trans DATETIME NOT NULL,      
		sal_antigo DECIMAL(10, 2),      
		sal_novo   DECIMAL(10, 2), 
		Usuario    varchar(20)not null   
		) 
 
--DDL CRIACAO DE INDEX
 CREATE INDEX ix_func1   ON funcionario(data_nasc)
 CREATE INDEX ix_func2   ON funcionario(cidade,pais)

 --Adicionando novo campo na tabela 
 ALTER TABLE funcionario ADD genero CHAR(1); 
 
 --Renomeando campo da tabela
 --EXEC sp_rename 'TABELA_ORIGEM.CAMPO_ORIG', 'Campo_orig', 'COLUMN'

EXEC Sp_rename 'funcionario.endereco', 'ender', 'COLUMN' 

--Alterando tipo da coluna
ALTER TABLE funcionario ALTER COLUMN ender VARCHAR(30)
   
--Excluindo campo da coluna
ALTER TABLE funcionario DROP COLUMN genero; 
   
--Renomeando Tabela
--EXEC sp_rename   'Nome Antigo', 'Nome Novo'
EXEC Sp_rename   'FUNCIONARIO','FUNC';

--DDL CRIACAO DE DATABASE
CREATE DATABASE TESTE

--Excluindo database

DROP DATABASE teste; 

--Excluindo table
DROP TABLE SALARIO

DROP TABLE func; 

--CRIACAO DE VIEW
CREATE VIEW v_funcionario
	AS
	SELECT * FROM FUNCIONARIOS

--ALTER VIEW
	ALTER VIEW v_funcionario
	AS 
	SELECT ID,NOME FROM FUNCIONARIOS

--Excluindo VIEW
DROP VIEW v_funcionario; 
--Excluindo index
DROP index ix_func1 ON FUNCIONARIOS; 
--CRIANDO INDEX
CREATE INDEX IX_FUNC1 ON FUNCIONARIOS (NOME)
--Excluindo procedure
DROP PROCEDURE proc_salario; 
--Excluindo Função
DROP function func_salario;
--Excluindo Trigger
DROP trigger trig_func_salario;

--DDL TRUNCATE
SELECT * FROM CIDADES
TRUNCATE TABLE	 CIDADES;

--DDL TRUNCATE VERIFICANDO
USE AdventureWorks2014

--FAZENDO BK EM TABELA TEMPORARIA
SELECT * INTO #HJTEMP FROM person.Password

--VERIFCANDO REGISTRO TABELA TEMPORARIA
SELECT * FROM #HJTEMP

--ANALISE DE REGISTROS ANTES DO TRUNCATE
SELECT Count(*) AS AntesTruncateCount 
FROM   person.Password; 

--DDL TRUNCATE APAGAR DADOS DA TABELA
TRUNCATE TABLE person.Password;
 
--VERIFICANDO TABELAS APOS TRUNCATE
SELECT Count(*) AS DepoisTruncateCount 
FROM   person.Password; 

--POPULANDO A TABELA COM DADOS DA TABELA TEMPORARIA
 insert into person.Password
 select * from #HJTEMP
--verifanco registro 
 select * from person.Password