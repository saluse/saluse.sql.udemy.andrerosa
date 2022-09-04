-- AULA 29 CONTINUAÇÃO.
-- LIKE localiza valores que começam com a letra entre aspas "a" e possuem pelo ou menos 3 caracteres de comprimento
	SELECT * FROM Customers
		WHERE ContactName LIKE 'a_%_%';

--LIKE Localiza valores que começam com "a" e termina com "o"
	SELECT * FROM   customers 
		WHERE  contactname LIKE 'a%o'; 

--LIKE Localiza valores que começam com "a"	
	SELECT * FROM   customers 
		WHERE  contactname NOT LIKE 'a%';

use AdventureWorks2014
SELECT 	p.firstname,        
		p.lastname,        
		ph.phonenumber 
FROM   person.personphone AS ph        
	INNER JOIN person.person AS p                
		ON ph.businessentityid = p.businessentityid 
	   WHERE  ph.phonenumber LIKE '415%' 
ORDER  BY p.lastname;

--OPERADOR LIKE CORINGA []

	SELECT 	businessentityid,        
			firstname,        
			lastname 
			FROM   person.person 
			WHERE  firstname LIKE '[CS]he%';