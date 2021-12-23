/*
Exemplo de Colunas Geradas:

Exemplo 01)
-> Apenas um exemplo simples de como a função deve ser utilizada. 

*/

USE testes;

CREATE TABLE IF NOT EXISTS tbl_mult(
    num1 SMALLINT NOT NULL,
    num2 SMALLINT NOT NULL,
    num3 SMALLINT GENERATED ALWAYS AS (num1*num2) VIRTUAL
)

show tables;

describe tbl_mult

INSERT INTO tbl_mult (num1, num2)
VALUES (2,1), (27,38), (2,3), (2,59);

SELECT * 
FROM tbl_mult 

--------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
Exemplo 02)
-> Queremos criar essa tabela de modo que o campo Preco_Total seja calculado dinamicamente, 
multiplicando o preço do produto pela quantidade (adquirida), e aplicando um desconto percentual especificado na coluna Desconto ao preço total. 
*/

CREATE TABLE vendas(
    id_venda SMALLINT PRIMARY KEY AUTO_INCREMENT, -- seta a coluna como chave primária da tabela
    preco_produto decimal(6,2) NOT NULL, 
    qtde TINYINT NOT NULL,
    desconto DECIMAL(4,2) NOT NULL,
    -- a coluna preco_total será feira a partir da operação proposta na criação e então aramzenada na memória 
    preco_total DECIMAL(6,2) AS (preco_produto * qtde * (1 - desconto/100)) STORED 
);

INSERT INTO vendas (preco_produto, qtde, desconto)
VALUES 
    (50.00, 2, 20),
    (65.35, 3, 15),
    (100.00, 1, 12),
    (132.00, 3, 18);

SELECT * 
FROM vendas

/*
Resultado:

id_venda	preco_produto	qtde	desconto	preco_total
   1	            50.00	  2	     20.00	       80.00
   2	            65.35	  3	     15.00	      166.64
   3	           100.00	  1	     12.00	       88.00
   4	           132.00	  3	     18.00	      324.72
   
*/
