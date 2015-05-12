SELECT 
    id_date, 
    datediff( id_date, current_date ) AS cpt_jour, 
    if( dayofweek( id_date ) = 1, 7, dayofweek( id_date ) - 1 ) as num_jour_semaine,
    cast( date_format( id_date, '%e' ) as unsigned ) as num_jour_mois,
    cast( date_format( id_date, '%j' ) as unsigned ) as num_jour_annee,
    year( id_date ) as id_annee,
    year( id_date ) - year( current_date ) as cpt_annee,
    year( id_date ) * 10 + if( quarter( id_date ) < 3,1,2) as id_semestre,
    ( date_format( id_date, '%y' ) * 2 + if( quarter( id_date ) < 3,1,2) )
    - ( date_format( current_date, '%y' ) * 2 + if( quarter( current_date ) < 3,1,2) ) as cpt_semestre,
    if( quarter( id_date ) < 3,1,2) as num_semestre,
    year( id_date ) * 10 + quarter( id_date ) as id_trimestre,
    ( date_format( id_date, '%y' ) * 4 + quarter( id_date ) )
    - ( date_format( current_date, '%y' ) * 4 + quarter( current_date ) ) as cpt_trimestre,
    quarter( id_date ) as num_trimestre,
    year( id_date ) * 100 + month( id_date ) as id_mois,
    ( date_format( id_date, '%y' ) * 12 + month( id_date ) )
    - ( date_format( current_date, '%y' ) * 12 + month( current_date ) ) as cpt_mois,
    month( id_date ) as num_mois,
    year( id_date ) * 100 + cast( date_format( id_date, '%v' ) as unsigned ) as id_semaine,
    cast( 
        datediff ( 
            id_date - INTERVAL if( dayofweek( id_date ) = 1, 7, dayofweek( id_date ) - 1 ) - 1 DAY,
            current_date - INTERVAL if( dayofweek( current_date ) = 1, 7, dayofweek( current_date ) - 1 ) - 1 DAY 
            )
        / 7 as signed 
        ) as cpt_semaine,
    cast( date_format( id_date, '%v' ) as unsigned) as num_semaine
FROM `temps_trv`
WHERE id_date >= '2009-01-01'
 




select 
CAST (1 as NUMBER) AS ID_LANGUE, 
trunc(id,'DD') as "Date", 
to_number(to_char(ID,'YYYY')) as ANNEE_ID, 
to_number(to_char(ID,'YY'))-to_number(to_char(today,'YY')) as ANNEE_CPT, 
-- 
to_number(to_char(ID,'YYYYQ')) as TRIMESTRE_ID, 
(to_number(to_char(ID,'YY'))*4+(to_char(ID,'Q'))) -(to_number(to_char(today,'YY'))*4+(to_char(today,'Q')))  as TRIMESTRE_CPT, 
to_char(ID,'Q') as TRIMESTRE_NO_ANNEE, 
-- 
to_number(to_char(ID,'YYYYMM')) as MOIS_ID, 
months_between (trunc (ID,'MM'),trunc(today,'MM'))  as MOIS_CPT, 
to_char(ID,'MM') as MOIS_NO_ANNEE, 
initcap (lower(to_char(ID,'MONTH','NLS_DATE_LANGUAGE=FRENCH'))) as MOIS_NOM_SEUL, 
initcap (lower(to_char(ID,'MON YYYY','NLS_DATE_LANGUAGE=FRENCH'))) as MOIS_NOM_COURT, 
initcap (lower(to_char(ID,'MONTH YYYY','NLS_DATE_LANGUAGE=FRENCH'))) as MOIS_NOM_LONG, 
--- 
to_number(to_char(ID,'IYYYIW')) as SEMAINE_ID, 
(trunc(id,'IW') -trunc(today,'IW')) /7 as SEMAINE_CPT, 
to_char(ID,'IW') as SEMAINE_NO_ANNEE, 
to_char(ID,'W') as SEMAINE_NO_MOIS, 
to_char(ID,'IW IYYY') as SEMAINE_NOM_LONG, 
--- 
to_number(to_char(ID,'YYYYMMDD')) as JOUR_ID, 
trunc(id,'DD') -trunc(today,'DD')as JOUR_CPT, 
to_char(id,'DDD') as JOUR_NO_ANNEE, 
to_char(id,'DD') as JOUR_NO_MOIS, 
to_char(id,'D') as JOUR_NO_SEMAINE, 
initcap (lower(to_char(ID,'DY','NLS_DATE_LANGUAGE=FRENCH'))) as JOUR_NOM_COURT, 
initcap (lower(to_char(ID,'DAY','NLS_DATE_LANGUAGE=FRENCH'))) as JOUR_NOM_LONG, 
FLAG_JOUR_FERIE from PERIODE,Z_TEMPS_CURRENT 
where ID>=to_date('01/01/2006','DD/MM/YYYY');

