-- Criação da tabela Alunos --
CREATE TABLE Alunos (
  matricula INT,
  nome VARCHAR(50),
  rua VARCHAR(100),
  bairro VARCHAR(50),
  cidade VARCHAR(50),
  cep VARCHAR(10),
  telefone VARCHAR(15),
	
  CONSTRAINT PK_alunos PRIMARY KEY (matricula)
);

-- Inserção de 10 alunos na tabela Alunos
INSERT INTO Alunos (matricula, nome, rua, bairro, cidade, cep, telefone)
VALUES
  (1, 'João Silva', 'Rua A', 'Centro', 'Cidade A', '12345-678', '111111111'),
  (2, 'Maria Santos', 'Rua B', 'Bairro X', 'Cidade B', '98765-432', '222222222'),
  (3, 'Pedro Souza', 'Rua C', 'Bairro Y', 'Cidade C', '54321-876', '333333333'),
  (4, 'Ana Oliveira', 'Rua D', 'Centro', 'Cidade A', '67890-123', '444444444'),
  (5, 'Lucas Mendes', 'Rua E', 'Bairro Z', 'Cidade D', '23456-789', '555555555'),
  (6, 'Fernanda Costa', 'Rua F', 'Centro', 'Cidade A', '87654-321', '666666666'),
  (7, 'Rafaela Almeida', 'Rua G', 'Bairro X', 'Cidade B', '34567-890', '777777777'),
  (8, 'Mateus Santos', 'Rua H', 'Bairro Y', 'Cidade C', '09876-543', '888888888'),
  (9, 'Paula Fernandes', 'Rua I', 'Centro', 'Cidade A', '76543-210', '999999999'),
  (10, 'Marcos Lima', 'Rua J', 'Bairro Z', 'Cidade D', '21098-765', '000000000');

-- Criação da tabela Alunos da Banda
CREATE TABLE banda (
  id_alunos_banda INT,
  id_instrumento INT,
  matricula INT,
  instrumento VARCHAR(50),
  data_ingresso DATE,
	
  CONSTRAINT PK_banda PRIMARY KEY (id_alunos_banda),
  CONSTRAINT FK_banda_alunos FOREIGN KEY (matricula) REFERENCES Alunos(matricula),
  CONSTRAINT FK_banda_instrumento FOREIGN KEY (id_instrumento) REFERENCES Instrumento (id_instrumento)
);

-- Inserção de 9 alunos matriculados na tabela Alunos da Banda
INSERT INTO banda VALUES
  (111, 1, 1, 'Violão', '2022-01-01'),
  (222, 4, 2,'Guitarra', '2021-05-10'),
  (333, 3, 3,'Bateria', '2020-09-15'),
  (444, null, 4,'Baixo', '2022-03-20'),
  (555, null, 5,'Teclado', '2021-07-05'),
  (666, 2, 6,'Violino', '2023-02-12'),
  (777, null, 7,'Saxofone', '2020-12-03'),
  (888, null, 8,'Trompete', '2022-06-18'),
  (999, null, 9,'Flauta', '2021-10-25');
  
  drop table banda;

-- Criação da tabela Instrumento
CREATE TABLE Instrumento (
  id_instrumento INT,
  nome VARCHAR(50),
	
  CONSTRAINT PK_instrumentos PRIMARY KEY (id_instrumento)
);

-- Inserção dos 5 instrumentos na tabela Instrumento
INSERT INTO Instrumento VALUES
  (1,'Violão'),
  (2,'Violino'),
  (3,'Bateria'),
  (4,'Guitarra'),
  (5,'Piano');
   
  
-- 4)
-- a) Quais são os nomes alunos que moram no bairro x e tocam baixo na banda?
SELECT a.nome, b.instrumento
	FROM Alunos a INNER JOIN banda b
	ON a.matricula = b.matricula
	WHERE a.bairro = 'Centro' AND b.instrumento = 'Baixo';
	
-- b) Qual são os nomes dos alunos matriculados na banda que tocam guitarra?
SELECT a.nome, b.instrumento, b.id_instrumento, i.nome
	FROM Alunos a INNER JOIN banda b
	ON a.matricula = b.matricula  INNER JOIN Instrumento i
	ON b.id_instrumento = i.id_instrumento
	WHERE b.instrumento = 'Guitarra';

-- c) Qual é o instrumento que o aluno João Silva toca na banda?
SELECT a.nome, i.nome
	FROM Alunos a INNER JOIN banda b
	ON a.matricula = b.matricula INNER JOIN Instrumento i
	ON b.id_instrumento = i.id_instrumento
	WHERE a.nome = 'João Silva';		

-- d) Qual o número de telefone do Aluno Mateus Santos?
SELECT nome, telefone
FROM Alunos 
WHERE nome = 'Mateus Santos';
	








  

