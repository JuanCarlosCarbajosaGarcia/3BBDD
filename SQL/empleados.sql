-- 1. CREAR LA TABLA

CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100),
    telefono VARCHAR(20),
    salario DECIMAL(10,2),
    rendimiento FLOAT,
    fecha_contratacion DATE,
    activo BOOLEAN
);

-- 2. INSERTAR DATOS DE PRUEBA

INSERT INTO empleados
(id_empleado, nombre, apellido, email, telefono, salario, rendimiento, fecha_contratacion, activo)
VALUES
(1, ' Ana ', 'Gómez', 'ana@ejemplo.com', '600123456', 2550.50, 4.87, '2021-03-15', TRUE),
(2, 'carlos', 'López', 'carlos@ejemplo.com', NULL, 3100.00, 3.24, '2022-11-01', TRUE),
(3, 'MARÍA', 'Rodríguez', 'maria@ejemplo.com', '600987654', 1980.75, 4.91, '2023-05-20', FALSE),
(4, 'Juan', 'Pérez', NULL, NULL, 2800.00, 4.12, '2020-01-10', TRUE),

(5, 'Laura', 'Martín', 'laura@ejemplo.com', '611111111', 2750.00, 4.33, '2019-07-08', TRUE),
(6, 'Pedro', 'Sánchez', 'pedro@ejemplo.com', '622222222', 2400.50, 3.98, '2021-09-14', TRUE),
(7, 'Lucía', 'Fernández', NULL, '633333333', 1950.00, 4.75, '2023-02-01', TRUE),
(8, 'Miguel', 'Ruiz', 'miguel@ejemplo.com', NULL, 3200.00, 4.21, '2018-11-12', FALSE),
(9, 'Sofía', 'Torres', 'sofia@ejemplo.com', '644444444', 2100.25, 4.89, '2022-06-23', TRUE),
(10, 'Diego', 'Navarro', 'diego@ejemplo.com', '655555555', 3500.00, 3.56, '2017-04-03', TRUE),

(11, 'Elena', 'Jiménez', NULL, '666666666', 2300.80, 4.02, '2020-08-17', TRUE),
(12, 'Javier', 'Moreno', 'javier@ejemplo.com', NULL, 2950.40, 3.75, '2021-12-10', FALSE),
(13, 'Paula', 'Álvarez', 'paula@ejemplo.com', '677777777', 2750.60, 4.60, '2022-01-25', TRUE),
(14, 'Alberto', 'Romero', 'alberto@ejemplo.com', '688888888', 4100.00, 4.15, '2016-05-19', TRUE),
(15, 'Marta', 'Gutiérrez', NULL, NULL, 2250.00, 4.44, '2023-07-11', TRUE),

(16, 'Raúl', 'Ortega', 'raul@ejemplo.com', '699999999', 2600.75, 3.91, '2020-10-01', TRUE),
(17, 'Carmen', 'Delgado', 'carmen@ejemplo.com', '612345678', 2850.30, 4.95, '2019-03-28', TRUE),
(18, 'Álvaro', 'Castro', NULL, '623456789', 3300.00, 3.11, '2018-09-15', FALSE),
(19, 'Natalia', 'Vega', 'natalia@ejemplo.com', NULL, 3050.90, 4.28, '2021-01-04', TRUE),
(20, 'Iván', 'Herrera', 'ivan@ejemplo.com', '634567890', 2480.45, 3.87, '2022-10-20', TRUE),

(21, 'Patricia', 'Molina', NULL, '645678901', 2900.00, 4.50, '2020-02-14', TRUE),
(22, 'Fernando', 'Silva', 'fernando@ejemplo.com', NULL, 3600.00, 4.08, '2017-12-05', TRUE),
(23, 'Beatriz', 'Ramos', 'beatriz@ejemplo.com', '656789012', 2150.70, 4.79, '2023-04-18', FALSE),
(24, 'David', 'Iglesias', NULL, '667890123', 2700.20, 3.65, '2021-11-08', TRUE),

(25, 'Cristina', 'Medina', 'cristina@ejemplo.com', '678901234', 2980.00, 4.37, '2019-06-30', TRUE),
(26, 'Sergio', 'Reyes', 'sergio@ejemplo.com', NULL, 3400.00, 3.44, '2018-01-22', FALSE),
(27, 'Noelia', 'Flores', NULL, '689012345', 2050.10, 4.68, '2022-05-16', TRUE),
(28, 'Adrián', 'Campos', 'adrian@ejemplo.com', '690123456', 3150.50, NULL, '2020-09-09', TRUE),
(29, 'Silvia', 'Cruz', 'silvia@ejemplo.com', NULL, NULL, 4.22, '2021-07-07', TRUE),
(30, 'Óscar', 'Prieto', 'oscar@ejemplo.com', '601234567', 3850.00, 3.99, '2016-12-01', FALSE);