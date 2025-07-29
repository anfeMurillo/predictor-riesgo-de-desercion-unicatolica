--[Modulo 7]

CREATE TABLE in_process.estado_final_estudiantes AS
WITH a AS (
SELECT
    id_estudiante,
    estado_final
FROM in_process.historial
WHERE
    estado_final = 0 AND id_estudiante
                             NOT IN
                                    (
                                        SELECT id_estudiante
                                        FROM in_process.historial
                                        WHERE estado_final = 1
                                    )
   OR
    estado_final = 1
GROUP BY id_estudiante, estado_final
ORDER BY id_estudiante)

SELECT DISTINCT id_estudiante,a.estado_final
FROM in_process.estudiantes
FULL OUTER JOIN a USING (id_estudiante)
ORDER BY id_estudiante;

-- [Estado final] 2 -> Estudiando

UPDATE in_process.estado_final_estudiantes SET estado_final = 2
WHERE estado_final IS NULL ;

CREATE SCHEMA processed;

CREATE TABLE processed.data_set AS
WITH a AS (
SELECT * FROM in_process.estudiantes
INNER JOIN in_process.union_final USING (id_estudiante))

SELECT * FROM a
INNER JOIN in_process.estado_final_estudiantes USING (id_estudiante)
ORDER BY id_estudiante,periodo_inicio;