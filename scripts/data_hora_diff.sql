--DIFERENCA EM DIAS
SELECT Datediff(day, '2015-03-12', '2017-07-13')  

--DIFERENCA EM MESES
SELECT Datediff (month, '2015-03-12', '2017-07-13') 

--DIFERENCA EM Anos
SELECT Datediff (year, '2015-03-12', '2017-07-13')
  
--Atraves deste comando podemo descobrir ha quantos dias/meses ou anos nascemos. 
--DIFERENCA EM DIA
SELECT Datediff (day, '1977-11-05', Getdate()) 

--DIFERENCA EM MESES
SELECT Datediff (month, '1977-11-05', Getdate()) 

--DIFERENCA EM Anos
SELECT Datediff (year, '1977-11-05', Getdate())

--EXEMPLO
USE NORTHWND

	SELECT a.OrderID,
		   a.OrderDate,
		   a.RequiredDate,
		   Datediff (day,a.OrderDate,a.RequiredDate) dif_dia,
		   Datediff (month,a.OrderDate,a.RequiredDate) dif_mes,
		   Datediff (YEAR,a.OrderDate,a.RequiredDate) dif_anos
    FROM Orders A 
	where Datediff (day,a.OrderDate,a.RequiredDate)<28

--FORMATANDO DATAS
	Select convert(varchar(10),getdate(),103)

	Select convert(varchar(5),getdate(),103)

	Select convert(varchar(10),getdate(),108)

	Select convert(varchar(5),getdate(),108)

	SELECT CONVERT(VARCHAR(20),GETDATE(), 100)

	SELECT CONVERT(VARCHAR(8),GETDATE(), 1) 

--Extens o
SELECT CAST(DAY(GETDATE()) AS VARCHAR(2)) + ' ' +
       DATENAME(MM, GETDATE()) AS [Dia e Mes]

--EXEMPLO EM TABELA
USE NORTHWND
	SELECT a.OrderDate,
		   CONVERT(varchar(10),a.OrderDate,120)padrao120,
	       CONVERT(varchar(10),a.OrderDate,103)padrao103,
		   CONVERT(VARCHAR(20),a.OrderDate,100)padrao100,
		   CONVERT(VARCHAR(11),a.OrderDate,100)padrao100,
		   CONVERT(VARCHAR(8),a.OrderDate,1)  padrao1
		   FROM Orders a

	--Exenmplo Simples
	use curso
	DECLARE @data DATETIME  
	SET @data=getdate()+1
	SELECT @data,
			CASE WHEN @data = Getdate() THEN 'Hoje'           
				WHEN @data < Getdate() THEN 'Ontem'           
				WHEN @data > Getdate() THEN 'Amanh '         
				END dia 
	--Exemplo 1
	use AdventureWorks2014
	SELECT productnumber,
	       productline,          
	Categoria=CASE productline                      
				WHEN 'R' THEN 'Road'                      
				WHEN 'M' THEN 'Mountain'                      
				WHEN 'T' THEN 'Touring'                      
				WHEN 'S' THEN 'Other sale items'                      
				ELSE 'Not for sale' END,        
				NAME  
	FROM   production.product  
	ORDER  BY productnumber;

--Exemplo 2
	SELECT productnumber,
	       productline,          
	    CASE                       
			WHEN productline='R' THEN 'Road'                      
			WHEN productline='M' THEN 'Mountain'                      
			WHEN productline='T' THEN 'Touring'                      
			WHEN productline='S' THEN 'Other sale items'                      
			ELSE 'Not for sale' END Categoria,        
			NAME  
	FROM   production.product  
	ORDER  BY productnumber;

--Exemplo

SELECT productnumber,         
	   NAME, 
	   listprice,   
	   CASE WHEN listprice = 0 THEN 'N o est a venda' 
	        WHEN listprice < 50 THEN 'Abaixo de $50'                           
			WHEN listprice >=50  AND listprice < 250 THEN 'Abaixo de $250'  
			WHEN listprice >=250 AND listprice < 1000 THEN 'Abaixo de $1000'  
			ELSE 'Acima de $1000' END Price_Range,         
			'Produtos' AS Categoria  
	   FROM   production.product  
	   ORDER  BY productnumber

--Ordernando com Case When
SELECT businessentityid,         
       salariedflag  
	FROM   humanresources.employee  
	ORDER  BY CASE WHEN salariedflag = 1 THEN businessentityid END DESC,            
	          CASE WHEN salariedflag = 0 THEN businessentityid END ASC

--update com Case when
  BEGIN TRANSACTION

	UPDATE humanresources.employee  
	SET vacationhours = ( CASE WHEN ( ( vacationhours - 10.00 ) < 0 ) 
	   THEN   vacationhours + 40 
	   ELSE ( vacationhours + 20.00 ) END ) 
	    
	   output deleted.businessentityid,         
	   deleted.vacationhours AS Antes,         
	   inserted.vacationhours AS Depois  
	   WHERE  salariedflag = 0;
   
   Rollback transaction

--Fim Aula