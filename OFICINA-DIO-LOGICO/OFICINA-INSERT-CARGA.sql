


insert into cliente values  -- 1
	('1','Manuel Santiago', '13815466608', '8299201475', 'Rua Caxias sul, Barra de Jangada, PE'),
    ('2', 'Marcos felipe', '14120055502', '8186667435', 'Rua Alvorada, Barra de Jangada, PE'),
    ('3', 'Lucas Gael', '12345033307', '8188667475', 'Rua Luiz castro, Cabo, PE');
    
-- 2
insert into mecanico values  
	('1','159158033','MARCOS SANTOS','123456', 'RuA 23,RECIFE, PE','LATARIA'),
    ('2', '159951444','CARLOS SILVA','123654', 'Rua 356,RECIFE, PE','ELETRICA'),
    ('3', '145326888','JUAN MANUEL','321654', 'BOA VISTA,RECIFE, PE','MOTOR'),
    ('4', '145124333','FELIPE JORGE','332668', 'BOA VISTA,RECIFE, PE','SOM'),
    ('5', '138164548','JUAN MANUEL','321654', 'BOA VISTA,RECIFE, PE','VIDRO');
    
select * from equipe_mecanico;
insert into equipe_mecanico values -- 3
	('1','1','1'),
    ('2','2','2'),
    ('3','3','3');
    

insert into veiculo values -- 4
	('1','1','AAA2012', 'GOL','VW','CINZA'),
    ('2','2','ACV2563', 'UNO','FIAT','PRETO'),
    ('3','3','QYJ3369', 'ARGO','FIAT','BRANCA');
    

insert into status_servico values  -- 5
	('1', 'Conserto na lataria, em andamento'),
    ('2', 'Conserto no motor e parte eletrica finalizado'),
    ('3', 'Finalizando a pintura');
    

insert into os values -- 6
	('1', '1', '1', '1', '6969', '150', '2022-05-24', '2022-05-28'),
    ('2', '2', '2', '2', '1234', '200', '2022-06-15', '2022-06-22'),
    ('3', '3', '3', '3', '1322', '1000', '2022-07-06', '2022-07-13');


insert into servico values -- 7
	('1', '1', '1','2022-05-24', '2022-05-28'),
	('2', '2', '2', '2022-06-15', '2022-06-22'),
	('3', '3', '3', '2022-06-15', '2022-06-22');
    
    

insert into valores_servico values -- 8
	('1','1', '200', '150','150', '50', '95', '100'),
    ('2','2', '220', '125','155', '50', '95', '105'),
    ('3','3', '180', '150','150', '50', '95', '65');
	

insert into os_produto values -- 9
	('1', '1', '150', 'pintura'),
    ('2', '2', '200', 'troca de peça');
    

insert into os_serviço values -- 10
	('1', '1', '165', 'conserto'),
    ('2', '2', '250', 'conserto');