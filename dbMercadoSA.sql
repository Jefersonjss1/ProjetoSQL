-- Apagar banco de dados
drop database dbMercadoSA;
-- Criar banco de dados
create database dbMercadoSA;
-- Acessar o banco de dados
use dbMercadoSA;
-- Criar tabelas
create table tbFuncionarios(
codFun int not null auto_increment, -- Campo obrigatório
nome varchar(100) not null, -- Campo obrigatório 
email varchar(100),
cpf char(14) not null unique, -- Código unico
salario decimal(9,2) default 0 check(salario >= 0), -- Se não colocarem o salário o padrão será 0
sexo char(1) default 'F' check(sexo in('F', 'M')),
primary key(codFun) -- Chave primaria
);

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCel char(10),
primary key(codCli)
);

create table tbFornecedores(
codFor int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cnpj char(18) not null unique,
primary key(codFor)
);

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(20) not null,
codFun int not null,
primary key(codUsu),
foreign key(codFun) references tbFuncionarios(codFun)
);

create table tbProdutos(
codPro int not null auto_increment,
descricao varchar(100),
dataEntrada date,
horaEntrada time,
quantidade decimal(9,2),
valorUnit decimal(9,2),
codFor int not null,
primary key(codPro),
foreign key(codFor) references tbFornecedores(codFor)
);

create table tbVendas(
codVen int not null auto_increment,
codUsu int not null,
codCli int not null,
codPro int not null,
dataVenda date,
horaVenda time,
quantidade decimal(9,2),
valorTotal decimal(9,2),
primary key(codVen),
foreign key(codUsu) references tbUsuarios(codUsu),
foreign key(codCli) references tbClientes(codCli),
foreign key(codPro) references tbProdutos(codPro)
);

desc tbVendas;
desc tbProdutos;
desc tbUsuarios;
desc tbFornecedores;
desc tbClientes;
desc tbFuncionarios;

-- Inserindo registros na tabelas

insert into tbFuncionarios(nome,email,cpf,salario,sexo)values('Giorgian De Arrascaeta
','giorgian.arrasca@hotmail.com','245.350.029-02',1500.00,'M');
insert into tbClientes(nome,email,telCel)values('Rodrigo goes','fakenatty@gmail.com','99949-4150');
insert into tbClientes(nome,email,telCel)values('Manoel gomes','canetaazul@gmail.com','99949-5410');
insert into tbFornecedores(nome,email,cnpj)values('pichau','pichau@hotmail.com','44.512.642.0001/50');
insert into tbFornecedores(nome,email,cnpj)values('terabyte','terabyte@hotmail.com','55.894.854.0001/30');
insert into tbUsuarios(nome,senha,codFun)values('giorgian.arrasca','123456',1);
insert into	tbProdutos(descricao,dataEntrada,horaEntrada,quantidade,valorUnit,codFor)values('Ryzen 5 4600g','2023/08/10','16:53:30',10,653.00,2);
insert into	tbProdutos(descricao,dataEntrada,horaEntrada,quantidade,valorUnit,codFor)values('RAM XPG 4x 8gb','2023/08/09','09:53:50',100,683.23,2);
insert into	tbProdutos(descricao,dataEntrada,horaEntrada,quantidade,valorUnit,codFor)values('Steel legend','2023/08/07','14:00:32',80,741.20,1);
insert into tbVendas(codUsu,codCli,codPro,dataVenda,quantidade,valorTotal)values(1,1,2,'2023/08/10',3,2.077);
insert into tbVendas(codUsu,codCli,codPro,dataVenda,quantidade,valorTotal)values(1,2,1,'2023/08/10',1,653.00);
insert into tbVendas(codUsu,codCli,codPro,dataVenda,quantidade,valorTotal)values(1,2,1,'2023/08/10',3,653.00);

select * from tbVendas;
select * from tbProdutos;
select * from tbUsuarios;
select * from tbFornecedores;
select * from tbClientes;
select * from tbFuncionarios;