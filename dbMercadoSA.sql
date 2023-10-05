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

select
 usu.nome as 'Nome do Usuário',
fun.nome as 'Nome do Funcionário',
fun.email as 'E-mail do Funcionário' 
from tbUsuarios as usu
 inner join tbFuncionarios as fun 
 on usu.codFun = fun.codFun;

select
 forn.nome as 'Nome do Produtos',
 forn.cnpj as 'CPNJ do Fornecedor',
  prod.descricao as 'Descrição do Produto'
   from tbProdutos as prod
    inner join tbFornecedores as forn 
    on prod.codFor = forn.codFor; 

select 
cli.nome as 'Nome do Cliente',
cli.email as 'E-mail do Cliente',
cli.telCel as 'Telefone do Cliente',
vend.dataVenda as 'Data da Venda',
vend.valorTotal as 'Valor da Venda' 
from tbClientes as cli
 inner join tbVendas as vend
  on cli.codCli = vend.codCli;

select cli.nome as 'Nome do Cliente',
cli.email 'E-mail do Cliente',
prod.descricao 'Descrição do Produto',
vend.dataVenda 'Data da Venda'
 from tbVendas as vend 
 inner join tbClientes as cli
 on vend.codCli = cli.codCli
 inner join tbProdutos as prod
 on vend.codPro = prod.codPro;

 select usu.nome as 'Nome do Usuário',
 func.nome as 'Nome do Funcionário',
 vend.dataVenda as 'Data da Venda',
 vend.quantidade as 'Quantidade da Venda', 								
 vend.valorTotal as 'Valor Total da Venda'
  from tbUsuarios as usu
   inner join tbFuncionarios as func
   on func.codFun = usu.codFun
   inner join tbVendas as vend 
   on vend.codUsu = usu.codUsu;


select cli.nome as 'Nome do Cliente',
vend.dataVenda as 'Data da Venda',
prod.descricao as 'Descrição do Produto',
forn.nome as 'Nome do Fornecedor' 
from tbClientes	as cli
inner join tbVendas	as vend
on vend.codCli = cli.codCli
inner join tbProdutos as prod
on vend.codPro = prod.codPro
inner join tbFornecedores as forn
on prod.codFor = forn.codFor;

select func.nome as 'Nome do Funcionário',
usu.nome as 'Nome do Usuário',
vend.dataVenda as 'Data da Venda',
vend.valorTotal as 'Valor Total da Venda',
prod.descricao as 'Descrição do Produto',
prod.dataEntrada as 'Data da Entrada do Produto',
forn.nome as 'Nome do Fornecedor',
forn.cnpj as 'CPNJ do Fornecedor'
from tbFuncionarios as func
inner join tbUsuarios as usu
on func.codFun = usu.codFun
inner join tbVendas as vend
on usu.codUsu = vend.codUsu
inner join tbProdutos as prod
on vend.codPro = prod.codPro 
inner join tbFornecedores as forn
on prod.codFor = forn.codFor;

select prod.descricao, prod.quantidade
 from tbFuncionarios as func
 left join tbProdutos as prod 
 on func.codFun = prod.codPro;

select prod.descricao, prod.quantidade
 from tbFuncionarios as func
 right join tbProdutos as prod 
 on func.codFun = prod.codPro; 