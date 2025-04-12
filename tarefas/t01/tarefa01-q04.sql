SELECT nome, salario, descricao AS nome_do_departamento FROM funcionario
JOIN departamento ON cod_depto = departamento.codigo
WHERE funcionario.codigo NOT IN (
	SELECT cod_gerente FROM departamento
  	WHERE cod_gerente IS NOT null
)
ORDER BY cod_depto