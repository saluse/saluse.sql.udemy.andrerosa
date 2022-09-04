USE NORTHWND

-- OPERADOR WHERE
	SELECT * FROM
	Customers
	WHERE Country = 'BRAZIL';

USE AdventureWorks2014
-- OPERADOR AND
	SELECT b.firstname,
		   b.lastname,
		   a.businessentityId,
		   a.loginid,
		   a.jobtitle,
		   a.vacationhours
	FROM  humanresources.employee a 
		inner join person.person b
		ON a.BusinessEntityID = b.BusinessEntityID
	WHERE a.jobtitle = 'Marketing Assistant'
	AND a.vacationhours > 40;


-- OPERADOR BETWEEN
	SELECT	e.firstname,
			e.lastname,
			ep.rate
	FROM	HumanResources.vEmployee e 
	JOIN HumanResources.EmployeePayHistory ep
	ON e.BusinessEntityID = ep.BusinessEntityID
		WHERE ep.rate BETWEEN 10 AND 30
	ORDER BY ep.rate;

-- OPERADOR IN
	SELECT p.firstname,
		   p.lastname,
		   sp.salesquota
	FROM person.Person AS p
	JOIN sales.SalesPerson AS sp
	ON p.BusinessEntityID = sp.BusinessEntityID
	WHERE p.BusinessEntityID IN (SELECT BusinessEntityID		FROM sales.SalesPerson
			WHERE SalesQuota > 250000);
USE NORTHWND
-- LIKE LOCALIZA VALORES QUE CONTENHAM "OR" EM QUALQUER LUGAR.
	SELECT * FROM customers
		WHERE contactname LIKE '%or%';
-- LIKE	ENCONTRA QUAISQUER VALOR QUE TENHA O 'R' NA SEGUNDA POSIÇÃO
	SELECT * FROM  Customers
		WHERE ContactName LIKE '%Maria%';