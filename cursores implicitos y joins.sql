--creamos la sig tabla
create table cartera_clientes(id integer primary key, nombre varchar2(40),
edad integer, sueldo_base float);

--insertamos datos
insert into cartera_clientes values(1, 'juan', 25, 60000);
insert into cartera_clientes values(2, 'ana', 45, 35000);
insert into cartera_clientes values(3, 'pedro', 35, 450000);
insert into cartera_clientes values(4, 'irma', 55, 40000);
insert into cartera_clientes values(5, 'luis', 29, 50000);

select * from cartera_clientes;
drop table cartera_clientes;

--ejercicio: escribir un cursor implicito que obtenga sueldo base de el registro que tiene id=3, una vez obtenido que multiplique 
--el sueldo base por 20 horas laborales y lo asigne a una variable local llamada pago nomina, imprimir el resultado de esa variable.
--LOS CURSORES IMPLICITOS SE USAN CUANDO EN UN SELECT OBTENEMOS UNA SOLA FILA

declare
sueldo float;
pago_nomina float;
begin
-- declaramos el cursos implicito
select sueldo_base into sueldo from cartera_clientes where id=3;
pago_nomina:=sueldo*20;
dbms_output.put_line('el pago es '||pago_nomina);
end;
/
set serveroutput on;

--cursor implicito ejercicio2: generar la siguiente tabla en oracle que tegan su campo primary key autoincrementado de 2 en 2 empezando desde el 1 es decir 
--llevará secuencia1, 3, 5, 7, 9... etc nota: en oracle no existe el auto_increment en oracle para auto_incrementar un primary key se debe usar 
--otro objeto de base de datos llamado secuencia
--PASOS PARA GENERAR UN CAMPO AUTOINCREMENTADO EN ORACLE
--1.-CREAR LA TABLA
--2.-CREAR UNA SECUENCIA
--3.-CREAR UN PROCEDIMIENTO DE INSERCION PARA LIGAR LA TABLA A LA SECUENCIA
--CREAMOS LA TABLA
create table nominas(id_nomina integer primary key, nombre varchar2(60));
-- CREAMOS SECUENCIA
create sequence sec_nominas
start with 1
increment by 2
nomaxvalue;
--CREAMOS PROCEDIMIENTO DE ENLACE DE TABLA Y SECUENCIA
--1.-nota: los argumentos deben ser del mismos numero que campos en la tabla
--2.-nota:siempre el argumento del primary key es out y los restantes son in
--3.-los tipos deben coincidir con el tipo de dato de las columnas, pero sin que sean los mismos nombres
--4.-los argumentos deben ser en el mismo orden como están declarados en la tabla
create or replace procedure guardar_nomina(my_id out integer, my_nombre in varchar2)
as
begin
select sec_nominas.nextval into my_id from dual;
insert into nominas values(my_id, my_nombre);
end;
/
--finalmente vamos a probar el procedimiento con un bloque pl sql
declare
valor integer;
begin
guardar_nomina(valor,'juan');
dbms_output.put_line('el pk generado es' ||valor);
end;
/

select * from nominas;
