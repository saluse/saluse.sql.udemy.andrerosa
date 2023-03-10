--criando o problema 
SELECT 100 / 0 
 
--Tratando  
SELECT Isnull(100 / NULLIF(0, 0), 0)  
SELECT Isnull(1 / NULLIF(0, 0), 0)   
SELECT Isnull(100 / NULLIF(50, 0), 0)

use curso
create table teste2
(
  val1 int,
  val2 int
)
--Populando tabela teste2
insert into teste2 values (100,0),(100,25),(1,0),(5,2)

--verificando dados
select * from teste2
--Expressao com erro
select val1,val2,val1/val2 expressao
from teste2

--Expressao tratando erros
select 
		val1,
		val2,
		isnull(val1/nullif(val2,0),0) expressao,
		isnull(cast(val1 as decimal(5,2))/cast(nullif(val2,0) as decimal(5,2)),0) expressao
from teste2


--Comparando Case Nullif
--Retorna um valor nulo se as duas express es especificadas forem iguais.

use AdventureWorks2014
	SELECT productid,         
		   makeflag,         
		   finishedgoodsflag,         
		   NULLIF(makeflag, finishedgoodsflag)AS 'Null se igual'  
		   FROM   production.product  
		   WHERE  productid < 10;  
		   go  
   
   SELECT productid,         
          makeflag,         
		  finishedgoodsflag,         
		  CASE                             
		  WHEN makeflag = finishedgoodsflag THEN NULL 
		   ELSE makeflag   end 'Null se igual'                        
		  FROM   production.product  
		  WHERE  productid < 10; 
