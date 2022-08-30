--conhecendo as tabelas
use curso
select top 1 * from cidades
select top 1 * from senso_2013
select * from uf
select * from regiao_uf


--AVG Retorna a média dos valores em um grupo. Valores nulos são ignorados
select AVG(populacao) from cidades

--AVG MEDIA POR ESTADO

SELECT UF,AVG(POPULACAO) FROM CIDADES
GROUP BY UF
ORDER BY 2

--AVG POR REGIAO

SELECT B.regiao,AVG(a.POPULACAO) 
	FROM CIDADES A
INNER JOIN regiao_uf B
ON A.cod_uf=B.ID
GROUP BY B.regiao
ORDER BY 2 desc


--MIN Retorna o valor mínimo na expressão. Pode ser seguido pela cláusula OVER
select MIN(populacao) from cidades

--MIN  POR ESTADO

SELECT UF,MIN(POPULACAO) 
	FROM CIDADES
GROUP BY UF
ORDER BY 2

--MIN POR REGIAO

SELECT B.regiao,MIN(POPULACAO) FROM CIDADES A
INNER JOIN regiao_uf B
ON A.cod_uf=B.ID
GROUP BY B.regiao
ORDER BY 2

--MAX Retorna o valor máximo na expressão
select MAX(populacao) from cidades

--MAX  POR ESTADO

SELECT UF,MAX(POPULACAO) FROM CIDADES
GROUP BY UF
ORDER BY 2

--MAX POR REGIAO

SELECT B.regiao,MAX(a.POPULACAO)maximo FROM CIDADES a
INNER JOIN regiao_uf B
ON A.cod_uf=B.ID
GROUP BY B.regiao
ORDER BY 2



--SUM Retorna a soma de todos os valores ou somente os valores DISTINCT na expressão. 
--SUM pode ser usado exclusivamente com colunas numéricas.Valores nulos são ignorados.

select SUM(populacao) from cidades
--183989711
--183989711
--183989711

--SUM  POR ESTADO

SELECT UF,SUM(POPULACAO) FROM CIDADES
GROUP BY UF
ORDER BY 2

--SUM POR REGIAO

SELECT B.regiao,SUM(a.POPULACAO) FROM CIDADES a
INNER JOIN regiao_uf B
ON A.cod_uf=B.ID
GROUP BY B.regiao
ORDER BY 2

--COUNT Retorna o número de itens de um grupo

select COUNT(*) from cidades

--Descobrindo qtd estados
select count(distinct uf) from cidades

--exemplo
select count(uf) from cidades


--COUNT  POR ESTADO

SELECT UF,COUNT(*) FROM CIDADES
GROUP BY UF
ORDER BY 2

--COUNT POR REGIAO

SELECT B.regiao,COUNT(*) FROM CIDADES a
INNER JOIN regiao_uf B
ON A.cod_uf=B.ID
GROUP BY B.regiao
ORDER BY 2

--usando varias funçoes de agregacao

select avg(populacao)media_pop,
	   min(populacao)minimo_pop,
	   max(populacao)maximo_pop,
	   sum(populacao)total_pop,
	   COUNT(*) qtd_cidades
from cidades

--POR ESTADO

SELECT UF,
	   avg(populacao)media_pop,
	   min(populacao)minimo_pop,
	   max(populacao)maximo_pop,
	   sum(populacao)total_pop,
	   COUNT(*) qtd_cidades
FROM CIDADES
GROUP BY UF
ORDER BY 2

--POR REGIAO

SELECT B.regiao,
	  avg(populacao)media_pop,
	   min(populacao)minimo_pop,
	   max(populacao)maximo_pop,
	   sum(populacao)total_pop,
	   COUNT(*) qtd_cidades
 FROM CIDADES a
INNER JOIN regiao_uf B
ON A.cod_uf=B.ID
GROUP BY B.regiao
ORDER BY 2

--STDEV Retorna o desvio padrão estatístico de todos os valores da expressão especificada

select STDEV(populacao)  from cidades

--STDEVP Retorna o desvio padrão estatístico para a população de todos os 
--valores na expressão especificada

select STDEVP(populacao)  from cidades

--GROUPING Indica se uma expressão de coluna especificada em uma lista 
--GROUP BY é agregada ou não. GROUPING retorna 1 para agregada ou 0 
--para não agregada no conjunto de resultados.

select uf,sum(populacao) as populacao,
GROUPING(uf) as grupo 
from cidades
group by uf with rollup

--COMPARANDO CRESCIMENTO DA CIDADES
SELECT TOP 1 *  FROM CIDADES
SELECT TOP 1 *  FROM senso_2013

--select cod_uf,cod_mun,cod_uf+cod_mun as concatenado from cidades
--usando exemplo
SELECT a.nome_mun,
       a.populacao as senso_2007,
	   b.populacao as senso_2013,
100/cast(a.populacao as float)*cast(b.populacao as float)-100 pct_cresc
from cidades a
inner join senso_2013 b
on a.cod_uf+a.cod_mun=b.cod_mun

--por estado
SELECT a.uf,
       sum(a.populacao) as senso_2007,
	   sum(b.populacao) as senso_2013,
100/cast(sum(a.populacao) as float)*cast(sum(b.populacao) as float)-100
from cidades a
inner join senso_2013 b
on a.cod_uf+a.cod_mun=b.cod_mun
group by a.uf



--GROUPING_ID
/*
É uma função que calcula o nível de agrupamento. 
GROUPING_ID pode ser usada apenas na lista SELECT <select>, 
na cláusula HAVING ou ORDER BY, quando GROUP BY for especificada.
*/
select b.regiao,a.uf,sum(a.populacao) populacao,
GROUPING_ID(b.regiao,a.uf) as grupo 
from cidades a
inner join regiao_uf b
on a.cod_uf=b.id
group by rollup(b.regiao,a.uf)



--VAR Retorna a variância estatística de todos os valores da expressão especificada
SELECT VAR(POPULACAO) FROM CIDADES

SELECT UF,VAR(POPULACAO) FROM CIDADES
GROUP BY UF


--VARP Retorna a variância estatística para o preenchimento 
--de todos os valores da expressão especificada.
SELECT VARP(POPULACAO) FROM CIDADES

SELECT UF,VARP(POPULACAO) FROM CIDADES
GROUP BY UF

SELECT UF,VAR(POPULACAO) var,VARP(POPULACAO)varp FROM CIDADES
GROUP BY UF



--exemplo com Grouping
use AdventureWorks2014
SELECT salesquota,        Sum(salesytd)        'TotalSalesYTD',        
Grouping(salesquota) AS 'Grouping' 
from sales.salesperson 
GROUP  BY salesquota WITH rollup;









