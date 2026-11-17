
CREATE TABLE autor (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  nacimiento DATE,
  fallecimiento DATE
);

CREATE TABLE categoria (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50)
);

CREATE TABLE libro (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(100),
  fecha_publicacion DATE,
  autor_id INT,
  categoria_id INT,
  ejemplares INT,
  FOREIGN KEY (autor_id) REFERENCES autor(id),
  FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);


INSERT INTO autor (nombre, nacimiento, fallecimiento) VALUES
  ('Isaac Asimov',       '1920-01-02', '1992-04-06'),
  ('Julio Cortázar',     '1914-08-26', '1984-02-12'),
  ('Gloria Fuertes',     '1917-07-28', '1998-11-27'),
  ('Ursula K. Le Guin',  '1929-10-21', '2018-01-22'),
  ('Emilia Pardo Bazán', '1851-09-16', '1921-05-12');

INSERT INTO categoria (nombre) VALUES
  ('Ciencia Ficcion'),
  ('Novela'),
  ('Poesia'),
  ('Historia');

INSERT INTO libro (titulo, fecha_publicacion, autor_id, categoria_id, ejemplares) VALUES
  ('Fundación',                         '1951-01-01', 1, 1,    10),
  ('Yo, Robot',                         '1950-02-01', 1, 1,    4),
  ('El fin de la eternidad',            '1955-03-01', 1, NULL, 5),
  ('Los propios dioses',                '1972-04-01', 1, 2,    0),
  ('Preludio a la Fundación',           '1988-05-01', 1, 1,    6),
  ('Final del juego',                   '1956-06-01', 2, 3,    9),
  ('Las armas secretas',                '1959-07-01', 2, 3,    12),
  ('Rayuela',                           '1963-08-01', 2, 2,    1),
  ('Todos los fuegos el fuego',         '1966-09-01', 2, 3,    0),
  ('Libro de Manuel',                   '1973-10-01', 2, 1,    8),
  ('Historia de Gloria',                '1978-11-01', 3, 1,    0),
  ('Cangura para todo',                 '1970-12-01', 3, NULL, 8),
  ('Poeta de guardia',                  '1959-01-01', 3, 2,    9),
  ('El hada acaramelada',               '1969-02-01', 3, 3,    4),
  ('El libro de Gloria Fuertes',        '1978-03-01', 3, NULL, 8),
  ('La mano izquierda de la oscuridad', '1969-04-01', 4, 1,    2),
  ('Los desposeídos',                   '1974-10-01', 4, 1,    4),
  ('El nombre del mundo es bosque',     '1972-06-01', 4, NULL, 3),
  ('La ciudad de las ilusiones',        '1967-07-01', 4, NULL, 6),
  ('La rueda celeste',                  '1984-08-01', 4, 3,    3),
  ('La madre naturaleza',               '1887-09-01', 5, 4,    0),
  ('Los pazos de Ulloa',                '1886-10-01', 5, 1,    1),
  ('La cuestion palpitante',            '1883-11-01', 5, NULL, 4),
  ('Insolación',                        '1889-12-01', 5, 3,    3),
  ('La tribuna',                        '1883-01-01', 5, 4,    11);


  -- select * from categoria;
  -- lista nombres de libros con mas de 5 ejemplares
  select titulo from libro where ejemplares > 5;

  -- 1.lista id de libros sin categoria establecida (null)
  select id from libro where categoria_id is NULL;
  -- 2.lista titulos de libros que tienen entre 2 y 5 ejemplares
  select titulo from libro where ejemplares > 2 and ejemplares < 5;
  -- 3.lista de todas las columnas de libros publicados en la decada de 1950
  select * from libro where year(fecha_publicacion) >= 1950 and year(fecha_publicacion) < 1960;
  -- 4.lista de autores que vivieron mas de 80 años
  select nombre from autor where year(fallecimiento) - year(nacimiento) > 80;



  -- funciones fecha y Historia
  select curdate();


  select id, nombre, curdate() - fallecimiento from autor;
  select id, nombre, fallecimiento - nacimiento from autor;























