-- Apagar banco de dados
drop database dbManicure;
-- Criar banco de dados
create database dbManicure;
-- Entrar no banco de dados
use dbManicure;
-- Mostrar o banco de dados
show databases;
-- Criando tabelas
create table tbProdutos(
codProd int,
descricao varchar(100),
quantidade decimal(9,2),
dataEntrada date,
valorUnitario decimal(9,2)
);

-- Visualizando as tabelas 
show tables;
-- Visualizando a estrutura da tabela
desc tbProdutos;
-- Inserindo registros nas tabelas -- (insert into = inserir dentro de)
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnitario)values(1,'Alicate de unha', 10,'2023/08/01',5.50);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnitario)values(2,'Algodão', 100,'2023/07/01',2.53);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnitario)values(3,'Esmalte', 25,'2023/08/01',15.00);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnitario)values(4,'Acetona', 35,'2023/07/30',3.50);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnitario)values(5,'Unha postiça', 50,'2023/07/25',9.99);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnitario)values(6,'Unha', 50,'2023/07/25',9.99);
insert into tbProdutos(codProd,descricao,quantidade,dataEntrada,valorUnitario)values(7,'postiça',50,'2023/07/25',9.99);
-- Visualizar os registros inseridos nas tabelas
select * from tbProdutos;	-- Selecionar/Entrar * Buscar em todos os valores dentro da tabela from = selecionar a tabela 
-- Alterando registros das tabelas
update tbProdutos set descricao = 'Palito de unha', valorUnitario = 1.35 where codProd = 6;
update tbProdutos set descricao = 'Mascara de proteção', valorUnitario = 2.23 where codProd = 7;
-- Visualisar os registros alterados 
select * from tbProdutos;
-- Apagar registros das tabelas
delete from tbProdutos where codProd = 7;
-- Visualisar os registros alterados
select * from tbProdutos;