SELECT projeto.nome, projeto.data_inicio, projeto.data_fim,
atividade.data_inicio, atividade.data_fim
FROM projeto
JOIN atividade_projeto ON projeto.codigo = atividade_projeto.cod_projeto
JOIN atividade ON atividade_projeto.cod_atividade = atividade.codigo