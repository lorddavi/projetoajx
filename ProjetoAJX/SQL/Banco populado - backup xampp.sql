-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 30-Maio-2019 às 21:09
-- Versão do servidor: 10.1.37-MariaDB
-- versão do PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projetoajx`
--
CREATE DATABASE IF NOT EXISTS `projetoajx` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `projetoajx`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id_carrinho` int(11) NOT NULL,
  `valor_produtos` float NOT NULL,
  `id_qtdc` int(11) NOT NULL,
  `id_produtoc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(50) NOT NULL,
  `email_cliente` varchar(50) DEFAULT NULL,
  `cpf_cliente` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome_cliente`, `email_cliente`, `cpf_cliente`) VALUES
(1, 'Davi Evangelista da Silva', 'davi_dmp@hotmail.com', '41800069871'),
(2, 'Uzumaki Naruto', 'naruto@bol.com.br', '97882252093'),
(3, 'Saitama', 'saitama@', '22413029028'),
(5, 'Jon Snow', '76418913060', '76418913060');

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `id_endereco` int(11) NOT NULL,
  `rua_endereco` varchar(60) NOT NULL,
  `num_endereco` varchar(6) NOT NULL,
  `bairro_endereco` varchar(60) NOT NULL,
  `cidade_endereco` varchar(40) NOT NULL,
  `cep_endereco` varchar(15) NOT NULL,
  `uf_endereco` varchar(2) NOT NULL,
  `id_clientee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `enderecos`
--

INSERT INTO `enderecos` (`id_endereco`, `rua_endereco`, `num_endereco`, `bairro_endereco`, `cidade_endereco`, `cep_endereco`, `uf_endereco`, `id_clientee`) VALUES
(1, 'João Leonor de Camargo', '1076', 'Brabância II', 'Avaré', '18703-530', 'SP', 1),
(2, 'Rua fictícia A', '1043', 'Bairro fictício B', 'Avaré', '18703530', 'SP', 1),
(3, 'Rua tal', '1', 'Bairro tal', 'Niterói', '342423423', 'RJ', 2),
(4, 'Rua fictícia B', '3231', 'Bairro B', 'Cidade Z', '18760-444', 'SP', 3),
(5, 'Rua fictícia C', '3423', 'Bairro C', 'Jacupiranga', '11503-643', 'RN', 1),
(8, 'Rua que fica logo ali', '10', 'Bairro que fica logo ali', 'Avaré', '18.703-540', 'SP', 5),
(9, 'uytgyuitgyugu', '45', 'iujhiuhiu', 'jkhui', 'uyhghyu', 'SP', 2),
(10, 'uyguygyugu', '5151', 'ojko0ip-', 'iokjhiuo', '876786', 'AC', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_vendap` int(11) NOT NULL,
  `id_produtop` int(11) NOT NULL,
  `id_qtdp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_vendap`, `id_produtop`, `id_qtdp`) VALUES
