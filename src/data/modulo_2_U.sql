-- [Modulo 2 U]

-- Creacion de la tabla estudiantes

/*
[Importante]: Esta implementacion es unica si estas utilizando una base de datos identica a
la utilizada en la creacion de este proyecto en el año 2025, ya que corrige errores encontrados.

Para saber mas sobre dichos problemas visita la documentacion

https://dbdocs.io/anfehumu2.0/Unicatolica

Determina materias obligatorias del programa [Ingenieria en Sistemas]
para asegurar que los estudiantes pertenezcan a este.

*/

CREATE TABLE in_process.estudiantes AS (

WITH estudiantes_autenticos AS (
    SELECT DISTINCT
        CAST(codigo_id AS TEXT)
    FROM materias_inscritas
    WHERE codigo_id IN (
        SELECT codigo_id
        FROM materias_inscritas
        WHERE UPPER(asignatura_descripcion) IN (
            SELECT nombre_asignatura
            FROM in_process.asignaturas
            WHERE sub_area IN (
                'FORMACION BASICA PROFESIONAL ESPECIFICA'
            )
        )
        AND codigo_id IN (
            SELECT codigo_id
            FROM materias_inscritas
            WHERE UPPER(asignatura_descripcion) IN (
                SELECT nombre_asignatura
                FROM in_process.asignaturas
                WHERE sub_area IN (
                    'PROFESIONAL ESPECIFICA EN DESARROLLO WEB Y MOVIL'
                )
            )
        )
    )
)

SELECT
    u.id_estudiante, periodo_catalogo as periodo_inicio,edad, desc_estado_civil as estado_civil, genero, UPPER(residencia) AS residencia, estrato
FROM estudiantes_unis u
INNER JOIN estudiantes_autenticos e
    ON u.id_estudiante::TEXT = e.codigo_id
    );

--[Normalizacio semantica]

ALTER TABLE in_process.estudiantes
    ALTER COLUMN estrato type int8 using estrato::int8;

WITH promedio_estrato AS (
    SELECT ROUND(AVG(e.estrato))::int8 AS valor FROM in_process.estudiantes e
                               WHERE e.estrato <> 0
)
UPDATE in_process.estudiantes SET estrato = promedio_estrato.valor FROM promedio_estrato
WHERE estrato = 0;

-- [Codificacion]

-- Ciudad de la Universidad -> 0
-- Zona aledaña -> 1
-- Zona alejada -> 2

UPDATE in_process.estudiantes SET residencia = CASE
    WHEN residencia LIKE ('%CALI%') THEN '0'
    WHEN residencia LIKE ('CANDELARIA') THEN '1'
    WHEN residencia LIKE ('JAMUND%') THEN '1'
    WHEN residencia LIKE ('YUMBO') THEN '1'
    WHEN residencia LIKE ('PALMIRA') THEN '1'
    WHEN residencia LIKE ('DAGUA') THEN '1'
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