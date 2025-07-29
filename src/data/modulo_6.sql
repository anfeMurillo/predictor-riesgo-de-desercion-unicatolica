-- [Modulo 6]

CREATE VIEW repitencias AS
WITH d AS (
    WITH c AS (
        WITH b AS (
            WITH a AS (
            SELECT
                n.*,
                a.sub_area,
                COUNT(asignatura) OVER (PARTITION BY id_estudiante,asignatura) AS veces
            FROM in_process.notas_estudiantes n
            FULL OUTER JOIN in_process.asignaturas a ON n.asignatura = a.nombre_asignatura)

            SELECT DISTINCT * FROM a
            ORDER BY id_estudiante)

        SELECT DISTINCT
            id_estudiante,
            sub_area,
            veces,
            SUM
            (   CASE
                WHEN veces = 1 THEN 0
                WHEN veces != 1 THEN veces - 1
                END
            )
            OVER
            (PARTITION BY id_estudiante,sub_area) AS total
        FROM b
        GROUP BY id_estudiante, sub_area, veces
        ORDER BY id_estudiante,sub_area)

    SELECT
        DISTINCT
        id_estudiante,
        CASE WHEN sub_area IS NULL THEN 'SIN CATEGORIA' ELSE sub_area END,
        total AS total_veces
    FROM c)

SELECT * FROM d;


CREATE VIEW promedio_final AS
SELECT
    DISTINCT
    n.id_estudiante,
    CASE WHEN sub_area IS NULL THEN 'SIN CATEGORIA' ELSE sub_area END,
    AVG(intensidad_horaria) OVER (PARTITION BY id_estudiante,sub_area) AS promedio_intensidad_horaria,
    AVG(nota_final) OVER (PARTITION BY id_estudiante,sub_area) AS promedio_nota_final

    FROM in_process.notas_estudiantes n
    FULL OUTER JOIN in_process.asignaturas a ON n.asignatura = a.nombre_asignatura
    ORDER BY id_estudiante;

--[CREACION DE TABLAS POR CADA SUB AREA]

CREATE VIEW materia_0 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area = 'SIN CATEGORIA';

-- Script para la materia 1
CREATE VIEW materia_1 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 1);

-- Script para la materia 2
CREATE VIEW materia_2 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 2);

-- Script para la materia 3
CREATE VIEW materia_3 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 3);

-- Script para la materia 4
CREATE VIEW materia_4 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 4);

-- Script para la materia 5
CREATE VIEW materia_5 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 5);

-- Script para la materia 6
CREATE VIEW materia_6 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 6);

-- Script para la materia 7
CREATE VIEW materia_7 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 7);

-- Script para la materia 8
CREATE VIEW materia_8 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 8);

-- Script para la materia 9
CREATE VIEW materia_9 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 9);

-- Script para la materia 10
CREATE VIEW materia_10 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 10);

-- Script para la materia 11
CREATE VIEW materia_11 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 11);

-- Script para la materia 12
CREATE VIEW materia_12 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 12);

-- Script para la materia 13
CREATE VIEW materia_13 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 13);

-- Script para la materia 14
CREATE VIEW materia_14 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 14);

-- Script para la materia 15
CREATE VIEW materia_15 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 15);

-- Script para la materia 16
CREATE VIEW materia_16 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 16);

-- Script para la materia 17
CREATE VIEW materia_17 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 17);

-- Script para la materia 18
CREATE VIEW materia_18 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 18);

-- Script para la materia 19
CREATE VIEW materia_19 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 19);

-- Script para la materia 20
CREATE VIEW materia_20 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 20);

-- Script para la materia 21
CREATE VIEW materia_21 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 21);

-- Script para la materia 22
CREATE VIEW materia_22 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 22);

-- Script para la materia 23
CREATE VIEW materia_23 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 23);

-- Script para la materia 24
CREATE VIEW materia_24 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 24);

-- Script para la materia 25
CREATE VIEW materia_25 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 25);

-- Script para la materia 26
CREATE VIEW materia_26 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 26);

-- Script para la materia 27
CREATE VIEW materia_27 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 27);

-- Script para la materia 28
CREATE VIEW materia_28 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 28);

-- Script para la materia 29
CREATE VIEW materia_29 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 29);

-- Script para la materia 30
CREATE VIEW materia_30 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 30);

-- Script para la materia 31
CREATE VIEW materia_31 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 31);

-- Script para la materia 32
CREATE VIEW materia_32 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 32);

-- Script para la materia 33
CREATE VIEW materia_33 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 33);

-- Script para la materia 34
CREATE VIEW materia_34 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 34);

-- Script para la materia 35
CREATE VIEW materia_35 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 35);

-- Script para la materia 36
CREATE VIEW materia_36 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 36);

-- Script para la materia 37
CREATE VIEW materia_37 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 37);

-- Script para la materia 38
CREATE VIEW materia_38 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 38);

-- Script para la materia 39
CREATE VIEW materia_39 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 39);

-- Script para la materia 40
CREATE VIEW materia_40 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 40);

-- Script para la materia 41
CREATE VIEW materia_41 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 41);

-- Script para la materia 42
CREATE VIEW materia_42 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 42);

-- Script para la materia 43
CREATE VIEW materia_43 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 43);

-- Script para la materia 44
CREATE VIEW materia_44 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 44);

-- Script para la materia 45
CREATE VIEW materia_45 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 45);

-- Script para la materia 46
CREATE VIEW materia_46 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 46);

-- Script para la materia 47
CREATE VIEW materia_47 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 47);

-- Script para la materia 48
CREATE VIEW materia_48 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 48);

