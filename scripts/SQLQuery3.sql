-- AULA 29 CONTINUAÇÃO.
-- LIKE localiza valores que começam com a letra entre aspas "a" e possuem pelo ou menos 3 caracteres de comprimento
	SELECT * FROM Customers
		WHERE ContactName LIKE 'a_%_%';