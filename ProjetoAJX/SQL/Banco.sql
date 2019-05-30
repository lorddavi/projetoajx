CREATE DATABASE IF NOT EXISTS projetoajx;

USE projetoajx;

CREATE TABLE clientes (
	id_cliente int not null auto_increment,
    nome_cliente varchar(50) not null,
    email_cliente varchar(50),
    cpf_cliente varchar(15) not null,
    PRIMARY KEY (id_cliente)
)Engine = InnoDB;

CREATE TABLE telefones (
	id_tel int not null auto_increment,
    num_tel varchar(14) not null,
    id_clientet int not null,
    PRIMARY KEY (id_tel)
)Engine = InnoDB;

CREATE TABLE produtos (
	id_produto int not null auto_increment,
    codigo_produto varchar(10) not null,
    nome_produto varchar(30) not null,
    qtd_produto int,
    valor_produto double,
    PRIMARY KEY (id_produto)
)Engine = InnoDB;

CREATE TABLE vendas (
	id_venda int not null auto_increment,
    data_venda date not null,
    valor_venda float not null,
    id_clientev int, 
    PRIMARY KEY (id_venda)
)Engine = InnoDB;

CREATE TABLE carrinho (
	id_carrinho int not null auto_increment,
    valor_produtos float not null,
	id_qtdc int not null,
    id_produtoc int not null,
    PRIMARY KEY (id_carrinho)
)Engine = InnoDB;

CREATE TABLE pedido (
	id_pedido int not null auto_increment,
    id_vendap int not null,
    id_produtop int not null,
    id_qtdp int not null,
    PRIMARY KEY (id_pedido)
)Engine = InnoDB;

CREATE TABLE enderecos (
	id_endereco int not null auto_increment,
    rua_endereco varchar(60) not null,
    num_endereco varchar(6) not null,
    bairro_endereco varchar(60) not null,
    cidade_endereco varchar(40) not null,
    cep_endereco varchar(15) not null,
    uf_endereco varchar(2) not null,
    id_clientee int not null,
    PRIMARY KEY (id_endereco)
)Engine = InnoDB;
    
    
ALTER TABLE telefones ADD CONSTRAINT fk_clientetel FOREIGN KEY (id_clientet) REFERENCES clientes (id_cliente);
ALTER TABLE enderecos ADD CONSTRAINT fk_clientee FOREIGN KEY (id_clientee) REFERENCES clientes (id_cliente);
ALTER TABLE pedido ADD CONSTRAINT fk_vendap FOREIGN KEY (id_vendap) REFERENCES vendas (id_venda);
ALTER TABLE pedido ADD CONSTRAINT fk_produtop FOREIGN KEY (id_produtop) REFERENCES produtos (id_produto);
ALTER TABLE vendas ADD CONSTRAINT fk_clientev FOREIGN KEY (id_clientev) REFERENCES clientes (id_cliente);
ALTER TABLE carrinho ADD CONSTRAINT fk_produtoc FOREIGN KEY (id_produtoc) REFERENCES produtos (id_produto);

select * from enderecos;
select * from clientes;
select * from telefones;
select * from carrinho;
select * from vendas;
select * from pedido;
select * from produtos;
