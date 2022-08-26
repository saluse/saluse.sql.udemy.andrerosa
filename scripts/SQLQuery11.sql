-- AULA 041
-- PARTE 01 (SUBCONSULTAS)
-- CRIANDO TABELA CLIENTE
USE Curso
CREATE TABLE Clientes
(Cod_CLI	nchar(5) PRIMARY KEY,
Cli_Nomes	nvarchar(40) NOT NULL
)
SELECT * FROM Clientes

-- IINSERINDO DADOS DA TABELA CLIENTE A PARTIR DA TABELA CUSTOMERS DO BD NORTHWIND
INSERT INTO Clientes
SELECT CustomerID, CompanyName FROM NORTHWND.dbo.Customers

-- Criando Tabela PEDIDOS
CREATE TABLE Pedidos
	(Num_Ped	INT PRIMARY KEY,
	Cod_Cliente nchar(5) NOT NULL,
	Data		DATETIME NOT NULL,
	Total		DECIMAL(10,2)
	)
SELECT * FROM Pedidos
-- IINSERINDO DADOS DA TABELA PEDIDOS A PARTIR DA TABELA ORDER DO BD NORTHWIND	
INSERT INTO Pedidos	(Num_Ped, Cod_Cliente, Data)
SELECT OrderID, CustomerID, OrderDate FROM NORTHWND.dbo.Orders

-- ATUALIZANDO CAMPO TOTAL DA TABEL PEDIDOS COM UPDATE EM SUBSELECT
	UPDATE Pedidos SET Total=(SELECT SUM(b.unitprice*b.quantity)
	FROM NORTHWND.dbo.[Order Details] b
	WHERE Num_Ped=b.OrderID)	