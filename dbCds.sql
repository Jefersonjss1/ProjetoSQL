-- Apagar banco de dados
drop database dbCds;
--Criar banco de dados
create database dbCds;
-- Acessar o banco de dados
use dbCds;
-- Criando tabelas
-- Tabela Artistas
create table tbArtistas(
codArt int not null auto_increment,
nomeArt varchar(100) not null unique,
primary key(codArt)    
);
-- Tabela Gravadoras
create table tbGravadoras(
codGrav int not null auto_increment,
nomeGrav varchar(50) not null unique,
primary key(codGrav)
);
-- Tabela Categorias
create table tbCategorias(
codCat int not null auto_increment,
nomeCat varchar(50) not null unique,
primary key(codCat)
);
-- Tabela Estados
create table tbEstados(
siglaEst char(2) not null,
nomeEst varchar(50) not null unique,
primary key(siglaEst)
);
-- Tabela Cidades
create table tbCidades(
codCid int not null auto_increment,
siglaEst char(2) not null,
nomeCid varchar(50) not null,
primary key(codCid),
foreign key(siglaEst) references tbEstados(siglaEst)
);
-- Tabela Clientes
create table tbClientes(
codCli int not null auto_increment,
codCid int not null,
nomeCli varchar(50) not null,
endCli varchar(100) not null,
rendaCli decimal(9,2) not null default 0 check(rendaCli >= 0),
sexoCli char(1) not null default 'F' check(sexoCli in('F','M')),
primary key(codCli),
foreign key(codCid) references tbCidades(codCid)
);
-- Tabela Conjuge
create table tbConjuge(
codConj int not null auto_increment,
codCli int not null,
nomeConj varchar(50) not null,
rendaConj decimal(9,2) not null default 0 check(rendaConj >= 0),
sexoConj char(1) not null default 'F' check(sexoConj in('F','M')),
primary key(codConj),
foreign key(codCli) references tbClientes(codCli)
);
-- Tabela Funcionários
create table tbFuncionarios(
codFunc int not null auto_increment,
nomeFunc varchar(50) not null,
endFunc varchar(100) not null,
salFunc decimal(9,2) not null default 0 check(salFunc >= 0),
sexoFunc char(1) not null default 'F' check(sexoFunc in('F','M')),
primary key(codFunc)
);
-- Tabela Dependentes
create table tbDepedentes(
codDep int not null auto_increment,
codFunc int not null,
nomeDep varchar(100) not null,
sexoDep char(1) not null default 'F' check(sexoDep in('F', 'M')),
primary key(codDep),
foreign key(codFunc) references tbFuncionarios(codFunc)
);
-- Tabela Titulos
create table tbTitulos(
codTit int not null auto_increment,
codCat int not null,
codGrav int not null,
nomeCD varchar(50) not null unique,
valCd decimal(9,2) not null check(valCd > 0),
qtdEstq int not null check(qtdEstq >= 0),
primary key(codTit),
foreign key(codCat) references tbCategorias(codCat),
foreign key(codGrav) references tbGravadoras(codGrav)
);
-- Tabela Pedidos
create table tbPedidos(
numPed int not null auto_increment,
codCli int not null,
codFunc int not null,
dataPed datetime not null,
valPed decimal(9,2) not null default 0 check(valPed >= 0),
primary key(numPed),
foreign key(codCli) references tbClientes(codCli),
foreign key(codFunc) references tbFuncionarios(codFunc)
);
-- Tabela TitulosPedidos
create table tbTitulosPedidos(
numPed int not null,
codTit int not null,
qtdCd int not null check(qtdCd >= 1),
valCd decimal(9,2) not null check(valCd > 0),
foreign key(numPed) references tbPedidos(numPed),
foreign key(codTit) references tbTitulos(codTit)
);
-- Tabela TitulosArtista
create table tbTitulosArtista(
codTit int not null auto_increment,
codArt int not null,
foreign key(codTit) references tbTitulos(codTit),
foreign key(codArt) references tbArtistas(codArt)
);

-- Inserindo registros

