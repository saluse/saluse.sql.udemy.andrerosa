-- TOP
-- RECUPERANDO 3 REGISTROS DA TABELA

USE NORTHWND
SELECT TOP 3 * FROM customers

SELECT TOP 10 a.CustomerID,a.CompanyName 
FROM customers a

--10 CLIENTES COM O MAIOR VOLUME DE PEDIDO (COMPRAS)
USE NORTHWND
SELECT TOP 10
	RANK() OVER(ORDER BY SUM(c.Quantity*c.UnitPrice) DESC)Posicao,
       A.CompanyName,
	   SUM(c.Quantity*c.UnitPrice) Tot_compras
	FROM Customers a
	INNER JOIN Orders b
	ON a.CustomerID=b.CustomerID
	INNER JOIN [Order Details] c
  ON b.OrderID=c.OrderID
  GROUP BY a.CompanyName