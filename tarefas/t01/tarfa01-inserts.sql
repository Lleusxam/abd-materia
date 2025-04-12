INSERT INTO departamento (codigo, descricao, cod_gerente) VALUES
(1, 'Recursos Humanos', NULL),
(2, 'Tecnologia da Informação', NULL),
(3, 'Marketing', NULL),
(4, 'Financeiro', NULL),
(5, 'Pesquisa e Desenvolvimento', NULL);

INSERT INTO funcionario (codigo, nome, sexo, dt_nasc, salario, cod_depto) VALUES
(101, 'Ana Clara', 'F', '1985-04-12', 8500.00, 1),
(102, 'Bruno Silva', 'M', '1990-07-22', 9200.00, 2),
(103, 'Carlos Eduardo', 'M', '1982-03-18', 8800.00, 3),
(104, 'Daniela Costa', 'F', '1995-11-02', 8700.00, 4),
(105, 'Eduarda Lima', 'F', '1988-09-27', 9500.00, 5);

UPDATE departamento SET cod_gerente = 101 WHERE codigo = 1;
UPDATE departamento SET cod_gerente = 102 WHERE codigo = 2;
UPDATE departamento SET cod_gerente = 103 WHERE codigo = 3;
UPDATE departamento SET cod_gerente = 104 WHERE codigo = 4;
UPDATE departamento SET cod_gerente = 105 WHERE codigo = 5;

INSERT INTO projeto (codigo, nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim) VALUES
(201, 'Projeto RH Digital', 'Digitalização de processos de RH', 1, 101, '2024-01-10', '2024-06-30'),
(202, 'Sistema Web', 'Plataforma de gestão online', 2, 102, '2024-02-15', NULL),
(203, 'Campanha Publicitária', 'Nova campanha nas redes sociais', 3, 103, '2024-03-01', '2024-05-01'),
(204, 'Auditoria Interna', 'Revisão de processos financeiros', 4, 104, '2024-04-01', NULL),
(205, 'Novo Produto X', 'Desenvolvimento de produto experimental', 5, 105, '2024-01-20', '2024-09-30');

INSERT INTO atividade (codigo, nome, descricao, cod_responsavel, data_inicio, data_fim) VALUES
(301, 'Levantamento de Requisitos', 'Entrevistas com usuários', 101, '2024-01-15', '2024-01-25'),
(302, 'Desenvolvimento Front-end', 'Codificação da interface web', 102, '2024-02-20', NULL),
(303, 'Criação de Conteúdo', 'Produção de vídeos e imagens', 103, '2024-03-05', '2024-04-10'),
(304, 'Análise Contábil', 'Revisão de balanços', 104, '2024-04-05', NULL),
(305, 'Testes de Produto', 'Fase de testes do produto X', 105, '2024-03-10', '2024-06-15');

INSERT INTO atividade_projeto (cod_projeto, cod_atividade) VALUES
(201, 301),
(202, 302),
(203, 303),
(204, 304),
(205, 305);
