Curso MySQL:

**SGBDR >>**

<u>Definição:</u> Um Sistema Gerenciador de Bancos de Dados Relacional trata-se de um sistema de gerenciamento de bancos de dados baseado no modelo relacional introduzido por E.F.Codd.

<u>Composição de um Banco de Dados:</u> 

- Tabelas
- Campos (Colunas)
- Registros (Linhas)

**Tabelas**: Objetos onde são armazenados os dados num banco de dados relacional. Uma tabela é uma coleção de entradas de dados relacionados e consiste em linhas e colunas.

**Campos**: Entidades que representam os atributos dos dados, como nome, data de nascimento, salário. etc

**Registros**: Linhas ou Tuplas. Cada entrada individual em uma tabela. trata-se de um conjunto de campos relacionados que caracterizam os dados de uma entidade única.



**Grupos de Comandos SQL >>**

<u>DDL - Data Definition Language:</u>

Comandos que possuem a função de definir a estrutura do banco de dados (esquema). Permitem efetuar a criação, alteração e exclusão de objetos.

Comandos >

CREATE - Cria um novo BD, tabela, visão, índice ou outro objeto,

ALTER - Altera um objeto existente no BD.

DROP - Exclui uma tabela inteira, uma exibição de uma tabela ou outro objeto.



<u>DML - Data Manipulation Language:</u>

Comandos utilizados para gerenciar os dados armazenados no banco, permitindo inserir novos dados, alterar dados existentes ou excluir dados armazenados.

Comandos > 

INSERT - Cria um novo registro 

UPDATE - Modifica registros existentes 

DELETE - Exclui um ou mais registros



<u>DCL - Data Control Language:</u>

Comandos utilizados para controlar o acesso aos dados armazenados no banco, por meio d permissões de acesso.

Comandos > 

GRANT - Fornece privilégios de acesso a um usuário

REVOKE - Retira os privilégios fornecidos a um usuário

ALTER USER - Permite modificar contas, como a senha de um usuário



<u>DQL - Data Query Language:</u>

Comandos utilizados para realizar consultas em um BD.

Comandos >

SELECT - Obtém registros especificados de uma ou mais tabelas.

<u>DTL - Data Transaction Language:</u>

Comandos empregados para gerenciar transações no banco de dados. São utilizados para gerenciar as alterações realizadas por comandos DML executados.

Comandos >

COMMIT - Salvar transações de forma permanente no banco de dados

ROLLBACK - Restaurar o banco ao último estado após um commit que teve êxito.

SAVEPOINT - Salvar temporariamente uma transação para que seja possível efetuar rollback àquele ponto se necessário.

**Criando um Banco de Dados >>**

Para criar um novo banco de dados utiliza-se o seguinte comando:

`CREATE DATABASE [IF NOT EXISTS] nome_BD`; 

[IF NOT EXISTS] - previne que seja criado um bd com nome igual a outro já existente no mesmo servidor.

Para listar os bancos existentes no servidor, basta utilizar o comando:

`SHOW DATABASES;`

Comando USE:

Instrui o SGBDR a utilizar o banco de dados especificado para rodar os comandos.

`USE nome_BD;`

Excluir um Banco de Dados:

`DROP DATABASE [IF EXISTS] nome_BD;`

***Constraints* (Restrições) >>**

<u>Definição:</u> Restrições são regras aplicadas nas colunas da tabela. São usadas para limitar os tipos de dados que são inseridos e podem ser especificadas no momento de criação da tabela ou após a tabela ter sido criada (ALTER).

Principais constraints são:

1. NOT NULL;
2. UNIQUE;
3. PRIMARY KEY;
4. FOREIGN KEY;
5. DEFAULT.

NOT NULL - Impõe a uma coluna a NÃO aceitar valores nulos, deste modo, não é possível inserir um registro sem entrar com um valor no campo.

UNIQUE - Identifica de forma única cada registro numa tabela de um BD. As constraints UNIQUE e PRIMARY KEY garantem a unicidade em uma coluna ou conjunto de colunas.

É possível ter várias constraints UNIQUE numa tabela, mas apenas uma chave primária por tabela.

PRIMARY KEY - identifica de forma única cada registro na tabela. Devem conter sempre valores únicos, não podem conter valores null e cada tabela deve conter apenas uma chave primária.

FOREIGN KEY - Campo que aponta para uma chave primária em outra tabela. Desta forma, é usada para criar os relacionamentos entre as tabelas do BD.

Exemplo: 

`CONSTRAINT fk_ID_Autor FOREIGN KEY (ID_Autor)`

