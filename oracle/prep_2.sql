-- 1.- utilizando la db de automotora:
--- Realice un índice que acelere la búsqueda de la tabla cliente que permita indexar
--la tabla por medio de la columna email.
CREATE INDEX idx_cliente_email ON CLIENTE (EMAIL);

-- 2.- Realice un índice que acelere la búsqueda de la tabla 
-- compra que permita indexar
-- la tabla por medio de la columna fecha.
CREATE INDEX idx_compra_fecha ON COMPRA (FECHA);

-- 3.- Realice un índice que acelere la búsqueda de 
-- la tabla financiamiento que permita
-- indexar la tabla por medio de la columna rut_empresa.
CREATE INDEX idx_financiamiento_rut_empresa ON FINANCIAMIENTO (RUT_EMPRESA);

-- 4.- Realice un índice que acelere la búsqueda de la tabla sucursal que permita
-- indexar la tabla por medio de la columna telefono.
CREATE INDEX idx_sucursal_telefono ON SUCURSAL (TELEFONO);

-- 5.- Realice un índice que acelere la búsqueda de la tabla vehículo que permita
-- indexar la tabla por medio de la columna kilometraje
CREATE INDEX idx_vehiculo_kilometraje ON VEHICULO (KILOMETRAJE);

-- 6.- Cree un sinónimo que permita llamar a la tabla vehículo como vehículos.
CREATE SYNONYM VEHICULOS FOR VEHICULO;

-- 7.- Cree un sinónimo que permita llamar a la tabla sucursal como sucursales.
CREATE SYNONYM SUCURSALES FOR SUCURSAL;

-- 8.- Cree un sinónimo que permita llamar a la tabla compra como compras.
CREATE SYNONYM COMPRAS FOR COMPRA;

-- 9.- Cree un sinónimo que permita llamar a la tabla reserva como reservas.
CREATE SYNONYM RESERVAS FOR RESERVA;


--10.- Cree un sinónimo que permita llamar a la tabla forma_de_pago como
-- formas_de_pago.
CREATE SYNONYM FORMAS_DE_PAGO FOR FORMA_DE_PAGO;


-- 11.-Cree una secuencia que se llame sq_compras que permita ingresar
-- automáticamente los id_compra, para ello la secuencia debe iniciar con el número
-- siguiente al máximo registrado en la tabla.
CREATE SEQUENCE sq_compras
START WITH (SELECT NVL(MAX(id_compra), 0) + 1 FROM COMPRA)
INCREMENT BY 1;


-- 12.- Cree una secuencia que se llame sq_financiamiento que permita ingresar
-- automáticamente los id_financiamiento, para ello la secuencia debe iniciar con el
-- número siguiente al máximo registrado en la tabla.
CREATE SEQUENCE sq_financiamiento
START WITH (SELECT NVL(MAX(id_financiamiento), 0) + 1 FROM FINANCIAMIENTO)
INCREMENT BY 1;


-- 13.- Cree una secuencia que se llame sq_reserva que permita ingresar
-- automáticamente los nro_reserva, para ello la secuencia debe iniciar con el número
-- siguiente al máximo registrado en la tabla.
CREATE SEQUENCE sq_reserva
START WITH (SELECT NVL(MAX(nro_reserva), 0) + 1 FROM RESERVA)
INCREMENT BY 1;

-- 14.- Cree una vista de solo lectura que permita mostrar los siguientes datos de las
-- tablas automotora y sucursal, para ello se solicita que se muestren el rut_empresa,
-- nombre, dirección sucursal, comuna y teléfono.
CREATE OR REPLACE VIEW v_automotora_sucursal AS
SELECT a.rut_empresa, a.nombre, s.direccion, s.comuna, s.telefono
FROM AUTOMOTORA a
JOIN SUCURSAL s ON a.rut_empresa = s.rut_empresa
WITH READ ONLY;


-- 15.- Cree una vista editable que permita ver los datos de las tablas vehículo y reserva,
-- para ello se solicita que se muestren el id_vehiculo, patente, marca, modelo,
-- nro_reserva, fecha y garantía.
CREATE OR REPLACE VIEW v_vehiculo_reserva AS
SELECT v.id_vehiculo, v.patente, v.marca, v.modelo, r.nro_reserva, r.fecha, r.garantia
FROM VEHICULO v
JOIN RESERVA r ON v.id_vehiculo = r.id_vehiculo;


-- 16.- Cree una vista de solo lectura que permita mostrar los siguientes datos de las
-- tablas compra y forma de pago, para ello se solicita que se muestren el id_compra,
-- descripción forma de pago, id_vehiculo, rut, fecha y valor.
CREATE OR REPLACE VIEW v_compra_forma_pago AS
SELECT c.id_compra, f.descripcion, c.id_vehiculo, c.rut, c.fecha, c.valor
FROM COMPRA c
JOIN FORMA_DE_PAGO f ON c.id_forma_pago = f.id_forma_pago
WITH READ ONLY;

