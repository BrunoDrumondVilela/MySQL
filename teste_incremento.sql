-- Cria tabela-teste para visualização da função de auto incremento

CREATE TABLE IF NOT EXISTS teste_incremento(
    codigo SMALLINT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
) AUTO_INCREMENT = 15;

-- Insere os valores na coluna 'nome' da tabela:

INSERT INTO teste_incremento (Nome) 
VALUE ('Luana');

-- Visualização do valor mínimo da coluna 'codigo' da tabela:

SELECT MIN(codigo)
FROM teste_incremento;

-- Visualização do valor máximo da coluna 'codigo' da tabela:

SELECT MAX(codigo)
FROM teste_incremento

-- Altera o próximo valor que será atribuído à coluna 'codigo' quando for inserido o próximo valor na coluna 'nome':

ALTER TABLE teste_incremento AUTO_INCREMENT = 50

-- Insere valores na coluna 'nome':

INSERT INTO teste_incremento(nome) 
VALUE ('Jupira'), ('Isebala')

-- Deleta a linha cujo código seja igual ao detewrminado:

DELETE 
FROM teste_incremento
WHERE codigo = '52'

-- Visualização final da tabela:

SELECT * 
FROM teste_incremento