-- Script para la materia 49
CREATE VIEW materia_49 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 49);

-- Script para la materia 50
CREATE VIEW materia_50 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 50);

-- Script para la materia 51
CREATE VIEW materia_51 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 51);

-- Script para la materia 52
CREATE VIEW materia_52 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 52);

-- Script para la materia 53
CREATE VIEW materia_53 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 53);

-- Script para la materia 54
CREATE VIEW materia_54 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 54);

-- Script para la materia 55
CREATE VIEW materia_55 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 55);

-- Script para la materia 56
CREATE VIEW materia_56 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 56);

-- Script para la materia 57
CREATE VIEW materia_57 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 57);

-- Script para la materia 58
CREATE VIEW materia_58 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 58);

-- Script para la materia 59
CREATE VIEW materia_59 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 59);

-- Script para la materia 60
CREATE VIEW materia_60 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 60);

-- Script para la materia 61
CREATE VIEW materia_61 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 61);

-- Script para la materia 62
CREATE VIEW materia_62 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 62);

-- Script para la materia 63
CREATE VIEW materia_63 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 63);

-- Script para la materia 64
CREATE VIEW materia_64 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 64);

-- Script para la materia 65
CREATE VIEW materia_65 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 65);

-- Script para la materia 66
CREATE VIEW materia_66 AS
SELECT p.id_estudiante,p.promedio_intensidad_horaria,p.promedio_nota_final,r.total_veces as total_repitencias FROM promedio_final p
INNER JOIN repitencias r ON p.id_estudiante = r.id_estudiante AND p.sub_area = r.sub_area
WHERE p.sub_area in (SELECT sub_area FROM in_process.asignaturas WHERE id_asignatura = 66);



CREATE TABLE in_process.union_0 AS
SELECT
    x.id_estudiante,
    promedio_intensidad_horaria as pih_0,
    promedio_nota_final as pnf_0,
    total_repitencias as tr_0
FROM in_process.estudiantes x
FULL OUTER JOIN materia_0 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_0 SET pih_0 = 0 WHERE pih_0 IS NULL ;
UPDATE in_process.union_0 SET pnf_0 = 0 WHERE pnf_0 IS NULL ;
UPDATE in_process.union_0 SET tr_0 = 0 WHERE tr_0 IS NULL;

--

CREATE TABLE in_process.union_1 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_1,
    y.promedio_nota_final as pnf_1,
    y.total_repitencias as tr_1
FROM in_process.union_0 x
FULL OUTER JOIN materia_1 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_1 SET pih_1 = 0 WHERE pih_1 IS NULL ;
UPDATE in_process.union_1 SET pnf_1 = 0 WHERE pnf_1 IS NULL ;
UPDATE in_process.union_1 SET tr_1 = 0 WHERE tr_1 IS NULL;

--

CREATE TABLE in_process.union_2 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_2,
    y.promedio_nota_final as pnf_2,
    y.total_repitencias as tr_2
FROM in_process.union_1 x
FULL OUTER JOIN materia_2 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_2 SET pih_2 = 0 WHERE pih_2 IS NULL ;
UPDATE in_process.union_2 SET pnf_2 = 0 WHERE pnf_2 IS NULL ;
UPDATE in_process.union_2 SET tr_2 = 0 WHERE tr_2 IS NULL;

--

CREATE TABLE in_process.union_3 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_3,
    y.promedio_nota_final as pnf_3,
    y.total_repitencias as tr_3
FROM in_process.union_2 x
FULL OUTER JOIN materia_3 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_3 SET pih_3 = 0 WHERE pih_3 IS NULL;
UPDATE in_process.union_3 SET pnf_3 = 0 WHERE pnf_3 IS NULL;
UPDATE in_process.union_3 SET tr_3 = 0 WHERE tr_3 IS NULL;

--

CREATE TABLE in_process.union_4 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_4,
    y.promedio_nota_final as pnf_4,
    y.total_repitencias as tr_4
FROM in_process.union_3 x
FULL OUTER JOIN materia_4 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_4 SET pih_4 = 0 WHERE pih_4 IS NULL;
UPDATE in_process.union_4 SET pnf_4 = 0 WHERE pnf_4 IS NULL;
UPDATE in_process.union_4 SET tr_4 = 0 WHERE tr_4 IS NULL;

--

CREATE TABLE in_process.union_5 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_5,
    y.promedio_nota_final as pnf_5,
    y.total_repitencias as tr_5
FROM in_process.union_4 x
FULL OUTER JOIN materia_5 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_5 SET pih_5 = 0 WHERE pih_5 IS NULL;
UPDATE in_process.union_5 SET pnf_5 = 0 WHERE pnf_5 IS NULL;
UPDATE in_process.union_5 SET tr_5 = 0 WHERE tr_5 IS NULL;

--

CREATE TABLE in_process.union_6 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_6,
    y.promedio_nota_final as pnf_6,
    y.total_repitencias as tr_6
FROM in_process.union_5 x
FULL OUTER JOIN materia_6 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_6 SET pih_6 = 0 WHERE pih_6 IS NULL;
UPDATE in_process.union_6 SET pnf_6 = 0 WHERE pnf_6 IS NULL;
UPDATE in_process.union_6 SET tr_6 = 0 WHERE tr_6 IS NULL;

--

CREATE TABLE in_process.union_7 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_7,
    y.promedio_nota_final as pnf_7,
    y.total_repitencias as tr_7
