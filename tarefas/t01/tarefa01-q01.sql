SELECT nome FROM funcionario
WHERE salario >= (
	SELECT MAX(salario) FROM funcionario 
	WHERE cod_depto = 2
) AND cod_depto != 2