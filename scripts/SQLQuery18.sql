-- AULA 055

DECLARE @meuvalor DECIMAL (5, 2); 
SET @meuvalor = 193.57; 
-- OR, USING CAST  
SELECT Cast(@meuvalor AS VARBINARY(20)); 
SELECT Cast(Cast(@meuvalor AS VARBINARY(20)) AS DECIMAL(5, 2)); 
-- OR, USING CONVERT  
SELECT CONVERT(VARBINARY(20), @meuvalor); 
SELECT CONVERT(DECIMAL(5, 2), CONVERT(VARBINARY(20), @meuvalor));


