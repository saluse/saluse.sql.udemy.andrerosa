USE NORTHWND
--SIMULANDO ERRO UNION

SELECT '1',1
UNION 
SELECT 'A',2

--EXEMPLO USANDO UNION
	
	SELECT city 
	FROM   customers 

	UNION 

	SELECT city 
	FROM   suppliers 
	ORDER  BY city
----EXEMPLO USANDO UNION ALL

	SELECT 'CLI',city 
	FROM   customers 

	UNION ALL

	SELECT 'FORNEC', city 
	FROM   suppliers 
	ORDER  BY city

--EXEMPLO COM UNION
	SELECT city,        
		   country 
	FROM   customers 
		WHERE  country = 'Germany' 
		
	UNION
	 
	SELECT city,        
		   country 
	FROM   suppliers 
		WHERE  country = 'Germany' 
	ORDER  BY city

--EXEMPLO COM UNION ALL
	SELECT city,        
		   country 
	FROM   customers 
		WHERE  country = 'Germany' 
		
	UNION ALL
	 
	SELECT city,        
		   country 
	FROM   suppliers 
		WHERE  country = 'Germany' 
	ORDER  BY city