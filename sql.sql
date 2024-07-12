SELECT
	P.IDPRODUTO,
	P.DESCRICAO_PRODUTO,
	P.PRECO_VENDA
FROM
	PRODUTOS P
JOIN
	ESTOQUES E ON P.IDPRODUTO = E.IDPRODUTO
WHERE P.SITUACAO_PRODUTO = 'AB'
ORDER BY
	P.DESCRICAO_PRODUTO;
