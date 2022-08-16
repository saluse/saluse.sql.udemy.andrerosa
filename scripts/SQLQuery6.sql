-- CONTINUAÇÂO DA AULA 031
--EXEMPLO COM UNION ALL
USE NORTHWND
	SELECT	city,
			country
	FROM customers
		WHERE Country = 'Germany'

	UNION ALL

	SELECT	city,
			country
	FROM Customers
		WHERE Country = 'Germany'
	ORDER BY City
-- FIM

		