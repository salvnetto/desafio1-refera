-- Valor de Venda por Tipo de Produto
SELECT
  categoria."Categoria",
  Round(SUM(vendas."Valor"), 2) AS "TotalVendas",
  Round(AVG(vendas."Valor"), 2) AS "ValorMedioVendas"
FROM 
	vendas
FULL JOIN
  produtos ON vendas."ProdutoID" = produtos."ProdutoID"
FULL JOIN
	categoria ON produtos."CategoriaID" = categoria."CategoriaID"
GROUP BY
  categoria."Categoria"
ORDER BY
  "TotalVendas" DESC;