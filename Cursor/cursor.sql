CREATE DATABASE cursores
GO 
USE cursores
GO
CREATE TABLE curso (
codigo INT NOT NULL,
nome VARCHAR(200) NOT NULL,
duracao INT NOT NULL
PRIMARY KEY(codigo)
)
GO
CREATE TABLE disciplina (
codigo CHAR(7) NOT NULL,
nome VARCHAR(200) NOT NULL,
carga_horaria INT NOT NULL
PRIMARY KEY(codigo)
)
GO
CREATE TABLE disciplina_curso (
codigo_disciplina CHAR(7) NOT NULL,
codigo_curso INT NOT NULL
PRIMARY KEY(codigo_disciplina, codigo_curso),
FOREIGN KEY(codigo_disciplina) REFERENCES disciplina (codigo),
FOREIGN KEY(codigo_curso) REFERENCES curso (codigo)
)

SELECT * FROM curso
SELECT * FROM disciplina
SELECT * FROM disciplina_curso

CREATE FUNCTION fn_cursor (@codigo_curso INT)
RETURNS @tabela TABLE
(
@codigo_disciplina CHAR(7),
@nome_disciplina VARCHAR(200),
@carga_horaria_disciplina INT,
@nome_curso VARCHAR(200)
)
AS
BEGIN
DECLARE
@codigo_disciplina CHAR(7),
@nome_disciplina VARCHAR(200),
@carga_horaria_disciplina INT,
@nome_curso VARCHAR(200)

DECLARE C CURSOR FOR SELECT d.codigo, d.nome, d.carga_horaria, c.nome FROM curso c, disciplina d, disciplina_curso dc
WHERE c.codigo = dc.codigo_curso
AND d.codigo = dc.codigo_disciplina
AND c.codigo = @codigo_curso

OPEN C
FETCH NEXT FROM C INTO @codigo_disciplina, @nome_disciplina, @carga_horaria_disciplina, @nome_curso
WHILE @@FETCH_STATUS = 0
BEGIN
--programação
END
FETCH NEXT FROM c INTO @codigo_disciplina, @nome_disciplina, @carga_horaria_disciplina, @nome_curso
	CLOSE C
	DEALLOCATE C
	RETURN
END



























