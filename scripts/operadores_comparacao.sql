--Usando operador = 
	SELECT * FROM   cidades 
	WHERE  uf ='SP'

--Outro exemplo operador =
	SELECT * FROM   cidades 
	WHERE nome_mun = 'Dourado'      
	AND uf = 'SP' 

--Usando operador > 
	SELECT * FROM   cidades 
	WHERE  populacao > 100000 

--Usando operador > 
	SELECT * FROM   cidades 
	WHERE  populacao > 1000000

--Usando operador < 
	SELECT * FROM   cidades 
	WHERE  populacao < 10000 
--Usando operador < 
	SELECT * FROM   cidades 
	WHERE  populacao < 50000

--Usando operador <= 
	SELECT * FROM   cidades 
	WHERE  populacao <= 10000 
--Usando operador <= 
	SELECT * FROM   cidades 
	WHERE  populacao <= 50000

--Usando operador <> 
	SELECT * FROM   cidades 
	WHERE  uf <> 'SP'        
	AND uf <> 'SC'

--Combinando operadores 
	SELECT * FROM   cidades 
	WHERE  populacao <= 100000        
		AND populacao >= 50000        
		AND uf = 'SP'        
		AND nome_mun <> 'Vinhedo'
