-- Continua��o da aula 033
	SELECT * FROM Funcion�rios		
-- SIMULANDO ERRO
	INSERT INTO Funcion�rios (nome, SALARIO) VALUES ('Pedro','asaas')

-- DML UPDATE

	UPDATE Funcion�rios SET SALARIO = '700'
	WHERE ID = '23'
-- Ou Aumento de 50% do valor no sal�rio atual.
	UPDATE Funcion�rios SET SALARIO = SALARIO*1.5
	WHERE ID = '22'
-- Redu��o do valor 
	UPDATE Funcion�rios SET SALARIO = salario - SALARIO
-- Exemplo de UPDATE com mais de um campo.
	UPDATE Funcion�rios SET SALARIO = '1500'
-- MEUS TESTES
	UPDATE Funcion�rios SET SETOR = 'Manuten��o'
	WHERE ID = '29'
	UPDATE Funcion�rios SET SETOR = 'Produ��o'	
	WHERE ID = '24'
-- EXEMPLO DE UPDATE COM MAIS DE 1 CAMPO
	UPDATE Funcion�rios SET SALARIO = salario*1.20, SETOR = 'TI'
	WHERE ID <> '1'
-- EXEMPLO DML DELETE
	DELETE Funcion�rios WHERE ID = '29'