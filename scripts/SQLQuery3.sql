-- AULA 29 CONTINUA��O.
-- LIKE localiza valores que come�am com a letra entre aspas "a" e possuem pelo ou menos 3 caracteres de comprimento
	SELECT * FROM Customers
		WHERE ContactName LIKE 'a_%_%';