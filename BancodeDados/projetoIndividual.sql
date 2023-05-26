create database projetoIndividual;


use projetoIndividual;
create table usuario(
idUsuario int primary key auto_increment,
nomeCompleto varchar (45),
dtNasc date, 
celular char (11)

); 
insert into usuario values 
(null,'Ana Beatriz Aires Pereira','2002-10-14', '11940987546'),
(null,'Giovanna Cirineu Amaro' ,'2001-09-13','11934265187'),
(null,'Alice Regina Zacarias','2000-08-12','11965342987');


create table meta(
idMEta int primary key auto_increment,
tipo varchar(45),
 constraint chkTipodieta check (tipo in('Emagrecimento','Manutenção de peso','Hípertrofia' )),
descrição varchar(500)
)auto_increment = 111;

insert meta value
(null,'Emagrecimento','Dicas de treinos e exemplos de dietas para emagrecimento '),
(null,'Manutenção de peso','Dicas de treinos e exemplos de dietas para ganho de massa magra'),
(null,'Hípertrofia','Dicas de treinos e exemplos de dietas para hipertrofia');

create table cadastro(
idConta int primary key auto_increment,
apelido varchar(45),
pesoAtual float,
email varchar(45),
senha varchar(30),
fkusuario int,
constraint fkdependente foreign key (fkusuario) references
usuario(idUsuario),
constraint fkmetaUsuario foreign key (fkMeta) references
meta(idMeta)
)auto_increment=11;

insert into cadastro value
(null,'Aninha','aninha@gmail.com','ajsjhgdg',1,111),
(null,'Gigi','Gih@outlook.com','jfknjvbh',2,112),
(null,'Regina','alice.R@hotmail.com','sjnbdhhv',3,113);
create table peso( 
idPeso int auto_increment ,
kg float,
dtPeso date,
fkCadastro int,
constraint fkassociativa foreign key(fkCadastro) references
cadastro(idConta),
constraint primary key (idPeso, fkCadastro,dtPeso)
) auto_increment=1111;

insert into peso values
(null,67.1,'2023-05-25',11),
(null,57,'2023-05-25',12),
(null,60,'2023-05-25',13);   

select * from usuario;
select * from meta;
select * from cadastro;
select * from peso;
select * from cadastro join exemploDieta on idDieta = fkDieta;





