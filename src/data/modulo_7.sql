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



ALTER TABLE processed.data_set
    ALTER COLUMN pih_0 TYPE integer USING ROUND(pih_0::numeric,1),
    ALTER COLUMN pnf_0 TYPE integer USING ROUND(pnf_0::numeric,1),
    ALTER COLUMN pih_1 TYPE integer USING ROUND(pih_1::numeric,1),
    ALTER COLUMN pnf_1 TYPE integer USING ROUND(pnf_1::numeric,1),
    ALTER COLUMN pih_2 TYPE integer USING ROUND(pih_2::numeric,1),
    ALTER COLUMN pnf_2 TYPE integer USING ROUND(pnf_2::numeric,1),
    ALTER COLUMN pih_3 TYPE integer USING ROUND(pih_3::numeric,1),
    ALTER COLUMN pnf_3 TYPE integer USING ROUND(pnf_3::numeric,1),
    ALTER COLUMN pih_4 TYPE integer USING ROUND(pih_4::numeric,1),
    ALTER COLUMN pnf_4 TYPE integer USING ROUND(pnf_4::numeric,1),
    ALTER COLUMN pih_5 TYPE integer USING ROUND(pih_5::numeric,1),
    ALTER COLUMN pnf_5 TYPE integer USING ROUND(pnf_5::numeric,1),
    ALTER COLUMN pih_6 TYPE integer USING ROUND(pih_6::numeric,1),
    ALTER COLUMN pnf_6 TYPE integer USING ROUND(pnf_6::numeric,1),
    ALTER COLUMN pih_7 TYPE integer USING ROUND(pih_7::numeric,1),
    ALTER COLUMN pnf_7 TYPE integer USING ROUND(pnf_7::numeric,1),
    ALTER COLUMN pih_8 TYPE integer USING ROUND(pih_8::numeric,1),
    ALTER COLUMN pnf_8 TYPE integer USING ROUND(pnf_8::numeric,1),
    ALTER COLUMN pih_9 TYPE integer USING ROUND(pih_9::numeric,1),
    ALTER COLUMN pnf_9 TYPE integer USING ROUND(pnf_9::numeric,1),
    ALTER COLUMN pih_10 TYPE integer USING ROUND(pih_10::numeric,1),
    ALTER COLUMN pnf_10 TYPE integer USING ROUND(pnf_10::numeric,1),
    ALTER COLUMN pih_11 TYPE integer USING ROUND(pih_11::numeric,1),
    ALTER COLUMN pnf_11 TYPE integer USING ROUND(pnf_11::numeric,1),
    ALTER COLUMN pih_12 TYPE integer USING ROUND(pih_12::numeric,1),
    ALTER COLUMN pnf_12 TYPE integer USING ROUND(pnf_12::numeric,1),
    ALTER COLUMN pih_13 TYPE integer USING ROUND(pih_13::numeric,1),
    ALTER COLUMN pnf_13 TYPE integer USING ROUND(pnf_13::numeric,1),
    ALTER COLUMN pih_14 TYPE integer USING ROUND(pih_14::numeric,1),
    ALTER COLUMN pnf_14 TYPE integer USING ROUND(pnf_14::numeric,1),
    ALTER COLUMN pih_15 TYPE integer USING ROUND(pih_15::numeric,1),
    ALTER COLUMN pnf_15 TYPE integer USING ROUND(pnf_15::numeric,1),
    ALTER COLUMN pih_16 TYPE integer USING ROUND(pih_16::numeric,1),
    ALTER COLUMN pnf_16 TYPE integer USING ROUND(pnf_16::numeric,1),
    ALTER COLUMN pih_17 TYPE integer USING ROUND(pih_17::numeric,1),
    ALTER COLUMN pnf_17 TYPE integer USING ROUND(pnf_17::numeric,1),
    ALTER COLUMN pih_18 TYPE integer USING ROUND(pih_18::numeric,1),
    ALTER COLUMN pnf_18 TYPE integer USING ROUND(pnf_18::numeric,1),
    ALTER COLUMN pih_19 TYPE integer USING ROUND(pih_19::numeric,1),
    ALTER COLUMN pnf_19 TYPE integer USING ROUND(pnf_19::numeric,1),
    ALTER COLUMN pih_20 TYPE integer USING ROUND(pih_20::numeric,1),
    ALTER COLUMN pnf_20 TYPE integer USING ROUND(pnf_20::numeric,1),
    ALTER COLUMN pih_21 TYPE integer USING ROUND(pih_21::numeric,1),
    ALTER COLUMN pnf_21 TYPE integer USING ROUND(pnf_21::numeric,1),
    ALTER COLUMN pih_22 TYPE integer USING ROUND(pih_22::numeric,1),
    ALTER COLUMN pnf_22 TYPE integer USING ROUND(pnf_22::numeric,1),
    ALTER COLUMN pih_23 TYPE integer USING ROUND(pih_23::numeric,1),
    ALTER COLUMN pnf_23 TYPE integer USING ROUND(pnf_23::numeric,1),
    ALTER COLUMN pih_24 TYPE integer USING ROUND(pih_24::numeric,1),
    ALTER COLUMN pnf_24 TYPE integer USING ROUND(pnf_24::numeric,1),
    ALTER COLUMN pih_25 TYPE integer USING ROUND(pih_25::numeric,1),
    ALTER COLUMN pnf_25 TYPE integer USING ROUND(pnf_25::numeric,1),
    ALTER COLUMN pih_26 TYPE integer USING ROUND(pih_26::numeric,1),
    ALTER COLUMN pnf_26 TYPE integer USING ROUND(pnf_26::numeric,1),
    ALTER COLUMN pih_27 TYPE integer USING ROUND(pih_27::numeric,1),
    ALTER COLUMN pnf_27 TYPE integer USING ROUND(pnf_27::numeric,1),
    ALTER COLUMN pih_28 TYPE integer USING ROUND(pih_28::numeric,1),
    ALTER COLUMN pnf_28 TYPE integer USING ROUND(pnf_28::numeric,1),
    ALTER COLUMN pih_29 TYPE integer USING ROUND(pih_29::numeric,1),
    ALTER COLUMN pnf_29 TYPE integer USING ROUND(pnf_29::numeric,1),
    ALTER COLUMN pih_30 TYPE integer USING ROUND(pih_30::numeric,1),
    ALTER COLUMN pnf_30 TYPE integer USING ROUND(pnf_30::numeric,1),
    ALTER COLUMN pih_31 TYPE integer USING ROUND(pih_31::numeric,1),
    ALTER COLUMN pnf_31 TYPE integer USING ROUND(pnf_31::numeric,1),
    ALTER COLUMN pih_32 TYPE integer USING ROUND(pih_32::numeric,1),
    ALTER COLUMN pnf_32 TYPE integer USING ROUND(pnf_32::numeric,1),
    ALTER COLUMN pih_33 TYPE integer USING ROUND(pih_33::numeric,1),
    ALTER COLUMN pnf_33 TYPE integer USING ROUND(pnf_33::numeric,1),
    ALTER COLUMN pih_34 TYPE integer USING ROUND(pih_34::numeric,1),
    ALTER COLUMN pnf_34 TYPE integer USING ROUND(pnf_34::numeric,1),
    ALTER COLUMN pih_35 TYPE integer USING ROUND(pih_35::numeric,1),
    ALTER COLUMN pnf_35 TYPE integer USING ROUND(pnf_35::numeric,1),
    ALTER COLUMN pih_36 TYPE integer USING ROUND(pih_36::numeric,1),
    ALTER COLUMN pnf_36 TYPE integer USING ROUND(pnf_36::numeric,1),
    ALTER COLUMN pih_37 TYPE integer USING ROUND(pih_37::numeric,1),
    ALTER COLUMN pnf_37 TYPE integer USING ROUND(pnf_37::numeric,1),
    ALTER COLUMN pih_38 TYPE integer USING ROUND(pih_38::numeric,1),
    ALTER COLUMN pnf_38 TYPE integer USING ROUND(pnf_38::numeric,1),
    ALTER COLUMN pih_39 TYPE integer USING ROUND(pih_39::numeric,1),
    ALTER COLUMN pnf_39 TYPE integer USING ROUND(pnf_39::numeric,1),
    ALTER COLUMN pih_40 TYPE integer USING ROUND(pih_40::numeric,1),
    ALTER COLUMN pnf_40 TYPE integer USING ROUND(pnf_40::numeric,1),
    ALTER COLUMN pih_41 TYPE integer USING ROUND(pih_41::numeric,1),
    ALTER COLUMN pnf_41 TYPE integer USING ROUND(pnf_41::numeric,1),
    ALTER COLUMN pih_42 TYPE integer USING ROUND(pih_42::numeric,1),
    ALTER COLUMN pnf_42 TYPE integer USING ROUND(pnf_42::numeric,1),
    ALTER COLUMN pih_43 TYPE integer USING ROUND(pih_43::numeric,1),
    ALTER COLUMN pnf_43 TYPE integer USING ROUND(pnf_43::numeric,1),
    ALTER COLUMN pih_44 TYPE integer USING ROUND(pih_44::numeric,1),
    ALTER COLUMN pnf_44 TYPE integer USING ROUND(pnf_44::numeric,1),
    ALTER COLUMN pih_45 TYPE integer USING ROUND(pih_45::numeric,1),
    ALTER COLUMN pnf_45 TYPE integer USING ROUND(pnf_45::numeric,1),
    ALTER COLUMN pih_46 TYPE integer USING ROUND(pih_46::numeric,1),
    ALTER COLUMN pnf_46 TYPE integer USING ROUND(pnf_46::numeric,1),
    ALTER COLUMN pih_47 TYPE integer USING ROUND(pih_47::numeric,1),
    ALTER COLUMN pnf_47 TYPE integer USING ROUND(pnf_47::numeric,1),
    ALTER COLUMN pih_48 TYPE integer USING ROUND(pih_48::numeric,1),
    ALTER COLUMN pnf_48 TYPE integer USING ROUND(pnf_48::numeric,1),
    ALTER COLUMN pih_49 TYPE integer USING ROUND(pih_49::numeric,1),
    ALTER COLUMN pnf_49 TYPE integer USING ROUND(pnf_49::numeric,1),
    ALTER COLUMN pih_50 TYPE integer USING ROUND(pih_50::numeric,1),
    ALTER COLUMN pnf_50 TYPE integer USING ROUND(pnf_50::numeric,1),
    ALTER COLUMN pih_51 TYPE integer USING ROUND(pih_51::numeric,1),
    ALTER COLUMN pnf_51 TYPE integer USING ROUND(pnf_51::numeric,1),
    ALTER COLUMN pih_52 TYPE integer USING ROUND(pih_52::numeric,1),
    ALTER COLUMN pnf_52 TYPE integer USING ROUND(pnf_52::numeric,1),
    ALTER COLUMN pih_53 TYPE integer USING ROUND(pih_53::numeric,1),
    ALTER COLUMN pnf_53 TYPE integer USING ROUND(pnf_53::numeric,1),
    ALTER COLUMN pih_54 TYPE integer USING ROUND(pih_54::numeric,1),
    ALTER COLUMN pnf_54 TYPE integer USING ROUND(pnf_54::numeric,1),
    ALTER COLUMN pih_55 TYPE integer USING ROUND(pih_55::numeric,1),
    ALTER COLUMN pnf_55 TYPE integer USING ROUND(pnf_55::numeric,1),
    ALTER COLUMN pih_56 TYPE integer USING ROUND(pih_56::numeric,1),
    ALTER COLUMN pnf_56 TYPE integer USING ROUND(pnf_56::numeric,1),
    ALTER COLUMN pih_57 TYPE integer USING ROUND(pih_57::numeric,1),
    ALTER COLUMN pnf_57 TYPE integer USING ROUND(pnf_57::numeric,1),
    ALTER COLUMN pih_58 TYPE integer USING ROUND(pih_58::numeric,1),
    ALTER COLUMN pnf_58 TYPE integer USING ROUND(pnf_58::numeric,1),
    ALTER COLUMN pih_59 TYPE integer USING ROUND(pih_59::numeric,1),
    ALTER COLUMN pnf_59 TYPE integer USING ROUND(pnf_59::numeric,1),
    ALTER COLUMN pih_60 TYPE integer USING ROUND(pih_60::numeric,1),
    ALTER COLUMN pnf_60 TYPE integer USING ROUND(pnf_60::numeric,1),
    ALTER COLUMN pih_61 TYPE integer USING ROUND(pih_61::numeric,1),
    ALTER COLUMN pnf_61 TYPE integer USING ROUND(pnf_61::numeric,1),
    ALTER COLUMN pih_62 TYPE integer USING ROUND(pih_62::numeric,1),
    ALTER COLUMN pnf_62 TYPE integer USING ROUND(pnf_62::numeric,1),
    ALTER COLUMN pih_63 TYPE integer USING ROUND(pih_63::numeric,1),
    ALTER COLUMN pnf_63 TYPE integer USING ROUND(pnf_63::numeric,1),
    ALTER COLUMN pih_64 TYPE integer USING ROUND(pih_64::numeric,1),
    ALTER COLUMN pnf_64 TYPE integer USING ROUND(pnf_64::numeric,1),
    ALTER COLUMN pih_65 TYPE integer USING ROUND(pih_65::numeric,1),
    ALTER COLUMN pnf_65 TYPE integer USING ROUND(pnf_65::numeric,1),
    ALTER COLUMN pih_66 TYPE integer USING ROUND(pih_66::numeric,1),
    ALTER COLUMN pnf_66 TYPE integer USING ROUND(pnf_66::numeric,1);

