-- Venda por Cliente, Cidade do Cliente e Estado
--- *O banco de dados não inclui a variável 'estado', uma vez que abrange vários países. 
--- *Em vez disso, foi substituída pela variável 'Região'.
SELECT
 	clientes."Cliente", 
	clientes."Cidade", 
	clientes."Regiao",
	SUM(vendas."Quantidade") AS "Quantidade",
	Round(AVG(vendas."Quantidade"), 2) AS "QuantidadeMedia"
FROM 
	vendas
FULL JOIN
  	frete ON vendas."CupomID" = frete."CupomID"
FULL JOIN
	clientes ON frete."ClienteID" = clientes."ClienteID"
GROUP BY
	clientes."Cliente", clientes."Cidade", clientes."Regiao";
	
-- Por Cliente
SELECT
 	clientes."Cliente", 
	SUM(vendas."Quantidade") AS "Quantidade",
	Round(AVG(vendas."Quantidade"), 2) AS "QuantidadeMedia"
FROM 
	vendas
FULL JOIN
  	frete ON vendas."CupomID" = frete."CupomID"
FULL JOIN
	clientes ON frete."ClienteID" = clientes."ClienteID"
GROUP BY
	clientes."Cliente";
	
-- Por Cidade
SELECT
	clientes."Cidade", 
	SUM(vendas."Quantidade") AS "Quantidade",
	Round(AVG(vendas."Quantidade"), 2) AS "QuantidadeMedia"
FROM 
	vendas
FULL JOIN
  	frete ON vendas."CupomID" = frete."CupomID"
FULL JOIN
	clientes ON frete."ClienteID" = clientes."ClienteID"
GROUP BY
	clientes."Cidade";
	
-- Por Região
SELECT
	clientes."Regiao", 
	SUM(vendas."Quantidade") AS "Quantidade",
	Round(AVG(vendas."Quantidade"), 2) AS "QuantidadeMedia"
FROM 
	vendas
FULL JOIN
  	frete ON vendas."CupomID" = frete."CupomID"
FULL JOIN
	clientes ON frete."ClienteID" = clientes."ClienteID"
GROUP BY
	clientes."Regiao";