-- =====================================================
-- Script de Inserção de Dados Fictícios - Artesanato&Co
-- Autor: Vitor Bonfim Costa
-- Objetivo: Popular o banco db_artesanato para consultas SQL
-- Observação: este script contém apenas DML (sem DDL)
-- =====================================================

USE db_artesanato;

-- =====================================================
-- Inserção de Categorias
-- =====================================================
INSERT INTO categorias (id_categoria, nome_categoria) VALUES
(1, 'Cerâmica'),
(2, 'Tecelagem'),
(3, 'Madeira'),
(4, 'Bordado');

-- =====================================================
-- Inserção de Produtos
-- =====================================================
INSERT INTO produtos (id_produto, nome_produto, preco, estoque, id_categoria) VALUES
(1, 'Vaso de Cerâmica', 75.00, 10, 1),
(2, 'Tapete de Tear', 150.00, 5, 2),
(3, 'Escultura em Madeira', 200.00, 7, 3),
(4, 'Toalha Bordada', 50.00, 12, 4);

-- =====================================================
-- Inserção de Clientes
-- =====================================================
INSERT INTO clientes (id_cliente, nome_cliente, email, telefone, data_cadastro) VALUES
(1, 'João Silva', 'joao@email.com', '1199999999', '2025-07-01'),
(2, 'Maria Souza', 'maria@email.com', '21988887777', '2025-07-05'),
(3, 'Carlos Pereira', 'carlos@email.com', '31977776666', '2025-07-10');

-- =====================================================
-- Inserção de Pedidos
-- =====================================================
INSERT INTO pedidos (id_pedido, data_pedido, valor_total, id_cliente) VALUES
(1, '2025-07-15', 225.00, 1),
(2, '2025-07-20', 50.00, 2);

-- =====================================================
-- Inserção de Itens de Pedido
-- =====================================================
INSERT INTO itens_pedido (id_item, id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 1, 75.00),
(2, 1, 2, 1, 150.00),
(3, 2, 4, 1, 50.00);

-- =====================================================
-- Inserção de Entregas
-- =====================================================
INSERT INTO entregas (id_entrega, id_pedido, data_entrega, status_entrega) VALUES
(1, 1, '2025-07-18', 'Entregue'),
(2, 2, '2025-07-23', 'Pendente');

-- =====================================================
-- Inserção de Artesãos
-- =====================================================
INSERT INTO artesaos (id_artesao, nome_artesao, especialidade, telefone) VALUES
(1, 'Ana Paula', 'Cerâmica', '11911112222'),
(2, 'Rafael Lima', 'Tecelagem', '21922223333'),
(3, 'Beatriz Costa', 'Madeira', '31933334444');

-- =====================================================
-- Inserção de Produtos ↔ Artesãos (N:N)
-- =====================================================
INSERT INTO produtos_artesao (id_produto, id_artesao) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 2);
