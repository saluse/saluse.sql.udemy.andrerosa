-- EXEMPLO ASCII

SELECT ASCII('SQL')
SELECT ASCII('s')
SELECT ASCII('Q')
SELECT ASCII('L')

/* O Exemplo a seguir supõe um conjunto de caracteres ASCII e retorna o valor ASCII e o caractere CHAR 
para cada caractere na cadeia de caracteres na frase: "Olá Mundo"*/

DECLARE @Position INT,
		@String CHAR(5);

-- Initialize the Variables.
	SET @Position = 1;
	SET @String = 'Teste';
		WHILE @Position <= DATALENGTH(@String)
			BEGIN 
				SELECT ASCII(SUBSTRING(@String, @Position, 1))cod_ascii,
				CHAR(ASCII(SUBSTRING(@String, @Position, 1)))
				SET @Position = @Position + 1
			END;
