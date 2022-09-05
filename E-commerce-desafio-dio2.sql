-- Criação do banco de dados para cenário de E-COMMERCE
CREATE DATABASE ecommerce;
use ecommerce;

-- Criar tabelas

-- tabela clientes PF e PJ

Create table clientePF(
		idClientePF int auto_increment primary key,
		Nome varchar(10),
		Sobrenome varchar(20),
		CPF char(11) not null,
		Endereço varchar(30),
		constraint unique_cpf_cliente unique (CPF)
);

create table clientePJ(
		idClientePJ int auto_increment primary key,
		Razão_social varchar(30),
		CNPJ char(14) not null,
		Endereço varchar(30),
		Telefone varchar(20),
        constraint unique_CNPJ_cliente unique (CNPJ)
);

-- Criar tabela Prodruto
create table produto(
		idProduto int auto_increment primary key,
		Nome_produto varchar(30) not null,
		Classificacao_kids bool default false,
		categoria enum('Eletrônicos','Vestimenta','Brinquedos','Livros'),
		Avaliaçao float default 0
);

-- Criar tabela pedidos
create table pedido(
		idPedido int auto_increment primary key,
		idP_clientePF int,
		idP_ClientePJ int,
		status_pedido enum('Cancelado', 'Confirmado','Processando') default 'Processando',
		descriçcao varchar(105),
		frete float default 10,
		constraint fk_pedido_clientepf foreign key (idP_clientePF) references clientePF(idClientePF),
		constraint fk_pedido_clientepj foreign key (idP_clientePj) references clientePJ(idClientePJ)
);

-- Criar tabela pagamento -- analisar possivel adição de elementos
create table pagamento(
		idP_clientePF int,
		idP_ClientePJ int,
        idPagamento int,
        Valor float,
        tipo_pagamento enum ('Boleto','Cartão','Pix'),
        primary key (idP_clientePF, idP_ClientePJ , idPagamento)
);

-- Criar tabela Estoque
create table estoque(
		idEstoque int auto_increment primary key,
        Local_estoque varchar(45),
        Quantidade int default 0
);
-- Criar Tabela fornecedor
create table fornecedor(
		idFornecedor int auto_increment primary key,
        CNPJ char(14) not null,
		Razão_social varchar(30) not null,
        Contato varchar(11) not null,
        constraint unique_fornecedor  unique (CNPJ)
);
-- Criar tabela vendedor
create table vendedor(
		idVendedor int auto_increment primary key,
        CPF char(11),
        CNPJ char(14),
        Nome varchar(10),
		Razão_social varchar(30) not null,
        Contato varchar(11) not null,
        constraint unique_cnpj_vedendor  unique (CNPJ),
		constraint unique_cpf_vedendor  unique (CPF)
);

-- Tabela produto_vendedor -- ERRO AQUI CORRIGIR
create table produto_vendedor(
	idPvendedor int,
    idP_produto int,
    Quantidade_produtos int default 1,
    primary key (idPvendedor, idP_produto ),
    constraint fk_produto_vendedor foreign key (idPvendedor) references vendedor (idVendedor),
    constraint fk_produto_produto foreign key (idP_produto) references produto (idProduto)
);

-- Tabela produto_pedido
create table produto_pedido(
	idPropedido int,
    idPpedido int,
    Quantidade_produtos int default 1,
    status_produto enum ('Disponivel','Sem Estoque') default 'Disponivel',
    primary key (idPropedido , idPpedido  ),
    constraint fk_produto_pedido foreign key (idPropedido) references  produto (idProduto),
    constraint fk_produto_Ppedido foreign key (idPpedido) references pedido (idPedido)
);
-- Tabela estoque_produto
create table produto_estoque(
		idestoque_produto int,
        idpeEstoque int,
        localizacao varchar(255) not null,
        primary key (idestoque_produto, idpeEstoque),
		constraint fk_estoque_produto foreign key (idestoque_produto) references  produto (idProduto),
		constraint fk_produto_estoque foreign key (idpeEstoque) references estoque (idEstoque)
);
-- tabela produto_fornecedor
create table produto_fornecedor(
		idprod_fornecedor int,
        idProFornecedor int,
        quantidade int not null,
        primary key (idprod_fornecedor, idProFornecedor),
		constraint fk_fornecedor_prod foreign key (idprod_fornecedor) references fornecedor (idFornecedor),
		constraint fk_produto_Ffornecedor foreign key ( idProFornecedor ) references produto (idProduto)
);