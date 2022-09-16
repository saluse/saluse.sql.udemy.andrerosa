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

-- Use CONVERT.   
	SELECT Substring(NAME, 1, 30) AS ProductName,        
	listprice 
	FROM   production.product 
    WHERE  CONVERT(INT, listprice) LIKE '3%';