FROM in_process.union_6 x
FULL OUTER JOIN materia_7 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_7 SET pih_7 = 0 WHERE pih_7 IS NULL;
UPDATE in_process.union_7 SET pnf_7 = 0 WHERE pnf_7 IS NULL;
UPDATE in_process.union_7 SET tr_7 = 0 WHERE tr_7 IS NULL;

--

CREATE TABLE in_process.union_8 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_8,
    y.promedio_nota_final as pnf_8,
    y.total_repitencias as tr_8
FROM in_process.union_7 x
FULL OUTER JOIN materia_8 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_8 SET pih_8 = 0 WHERE pih_8 IS NULL;
UPDATE in_process.union_8 SET pnf_8 = 0 WHERE pnf_8 IS NULL;
UPDATE in_process.union_8 SET tr_8 = 0 WHERE tr_8 IS NULL;

--

CREATE TABLE in_process.union_9 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_9,
    y.promedio_nota_final as pnf_9,
    y.total_repitencias as tr_9
FROM in_process.union_8 x
FULL OUTER JOIN materia_9 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_9 SET pih_9 = 0 WHERE pih_9 IS NULL;
UPDATE in_process.union_9 SET pnf_9 = 0 WHERE pnf_9 IS NULL;
UPDATE in_process.union_9 SET tr_9 = 0 WHERE tr_9 IS NULL;

--

CREATE TABLE in_process.union_10 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_10,
    y.promedio_nota_final as pnf_10,
    y.total_repitencias as tr_10
FROM in_process.union_9 x
FULL OUTER JOIN materia_10 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_10 SET pih_10 = 0 WHERE pih_10 IS NULL;
UPDATE in_process.union_10 SET pnf_10 = 0 WHERE pnf_10 IS NULL;
UPDATE in_process.union_10 SET tr_10 = 0 WHERE tr_10 IS NULL;

--

CREATE TABLE in_process.union_11 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_11,
    y.promedio_nota_final as pnf_11,
    y.total_repitencias as tr_11
FROM in_process.union_10 x
FULL OUTER JOIN materia_11 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_11 SET pih_11 = 0 WHERE pih_11 IS NULL;
UPDATE in_process.union_11 SET pnf_11 = 0 WHERE pnf_11 IS NULL;
UPDATE in_process.union_11 SET tr_11 = 0 WHERE tr_11 IS NULL;

--

CREATE TABLE in_process.union_12 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_12,
    y.promedio_nota_final as pnf_12,
    y.total_repitencias as tr_12
FROM in_process.union_11 x
FULL OUTER JOIN materia_12 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_12 SET pih_12 = 0 WHERE pih_12 IS NULL;
UPDATE in_process.union_12 SET pnf_12 = 0 WHERE pnf_12 IS NULL;
UPDATE in_process.union_12 SET tr_12 = 0 WHERE tr_12 IS NULL;

--

CREATE TABLE in_process.union_13 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_13,
    y.promedio_nota_final as pnf_13,
    y.total_repitencias as tr_13
FROM in_process.union_12 x
FULL OUTER JOIN materia_13 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_13 SET pih_13 = 0 WHERE pih_13 IS NULL;
UPDATE in_process.union_13 SET pnf_13 = 0 WHERE pnf_13 IS NULL;
UPDATE in_process.union_13 SET tr_13 = 0 WHERE tr_13 IS NULL;

--

CREATE TABLE in_process.union_14 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_14,
    y.promedio_nota_final as pnf_14,
    y.total_repitencias as tr_14
FROM in_process.union_13 x
FULL OUTER JOIN materia_14 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_14 SET pih_14 = 0 WHERE pih_14 IS NULL;
UPDATE in_process.union_14 SET pnf_14 = 0 WHERE pnf_14 IS NULL;
UPDATE in_process.union_14 SET tr_14 = 0 WHERE tr_14 IS NULL;

--

CREATE TABLE in_process.union_15 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_15,
    y.promedio_nota_final as pnf_15,
    y.total_repitencias as tr_15
FROM in_process.union_14 x
FULL OUTER JOIN materia_15 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_15 SET pih_15 = 0 WHERE pih_15 IS NULL;
UPDATE in_process.union_15 SET pnf_15 = 0 WHERE pnf_15 IS NULL;
UPDATE in_process.union_15 SET tr_15 = 0 WHERE tr_15 IS NULL;

--

CREATE TABLE in_process.union_16 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_16,
    y.promedio_nota_final as pnf_16,
    y.total_repitencias as tr_16
FROM in_process.union_15 x
FULL OUTER JOIN materia_16 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_16 SET pih_16 = 0 WHERE pih_16 IS NULL;
UPDATE in_process.union_16 SET pnf_16 = 0 WHERE pnf_16 IS NULL;
UPDATE in_process.union_16 SET tr_16 = 0 WHERE tr_16 IS NULL;

--

CREATE TABLE in_process.union_17 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_17,
    y.promedio_nota_final as pnf_17,
    y.total_repitencias as tr_17
FROM in_process.union_16 x
FULL OUTER JOIN materia_17 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_17 SET pih_17 = 0 WHERE pih_17 IS NULL;
UPDATE in_process.union_17 SET pnf_17 = 0 WHERE pnf_17 IS NULL;
UPDATE in_process.union_17 SET tr_17 = 0 WHERE tr_17 IS NULL;

--

CREATE TABLE in_process.union_18 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_18,
    y.promedio_nota_final as pnf_18,
    y.total_repitencias as tr_18
FROM in_process.union_17 x
FULL OUTER JOIN materia_18 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_18 SET pih_18 = 0 WHERE pih_18 IS NULL;
UPDATE in_process.union_18 SET pnf_18 = 0 WHERE pnf_18 IS NULL;
UPDATE in_process.union_18 SET tr_18 = 0 WHERE tr_18 IS NULL;

