-- AULA 29 CONTINUAÇÃO.
-- LIKE localiza valores que começam com a letra entre aspas "a" e possuem pelo ou menos 3 caracteres de comprimento
USE NORTHWND
	SELECT * FROM Customers
		WHERE ContactName LIKE 'a_%_%';

-- LIKE localiza valores que começam com a letra "a" e terminam com "o"

	SELECT * FROM Customers
		WHERE ContactName LIKE 'a%o';
-- LIKE localiza valores que começam com a letra "a"
	SELECT * FROM Customers
		WHERE ContactName LIKE 'a%';

USE AdventureWorks2014
SELECT p.firstname,
	   p.lastname,
	   ph.phonenumber
FROM person.PersonPhone AS ph
	INNER JOIN person.Person AS p
		ON ph.BusinessEntityID = p.BusinessEntityID
		WHERE ph.PhoneNumber LIKE '415%'
ORDER BY p.LastName;

-- OPERADOR LIKE CORINGA []

	SELECT BusinessEntityID,
		   firstname,
		   lastname
		   FROM person.Person
		   WHERE FirstName LIKE '[CS]he%';
			
--LIKE CORINGA
		   SELECT FirstName,
				  LastName
		   FROM Person.Person
		   WHERE lastname LIKE 'Zh[ae]ng'
		   ORDER BY LastName ASC, FirstName ASC;

-- OPERADOR NOT
		SELECT	productid,
				name,
				color,
				standardcost
		FROM	Production.Product
			WHERE ProductNumber LIKE 'BK-%'
			AND Color = 'Silver'	
			AND NOT StandardCost < 400;
			
-- OPERADOR OR
		SELECT firstname,
			   lastname,
			   shift,
			   department
		FROM HumanResources.vEmployeeDepartmentHistory
		WHERE Department = 'Quality Assurance'
		AND ( Shift = 'Evening' OR shift = 'Night' ); 

USE AdventureWorks2014
-- OPERADOR IS NULL

		SELECT firstname,
			   MiddleName,
			   lastname
		FROM Person.Person
		WHERE MiddleName IS NULL;

-- OPERADOR IS NOT NULL

		SELECT firstname,
			   MiddleName,
			   lastname
		FROM Person.Person
		WHERE MiddleName IS NOT NULL;

USE NORTHWND
-- OPERADOR HAVING 
	SELECT count(CustomerID),
			country
			FROM customers
			GROUP BY country	HAVING count(CustomerID) < 5

-- OPERADOR HAVING
	SELECT	Employees.LastName,
			count(orders.OrderID) AS numberoforders
	FROM Orders
	INNER JOIN Employees
			ON Orders.EmployeeID = Employees.EmployeeID
	--WHERE	lastname = 'Davolio' OR LastName = 'Fuller'
	GROUP BY LastName	HAVING	count(orders.OrderID) > 25;