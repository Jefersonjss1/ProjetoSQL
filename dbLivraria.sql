-- Apagar banco de dados
drop database dbLivraria;
-- Criar banco de dados
create database dbLivraria;
-- Acessar banco de dados
use dbLivraria;
-- Criar tabelas
create table tbGenero(
idGenero int not null auto_increment,
descricao varchar(100),
primary key(idGenero)
);
create table tbAutor(
idAutor int not null auto_increment,
nome varchar(100) not null unique,
email varchar(100),
primary key(idAutor)
);
create table tbCliente(
idCliente int not null auto_increment,
nome varchar(100) not null,
telefone varchar(45),
primary key(idCliente)
);
create table tbLivro(
idLivro int not null auto_increment,
idGenero int not null,
titulo varchar(100),
preco float not null default 0 check(preco >= 0),
estoque int not null default 0 check(estoque >= 0),
primary key(idLivro),
foreign key(idGenero) references tbGenero(idGenero)
); 
create table tbVenda(
idVenda int not null auto_increment,
idCliente int not null,
data date,
total float not null check(total >= 0),
primary key(idVenda),
foreign key(idCliente) references tbCliente(idCliente)
);
create table tbItensDaVenda(
idVenda int not null,
idLivro int not null,
qtd int not null default 0 check(qtd >= 0),
subtotal varchar(45),
foreign key(idVenda) references tbVenda(idVenda),
foreign key(idLivro) references tbLivro(idLivro)
);
create table tbEscreve(
idLivro int not null,
idAutor int not null,
foreign key(idLivro) references tbLivro(idLivro),
foreign key(idAutor) references tbAutor(idAutor)
);

-- Insert tabela Autor

insert into tbAutor(nome,email)values('William Shakespeare','shakespeare21@gmail.com');
insert into tbAutor(nome,email)values('Jane Austen','janeaus32@gmail.com');
insert into tbAutor(nome,email)values('George Orwell','orwegeorge123@hotmail.com');
insert into tbAutor(nome,email)values('Joanne Rowling','jkrowling@hotmail.com');
insert into tbAutor(nome,email)values('Gabriel García Márquez','gagamarques@hotmail.com');
insert into tbAutor(nome,email)values('Harper Lee','harperlee029@gmail.com');
insert into tbAutor(nome,email)values('Stephen King','kingstephen@hotmail.com');
insert into tbAutor(nome,email)values('Agatha Christie','agathacris368@gmail.com');
insert into tbAutor(nome,email)values('John Ronald Reueul','johnroeueu@gmail.com');
insert into tbAutor(nome,email)values('Ernest Hemingway','ernestheming@gmail.com');
update tbAutor set nome = 'Jeferson Araujo', email = 'jajinho11@gmail.com' where idAutor = 1;
update tbAutor set nome = 'Jhonatan Machado', email = 'jhonatanmachadinho321@gmail.com' where idAutor = 2;
update tbAutor set nome = 'Ryan Cavalcanti', email = 'ryancalvacanti2099@gmail.com' where idAutor = 3;
update tbAutor set nome = 'Alan Sampaio', email = 'sampalan613@gmail.com' where idAutor = 4;
update tbAutor set nome = 'Rodrigo Pires', email = 'rodrigolartilheiro07@gmail.com' where idAutor = 5;
delete from tbAutor where idAutor = 6;
delete from tbAutor where idAutor = 7;
delete from tbAutor where idAutor = 8;
delete from tbAutor where idAutor = 9;
delete from tbAutor where idAutor = 10;

-- Insert tabela Generos

