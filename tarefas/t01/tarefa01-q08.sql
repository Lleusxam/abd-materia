SELECT departamento.descricao AS nome_do_departamento, 
funcionario.nome AS gerente, COUNT(projeto) AS qntd_projetos 
FROM departamento
LEFT JOIN funcionario ON funcionario.codigo = departamento.cod_gerente
LEFT JOIN projeto ON departamento.codigo = projeto.cod_depto
GROUP BY departamento.descricao, funcionario.nome