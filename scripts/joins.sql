use curso
--drop table alunos
--CRIACAO DE TABELA ALUNOS
create table alunos
(id_aluno int identity(1,1),
 nome varchar(20) not null
 )
 --drop table disciplina
create table disciplina
(
 id_disciplina int identity(1,1),
 nome_disc varchar(20)
 )
 --drop table matricula
 create table matricula
 (id_aluno int,
  id_disciplina int,
  periodo varchar(10)
  )

  --ALTERANDO TABELA CAMPO ID_ALUNO PARA NAO PERMITIR NOT NULL
  ALTER TABLE MATRICULA ALTER COLUMN id_aluno INT NOT NULL
  --ALTERANDO TABELA 
  ALTER TABLE MATRICULA ALTER COLUMN id_disciplina INT NOT NULL

  --CRIANDO CHAVE PRIMARIA COMPOSTA
  ALTER TABLE MATRICULA ADD CONSTRAINT PK_1 PRIMARY KEY (ID_ALUNO,id_disciplina)
 --ADICIONANDO CHAVE PRIMARIA TABELA DISCIPLINA
  ALTER TABLE DISCIPLINA ADD CONSTRAINT PK2 PRIMARY KEY (id_disciplina)
  --ADICIONANDO CHAVE PRIMARIA TABELA ALUNOS
  ALTER TABLE ALUNOS ADD CONSTRAINT PK1 PRIMARY KEY (ID_ALUNO)
  
  --ADICIONANDO CHAVE ESTRANGEIRA NA TABELA MATRICULA CAMPO ID_ALUNO
  ALTER TABLE MATRICULA 
  ADD CONSTRAINT FK_MAT1 FOREIGN KEY  (ID_ALUNO) REFERENCES ALUNOS(ID_ALUNO)

  --ADICIONANDO CHAVE ESTRANGEIRA NA TABELA MATRICULA CAMPO ID_ALUNO
  ALTER TABLE MATRICULA 
  ADD CONSTRAINT FK_MAT2 FOREIGN KEY  (id_disciplina) REFERENCES DISCIPLINA(id_disciplina)


  

  
  --INSERINDO REGISTRO ALUNOS
  insert into alunos values ('Joao'),('Maria'),('Pedro'),('Tiago'),('Henrique')

  SELECT * FROM alunos

  --INSERINDO REGISTRO DISCIPLINAS
  insert into disciplina values 
  ('Fisica'),('Quimica'),('Matematica'),('Banco de Dados'),('Programacao')

  SELECT * FROM disciplina

  --INSERINDO MATRICULAS DE ALUNOS
  insert into matricula values ('1','1','Noturno')
  insert into matricula values ('1','2','Vespertino')
  insert into matricula values ('1','3','Matutino')

  insert into matricula values ('2','3','Noturno')
  insert into matricula values ('2','4','Noturno')

  insert into matricula values ('3','1','Noturno')
  insert into matricula values ('3','3','Noturno')
  insert into matricula values ('3','4','Noturno')

  insert into matricula values ('5','1','Matutino')
  insert into matricula values ('5','2','Vespertino')
  insert into matricula values ('5','4','Noturno')


  --ALUNO CODIG 4 NAO TEM MATRICULA
  --DISCIPLINA 5 NAO TEM ALUNOS

  --INNER JOIN

  select a.nome,c.nome_disc,b.periodo
  from alunos a
  inner join matricula b 
  on a.id_aluno=b.id_aluno
  inner join disciplina c
  on b.id_disciplina=c.id_disciplina

  --LEFT JOIN

  select a.nome,c.nome_disc,b.periodo
  from alunos a
  left join matricula b 
  on a.id_aluno=b.id_aluno
  left join disciplina c
  on b.id_disciplina=c.id_disciplina
  

 --RIGHT JOIN
  select a.nome,c.nome_disc,b.periodo
  from alunos a
  right join matricula b 
  on a.id_aluno=b.id_aluno
  right join disciplina c
  on b.id_disciplina=c.id_disciplina

  --FULL JOIN
  select a.nome,c.nome_disc,b.periodo
  from alunos a
  full join matricula b 
  on a.id_aluno=b.id_aluno
  full join disciplina c
  on b.id_disciplina=c.id_disciplina

--INNER JOIN

SELECT orders.orderid, 
       customers.CompanyName 
FROM   orders 
       INNER JOIN customers 
       ON orders.customerid = customers.customerid; 

--INNER JOIN
SELECT orders.orderid, 
       customers.CompanyName, 
       shippers.CompanyName 
FROM   orders 
         INNER JOIN customers 
                 ON orders.customerid = customers.customerid 
        INNER JOIN shippers 
                ON orders.shipvia = shippers.shipperid; 


--LEFT JOIN
SELECT customers.CompanyName, 
       orders.orderid 
FROM   customers 
       LEFT JOIN orders 
              ON customers.customerid = orders.customerid 
ORDER  BY customers.CompanyName; 

--Rigth Join
SELECT orders.orderid, 
       employees.lastname, 
       employees.firstname 
FROM   orders 
       RIGHT JOIN employees 
               ON orders.employeeid = employees.employeeid 
ORDER  BY orders.orderid; 

--FULL JOIN
SELECT customers.CompanyName, 
       orders.orderid 
FROM   customers 
       FULL OUTER JOIN orders 
                    ON customers.customerid = orders.customerid 
ORDER  BY customers.CompanyName; 

