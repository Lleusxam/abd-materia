SELECT funcionario.nome
FROM funcionario
JOIN projeto ON funcionario.codigo = projeto.cod_responsavel
LEFT JOIN departamento ON funcionario.codigo = departamento.cod_gerente
LEFT JOIN departamento AS depto_funcionario ON funcionario.cod_depto = depto_funcionario.codigo
LEFT JOIN funcionario AS gerente_depto 
    ON depto_funcionario.cod_gerente = gerente_depto.codigo
WHERE 
    departamento.cod_gerente IS NOT NULL
    OR funcionario.salario > gerente_depto.salario
