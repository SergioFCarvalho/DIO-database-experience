SELECT * FROM cliente;

SELECT * FROM cliente limit 2;

SELECT 
	count(Nome)
from cliente;

select 
	count(*)
from cliente;

select * from mecanico;

select *
from mecanico
order by Nome;

select 
	Matricula as 'Cod de identificador',
    endereco as 'Domicilio'
from mecanico;

select * from valores_servico;
select 
	sum(valor_manutencao)
from valores_servico;

select 
	sum(valor_revisao)
from valores_servico;

select 
	min(valor_manutencao)
from valores_servico;

select 
	max(valor_produto)
from valores_servico;
