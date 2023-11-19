-- Venda por Produto
SELECT
 	produtos."Produto",
  SUM(vendas."Quantidade") AS "TotalQuantidade",
  Round(AVG(vendas."Quantidade"), 2) AS "QuantidadeMediaPorVenda"
FROM 
	vendas
FULL JOIN
  produtos ON vendas."ProdutoID" = produtos."ProdutoID"
GROUP BY
  produtos."Produto";