--

CREATE TABLE in_process.union_19 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_19,
    y.promedio_nota_final as pnf_19,
    y.total_repitencias as tr_19
FROM in_process.union_18 x
FULL OUTER JOIN materia_19 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_19 SET pih_19 = 0 WHERE pih_19 IS NULL;
UPDATE in_process.union_19 SET pnf_19 = 0 WHERE pnf_19 IS NULL;
UPDATE in_process.union_19 SET tr_19 = 0 WHERE tr_19 IS NULL;

--

CREATE TABLE in_process.union_20 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_20,
    y.promedio_nota_final as pnf_20,
    y.total_repitencias as tr_20
FROM in_process.union_19 x
FULL OUTER JOIN materia_20 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_20 SET pih_20 = 0 WHERE pih_20 IS NULL;
UPDATE in_process.union_20 SET pnf_20 = 0 WHERE pnf_20 IS NULL;
UPDATE in_process.union_20 SET tr_20 = 0 WHERE tr_20 IS NULL;

--

CREATE TABLE in_process.union_21 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_21,
    y.promedio_nota_final as pnf_21,
    y.total_repitencias as tr_21
FROM in_process.union_20 x
FULL OUTER JOIN materia_21 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_21 SET pih_21 = 0 WHERE pih_21 IS NULL;
UPDATE in_process.union_21 SET pnf_21 = 0 WHERE pnf_21 IS NULL;
UPDATE in_process.union_21 SET tr_21 = 0 WHERE tr_21 IS NULL;

--

CREATE TABLE in_process.union_22 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_22,
    y.promedio_nota_final as pnf_22,
    y.total_repitencias as tr_22
FROM in_process.union_21 x
FULL OUTER JOIN materia_22 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_22 SET pih_22 = 0 WHERE pih_22 IS NULL;
UPDATE in_process.union_22 SET pnf_22 = 0 WHERE pnf_22 IS NULL;
UPDATE in_process.union_22 SET tr_22 = 0 WHERE tr_22 IS NULL;

--

CREATE TABLE in_process.union_23 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_23,
    y.promedio_nota_final as pnf_23,
    y.total_repitencias as tr_23
FROM in_process.union_22 x
FULL OUTER JOIN materia_23 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_23 SET pih_23 = 0 WHERE pih_23 IS NULL;
UPDATE in_process.union_23 SET pnf_23 = 0 WHERE pnf_23 IS NULL;
UPDATE in_process.union_23 SET tr_23 = 0 WHERE tr_23 IS NULL;

--

CREATE TABLE in_process.union_24 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_24,
    y.promedio_nota_final as pnf_24,
    y.total_repitencias as tr_24
FROM in_process.union_23 x
FULL OUTER JOIN materia_24 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_24 SET pih_24 = 0 WHERE pih_24 IS NULL;
UPDATE in_process.union_24 SET pnf_24 = 0 WHERE pnf_24 IS NULL;
UPDATE in_process.union_24 SET tr_24 = 0 WHERE tr_24 IS NULL;

--

CREATE TABLE in_process.union_25 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_25,
    y.promedio_nota_final as pnf_25,
    y.total_repitencias as tr_25
FROM in_process.union_24 x
FULL OUTER JOIN materia_25 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_25 SET pih_25 = 0 WHERE pih_25 IS NULL;
UPDATE in_process.union_25 SET pnf_25 = 0 WHERE pnf_25 IS NULL;
UPDATE in_process.union_25 SET tr_25 = 0 WHERE tr_25 IS NULL;

--

CREATE TABLE in_process.union_26 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_26,
    y.promedio_nota_final as pnf_26,
    y.total_repitencias as tr_26
FROM in_process.union_25 x
FULL OUTER JOIN materia_26 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_26 SET pih_26 = 0 WHERE pih_26 IS NULL;
UPDATE in_process.union_26 SET pnf_26 = 0 WHERE pnf_26 IS NULL;
UPDATE in_process.union_26 SET tr_26 = 0 WHERE tr_26 IS NULL;

--

CREATE TABLE in_process.union_27 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_27,
    y.promedio_nota_final as pnf_27,
    y.total_repitencias as tr_27
FROM in_process.union_26 x
FULL OUTER JOIN materia_27 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_27 SET pih_27 = 0 WHERE pih_27 IS NULL;
UPDATE in_process.union_27 SET pnf_27 = 0 WHERE pnf_27 IS NULL;
UPDATE in_process.union_27 SET tr_27 = 0 WHERE tr_27 IS NULL;

--

CREATE TABLE in_process.union_28 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_28,
    y.promedio_nota_final as pnf_28,
    y.total_repitencias as tr_28
FROM in_process.union_27 x
FULL OUTER JOIN materia_28 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_28 SET pih_28 = 0 WHERE pih_28 IS NULL;
UPDATE in_process.union_28 SET pnf_28 = 0 WHERE pnf_28 IS NULL;
UPDATE in_process.union_28 SET tr_28 = 0 WHERE tr_28 IS NULL;

--

CREATE TABLE in_process.union_29 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_29,
    y.promedio_nota_final as pnf_29,
    y.total_repitencias as tr_29
FROM in_process.union_28 x
FULL OUTER JOIN materia_29 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_29 SET pih_29 = 0 WHERE pih_29 IS NULL;
UPDATE in_process.union_29 SET pnf_29 = 0 WHERE pnf_29 IS NULL;
UPDATE in_process.union_29 SET tr_29 = 0 WHERE tr_29 IS NULL;

--

