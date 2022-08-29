-- AULA 042
-- CONTINUAÇÃO
-- Clientes que fizeram pedidos antes da data atual
SELECT Cod_CLI,
	   Cli_Nomes
FROM   Clientes
WHERE  Cod_cli IN (SELECT Cod_CLI
			FROM Pedidos
			WHERE Data < Getdate())

SELECT GETDATE()

SELECT * FROM Clientes

-- AULA 043
-- Clientes que já fizeram algum pedido
SELECT p.Num_ped,
	   p.data,
	   p.cod_cliente,
	   (SELECT c.Cli_Nomes
	   FROM Clientes C
	   WHERE p.cod_Cliente = c.Cod_CLI) AS Nome_CLI
FROM Pedidos AS P

-- Query com Subquery traz o total de cada cliente partindo da tabela Pedidos.
SELECT P.Cod_Cliente,
	   (SELECT c.cli_nomes
	   FROM Clientes C
	   WHERE p.cod_cliente = c.Cod_CLI) AS Cli_nomes,
	   SUM(p.total) Total
FROM Pedidos AS P
GROUP BY p.Cod_Cliente

-- Query para trazer todos os clientes através de subconsulta do valor de suas compras.
SELECT C.Cod_Cli,
	   (SELECT Isnull(Sum(p.Total),0)
	   FROM Pedidos p
	   WHERE c.cod_cli = p.Cod_cliente) AS TOTAL
FROM Clientes c
GROUP BY c.Cod_CLi

-- Eliminando Clientes da tabela que não fizeram pedidos.

SELECT * FROM Clientes
DELETE FROM Clientes
WHERE Cod_CLI not in (SELECT Cod_Cliente FROM Pedidos)