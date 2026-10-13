-- 1. Dim_Tiempo (Fecha)
-- --------------------------------------------------------
CREATE TABLE Dim_Tiempo (
    id_fecha INT PRIMARY KEY,
    fecha DATE NOT NULL,
    anio INT,
    mes_num INT,
    nombre_mes VARCHAR(20),
    dia_semana VARCHAR(20),
    es_fin_semana BIT
);
GO

INSERT INTO Dim_Tiempo (id_fecha, fecha, anio, mes_num, nombre_mes, dia_semana, es_fin_semana) VALUES
(20240101, '2024-01-01', 2024, 1, 'Enero', 'Lunes', 0),
(20240115, '2024-01-15', 2024, 1, 'Enero', 'Lunes', 0),
(20240125, '2024-01-25', 2024, 1, 'Enero', 'Jueves', 0),
(20240203, '2024-02-03', 2024, 2, 'Febrero', 'Sábado', 1),
(20240214, '2024-02-14', 2024, 2, 'Febrero', 'Miércoles', 0),
(20240229, '2024-02-29', 2024, 2, 'Febrero', 'Jueves', 0),
(20240307, '2024-03-07', 2024, 3, 'Marzo', 'Jueves', 0),
(20240318, '2024-03-18', 2024, 3, 'Marzo', 'Lunes', 0),
(20240330, '2024-03-30', 2024, 3, 'Marzo', 'Sábado', 1);
GO


-- --------------------------------------------------------
-- 2. Dim_Ubicacion (Inmuebles y Geografía)
-- --------------------------------------------------------
CREATE TABLE Dim_Ubicacion (
    id_ubicacion INT PRIMARY KEY,
    nombre_inmueble VARCHAR(100) NOT NULL,
    tipo_inmueble VARCHAR(50), -- Edificio, Centro Comercial, Bodega
    ciudad VARCHAR(50) NOT NULL,
    departamento VARCHAR(50),
    area_m2 INT
);
GO

INSERT INTO Dim_Ubicacion (id_ubicacion, nombre_inmueble, tipo_inmueble, ciudad, departamento, area_m2) VALUES
(101, 'Torre Central', 'Edificio', 'Bogotá', 'Cundinamarca', 5000),
(102, 'Centro Comercial Andino', 'Centro Comercial', 'Bogotá', 'Cundinamarca', 35000),
(103, 'Edificio Empresarial Sur', 'Edificio', 'Bogotá', 'Cundinamarca', 2500),
(104, 'Bodega Logística Celta', 'Bodega', 'Bogotá', 'Cundinamarca', 10000),
(105, 'Mall del Río', 'Centro Comercial', 'Medellín', 'Antioquia', 40000),
(106, 'Edificio El Tesoro', 'Edificio', 'Medellín', 'Antioquia', 6000),
(107, 'Bodega Medellín Norte', 'Bodega', 'Medellín', 'Antioquia', 8000),
(108, 'Centro Comercial Chipichape', 'Centro Comercial', 'Cali', 'Valle del Cauca', 30000),
(109, 'Torre de Occidente', 'Edificio', 'Cali', 'Valle del Cauca', 4500),
(110, 'Bodega Zona Franca', 'Bodega', 'Cali', 'Valle del Cauca', 12000),
(111, 'Centro Comercial Buenavista', 'Centro Comercial', 'Barranquilla', 'Atlántico', 28000),
(112, 'Edificio Puerta de Oro', 'Edificio', 'Barranquilla', 'Atlántico', 3500),
(113, 'Centro Comercial Viva', 'Centro Comercial', 'Bucaramanga', 'Santander', 22000),
(114, 'Torre Santander', 'Edificio', 'Bucaramanga', 'Santander', 3000),
(115, 'CC Unicentro', 'Centro Comercial', 'Cali', 'Valle del Cauca', 25000),
(116, 'Edificio 93', 'Edificio', 'Bogotá', 'Cundinamarca', 7000),
(117, 'Bodega Caribe', 'Bodega', 'Barranquilla', 'Atlántico', 9000),
(118, 'CC La Florida', 'Centro Comercial', 'Medellín', 'Antioquia', 32000),
(119, 'Torre Alto', 'Edificio', 'Bucaramanga', 'Santander', 4000),
(120, 'Bodega Sur', 'Bodega', 'Bogotá', 'Cundinamarca', 6000);
GO


-- --------------------------------------------------------
-- 3. Dim_Activo (Equipos e Infraestructura)
-- --------------------------------------------------------
CREATE TABLE Dim_Activo (
    id_activo INT PRIMARY KEY,
    nombre_activo VARCHAR(100) NOT NULL,
    tipo_equipo VARCHAR(50), -- CCTV, HVAC, Civil, Iluminación
    marca VARCHAR(50),
    modelo VARCHAR(50),
    vida_util_meses INT
);
GO

