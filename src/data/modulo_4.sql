-- [Modulo 4]

/*

REQUISITOS

|          Campo         | Tipo de valor esperado | 
|------------------------|------------------------|
|ID_ESTUDIANTE           | ENTERO                 |
|PERIODO_ACADEMICO       | ENTERO                 |
|PGA                     | DECIMAL                 |

*/

--[Crear tabla in_process.promedio]

CREATE TABLE in_process.promedio AS (
SELECT p.ID_ESTUDIANTE, p.PERIODO_ACADEMICO, p.PGA AS PROMEDIO FROM pga AS p
INNER JOIN in_process.estudiantes e on p.id_estudiante = e.id_estudiante);

CREATE VIEW temporal_periodos AS
SELECT DISTINCT periodo FROM materias_inscritas ORDER BY periodo;



CREATE TABLE in_process.promedio_y_creditos AS
SELECT c.*, p.promedio FROM in_process.creditos_por_periodo c
INNER JOIN in_process.promedio p
    ON
        p.id_estudiante = c.id_estudiante
            and
        p.periodo_academico = c.periodo
ORDER BY id_estudiante;


CREATE VIEW temporal_estudiantes AS
SELECT id_estudiante::int8,p.periodo
FROM in_process.promedio_y_creditos pc
CROSS JOIN temporal_periodos p
ORDER BY id_estudiante,pc.periodo,p.periodo;


CREATE TABLE historial_promedio_creditos AS
WITH temporal AS (
SELECT * FROM temporal_estudiantes
EXCEPT
SELECT id_estudiante,periodo FROM in_process.promedio_y_creditos
ORDER BY id_estudiante,periodo)

SELECT * FROM in_process.promedio_y_creditos
UNION
SELECT *,(0) AS creditos_inscritos, (0) AS promedio FROM temporal
ORDER BY id_estudiante,periodo;