--funcao para receber duas data e retornar intervalo de acordo com parametro.
Create FUNCTION dbo.func_dias(@dia INT,@dti DATETIME,@dtf DATETIME) 
	returns @tbl TABLE(dt DATETIME) 
	AS   
	BEGIN       
		WHILE @dti <= @dtf         
			BEGIN             
				INSERT INTO @tbl  (dt) VALUES (@dti)            
				SET @dti = Dateadd(day, @dia, @dti)         
			End
			Return
	end

--invocando funcao dias
	SELECT * FROM   dbo.func_dias(3,getdate(),getdate()+12) 

--Criando fun  o escalar Soma
--drop function Soma
CREATE FUNCTION Soma(@num1 INT,@num2 INT)  
	returns INT    
	BEGIN        
		DECLARE @res INT         
		SET @res=@num1 + @num2         
		RETURN ( @res )    
	END
	

--Invocando fun  o escalar Soma

SELECT '>>>' , DBO.SOMA(1,3)

--drop table #testesoma
--create table #testesoma
 (val1 int,
  val2 int
  )
  --inserindo valores
  insert into #testesoma values (10,2),(5,4),(89,3)

  --invocando funcao soma 
  select val1,
         val2,
         dbo.soma(val1,val2)
   from #testesoma

--Criando fun  o escalar TRIM
--drop function Trim
CREATE FUNCTION Trim(@ST VARCHAR(1000)) 
 returns VARCHAR(1000)  
  BEGIN      
	RETURN(Ltrim(Rtrim(@ST)))   
  END

--Invocando fun  o escalar TRIM
SELECT '>' + ('Silva Telles')+'<'
union
SELECT '>' + DBO.TRIM('Silva Telles')+'<'