`REFERENCES tbl_autores(ID_Autor);`

Neste exemplo a chave primária está na tabela tbl_autores e uma chave estrangeira foi criada na tabela atual usando o nome fk_ID_Autor.

DEFAULT - Usada para inserir um valor padrão especificado em uma coluna. O valor padrão será adicionado a todos os novos registros caso nenhum outro valor seja especificado na hora de inserir os dados.



**Criação de Tabelas >>**

Para criar tabelas usamos a declaração CREATE TABLE.

`CREATE TABLE [IF NOT EXISTS] `

`nome_tabela (`

`coluna tipo_dados constraints`

`)`

Tipos de Dados no MySQL:

INT - Inteiros

DECIMAL - Ponto decimal com M digitos no total e D casas decimais.

FLOAT - Ponto flutuante com precisão M e escala D

CHAR - String que ocupa tamanho fixo entre 0 e 255 caracteres

BOOL/BOOLEAN - Valores binários

VARCHAR - String de tamanho variável, com até 65535 caracteres.

BLOB - campo com tamanho máximo de 65535 caracteres binários.(usados para armazenar grande quantidade de dados, como imagens)

DATE - Uma data de 01/01/1000 a 31/12/9999, no formato YYYY-MM-DD HH:MM:SS

TIME - Hora apenas

YEAR - Ano nos formatos de 4 ou 2 dígitos (o padrão é 4)

**Criando a primeira tabela >>**

`USE db_biblioteca;`

`CREATE TABLE IF NOT EXISTS tbl_livro (` 

`ID_Livro SMALLINT AUTO_INCREMENT PRIMARY KEY,`

`nome_livro VARCHAR(70) NOT NULL,`

`ISBN13 CHAR(13),`

`ISBN10 CHAR(10),`

`ID_Categoria SMALLINT,`

`ID_Autor SMALLINT NOT NULL,`

`Data_Pub DATE NOT NULL,`

`Preco_Livro DECIMAL(6,2) NOT NULL,`

`);`

Agora iremos criar uma tabela para armazenar os dados dos autores:

`CREATE TABLE tbl_Autores (`

`ID_Autor SMALLINT PRIMARY KEY,`

`Nome_Autor VARCHAR(50) NOT NULL,`

`Sobrenome_Autor VARCHAR(60) NOTT NULL`

`);`

Uma para armazenar as categorias de livros:

`CREATE TABLE tbl_categorias (`

`ID_Editora SMALLINT PRIMARY KEY AUTO_INCREMENT,`

`Nome_Editora VARCHAR(50) NOT NULL`

`);`

E é criada uma tabela também para armazenar os dados das editoras:

`CREATE TABLE tbl_editoras (`

`ID_Editora SMALLINT PRIMARY KEY AUTO_INCREMENT,`

`Nome_Editora VARCHAR(50) NOT NULL,`

`);`

**Opções de Chave Estrangeira no MySQL >>** 

As chaves estrangeiras auxiliam a manter a integridade dos dados presentes nas tabelas do banco de dados.

<u>Sintaxe para criação da chave estrangeira:</u>

```sql
[CONSTRAINT nome_chave_estrangeira] FOREIGN KEY (nomes de colunas separados por vírgulas)
REFERENCES nome_tabela_pai (nomes de colunas separados por vírgulas na tabela pai)
[ON DELETE ação referencial]
[ON UPDATE ação referencial];
```

Obs.: Os itens entre "[ ]" (colchetes) são opcionais. 

ON DELETE - Significa que a ação referencial será executada quando um registro for excluído da tabela pai;

ON UPDATE -  Indica que a ação referencial será executada quando um registro for modificado na tabela pai.

<u>Principais opções referenciais:</u> 

CASCADE - permite excluir ou atualizar os registros relacionados presentes na tabela filha automaticamente, quando um registro da tabela pai for atualizado ou excluído.

RESTRICT - Impede que ocorra a exclusão ou atualização de u registro da tabela pai, caso ainda hajam registros na tabela filha. Uma exceção de violação da chave estrangeira é retornada.

SET NULL - Esta opção é usada para definir com o valor NULL o campo na tabela filha quando um registro da tabela pai for atualizado ou excluído.

NO ACTION - Essa opção equivale à opção RESTRICT, porém a verificação de integridade referencial é executada <u>após</u> a tentativa de alterar a tabela, ao contrario da opção RESTRICT que executa <u>antes</u>. (opção padrão caso não seja especificado nada)

SET DEFAULT - Define um valor padrão na coluna na tabela filha, aplicado quando um registro da tabela pai for atualizado ou excluído.



