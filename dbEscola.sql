-- Jeferson Jesus Cardoso De Araujo
drop database dbEscola;
-- Criando banco de dados
create database dbEscola;
-- Acessando o banco de dados
use dbEscola;
-- Visualizar o bando de dados
show databases;
-- Criando tabelas
create table tbTurma(
id int,
quantidade_alunos int,
horario_aula datetime,
duracao_aula datetime,
data_inicio date,
data_fim date,
atividade int,
id_instrutor int,
id_monitor int
);
create table tbAluno(
matricula int,
data_matricula date,
nome varchar(45),
endereco varchar(45),
telefone varchar(45),
nascimento date,
altura float,
peso float,
id_turma int
);
create table tbRegistro(
id_aluno int,
id_turma int,
ausencia int,
id_registro int
);
create table tbInstrutor(
rg int,
nome varchar(45),
nascimento date,
titulacao varchar(45),
telefone varchar(45)
);
create table tbMonitor(
id_aluno int
);
create table tbAtividade(
id int,
atividade varchar(45)
);
-- Visualizar as tabelas criadas
show tables;
-- Visuzaliar a estrutura da tabela
desc tbTurma;
desc tbAluno;
desc tbRegistro;
desc tbInstrutor;
desc tbMonitor;
desc tbAtividade;