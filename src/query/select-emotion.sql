SELECT creature.name, emotion.name as emotion, emotion.description
FROM creature, creature_emotion, emotion
WHERE creature.id = creature_emotion.creature_id
  AND emotion.id = creature_emotion.emotion_id
ORDER BY creature.name;
