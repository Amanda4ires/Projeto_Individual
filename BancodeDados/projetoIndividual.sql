create database projetoIndividual;
use projetoIndividual;
create table usuario(
idUsuario int primary key auto_increment,
nomeCompleto varchar (45),
celular char (11),
email varchar(45),
senha varchar(30)
); 
insert into usuario values 
(null,'Ana Beatriz Aires Pereira', '11940987546'),
(null,'Giovanna Cirineu Amaro' ,'11934265187'),
(null,'Alice Regina Zacarias','11965342987');

create table contaUsuario(
idConta int primary key auto_increment,
apelido varchar(45),
email varchar(45),
senha varchar(30));

insert into contaUsuario value
(null,'Aninha','aninha@gmail.com','ajsjhgdg'),
(null,'Gigi','Gih@outlook.com','jfknjvbh'),
(null,'Regina','alice.R@hotmail.com','sjnbdhhv');

create table exemploDieta(
idDieta int primary key auto_increment,
tipo varchar(45),
 constraint chkTipodieta check (tipo in('Emagrecimento','Ganho de massa','Proteica' )),
descrição varchar(500)
)auto_increment = 111;

insert exemploDieta value
(null,'Emagrecimento','Dicas de treinos e exemplos de dietas para emagrecimento '),
(null,'Ganho de massa','Dicas de treinos e exemplos de dietas para ganho de massa magra'),
(null,'Proteica','Dicas de treinos e exemplos de dietas para hipertrofia');



