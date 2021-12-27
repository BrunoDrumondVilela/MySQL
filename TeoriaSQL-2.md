**Auto Incremento em Colunas >>**

- O auto incremento permite que um número único seja gerado quando um novo registro é inserido em uma tabela;

- Em MySQL trata-se da palavra chave `AUTO_INCREMENT`, cujo valor inicial por padrão é 1, e se incrementa no passo de 1 unidade;

- Para que o valor da coluna se inicie em 100, por exemplo, após criar a tabela e especificar a coluna que usará auto incremento execute o comando:

  ```SQL
  ALTER TABLE tabela AUTO_INCREMENT = 100;
  ```

- Ao inserir os valores na tabela, não é necessário especificar o valor para coluna;
- Só é permitido usar uma coluna de auto incremento por tabela, geralmente do tipo inteiro;
- Necessita também da constraint `NOT NULL` (configurado automaticamente) .

<u>Verificar o valor atual do auto incremento:</u>

Podemos verificar o valor de incremento mais atual armazenamento em uma tabela no banco de dados com o comando:

```sql
SELECT MAX (nome_coluna)
FROM tabela
```

<u>Alterar o próximo valor do campo de auto incremento:</u>

Para alterar o valor de incremento do próximo registro a ser armazenado em uma tabela, usamos o comando:

```sql
ALTER TABLE tabela AUTO_INCREMENT = valor;
```

**Alterar Tabelas e Colunas >>**

<u>Excluir colunas:</u>

```sql
ALTER TABLE nome-tabela
DROP COLUMN nome-coluna;
```

```sql
ALTER TABLE tabela
ADD  PRIMARY KEY;
```

<u>Adicionar colunas:</u>

```sql
ALTER TABLE tabela
ADD  coluna tipo_dados constraints;
```

<u>Modelo Entidade-Relacionamento atual:</u>

![Diagrama Entidade-Relacionamento do banco de Dados db_Biblioteca](http://www.bosontreinamentos.com.br/wp-content/uploads/2013/11/banco-dados-db-biblioteca-mysql-SQL.png)

 <u>Alterar uma tabela:</u>

Alterar o tipo de dados de uma determinada coluna:

```sql
ALTER TABLE tbl_Livro
MODIFY COLUMN ID_Autor SMALLINT;
```

<u>Alterar tabela com ADD PK:</u> 

Pode-se também alterar uma coluna, adicionando constraints, como uma primary key da seguinte forma -

```sql
ALTER TABLE Clientes
ADD PRIMARY KEY (ID_Cliente)
```

Obs.: A coluna ID_Cliente deve existir antes de ser transformada em chave primária !

<u>Excluir Constraints:</u>

```sql
ALTER TABLE nome-tabela
DROP PRIMARY KEY;
```

<u>Excluir tabela:</u> 

`DROP TABLE nome_tabela`

**Renomear colunas usando comandos SQL >>**

<u>Alterar o nome de uma determinada coluna (podendo alterar ou não o tipo de dados):</u>

```sql
ALTER TABLE nome_da_tabela
CHANGE nome_atual novo_nome [Tipo de Dados];
```

**Inserir dados em tabelas >>**

```sql
INSERT INTO nome_tabela (coluna1, coluna2,...)
VALUES (valor1, valor2,...);
```

**Campos Calculados em Tabelas >>**

Campos calculado - ou Colunas Geradas - são colunas em uma tabela em um banco de dados aplicada a outras colunas. É importante notar que por padrão, seus dados não são fisicamente  armazenados na tabela.

Sintaxe:

```sql
nome_coluna tipo_dados [GENERATED ALWAYS] AS expressão [VIRTUAL | STORED] constraints
```

*GENERATED ALWAYS*: é uma forma de indicar explicitamente que o campo é calculado

*ESPRESSÃO*: é a fórmula que desejamos usar para realizar o cálculo do valor da coluna.

*VIRTUAL*: significa que o valor do campo é calculado sempre que for realizada uma consulta a ele, mas seus dados não ficam armazenados na tabela em si.

*STORED*:  significa que o valor do campo é calculado - em operações de inserção e atualização de dados - e armazenado na tabela. O acesso nesse caso é mais rápido, porém ocupa mais espaço na memória.

Obs.: Por padrão, o tipo de coluna é setado como 'virtual', caso não seja especificada outra opção. 

Nota: NÃO É POSSÍVEL USAR `AUTO_INCREMENT` NUM CAMPO CALCULADO !

**Consultas com Ordenação >>**

A palavra-chave `ORDER BY` é usada para ordenar o conjunto-resultado de registros em uma consulta SQL, tanto de forma ascendente quanto descendente.

```sql
SELECT colunas FROM tabela
ORDER BY coluna_a_ordenar;
```

Pode ser usado a forma de especificação de ordem, utilizando `ASC` para ordem ascendente ou `DESC` para descendente. 

<u>Ordem de Classificação por tipo de dados:</u>

- Valores numéricos são exibidos com os menores valores primeiro;
- Valores de data são mostrados com os valores menores primeiro, o que significa as datas mais antigas (do mais antigo para o mais recente);
- Valores de caracteres são exibidos em ordem alfabética;
- Quando houver valores nulos, eles serão mostrados por último (em descendente).

Para ordenar os resultados de um `SELECT` usando mais de uma coluna, basta adicionar os valores na cláusula do `ORDER BY`, separados por uma vírgula.

**Tipo de dados ENUM >>**

<u>Definição:</u> o tipo de dado ENUM é um objeto string cujo valor é escolhido a partir de uma lista de valores permitidos, enumerados de forma explícita durante a especificação de uma coluna, quando uma tabela é criada.

Exemplo de criação de uma tabela com uma coluna do tipo `ENUM`:

```sql
CREATE TABLE camisas (
  idCamisa TINYINT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(25),
  tamanho ENUM('pequena','média','grande','extra-grande')
);
```

**Tipo de dados SET >>**

<u>Definição:</u> objeto string que pode ter zero ou mais valores, cada um dos quais deve ser escolhido a partir de uma lista de valores permitidos, que são especificados quando a tabela é criada.

 Obs.: uma coluna do tipo `SET` pode ter no máximo 64 membros. Os valores são armazenados como valores numéricos.

<u>Consultando valores em colunas SET:</u> 

Podemos utilizar o operador `LIKE` para fazer consultas:

```sql
SELECT * FROM nome_tabela
WHERE nome_coluna LIKE '%valor%';
```

Obs.: Os caracteres "%" são para explicitar que o objeto pode começar com qualquer valor e terminar com qualquer valor também.