insert into tbGenero(descricao)values('Ficção Científica');
insert into tbGenero(descricao)values('Fantasia');
insert into tbGenero(descricao)values('Romance');
insert into tbGenero(descricao)values('Mistério');
insert into tbGenero(descricao)values('Suspense');
insert into tbGenero(descricao)values('Horror');
insert into tbGenero(descricao)values('Aventura');
insert into tbGenero(descricao)values('Histórico');
insert into tbGenero(descricao)values('Realismo Social');
insert into tbGenero(descricao)values('Poesia');
update tbGenero set descricao = 'Humor' where idGenero = 1;
update tbGenero set descricao = 'Drama' where idGenero = 2;
update tbGenero set descricao = 'Biografia' where idGenero = 3;
update tbGenero set descricao = 'Ensaio' where idGenero = 4;
update tbGenero set descricao = 'Fábula' where idGenero = 5;
delete from tbGenero where idGenero = 6;
delete from tbGenero where idGenero = 7;
delete from tbGenero where idGenero = 8;
delete from tbGenero where idGenero = 9;
delete from tbGenero where idGenero = 10;

-- Insert tabela Cliente

insert into tbCliente(nome,telefone)values('Jeferson Araujo','99494-6150');
insert into tbCliente(nome,telefone)values('Ryan Cavalcanti','95841-9638');
insert into tbCliente(nome,telefone)values('Jhonatan Machado','98641-8563');
insert into tbCliente(nome,telefone)values('Alan Sampaio','97824-8153');
insert into tbCliente(nome,telefone)values('Rodrigo Pires','97832-8543');
insert into tbCliente(nome,telefone)values('Erick Henrique','97131-8519');
insert into tbCliente(nome,telefone)values('Jefferson Santana','98741-9524');
insert into tbCliente(nome,telefone)values('Marcos Barros','98542-8536');
insert into tbCliente(nome,telefone)values('Laercio Silva','95813-8426');
insert into tbCliente(nome,telefone)values('Rodolfo Silva','95813-8534');
update tbCliente set telefone = '95183-5381' where idCliente = 1;
update tbCliente set telefone = '98231-8542' where idCliente = 2;
update tbCliente set telefone = '98462-6824' where idCliente = 3;
update tbCliente set telefone = '99422-2458' where idCliente = 4;
update tbCliente set telefone = '98356-4637' where idCliente = 5;
delete from tbCliente where idCliente = 6;
delete from tbCliente where idCliente = 7;
delete from tbCliente where idCliente = 8;
delete from tbCliente where idCliente = 9;
delete from tbCliente where idCliente = 10;

-- Insert tabela Livro

insert into tbLivro(idGenero,titulo,preco,estoque)values(1,'Romeu e Julieta',29.69,10);
insert into tbLivro(idGenero,titulo,preco,estoque)values(2,'Orgulho e Preconceito',59.82,325);
insert into tbLivro(idGenero,titulo,preco,estoque)values(3,'George Orwell "1984"',9.25,139);
insert into tbLivro(idGenero,titulo,preco,estoque)values(4,'Harry Potter e a Pedra Filosofal',36.67,910);
insert into tbLivro(idGenero,titulo,preco,estoque)values(5,'Cem Anos De Solidão',44.99,591);
insert into tbLivro(idGenero,titulo,preco,estoque)values(1,'O Sol É Para Todos',47.99,473);
insert into tbLivro(idGenero,titulo,preco,estoque)values(2,'O Iluminado',35.05,935);
insert into tbLivro(idGenero,titulo,preco,estoque)values(3,'Assassinato No Expresso Oriente',46.42,875);
insert into tbLivro(idGenero,titulo,preco,estoque)values(4,'O Senhor Dos Anéis A Sociedade Do Anel',39.99,853);
insert into tbLivro(idGenero,titulo,preco,estoque)values(5,'O Velho Mar',38.99,593);
update tbLivro set estoque = 1431 where idLivro = 1;
update tbLivro set estoque = 391 where idLivro = 2;
update tbLivro set estoque = 101 where idLivro = 3;
update tbLivro set estoque = 2952 where idLivro = 4;
update tbLivro set estoque = 333 where idLivro = 5;
delete from tbLivro where idLivro = 6;
delete from tbLivro where idLivro = 7;
delete from tbLivro where idLivro = 8;
delete from tbLivro where idLivro = 9;
delete from tbLivro where idLivro = 10;

-- Insert tabela Venda                    1,4,5,8,10          

