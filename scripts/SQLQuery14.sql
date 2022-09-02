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