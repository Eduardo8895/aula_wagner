create database carrosdb;
use carrosdb;
create table cad_clis(
    id int primary key auto_increment,
    nome varchar(100) not null
);
create table cad_carros(
    id int primary key auto_increment,
    nome varchar(100) not null
    pco float
);
create table vendas(
    id int primary key auto_increment,
    cli_id int,
    carro_id int
);