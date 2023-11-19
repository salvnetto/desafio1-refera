-- Valor Total das Vendas e dos Fretes por Produto e Ordem de Venda
SELECT
    produtos."Produto",
	frete."Data",
	Round(SUM(vendas."Valor"), 2) AS "TotalVendas",
	Round(SUM(frete."ValorFrete"), 2) AS "TotalFrete"
FROM 
	vendas
FULL JOIN
    produtos ON vendas."ProdutoID" = produtos."ProdutoID"
FULL JOIN
	frete ON vendas."CupomID" = frete."CupomID"
GROUP BY
 	produtos."Produto", frete."Data"
ORDER BY
	"Data" ASC;
