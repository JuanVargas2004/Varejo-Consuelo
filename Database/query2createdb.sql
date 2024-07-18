#-------------------------- CRIAÇÃO DO BANCO DE DADOS ---------------------------#
CREATE DATABASE IF NOT EXISTS varejo;
USE varejo; 



#----------------------------- CRIAÇÃO DAS TABELAS ------------------------------#

#CRIAÇÃO DA TABELA DE VENDAS
CREATE TABLE vendas(
	id_venda INT,
    id_produto INT,
    id_loja INT,
    data_venda DATE,
    quantidade INT,
    preco_unitario DOUBLE,
    id_cliente INT,
    desconto DOUBLE,
    promocao VARCHAR(5),
    estoque_inical INT,
    estoque_final INT,
    devolucao VARCHAR(5),
    canal_vendas VARCHAR(50),
    PRIMARY KEY (id_venda)
);


#CRIAÇÃO DA TABELA DE PRODUTOS
CREATE TABLE produtos(
	id_produto INT,
    categoria VARCHAR(100),
    preco_base DOUBLE,
    nome_produto VARCHAR(100),
    PRIMARY KEY (id_produto)
);


#CRIAÇÃO DA TABELA DE PROMOÇÕES
CREATE TABLE promocoes(
	id_promocao INT,
    data_inicio DATE,
    data_fim DATE,
    desconto DOUBLE,
    id_produto INT,
    PRIMARY KEY (id_promocao)
);


#CRIAÇÃO DA TABELA DE LOJAS
CREATE TABLE lojas(
	id_loja INT,
    nome_loja VARCHAR(50),
    cidade VARCHAR(50),
    pais VARCHAR(50),
    PRIMARY KEY (id_loja)
);


#CRIAÇÃO DA TABELA DE CLIENTES
CREATE TABLE clientes(
	id_cliente INT,
    satisfacao INT,
    mes_inicio INT,
    ano_inicio INT,
    PRIMARY KEY (id_cliente)
);


#CRIAÇÃO DA TABELA ENGAJAMENTO
CREATE TABLE engajamento(
	id_engajamento INT,
    id_cliente INT,
    data_engajamento DATE,
    tipo_engajamento VARCHAR(50),
    rede_social VARCHAR(50),
    PRIMARY KEY (id_engajamento)
);


#CRIAÇÃO DA TABELA DE MARKETING
CREATE TABLE campanhas_marketing(
	id_campanha INT,
    nome_campanha VARCHAR(50),
    canal_divulgacao VARCHAR(50),
    publico_alvo VARCHAR(50),
    data_inicio DATE,
    data_fim DATE,
    PRIMARY KEY (id_campanha)
);

#------------------------- INSERINDO DADOS NAS TABELAS --------------------------#
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/vendas_online.csv"
INTO TABLE vendas
FIELDS TERMINATED BY ";"
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/produtos.csv"
INTO TABLE produtos
FIELDS TERMINATED BY ";"
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/promocoes.csv"
INTO TABLE promocoes
FIELDS TERMINATED BY ";"
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/lojas.csv"
INTO TABLE lojas
FIELDS TERMINATED BY ";"
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/clientes.csv"
INTO TABLE clientes
FIELDS TERMINATED BY ";"
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/engajamento_redes_sociais.csv"
INTO TABLE engajamento
FIELDS TERMINATED BY ";"
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/campanhas_marketing.csv"
INTO TABLE campanhas_marketing
FIELDS TERMINATED BY ";"
LINES TERMINATED BY "\n"
IGNORE 1 ROWS;

#SHOW VARIABLES LIKE "secure_file_priv";