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

 -- ORDER BY 3 DESC
 -- RECUPERANDO AS 10 CIDADES MAIS POPULOSAS DO BRASIL

 USE curso
 SELECT TOP 10 * FROM cidades
 ORDER BY populacao Desc

 USE Curso
 SELECT TOP 10 *,RANK() OVER(ORDER BY Populacao Desc) AS Posicao
 FROM Cidades
 ORDER BY populacao Desc