insert into tbArtistas(nomeArt)values('Marisa Monte');
insert into tbArtistas(nomeArt)values('Gilberto Gil');
insert into tbArtistas(nomeArt)values('Caetano Veloso');
insert into tbArtistas(nomeArt)values('Milton Nascimento');
insert into tbArtistas(nomeArt)values('Legião Urbana');
insert into tbArtistas(nomeArt)values('The Beatles');
insert into tbArtistas(nomeArt)values('Rita Lee');
select * from tbArtistas order by codArt;

insert into tbGravadoras(nomeGrav)values('Polygram');
insert into tbGravadoras(nomeGrav)values('Emi');
insert into tbGravadoras(nomeGrav)values('Som Livre');
insert into tbGravadoras(nomeGrav)values('Som Music');
select * from tbGravadoras order by codGrav;

insert into tbCategorias(nomeCat)values('MPB');
insert into tbCategorias(nomeCat)values('Trilha Sonora');
insert into tbCategorias(nomeCat)values('Rock Internacional');
insert into tbCategorias(nomeCat)values('Rock Nacional');
select * from tbCategorias order by codCat;


insert into tbEstados(siglaEst,nomeEst)values('SP','São Paulo');
insert into tbEstados(siglaEst,nomeEst)values('ES','Cachoeira do Itapemirim');
insert into tbEstados(siglaEst,nomeEst)values('MG','Minas Gerais');
insert into tbEstados(siglaEst,nomeEst)values('RJ','Rio de Janeiro');
select * from tbEstados;


insert into tbCidades(siglaEst,nomeCid)values('SP','São Paulo');
insert into tbCidades(siglaEst,nomeCid)values('SP','Sorocaba');
insert into tbCidades(siglaEst,nomeCid)values('SP','Jundiaí');
insert into tbCidades(siglaEst,nomeCid)values('SP','Americana');
insert into tbCidades(siglaEst,nomeCid)values('SP','Araraquara');
insert into tbCidades(siglaEst,nomeCid)values('MG','Ouro Preto');
insert into tbCidades(siglaEst,nomeCid)values('ES','Cachoeira do Itapemirim');
select * from tbCidades order by codCid;

insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli)values(1,'José Nogueira','Rua A',1500.00,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli)values(1,'Ângelo Pereira','Rua B',2000.00,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli)values(1,'Além Mar Paranhos','Rua C',1500.00,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli)values(1,'Catarina Souza','Rua D',892.00,'F');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli)values(1,'Vagner Costa','Rua E',950.00,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli)values(2,'Antenor da Costa','Rua F',1582.00,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli)values(2,'Maria Amélia de Souza','Rua G',1152.00,'F');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli)values(2,'Paulo Roberto Silva','Rua H',3250.00,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli)values(3,'Fátima Souza','Rua I',1632.00,'F');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli)values(3,'Joel da Rocha','Rua J',2000,'M');
select * from tbClientes order by codCli;

insert into tbConjuge(codCli,nomeConj,rendaConj,sexoConj)values(1,'Carla Nogueira',2500.00,'F');
insert into tbConjuge(codCli,nomeConj,rendaConj,sexoConj)values(2,'Emilia Pereira',5500.00,'F');
insert into tbConjuge(codCli,nomeConj,rendaConj,sexoConj)values(6,'Altiva da Costa',3000.00,'F');
insert into tbConjuge(codCli,nomeConj,rendaConj,sexoConj)values(7,'Carlos de Souza',3250.00,'M');
select * from tbConjuge order by codConj;

insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc)values('Vânia Gabriela Pereira','Rua A',2500.00,'F');
insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc)values('Norberto Pereira da Silva','Rua B',300.00,'M');
insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc)values('Olavo Linhares','Rua C',580.00,'M');
insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc)values('Paula da Silva','Rua D',3000.00,'F');
insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc)values('Rolando Rocha','Rua E',2000.00,'M');
select * from tbFuncionarios order by codFunc;

