--AULA 050
--RANK: EXEMPLO 2:1
/*
 AS FUN합ES DE CLASSIFICA플O RETORNAM UM VALOR DE CLASSIFICA플O PARA CADA LINHA EM UMA PARTI플O. DEPENDENDO DA FUN플O USADA, 
ALGUMAS LINHAS PODEM RECEBER O MESMO VALOR QUE OUTRAS. AS FUN합ES DE CLASSIFICA플O S홒 N홒 DETERMINISTICAS.
*/
SELECT RANK() OVER (ORDER BY Estado ASC) AS rank_uf ,
		estado
FROM uf

-- RANK EXEMPLO 2
SELECT RANK() OVER (ORDER BY Estado ASC) AS rank_uf,
	Regiao, 
	Estado
FROM regiao_uf

-- RANK EXEMPLO 3
SELECT RANK() OVER (ORDER BY Regiao ASC) AS rank_uf,
	Regiao,
	Estado
FROM regiao_uf

-- NTILE
/* 
DISTRIBUI AS LINHAS DE UMA PARTI플O ORDENADA EM UM N�MERO DE GRUPOS EPESCIFICADOS.
OS GRUPOS S홒 NUMERADOS, INICIALMENTE EM UM. PARA CADA LINHA, NTILE RETORNA O N�MERO DO GRUPO AO QUAL A LINHA PERTENCE.
*/
SELECT NTILE(5) OVER (ORDER BY Regiao ASC) AS Ntile_uf,
	Regiao,
	Estado
FROM regiao_uf

-- AULA 051
/*
RETORNA A CLASSIFICA플O DE LINHAS DENTRO DA PARTI플O DE UM CONJUNTO DE RESULTADOS,
SEM QUALQUER LACUNA NA CLASSIFICA플O. A CLASSIFICA플O DE UMA LINHA � UM MAIS O N�MERO DE CLASSIFICA합ES DISTINTAS QUE V�M ANTES DA LINHA EM QUEST홒.
*/
SELECT DENSE_RANK() OVER (ORDER BY Regiao ASC) AS dense_rank_uf,
	Regiao,
	Estado
FROM Regiao_uf

SELECT DENSE_RANK() OVER (ORDER BY Estado ASC) AS DENSE_RANK_UF,
	regiao,
	estado
FROM regiao_uf

-- ROW_NUMBER
/* RETORNA O N�MERO SEQUENCIAL DE UMA LINHA EM UMA PARTI플O DE UM CONJUNTO DE RESULTADOS,
INICIANDO EM 1 PARA A PRIMEIRA LINHA DE CADA PARTI플O.
*/
SELECT ROW_NUMBER() OVER (ORDER BY Estado ASC) AS Row_Number_Uf,
	Regiao,
	estado
FROM regiao_uf

-- COMBINANDO VALORES 01
SELECT	ROW_NUMBER() OVER (ORDER BY Regiao ASC) AS ROW_NUMBER_UF,
		DENSE_RANK() OVER (ORDER BY Regiao ASC) AS DENSE_RANK_UF,
		NTILE(5) OVER (ORDER BY Regiao ASC) AS NTILE_UF,
		RANK() OVER (ORDER BY Regiao ASC) AS Rank_UF,
		Regiao,
		Estado
FROM regiao_uf
ORDER BY 5,6

-- SIMULAMDO CLASSIFICA픈O DE CAMPEONATO
-- DROPs TABLE CAMPEONATO
CREATE TABLE Campeonato
(
	Nometime	Varchar(30) NOT NULL,
	Pontos		INT NOT NULL	

	)

-- POPULANDO TABELA

insert into campeonato values ('Corinthians','53');
insert into campeonato values ('Gr�mio','43');
insert into campeonato values ('Santos','41');
insert into campeonato values ('Palmeiras','40');
insert into campeonato values ('Flamengo','38');
insert into campeonato values ('Cruzeiro','37');
insert into campeonato values ('Botafogo','37');
insert into campeonato values ('Atl�tico-PR','34');
insert into campeonato values ('Vasco','31');
insert into campeonato values ('Atl�tico-MG','31');
insert into campeonato values ('Fluminense','31');
insert into campeonato values ('Sport','29');
insert into campeonato values ('Ava�','29');
insert into campeonato values ('Chapecoense','28');
insert into campeonato values ('Ponte Preta','28');
insert into campeonato values ('Bahia','27');
insert into campeonato values ('S�o Paulo','27');
insert into campeonato values ('Coritiba','27');
insert into campeonato values ('Vit�ria','26');
insert into campeonato values ('Atl�tico-GO','22');

SELECT * FROM Campeonato

--Classificacao do campeonato
	select rank() OVER�(ORDER잹Y쟰ontos쟡esc)잸S쟠lassif ,
		    nometime,
			pontos 
	from campeonato