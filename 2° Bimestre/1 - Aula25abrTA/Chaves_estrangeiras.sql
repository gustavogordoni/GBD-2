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