CREATE TABLE in_process.union_30 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_30,
    y.promedio_nota_final as pnf_30,
    y.total_repitencias as tr_30
FROM in_process.union_29 x
FULL OUTER JOIN materia_30 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_30 SET pih_30 = 0 WHERE pih_30 IS NULL;
UPDATE in_process.union_30 SET pnf_30 = 0 WHERE pnf_30 IS NULL;
UPDATE in_process.union_30 SET tr_30 = 0 WHERE tr_30 IS NULL;

--

CREATE TABLE in_process.union_31 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_31,
    y.promedio_nota_final as pnf_31,
    y.total_repitencias as tr_31
FROM in_process.union_30 x
FULL OUTER JOIN materia_31 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_31 SET pih_31 = 0 WHERE pih_31 IS NULL;
UPDATE in_process.union_31 SET pnf_31 = 0 WHERE pnf_31 IS NULL;
UPDATE in_process.union_31 SET tr_31 = 0 WHERE tr_31 IS NULL;

--

CREATE TABLE in_process.union_32 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_32,
    y.promedio_nota_final as pnf_32,
    y.total_repitencias as tr_32
FROM in_process.union_31 x
FULL OUTER JOIN materia_32 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_32 SET pih_32 = 0 WHERE pih_32 IS NULL;
UPDATE in_process.union_32 SET pnf_32 = 0 WHERE pnf_32 IS NULL;
UPDATE in_process.union_32 SET tr_32 = 0 WHERE tr_32 IS NULL;

--

CREATE TABLE in_process.union_33 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_33,
    y.promedio_nota_final as pnf_33,
    y.total_repitencias as tr_33
FROM in_process.union_32 x
FULL OUTER JOIN materia_33 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_33 SET pih_33 = 0 WHERE pih_33 IS NULL;
UPDATE in_process.union_33 SET pnf_33 = 0 WHERE pnf_33 IS NULL;
UPDATE in_process.union_33 SET tr_33 = 0 WHERE tr_33 IS NULL;

--

CREATE TABLE in_process.union_34 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_34,
    y.promedio_nota_final as pnf_34,
    y.total_repitencias as tr_34
FROM in_process.union_33 x
FULL OUTER JOIN materia_34 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_34 SET pih_34 = 0 WHERE pih_34 IS NULL;
UPDATE in_process.union_34 SET pnf_34 = 0 WHERE pnf_34 IS NULL;
UPDATE in_process.union_34 SET tr_34 = 0 WHERE tr_34 IS NULL;

--

CREATE TABLE in_process.union_35 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_35,
    y.promedio_nota_final as pnf_35,
    y.total_repitencias as tr_35
FROM in_process.union_34 x
FULL OUTER JOIN materia_35 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_35 SET pih_35 = 0 WHERE pih_35 IS NULL;
UPDATE in_process.union_35 SET pnf_35 = 0 WHERE pnf_35 IS NULL;
UPDATE in_process.union_35 SET tr_35 = 0 WHERE tr_35 IS NULL;

--

CREATE TABLE in_process.union_36 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_36,
    y.promedio_nota_final as pnf_36,
    y.total_repitencias as tr_36
FROM in_process.union_35 x
FULL OUTER JOIN materia_36 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_36 SET pih_36 = 0 WHERE pih_36 IS NULL;
UPDATE in_process.union_36 SET pnf_36 = 0 WHERE pnf_36 IS NULL;
UPDATE in_process.union_36 SET tr_36 = 0 WHERE tr_36 IS NULL;

--

CREATE TABLE in_process.union_37 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_37,
    y.promedio_nota_final as pnf_37,
    y.total_repitencias as tr_37
FROM in_process.union_36 x
FULL OUTER JOIN materia_37 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_37 SET pih_37 = 0 WHERE pih_37 IS NULL;
UPDATE in_process.union_37 SET pnf_37 = 0 WHERE pnf_37 IS NULL;
UPDATE in_process.union_37 SET tr_37 = 0 WHERE tr_37 IS NULL;

--

CREATE TABLE in_process.union_38 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_38,
    y.promedio_nota_final as pnf_38,
    y.total_repitencias as tr_38
FROM in_process.union_37 x
FULL OUTER JOIN materia_38 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_38 SET pih_38 = 0 WHERE pih_38 IS NULL;
UPDATE in_process.union_38 SET pnf_38 = 0 WHERE pnf_38 IS NULL;
UPDATE in_process.union_38 SET tr_38 = 0 WHERE tr_38 IS NULL;

--

CREATE TABLE in_process.union_39 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_39,
    y.promedio_nota_final as pnf_39,
    y.total_repitencias as tr_39
FROM in_process.union_38 x
FULL OUTER JOIN materia_39 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_39 SET pih_39 = 0 WHERE pih_39 IS NULL;
UPDATE in_process.union_39 SET pnf_39 = 0 WHERE pnf_39 IS NULL;
UPDATE in_process.union_39 SET tr_39 = 0 WHERE tr_39 IS NULL;

--

CREATE TABLE in_process.union_40 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_40,
    y.promedio_nota_final as pnf_40,
    y.total_repitencias as tr_40
FROM in_process.union_39 x
FULL OUTER JOIN materia_40 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_40 SET pih_40 = 0 WHERE pih_40 IS NULL;
UPDATE in_process.union_40 SET pnf_40 = 0 WHERE pnf_40 IS NULL;
UPDATE in_process.union_40 SET tr_40 = 0 WHERE tr_40 IS NULL;

--

CREATE TABLE in_process.union_41 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_41,
    y.promedio_nota_final as pnf_41,
    y.total_repitencias as tr_41
