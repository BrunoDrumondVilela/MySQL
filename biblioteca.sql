-- Seta o BD que será utilizado adiante

USE biblioteca;

-- Cria uma tabela com os metadados dos livros que serão acrescentados posteriormente

create table IF NOT EXISTS tbl_livro(
    ID_livro SMALLINT AUTO_INCREMENT PRIMARY KEY,
    nome_livro VARCHAR(255) NOT NULL,
    ISBN13 CHAR(13),
    ISBN10 CHAR(10),
    ID_categoria SMALLINT,
    ID_autor SMALLINT NOT NULL,
    data_pub DATE NOT NULL,
    preco_livro DECIMAL(6,2) NOT NULL
);

-- Cria uma tabela com os metadados dos autores dos livros

CREATE TABLE IF NOT EXISTS tbl_autores(
    ID_autor SMALLINT PRIMARY KEY,
    nome_autor VARCHAR(255) NOT NULL,
    sobrenome_autor VARCHAR(255) NOT NULL
);

-- Cria uma tabela com os metadados das categorias dos livros

CREATE TABLE tbl_categorias (
    ID_Categoria SMALLINT PRIMARY KEY,
    Categoria VARCHAR(30) NOT NULL
);

-- Cria uma tabela com os metadados das editoras dos livros

CREATE TABLE IF NOT EXISTS tbl_editoras(
    ID_editora SMALLINT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(255) NOT NULL
);





-- Dropa coluna do id do autor apenas para mostrar os passos para criar uma coluna com ALTER TABLE:

ALTER TABLE tbl_livro
DROP COLUMN ID_autor;

-- Cria uma coluna de ID com a função ALTER TABLE:

ALTER TABLE tbl_livro
ADD ID_autor SMALLINT NOT NULL

-- Faz a conexão entre as tabelas tbl_livro e tbl_autores por meio da chave estrangeira 'ID_autor':

ALTER TABLE tbl_livro
ADD CONSTRAINT fk_ID_autor -- Adiciona uma restrição à criação de uma coluna
FOREIGN KEY (ID_autor) -- Explicita a coluna que será a chave estrangeira
REFERENCES tbl_autores (ID_autor) -- Esplicita a tabela que possui a coluna-chave 
ON DELETE CASCADE -- 'seta' a opção de conexão em cascata para deleção, onde caso um registro seja deletado, o que estiver ligado a ele também será
ON UPDATE CASCADE -- 'seta' a opção de conexão em cascata para alteração, onde caso um registro seja alterado, o que estiver ligado a ele também será

DESCRIBE tbl_livro -- Visaulização dos campos e sua tipagem presentes na tabela 'tbl_livro'

-- Cria uma coluna de ID das editoras para posterior conexão com a tabela das editoras:

ALTER TABLE tbl_livro
ADD ID_editora SMALLINT NOT NULL

-- Estabele uma conexão entre as tabelas tbl_livro e tbl_editoras por meio da chave estrangeira 'ID_editora':

ALTER TABLE tbl_livro
ADD CONSTRAINT fk_ID_editora
FOREIGN KEY (ID_editora)
REFERENCES tbl_editoras (ID_editora)
ON DELETE CASCADE
ON UPDATE CASCADE

-- Estabelece uma conexão entre as tabelas tbl_livro e tbl_categorias por meio da chave estrangeira 'ID_Categoria':

ALTER TABLE tbl_livro
ADD CONSTRAINT fk_ID_categoria
FOREIGN KEY (ID_Categoria)
REFERENCES tbl_categorias (ID_Categoria)
ON DELETE CASCADE
ON UPDATE CASCADE

-- Modifica o tipo de dados da coluna ID_autor: 

ALTER TABLE tbl_livro
MODIFY COLUMN ID_autor SMALLINT

-- Inserindo alguns dados no banco de dados biblioteca, na tabela de editoras:

INSERT INTO tbl_editoras (nome_editora)
VALUES ('Prentice Hall'), ("O'Reilly"), ("Microsoft Press"), ("Wiley");

-- Inserindo dados na tabela de autores:

INSERT INTO tbl_autores
VALUES 
    (1, 'Daniel', 'Barret'),
    (2, 'Gerald', 'Carter'),
    (3, 'Mark', 'Sobell'),
    (4, 'William', 'Stanek'),
    (5, 'Richard', 'Blum'),
    (6, 'Jostein', 'Gaarder'),
    (7, 'Umberto', 'Eco'),
    (8, 'Neil', 'De Gasse Tyson'),
    (9, 'Stephen', 'Hawking'),
    (10, 'Stephen', 'Jay Gould'),
    (11, 'Charles', 'Darwin'),
    (12, 'Alan', 'Turing'),
    (13, 'Simon', 'Monk'),
    (14, 'Paul', 'Scherz');

-- Inserindo dados na tabela de categorias:

INSERT INTO tbl_categorias
VALUES
    (1, 'Tecnologia'),
    (2, 'História'),
    (3, 'Literatura'),
    (4, 'Astronomia'),
    (5, 'Botânica')

-- Inserindo dados na tabela de livros:

INSERT INTO tbl_livro (nome_livro, ISBN13, ISBN10, data_pub, preco_livro, ID_categoria, ID_autor, ID_editora)
VALUES
    ('Linux Command Line and Shell Scripting', '9781118983843', '111898384X', '20150109', 68.35, 1, 5, 4),
    ('SSH, the Secure Shell', '9780596008956', '0596008953', '20050517', 58.30, 1, 1, 2),
    ('Using Samba', '9780596002565', '0596002564', '20031221', 61.45, 1, 2, 2),
    ('Fedora and Red Hat Linux', '9780133477436', '0133477436', '20140110', 62.24, 1, 3, 1),
    ('Windows Server 2012 Inside Out', '9780735666313', '0735666318', '20130125', 66.80, 1, 4, 3),
    ('Microsoft Exchange Server 2010', '9780735640610', '0735640610', '20101201', 45.30, 1, 4, 3),
    ('Practical Eletronics for Inventors', '9781259587542', '1259587541', '20160324', 67.80, 1, 13, 5)

-- Seleção em ordem alfabética tendo como basse a coluna "nome_livro" 

SELECT * 
FROM tbl_livro
ORDER BY nome_livro 

-- Consultar os valores aceitos numa determinada coluna

SHOW COLUMNS
FROM tbl_livro
LIKE 'ID_livro'

-- célula teste

