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


CREATE TABLE in_process.historial_promedio_creditos AS
WITH temporal AS (
SELECT * FROM temporal_estudiantes
EXCEPT
SELECT id_estudiante,periodo FROM in_process.promedio_y_creditos
ORDER BY id_estudiante,periodo)


SELECT * FROM in_process.promedio_y_creditos
UNION
SELECT *,(0) AS creditos_inscritos, (0) AS promedio FROM temporal
ORDER BY id_estudiante,periodo;


/*

 0 -> SE GRADUO: +172 CREDITOS
 1 -> DESERTO: +2 PERIODOS EN APLAZO Y SIN 172 CREDITOS ACUMULADOS
 2 -> NO ESTA REGISTRADO: PERIODOS PREVIOS A PERIODO DE INICIO
 3 -> SE REGISTRO: PERIODO CON CREDITOS REGISTRADOS
 4 -> APLAZO: CREDITOS INSCRITOS ES IGUAL A CERO Y PERIODO ES POSTERIOS A PERIODO INICIO

 */

CREATE TABLE in_process.historial AS
WITH b AS (
    WITH a AS (
    SELECT
        i.id_estudiante ,
        p.periodo_inicio,
        i.periodo,
        promedio,
        i.creditos_inscritos,
        SUM(i.creditos_inscritos)
        OVER
        (PARTITION BY i.id_estudiante ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW )
        AS creditos_acumulados
    FROM in_process.historial_promedio_creditos i
    INNER JOIN in_process.estudiantes p ON p.id_estudiante = i.id_estudiante)
    SELECT *,
           SUM(
                CASE
                    WHEN creditos_inscritos = 0 AND periodo_inicio < periodo AND creditos_acumulados < 172 THEN 1
                    WHEN creditos_inscritos > 0 THEN 0
                    ELSE 0
                END)
           OVER
           (PARTITION BY id_estudiante ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS periodos_aplazados
    FROM a)

    SELECT
        *,
        (
            CASE
                WHEN creditos_acumulados >= 172 THEN 0
                WHEN periodos_aplazados > 2 AND creditos_acumulados != 172 THEN 1
                WHEN periodos_aplazados = 0 AND periodo < periodo_inicio THEN 2
                WHEN creditos_inscritos > 0 THEN 3
                WHEN periodos_aplazados IN (1,2) THEN 4
                END
            ) AS estado_final
    FROM b;