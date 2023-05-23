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


create table exemploDieta(
idDieta int primary key auto_increment,
tipo varchar(45),
 constraint chkTipodieta check (tipo in('Emagrecimento','Manutenção de peso','Proteica' )),
descrição varchar(500)
)auto_increment = 111;

insert exemploDieta value
(null,'Emagrecimento','Dicas de treinos e exemplos de dietas para emagrecimento '),
(null,'Manutenção de peso','Dicas de treinos e exemplos de dietas para ganho de massa magra'),
(null,'Proteica','Dicas de treinos e exemplos de dietas para hipertrofia');

create table cadastro(
idConta int primary key auto_increment,
apelido varchar(45),
pesoAtual float,
email varchar(45),
senha varchar(30),
fkusuario int,
constraint fkdependente foreign key (fkusuario) references
usuario(idUsuario),
constraint fkExDieta foreign key (fkDieta) references
exemploDieta(idDieta)
)auto_increment=11;

insert into cadastro value
(null,'Aninha','78,4','aninha@gmail.com','ajsjhgdg',1,111),
(null,'Gigi','60,5','Gih@outlook.com','jfknjvbh',2,112),
(null,'Regina','65,2','alice.R@hotmail.com','sjnbdhhv',3,113);

select * from usuario;
select * from exemploDieta;
select * from cadastro;
select * from cadastro join exemploDieta on idDieta = fkDieta;





