-- AULA 046
-- CONHECENDO AS TABELAS
USE Curso
SELECT TOP 1 * FROM senso_2013
SELECT TOP 1 * FROM Cidades
SELECT * FROM Uf
SELECT * FROM Regiao_Uf

-- AVG Retorna a m�dia dos valores em um grupo. Valores Nulos s�o ignorados.

SELECT AVG(Populacao) FROM Cidades

-- AVG M�DIA POR ESTADO
SELECT UF, AVG(Populacao) FROM Cidades
GROUP BY Uf
ORDER BY 2

-- AVG POR REGI�O
SELECT b.regiao, AVG(a.Populacao) FROM cidades A
INNER JOIN regiao_uf B
ON A.cod_uf=b.id
GROUP BY B.regiao
ORDER BY 2

-- MIN RETORNA OP VALOR MINIMO DA EXPRESS�O. PODE SER SEGUIDO PELA CL�USULA OVER
SELECT MIN(Populacao) FROM cidades

-- MIN POR ESTADO
SELECT UF, MIN(Populacao)
	FROM Cidades
GROUP BY UF
ORDER BY 2

-- AULA 047
-- MIN POR REGI�O
SELECT b.regiao, MIN(Populacao) FROM cidades A
INNER JOIN regiao_uf B
ON A.cod_uf=B.id
GROUP BY b.regiao
ORDER BY 2

-- MAX: RETORNA O VALOR MAXIMO NA EXPRESS�O
SELECT MAX(Populacao) FROM cidades

-- MAX POR ESTADO
SELECT UF, MAX(Populacao) FROM Cidades
GROUP BY UF
ORDER BY 2

-- MAX POR REGI�O
SELECT B.Regiao, MAX(a.Populacao)Maximo FROM cidades a
INNER JOIN regiao_uf b
ON a.cod_uf=B.id
GROUP BY b.regiao
ORDER BY 2

-- SUM: RETORNA A SOMA DE TODOS OS VALORES OU SOMENTE OS VALORES DISTINCT NA EXPRESS�O.
-- SUM PODE SER USADO EXCLUSIVAMENTE COM COLUNAS NUM�RICAS. VALORES NULOS S�O IGNORADOS.

SELECT SUM(Populacao) FROM cidades

-- SUM POR ESTADO
SELECT UF, SUM(Populacao) FROM cidades
GROUP BY UF
ORDER BY 2

-- SUM POR REGI�O
SELECT b.Regiao, SUM(a.Populacao) FROM Cidades a
INNER JOIN regiao_uf b
ON a.cod_uf=b.id
GROUP BY b.regiao
ORDER BY 2

-- COUNT RETORNA O N�MERO DE ITENS DE UM GRUPO
SELECT COUNT(*) FROM cidades

-- DESCOBRINDO QUANTOS ESTADOS
SELECT COUNT(DISTINCT UF) fROM cidades

SELECT COUNT(UF) FROM Cidades

-- COUNT POR ESTADO
SELECT UF, COUNT(populacao) FROM Cidades
GROUP BY UF
ORDER BY 2

-- COUNT POR REGI�O
SELECT b.Regiao, COUNT(*) FROM CIdades a
INNER JOIN regiao_uf b
ON a.cod_uf=b.id
GROUP BY b.regiao
ORDER BY 2

-- USANDO VARIAS FUN��ES DE AGREGA��O
SELECT		AVG(Populacao)M�dia_Pop,
			MIN(Populacao)Minimo_Pop,
			MAX(Populacao)Maximo_Pop,
			SUM(Populacao)Total_Pop,
			COUNT(*) Qtde_CIdades
FROM Cidades

-- AULA 048
-- POR ESTADO

SELECT UF,	AVG(Populacao)M�dia_Pop,
			MIN(Populacao)Minimo_Pop,
			MAX(Populacao)Maximo_Pop,
			SUM(Populacao)Total_Pop,
			COUNT(*) Qtde_CIdades
FROM Cidades
GROUP BY UF
ORDER BY 2

-- POR REGI�O
	SELECT b.regiao,	AVG(Populacao)M�dia_Pop,
						MIN(Populacao)Minimo_Pop,
						MAX(Populacao)Maximo_Pop,
						SUM(Populacao)Total_Pop,
						COUNT(*) Qtde_Cidades
	FROM Cidades a
	INNER JOIN regiao_UF b
	ON a.cod_uf=b.id
	GROUP BY b.regiao
	ORDER BY 2

-- STDEV: RETORNA O DESVIO PADR�O ESTATISTICO DE TODOS OS VALORES DA EXPRESS�O

SELECT STDEV(Populacao) FROM cidades

-- STDEVP: RETORNA O DESVIO PADR�O ESTATISTICO PARA A POPULA��O DE TODOS VALORES NA EXPRESS�O ESPECIFICADA.

SELECT STDEVP(Populacao) FROM cidades

-- GROUPING: INDICA A EXPRESS�O DE COLUNA ESPECIFICADA EM UMA LISTA.	
-- GROUP BY: �  AGREGADA OU N�O. GROUPING RETORNA 1 PARA AGREGADA OOU 0 PARA N�O AGREGADA NO CONJUTO DE RESULTADOS.

SELECT UF, SUM(Populacao) populacao,
GROUPING(UF) AS grupo
FROM Cidades
GROUP BY UF WITH ROLLUP

-- COMPARANDO CRESCIMENTO DAS CIDADES
SELECT TOP 1 * FROM CIDADES
SELECT TOP 1 * FROM SENSO_2013

-- USANDO EXEMPLO 
SELECT	a.nome_mun,
	    a.populacao AS senso_2007,
		b.populacao AS senso_2013,
100/CAST(a.populacao AS FLOAT)*CAST(b.populacao AS FLOAT)-100 pct_cresc
FROM Cidades a
INNER JOIN Senso_2013 b
ON a.cod_uf+a.cod_mun=b.cod_mun

-- AULA 049
-- POR ESTADO
SELECT	a.uf, 
			SUM(a.populacao) AS senso_2007, 
			SUM(b.populacao) AS senso_2013,
			100/CAST(SUM(a.populacao) AS FLOAT)*CAST(SUM(b.populacao) AS FLOAT)-100
		FROM cidades a
		INNER JOIN senso_2013 b
		ON a.cod_uf+a.cod_mun=b.cod_mun
		GROUP BY a.uf