FROM in_process.union_40 x
FULL OUTER JOIN materia_41 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_41 SET pih_41 = 0 WHERE pih_41 IS NULL;
UPDATE in_process.union_41 SET pnf_41 = 0 WHERE pnf_41 IS NULL;
UPDATE in_process.union_41 SET tr_41 = 0 WHERE tr_41 IS NULL;

--

CREATE TABLE in_process.union_42 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_42,
    y.promedio_nota_final as pnf_42,
    y.total_repitencias as tr_42
FROM in_process.union_41 x
FULL OUTER JOIN materia_42 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_42 SET pih_42 = 0 WHERE pih_42 IS NULL;
UPDATE in_process.union_42 SET pnf_42 = 0 WHERE pnf_42 IS NULL;
UPDATE in_process.union_42 SET tr_42 = 0 WHERE tr_42 IS NULL;

--

CREATE TABLE in_process.union_43 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_43,
    y.promedio_nota_final as pnf_43,
    y.total_repitencias as tr_43
FROM in_process.union_42 x
FULL OUTER JOIN materia_43 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_43 SET pih_43 = 0 WHERE pih_43 IS NULL;
UPDATE in_process.union_43 SET pnf_43 = 0 WHERE pnf_43 IS NULL;
UPDATE in_process.union_43 SET tr_43 = 0 WHERE tr_43 IS NULL;

--

CREATE TABLE in_process.union_44 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_44,
    y.promedio_nota_final as pnf_44,
    y.total_repitencias as tr_44
FROM in_process.union_43 x
FULL OUTER JOIN materia_44 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_44 SET pih_44 = 0 WHERE pih_44 IS NULL;
UPDATE in_process.union_44 SET pnf_44 = 0 WHERE pnf_44 IS NULL;
UPDATE in_process.union_44 SET tr_44 = 0 WHERE tr_44 IS NULL;

--

CREATE TABLE in_process.union_45 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_45,
    y.promedio_nota_final as pnf_45,
    y.total_repitencias as tr_45
FROM in_process.union_44 x
FULL OUTER JOIN materia_45 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_45 SET pih_45 = 0 WHERE pih_45 IS NULL;
UPDATE in_process.union_45 SET pnf_45 = 0 WHERE pnf_45 IS NULL;
UPDATE in_process.union_45 SET tr_45 = 0 WHERE tr_45 IS NULL;

--

CREATE TABLE in_process.union_46 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_46,
    y.promedio_nota_final as pnf_46,
    y.total_repitencias as tr_46
FROM in_process.union_45 x
FULL OUTER JOIN materia_46 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_46 SET pih_46 = 0 WHERE pih_46 IS NULL;
UPDATE in_process.union_46 SET pnf_46 = 0 WHERE pnf_46 IS NULL;
UPDATE in_process.union_46 SET tr_46 = 0 WHERE tr_46 IS NULL;

--

CREATE TABLE in_process.union_47 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_47,
    y.promedio_nota_final as pnf_47,
    y.total_repitencias as tr_47
FROM in_process.union_46 x
FULL OUTER JOIN materia_47 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_47 SET pih_47 = 0 WHERE pih_47 IS NULL;
UPDATE in_process.union_47 SET pnf_47 = 0 WHERE pnf_47 IS NULL;
UPDATE in_process.union_47 SET tr_47 = 0 WHERE tr_47 IS NULL;

--

CREATE TABLE in_process.union_48 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_48,
    y.promedio_nota_final as pnf_48,
    y.total_repitencias as tr_48
FROM in_process.union_47 x
FULL OUTER JOIN materia_48 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_48 SET pih_48 = 0 WHERE pih_48 IS NULL;
UPDATE in_process.union_48 SET pnf_48 = 0 WHERE pnf_48 IS NULL;
UPDATE in_process.union_48 SET tr_48 = 0 WHERE tr_48 IS NULL;

--

CREATE TABLE in_process.union_49 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_49,
    y.promedio_nota_final as pnf_49,
    y.total_repitencias as tr_49
FROM in_process.union_48 x
FULL OUTER JOIN materia_49 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_49 SET pih_49 = 0 WHERE pih_49 IS NULL;
UPDATE in_process.union_49 SET pnf_49 = 0 WHERE pnf_49 IS NULL;
UPDATE in_process.union_49 SET tr_49 = 0 WHERE tr_49 IS NULL;

--

CREATE TABLE in_process.union_50 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_50,
    y.promedio_nota_final as pnf_50,
    y.total_repitencias as tr_50
FROM in_process.union_49 x
FULL OUTER JOIN materia_50 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_50 SET pih_50 = 0 WHERE pih_50 IS NULL;
UPDATE in_process.union_50 SET pnf_50 = 0 WHERE pnf_50 IS NULL;
UPDATE in_process.union_50 SET tr_50 = 0 WHERE tr_50 IS NULL;

--

CREATE TABLE in_process.union_51 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_51,
    y.promedio_nota_final as pnf_51,
    y.total_repitencias as tr_51
FROM in_process.union_50 x
FULL OUTER JOIN materia_51 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_51 SET pih_51 = 0 WHERE pih_51 IS NULL;
UPDATE in_process.union_51 SET pnf_51 = 0 WHERE pnf_51 IS NULL;
UPDATE in_process.union_51 SET tr_51 = 0 WHERE tr_51 IS NULL;

--

CREATE TABLE in_process.union_52 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_52,
    y.promedio_nota_final as pnf_52,
    y.total_repitencias as tr_52
