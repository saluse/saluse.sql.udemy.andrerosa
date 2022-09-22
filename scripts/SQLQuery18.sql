-- AULA 055

DECLARE @meuvalor DECIMAL (5, 2); 
SET @meuvalor = 193.57; 
-- OR, USING CAST  
SELECT Cast(@meuvalor AS VARBINARY(20)); 
SELECT Cast(Cast(@meuvalor AS VARBINARY(20)) AS DECIMAL(5, 2)); 
-- OR, USING CONVERT  
SELECT CONVERT(VARBINARY(20), @meuvalor); 
SELECT CONVERT(DECIMAL(5, 2), CONVERT(VARBINARY(20), @meuvalor));


-- USE CAST  
    USE AdventureWorks2014
	SELECT SUBSTRING(NAME, 1, 30) AS ProductName,        
	listprice 
    FROM   production.product 
	WHERE  CAST(listprice AS INT) LIKE '3%';

-- USE CONVERT.   
	SELECT SUBSTRING(NAME, 1, 30) AS ProductName,        
	listprice 
	FROM   production.product 
    WHERE  CONVERT(INT, listprice) LIKE '3%';


--FORMATANDO CAST E ARREDONDANDO
--USANDO CAST COM OPERADORES ARITIMÉTICOS
	SELECT CAST(ROUND(salesytd / commissionpct, 0) AS INT) AS formatado,        
					 (salesytd / commissionpct )  nao_format 
	FROM   sales.salesperson 
	WHERE  commissionpct <> 0


--USANDO CAST PARA CONCATENAR
	SELECT  'A lista de preco é '+ CAST(listprice AS VARCHAR(12)) AS ListPrice 
	FROM   production.product 
	WHERE  listprice BETWEEN 350.00 AND 400.00;

--USANDO CAST PARA CONCATENAR DISTINCT
	SELECT DISTINCT  'A lista de preco é '+ Cast(listprice AS VARCHAR(12)) AS ListPrice 
	FROM   production.product 
	WHERE  listprice BETWEEN 350.00 AND 400.00;

--USANDO CAST PARA CONCATENAR DISTINCT (!SIMULANDO ERRO)
	SELECT DISTINCT  'A lista de preco é '+ listprice AS ListPrice 
	FROM   production.product 
	WHERE  listprice BETWEEN 350.00 AND 400.00;

--USANDO CAST PARA PRODUZIR TEXTOS MAIS LEGÍVEIS
	SELECT DISTINCT 
	p.NAME,
	CAST(p.NAME AS CHAR(10)) AS NAME,                 
		s.unitprice 
	FROM   sales.salesorderdetail AS s        
		JOIN production.product AS p          
		ON s.productid = p.productid 
	WHERE  p.NAME LIKE 'Long-Sleeve Logo Jersey, M';

--USANDO CAST COM A CLÁUSULA LIKE

	SELECT p.firstname,        
		   p.lastname,        
		   s.salesytd,        
		   s.businessentityid,        
		   CAST(CAST(s.salesytd AS INT) AS CHAR(20)),        
		   CAST(s.salesytd AS CHAR(20)) 
	FROM   person.person AS p        
		JOIN sales.salesperson AS s          
		ON p.businessentityid = s.businessentityid 
		WHERE  CAST(CAST(s.salesytd AS INT) AS CHAR(20)) LIKE '2%'


