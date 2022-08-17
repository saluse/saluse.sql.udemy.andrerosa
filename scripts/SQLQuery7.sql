-- Continuação da aula 033
	SELECT * FROM Funcionários
-- SIMULANDO ERRO
	INSERT INTO Funcionários (nome, SALARIO) VALUES ('Pedro','asaas')
-- DML UPDATE
	UPDATE Funcionários SET SALARIO = '700'
	WHERE ID = '23'
