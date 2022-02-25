# Teoria SQL 03 >>

**Data e Hora:**

Existem cinco tipos que permitem armazenar informações sobre tempo no MySQL:

- DATE
- TIME
- DATETIME
- TIMESTAMP
- YEAR


|   Tipo   | Tam.Bytes |                                            Descrição                                            |
|:-------: | :-------: | :---------------------------------------------------------------------------------------------: |
|   DATE   |     3     |                    Datas entre 01/Jan/1000 a 31/Dez/9999. Formato: aaaa-mm-dd                   |
|   TIME   |     3     |                    Horas na faixa de -838:59:59 a 838:59:59. Formato: hh;mm;ss                  |
| DATETIME |     8     | Combinação de data e hora. Faixa de 01/Jan/1970 a 31/Dez/9999.     Formato: aaaa-mm-dd hh:mm:ss |
|   YEAR   |     1     |                       Ano nos formatos de 2 ou 4 dígitos. De 1901 a 2155.                       |
| TIMESTAMP|     4     | Combinação de data e hora. De 01/Jan/1970 a 2037.                 Formato: aaaa-mm-dd hh:mm:ss  |

**Filtros de Pesquisas:**

A cláusula `WHERE` permite filtrar registros nos resultados de uma consulta, de modo a trazer apenas as informações desejadas.

Sintaxe:

```sql
SELECT colunas
FROM tabela
WHERE condição;
```

**Operadores AND, OR e NOT:**

AND -> Mostra um registro se ambas as condições forem verdadeiras.

OR -> Mostra um registro se pelo menos uma das condições for verdadeira.

NOT -> É a negação de uma expressão, ou seja, inverte o estado lógico da condição.

Exemplo:

```sql
SELECT * FROM tbl_livro
WHERE ID_Livro > 2 OR ID_Autor < 3;
```

**Operadores IN e NOT IN:**

IN -> Permite verificar se um valor específico corresponde a algum valor presente numa lista ou subconsulta.

Sintaxe:

```sql
SELECT coluna(s)
FROM tabela
WHERE condição | coluna IN (valor1, valor2, ...);
```

NOT IN -> Verifica se um valor *não* corresponde com nenhum valor na lista ou subconsulta realizada.

Sintaxe:

```sql
SELECT colunas(s)
FROM tabela
WHERE condição | coluna NOT IN (valor1, valor2,...);
```

**Operador IN e Subconsultas:**

O Operador IN ou NOT IN é empregado com muita frequência com uma subconsulta, em vez de uma lista de valores fornecida. Assim, a lista de valores a ser avaliada pelo operador IN é fornecida como resultado da subconsulta (subquery).

Sintaxe:

```sql
SELECT coluna(s)
FROM tabela
WHERE condição | coluna IN (
   SELECT coluna(s)
   FROM tabela
   WHERE | GROUP BY | HAVING | ORDER BY
);
```

**Excluir Registros com DELETE e TRUNCATE TABLE:**

DELETE -> Podemos excluir registros específicos, filtrados por meio de uma condição na cláusula WHERE.

Sintaxe:

```sql
DELETE FROM tabela WHERE condição;
```

***ATENÇÃO: Sempre utilize a cláusula WHERE, caso contrário, toda a tabela será EXCLUÍDA!***

TRUNCATE TABLE -> Permite remover todas as linhas de uma tabela numa única operação, sem registrar as exclusões de linhas individuais.

**Nomes Alternativos para Colunas e Tabelas:**

Pode-se dar um nome diferente a uma coluna ou tabela ao realizar uma junção ou retornar o resultado de uma consulta, de modo que seja mais fácil ou intuitivo entender os dados.

Sintaxe:

```sql
SELECT colunas
AS alias_coluna
FROM tabela AS alias_tablea;
```

**Índices em MySQL:**

São empregados em uma consulta para ajudar a encontrar registros com um valor específico em uma coluna de forma rápida. Sem índices, o MySQL faz uma busca iniciando no primeiro registro e varrendo toda a tabela até encontrar os registros que importam.

Idealmente, deve-se criar índices nos campos que são usados em cláusulas WHERE e também envolvidos em JOINS nas consultas.


|      TIPO      |                                                    FUNÇÃO                                                    |
| :---------------: | :---------------------------------------------------------------------------------------------------------------: |
|     B-Tree     |                              Tipo mais comum, suportado pela maioria dos engines.                              |
|      Hash      |                     Suportado pela engine MEMORY, e pelo InnoDB via adaptive hash indexes.                     |
|     R-Tree     | Adequado para tipos de dados espaciais. Mais usado em sistemas como o PostgresSQL. Suportado pela engine InnoDB |
| Full-Text Index |              Usado em operações do tipo MATCH AGAINST. Suportado pelas engines MyISAM e InnoDB.              |

**Como criar índices**:

Podemos criar no momento em que criamos a tabela ou mesmo posteriormente.

Criar índice junto com a tabela:

```sql
CREATE [UNIQUE] INDEX nome_índice
ON nome_tabela (
   coluna1 [ASC | DESC],
   [coluna2 [ASC | DESC]]...
);
```

UNIQUE: significa que o índice não permitirá valores duplicados na coluna

ASC/DESC: se referem á ordem de indexação, se ascendente ou descendente (Default = ASC).

Quando criamos uma tabela com um campo de chave primária ou chave única, o MySQL cria nesse campo um índice de nome PRIMARY do tipo *clustered*, que é um tipo especial de *índice primário*.

Criar índice numa tabela existente:

```sql
CREATE INDEX nome_índice ON tabela(colunas);
```

**Excluir um índice:**

Para excluir um índice usamos `DROP INDEX`

`DROP INDEX nome_índice ON tabela;`

**Funções de Agregação:**

São funções que permitem executar uma operação aritmética nos valores de uma coluna em todos os registros de uma tabela.

Sintaxe Básica:

```sql
função(ALL | DISTINCT expressão)
```

ALL -> Avalia todos os registros ao agregar o valor da função; é o comportamento padrão.

DISTINCT -> Usa apenas valores distintos ao avaliar a função.

*Importante: funções de agregação desconsideram valores nulos (exceto count())*

Principais funções de agregação:

- MIN - valor mínimo de um conjunto de valores;
- MAX - valor máximo de um conjunto de valores;
- AVG - média aritmética de um conjunto de valores;
- SUM - total de um conjunto de valores;
- COUNT - conta quantidade de itens

As funções SUM e AVG somente aceitam como entrada um conjunto de números, já as demais podem operar também com outros tipos de dados, como por exemplo strings ou dates.

**Arredondamento de Números em consultas:**

Em MySQL utilizamos a função `ROUN()` para fazer arredondamentos de números. A função recebe dois parâmentros: `ROUND(valor, casas_decimais)`

**valor**: valor que deseja arredondar, podendo ser substituído por uma variável ou mesmo outra função.

**casas_decimais:** número de casas decimais desejadas. Se omitido, retorna parte inteira.

Em conjunto, pode-se ser usada a função `FLOOR()`, que arredonda o valor "para baixo".

**Truncar Valores:**

Retorna um número desejado de casas decimais de um valor.

Sintaxe:

```sql
TRUNCATE()valor, casas_decimais
```

Podemos também arredondar valores para cima com a função `ceil(número)`.

Exemplo:

```sql
SELECT CEIL(54.8) AS Arredondado para cima
>>> 55
```