FROM in_process.union_51 x
FULL OUTER JOIN materia_52 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_52 SET pih_52 = 0 WHERE pih_52 IS NULL;
UPDATE in_process.union_52 SET pnf_52 = 0 WHERE pnf_52 IS NULL;
UPDATE in_process.union_52 SET tr_52 = 0 WHERE tr_52 IS NULL;

--

CREATE TABLE in_process.union_53 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_53,
    y.promedio_nota_final as pnf_53,
    y.total_repitencias as tr_53
FROM in_process.union_52 x
FULL OUTER JOIN materia_53 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_53 SET pih_53 = 0 WHERE pih_53 IS NULL;
UPDATE in_process.union_53 SET pnf_53 = 0 WHERE pnf_53 IS NULL;
UPDATE in_process.union_53 SET tr_53 = 0 WHERE tr_53 IS NULL;

--

CREATE TABLE in_process.union_54 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_54,
    y.promedio_nota_final as pnf_54,
    y.total_repitencias as tr_54
FROM in_process.union_53 x
FULL OUTER JOIN materia_54 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_54 SET pih_54 = 0 WHERE pih_54 IS NULL;
UPDATE in_process.union_54 SET pnf_54 = 0 WHERE pnf_54 IS NULL;
UPDATE in_process.union_54 SET tr_54 = 0 WHERE tr_54 IS NULL;

--

CREATE TABLE in_process.union_55 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_55,
    y.promedio_nota_final as pnf_55,
    y.total_repitencias as tr_55
FROM in_process.union_54 x
FULL OUTER JOIN materia_55 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_55 SET pih_55 = 0 WHERE pih_55 IS NULL;
UPDATE in_process.union_55 SET pnf_55 = 0 WHERE pnf_55 IS NULL;
UPDATE in_process.union_55 SET tr_55 = 0 WHERE tr_55 IS NULL;

--

CREATE TABLE in_process.union_56 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_56,
    y.promedio_nota_final as pnf_56,
    y.total_repitencias as tr_56
FROM in_process.union_55 x
FULL OUTER JOIN materia_56 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_56 SET pih_56 = 0 WHERE pih_56 IS NULL;
UPDATE in_process.union_56 SET pnf_56 = 0 WHERE pnf_56 IS NULL;
UPDATE in_process.union_56 SET tr_56 = 0 WHERE tr_56 IS NULL;

--

CREATE TABLE in_process.union_57 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_57,
    y.promedio_nota_final as pnf_57,
    y.total_repitencias as tr_57
FROM in_process.union_56 x
FULL OUTER JOIN materia_57 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_57 SET pih_57 = 0 WHERE pih_57 IS NULL;
UPDATE in_process.union_57 SET pnf_57 = 0 WHERE pnf_57 IS NULL;
UPDATE in_process.union_57 SET tr_57 = 0 WHERE tr_57 IS NULL;

--

CREATE TABLE in_process.union_58 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_58,
    y.promedio_nota_final as pnf_58,
    y.total_repitencias as tr_58
FROM in_process.union_57 x
FULL OUTER JOIN materia_58 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_58 SET pih_58 = 0 WHERE pih_58 IS NULL;
UPDATE in_process.union_58 SET pnf_58 = 0 WHERE pnf_58 IS NULL;
UPDATE in_process.union_58 SET tr_58 = 0 WHERE tr_58 IS NULL;

--

CREATE TABLE in_process.union_59 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_59,
    y.promedio_nota_final as pnf_59,
    y.total_repitencias as tr_59
FROM in_process.union_58 x
FULL OUTER JOIN materia_59 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_59 SET pih_59 = 0 WHERE pih_59 IS NULL;
UPDATE in_process.union_59 SET pnf_59 = 0 WHERE pnf_59 IS NULL;
UPDATE in_process.union_59 SET tr_59 = 0 WHERE tr_59 IS NULL;

--

CREATE TABLE in_process.union_60 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_60,
    y.promedio_nota_final as pnf_60,
    y.total_repitencias as tr_60
FROM in_process.union_59 x
FULL OUTER JOIN materia_60 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_60 SET pih_60 = 0 WHERE pih_60 IS NULL;
UPDATE in_process.union_60 SET pnf_60 = 0 WHERE pnf_60 IS NULL;
UPDATE in_process.union_60 SET tr_60 = 0 WHERE tr_60 IS NULL;

--

CREATE TABLE in_process.union_61 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_61,
    y.promedio_nota_final as pnf_61,
    y.total_repitencias as tr_61
FROM in_process.union_60 x
FULL OUTER JOIN materia_61 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_61 SET pih_61 = 0 WHERE pih_61 IS NULL;
UPDATE in_process.union_61 SET pnf_61 = 0 WHERE pnf_61 IS NULL;
UPDATE in_process.union_61 SET tr_61 = 0 WHERE tr_61 IS NULL;

--

CREATE TABLE in_process.union_62 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_62,
    y.promedio_nota_final as pnf_62,
    y.total_repitencias as tr_62
FROM in_process.union_61 x
FULL OUTER JOIN materia_62 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_62 SET pih_62 = 0 WHERE pih_62 IS NULL;
UPDATE in_process.union_62 SET pnf_62 = 0 WHERE pnf_62 IS NULL;
UPDATE in_process.union_62 SET tr_62 = 0 WHERE tr_62 IS NULL;

--

CREATE TABLE in_process.union_63 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_63,
    y.promedio_nota_final as pnf_63,
    y.total_repitencias as tr_63