(1, 1, 1, 5),
(2, 1, 4, 1),
(3, 2, 7, 1),
(4, 3, 3, 5),
(5, 3, 1, 1),
(6, 3, 1, 1),
(7, 4, 2, 10),
(8, 5, 8, 1),
(9, 5, 8, 1),
(10, 6, 5, 1),
(11, 6, 5, 1),
(12, 6, 5, 1),
(13, 6, 5, 1),
(14, 6, 6, 1),
(15, 6, 4, 1),
(16, 6, 4, 1),
(17, 6, 1, 1),
(18, 6, 1, 1),
(19, 6, 1, 1),
(20, 7, 1, 189),
(21, 7, 1, 1),
(22, 8, 9, 1),
(23, 8, 9, 1),
(24, 8, 9, 1),
(25, 9, 1, 1),
(26, 10, 1, 10),
(27, 11, 7, 1),
(28, 11, 6, 1),
(29, 12, 1, 1),
(30, 12, 2, 1),
(31, 12, 3, 1),
(32, 12, 4, 1),
(33, 12, 5, 1),
(34, 12, 6, 1),
(35, 12, 7, 1),
(36, 12, 8, 1),
(37, 12, 9, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `codigo_produto` varchar(10) NOT NULL,
  `nome_produto` varchar(30) NOT NULL,
  `qtd_produto` int(11) DEFAULT NULL,
  `valor_produto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `codigo_produto`, `nome_produto`, `qtd_produto`, `valor_produto`) VALUES
(1, 'pc1', 'Paçoquinha', 89, 0.7),
(2, 'dcbn', 'Doce de Banana', 139, 1),
(3, 'ppq', 'Pipoquinha', 44, 0.99),
(4, 'fdng', 'Salgadinho Fandangos', 41, 2.15),
(5, 'abbr', 'Doce de Abóbora', 55, 0.85),
(6, 'fbt', 'Salgadinho Fabitos', 87, 0.5),
(7, 'ovo', 'Ovo de Páscoa', 7, 43.39),
(8, 'cxbbn', 'Caixa de Bombons Nestlê', 12, 10.99),
(9, 'dcestrh', 'Doce estranho que deu vontade', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefones`
--

CREATE TABLE `telefones` (
  `id_tel` int(11) NOT NULL,
  `num_tel` varchar(14) NOT NULL,
  `id_clientet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `telefones`
--

INSERT INTO `telefones` (`id_tel`, `num_tel`, `id_clientet`) VALUES
(1, '14997787781', 1),
(2, '3423432', 2),
(3, '14998764533', 3),
(5, '2332131221', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id_venda` int(11) NOT NULL,
  `data_venda` date NOT NULL,
  `valor_venda` float NOT NULL,
  `id_clientev` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id_venda`, `data_venda`, `valor_venda`, `id_clientev`) VALUES
(1, '2019-05-30', 5.65, 2),
(2, '2019-05-30', 43.39, 1),
(3, '2019-05-30', 6.35, 1),
(4, '2019-05-30', 10, 3),
(5, '2019-05-30', 21.98, 5),
(6, '2019-05-30', 10.3, 3),
(7, '2019-05-30', 133, 1),
(8, '2019-05-30', 6, 1),
(9, '2019-05-30', 0.7, 1),
(10, '2019-05-30', 7, 2),
(11, '2019-05-30', 43.89, 1),
(12, '2019-05-30', 62.57, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`id_carrinho`),
  ADD KEY `fk_produtoc` (`id_produtoc`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indexes for table `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `fk_clientee` (`id_clientee`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `fk_vendap` (`id_vendap`),
  ADD KEY `fk_produtop` (`id_produtop`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`);

--
-- Indexes for table `telefones`
--
ALTER TABLE `telefones`
  ADD PRIMARY KEY (`id_tel`),
  ADD KEY `fk_clientetel` (`id_clientet`);

--
-- Indexes for table `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `fk_clientev` (`id_clientev`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id_carrinho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `telefones`
--
ALTER TABLE `telefones`
  MODIFY `id_tel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `fk_produtoc` FOREIGN KEY (`id_produtoc`) REFERENCES `produtos` (`id_produto`);

--
-- Limitadores para a tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `fk_clientee` FOREIGN KEY (`id_clientee`) REFERENCES `clientes` (`id_cliente`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_produtop` FOREIGN KEY (`id_produtop`) REFERENCES `produtos` (`id_produto`),
  ADD CONSTRAINT `fk_vendap` FOREIGN KEY (`id_vendap`) REFERENCES `vendas` (`id_venda`);

--
-- Limitadores para a tabela `telefones`
--
ALTER TABLE `telefones`
  ADD CONSTRAINT `fk_clientetel` FOREIGN KEY (`id_clientet`) REFERENCES `clientes` (`id_cliente`);

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `fk_clientev` FOREIGN KEY (`id_clientev`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
