create database rep;
use rap;
create table clientes(
    id int auto_increment primary key,
    nome varchar(100) not null,
    idade int
);
create table carros(
    id int auto_increment primary key,
    carro_id int,
    cliente_id int
    foreigh key (carro_id) references carros(id),
    foreign key (cliente_id) references clientes(id)
);

insert into carros (nome) values ('ferrari');
insert into clientes (nome) values ('Gauss');
insert into vendas (carro_id,cliente_id) values (1, 100);

select * from carros;
select * from clientes;
select * from vendas;