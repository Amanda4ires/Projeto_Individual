create database projetoIndividual;
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

