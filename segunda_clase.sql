--creamos la tabla almacen
create table almacen(numero_almacen integer, unicacion_almacen varchar2 (80), constraint pk_nu_a primary key (numero_almacen));
--insertamos el primer registro
insert into almacen values(1, 'Plymouth');
--hacemos un select simple
select * from almacen;
--mi primer procedimiento almacenado
create or replace procedure hola(nombre in varchar2)
as
begin
dbms_output.put_line('hola' ||nombre);
end;
/
set serveroutput on;

--invocamos el procedimiento
begin
hola('Rodrigo');
end;
/
select * from almacen;

--Generar tabla vendedor

create table vendedor (numero_vendedor integer, nombre_vendedor varchar2(60),
area_ventas varchar2(60),
constraint pk_nv primary key(numero_vendedor));
describe vendedor;

create table cliente(numero_cliente integer, 
numero_almacen integer, nombre_cliente varchar2(60),
constraint pk_nc primary key(numero_cliente), 
constraint fk1_na foreign key(numero_almacen) references almacen(numero_almacen));
describe cliente;

--En oracle las primary key artificiales (autoincrementadas) se agregan en la tabla por medio de una SECUENCIA
create table ventas(id_ventas integer, 
numero_cliente integer, numero_vendedor integer, 
monto_venta float,
constraint pk_idw1 primary key(id_ventas), 
constraint fk_nc1 foreign key(numero_cliente) references cliente(numero_cliente), 
constraint fk_nv1 foreign key(numero_vendedor) references vendedor(numero_vendedor));
describe ventas;

insert into almacen values(2, 'Superior');
insert into almacen values(3, 'Bismarck');
insert into almacen values(4, 'Fargo');
describe almacen;

--Estructuras de control en PL-SQL
--Ejercicio: Generar la siguiente tablita 