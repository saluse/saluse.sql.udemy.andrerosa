-- AULA 046
-- CONHECENDO AS TABELAS
USE Curso
SELECT TOP 1 * FROM senso_2013
SELECT TOP 1 * FROM Cidades
SELECT * FROM Uf
SELECT * FROM Regiao_Uf

-- AVG Retorna a média dos valores em um grupo. Valores Nulos são ignorados.

SELECT AVG(Populacao) FROM Cidades

-- AVG MÉDIA POR ESTADO
SELECT UF, AVG(Populacao) FROM Cidades
GROUP BY Uf
ORDER BY 2

-- AVG POR REGIÃO
SELECT b.regiao, AVG(a.Populacao) FROM cidades A
INNER JOIN regiao_uf B
ON A.cod_uf=b.id
GROUP BY B.regiao
ORDER BY 2

-- MIN RETORNA OP VALOR MINIMO DA EXPRESSÃO. PODE SER SEGUIDO PELA CLÁUSULA OVER
SELECT MIN(Populacao) FROM cidades

-- MIN POR ESTADO
SELECT UF, MIN(Populacao)
	FROM Cidades
GROUP BY UF
ORDER BY 2

-- AULA 047
-- MIN POR REGIÂO
SELECT b.regiao, MIN(Populacao) FROM cidades A
INNER JOIN regiao_uf B
ON A.cod_uf=B.id
GROUP BY b.regiao
ORDER BY 2

-- MAX: RETORNA O VALOR MAXIMO NA EXPRESSÃO
SELECT MAX(Populacao) FROM cidades

-- MAX POR ESTADO
SELECT UF, MAX(Populacao) FROM Cidades
GROUP BY UF
ORDER BY 2

-- MAX POR REGIÃO
SELECT B.Regiao, MAX(a.Populacao)Maximo FROM cidades a
INNER JOIN regiao_uf b
ON a.cod_uf=B.id
GROUP BY b.regiao
ORDER BY 2

-- SUM: RETORNA A SOMA DE TODOS OS VALORES OU SOMENTE OS VALORES DISTINCT NA EXPRESSÃO.
-- SUM PODE SER USADO EXCLUSIVAMENTE COM COLUNAS NUMÉRICAS. VALORES NULOS SÃO IGNORADOS.

SELECT SUM(Populacao) FROM cidades

-- SUM POR ESTADO
SELECT UF, SUM(Populacao) FROM cidades
GROUP BY UF
ORDER BY 2

-- SUM POR REGIÃO
SELECT b.Regiao, SUM(a.Populacao) FROM Cidades a
INNER JOIN regiao_uf b
ON a.cod_uf=b.id
GROUP BY b.regiao
ORDER BY 2

-- COUNT RETORNA O NÚMERO DE ITENS DE UM GRUPO
SELECT COUNT(*) FROM cidades

-- DESCOBRINDO QUANTOS ESTADOS
SELECT COUNT(DISTINCT UF) fROM cidades

SELECT COUNT(UF) FROM Cidades

-- COUNT POR ESTADO
SELECT UF, COUNT(populacao) FROM Cidades
GROUP BY UF
ORDER BY 2

-- COUNT POR REGIÃO
SELECT b.Regiao, COUNT(*) FROM CIdades a
INNER JOIN regiao_uf b
ON a.cod_uf=b.id
GROUP BY b.regiao
ORDER BY 2

-- USANDO VARIAS FUNÇÕES DE AGREGAÇÃO
SELECT		AVG(Populacao)Média_Pop,
			MIN(Populacao)Minimo_Pop,
			MAX(Populacao)Maximo_Pop,
			SUM(Populacao)Total_Pop,
			COUNT(*) Qtde_CIdades
FROM Cidades

-- AULA 048
-- POR ESTADO

SELECT UF,	AVG(Populacao)Média_Pop,
			MIN(Populacao)Minimo_Pop,
			MAX(Populacao)Maximo_Pop,
			SUM(Populacao)Total_Pop,
			COUNT(*) Qtde_CIdades
FROM Cidades
GROUP BY UF
ORDER BY 2

-- POR REGIÃO
	SELECT b.regiao,	AVG(Populacao)Média_Pop,
						MIN(Populacao)Minimo_Pop,
						MAX(Populacao)Maximo_Pop,
						SUM(Populacao)Total_Pop,
						COUNT(*) Qtde_Cidades
	FROM Cidades a
	INNER JOIN regiao_UF b
	ON a.cod_uf=b.id
	GROUP BY b.regiao
	ORDER BY 2

-- STDEV: RETORNA O DESVIO PADRÃO ESTATISTICO DE TODOS OS VALORES DA EXPRESSÃO

SELECT STDEV(Populacao) FROM cidades

-- STDEVP: RETORNA O DESVIO PADRÃO ESTATISTICO PARA A POPULAÇÃO DE TODOS VALORES NA EXPRESSÃO ESPECIFICADA.

SELECT STDEVP(Populacao) FROM cidades

-- GROUPING: INDICA A EXPRESSÃO DE COLUNA ESPECIFICADA EM UMA LISTA.	
-- GROUP BY: É  AGREGADA OU NÃO. GROUPING RETORNA 1 PARA AGREGADA OOU 0 PARA NÃO AGREGADA NO CONJUTO DE RESULTADOS.

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


