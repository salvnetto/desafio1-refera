--  Média de produtos vendidos
SELECT
    produtos."Produto",
	  Round(AVG(vendas."Valor"), 2) AS "MediaValor",
	  Round(AVG(vendas."Quantidade"), 2) AS "MediaQuantidade"
FROM 
	  vendas
FULL JOIN
    produtos ON vendas."ProdutoID" = produtos."ProdutoID"
GROUP BY
 	  produtos."Produto"
