
-- select * from empleados;

-- Nombre y apellidos de personas sin telefono
select nombre, apellido
from empleados
where telefono is null;

-- lista con una unica columna con el nombre y el apellido de 
-- los empleados que no tengan ni email ni telefono
select concat(nombre, apellido) as "nombre y apellido"
from empleados
where telefono is null and email is null;

-- una calumna con inicial del nombre y el apellido 
-- separado por espacio, de empleados con rendimiento
-- mayor a 4.5

select concat(substring(nombre,1,1),' ', apellido) as 'inicial del nombre y apellido'
from empleados
where rendimiento > 4.5;

-- eliminar los espacios

select concat(substring(trim(nombre),1,1),' ', apellido) as 'inicial y apellido'
from empleados
where rendimiento > 4.5;

-- dame el email en mayusculas de los empleados en activo

select upper(email)
from empleados
where activo is true;
