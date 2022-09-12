--TOP
--recuperando 3 registros da tabela
use NORTHWND
SELECT TOP 3 * FROM customers

SELECT TOP 10 a.CustomerID,a.CompanyName 
FROM customers a
 
--10 clientes com maior volume de pedido(compras)
use NORTHWND
select top 10
       rank() over(order by sum(c.Quantity*c.UnitPrice) desc)posicao,
	   a.CompanyName,
	   sum(c.Quantity*c.UnitPrice) Tot_compras
from Customers a
  inner join Orders b
  on a.CustomerID=b.CustomerID
  inner join [Order Details] c
  on b.OrderID=c.OrderID
  group by a.CompanyName
  --order by 3 desc

--recuperando 10 cidades mais populosas Brasil
use curso
select top 10 * from cidades
order by populacao desc

use curso
select top 10 *,rank() over(order by populacao desc) as posicao 
from cidades
order by populacao desc