FROM in_process.union_62 x
FULL OUTER JOIN materia_63 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_63 SET pih_63 = 0 WHERE pih_63 IS NULL;
UPDATE in_process.union_63 SET pnf_63 = 0 WHERE pnf_63 IS NULL;
UPDATE in_process.union_63 SET tr_63 = 0 WHERE tr_63 IS NULL;

--

CREATE TABLE in_process.union_64 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_64,
    y.promedio_nota_final as pnf_64,
    y.total_repitencias as tr_64
FROM in_process.union_63 x
FULL OUTER JOIN materia_64 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_64 SET pih_64 = 0 WHERE pih_64 IS NULL;
UPDATE in_process.union_64 SET pnf_64 = 0 WHERE pnf_64 IS NULL;
UPDATE in_process.union_64 SET tr_64 = 0 WHERE tr_64 IS NULL;

--

CREATE TABLE in_process.union_65 AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_65,
    y.promedio_nota_final as pnf_65,
    y.total_repitencias as tr_65
FROM in_process.union_64 x
FULL OUTER JOIN materia_65 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_65 SET pih_65 = 0 WHERE pih_65 IS NULL;
UPDATE in_process.union_65 SET pnf_65 = 0 WHERE pnf_65 IS NULL;
UPDATE in_process.union_65 SET tr_65 = 0 WHERE tr_65 IS NULL;

--

CREATE TABLE in_process.union_final AS
SELECT
    x.*,
    y.promedio_intensidad_horaria as pih_66,
    y.promedio_nota_final as pnf_66,
    y.total_repitencias as tr_66
FROM in_process.union_65 x
FULL OUTER JOIN materia_66 y ON y.id_estudiante::int8 = x.id_estudiante
ORDER BY x.id_estudiante;

UPDATE in_process.union_66 SET pih_66 = 0 WHERE pih_66 IS NULL;
UPDATE in_process.union_66 SET pnf_66 = 0 WHERE pnf_66 IS NULL;
UPDATE in_process.union_66 SET tr_66 = 0 WHERE tr_66 IS NULL;

-- [Liberacion de espacio]

drop table in_process.union_0;

drop table in_process.union_1;

drop table in_process.union_2;

drop table in_process.union_3;

drop table in_process.union_4;

drop table in_process.union_5;

drop table in_process.union_6;

drop table in_process.union_7;

drop table in_process.union_8;

drop table in_process.union_9;

drop table in_process.union_10;

drop table in_process.union_11;

drop table in_process.union_12;

drop table in_process.union_13;

drop table in_process.union_14;

drop table in_process.union_15;

drop table in_process.union_16;

drop table in_process.union_17;

drop table in_process.union_18;

drop table in_process.union_19;

drop table in_process.union_20;

drop table in_process.union_21;

drop table in_process.union_22;

drop table in_process.union_23;

drop table in_process.union_24;

drop table in_process.union_25;

drop table in_process.union_26;

drop table in_process.union_27;

drop table in_process.union_28;

drop table in_process.union_29;

drop table in_process.union_30;

drop table in_process.union_31;

drop table in_process.union_32;

drop table in_process.union_33;

drop table in_process.union_34;

drop table in_process.union_35;

drop table in_process.union_36;

drop table in_process.union_37;

drop table in_process.union_38;

drop table in_process.union_39;

drop table in_process.union_40;

drop table in_process.union_41;

drop table in_process.union_42;

drop table in_process.union_43;

drop table in_process.union_44;

drop table in_process.union_45;

drop table in_process.union_46;

drop table in_process.union_47;

drop table in_process.union_48;

drop table in_process.union_49;

drop table in_process.union_50;

drop table in_process.union_51;

drop table in_process.union_52;

drop table in_process.union_53;

drop table in_process.union_54;

drop table in_process.union_55;

drop table in_process.union_56;

drop table in_process.union_57;

drop table in_process.union_58;

drop table in_process.union_59;

drop table in_process.union_60;

drop table in_process.union_61;

drop table in_process.union_62;

drop table in_process.union_63;

drop table in_process.union_64;

drop table in_process.union_65;

drop view materia_0;

drop view materia_1;

drop view materia_2;

drop view materia_3;

drop view materia_4;

drop view materia_5;

drop view materia_6;

drop view materia_7;

drop view materia_8;

drop view materia_9;

drop view materia_10;

drop view materia_11;

drop view materia_12;

drop view materia_13;

drop view materia_14;

drop view materia_15;

drop view materia_16;

drop view materia_17;

drop view materia_18;

drop view materia_19;

drop view materia_20;

drop view materia_21;

drop view materia_22;

drop view materia_23;

drop view materia_24;

drop view materia_25;

drop view materia_26;

drop view materia_27;

drop view materia_28;

drop view materia_29;

drop view materia_30;

drop view materia_31;

drop view materia_32;

drop view materia_33;

drop view materia_34;

drop view materia_35;

drop view materia_36;

drop view materia_37;

drop view materia_38;

drop view materia_39;

drop view materia_40;

drop view materia_41;

drop view materia_42;

drop view materia_43;

drop view materia_44;

drop view materia_45;

drop view materia_46;

drop view materia_47;

drop view materia_48;

drop view materia_49;

drop view materia_50;

drop view materia_51;

drop view materia_52;

drop view materia_53;

drop view materia_54;

drop view materia_55;

drop view materia_56;

drop view materia_57;

drop view materia_58;

drop view materia_59;

drop view materia_60;

drop view materia_61;

drop view materia_62;

drop view materia_63;

drop view materia_64;

drop view materia_65;

drop view materia_66;

DROP VIEW promedio_final;

DROP VIEW repitencias;

DROP TABLE in_process.notas_estudiantes;

DROP TABLE in_process.asignaturas;