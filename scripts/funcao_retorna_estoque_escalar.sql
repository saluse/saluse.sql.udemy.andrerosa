use AdventureWorks2014
--drop function dbo.inventario
CREATE FUNCTION inventario(@ProductID INT)  
	returns INT  
	AS    
-- Retorna estoque de produto.    
BEGIN        
	DECLARE @ret INT;         
	SELECT @ret = Sum(p.quantity)        
		FROM   production.productinventory p       
	 WHERE  p.productid = @ProductID               
		    AND p.locationid = '6';         
	IF ( @ret IS NULL )          
	SET @ret = 0;         
	RETURN @ret;    
	END;
	
--invocante a funcao inventario
	SELECT productmodelid,         
		   NAME,         
		   dbo.inventario(productid)AS Estoque_atual  
		   FROM   production.product  
		   WHERE  productmodelid BETWEEN 75 AND 100; 
 
