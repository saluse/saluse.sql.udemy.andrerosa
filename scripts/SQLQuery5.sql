-- Operadores UNION / UNION ALL
USE NORTHWND
--Simulando Erro UNION

SELECT 1
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

	SELECT city
	FROM Customers

	UNION ALL

	SELECT city
	FROM Suppliers
	ORDER BY city