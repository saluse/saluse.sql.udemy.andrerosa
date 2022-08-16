-- Operadores UNION / UNION ALL
USE NORTHWND
--Simulando Erro UNION

SELECT 1 -- se os tipos forem diferentes, o select apresentará erro.
UNION 
SELECT 'A'

-- EXEMPLO USANDO UNION

	SELECT city
	FROM Customers

	UNION

	SELECT city
	FROM Suppliers
	ORDER BY City
-- EXEMPLO USANDO UNION ALL

	SELECT 'CLI' ,city
	FROM Customers

	UNION ALL

	SELECT 'FORNEC' ,city
	FROM Suppliers
	ORDER BY city

-- Exemplo com UNION 

	SELECT city,
		   country
	FROM Customers
	WHERE Country = 'Germany'

	UNION 
	SELECT city,
		   Country
	FROM Suppliers
	WHERE country = 'Germany'
	ORDER BY city

-- Exemplo com UNION ALL
