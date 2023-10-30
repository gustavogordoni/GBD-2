------------ AULA 10/10 4° BIMESTRE ------------

CREATE TABLE fornecedores(
	idfor 	SERIAL,
	nomef 	VARCHAR(30),
	cidade 	VARCHAR(40),
	estado 	VARCHAR(2),
	CONSTRAINT pk_fornecedor PRIMARY KEY (idfor)
);

-- VAMOS INSERIR ALGUNS VALORES
INSERT INTO fornecedores VALUES
(default, 	'Garitá', 		'Jales', 		'SP'),
(default, 	'Toninhas', 	'Catanduva', 	'SP'),
(default, 	'Villages', 	'Catanduva', 	'SP'),
(default, 	'Collonges', 	'São Paulo', 	'SP'),
(default, 	'Brusk', 		'Curitiba', 	'PR'),
(default, 	'Intercon', 	'Campinas', 	'SP'),
(default, 	'Tekcno', 		'Cascavel', 	'PR');

SELECT * FROM fornecedores;
------------------------------------------------------------------------------------------------------------------------
-- IMAGINE QUE VOCÊ QUEIRA SABER QUANTOS FORNECEDORES SÃO DA CIDADE DE CATANDUVA
-- PARA ISSO NÓS TEMOS UMA FUNÇÃO QUE SOMA O NÚMERO DE OCORRÊNCIA, OU SEJA, O NÚMERO DE REGISTROS
-- NÃO É A SOMA DE UM DETERMINADO VALOR, MAS A SOMA DE REGISTROS.
-- ASSIM, AO OLHARMOS PARA NOSSA TABELA, TEMOS DUAS OCORRÊNCIAS E É ESSA A RESPOSTA QUE O BD DEVE CONCEBER
SELECT COUNT(cidade) AS "Quantidade de fornecedores da cidade de Catanduva" FROM fornecedores WHERE cidade = 'Catanduva';
------------------------------------------------------------------------------------------------------------------------

-- VAMOS CRIAR A TABELA PRODUTOS
CREATE TABLE produtos(
	idprod 	 SERIAL,
	nomeprod VARCHAR(30),
	peso 	 REAL,
	valor 	 REAL,
	ano_fab  DATE,
	ano_val  DATE,
	idfor    INT, 
	CONSTRAINT pk_produtos PRIMARY KEY (idprod),
	CONSTRAINT fk_prod_fornec FOREIGN KEY (idfor) REFERENCES fornecedores(idfor)	
);

-- VAMOS INSERIR ALGUNS VALORES
INSERT INTO produtos VALUES
(default, 'Calmante', 		20, 	45, '2023-03-22', '2024-03-22', 5),
(default, 'Azitromicina', 	100, 	58, '2022-09-30', '2025-05-21', 7),
(default, 'Dipirona',     	100, 	25, '2023-07-18', '2026-07-18', 1);

SELECT * FROM produtos;
------------------------------------------------------------------------------------------------------------------------
-- FUNÇÃO AVG() É UTILIZADA PARA ENCONTRAR A MÉDIA DE VALORES NUMÉRICOS
-- ENTÃO, VAMOS ENCONTRAR A MÉDIA DOS VALORES DAS MEDICAÇÕES.
SELECT AVG(valor) AS "Valor médio de todas as medicações" FROM produtos;

-- O CÓDIGO ORDER BY SERVE PARA ORDENAR CRESCENTE OU DECRESCENTE BASEADO EM UM CAMPO DA TABELA
SELECT * FROM produtos ORDER BY nomeprod ASC;

-- VAMOS COLOCAR EM ORDEM DECRESCENTE
SELECT * FROM produtos ORDER BY nomeprod DESC;

-- O QUE MAIS EU POSSO MOSTRAR EM ORDEM CRESCENTE? O VALOR
SELECT * FROM produtos ORDER BY valor ASC;

-- MAX() ESSA FUNÇÃO É UTILIZADA PARA ENCONTRAR O VALOR MÁXIMO DENTRO DE UM CAMPO, QUE NESSE CASO, DEVE SER UM NUMÉRICO
-- ENTÃO VAMOS ENCONTRAR O MAIOR VALOR
SELECT MAX(valor) AS "Valor máximo de um produto: " FROM produtos;

-- MIN() ESSA FUNÇÃO É UTILIZADA PARA ENCONTRAR O VALOR MÍNIMO DENTRO DE UM CAMPO, QUE NESSE CASO, DEVE SER UM NUMÉRICO
-- ENTÃO VAMOS ENCONTRAR A MENOR DOSE DAS MEDICAÇÕES
SELECT MIN(peso) AS "Menor peso: " FROM produtos;

-- HÁ UMA FUNÇÃO QUE CONSEGUE EXTRAIR DIA/MÊS/ANO DE UM CAMPO DO TIPO DATE
-- EXEMPLO: EXTRACT(day from campoDate)
-- IRÁ EXTRAIR O DIA DA REFERIDFA DATA
-- ENTÃO VAMOS ENCONTRAR QUAIS PRODUTOS POSSUEM DATA DE VALIDADE MENOR QUE 2025
;SELECT * FROM produtos WHERE extract(year from ano_val) < 2025;
------------------------------------------------------------------------------------------------------------------------