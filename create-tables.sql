-- NESTA QUERY, É NECESSARIO MUDAR O CAMINHO DE ENTRADA PARA CADA COPY

-- Escritorios
CREATE TABLE public."escritorios" (
  "Escritorios" INT PRIMARY KEY,
  "EscritorioLocalizacao" VARCHAR(255)
);

COPY escritorios FROM 'C:/Escritorios.csv' WITH CSV HEADER DELIMITER ';';


-- Categoria
CREATE TABLE "categoria" (
  "CategoriaID" INT PRIMARY KEY,
  "Categoria" VARCHAR(255),
  "Departamento" VARCHAR(255),
  "w" VARCHAR(255)
);

COPY categoria FROM 'C:/Categoria.csv' WITH CSV HEADER DELIMITER ';';


-- Clientes
CREATE TABLE "clientes" (
  "ClienteID" INT PRIMARY KEY,
  "Cliente" VARCHAR(255),
  "NomeContato" VARCHAR(255),
  "Endereco" VARCHAR(255),
  "Cidade" VARCHAR(255),
  "Pais" VARCHAR(255),
  "PaisCodigo" VARCHAR(2),
  "Regiao" VARCHAR(255),
  "CEP" NUMERIC,
  "Latitude" NUMERIC,
  "Longitude" NUMERIC,
  "Fax" VARCHAR(255),
  "Telefone" VARCHAR(255)
);
COPY clientes FROM 'C:/Clientes.csv' WITH CSV HEADER DELIMITER ';';


-- Funcionarios
CREATE TABLE "funcionarios" (
  "FuncionarioID" INT PRIMARY KEY,
  "Extensao" INT,
  "NomeFuncionario" VARCHAR(255),
  "Genero" CHAR,
  "DataAdmissao" DATE,
  "Escritorio" INT,
  "Supervisor" VARCHAR(255),
  "Cargo" VARCHAR(255),
  "SalarioAnual" INT,
  "MetaVendas" INT
);

COPY funcionarios FROM 'C:/Funcionarios.csv' WITH CSV HEADER DELIMITER ';';


-- Fornecedor
CREATE TABLE "fornecedor" (
  "FornecedorID" INT PRIMARY KEY,
  "Fornecedor" VARCHAR(255),
  "FornecedorContato" VARCHAR(255),
  "FornecedorPais" VARCHAR(255)
);

COPY fornecedor FROM 'C:/Fornecedores.csv' WITH CSV HEADER DELIMITER ';';


-- Produtos
CREATE TABLE "produtos" (
  "ProdutoID" INT PRIMARY KEY,
  "CategoriaID" INT REFERENCES "categoria"("CategoriaID"),
  "Produto" VARCHAR(255),
  "FornecedorID" INT REFERENCES "fornecedor"("FornecedorID")
);

COPY produtos FROM 'C:/Produtos.csv' WITH CSV HEADER DELIMITER ';';


-- Fretes
CREATE TABLE "frete" (
  "Data" DATE,
  "ClienteID" INT REFERENCES "clientes"("ClienteID"),
  "FuncionarioID" INT REFERENCES "funcionarios"("FuncionarioID"),
  "ValorFrete" NUMERIC,
  "CupomID" INT PRIMARY KEY,
  "EmpresaFrete" VARCHAR(255),
  "DataEntrega" DATE
);

COPY frete FROM 'C:/Frete.csv' WITH CSV HEADER DELIMITER ';';


-- Cupons
CREATE TABLE "vendas" (
  "CupomID" INT REFERENCES "frete"("CupomID"),
  "ProdutoID" INT REFERENCES "produtos"("ProdutoID"),
  "Quantidade" INT,
  "Valor" NUMERIC,
  "Desconto" NUMERIC,
  "Custo" NUMERIC,
  "ValorLiquido" NUMERIC
);

COPY vendas FROM 'C:/Vendas.csv' WITH CSV HEADER DELIMITER ';';







