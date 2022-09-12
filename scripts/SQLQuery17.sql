-- TOP
-- RECUPERANDO 3 REGISTROS DA TABELA
USE NORTHWND
SELECT TOP 3 * FROM customers

SELECT TOP 10 a.CustomerID,a.CompanyName 
FROM customers a