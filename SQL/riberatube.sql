-- ==========================================================
-- CREACIÓN DE LA BASE DE DATOS
-- ==========================================================
DROP DATABASE IF EXISTS riberatube;
CREATE DATABASE riberatube CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE riberatube;

-- ==========================================================
-- 1. TABLA: categorias
-- ==========================================================
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150)
);

-- ==========================================================
-- 2. TABLA: usuarios (Con relación reflexiva para SELF JOIN)
-- ==========================================================
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    fecha_registro DATE NOT NULL,
    es_premium BOOLEAN NOT NULL DEFAULT FALSE,
    id_padrino INT NULL,
    CONSTRAINT fk_usuario_padrino FOREIGN KEY (id_padrino)
        REFERENCES usuarios(id_usuario) ON DELETE SET NULL
);

-- ==========================================================
-- 3. TABLA: videos
-- ==========================================================
CREATE TABLE videos (
    id_video INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    duracion_seg INT NOT NULL,
    visitas INT NOT NULL DEFAULT 0,
    likes INT NOT NULL DEFAULT 0,
    fecha_publicacion DATETIME NOT NULL,
    id_usuario INT NOT NULL,
    id_categoria INT NULL, -- Permite NULL para vídeos sin categorizar (LEFT/FULL JOIN)
    CONSTRAINT fk_video_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_video_categoria FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria) ON DELETE SET NULL
);

-- ==========================================================
-- 4. TABLA: comentarios
-- ==========================================================
CREATE TABLE comentarios (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    texto VARCHAR(300) NOT NULL,
    fecha_comentario DATETIME NOT NULL,
    likes_comentario INT NOT NULL DEFAULT 0,
    id_video INT NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT fk_comentario_video FOREIGN KEY (id_video)
        REFERENCES videos(id_video) ON DELETE CASCADE,
    CONSTRAINT fk_comentario_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario) ON DELETE CASCADE
);

-- ==========================================================
-- INSERCIÓN DE DATOS (Pensados para todos los casos de uso)
-- ==========================================================

-- 5 Categorías (Las categorías 4 y 5 NO tendrán vídeos para explicar RIGHT/LEFT JOIN)
INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES
(1, 'Tecnología y Programación', 'Tutoriales de código, bases de datos y hardware'),
(2, 'Gaming', 'Gameplays, eSports y análisis de videojuegos'),
(3, 'Cocina', 'Recetas paso a paso y gastronomía'),
(4, 'Deportes', 'Fútbol, fitness y entrenamientos'),
(5, 'Música', 'Videoclips, covers y teoría musical');

-- 8 Usuarios (Con jerarquía de padrinos, distintos países y actividad desigual)
INSERT INTO usuarios (id_usuario, username, email, pais, fecha_registro, es_premium, id_padrino) VALUES
(1, 'code_master', 'carlos@riberatube.com', 'España', '2022-01-15', TRUE, NULL),
(2, 'gamer_pro', 'laura@gmail.com', 'México', '2022-03-10', TRUE, 1),
(3, 'chef_en_casa', 'roberto@yahoo.com', 'Argentina', '2022-06-22', FALSE, 1),
(4, 'dev_junior', 'ana@outlook.com', 'España', '2023-01-05', FALSE, 2),
(5, 'ana_vlogs', 'anav@gmail.com', 'Colombia', '2023-04-18', TRUE, 3),
(6, 'fantasma_99', 'lurker@hotmail.com', 'España', '2023-08-30', FALSE, NULL), -- No sube vídeos ni comenta
(7, 'critico_feroz', 'hater@gmail.com', 'México', '2023-11-12', FALSE, 2),     -- No sube vídeos, solo comenta
(8, 'troll_face', 'troll@yahoo.com', 'Chile', '2024-01-20', FALSE, NULL);       -- No sube vídeos, solo comenta

-- 10 Vídeos (Variedad de visitas/likes, un vídeo sin categoría [id 9] y vídeos sin comentarios)
INSERT INTO videos (id_video, titulo, duracion_seg, visitas, likes, fecha_publicacion, id_usuario, id_categoria) VALUES
(1, 'Curso de SQL desde cero', 3600, 150000, 12000, '2023-02-10 10:00:00', 1, 1),
(2, 'JOINs en SQL explicados con dibujos', 1200, 85000, 9500, '2023-03-15 16:30:00', 1, 1),
(3, 'Optimización de Subconsultas en MySQL', 1850, 42000, 4100, '2023-05-20 18:00:00', 1, 1),
(4, 'Pasándome Elden Ring sin recibir daño', 7200, 320000, 45000, '2023-04-01 20:00:00', 2, 2),
(5, 'Mi setup gamer 2024 definitivo', 900, 60000, 5200, '2024-01-10 19:00:00', 2, 2),
(6, 'Tortilla de patatas perfecta: ¿Con o sin cebolla?', 650, 95000, 8300, '2023-07-08 12:00:00', 3, 3),
(7, 'Cómo hacer Pizza Napolitana en horno casero', 1100, 110000, 10200, '2023-09-14 13:45:00', 3, 3),
(8, 'Mi primer Hola Mundo en Python', 320, 1200, 85, '2023-10-01 09:15:00', 4, 1),
(9, 'Vídeo de prueba (Borrador oculto)', 60, 15, 1, '2024-02-01 03:00:00', 4, NULL), -- SIN CATEGORÍA
(10, '5 trucos de CSS que no conocías', 480, 28000, 3100, '2024-02-15 17:00:00', 5, 1);

-- 12 Comentarios (Los vídeos 5, 8 y 9 NO tienen comentarios)
INSERT INTO comentarios (id_comentario, texto, fecha_comentario, likes_comentario, id_video, id_usuario) VALUES
(1, '¡Brutal el curso! He aprobado gracias a ti.', '2023-02-11 11:20:00', 45, 1, 4),
(2, 'En el minuto 15:30 te falta un punto y coma.', '2023-02-12 09:00:00', 12, 1, 7),
(3, 'Gracias por avisar, lo anoto en la descripción.', '2023-02-12 10:05:00', 28, 1, 1), -- El autor responde en su vídeo
(4, 'Por fin entiendo la diferencia entre LEFT y RIGHT JOIN.', '2023-03-16 22:15:00', 89, 2, 5),
(5, 'Increíble habilidad, yo morí 50 veces en el primer boss.', '2023-04-02 01:10:00', 150, 4, 4),
(6, 'Seguro que usaste trucos fuera de cámara...', '2023-04-02 14:00:00', 2, 4, 8),
(7, '¡Siempre CON cebolla! No hay debate posible.', '2023-07-08 14:30:00', 210, 6, 1),
(8, 'A mí me gusta sin cebolla, no me escondo.', '2023-07-09 18:20:00', 5, 6, 7),
(9, 'La masa me quedó genial con tu receta, gracias.', '2023-09-16 21:00:00', 19, 7, 2),
(10, '¿Qué harina recomiendas si vivo en México?', '2023-09-17 11:40:00', 8, 7, 7),
(11, 'El truco número 3 con Flexbox me acaba de salvar el día.', '2024-02-16 08:50:00', 34, 10, 4),
(12, 'Primer comentario jajaja saludos desde Chile.', '2023-05-20 18:01:00', 0, 3, 8);
