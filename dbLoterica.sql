-- Apagar banco de dados
drop database dbLoterica;
-- Criar banco de dados
create database dbLoterica;
-- Entrar no banco de dados
use dbLoterica;
-- Mostrar o banco de dados
show databases;
-- Criando tabelas
create table tbJogos(
codJogo int,
nome varchar(50),
dataEnt date,
valor decimal(9,2)
);
-- Visualizar as tabelas
show tables;
-- Visualizar a estrutura da tabela
desc tbJogos;
-- Inserindo registros na tabela
insert into tbJogos(codJogo,nome,dataEnt,valor)values(1,'Mega-Sena','2023/08/01',5.00);
insert into tbJogos(codJogo,nome,dataEnt,valor)values(2,'Quina','2023/08/01',2.50);
insert into tbJogos(codJogo,nome,dataEnt,valor)values(3,'Lotofácil','2023/08/01',3.00);
insert into tbJogos(codJogo,nome,dataEnt,valor)values(4,'Lotomania','2023/08/01',3.00);
insert into tbJogos(codJogo,nome,dataEnt,valor)values(5,'Dupla Sena','2023/08/01',5.00);
insert into tbJogos(codJogo,nome,dataEnt,valor)values(6,'Timemania','2023/08/01',3.50);
insert into tbJogos(codJogo,nome,dataEnt,valor)values(7,'Dia de sorte','2023/08/01',2.50);
insert into tbJogos(codJogo,nome,dataEnt,valor)values(8,'Super sete','2023/08/01',2.50);
insert into tbJogos(codJogo,nome,dataEnt,valor)values(9,'+Milionária','2023/08/01',6.00);
insert into tbJogos(codJogo,nome,dataEnt,valor)values(10,'Federal','2023/08/01',4.50);
-- Visualizar os registros inseridos na tabela
select * from tbJogos;
-- Alterando os registros da tabela
update tbJogos set nome = 'Loteca', valor = 3.00 where codJogo = 10;
update tbJogos set nome = 'Mega da virada', valor = 4.50 where codJogo = 9;
-- Visualizar registros alterados
select * from tbJogos;
-- Apagar registros da tabela
delete from tbJogos where codJogo = 9;
delete from tbJogos where codJogo = 10;
delete from tbJogos where codJogo = 8;
-- Visualizar registros apagados
select * from tbJogos;