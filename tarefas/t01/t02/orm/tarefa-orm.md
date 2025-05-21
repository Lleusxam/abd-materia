## ODBC

ODBC (Open Database Connectivity) é uma interface padrão para acesso a sistemas gerenciadores de banco de dados (SGBDs). Ele permite que aplicações se conectem a diferentes bancos de dados, independentemente do fabricante, por meio de drivers específicos. 

Com ODBC, o programa faz requisições SQL ao driver, que traduz essas chamadas para o banco de dados alvo. É amplamente utilizado em linguagens como C, C++ e Python (com pacotes como `pyodbc`). Seu principal benefício é a **portabilidade e independência de SGBD**, embora exija configuração de drivers e DSNs (Data Source Names).

---

## ORM

ORM (Object-Relational Mapping) é uma técnica que permite mapear tabelas de um banco de dados relacional para classes de uma linguagem de programação orientada a objetos. 

Com isso, o desenvolvedor interage com o banco usando objetos, métodos e atributos em vez de escrever SQL diretamente. Isso melhora a produtividade, reduz erros e facilita a manutenção do código.

Em Python, por exemplo, frameworks como **SQLAlchemy** ou **Django ORM** são muito utilizados. Apesar de facilitar o desenvolvimento, o uso de ORM pode gerar consultas menos otimizadas se mal utilizado.
