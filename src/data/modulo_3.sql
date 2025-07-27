-- [Modulo 3]

-- [Creacion de la tabla in_process.notas_estudiantes]

/*

REQUISITOS

|          Campo         | Tipo de valor esperado | 
|------------------------|------------------------|
|ID_ESTUDIANTE           | ENTERO                 |
|TIPO_ESTUDIANTE         | ENTERO                 |
|PERIODO                 | ENTERO                 |
|ASIGNATURA              | TEXTO                  |
|CREDITOS_ASIGNATURA     | ENTERO                 |
|INTENSIDAD_HORARIA      | DECIMAL                |
|NOTA_FINAL              | DECIMAL                |
*/

CREATE TABLE in_process.notas_estudiantes AS (
SELECT DISTINCT ID_ESTUDIANTE, TIPO_ESTUDIANTE, PERIODO, ASIGNATURA, CREDITOS_ASIGNATURA, INTENSIDAD_HORARIA, NOTA_FINAL FROM materias_inscritas m
    INNER JOIN in_process.estudiantes i ON i.id_estudiante = m.codigo_id::int8);

-- [Creacion de la tabla in_process.creditos_por_periodo]

/*

REQUISITOS

|          Campo         | Tipo de valor esperado | 
|------------------------|------------------------|
|ID_ESTUDIANTE           | ENTERO                 |
|PERIODO                 | ENTERO                 |
|CREDITOS_INSCRITOS      | ENTERO                 |
*/

CREATE TABLE in_process.creditos_por_periodo AS (
SELECT DISTINCT ID_ESTUDIANTE,PERIODO, CREDITOS_INSCRITOS FROM materias_inscritas m
    INNER JOIN in_process.estudiantes i ON i.id_estudiante = m.codigo_id::int8);