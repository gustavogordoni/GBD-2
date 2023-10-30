-- Active: 1681045707260@@127.0.0.1@5432@bd24outubro@public
------------ AULA 24/10 4° BIMESTRE ------------

CREATE TABLE aluno(
	matricula 	VARCHAR(50),
	nome 		VARCHAR(50),
	idade 		INT,
	CONSTRAINT pk_aluno PRIMARY KEY (matricula)
);

CREATE TABLE professor(
	cpf 	VARCHAR(14),
	nome 	VARCHAR(50),
	idade 	INT,
	salario	REAL,
	CONSTRAINT pk_professor PRIMARY KEY (cpf)
);

CREATE TABLE disciplina(
	codigo 	INT,
	nome 	VARCHAR(50),
	sala 	VARCHAR(50),
	cpf 	VARCHAR(14),
	CONSTRAINT pk_disciplina PRIMARY KEY (codigo),
	CONSTRAINT fk_prof_disc FOREIGN KEY (cpf) REFERENCES professor(cpf)	
);

CREATE TABLE turma(
	codigo 	INT,
	matricula 	VARCHAR(50),
	CONSTRAINT pk_turma PRIMARY KEY (codigo, matricula),
	CONSTRAINT fk_turma_codigo FOREIGN KEY (codigo) REFERENCES disciplina(codigo),
	CONSTRAINT fk_turma_matricula FOREIGN KEY (matricula) REFERENCES aluno(matricula)	
);

INSERT INTO professor VALUES
('111.111.111-11',	'Gustavo Sanches',	30, 3000),
('222.222.222-22',	'Gustavo Silva',	40, 4000),
('333.333.333-33',	'Júlio Leite',		45, 5000),
('444.444.444-44',	'Cauã Santana',		24, 6000);

INSERT INTO aluno VALUES
('VP01',	'Maria da Silva',	15),
('VP02',	'Flávia Antunes',	16),
('VP03',	'Flávia Silva',		17),
('VP04',	'Júlia Silva',		14),
('VP05',	'Kayky Joia',		15),
('VP06',	'Breno Fim',		16),
('VP07',	'Anna Julia Lopes',	16),
('VP08',	'Isabela Bispo',	20),
('VP09',	'Luis Henrique',	18),
('VP10',	'Maria José',		32),
('VP11',	'José Maria',		35),
('VP12',	'Victor Fábio',		22),
('VP13',	'Vitor Guerreiro',	27),
('VP14',	'Heloiza Geromello',62),
('VP15',	'Ano Luizo',		12);

INSERT INTO disciplina VALUES
(314672,	'Matemática', 	'D06',	'111.111.111-11'),
(314675,	'Inglês', 		'D05',	'111.111.111-11'),
(314674,	'Biologia',	 	'D09',	'333.333.333-33'),
(314680,	'Filosofia', 	'D01',	'222.222.222-22'),
(270534,	'Física', 		'D02',	'444.444.444-44');

INSERT INTO turma VALUES
(314672,	'VP02'),
(314675,	'VP01'),
(314674,	'VP03'),
(314680,	'VP04'),
(270534,	'VP05'),
(314672,	'VP06'),
(314675,	'VP07'),
(314674,	'VP08'),
(314680,	'VP09'),
(270534,	'VP10'),
(314672,	'VP11'),
(314675,	'VP12'),
(314674,	'VP13'),
(314680,	'VP14'),
(270534,	'VP15');

-- a)
SELECT p.nome, d.nome
	FROM professor p INNER JOIN disciplina d
	ON p.cpf = d.cpf  
	WHERE d.nome = 'Matemática';

-- b)
SELECT a.*, d.nome, d.sala
	FROM aluno a INNER JOIN turma t
	ON a.matricula = t.matricula INNER JOIN disciplina d
	ON t.codigo = d.codigo 
	WHERE a.nome = 'Maria da Silva';
	
-- c)
SELECT p.nome, d.nome
	FROM professor p INNER JOIN disciplina d
	ON p.cpf = d.cpf
	WHERE p.nome = 'Júlio Leite';
	
-- d)
SELECT a.nome, d.nome
	FROM aluno a INNER JOIN turma t
	ON a.matricula = t.matricula INNER JOIN disciplina d
	ON t.codigo = d.codigo 
	WHERE d.nome = 'Inglês';
	
-- e)
SELECT p.nome, a.nome, d.nome
	FROM aluno a INNER JOIN turma t
	ON a.matricula = t.matricula INNER JOIN disciplina d
	ON t.codigo = d.codigo INNER JOIN professor p
	ON p.cpf = d.cpf
	WHERE p.nome = 'Gustavo Sanches' AND a.nome = 'Flávia Antunes';
	
-- f)
SELECT p.nome, d.sala
	FROM professor p INNER JOIN disciplina d
	ON p.cpf = d.cpf
	WHERE d.sala = 'D06';
	
-- g)
SELECT COUNT(nome) AS "Professores que têm o nome Gustavo: " FROM professor WHERE nome LIKE '%Gustavo%';

-- h)
SELECT COUNT(nome) AS "Alunos que têm o sobrenome Silva: " FROM aluno WHERE nome LIKE '%Silva%';

-- i)
SELECT MAX(salario) AS "Maior salário dos professores: " FROM professor;

-- j)
SELECT AVG(idade) AS "Média de idade dos alunos da disciplina de biologia: " 
	FROM aluno a INNER JOIN turma t
		ON a.matricula = t.matricula INNER JOIN disciplina d
		ON t.codigo = d.codigo
		WHERE d.nome = 'Biologia';

-- k)
SELECT AVG(salario) AS "Média salarial dos professores: " FROM professor ;

-- l)
SELECT MIN(idade) AS "Menor idade de um aluno: " FROM aluno;