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


