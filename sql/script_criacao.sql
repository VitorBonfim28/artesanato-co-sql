Objetivo: Estrutura do banco para o projeto Artesanato&Co
Observação: este script contém apenas a DDL (sem dados)

Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS db_artesanato;
USE db_artesanato;

-- =====================================================
-- Tabela: categorias
-- =====================================================
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL
);

-- =====================================================
-- Tabela: produtos
-- =====================================================
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- =====================================================
-- Tabela: clientes
-- =====================================================
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL
);

-- =====================================================
-- Tabela: pedidos
-- =====================================================
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    data_pedido DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- =====================================================
-- Tabela: itens_pedido
-- =====================================================
CREATE TABLE itens_pedido (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- =====================================================
-- Tabela: entregas
-- =====================================================
CREATE TABLE entregas (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT NOT NULL,
    data_entrega DATE,
    status_entrega VARCHAR(50),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);

-- =====================================================
-- Tabela: artesoes
-- =====================================================
CREATE TABLE artesaos (
    id_artesao INT AUTO_INCREMENT PRIMARY KEY,
    nome_artesao VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    telefone VARCHAR(20)
);

-- =====================================================
-- Tabela: produtos_artesao (relacionamento N:N)
-- =====================================================
CREATE TABLE produtos_artesao (
    id_produto INT NOT NULL,
    id_artesao INT NOT NULL,
    PRIMARY KEY (id_produto, id_artesao),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_artesao) REFERENCES artesaos(id_artesao)
);


