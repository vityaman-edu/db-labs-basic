SELECT creature.id, 
       creature.name, 
       creature.gender, 
       kind.name as kind,
       location.name as location,
       mother.name as mother
FROM creature
JOIN kind ON creature.kind_id = kind.id
JOIN location ON creature.location_id = location.id
LEFT JOIN creature as mother ON creature.mother_id = mother.id;
