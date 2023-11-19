-- Lucro dos Meses
SELECT
    DATE_PART('month', frete."Data") AS "Mes",
    Round(SUM(vendas."ValorLiquido"), 2) AS "LucroTotal",
	Round(AVG(vendas."ValorLiquido"), 2) AS "LucroMedio"
FROM
    vendas
FULL JOIN
    frete ON vendas."CupomID" = frete."CupomID"
GROUP BY
    "Mes"
ORDER BY
    "Mes";