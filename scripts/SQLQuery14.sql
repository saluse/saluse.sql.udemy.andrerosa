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