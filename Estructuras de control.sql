create table menores_edad(id_menores integer, nombre varchar2(60), edad integer,
constraint pk_me primary key (id_menores));
create or replace procedure generar_mil
as begin
--Generamos los mil
for i IN 1..1000 loop
insert into menores_edad values(i, 'Rodrigo Garces', 26);
end loop;
end;
/

--Vamos a ejecutar el procedimiento 
begin
generar_mil();
end;
/
select *from menores_edad;
select count(*) from menores_edad;

--Generar un procedimiento almacenado que nos haga una actualización
--de tal manera que impida que actualice edades menores a 18 años. debe marcar un error
create or replace procedure actualizar_edad(age integer, id in integer)
as begin
if age <18 then raise_application_error(-20001, 'NO ACEPTO EDADES MENORES A 18');
else
update menores_edad set edad=age where id_menores=id;
end if;
end;
/
