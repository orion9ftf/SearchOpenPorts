-- Cree un usuario llamado UsuarioPreparacion1 con una contraseña Preparacion1,
-- a ese usuario asigne los roles connect, resource y los privilegios create view, create
-- sequence y create index.

-- Crear el usuario
CREATE USER UsuarioPreparacion1 IDENTIFIED BY Preparacion1;

-- Asignar los roles
GRANT CONNECT TO UsuarioPreparacion1;
GRANT RESOURCE TO UsuarioPreparacion1;

-- Asignar los privilegios
GRANT CREATE VIEW TO UsuarioPreparacion1;
GRANT CREATE SEQUENCE TO UsuarioPreparacion1;
GRANT CREATE INDEX TO UsuarioPreparacion1;

-- Conéctese al usuario UsuarioPreparación1 y cree los elementos que se
-- encuentran en el script Script Automotora.sql
CONNECT UsuarioPreparacion1; --/Preparacion1

-- Cree una secuencia que permita registrar a las llaves primarias de la tabla
-- Vehiculos, para ello debe considerar que el id de la tabla es id_vehiculo, que la
-- secuencia debe tener un valor mínimo de 1, un valor máximo de 30000000, y debe
-- comenzar su conteo a partir del valor 2001.
CREATE SEQUENCE seq_id_vehiculo
    START WITH 2001
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 30000000
    NOCYCLE
    NOCACHE;

-- Cree un índice que permita realizar una búsqueda más rápida en la tabla reserva,
-- utilizando para ello la columna fecha.
CREATE INDEX idx_reserva_fecha
ON reserva (fecha);

SELECT * 
FROM reserva
WHERE fecha = TO_DATE('2024-09-11', 'YYYY-MM-DD');

-- - Realice una vista que permita mostrar los valores de la unión entre la tabla
-- vehículo y reserva, para ello se solicita que muestre el id_vechiulo de la tabla
-- vehículo, el rut de la tabal reserva, la fecha de la tabla reserva, la marca de la tabla
-- vehículo, el kilometraje de la tabla vehículo, el modelo de la tabla vehículo y el
-- modelo de la tabla vehículo, la vista debe ser de solo lectura.
CREATE OR REPLACE VIEW v_vehiculo_reserva_lectura AS
SELECT v.id_vehiculo, r.rut, r.fecha, v.marca, v.kilometraje, v.modelo
FROM VEHICULO v
JOIN RESERVA r ON v.id_vehiculo = r.id_vehiculo
WITH READ ONLY;
