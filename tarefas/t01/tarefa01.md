# Tarefa 01

Este repositório contém os arquivos SQL utilizados para criar e popular o esquema relacional proposto.

- [Script de criação do esquema relacional (DDL)](tarefa01-create.sql)
- [Script de inserção de dados (DML)](tarefa01-inserts.sql)
- [Script de consulta - q01 (DQL)](tarefa01-q01.sql)
- [Script de consulta - q04 (DQL)](tarefa01-q04.sql)
- [Script de consulta - q08 (DQL)](tarefa01-q08.sql)
- [Script de consulta - q12 (DQL)](tarefa01-q12.sql)
- [Script de consulta - q16 (DQL)](tarefa01-q16.sql)


## NATURAL JOINS

O **NATURAL JOIN** é uma operação de junção no SQL que combina duas ou mais tabelas com base em colunas que possuem o mesmo **nome** e **tipo**. A principal vantagem do `NATURAL JOIN` é que ele simplifica as consultas, eliminando a necessidade de especificar explicitamente a condição de junção nos JOINS para atributos idênticos entre duas tabelas.

### Exemplo de **NATURAL JOIN**:

Imagine que temos duas tabelas: **funcionario** e **gerente**.

```sql
CREATE TABLE funcionario (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100),
    cod_depto INT
);

CREATE TABLE gerente (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100)
);
```
Ambas possuem uma coluna chamada codigo. Com o NATURAL JOIN, a junção será feita automaticamente usando essa coluna.

```sql
SELECT f.nome, g.nome
FROM funcionario f
NATURAL JOIN gerente g;
```
O código equivalente a esse é:
```sql
SELECT f.nome, g.nome
FROM funcionario f
JOIN gerente d ON f.codigo = g.codigo;
```
## **CROSS JOINS**

O **CROSS JOIN** é uma operação de junção no SQL que retorna o **produto cartesiano** entre duas ou mais tabelas. Isso significa que cada linha da primeira tabela será combinada com **todas** as linhas da segunda tabela, resultando em um número de linhas igual ao **número de linhas da primeira tabela multiplicado pelo número de linhas da segunda tabela**. Não há condições de junção envolvidas, pois é um mapeamento m x n.

### Exemplo de **CROSS JOIN**:

Imagine que temos duas tabelas: **produto** e **cor**.

```sql
CREATE TABLE produto (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE cor (
    codigo INT PRIMARY KEY,
    cor_nome VARCHAR(50)
);
```

Um CROSS JOIN entre essas tabelas seria:

```sql
SELECT p.nome, c.cor_nome
FROM produto p
CROSS JOIN cor c;
```
O resultado seria todas as combinações possíveis entre produtos e cores.

## **Window Functions**
Diferente de funções agregadas tradicionais como `SUM()` ou `AVG()`, que operam sobre grupos de linhas, as **Window Functions** operam sobre uma janela de linhas, permitindo que os dados individuais sejam preservados. Elas permitem realizar cálculos em um conjunto de linhas relacionadas à linha atual sem a necessidade de agrupar os resultados.



### Sintaxe Básica:

A sintaxe básica de uma **Window Function** é:

```sql
<função> OVER (<janela>)
```
`<função>`: é a função de janela que você está utilizando, como `ROW_NUMBER()`, `RANK()`, `SUM()`.
`<janela>` define a "janela" de dados sobre a qual a função de janela será aplicada. A janela pode ser especificada com a cláusula `PARTITION BY` (para dividir os dados em grupos) e ORDER BY (para ordenar os dados dentro de cada grupo).

### Exemplo de Window Function
Vamos imaginar uma tabela chamada vendas, que registra as vendas de produtos em uma loja:
```sql
CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    produto_id INT,
    quantidade INT,
    valor DECIMAL,
    data_venda DATE
);
```
Agora, queremos calcular o total de vendas para cada produto, mas mantendo o valor de cada venda individual. Podemos usar a função de janela `SUM()` para isso:

```sql
SELECT
    id, produto_id, quantidade, valor,
    SUM(valor) OVER (PARTITION BY produto_id) AS total_vendas_por_produto
FROM vendas;
```
O resultado será uma lista de todas as vendas individuais de cada produto, mas com uma coluna adicional que exibe o total de vendas de cada produto. Veja um exemplo preenchido:
| id  | produto_id | quantidade | valor  | total_vendas_por_produto |
|-----|------------|------------|--------|--------------------------|
| 1   | 101        | 3          | 30.00  | 90.00                    |
| 2   | 101        | 2          | 20.00  | 90.00                    |
| 3   | 102        | 1          | 10.00  | 60.00                    |
| 4   | 101        | 4          | 40.00  | 90.00                    |
| 5   | 102        | 5          | 50.00  | 60.00                    |