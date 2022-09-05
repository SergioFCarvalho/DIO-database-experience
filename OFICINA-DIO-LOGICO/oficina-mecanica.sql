create database oficina_mecanica;
use oficina_mecanica;

-- tabela cliente 
create table cliente(
	idcliente int primary key not null,
    Nome varchar(25) not null,
    CPF char(11) not null,
    Contato varchar(15),
    Endereço varchar(45)
);
-- tabela veículo
create table veiculo(
	idveiculo int primary key not null,
    idcliente int,
    Placa varchar(12) not null,
    Tipo varchar(15) not null,
    Marca varchar(15) not null,
    Cor varchar(15) not null,
    constraint fk_veiculo_cliente foreign key (idcliente) references cliente (idcliente)
);

-- tabela status_serviço
create table status_servico(
	idstatus int primary key not null,
    descricao varchar(45) not null
);
-- tabela serviço 
create table servico(
	idServico int not null,
    idveiculo int,
    idstatus int,
    data_inicio timestamp not null default now(),
    data_encerramento timestamp,
    primary key (idServico, idveiculo , idstatus),
    constraint fk_servico_veiculo foreign key (idveiculo ) references veiculo (idveiculo ),
    constraint fk_serviço_status foreign key ( idstatus) references status_servico ( idstatus)
);
-- tabela Mecânico
create table mecanico(
	idmecanico int primary key not null,
    cpf char(9) not null,
    Nome varchar(45) not null,
    Matricula char (6) not null,
    endereco varchar (45) not null,
    especialidade varchar (40) not null
);
-- tabela equipe mecânico
create table equipe_mecanico(
	idEquipe_mec int not null,
    idveiculo int,
    idmecanico int,
    primary key(idEquipe_mec, idveiculo, idmecanico),
    constraint fk_equipe_veiculo foreign key (idveiculo) references veiculo (idveiculo),
    constraint fk_equipe_mecanico foreign key (idmecanico) references mecanico (idmecanico)
);
-- tabela Ordem serviço
create table OS(
	idOS int primary key not null,
    idEquipe_mec int,
    idServico int,
    idstatus int,
    cod char (7) not null,
    valor float not null,
    dataemissao date not null,
    dataentrega date not null,
    constraint fk_Os_equipe foreign key (idEquipe_mec) references equipe_mecanico (idEquipe_mec),
    constraint fk_Os_servico foreign key (idServico) references servico (idServico),
    constraint fk_Os_status foreign key ( idstatus) references status_servico ( idstatus)
);
-- tabela Valores_serviço
create table valores_servico(
	idvalores_serv int primary key not null,
    idOS int,
    valor_revisao float,
    valor_manutencao float,
    valor_mdo float,
    valor_peca float,
    quantidade_peca int not null,
    valor_produto float not null,
    constraint fk_valores_OS foreign key (idOS) references Os (idOS)
);

-- tabela OS-SERVIÇO E OS-PRODUTO
create table OS_serviço(
	idOS_serv int primary key not null,
    idvalores_serv int,
	valor float not null,
    tipo varchar(45) not null,
	constraint fk_valores_OS_servico foreign key (idvalores_serv) references valores_servico (idvalores_serv)
);
create table OS_produto(
	idOS_produto int primary key not null,
    idvalores_serv int,
	valor float not null,
    tipo varchar(45) not null,
    constraint fk_valores_OS_produto foreign key (idvalores_serv) references valores_servico (idvalores_serv)
);