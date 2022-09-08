-- AULA 052
--CHOOSE
--RETORNA O ITEM AO INDICE ESPECIFICADO DE UMA LISTA DE VALORES NO SQL SERVER.
--EXEMPLO 1
SELECT Choose (3, 'Gerente', 'Diretor', 'Desenvolvedor', 'Tester') AS Escolhido 

--EXEMPLO 2
Use AdventureWorks2014
 SELECT productcategoryid,     
Choose (productcategoryid, 'A', 'B', 'C', 'D', 'E') AS Expressao 
FROM   production.productcategory;