INSERT INTO Dim_Activo (id_activo, nombre_activo, tipo_equipo, marca, modelo, vida_util_meses) VALUES
-- CCTV
(301, 'Cámara Domo Principal', 'CCTV', 'Hikvision', 'DS-2CE56H0T', 60),
(302, 'NVR Central', 'CCTV', 'Dahua', 'DH-XVR5108', 72),
(303, 'Cámara PTZ Exterior', 'CCTV', 'Axis', 'Q6075-E', 72),
(304, 'Cámara PTZ Exterior', 'CCTV', 'Axis', 'Q6075-E', 72),
-- Aire Acondicionado (HVAC)
(305, 'Unidad Chiller N°1', 'HVAC', 'Trane', 'CVGF', 120),
(306, 'Unidad Minisplit Oficina 201', 'HVAC', 'LG', 'DualCool', 84),
(307, 'Unidad Minisplit Oficina 302', 'HVAC', 'LG', 'DualCool', 84),
(308, 'Torre de Enfriamiento', 'HVAC', 'Baltimore', 'MTA', 180),
(309, 'Unidad Chiller N°2', 'HVAC', 'Trane', 'CVGF', 120),
-- Infraestructura Civil
(310, 'Ascensor Principal', 'Civil/Vertical', 'Schindler', '3300 AP', 240),
(311, 'Planta Eléctrica', 'Eléctrico', 'Caterpillar', 'C15', 180),
(312, 'Bomba de Agua Sótano', 'Hidráulico', 'Grundfos', 'CR 10', 96),
(313, 'Techo Piso 5', 'Civil/Cubierta', 'N/A', 'Panel Sándwich', 360),
(314, 'Ascensor de Servicio', 'Civil/Vertical', 'Mitsubishi', 'LEHY-S', 240),
(315, 'Sistema de Iluminación Exterior', 'Eléctrico', 'Phillips', 'RoadFocus', 108),
-- Otros
(316, 'Extintor Polvo Químico', 'Seguridad', 'PQS', 'Tipo A,B,C', 60),
(317, 'Puerta de Acceso Principal', 'Civil', 'Dorma', 'TS 98 X', 120),
(318, 'Cámara Domo Secundaria', 'CCTV', 'Dahua', 'IPC-HDPW', 60),
(319, 'Unidad Chiller N°3', 'HVAC', 'Carrier', '30XA', 120),
(320, 'Bomba Contraincendios', 'Hidráulico', 'Aurora', '341', 180),
(321, 'Ascensor Panorámico', 'Civil/Vertical', 'Otis', 'Skyrise', 240),
(322, 'Cámara Termográfica', 'CCTV', 'FLIR', 'T640', 84),
(323, 'Unidad de Tratamiento de Aire (UTA)', 'HVAC', 'Carrier', 'Aero', 120),
(324, 'Cerramiento Perimetral', 'Civil/Estructura', 'N/A', 'Malla', 300);
GO


-- --------------------------------------------------------
-- 4. Dim_Empleado (Personal de Mantenimiento)
-- --------------------------------------------------------
CREATE TABLE Dim_Empleado (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50), -- Eléctrico, HVAC, Civil, Electrónica
    antiguedad_anios INT
);
GO

INSERT INTO Dim_Empleado (id_empleado, nombre, apellido, especialidad, antiguedad_anios) VALUES
(401, 'Javier', 'Pérez', 'HVAC', 8),
(402, 'Marta', 'Rodríguez', 'Eléctrico', 5),
(403, 'Luis', 'Gómez', 'Civil', 12),
(404, 'Carolina', 'Díaz', 'Electrónica', 6),
(405, 'Andrés', 'López', 'HVAC', 3),
(406, 'Viviana', 'Castro', 'Eléctrico', 10),
(407, 'Camilo', 'Rojas', 'Civil', 4),
(408, 'Diana', 'Mora', 'Electrónica', 9),
(409, 'Felipe', 'Quintero', 'HVAC', 2),
(410, 'Gloria', 'Vargas', 'Eléctrico', 7),
(411, 'Héctor', 'Sierra', 'Civil', 15),
(412, 'Isabel', 'Luna', 'Electrónica', 1),
(413, 'Jorge', 'Navarro', 'HVAC', 6),
(414, 'Laura', 'Blanco', 'Eléctrico', 11),
(415, 'Manuel', 'Ortega', 'Civil', 3),
(416, 'Natalia', 'Pardo', 'Electrónica', 5),
(417, 'Óscar', 'Ríos', 'HVAC', 9),
(418, 'Patricia', 'Sánchez', 'Eléctrico', 4),
(419, 'Raúl', 'Torres', 'Civil', 7),
(420, 'Susana', 'Uribe', 'Electrónica', 13),
(421, 'Tomás', 'Vélez', 'HVAC', 1),
(422, 'Ursula', 'Zapata', 'Eléctrico', 8),
(423, 'Víctor', 'Arias', 'Civil', 2);
GO


