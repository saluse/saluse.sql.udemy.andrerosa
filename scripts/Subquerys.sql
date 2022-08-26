--criando ta tabelas cliente

use curso
create table  clientes
(cod_cli nchar(5) primary key,
 cli_nome nvarchar(40) not null
 ) 

--inserindo dados da tabelas cliente apartir da tabela customers do db Northwnd
insert into clientes 
select customerid,companyname from NORTHWND.dbo.Customers

--criando tabelas pedidos

 create table pedidos
	(
	 num_ped int primary key,
	 cod_cliente nchar(5)not null,
     data datetime not null,
	 total decimal(10,2)
	 )

--inserindo dados na tabela pedido com dados da tabela orders do bd Northwnd
insert into pedidos (num_ped,cod_cliente,data)
select OrderID,customerid,OrderDate from NORTHWND.dbo.Orders 

--atualizando campo total da tabela pedido com update em subselect

select * from pedidos

  update pedidos set total=(select sum(b.unitprice*b.quantity) 
  from NORTHWND.dbo.[Order Details] b
  where num_ped=b.orderid)



--Aqui somente apresentamos os clientes que fizeram compras antes da data atual 
SELECT cod_cli , 
       cli_nome 
FROM   clientes 
WHERE  cod_cli NOT IN (SELECT cod_cliente
              FROM   pedidos 
              WHERE  data < Getdate() )

--Aqui apresentamos todos os clientes  que cliente já fizeram algum pedido.
--trocando "in" por "Not in" apresenta o cliente que nao fizeram pedidos

SELECT cli_cod, 
       cli_nome 
FROM   cliente 
WHERE  cli_cod IN(SELECT cli_cod 
                  FROM   pedidos) 



/*
Nesta query estamos retornando o campo NOM_CLI da tabela CLIENTES.
Porém, não estamos filtrando a tabela PEDIDO de modo que se houver 
algum COD_CLI na tabela PEDIDOS que não se encontre na tabela CLIENTE o 
valor NULL será retornado para o campo
NOME_CLI calculado através da subquery

*/
  SELECT P.num_ped, 
       P.data, 
       P.cod_cliente, 
       (SELECT C.cli_nome 
        FROM   clientes C 
        WHERE  P.cod_cliente = C.cod_cli) AS NOME_CLI 
FROM   pedidos AS P 

/*
Nesta Query com Subquery vamos trazer  o total de cada cliente partindo da tabela pedidos 
*/
SELECT P.cod_cliente, 
       (SELECT C.cli_nome 
        FROM   clientes C 
        WHERE  P.cod_cliente = C.cod_cli) AS NOME_CLI, 
       Sum(p.total) total 
FROM   pedidos AS P 
GROUP  BY P.cod_cliente 

/*
Nesta Query vamos trazer todos clientes e através de subconsulta o valor de suas compras.
*/

SELECT c.cod_cli, 
      (SELECT isnull(Sum(p.total),0)
        FROM   pedidos p
        WHERE  c.cod_cli = p.cod_cliente) AS total 
FROM   clientes c 
GROUP  BY c.cod_cli 

--eliminando clientes da tabela cliente que nao fizeram pedidos
delete from clientes
where cod_cli not in (select cod_cliente from pedidos)

