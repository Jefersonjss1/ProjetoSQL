drop database dbLojaABC;

create database dbLojaABC;

use dbLojaABC;

create table tbFuncionarios(
    cod_func int not null auto_increment,
    nome varchar(100),
    email varchar(100),
    cpf char(14) unique,
    d_nasc date,
    endereco varchar(100),
    cep char(9),
    numero char(10),
    bairro varchar(100),
    estado char(2),
    cidade varchar(100),

    primary key(cod_func)
);

-- insert into tbFuncionarios(nome,email,cpf,d_nasc,endereco,cep,numero,bairro,estado,cidade) values ();

-- Busca por código
select * from tbFuncionarios where cod_func = 1;
-- Busca por nome
select * from tbFuncionarios where nome like '%j%';
-- Inserir um campo de código não existente
select cod_func+1 from tbFuncionarios order by cod_func desc;
-- Buscar funcionários
select * from tbFuncionarios where nome = "@nome";