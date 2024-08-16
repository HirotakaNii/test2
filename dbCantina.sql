-- apagando banco de dados
drop database dbcantina;
--criando banco de dados
create database dbcantina;

--acessando banco de dados

use dbcantina;

--criando tabelas

create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar (100),
cpf char(14) not null unique, 
sexo char (1) default 'M' check(sexo in ('F','M')),
salario decimal (9,2) default 0 check (salario >=0) ,
nascimento date,
telCelular char(10),
primary key (codFunc));


create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCelular char(10),
primary key (codCli));

create table tbUsuarios(
codUsu int auto_increment,
nome varchar (25) not null unique,
senha varchar(10) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc));


create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cnpj char(17) not null unique,
primary key(codForn));

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int,
valor decimal(9,2),
validade date,
dataEntrada date,
horaEntrada time,
codForn int not null,
primary key(codProd),
foreign key(codForn) references tbFornecedores(codForn)
);
 
 create table tbVendas(
codVenda int not null  auto_increment,
dataVenda date,
horaVenda time,
quantidade int,
codUsu int not null,
codCli int not null,
codProd int not null,
primary key(codVenda),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codCli)references tbClientes(codCli),
foreign key(codProd)references tbProdutos(codProd)
 );

-- visualizando a estrutura das tabelas
desc tbFuncionarios;
desc tbUsuarios;
desc tbProdutos;
desc tbFornecedores;
desc tbVendas;

--inserindo dados 

insert into tbFuncionarios(nome,email,cpf,sexo,salario,nascimento,telCelular)values('Clovis Rogerio','clogerio@gmail.com','164.823.85214-97','M',1500.50,'2001/09/11','95435-5005');
	insert into tbFuncionarios(nome,email,cpf,sexo,salario,nascimento,telCelular)values('Jennifer',' Jennifer@gmail.com','165.823.85214-98','F',1500.80,'2001/09/11','92348-7488');


select * from tbFuncionarios;

insert into tbFornecedores(nome,email,cnpj)values ('Clodis','clidin@gmail.com','25.456.578.149-21');
select * from tbFornecedores;

insert into tbClientes (nome,email,telCelular)values('Violet','Violet@gmail.com','92258-7400');
select * from tbClientes;	

insert into tbClientes (nome,email,telCelular)values('Ginger','Gingian@gmail.com','92258-7488');
select * from tbClientes;	

insert into tbClientes (nome,email,telCelular)values('Jennifer','Jennifer@gmail.com','92348-7488');
select * from tbClientes;	

insert into tbUsuarios (nome,senha,codFunc)values('Clovis Rogerio','123456',1);
	select * from tbUsuarios;

insert into tbUsuarios (nome,senha,codFunc)values('Jennifer','123457',2);
	select * from tbUsuarios;

 



insert into tbProdutos (descricao,quantidade,valor,validade,dataEntrada,horaEntrada,codForn)values('mesa tijolo',20,982,'2026/12/10','2024/12/10','19:15:00',1);
select *from tbProdutos;
insert into tbVendas (dataVenda,horaVenda,quantidade,codUsu,codCli,codProd)values('2024/18/16','19:00:15',78,2,1,1);
	select * from tbVendas;

update tbProdutos set descricao ='galo de combate', valor = 78000.00

	where codProd =1;

select * from tbProdutos;
