create database projetoIndividual;

use projetoIndividual;
create table usuario(
idUsuario int primary key auto_increment,
nomeCompleto varchar (45),
dtNasc date, 
celular char (11),
emailPessoal varchar(45)
); 
insert into usuario values 
(null,'Ana Beatriz Aires Pereira', '11940987546','ana.pereira@gmail.com'),
(null,'Giovanna Cirineu Amaro' ,'11934265187','giovanna.amaro@gmail.com'),
(null,'Alice Regina Zacarias','11965342987','alice.zacarias@gmail.com');

create table cadastro(
idConta int primary key auto_increment,
apelido varchar(45),
pesoAtual float,
email varchar(45),
senha varchar(30),
fksuario int,
constraint fkdependente foreign key (fkUsuario) references
usuario(idUsuario),
constraint fkExDieta foreign key (fkDieta) references
exemploDieta(idDieta)
);

insert into cadastro value
(null,'Aninha','78,4','aninha@gmail.com','ajsjhgdg'),
(null,'Gigi','60,5','Gih@outlook.com','jfknjvbh'),
(null,'Regina','65,2','alice.R@hotmail.com','sjnbdhhv');

create table exemploDieta(
idDieta int primary key auto_increment,
tipo varchar(45),
 constraint chkTipodieta check (tipo in('Emagrecimento','Ganho de massa','Proteica' )),
descrição varchar(500)
)auto_increment = 111;

insert exemploDieta value
(null,'Emagrecimento','Dicas de treinos e exemplos de dietas para emagrecimento '),
(null,'manutenção de peso','Dicas de treinos e exemplos de dietas para ganho de massa magra'),
(null,'Proteica','Dicas de treinos e exemplos de dietas para hipertrofia');



