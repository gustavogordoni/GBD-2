/* Vamos a nossa primeira tabela CLIENTE */

CREATE TABLE cliente (
	codcli int, 
	nome varchar(40),
	endereco varchar(40),
	cidade varchar (25),
	estado char (2)
);
select * from cliente;

INSERT INTO cliente VALUES(
	1,'Ana','Rua Sergipe, 3355','Votuporanga','SP'
);