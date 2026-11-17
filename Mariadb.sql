select * from producto;

select *
from producto
where ((stock >= 10 and stock <=50)
		and codigo_pais not in ('US','CN'))
		or (DATEDIFF(ultima_actualizacion, fecha_lanzamiento) > 365*2)
order by precio desc;

select *
from producto
where disponible is true and (peso between 0 and 3)
order by calificacion asc, peso desc;

select *
from producto
order by precio desc
limit 5;

select *
from producto
order by precio desc
limit 10000 offset 5;
-- en mysql no puede aparece offset solo

select distinct codigo_pais
from producto
where calificacion >3;

-- ❌ ESTA CONSULTA DARÁ ERROR
SELECT nombre, precio + 10 AS TotalPrecio
FROM producto
WHERE TotalPrecio > 50;

-- ✅ FORMA CORRECTA
SELECT nombre, precio + 10 AS TotalPrecio
FROM producto
WHERE precio + 10 > 50
ORDER BY TotalPrecio DESC; -- Aquí sí podemos usar el alias

