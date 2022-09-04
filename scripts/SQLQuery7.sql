-- Continuação da aula 033
	SELECT * FROM Funcionários		
-- SIMULANDO ERRO
	INSERT INTO Funcionários (nome, SALARIO) VALUES ('Pedro','asaas')

-- DML UPDATE

	UPDATE Funcionários SET SALARIO = '700'
	WHERE ID = '23'
-- Ou Aumento de 50% do valor no salário atual.
	UPDATE Funcionários SET SALARIO = SALARIO*1.5
	WHERE ID = '22'
-- Redução do valor 
	UPDATE Funcionários SET SALARIO = salario - SALARIO
-- Exemplo de UPDATE com mais de um campo.
	UPDATE Funcionários SET SALARIO = '1500'
-- MEUS TESTES
	UPDATE Funcionários SET SETOR = 'Manutenção'
	WHERE ID = '29'
	UPDATE Funcionários SET SETOR = 'Produção'	
	WHERE ID = '24'
-- EXEMPLO DE UPDATE COM MAIS DE 1 CAMPO
	UPDATE Funcionários SET SALARIO = salario*1.20, SETOR = 'TI'
	WHERE ID <> '1'
-- EXEMPLO DML DELETE
	DELETE Funcionários WHERE ID = '29'