-- =========================================================
-- CREACIÓN DE LA TABLA DE HECHOS (Fact_Mantenimiento)
-- =========================================================
CREATE TABLE Fact_Mantenimiento (
    id_mantenimiento INT PRIMARY KEY,
    id_fecha INT,
    id_ubicacion INT,
    id_activo INT,
    id_empleado INT,
    tipo_mantenimiento VARCHAR(15), -- Preventivo, Correctivo
    costo_total DECIMAL(10, 2), -- Medida: Costo
    satisfaccion_cliente INT, -- Medida: 1 (Muy Malo) a 10 (Excelente)
    tiempo_resolucion_horas DECIMAL(5, 2), -- Medida: Eficiencia
    -- Claves Foráneas
    FOREIGN KEY (id_fecha) REFERENCES Dim_Tiempo(id_fecha),
    FOREIGN KEY (id_ubicacion) REFERENCES Dim_Ubicacion(id_ubicacion),
    FOREIGN KEY (id_activo) REFERENCES Dim_Activo(id_activo),
    FOREIGN KEY (id_empleado) REFERENCES Dim_Empleado(id_empleado)
);
GO

-- Inserción de datos de ejemplo (más de 30 registros)
INSERT INTO Fact_Mantenimiento (id_mantenimiento, id_fecha, id_ubicacion, id_activo, id_empleado, tipo_mantenimiento, costo_total, satisfaccion_cliente, tiempo_resolucion_horas) VALUES
(501, 20240101, 102, 305, 401, 'Preventivo', 550.00, 9, 4.0),   
(502, 20240101, 101, 301, 404, 'Preventivo', 150.00, 8, 1.5),   
(503, 20240115, 105, 303, 408, 'Correctivo', 890.50, 6, 8.0),   
(504, 20240115, 108, 307, 405, 'Correctivo', 450.00, 7, 3.5),   
(505, 20240125, 111, 311, 406, 'Preventivo', 1200.00, 10, 6.0), 
(506, 20240203, 109, 310, 403, 'Correctivo', 720.00, 5, 15.0),  
(507, 20240203, 103, 316, 412, 'Preventivo', 50.00, 10, 0.5),   
(508, 20240214, 106, 306, 409, 'Preventivo', 350.00, 9, 2.0),   
(509, 20240214, 113, 302, 416, 'Preventivo', 180.00, 9, 1.0),   
(510, 20240229, 102, 305, 401, 'Correctivo', 3100.00, 4, 24.0), 
(511, 20240229, 115, 315, 402, 'Correctivo', 280.00, 8, 2.5),   
(512, 20240307, 107, 320, 410, 'Preventivo', 650.00, 9, 3.0),   
(513, 20240307, 101, 317, 411, 'Preventivo', 300.00, 10, 1.0),  
(514, 20240318, 116, 309, 405, 'Preventivo', 600.00, 8, 4.5),   
(515, 20240318, 109, 308, 401, 'Correctivo', 1200.00, 7, 7.0),  
(516, 20240330, 105, 301, 404, 'Preventivo', 150.00, 9, 1.0),   
(517, 20240330, 118, 322, 408, 'Correctivo', 950.00, 6, 6.0),   
(518, 20240330, 104, 323, 401, 'Preventivo', 750.00, 10, 5.0),  
(519, 20240203, 102, 314, 407, 'Preventivo', 400.00, 9, 2.0),   
(520, 20240125, 117, 313, 411, 'Correctivo', 1500.00, 3, 30.0), 
(521, 20240101, 101, 301, 404, 'Correctivo', 450.00, 7, 3.0),   
(522, 20240115, 101, 301, 404, 'Preventivo', 150.00, 9, 1.0),   
(523, 20240125, 101, 301, 404, 'Correctivo', 600.00, 8, 4.0),   
(524, 20240203, 102, 305, 401, 'Preventivo', 550.00, 10, 4.0),  
(525, 20240203, 103, 305, 401, 'Preventivo', 550.00, 9, 4.0),   
(526, 20240203, 104, 305, 401, 'Preventivo', 550.00, 8, 4.0),   
(527, 20240214, 105, 303, 408, 'Preventivo', 150.00, 9, 1.5),   
(528, 20240214, 106, 303, 408, 'Correctivo', 550.00, 7, 5.0),   
(529, 20240229, 102, 314, 407, 'Correctivo', 900.00, 6, 12.0),  
(530, 20240307, 111, 306, 405, 'Preventivo', 350.00, 10, 2.0);  
GO