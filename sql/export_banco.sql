CREATE DATABASE IF NOT EXISTS db_artesanato;
USE db_artesanato;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_artesanato`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `artesaos`
--

CREATE TABLE `artesaos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `artesaos`
--

INSERT INTO `artesaos` (`id`, `nome`, `cidade`) VALUES
(1, 'Ana Cerqueira', 'Ouro Preto'),
(2, 'João Barbosa', 'Tiradentes'),
(3, 'Luiza Ramos', 'São João del Rei'),
(4, 'Paulo Mendes', 'Belo Horizonte'),
(5, 'Carla Dias', 'Ouro Preto');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`) VALUES
(1, 'Cerâmica'),
(2, 'Tecelagem'),
(3, 'Madeira'),
(4, 'Cestaria'),
(5, 'Couro');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `email`, `telefone`) VALUES
(1, 'Joana Lima', 'joana@email.com', '35999990001'),
(2, 'Carlos Souza', 'carlos@email.com', '35999990002'),
(3, 'Mariana Costa', 'mariana@email.com', '35999990003'),
(4, 'Rafael Lima', 'rafael@email.com', '35999990004'),
(5, 'Bianca Souza', 'bianca@email.com', '35999990005'),
(6, 'Fernando Rocha', 'fernando@email.com', '35999990006');

-- --------------------------------------------------------

--
-- Estrutura para tabela `entregas`
--

CREATE TABLE `entregas` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `status_entrega` enum('ENTREGUE','EM TRANSITO','CANCELADA') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `entregas`
--

INSERT INTO `entregas` (`id`, `id_pedido`, `data_entrega`, `status_entrega`) VALUES
(1, 1, '2025-07-05', 'ENTREGUE'),
(2, 2, NULL, 'EM TRANSITO'),
(3, 3, '2025-07-06', 'ENTREGUE'),
(4, 4, NULL, 'EM TRANSITO'),
(5, 5, '2025-07-06', 'ENTREGUE'),
(6, 6, '2025-07-07', 'ENTREGUE'),
(7, 7, '2025-07-08', 'ENTREGUE'),
(8, 8, NULL, 'EM TRANSITO'),
(9, 9, '2025-07-09', 'ENTREGUE');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_pedido`
--

CREATE TABLE `itens_pedido` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `itens_pedido`
--

INSERT INTO `itens_pedido` (`id`, `id_pedido`, `id_produto`, `quantidade`, `preco_unitario`) VALUES
(1, 1, 1, 2, 35.00),
(2, 1, 4, 1, 45.00),
(3, 2, 3, 1, 250.00),
(4, 3, 2, 1, 120.00),
(5, 3, 5, 1, 80.00),
(22, 4, 6, 2, 40.00),
(23, 4, 7, 1, 120.00),
(24, 5, 8, 3, 35.00),
(25, 5, 1, 1, 35.00),
(26, 6, 5, 2, 80.00),
(27, 7, 9, 1, 55.00),
(28, 8, 10, 1, 90.00),
(29, 9, 11, 2, 70.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `data_pedido` date DEFAULT NULL,
  `status_pagamento` enum('PAGO','PENDENTE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_cliente`, `data_pedido`, `status_pagamento`) VALUES
(1, 1, '2025-07-01', 'PAGO'),
(2, 2, '2025-07-02', 'PENDENTE'),
(3, 1, '2025-07-03', 'PAGO'),
(4, 4, '2025-07-04', 'PENDENTE'),
(5, 5, '2025-07-05', 'PAGO'),
(6, 6, '2025-07-06', 'PAGO'),
(7, 2, '2025-07-07', 'PENDENTE'),
(8, 3, '2025-07-07', 'PAGO'),
(9, 4, '2025-07-04', 'PENDENTE'),
(10, 5, '2025-07-05', 'PAGO'),
(11, 6, '2025-07-06', 'PAGO'),
(12, 2, '2025-07-07', 'PENDENTE'),
(13, 3, '2025-07-07', 'PAGO');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_artesao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `preco`, `id_categoria`, `id_artesao`) VALUES
(1, 'Caneca de Barro', 35.00, 1, 1),
(2, 'Tapete de Tear', 120.00, 2, 2),
(3, 'Escultura de Madeira', 250.00, 3, 3),
(4, 'Prato Decorativo', 45.00, 1, 1),
(5, 'Toalha de Mesa', 80.00, 2, 2),
(6, 'Cesta de Palha', 60.00, 4, 4),
(7, 'Pulseira de Couro', 35.00, 5, 5),
(8, 'Capa de Almofada', 55.00, 2, 2),
(9, 'Caixa de Madeira Pintada', 90.00, 3, 3),
(10, 'Jogo Americano Tecelagem', 70.00, 2, 2),
(11, 'Xícara Decorada', 40.00, 1, 1),
(12, 'Escultura Miniatura', 120.00, 3, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `artesaos`
--
ALTER TABLE `artesaos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `entregas`
--
ALTER TABLE `entregas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Índices de tabela `itens_pedido`
--
ALTER TABLE `itens_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_artesao` (`id_artesao`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `artesaos`
--
ALTER TABLE `artesaos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `entregas`
--
ALTER TABLE `entregas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `itens_pedido`
--
ALTER TABLE `itens_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `entregas`
--
ALTER TABLE `entregas`
  ADD CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Restrições para tabelas `itens_pedido`
--
ALTER TABLE `itens_pedido`
  ADD CONSTRAINT `itens_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `itens_pedido_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `produtos_ibfk_2` FOREIGN KEY (`id_artesao`) REFERENCES `artesaos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
