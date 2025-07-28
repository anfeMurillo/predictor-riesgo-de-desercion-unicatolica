-- [Modulo 4 U]

/*
⚠️ ADVERTENCIA IMPORTANTE ⚠️

Este script ha sido diseñado para trabajar exclusivamente con la versión de la base de datos 
utilizada en la creación de este proyecto. Se asume que dicha base de datos mantiene las mismas 
inconsistencias, errores y variaciones detectadas en ese momento.

Si su base de datos ha sido actualizada o corregida (por ejemplo, se unificaron los nombres 
de las asignaturas o se ajustaron estructuras), utilice el MODO NORMAL, ya que este script 
podría generar resultados inconsistentes.

Para más detalles sobre:
  - Los problemas conocidos en la base de datos original.
  - La estructura del dataset esperado.
  - Las soluciones y normalizaciones aplicadas.

Consulte la documentación oficial en:
https://dbdocs.io/anfehumu2.0/Unicatolica
*/

--[Cambiar , por .] Corregir la columna pga de public.pga

UPDATE pga SET pga = REPLACE(pga,',','.');

--[Normalizar] Corregir tipo de dato.

ALTER TABLE pga
ALTER COLUMN periodo_academico TYPE int8 USING periodo_academico::int8;

--[Normalizar] Corregir tipo de dato.

ALTER TABLE pga
ALTER COLUMN pga TYPE float4 USING pga::float4;



--[Crear tabla in_process.promedio]

CREATE TABLE in_process.promedio AS (
SELECT p.ID_ESTUDIANTE::int8, p.PERIODO_ACADEMICO, p.PGA AS PROMEDIO FROM pga AS p
INNER JOIN in_process.estudiantes e on p.id_estudiante::int8 = e.id_estudiante::int8);

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

