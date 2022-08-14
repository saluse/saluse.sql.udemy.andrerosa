USE NORTHWND

--OPERADOR WHERE	
	SELECT * FROM   
	customers 
	WHERE  country = 'Brazil';
use AdventureWorks2014
--OPERADOR AND
	SELECT  b.firstname,        
			b.lastname,        
			a.businessentityid,        
			a.loginid,        
			a.jobtitle,        
			a.vacationhours 
	FROM   humanresources.employee a
	   inner join Person.Person b
	     on a.BusinessEntityID=b.BusinessEntityID
	WHERE  
	a.jobtitle = 'Marketing Assistant' 			         
	AND a.vacationhours > 40;

--OPERADOR BETWEEN
	SELECT  e.firstname,        
			e.lastname,        
			ep.rate 
	FROM   humanresources.vemployee e        
	JOIN humanresources.employeepayhistory ep          
	ON e.businessentityid = ep.businessentityid 
		WHERE  ep.rate BETWEEN 10 AND 30 
	ORDER  BY ep.rate;

--OPERADOR IN
	SELECT  p.firstname,        
			p.lastname,        
			sp.salesquota 
	FROM   person.person AS p        
	JOIN sales.salesperson AS sp          
		ON p.businessentityid = sp.businessentityid 
		WHERE  p.businessentityid IN (SELECT businessentityid                               FROM   sales.salesperson                              
	 			WHERE  salesquota > 250000);

--OPERADOR NOT IN
	SELECT  p.firstname,        
			p.lastname,        
			sp.salesquota 
	FROM   person.person AS p        
	JOIN sales.salesperson AS sp          
		ON p.businessentityid = sp.businessentityid 
		WHERE  p.businessentityid NOT IN (SELECT businessentityid                               FROM   sales.salesperson                              
	 			WHERE  salesquota > 250000);
use NORTHWND
--LIKE LOCALIZA VALORES QUE CONTENHAM "OR" EM QUALQUER LUGAR
	SELECT * FROM   customers 
		WHERE  contactname LIKE '%or%'; 
--LIKE Encontra quaisquer valores que tenham "r" na segunda posição	
	SELECT * FROM   customers 
		WHERE  contactname LIKE '_r%'; 

--LIKE Localiza valores que começam com "a" e possuem pelo menos 3 caracteres de comprimento
	SELECT * FROM   customers 
		WHERE  contactname LIKE 'a_%_%';

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

--LIKE CORINGA
		SELECT  lastname,        
				firstname 
		FROM   person.person 
		WHERE  lastname LIKE 'Zh[ae]ng' 
		ORDER  BY lastname ASC,firstname ASC;

--OPERADOR NOT
		SELECT  productid,        
				NAME,        
				color,        
				standardcost 
		FROM   production.product 
			WHERE  productnumber LIKE 'BK-%'        
			AND color = 'Silver'        
			AND NOT standardcost < 400;


--OPERADOR OR
		SELECT  firstname,        
				lastname,
				shift,
				department
		FROM   humanresources.vemployeedepartmenthistory 
		WHERE  department = 'Quality Assurance'        
		AND ( shift = 'Evening' OR shift = 'Night' );

use AdventureWorks2014
--OPERADOR IS NULL
		SELECT  lastname,        
				firstname,        
				MiddleName 
		FROM   person.person 
		WHERE  MiddleName IS NULL; 

	

--OPERADOR IS NOT NULL
		SELECT  lastname,        
				firstname,        
				MiddleName 
		FROM   person.Person
		WHERE  MiddleName IS NOT NULL; 

use NORTHWND
--OPERADOR HAVING 
	SELECT Count(CustomerId),        
		   country 
		   FROM   customers 
		   GROUP  BY country HAVING Count(CustomerId) < 5

--OPERADOR HAVING 
		SELECT  employees.lastname,        
				Count(orders.orderid) AS NumberOfOrders 
		FROM   orders        
		INNER JOIN employees                
			ON orders.employeeid = employees.employeeid 
		--WHERE  lastname = 'Davolio' OR lastname = 'Fuller' 
		GROUP  BY lastname HAVING Count(orders.orderid) > 25; 


