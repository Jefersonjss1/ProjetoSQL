-- Jeferson Jesus Cardoso De Araujo
drop database dbClinicaMedica; 
-- Criando banco de dados
create database dbClinicaMedica;
-- Acessando banco de dados
use dbClinicaMedica;
-- Visualizar o banco de dados
show databases;
-- Criando tabelas 
create table tbConsulta(
consulta int,
dt_consulta datetime,
medico_idmedico int,
paciente_idpaciente int,
receita_medica_id_Receita int
);
create table tbMedico(
id_medico int,
nm_medico varchar(45),
telefone_medico varchar(9)
);
create table tbPaciente(
id_paciente int,
nm_paciente varchar(45),
telefone_paciente varchar(9),
convenio varchar(45)
);
create table tbReceitaMedica(
id_receita_medica int,
descricao varchar(500)
);
-- Visualizar as tabelas criadas
show tables;
-- Visuzaliar a estrutura da tabela
desc tbConsulta;
desc tbMedico;
desc tbReceitaMedica;
desc tbPaciente;
