CREATE TABLE fornecedores (
	codfor int,
	fornecedor varchar (40),
		
	CONSTRAINT PK_fornecedores PRIMARY KEY (codfor)
);

INSERT INTO fornecedores VALUES
	(200, 'Bomdipreço'),
	(201, 'Temditudo'),
	(203, 'Sodubom'),
	(204, 'Fhrescou'),
	(205, 'Darozza');
	
SELECT * FROM fornecedores;
	
--------------------------------------------------------------------------------

CREATE TABLE categorias (
	codcat int,
	descricao varchar (40),
	codfor int,
	
	CONSTRAINT PK_categorias PRIMARY KEY (codcat),
		CONSTRAINT fk_categorias_fornecedores foreign key (codfor)
		references fornecedores (codfor)
);

INSERT INTO categorias VALUES
	(101, 'Cereal', 204),
	(102, 'Refrigerante', 200),
	(103, 'Doces', 203),
	(104, 'Cosméticos', 201),
	(105, 'Higiene', 201),
	(106, 'Frutas', 205);
	
SELECT * FROM categorias;

--------------------------------------------------------------------------------	

CREATE TABLE produtos (
	codprod int,
	nomeprod varchar (40),
	preco real,
	codcat int,
	
	CONSTRAINT PK_produtos PRIMARY KEY (codprod),
	
	CONSTRAINT fk_categorias_produtos foreign key (codcat)
		references categorias (codcat)

);

INSERT INTO produtos VALUES
	(1, 'Feijão Tia Maria', 14.00, 101),
	(2,'Arroz Solthim',9.00, 101),
	(3,'Coca-Cola',7.00, 102), 
	(4,'Shampo Jubba',19.55, 104), 
	(5,'Bolacha Dabboa',8.70, 103), 
	(6,'Bombom Dobhom',15.00, 103), 
	(7,'Sabonete Xerobom',3.99, 104), 
	(8,'Desinfetante',5.00, 105), 
	(9,'Banana',3.00, 106), 
	(10,'Coco da Bahia',6.50, 106);

SELECT * FROM produtos;    

--------------------------------------------------------------------------------

-- 4)
SELECT nomeprod, preco FROM produtos;

--------------------------------------------------------------------------------
-- 5)
-- a)
SELECT p.nomeprod, p.preco,f.fornecedor
	FROM produtos p INNER JOIN categorias c
	ON p.codcat = c.codcat
	INNER JOIN fornecedores f
	ON f.codfor = c.codfor
	WHERE p.nomeprod = 'Arroz Solthim';

-- b)
SELECT p.nomeprod, p.preco, c.descricao
	FROM produtos p INNER JOIN categorias c
	ON p.codcat = c.codcat
	WHERE p.nomeprod = 'Feijão Tio João';

-- c) 
SELECT p.nomeprod, p.preco
	FROM produtos p 
	WHERE p.preco > 3
    ORDER BY p.preco;

-- d) 
SELECT p.nomeprod, p.preco, c.descricao
	FROM produtos p INNER JOIN categorias c
	ON p.codcat = c.codcat
	WHERE p.preco < 5;  

-- e)
SELECT p.nomeprod, c.descricao, p.preco
	FROM produtos p INNER JOIN categorias c
	ON p.codcat = c.codcat
	WHERE p.nomeprod = 'Bombom Dobhom';  

-- f)
SELECT f.fornecedor
    FROM fornecedores f INNER JOIN categorias c 
    ON f.codfor = c.codfor INNER JOIN produtos p 
    ON c.codcat = p.codcat
    GROUP BY f.fornecedor
    HAVING count(DISTINCT p.codprod) > 1;

-- g)
SELECT p.nomeprod, c.descricao
	FROM produtos p INNER JOIN categorias c
	ON p.codcat = c.codcat
	WHERE p.nomeprod = 'Coca-Cola';  

-- h)
SELECT c.descricao
    FROM categorias c
    GROUP BY descricao;

-- i)
SELECT p.nomeprod, f.codfor, f.fornecedor
    FROM produtos p
    INNER JOIN categorias c ON p.codcat = c.codcat
    INNER JOIN fornecedores f ON c.codfor = f.codfor
    WHERE p.nomeprod = 'Coco da Bahia';

-- j)
SELECT SUM(preco) 
    AS "Total"
    FROM produtos;

-- k)    
SELECT p.nomeprod, f.fornecedor
    FROM produtos p
    INNER JOIN categorias c 
    ON p.codcat = c.codcat
    INNER JOIN fornecedores f ON c.codfor = f.codfor
    WHERE p.nomeprod = 'Batata';

-- l)  
SELECT p.nomeprod, f.fornecedor
    FROM produtos p
    INNER JOIN categorias c ON p.codcat = c.codcat
    INNER JOIN fornecedores f ON c.codfor = f.codfor
    WHERE p.nomeprod = 'Sabonete Xerobom';

-- m)    
SELECT f.fornecedor, p.nomeprod, p.preco
    FROM produtos p
    INNER JOIN categorias c ON p.codcat = c.codcat
    INNER JOIN fornecedores f ON c.codfor = f.codfor
    WHERE f.fornecedor = 'Fhrescou';