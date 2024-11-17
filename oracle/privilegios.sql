-- ################ CLASE 1 - privilegios: ################ --

-- ver todos los privilegios que existen en el sistema --
SELECT * FROM DBA_SYS_PRIVS;

-- el dba tiene todos los privilegios:
SELECT * FROM dba_sys_privs 
WHERE GRANTEE LIKE 'DBA';

-- crear uusuario (los usuarios son esquemas) el IDENTIFIED by es la contraseña:
CREATE USER USUARIO_DB1 IDENTIFIED BY ASDF1234 
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- ejecutar permiso de inicio de sesión:
GRANT CREATE SESSION TO USUARIO_DB1;

-- Luego ir a la flecha verde, y establecer
-- conexión con el usuario creado, pero
-- se le debe dar un nombre en Name: USUARIO 1
-- en Usuario debe ir el nombre del usuario creado: USUARIO_DB1
-- En Contraseña -> ASDF1234
-- y probar -> guardar el usuario -> conectar

--este usuario no tiene privilegios de creaciónd e tablas
CREATE TABLE EJEMPLO(
  ID NUMBER(30) PRIMARY KEY,
  TEXTO VARCHAR(20) NOT NULL
);

-- se intenta crear la tabla desde el usuario SISTEM 
-- pero tampoco permite crearla para el usuario USUARIO_DB1
CREATE TABLE USUARIO_DB1.EJEMPLO (
  ID NUMBER(30) PRIMARY KEY,
  TEXTO VARCHAR(20) NOT NULL
);

-- EL USUARIO sistem no puede administrar todo,
-- por lo que es necesario crar un usuario que administre
-- la creación de tablas de otro usuario, para no
-- otorgar tantos permisos a un solo usuario

-- CREAMOS un nuevo usuario:
CREATE USER ADMIN_DB1 IDENTIFIED BY ASDF1234
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;


-- OTORGAR ROLES: CONNECT Y RESOURCE:
-- CONNECT: permite tener el CREATE SESSION, ALTER SESSION, DROP SESSION
-- RESOURCE: permite -> CREATE TABLE, EDIT TABLE, INSERT TABLE 
-- ROL DBA -> OTORGA TODOS LOS PERMISOS
GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO ADMIN_DB1; -- TIENE ACCESOS PERO LIMITADOS
-- CREAR CONEXION A ADMIN_DB1 -> SU Contraseña
-- NO FUNCIONA PERO LE AGREGA OTRO PERMISO:
GRANT CREATE ANY TABLE TO ADMIN_DB1;

-- TAMPOCO le funciona pero le agrega lo siguiente:
SELECT * FROM dba_sys_privs 
WHERE GRANTEE LIKE 'DBA' AND PRIVILEGE LIKE '%TABLESPACE';

-- ENTONCES le agreaga otros permisos para las tablas:
GRANT DROP TABLESPACE, ALTER TABLESPACE, CREATE TABLESPACE, MANAGE TABLESPACE TO ADMIN_DB1;

-- TAMPOCO LE FUNCIONA, ASI QUE DECIDE DARLE EL DBA;
GRANT DBA TO ADMIN_DB1;

-- Despues altera al usuario admin con:
ALTER USER ADMIN_DB1 QUOTA UNLIMITED ON USERS;

-- Despues cambia al usuario USUARIO_DB1 y no a admin:
ALTER USER USUARIO_DB1 QUOTA UNLIMITED ON USERS;

-- luego ejecuta la siguiente linea para que pueda crear la tabla:
-- lo ejecuta desde el usuario ADMIN_DB1
CREATE TABLE USUARIO_DB1.EJEMPLO ( 
  ID NUMBER(30) PRIMARY KEY,
  TEXTO VARCHAR(20) NOT NULL
);

-- para verificar como la estructura de la tabla:
DESC EJEMPLO;

-- insertar datos en la tabla EJEMPLO, en el usuario: USUARIO_DB1:
INSERT INTO EJEMPLO VALUES(1, 'EJEMPLO 1');

-- Eliminar lo insertado:
ROLLBACK;

-- Guardar los cambios insertados:
COMMIT;



