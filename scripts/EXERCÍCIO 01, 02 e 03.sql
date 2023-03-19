	USE CURSO
	DECLARE @MinhaVariavel VARCHAR(100) 
	DECLARE meu_cursor 
	CURSOR local FOR SELECT NOME FROM ALUNOS 
	open meu_cursor
	FETCH next FROM meu_cursor INTO @MinhaVariavel 
	WHILE(@@FETCH_STATUS = 0) 
		begin 
		print @MinhaVariavel+' FETCH_STATUS-> '+cast(@@FETCH_STATUS as varchar(10))

		FETCH next FROM meu_cursor INTO @MinhaVariavel 
	end
	print 'FETCH_STATUS-> '+cast(@@FETCH_STATUS as varchar(10))
	close meu_cursor
	deallocate meu_cursor

--Preparando base para cursor para UPDATE
--drop table clifor
use curso
 select a.BusinessEntityID codpessoa,
	    a.FirstName nome,
		a.LastName sobrenome,
		cast('' as varchar(100)) nomecompleto
      into clifor
  from AdventureWorks2014.person.person a
--verifcando dados carregado sem nome completo
select * from clifor

--Inicio cursor (Declara Variavies)
DECLARE @codpessoa   INT, 
        @primeironome VARCHAR(50), 
        @sobrenome    VARCHAR(50), 
        @nomecompleto VARCHAR(100) 
-- Cursor para percorrer os registros 
DECLARE cursor1 CURSOR FOR 
  SELECT codpessoa, 
         nome, 
         sobrenome 
  FROM   clifor 

--Abrindo Cursor 
OPEN cursor1 

-- Lendo a pr xima linha 
FETCH next FROM cursor1 INTO @codpessoa, @primeironome, @sobrenome 

-- Percorrendo linhas do cursor (enquanto houverem) 
WHILE @@FETCH_STATUS = 0 
  BEGIN 
      -- Executando as rotinas desejadas manipulando o registro 
      UPDATE clifor 
      SET    nomecompleto =@primeironome+' '+@sobrenome 
      WHERE  codpessoa = @codpessoa 

      -- Lendo a pr xima linha 
      FETCH next FROM cursor1 INTO @codpessoa, @primeironome, @sobrenome 
  END 

-- Fechando Cursor para leitura 
CLOSE cursor1 

-- Finalizado o cursor 
DEALLOCATE cursor1 

--verficando dados
--select * from clifor

use curso
--drop table cli_nome
create table cli_nome
(cod_cliente int not null,
 nome_completo varchar(100) not null
 )

 --select * from cli_nome

--CRIANDO CURSOR PARA INSERT
--DECLARANDO VARIAVEIS
    DECLARE @codcliente int, 
	        @primeironome VARCHAR(30), 
			@sobrenome VARCHAR(60), 
			@nomecompleto VARCHAR(90)
 
-- Cursor para percorrer os registros
DECLARE cursor1 CURSOR FOR
select EmployeeID, FirstName, LastName from NORTHWND.dbo.Employees
 
--Abrindo Cursor
OPEN cursor1
 
-- Lendo a pr xima linha
FETCH NEXT FROM cursor1 INTO @codcliente, @primeironome, @sobrenome
 
-- Percorrendo linhas do cursor (enquanto houverem)
WHILE @@FETCH_STATUS = 0
BEGIN
 
-- Executando as rotinas desejadas manipulando o registro
--update clientes set nomecompleto = @primeironome + ' ' + @sobrenome where codcliente = @codcliente
 insert into cli_nome values (@codcliente,@primeironome + ' ' + @sobrenome)
-- Lendo a pr xima linha
FETCH NEXT FROM cursor1 INTO @codcliente, @primeironome, @sobrenome
END
 
-- Fechando Cursor para leitura
CLOSE cursor1
 
-- Finalizado o cursor
DEALLOCATE cursor1

--verifindo insert 
--select * from cli_nome

