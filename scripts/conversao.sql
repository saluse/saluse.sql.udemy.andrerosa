
DECLARE @meuvalor DECIMAL (5, 2); 
SET @meuvalor = 193.57; 
-- Or, using CAST  
SELECT Cast(@meuvalor AS VARBINARY(20)); 
SELECT Cast(Cast(@meuvalor AS VARBINARY(20)) AS DECIMAL(5, 2)); 
-- Or, using CONVERT  
SELECT CONVERT(VARBINARY(20), @meuvalor); 
SELECT CONVERT(DECIMAL(5, 2), CONVERT(VARBINARY(20), @meuvalor));



-- Use CAST  
    use AdventureWorks2014
	SELECT Substring(NAME, 1, 30) AS ProductName,        
	listprice 
    FROM   production.product 
	WHERE  Cast(listprice AS INT) LIKE '3%';

-- Use CONVERT.   
	SELECT Substring(NAME, 1, 30) AS ProductName,        
	listprice 
	FROM   production.product 
    WHERE  CONVERT(INT, listprice) LIKE '3%';

--Formatando cast e arrendondando
--Usando CAST com operadores aritméticos
	SELECT Cast(Round(salesytd / commissionpct, 0) AS INT) AS formatado,        
					 (salesytd / commissionpct )  nao_format 
	FROM   sales.salesperson 
	WHERE  commissionpct <> 0

--Usando CAST para concatenar
	SELECT  'A lista de preco é '+ Cast(listprice AS VARCHAR(12)) AS ListPrice 
	FROM   production.product 
	WHERE  listprice BETWEEN 350.00 AND 400.00;

--Usando CAST para concatenar Distinct
	SELECT distinct  'A lista de preco é '+ Cast(listprice AS VARCHAR(12)) AS ListPrice 
	FROM   production.product 
	WHERE  listprice BETWEEN 350.00 AND 400.00;
--Usando CAST para concatenar Distinct (!Simulando erro)
	SELECT distinct  'A lista de preco é '+ listprice AS ListPrice 
	FROM   production.product 
	WHERE  listprice BETWEEN 350.00 AND 400.00;


--Usando CAST para produzir texto mais legível
	SELECT DISTINCT 
	p.NAME,
	Cast(p.NAME AS CHAR(10)) AS NAME,                 
		s.unitprice 
	FROM   sales.salesorderdetail AS s        
		JOIN production.product AS p          
		ON s.productid = p.productid 
	WHERE  p.NAME LIKE 'Long-Sleeve Logo Jersey, M';

--Usando CAST com a cláusula LIKE

	SELECT p.firstname,        
		   p.lastname,        
		   s.salesytd,        
		   s.businessentityid,        
		   Cast(Cast(s.salesytd AS INT) AS CHAR(20)),        
		   Cast(s.salesytd AS CHAR(20)) 
	FROM   person.person AS p        
		JOIN sales.salesperson AS s          
		ON p.businessentityid = s.businessentityid 
		WHERE  Cast(Cast(s.salesytd AS INT) AS CHAR(20)) LIKE '2%'