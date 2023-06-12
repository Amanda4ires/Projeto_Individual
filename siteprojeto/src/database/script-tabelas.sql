-- -- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- -- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- -- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

-- /*
-- comandos para mysql - banco local - ambiente de desenvolvimento
-- */

-- create database projetoIndividual;
use projetoIndividual;

create table cadastro(
idConta int primary key auto_increment,
apelido varchar(45),
email varchar(45),
senha varchar(30),
nomeCompleto varchar (45),
dtNasc date, 
celular char (11)
)auto_increment=1;

create table meta(
idMeta int primary key auto_increment,
tipo varchar(45),
 constraint chkTipodieta check (tipo in('Emagrecimento','Manutenção de peso','Hípertrofia' )),
fkMetaUsuario int,
constraint fkMetaUsuario foreign key (fkMetaUsuario) references cadastro(idConta)
)auto_increment = 1;

create table peso( 
idPeso int auto_increment ,
kg float,
dtPeso date,
fkCadastro int,
constraint fkCadastro foreign key(fkCadastro) references cadastro(idConta),
constraint primary key (idPeso, fkCadastro,dtPeso)
) auto_increment=1;


insert into cadastro value
(null,'Aninha','aninha@gmail.com','ajsjhgdg','Ana Beatriz Aires Pereira','2002-10-14', '11940987546');

insert meta value
(null,'Emagrecimento'),
(null,'Manutenção de peso'),
(null,'Hípertrofia');


insert into peso values
(null,90.4,'2023-01-10',2),
(null,84.9,'2023-02-25',2),
(null,80.1,'2023-03-14',2),
(null,76.5,'2023-04-03',2),
(null,70.1,'2023-05-22',2);
   
select * from meta;
select * from cadastro;
select * from peso where fkCadastro = 2;
select * from meta where fkMetaUsuario = 2;
select * from cadastro join exemploDieta on idDieta = fkDieta;

-- /*
-- comando para sql server - banco remoto - ambiente de produção
-- */

-- CREATE TABLE usuario (
-- 	id INT PRIMARY KEY IDENTITY(1,1),
-- 	nome VARCHAR(50),
-- 	email VARCHAR(50),
-- 	senha VARCHAR(50),
-- );

-- CREATE TABLE aviso (
-- 	id INT PRIMARY KEY IDENTITY(1,1),
-- 	titulo VARCHAR(100),
-- 	descricao VARCHAR(150),
-- 	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
-- );

-- create table aquario (
-- /* em nossa regra de negócio, um aquario tem apenas um sensor */
-- 	id INT PRIMARY KEY IDENTITY(1,1),
-- 	descricao VARCHAR(300)
-- );

-- /* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

-- CREATE TABLE medida (
-- 	id INT PRIMARY KEY IDENTITY(1,1),
-- 	dht11_umidade DECIMAL,
-- 	dht11_temperatura DECIMAL,
-- 	luminosidade DECIMAL,
-- 	lm35_temperatura DECIMAL,
-- 	chave TINYINT,
-- 	momento DATETIME,
-- 	fk_aquario INT FOREIGN KEY REFERENCES aquario(id)
-- );

-- /*
-- comandos para criar usuário em banco de dados azure, sqlserver,
-- com permissão de insert + update + delete + select
-- */

-- CREATE USER [usuarioParaAPIWebDataViz_datawriter_datareader]
-- WITH PASSWORD = '#Gf_senhaParaAPIWebDataViz',
-- DEFAULT_SCHEMA = dbo;

-- EXEC sys.sp_addrolemember @rolename = N'db_datawriter',
-- @membername = N'usuarioParaAPIWebDataViz_datawriter_dat