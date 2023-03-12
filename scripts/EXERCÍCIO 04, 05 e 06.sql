--drop table tabela_clientes
--go

create table tabela_clientes(
nome_cliente varchar(200),
cpf_cliente varchar(20)
)
go
--delete from tabela_clientes
insert into tabela_clientes values
('Fabio', NULL),
('Jorge', 21325658454),
('Jack', NULL),
('Peter', 34132567878)
--go

--select * from tabela_clientes
--go

DECLARE
@nome_cliente VARCHAR(200),
@cpf_cliente VARCHAR(20)

--Declarando o cursor
DECLARE nome_do_cursor CURSOR FOR

--dados que o cursor ira trabalhar
SELECT
nome_cliente, cpf_cliente
FROM
tabela_clientes

--abre o cursor
OPEN nome_do_cursor

--posicionar o ponteiro do cursor na primeira linha do resultado do select acima
FETCH NEXT FROM nome_do_cursor

--insere nas variaveis os valores da primeira linha do resultado armazenado no cursor
INTO @nome_cliente, @cpf_cliente

--Esse parte diz "Enquanto tiver linha no cursor, fa a:"
WHILE @@FETCH_STATUS = 0

--Nessa parte voc  insere o bloco de instru  es que ira trabalhar no seu cursor.

--Se CPF for igual a nulo
BEGIN
IF (@cpf_cliente is NULL)
--Inserir no final do nome da pessoa o texto "Atualizar CPF"
	BEGIN
--UPDATE tabela_clientes SET nome_cliente = @nome_cliente + ' Atualizar CPF' where cpf_cliente is  null
	UPDATE tabela_clientes SET cpf_cliente = 'Atualizar CPF' where cpf_cliente is  null
	END
FETCH NEXT FROM nome_do_cursor
INTO @nome_cliente, @cpf_cliente
END

--Para fechar o cursos voc  precisar inserir os seguinte comandos
CLOSE nome_do_cursor
DEALLOCATE nome_do_cursor

--FIM

--select * from tabela_clientes

--CRIANDO TABELA PARA CURSOR
--drop table contapagparc
create table contapagparc
(
 idcap  int ,
 dtvenc  date,
 parcela  int
 )  

select idcap,dtvenc from contapagparc
select *  from contapagparc


insert into contapagparc values ('1',getdate()+30,'')
insert into contapagparc values ('1',getdate()+45,'')
insert into contapagparc values ('1',getdate()+60,'')

insert into contapagparc values ('2',getdate()+15,'')
insert into contapagparc values ('2',getdate()+20,'')
insert into contapagparc values ('2',getdate()+25,'')

--select * from contapagparc

declare @idcap as int
declare @dtvenc as date
declare @cont as int =0
declare @idcap_aux as int

declare cursorparc cursor for
	select idcap,dtvenc from contapagparc
	order by idcap,dtvenc asc

		open cursorparc
			fetch next from cursorparc into @idcap,@dtvenc

			while @@FETCH_STATUS=0
--status fecth 
-- 0 Instrucao bem sucedida
-- 1 instrucao falhou 
-- 2 a linha buscado nao existe
			Begin
				if @idcap_aux<>@idcap 
				begin 
				set @cont=1;
				set @idcap_aux=@idcap;
				end
				else
				begin 
					set @cont=@cont+1
					set @idcap_aux=@idcap;
                end
				--atualizazao
				update contapagparc set parcela=@cont
				where idcap=@idcap
				and dtvenc=@dtvenc;
				
				            
		fetch next from cursorparc into @idcap,@dtvenc
		end
		
		close cursorparc
		deallocate cursorparc

--select * from contapagparc

--CRIA E POPULA TABELA DE TESTE
use curso
--DROP TABLE ##DADOS
 
CREATE TABLE ##DADOS 
(
  NUMERO int NULL
 )
 
INSERT INTO ##DADOS VALUES (1)
INSERT INTO ##DADOS VALUES (2)
INSERT INTO ##DADOS VALUES (3)
INSERT INTO ##DADOS VALUES (4)
INSERT INTO ##DADOS VALUES (5)
INSERT INTO ##DADOS VALUES (6)
INSERT INTO ##DADOS VALUES (7)
INSERT INTO ##DADOS VALUES (8)
INSERT INTO ##DADOS VALUES (9)
INSERT INTO ##DADOS VALUES (10)

-- select * from ##DADOS
--Declarando cursor
DECLARE cDados SCROLL CURSOR FOR
SELECT NUMERO FROM ##DADOS
 
--Abre cursor
OPEN cDados;
 
--Verifica a quantidade de linhas
SELECT @@CURSOR_ROWS;
 
--Primeiro registro do cursor
FETCH ABSOLUTE 1 FROM cDados;
 
--Pr ximo registro
FETCH NEXT FROM cDados;
 
-- ltimo Registro
FETCH LAST FROM cDados;
 
--Retorna a linha anterior ao registro atual do cursor
FETCH PRIOR FROM cDados;
 
--Volta para a segunha linha do cursor
FETCH ABSOLUTE 2 FROM cDados;
 
--Avan a tr s registros em rela  o ao registro atual
FETCH RELATIVE 3 FROM cDados;
 
--Retrocede dois registros em rela  o ao registro atual
FETCH RELATIVE -2 FROM cDados;
 
CLOSE cDados;
DEALLOCATE cDados;