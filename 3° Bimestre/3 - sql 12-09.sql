CREATE TABLE funcionario(
	matricula int,
	nome VARCHAR(40),
	data_nascimento date,
	nacionalidade VARCHAR(40),
	sexo VARCHAR(40),
	estado_civil VARCHAR(40),
	rg VARCHAR(40),
	cic VARCHAR(40),
	endereco VARCHAR(40),
	telefone VARCHAR(40),
	data_admissao date,
	
	CONSTRAINT pk_funcionario PRIMARY KEY (matricula)
);

CREATE TABLE cargos(
	id_cargo int,
	cargo VARCHAR(40),
	descricao TEXT,
	
	CONSTRAINT pk_cargo PRIMARY KEY (id_cargo),	
);

CREATE TABLE cargos_funcionario(
	id_cargo int,	
	matricula int,
	data_inicio date,
	data_fim date,
	
	CONSTRAINT pk_cargos_funcionario PRIMARY KEY (id_cargo, matricula),
	CONSTRAINT FK_funcionario FOREIGN KEY (matricula) REFERENCES funcionario(matricula)
	CONSTRAINT FK_cargos FOREIGN KEY (id_cargo) REFERENCES cargos(id_cargo)
);

CREATE TABLE dependentes(
	id_dependente int,
	matricula int,
	nome VARCHAR(40),
	data_nascimento date,
	
	CONSTRAINT pk_dependente PRIMARY KEY (id_dependente),
	CONSTRAINT FK_funcionario FOREIGN KEY (matricula) REFERENCES funcionario(matricula)
);