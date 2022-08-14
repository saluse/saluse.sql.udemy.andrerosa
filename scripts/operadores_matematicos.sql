--Operador + 
SELECT 1 + 3 

--Operador * 
SELECT 3 * 2

--Operador - 
SELECT 5 - 2
 
--Operador / 
SELECT 15 / 3
 

--Operador % 
SELECT 12%5

--
select ((1+4)*(3*3))/5

/*
Usando o operador de adição para calcular o número total de 
horas de ausência do trabalho para cada funcionário.
*/
use AdventureWorks2014

SELECT  p.firstname,             
		p.lastname,             
		e.vacationhours,             
		e.sickleavehours,             
		e.vacationhours + e.sickleavehours AS 'Horas Ausente' 
FROM   humanresources.employee AS e        
	JOIN person.person AS p          
	ON e.businessentityid = p.businessentityid 
	ORDER  BY 'Horas Ausente' ASC; 




--Usando subtração em uma instrução SELECT
SELECT Max(taxrate) maximo,Min(taxrate) minimo,
	   Max(taxrate) - Min(taxrate) AS 'Tax Rate Difference' 
FROM   sales.salestaxrate 
WHERE  stateprovinceid IS NOT NULL; 

/*
O exemplo a seguir recupera o número de identificação do produto, 
o nome, o preço de tabela e o novo preço de tabela de 
todas as bicicletas mountain bike na tabela Product. 
O novo preço de tabela é calculado usando o operador aritmético * 
para multiplicar ListPrice por 1.15.
*/

	SELECT  productid,        
			NAME,        
			listprice,        
			listprice * 1.5 AS Novo_preco 
			FROM   production.product 
				WHERE  NAME LIKE 'Mountain-%' 
	ORDER  BY productid ASC; 


/*
O exemplo a seguir usa o operador aritmético de divisão para 
calcular a meta de vendas mensal da equipe de vendas em Ciclos de 12 meses
*/

	SELECT  s.businessentityid AS SalesPersonID,        
			firstname,        
			lastname,        
			salesquota,        
			salesquota / 12    AS 'Meta Mensal' 
			FROM   sales.salesperson AS s        
				JOIN humanresources.employee AS e          
				ON s.businessentityid = e.businessentityid        
				JOIN person.person AS p          
				ON e.businessentityid = p.businessentityid;
	WHERE salesquota, meta mensal IS NOT NULL

/*
O exemplo a seguir divide o número 38 por 5. 
Isto resulta em 7 como a parte inteira do resultado 
e demonstra como o módulo retorna o resto de 3.
*/

	SELECT 38 / 5 AS Inteiro,        
	       38 % 5 AS Restante


		   