insert into tbVenda(idCliente,data,total)values(1,'2023/08/22',963.13);
insert into tbVenda(idCliente,data,total)values(2,'2023/04/15',331.98);
insert into tbVenda(idCliente,data,total)values(3,'2023/06/19',91.03);
insert into tbVenda(idCliente,data,total)values(4,'2023/07/22',291.92);
insert into tbVenda(idCliente,data,total)values(5,'2023/03/21',512.52);
insert into tbVenda(idCliente,data,total)values(1,'2023/04/28',53.09);
insert into tbVenda(idCliente,data,total)values(2,'2023/08/22',493.53);
insert into tbVenda(idCliente,data,total)values(3,'2023/08/16',143.22);
insert into tbVenda(idCliente,data,total)values(4,'2023/08/13',35.99);
insert into tbVenda(idCliente,data,total)values(5,'2023/08/07',84.12);
update tbVenda set data = '2023/08/21' where idVenda = 1;
update tbVenda set data = '2023/08/11' where idVenda = 2;
update tbVenda set data = '2023/08/03' where idVenda = 3;
update tbVenda set data = '2023/08/28' where idVenda = 4;
update tbVenda set data = '2023/08/13' where idVenda = 5;
delete from tbVenda where idVenda = 6;
delete from tbVenda where idVenda = 7;
delete from tbVenda where idVenda = 8;
delete from tbVenda where idVenda = 9;
delete from tbVenda where idVenda = 10;

-- Insert tabela ItensDaVenda 1,3,7,8,2  7,9,10,4,5

insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(1,1,100,410.44);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(2,2,33,310.92);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(3,3,51,510.92);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(4,4,10,291.00);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(5,5,55,593.82);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(1,1,12,131.22);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(2,2,51,610.99);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(3,3,22,219.91);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(4,4,21,311.99);
insert into tbItensDaVenda(idVenda,idLivro,qtd,subtotal)values(5,5,13,125.95);
update tbItensDaVenda set subtotal = 515.91 where idVenda = 1;
update tbItensDaVenda set subtotal = 313.12 where idVenda = 2;
update tbItensDaVenda set subtotal = 712.78 where idVenda = 3;
update tbItensDaVenda set subtotal = 127.47 where idVenda = 4;
update tbItensDaVenda set subtotal = 834.12 where idVenda = 5;
delete from tbItensDaVenda where idVenda = 6;
delete from tbItensDaVenda where idVenda = 7;
delete from tbItensDaVenda where idVenda = 8;
delete from tbItensDaVenda where idVenda = 9;
delete from tbItensDaVenda where idVenda = 10;

-- Insert tabela Escreve

insert into tbEscreve(idLivro,idAutor)values(1,1);
insert into tbEscreve(idLivro,idAutor)values(2,2);
insert into tbEscreve(idLivro,idAutor)values(3,3);
insert into tbEscreve(idLivro,idAutor)values(4,4);
insert into tbEscreve(idLivro,idAutor)values(5,5);
insert into tbEscreve(idLivro,idAutor)values(1,1);
insert into tbEscreve(idLivro,idAutor)values(2,2);
insert into tbEscreve(idLivro,idAutor)values(3,3);
insert into tbEscreve(idLivro,idAutor)values(4,4);
insert into tbEscreve(idLivro,idAutor)values(5,5);
update tbEscreve set idAutor = 1 where idLivro = 1;
update tbEscreve set idAutor = 2 where idLivro = 2;
update tbEscreve set idAutor = 3 where idLivro = 3;
update tbEscreve set idAutor = 4 where idLivro = 4;
update tbEscreve set idAutor = 5 where idLivro = 5;
delete from tbEscreve where idLivro = 6;
delete from tbEscreve where idLivro = 7;
delete from tbEscreve where idLivro = 8;
delete from tbEscreve where idLivro = 9;
delete from tbEscreve where idLivro = 10;




select descricao as 'Generos' from tbGenero;
select * from tbAutor;
select * from tbCliente;
select * from tbLivro;
select * from tbVenda;
select * from tbItensDaVenda;
select * from tbEscreve;