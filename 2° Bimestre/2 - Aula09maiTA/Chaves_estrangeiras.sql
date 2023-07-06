CREATE TABLE marcas (
	CodigoM int,
	NomeM varchar (30),
	PaisOrigem varchar (30),
	
	CONSTRAINT PK_marcas PRIMARY KEY (CodigoM)
);

INSERT INTO marcas VALUES
	(1012 ,'Volkswagem','Brasil'),
	(1013 ,'Fiat','Brasil'),
	(1014 ,'Audi','Alemanha'),
	(1015 ,'Chevrolet','Brasil'),
	(1016 ,'Chevrolet','USA');

SELECT * FROM marcas;
--------------------------------------------------------------------------------	
CREATE TABLE Modelos (
	CodigoMo int,
	NomeMo varchar (40),
	TipoMo varchar (40),
	CorMo varchar (40),
	CodigoM int,
	
	CONSTRAINT PK_Modelos PRIMARY KEY (CodigoMo)
);

INSERT INTO Modelos VALUES
	(101,'Gol','GT','Cinza', 1012),
	(102,'Pálio','XS','Preto', 1013),
	(103,'Zafira','GLS','Verde', 1015),
	(104,'Linea','GL','Cinza', 1013),
	(105,'A3','GT','Preto', 1014),
	(106,'Polo','GL','Cinza', 1012),	
	(107,'Taurus','XLS','Preto', 1016);
	
SELECT * FROM Modelos;
--------------------------------------------------------------------------------
--- Modelos com Cor = 'Verde'
SELECT marcas.nomem, modelos.cormo FROM marcas, modelos
	WHERE Modelos.cormo = 'Verde' AND Modelos.codigom = marcas.codigom;
--------------------------------------------------------------------------------	
--- Vamos apagar a tabela Modelos e criar novamente com chave estrangeira
DROP TABLE modelos;

CREATE TABLE Modelos (
	CodigoMo int,
	NomeMo varchar (40),
	TipoMo varchar (40),
	CorMo varchar (40),
	CodigoM int,
	
	CONSTRAINT pk_modelos PRIMARY KEY (codigomo),
	
	CONSTRAINT fk_marcas_modelos foreign key (codigom) 
		references marcas(codigom)
);

INSERT INTO Modelos VALUES
	(101,'Gol','GT','Cinza', 1012),
	(102,'Pálio','XS','Preto', 1013),
	(103,'Zafira','GLS','Verde', 1015),
	(104,'Linea','GL','Cinza', 1013),
	(105,'A3','GT','Preto', 1014),
	(106,'Polo','GL','Cinza', 1012),	
	(107,'Taurus','XLS','Preto', 1016);

SELECT * FROM Modelos;
--------------------------------------------------------------------------------
-- 09-05-2023
-- FK: Garantir a integridade dos dados entre as tabelas relacionadas;

-- PERGUNTAS DA PROVA 1° BIMESTRE

-- 1) Qual o nome da marca do carro Zafira?
SELECT marcas.nomem, modelos.nomemo
	FROM marcas INNER JOIN modelos 
	ON marcas.codigom = modelos.codigom
	WHERE modelos.nomemo = 'Zafira';

-- 2) Qual o país fabrica o carro A3?
SELECT marcas.paisorigem, modelos.nomemo
	FROM marcas INNER JOIN modelos
	ON marcas.codigom = modelos.codigom
	WHERE nomemo = 'A3';

-- 3) Qual a cor do carro que tem o tipo de modelo XS? Qual é a marca dele?
SELECT modelos.CorMo, modelos.tipomo, marcas.NomeM
	FROM marcas INNER JOIN modelos
	ON marcas.codigom = modelos.codigom
	WHERE tipomo = 'XS';

-- 4) Qual o nome do modelo e o nome da marca dos carros de cor preta?
SELECT modelos.cormo, modelos.nomemo, marcas.nomem
	FROM marcas INNER JOIN modelos
	ON marcas.codigom = modelos.codigom
	WHERE cormo = 'Preto';
	
-- 5) Quaia os carros que a Chevrole do Brasil fabrica?
SELECT marcas.nomem, marcas.paisorigem, modelos.nomemo
	FROM marcas INNER JOIN modelos
	ON marcas.codigom = modelos.codigom
	WHERE marcas.nomem = 'Chevrolet' AND marcas.paisorigem = 'Brasil';

-- A FUNÇÃO COUNT () É UTILIZADA PARA CONTAR AS OCORRÊNCIAS DENTRO DE UM SELECT
-- ELE NÃO MOSTRA RESPOSTAS, MAS QUANTAS LINHAS FORAM ENCONTRADAS
-- SEU USO: cont(NomeDoCampo)

-- 6) Vamos ver quantos carros possuem a cor preta
SELECT count(modelos.nomemo)
	AS "Quantidade de carros pretos: "
	FROM modelos
	WHERE modelos.cormo = 'Preto';

--Quantos carros são produzidos pela VolksWagen. Utilize count()

SELECT COUNT(modelos.nomemo) as "Quantidade de carros produzidos pela VolskWagen"
	FROM marcas inner join modelos
	ON marcas.codigom=modelos.codigom
	WHERE marcas.nomem='VolksWagen';