DROP DATABASE IF EXISTS dam1_productos;
CREATE DATABASE dam1_productos;
USE dam1_productos;

CREATE TABLE producto (
    id INT PRIMARY KEY,
    stock INT,
    calificacion TINYINT, -- Ejemplo: 1 a 5 estrellas
    nombre VARCHAR(100) NOT NULL,
    codigo_pais CHAR(2),
    descripcion TEXT,
    precio DECIMAL(10,2),
    coste_envio DECIMAL(10,2),
    peso FLOAT,
    disponible BOOLEAN,
    fecha_lanzamiento DATE,
    ultima_actualizacion DATETIME
);

CREATE TABLE atributo_extendido (
    id INT PRIMARY KEY,
    producto_id INT,
    atributo VARCHAR(50) NOT NULL,
    valor VARCHAR(255) NOT NULL,
    FOREIGN KEY (producto_id) REFERENCES producto(id)
);

INSERT INTO producto (id, stock, calificacion, nombre, codigo_pais, descripcion, precio, coste_envio, peso, disponible, fecha_lanzamiento, ultima_actualizacion) VALUES
(1, 15, 5, 'Portátil Gaming X', 'US', 'Potente portátil para juegos de última generación', 1250.00, 0.00, 2.5, TRUE, '2023-11-15', '2024-01-10 08:30:00'),
(2, 0, 4, 'Monitor UltraWide 34"', 'KR', 'Monitor curvo para productividad', 450.99, 15.50, 6.2, FALSE, '2022-05-20', '2023-12-01 10:15:00'),
(3, 45, 3, 'Ratón Inalámbrico Básico', 'CN', NULL, 12.50, 4.99, 0.15, TRUE, '2021-08-10', '2024-02-15 09:00:00'),
(4, 20, 5, 'Teclado Mecánico Pro', 'CN', 'Teclado mecánico con switches rojos', 89.90, NULL, 1.1, TRUE, '2023-01-25', '2024-03-01 11:20:00'),
(5, 5, 2, 'Auriculares Bluetooth v1', 'ES', 'Auriculares de primera generación, batería limitada', 29.99, 5.00, 0.3, TRUE, '2019-11-11', '2020-05-20 14:00:00'),
(6, 100, 4, 'Cable USB-C 2m', 'CN', 'Cable trenzado de alta durabilidad', 9.99, 2.50, 0.05, TRUE, '2022-09-01', '2024-01-05 16:45:00'),
(7, 8, 5, 'Smartphone Alpha Pro', 'US', 'Teléfono de gama alta con cámara de 108MP', 999.00, 0.00, 0.19, TRUE, '2024-02-10', '2024-03-10 10:00:00'),
(8, 12, 4, 'Smartphone Alpha Mini', 'US', 'Versión compacta del Alpha Pro', 699.00, 0.00, 0.15, TRUE, '2024-02-10', '2024-03-10 10:05:00'),
(9, 30, 3, 'Funda de silicona Alpha', NULL, NULL, 15.00, 3.50, 0.04, TRUE, '2024-02-15', '2024-02-16 08:00:00'),
(10, 2, 1, 'Batería Externa 5000mAh', 'CN', 'Batería portátil de carga lenta', 10.00, 4.00, 0.25, TRUE, '2018-04-12', '2019-12-01 12:00:00'),
(11, 0, 5, 'Tarjeta Gráfica RTX 9000', 'TW', 'Para los gamers más exigentes', 1500.00, 20.00, 1.8, FALSE, '2023-10-01', '2024-01-20 15:30:00'),
(12, 50, 4, 'Memoria RAM 16GB DDR4', 'TW', 'Módulo único de 16GB a 3200MHz', 45.99, NULL, 0.05, TRUE, '2021-06-15', '2023-11-11 09:10:00'),
(13, 40, 5, 'Disco SSD 1TB NVMe', 'KR', 'Almacenamiento ultra rápido', 85.50, 0.00, 0.02, TRUE, '2022-11-20', '2024-02-28 17:00:00'),
(14, 15, 2, 'Disco Duro Externo 1TB HDD', 'TH', 'Tecnología antigua pero confiable', 40.00, 5.99, 0.35, TRUE, '2017-08-30', '2021-01-15 10:00:00'),
(15, 25, 4, 'Webcam HD 1080p', 'CN', 'Ideal para videoconferencias', 35.00, NULL, 0.12, TRUE, '2020-03-15', '2022-09-10 13:20:00'),
(16, 60, 4, 'Micrófono de condensador', 'CN', 'Micrófono USB para podcasting', 55.90, 4.50, 0.6, TRUE, '2021-12-05', '2023-10-01 08:45:00'),
(17, 10, 5, 'Silla Gaming Ergonomica', 'ES', 'Comodidad para largas sesiones de juego', 199.00, 25.00, 15.5, TRUE, '2022-07-22', '2024-03-12 11:30:00'),
(18, 5, 3, 'Escritorio elevable básico', 'ES', 'Escritorio con motor simple', 250.00, 30.00, 25.0, TRUE, '2021-11-11', '2023-12-20 14:00:00'),
(19, 200, 5, 'Pendrive 64GB USB 3.0', 'TW', NULL, 8.50, 2.00, 0.01, TRUE, '2019-05-10', '2023-01-10 10:10:00'),
(20, 150, 4, 'Pendrive 128GB USB 3.1', 'TW', 'Almacenamiento portátil rápido', 14.99, 2.00, 0.01, TRUE, '2020-08-15', '2023-05-11 09:20:00'),
(21, 0, 5, 'Consola PlayBox Series X', 'JP', 'Consola de videojuegos de última generación', 499.99, 0.00, 3.2, FALSE, '2020-11-10', '2024-03-15 16:00:00'),
(22, 35, 4, 'Mando inalámbrico PlayBox', 'JP', 'Mando adicional color negro', 59.99, NULL, 0.25, TRUE, '2020-11-10', '2024-01-22 10:30:00'),
(23, 80, 4, 'Juego RPG Fantasía Final', 'JP', 'Edición estándar', 69.99, 3.50, 0.1, TRUE, '2023-06-22', '2023-07-15 11:00:00'),
(24, 15, 3, 'Cámara de Seguridad WiFi', 'CN', 'Vigilancia interior 720p', 25.00, 4.00, 0.2, TRUE, '2019-10-01', '2021-08-20 09:15:00'),
(25, 22, 5, 'Sistema de Seguridad Pro', 'US', 'Kit completo de vigilancia 4K', 350.00, 0.00, 4.5, TRUE, '2023-04-12', '2024-02-10 14:40:00'),
(26, 40, 4, 'Bombilla Inteligente RGB', 'CN', 'Controlable por voz y app', 15.99, 2.99, 0.08, TRUE, '2021-03-30', '2023-11-05 18:00:00'),
(27, 30, 4, 'Enchufe Inteligente WiFi', 'CN', NULL, 12.50, 2.99, 0.1, TRUE, '2021-04-15', '2023-11-05 18:05:00'),
(28, 5, 2, 'Altavoz Inteligente V1', 'US', 'Primera generación, sonido deficiente', 39.99, 5.00, 0.5, TRUE, '2017-09-01', '2019-02-15 10:00:00'),
(29, 25, 5, 'Altavoz Inteligente Pro', 'US', 'Sonido envolvente 360 y asistente de voz', 129.99, 0.00, 1.2, TRUE, '2023-10-10', '2024-01-30 08:20:00'),
(30, 0, 4, 'Tablet Creativa 10"', 'KR', 'Tablet con lápiz óptico incluido', 320.00, 10.00, 0.45, FALSE, '2022-02-20', '2023-10-10 12:00:00'),
(31, 12, 3, 'Funda con Teclado Tablet 10"', NULL, 'Funda genérica', 25.50, 4.50, 0.3, TRUE, '2022-03-01', '2022-05-15 09:30:00'),
(32, 100, 5, 'Pilas AA Recargables (Pack 4)', 'JP', '2500mAh reales', 14.90, 2.00, 0.12, TRUE, '2020-01-10', '2024-01-05 14:15:00'),
(33, 85, 4, 'Cargador de Pilas', 'JP', 'Cargador rápido con pantalla LCD', 18.50, 3.50, 0.2, TRUE, '2020-02-15', '2023-08-20 16:00:00');

INSERT INTO atributo_extendido (id, producto_id, atributo, valor) VALUES
(1, 1, 'Memoria_RAM_GB', '16'),
(2, 1, 'Almacenamiento_GB', '1024'),
(3, 1, 'Frecuencia_Pantalla_Hz', '144'),
(4, 2, 'Resolucion', '3440x1440p'), -- Este no se puede castear a número fácilmente
(5, 2, 'Tasa_Refresco_Hz', '60'),
(6, 4, 'Ruido_dB', '45.5'), -- Decimal guardado como texto
(7, 7, 'Megapixeles_Camara', '108'),
(8, 7, 'Bateria_mAh', '5000'),
(9, 7, 'Carga_Rapida_W', '67'),
(10, 10, 'Voltaje_Salida_V', '5.0'),
(11, 10, 'Amperaje_Salida_A', '2.1'),
(12, 11, 'VRAM_GB', '24'),
(13, 11, 'Consumo_Energia_W', '450'),
(14, 13, 'Velocidad_Lectura_MBs', '3500'),
(15, 13, 'Velocidad_Escritura_MBs', '3000'),
(16, 21, 'Almacenamiento_GB', '1024'),
(17, 29, 'Potencia_Audio_W', '30.5');
