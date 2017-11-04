table pago_horarios(id integer, subtotal float, iva float, isr float, ret_iva float, total_pagar float)
constraint pk_id primary key(id),
create sequence sec_pago
start with 1
increment by 1
maxvalue 300;


---
create or replace procedure guardar_pago(pago_id out integer, pago_subtotal in float)
as
my_iva=float;
my_ret_iva=float;
my_isr=float;

begin
my_iva=my_subtotal*.16;
my_ret_iva=my_iva/3*2;
my_isr=my_subtotal*.10
my_total_pagar=my_subtotal+my_ret_iva-my_iva-my_isr;

select sec_pago.nextval into id from dual;
insert into pago_horarios(id, subtotal, iva, isr, ret_iva, total_pagar) values (my_id, my_subtotal, my_iva, my_isr, my_ret_iva, my_total_pagar);
end;
/

--GENERAR UN BLOQUE PL SQL QUE INSERTE CON UN CICLO FOR A TODOS LOS ALUMNNOS EN LA TABLA ALUMNO PARA LAS MATERIAS "BASE DE DATOS II E INGNIERIA EN SISTEMAS
declare
valor integer;
begin
guardar_pago(valor, 1, 'Base de Datos',valor);
dbms_output.put_line('el pk generado es' ||valor);
end;
/
select * from materia;