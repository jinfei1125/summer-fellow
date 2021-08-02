-- Successful Static SQL Query
SELECT *
FROM `covid-atlas.covid_atlas_test.vaccine_fully_vaccinated_cdc` 

PIVOT (
      SUM(count) FOR date IN ('2021-03-26', '2021-03-27')
  )


--Dynamic SQL
EXECUTE IMMEDIATE (             
SELECT '''SELECT * FROM `covid-atlas.covid_atlas_test.vaccine_fully_vaccinated_cdc`
  PIVOT(SUM(count) FOR date IN("''' ||  STRING_AGG(STRING(date), '", "')  || '''"))'''
FROM (SELECT DISTINCT date FROM `covid-atlas.covid_atlas_test.vaccine_fully_vaccinated_cdc` ORDER BY DATE) 
);