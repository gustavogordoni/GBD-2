------------ AULA 31/10 4° BIMESTRE ------------

CREATE TABLE biblioteca(
	codigo SERIAL,
	descricao TEXT,
	endereco VARCHAR(50),
	CONSTRAINT pk_biblioteca PRIMARY KEY (codigo)
);
select * from biblioteca;
------------------------------------------------
CREATE TABLE associado(
	matricula SERIAL,
	nome VARCHAR(50),
	sexo VARCHAR(50),
	CONSTRAINT pk_associado PRIMARY KEY (matricula)
);
select * from associado;
------------------------------------------------
CREATE TABLE autor(
	codigo SERIAL,
	nome VARCHAR(50),
	CONSTRAINT pk_autor PRIMARY KEY (codigo)
);
select * from autor;
------------------------------------------------
CREATE TABLE assunto(
	codigo SERIAL,
	descricao TEXT,
	CONSTRAINT pk_assunto PRIMARY KEY (codigo)
);
select * from assunto;
------------------------------------------------
CREATE TABLE livro(
	isbn SERIAL,
	titulo VARCHAR(50),
	codigo SERIAL,
	matricula SERIAL,
	CONSTRAINT pk_livro PRIMARY KEY (isbn),
	CONSTRAINT fk_livro_biblioteca FOREIGN KEY (codigo) REFERENCES biblioteca(codigo),
	CONSTRAINT fk_livro_associado FOREIGN KEY (matricula) REFERENCES associado(matricula)
);
select * from livro;
------------------------------------------------
CREATE TABLE cadastro(
	codigo SERIAL,
	matricula SERIAL,
	CONSTRAINT pk_cadastro PRIMARY KEY (codigo, matricula),
	CONSTRAINT fk_cadastro_biblioteca FOREIGN KEY (codigo) REFERENCES biblioteca(codigo),
	CONSTRAINT fk_cadastro_associado FOREIGN KEY (matricula) REFERENCES associado(matricula)
);
select * from cadastro;
------------------------------------------------
CREATE TABLE aborda(
	codigo SERIAL,
	isbn SERIAL,
	CONSTRAINT pk_aborda PRIMARY KEY (codigo, isbn),
	CONSTRAINT fk_aborda_assunto FOREIGN KEY (codigo) REFERENCES assunto(codigo),
	CONSTRAINT fk_aborda_livro FOREIGN KEY (isbn) REFERENCES livro(isbn)
);
CREATE TABLE escreve(
	codigo SERIAL,
	isbn SERIAL,
	CONSTRAINT pk_escreve PRIMARY KEY (codigo, isbn),
	CONSTRAINT fk_escreve_autor FOREIGN KEY (codigo) REFERENCES autor(codigo),
	CONSTRAINT fk_escreve_livro FOREIGN KEY (isbn) REFERENCES livro(isbn)
);