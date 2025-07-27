-- [Modulo 2]

-- Creacion de la tabla estudiantes

/*

Se crea la tabla de estudiantes de la carrera que quieras evaluar.

*/

CREATE TABLE in_process.estudiantes AS (
    SELECT m.* FROM materias_inscritas m
    INNER JOIN estudiantes_unis e ON e.id_estudiante = m.codigo_id
)

-- [Codificacion]

-- Ciudad de la Universidad -> 0
-- Zona aledaña -> 1
-- Zona alejada -> 2

UPDATE in_process.estudiantes SET residencia = CASE
    WHEN residencia LIKE ('%Ciuedad%') THEN '0'
    WHEN residencia LIKE ('%Zona aledaña%') THEN '1'
    ELSE '2'
END;

ALTER TABLE in_process.estudiantes
    ALTER COLUMN residencia TYPE int8 USING residencia::int8;

-- [Codificacion]

-- Femenino -> 2
-- Masculino -> 1
-- No binario -> 0

UPDATE in_process.estudiantes SET genero = CASE
    WHEN genero = 'F' THEN '2'
    WHEN genero = 'M' THEN '1'
    WHEN genero = 'N' THEN '0'
END;

ALTER TABLE in_process.estudiantes
    ALTER COLUMN genero TYPE int8 USING genero::int8;

-- [Codificacion]

-- Casado(a) -> 2
-- U libre -> 1
-- Soltero(a) -> 0

UPDATE in_process.estudiantes SET estado_civil = CASE
    WHEN estado_civil = 'Soltero(a)' THEN '0'
    WHEN estado_civil = 'U libre' THEN '1'
    WHEN estado_civil = 'Casado(a)' THEN '2'
END;

ALTER TABLE in_process.estudiantes
    ALTER COLUMN estado_civil TYPE int8 USING estado_civil::int8;