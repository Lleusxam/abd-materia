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
