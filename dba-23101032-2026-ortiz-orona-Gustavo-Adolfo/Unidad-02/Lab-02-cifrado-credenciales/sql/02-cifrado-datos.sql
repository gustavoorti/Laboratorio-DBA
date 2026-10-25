-- - 02-cifrado-datos

-- En LAB-01 se identificaron datos que pueden requerir protección adicional.
-- Para esta actividad utilizaremos el campo RFC como ejemplo.
-- 8.1 Crear una tabla de demostración
CREATE TABLE clientes_protegidos (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    rfc_cifrado BYTEA NOT NULL
);
-- Inserta un registro utilizando cifrado simétrico:
INSERT INTO clientes_protegidos (
    nombre,
    rfc_cifrado
)
VALUES (
    'Ana López',
    pgp_sym_encrypt('LOPA900101ABC', 'CLAVE-DE-PRUEBA')
);
-- Consulta:
SELECT *
FROM clientes_protegidos;
-- Observa que el RFC ya no aparece directamente.

-- 8.2 Recuperar el dato
-- Utiliza:
SELECT
    id,
    nombre,
    pgp_sym_decrypt(
        rfc_cifrado,
        'CLAVE-DE-PRUEBA'
    ) AS rfc
FROM clientes_protegidos;
