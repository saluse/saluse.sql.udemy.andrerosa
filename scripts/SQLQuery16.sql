-- AULA 052
--CHOOSE
--RETORNA O ITEM AO INDICE ESPECIFICADO DE UMA LISTA DE VALORES NO SQL SERVER.
--EXEMPLO 01
SELECT Choose (3, 'Gerente', 'Diretor', 'Desenvolvedor', 'Tester') AS Escolhido 

--EXEMPLO 02
Use AdventureWorks2014
 SELECT productcategoryid,     
Choose (productcategoryid, 'A', 'B', 'C', 'D', 'E') AS Expressao 
FROM   production.productcategory;

--EXEMPLO 03

 SELECT jobtitle,        
        hiredate,
		Month(hiredate)mes,        
		Choose(Month(hiredate), 'Winter', 'Winter', 'Spring', 'Spring', 
		                        'Spring','Summer', 'Summer','Summer', 
								'Autumn', 'Autumn', 'Autumn','Winter') AS Quarter_Hired 
		FROM   humanresources.employee 
		WHERE  Year(hiredate) > 2005 
		ORDER  BY Year(hiredate);

--IIF
--RETORNA 1 DE 2 VALORES, DEPENDENDO DA EXPRESSÃO BOOLEANA SER AVALIADA COMO TRUE OU FALSE NO SQL SERVER 

--EXEMPLO 01

 DECLARE @a INT = 45,          
		 @b INT = 40;   
		 SELECT IIF (@a > @b, 'TRUE', 'FALSE') AS Resultado;

DECLARE @a INT = 45,          
		 @b INT = 40;   
		 SELECT IIF (@a > @b, 'Maior', 'Menor') AS Resultado;

DECLARE @a INT = 45,          
		 @b INT = 40;   
		 SELECT IIF (@a < @b, 'Menor', 'Maior') AS Resultado;

--EXEMPLO 2

--IIF COM CONSTANTES NULL
--O RESULTADO DESSA INSTRUÇÃO É UM ERRO

SELECT IIF (45 > 30, NULL, NULL) AS Result;

--EXEMPLO 3
--IIF COM PARÂMETROS NULL O RETORNO NULL

	DECLARE @P INT = NULL,         
			@S INT = NULL; 
	SELECT  IIF (45 > 30, @p, @s) AS Result

