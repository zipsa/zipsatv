
SELECT DISTINCT
c.nct_id, c.name AS name_condition,
s.brief_title, s.start_date, s.phase,
a.name AS name_country,
string_agg(i.intervention_id::character varying(20), ' / ') AS id_intervention,
string_agg(i.name::character varying(20), ' / ') AS name_intervention,
t.intervention_type

FROM conditions c
LEFT JOIN studies s USING (nct_id)
LEFT JOIN countries a USING (nct_id)
LEFT JOIN intervention_other_names i USING (nct_id)
LEFT JOIN interventions t USING (nct_id)

WHERE a.name is not null AND i.intervention_id is not null AND intervention_type IN ('Drug') AND a.name IN ('United States')

GROUP BY c.nct_id, c.name, s.brief_title, s.start_date, s.phase, a.name, t.intervention_type
