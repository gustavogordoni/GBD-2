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