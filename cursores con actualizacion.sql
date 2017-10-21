--CURSORES CON ACTUALIZACIÓN
--UN CURSOR CON UPDATE, ADEMÁS DE FUNCIONAR COMO SELECT, REALIZA ACTUALIZACIONES DE FORMA MASIVA, 
--ES DECIR, VARIAS ACTUALIZACIONES EN UNA SOLA ACCIÓN
create table alumno(cuenta integer primary key, nombre varchar2(80), semestre integer);
insert into alumno values(1,'Rodrigo', 1);
insert into alumno values(2,'Adrián', 1);
insert into alumno values(3,'Victor', 1);
insert into alumno values(4,'Mauricio', 1);
insert into alumno values(5,'Carlos', 1);
select * from alumno;
--CREAR UN CURSOS DE TIPO UPDATE, PARA CAMBIAR EL SEMESTRE =2 PARA TODOS LOS ALUMNOS
declare
cursor cur_alumnos is select * from alumno for update of semestre;
begin
--ESTA ES UNA LOGIZA MUY SIMPLE
for rec in cur_alumnos loop
update alumno set semestre=2 where current of cur_alumnos;

end loop;
end;
/
select * from alumno;
--EJERCICIO GENERAR UNA TABLA MATERIA MUCHAS MATERIAS A UN ALUMNO
create table materia(id_materia integer, cuenta integer, materia varchar2(80), calificacion float,
constraint pk_idmateria primary key(id_materia),
constraint fk1_cu foreign key(cuenta) references alumno(cuenta));
describe materia;
--CREAR UNA SECUENCIA QUE AUTOGENERE CON PROCEDIMIENTO LIGADO A LA TABLA
create sequence sec_materia
start with 1
increment by 1
nomaxvalue;

create or replace procedure guardar_materia(mat_id out integer, mat_cuenta in integer, mat_materia in varchar2, mat_calificacion in float)
as
begin
select sec_materia.nextval into mat_id from dual;
insert into materia values(mat_id, mat_cuenta, mat_materia ,mat_calificacion);
end;
/

--GENERAR UN BLOQUE PL SQL QUE INSERTE CON UN CICLO FOR A TODOS LOS ALUMNNOS EN LA TABLA ALUMNO PARA LAS MATERIAS "BASE DE DATOS II E INGNIERIA EN SISTEMAS
declare
valor integer;
begin
guardar_materia(valor, 1, 'Base de Datos',valor);
dbms_output.put_line('el pk generado es' ||valor);
end;
/
select * from materia;


