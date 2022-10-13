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
-- SELECT ASCII(SUBSTRING('OLÁ, MNUNDO', 1, 1))
-- LTRIM
-- RETORNA UMA EXPRESSÃO DE CARACTERE DEPOIS DE RESOLVER ESPAÇOS EM BRANCO A ESQUERDA

DECLARE @string_to_trim VARCHAR(60); 
	SET @string_to_trim ='     Cinco espaços no inicio.'; 
	SELECT  'Texto sem espaço:'+LTRIM(@string_to_trim); 
	SELECT  'Texto Com espaço:'+@string_to_trim;

-- STR
-- EXEMPLO RETRONA DADOS DE CARACTERES CONVERTIDOS DE DADOS NUMÉRICOS
SELECT  STR(123.45, 6, 1);

-- PROVA DE CONVERSÃO DE CARACTERE PARA NUMERIC
SELECT 'Teste '+STR(123.45, 6, 1);

-- QUANDO A EXPRESSÃO EXCEDE O COMPRIMENTO ESPECIFICADO, A CADEIA DE CARACTERES RETORNA ** PARA O COMPRIMENTO ESPECIFICADO.
SELECT STR(123.45, 2, 2);

-- CONCAT
-- RETORNA UMA CADEIA DE CARACTERES QUE É O RESULTADO DA CONCATENAÇÃO DE DOIS OU MAIS VALORES.
SELECT CURRENT_USER

-- EXEMPLO FUNÇÕES DE DATA.
SELECT GETDATE() -- Retorna a Data atual completa
SELECT DAY(getdate()) -- Retorna o dia atual
SELECT MONTH(getdate()) -- Retorna o mês atual
SELECT YEAR(getdate()) -- Retorna o ano atual

SELECT  CONCAT(CURRENT_USER, 
               ' Seu Saldo é R$', 
			   11.00, 
			   ' em ',
               day(getdate()),'/',
			   month(getdate()),'/',
			   year(getdate())) AS Resultado