insert into tbDepedentes(codFunc,nomeDep,sexoDep)values(1,'Ana Pereira','F');
insert into tbDepedentes(codFunc,nomeDep,sexoDep)values(1,'Roberto Pereira','M');
insert into tbDepedentes(codFunc,nomeDep,sexoDep)values(1,'Celso Pereira','M');
insert into tbDepedentes(codFunc,nomeDep,sexoDep)values(3,'Brisa Linhares','F');
insert into tbDepedentes(codFunc,nomeDep,sexoDep)values(3,'Mari Sol Linhares','F');
insert into tbDepedentes(codFunc,nomeDep,sexoDep)values(4,'Sonia da Silva','F');
select * from tbDepedentes order by codDep;

insert into tbTitulos(codCat,codGrav,nomeCD,valCd,qtdEstq)values(1,1,'Tribalista',30.00,1500);
insert into tbTitulos(codCat,codGrav,nomeCD,valCd,qtdEstq)values(1,2,'Tropicália',50.00,500);
insert into tbTitulos(codCat,codGrav,nomeCD,valCd,qtdEstq)values(1,1,'Aquele Abraço',50.00,600);
insert into tbTitulos(codCat,codGrav,nomeCD,valCd,qtdEstq)values(1,2,'Refazenda',60.00,1000);
insert into tbTitulos(codCat,codGrav,nomeCD,valCd,qtdEstq)values(1,3,'Totalmente Demais',50.00,2000);
insert into tbTitulos(codCat,codGrav,nomeCD,valCd,qtdEstq)values(1,3,'Travessia',55.00,500);
insert into tbTitulos(codCat,codGrav,nomeCD,valCd,qtdEstq)values(1,2,'Courage',30.00,200);
insert into tbTitulos(codCat,codGrav,nomeCD,valCd,qtdEstq)values(4,3,'Legião Urbana',20.00,100);
insert into tbTitulos(codCat,codGrav,nomeCD,valCd,qtdEstq)values(3,2,'The Beatles',30.00,300);
insert into tbTitulos(codCat,codGrav,nomeCD,valCd,qtdEstq)values(4,1,'Rita Lee',30.00,500);
select * from tbTitulos order by codTit;

insert into tbPedidos(codCli,codFunc,dataPed,valPed)values(1,2,'02/05/02',1500.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed)values(3,4,'02/05/02',50.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed)values(4,5,'02/06/02',100.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed)values(1,4,'02/02/03',200.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed)values(7,5,'02/03/03',300.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed)values(4,4,'02/03/03',100.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed)values(5,5,'02/03/03',50.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed)values(8,2,'02/03/03',50.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed)values(2,2,'02/03/03',2000.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed)values(7,1,'02/03/03',3000.00);
select * from tbPedidos order by numPed;

insert into tbTitulosArtista(codArt)values(1);
insert into tbTitulosArtista(codArt)values(2);
insert into tbTitulosArtista(codArt)values(2);
insert into tbTitulosArtista(codArt)values(2);
insert into tbTitulosArtista(codArt)values(3);
insert into tbTitulosArtista(codArt)values(4);
insert into tbTitulosArtista(codArt)values(4);
insert into tbTitulosArtista(codArt)values(5);
insert into tbTitulosArtista(codArt)values(6);
insert into tbTitulosArtista(codArt)values(7);
select * from tbTitulosArtista order by codTit;

insert into tbTitulosPedidos(numPed,codTit,qtdCd,valCd)values(1,1,2,30.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCd,valCd)values(1,2,3,20.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCd,valCd)values(2,1,1,50.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCd,valCd)values(2,2,3,30.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCd,valCd)values(3,1,2,40.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCd,valCd)values(4,2,3,20.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCd,valCd)values(5,1,2,25.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCd,valCd)values(6,2,3,30.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCd,valCd)values(6,3,1,35.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCd,valCd)values(7,4,2,55.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCd,valCd)values(8,1,4,60.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCd,valCd)values(9,2,3,15.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCd,valCd)values(10,7,2,15.00);
select * from tbTitulosPedidos order by numPed;