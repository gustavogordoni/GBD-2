/* 
  O conceito de chave-primária é muito importante no contexto de banco de dados relacionais.
  A chave-primária permite identificar uma coluna e somente uma linha da tabela.
  Além disso, a chave-primária ajuda a estabelecer os relacionamentos entre tabelas
*/

CREATE TABLE funcionario (
	codf int,
	nome varchar (40),
	salario real,
	cidade varchar (40),
	horas int,
	--Vamos criar uma restrição/constraint
	CONSTRAINT pk_funcionario PRIMARY KEY (codf) 
);

--Vamos inserir uma linha
INSERT INTO funcionario VALUES (
	1,'Fabiano',2000,'Votuporanga',40	
);

INSERT INTO funcionario VALUES (
	1,'Gabriela',2300,'Jales',20	
);

SELECT * FROM funcionario;
-----------------------------------------------
CREATE TABLE paciente (
	codiPaciente int,
	Nome varchar (40),
	Cidade varchar (40),
	Estado char (2),
	Tratamento varchar (40),
	CONSTRAINT pk_paciente PRIMARY KEY (codiPaciente) 
);

INSERT INTO paciente VALUES (111,'Cláudio Henrique','São Paulo','SP','Cardiovascular');
INSERT INTO paciente VALUES (112,'Maria Helena','Votuporanga','SP','Oftalmologia');
INSERT INTO paciente VALUES (113,'Jorge Silva','Cardoso','SP','Otorrino');
INSERT INTO paciente VALUES (114,'Clara Magalhães','Parisi','SP','Oftamologia');
INSERT INTO paciente VALUES (115,'Pedro Vieira','Votuporanga','SP','Osteopatia');

SELECT * FROM paciente;

-----------------------------------------------

CREATE TABLE Medico (
	codiMedico varchar (10),
	Nome varchar (40),
	Especialidade varchar (40),
	Hospital varchar (40),
	Experiência int,
	
	CONSTRAINT pk_Medico PRIMARY KEY (codiMedico) 
);

INSERT INTO Medico VALUES 
	('Med1','Júlia Batimento', 'Cardiovascular','Boa Saúde',10),
	('Med2','Maria Velonge', 'Oftalmologia','Bom Retiro',15),
	('Med3','Gabriel Curioso', 'Otorrino','Bom Retiro',21),
	('Med4','Ana Veperto', 'Oftalmologia','Boa Saúde',17),
	('Med5','Fábio Quebraoço', 'Osteopatia','Boa Saúde',17),
	('Med6','Augusto Nunes', 'Pediatra','Santa Maria',22);

SELECT * FROM Medico;