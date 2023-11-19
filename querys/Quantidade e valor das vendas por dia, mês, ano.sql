-- Quantidade e valor das vendas por dia, mês, ano;
SELECT
    DATE_PART('year', frete."Data") AS "Ano",
    DATE_PART('month', frete."Data") AS "Mes",
    DATE_PART('day', frete."Data") AS "Dia",
	COUNT(vendas."CupomID") AS "QuantidadeVendas",
    Round(SUM(vendas."Valor"), 2) AS "ValorTotalVendas"
FROM 
	vendas
FULL JOIN
	frete ON vendas."CupomID" = frete."CupomID"
GROUP BY
    "Ano", "Mes", "Dia"
ORDER BY
    "Ano", "Mes", "Dia";
	
	
	
-- Por dia;
SELECT
    DATE_PART('day', frete."Data") AS "Dia",
	COUNT(vendas."CupomID") AS "QuantidadeVendas",
    Round(SUM(vendas."Valor"), 2) AS "ValorTotalVendas"
FROM 
	vendas
FULL JOIN
	frete ON vendas."CupomID" = frete."CupomID"
GROUP BY
    "Dia"
ORDER BY
    "Dia";
	
	
-- Por Mês;
SELECT
    DATE_PART('month', frete."Data") AS "Mes",
	COUNT(vendas."CupomID") AS "QuantidadeVendas",
    Round(SUM(vendas."Valor"), 2) AS "ValorTotalVendas"
FROM 
	vendas
FULL JOIN
	frete ON vendas."CupomID" = frete."CupomID"
GROUP BY
    "Mes"
ORDER BY
    "Mes";


-- Por Ano;
SELECT
    DATE_PART('year', frete."Data") AS "Ano",
	COUNT(vendas."CupomID") AS "QuantidadeVendas",
    Round(SUM(vendas."Valor"), 2) AS "ValorTotalVendas"
FROM 
	vendas
FULL JOIN
	frete ON vendas."CupomID" = frete."CupomID"
GROUP BY
    "Ano"
ORDER BY
    "Ano";