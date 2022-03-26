CREATE TABLE PACIENTE 

(
pac_rut varchar2(8),
pac_dv char(1),
pac_nombre varchar2(20),
pac_apellido varchar2(20),
pac_edad number(3),
pac_fecha_nac date
);

alter table PACIENTE 
add constraint pk_paciente
primary key (pac_rut,pac_dv);

CREATE TABLE ESPECIALIDAD

(
  esp_id number not null primary key,
  esp_nombre varchar2(20),
  esp_tarifa number(8)
);

CREATE TABLE CONSULTA 

(
con_id integer not null primary key,
pac_rut varchar2(8),
doc_id char(9),
pac_dv char(1),
con_fecha date,
cen_id number(6)
);

alter table consulta
add constraint fk_consulta_pac_rut
foreign key (pac_rut,pac_dv)
references paciente(pac_rut,pac_dv);

alter table consulta
add constraint fk_consulta_cen_id
foreign key (cen_id)
references centro(cen_id);

alter table consulta
add constraint fk_consulta_doc_id
foreign key (doc_id)
references doctor(doc_id);

CREATE TABLE CENTRO

(
cen_id number(6) not null primary key,
cen_nombre varchar2(20),
com_id char(4)
);

alter table centro
add constraint fk_centro_com_id
foreign key (com_id)
references comuna(com_id);

CREATE TABLE DOCTOR 

(
doc_id char(9) not null primary key,
doc_nombre varchar2(20),
doc_apellido varchar2(20),
esp_id number
);

alter table doctor
add constraint fk_doctor_esp_id
foreign key (esp_id)
references especialidad(esp_id);

CREATE TABLE COMUNA

(
com_id char(4) not null primary key,
com_nombre varchar2(20)
);

Insert into especialidad values(1,'kinesiologia',4000);
Insert into especialidad values(2,'dermatologia',6000);
Insert into especialidad values(3,'medicina general',4500);
Insert into especialidad values(4,'odontologia',42000);
Insert into especialidad values(5,'obstetricia',34000);

insert into consulta values(1,'3','2','3','12/02/2015',1);
insert into consulta values(2,'3','2','3','01/04/2015',1);
insert into consulta values(3,'1','1','1','21/08/2015',2);
insert into consulta values(4,'2','3','2','19/09/2015',3);
insert into consulta values(5,'4','4','4','07/10/2015',3);
insert into consulta values(6,'5','1','5','15/10/2015',1);

insert into centro values(1,'las rosas','1');
insert into centro values(2,'balmaceda','1');
insert into centro values(3,'santa isabel','2');

insert into paciente values('1','1',NULL,'JARA',NULL,'30/04/2017');
insert into paciente values('2','2','','DIAS','','02/02/2017');
insert into paciente values('3','3','LUIS','ROJAS',15,'07/05/2017');
insert into paciente values('4','4','ANTONIO','VARAS',22,'07/08/2017');
insert into paciente values('5','5','PABLO','CRUZ',32,'09/09/2017');

insert into doctor values('1',null,'rosas',1);
insert into doctor values('2','pablo','rosario',2);
insert into doctor values('3','lucas','araya',3);
insert into doctor values('4','amaro','montaña',2);


insert into comuna values('1','puente alto');
insert into comuna values('2','la florida');
insert into comuna values('3','la granja');

