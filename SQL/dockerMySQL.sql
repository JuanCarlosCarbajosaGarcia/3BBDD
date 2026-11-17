SELECT v.titulo, v.visitas
FROM videos v 
WHERE v.likes > 10000;

-- 1. mostrar id_comentario, texto,
-- id_video y titulo del video
-- para todos los comentarios

SELECT c.id_comentario, c.texto, c.id_video, v.id_video, v.titulo
FROM comentarios c, videos v
WHERE c.id_video = v.id_video;

SELECT c.id_comentario, c.texto, c.id_video, v.id_video, v.titulo
FROM comentarios c JOIN videos v ON c.id_video = v.id_video;

SELECT c.id_comentario, c.texto, c.id_video, v.id_video, v.titulo
FROM comentarios c JOIN videos v USING(id_video);

-- lista el titulo y fecha de los comentarios en febrero junto al usuario

--SELECT v.titulo c.

SELECT SUBSTR(c.texto,1,10), 
    c.id_comentario,
    v.titulo
FROM comentarios c
JOIN videos v USING(id_video);

-- listar categorias sin videos

SELECT u.id_usuario, u.username, v.id_usuario, v.id_video
FROM usuarios u
LEFT JOIN videos v ON u.id_usuario = v.id_usuario;

-- usuarios sin videos

SELECT u.id_usuario, u.username, v.id_usuario, v.id_video
FROM usuarios u
LEFT JOIN videos v ON u.id_usuario = v.id_usuario
WHERE v.id_usuario IS NULL;

-- videos sin usuario

SELECT v.id_video
FROM videos v
WHERE v.id_usuario IS NULL;