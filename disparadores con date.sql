--PONEMOS PRIMERO EL SET SERVEROUTPUT ON
set serveroutput on;
--AGREGAMOS UN BLOQUE PL SQL
declare
dia char(80); 
fecha date;
begin
--INICIALIZAMOS LOS CAMPOS CON LAS FUNCIONES SIGUIENTES
fecha:=sysdate;
dia:=to_char(sysdate, 'dd-month-yyyy');
dia:=to_char(sysdate,'day');dbms_output.put_line('la fecha es '||dia);
dia:=to_char(sysdate,'dd');
dia:=to_char(sysdate,'month');

dia:=to_char(sysdate,'hh');
dia:=to_char(sysdate,'mi');
dia:=to_char(sysdate,'ss');

end;
/
--EJERCICIO DE DISPARADORES CON DATE
--GENERAR LA SIGUIENTE TABLA
create table usuario_tiempo(id_us_ti int primary key, nombre varchar2(80), edad int);
--GENERAR UN DISPARADOR QUE IMPIDA QUE LOS USUARIOS SE GUARDEN EL DÍA MIÉRCOLES

create or replace trigger disp_tiempo before insert on usuario_tiempo for each row
begin
if upper(to_char(sysdate,'day'))=upper('miércolES') then
dbms_output.put_line('el dia es'||to_char(sysdate,'day'));
raise_application_error(-20000,'no puedes guardar en miércoles');

end if;
end;
/
insert into usuario_tiempo values(1, 'Rodrigo', 27);
insert into usuario_tiempo values(2, 'Rodrigo', 27);
insert into usuario_tiempo values(5, 'Rodrigo', 27);
insert into usuario_tiempo values(14, 'Rodrigo', 27);
/
--EJERCICIO 2 GENERAR LA SIGUIENTE TABLA

declare
dia char(80); 
fecha date;
begin
fecha:=sysdate;
dia:=to_char(sysdate,'ss');
dbms_output.put_line('el segundo es '||dia);
end;
/

create table usuario_checador(nombre varchar(80));
--GENERAR UN DISPARADOR QUE IMPIDA GUARDAR EN LOS SEGUNDOS DEL 11 AL 59 DE CADA MINUTO
create or replace trigger disp_checador before insert on usuario_checador for each row
begin
dbms_output.put_line('el segundo es'||to_char(sysdate,'ss'));
if to_char(sysdate,'ss') >10 then --&& =<59 then

raise_application_error(-20001,'no puedes guardar entre los segundos 11 y 59');

end if;
end;
/
insert into usuario_checador values('Rodrigo');

/
dia:=to_char(sysdate,'ss');
dbms_output.put_line('la fecha es '||dia);
