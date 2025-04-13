# Tarefa 01

Este repositório contém os arquivos SQL utilizados para criar e popular o esquema relacional proposto.

- [Script de criação do esquema relacional (DDL)](tarefa01-create.sql)
- [Script de inserção de dados (DML)](tarefa01-inserts.sql)

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