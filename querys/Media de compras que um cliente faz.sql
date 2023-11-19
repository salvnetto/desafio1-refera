-- Média de Compras que um cliente faz
SELECT
 	clientes."Cliente", 
	SUM(vendas."Quantidade") AS "QuantidadeTotal",
	Round(AVG(vendas."Quantidade"), 2) AS "QuantidadeMedia",
	Round(AVG(vendas."Valor"), 2) AS "ValorMedio"
FROM 
	vendas
FULL JOIN
  	frete ON vendas."CupomID" = frete."CupomID"
FULL JOIN
	clientes ON frete."ClienteID" = clientes."ClienteID"
GROUP BY
	clientes."Cliente";