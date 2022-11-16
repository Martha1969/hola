
create database ProyectAutonoma;
use ProyectAutonoma;

create table usuario(
usu_id int auto_increment primary key,
usu_nombre varchar(50),
usu_doc_id varchar(15),
usu_semestre varchar(2),
usu_programa varchar(70),
usu_celular varchar(15),
usu_correo varchar(70),
usu_codigo varchar(10),
usu_facultad varchar(30));

create table rol(
rol_id int auto_increment primary key,
rol_id_usuario int,
rol_nombre varchar(20),
foreign key(rol_id_usuario) references usuario(usu_id));


CREATE TABLE perfil(
per_id INT AUTO_INCREMENT,
per_titulo VARCHAR(270) NOT NULL,
per_modalidad VARCHAR(60) NOT NULL,
per_planteamiento_problema VARCHAR(3500) NOT NULL,
per_objetivo_general VARCHAR(270) NOT NULL,
per_objetivos_especificos VARCHAR(1000) NOT NULL,
per_proyeccion_metodologica VARCHAR(2000) NOT NULL,
per_referencias_bibliograficas VARCHAR(4500) NOT NULL,
per_estado enum('Aprobado','Rechazado','Pendiente') NOT NULL,
per_observacion VARCHAR(1000) NOT NULL,
per_usu_id_1 INT NOT NULL,
per_usu_id_2 INT NOT NULL,
per_fecha DATE NOT NULL,
CONSTRAINT pk_per_id PRIMARY KEY(per_id),
CONSTRAINT fk_per_usu_id_1 FOREIGN KEY(per_usu_id_1) REFERENCES usuario(usu_id)
ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_per_usu_id_2 FOREIGN KEY(per_usu_id_2) REFERENCES usuario(usu_id)
ON DELETE CASCADE ON UPDATE CASCADE);



 create table documento(
     doc_id int auto_increment primary key,
     doc_tipo enum('propuesta','proyecto'),
     doc_ruta varchar(30),
     doc_fecha date);

create table trazadocumento
(
	trad_id int not null auto_increment primary key, 
	trad_fecha date, 
	trad_estado enum('Aprobado','Rechazado','Pendiente') 
	trad_comentario varchar(255), 
	trad_rol enum('Secretaria','Coordinador','Docente'),
	doc_id int, 
	foreign key(doc_id) references documento(doc_id)
);


create table TrazaEstado(
	tra_id int AUTO_INCREMENT PRIMARY KEY,
	tra_fecha DATE,
	tra_estado enum('Aprobado','Rechazado','Pendiente') 
	tra_comentario VARCHAR(1000),
	per_id int,
	FOREIGN KEY (per_id) REFERENCES Perfil(per_id)
);



