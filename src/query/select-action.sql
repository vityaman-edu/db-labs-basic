SELECT creature.name, action.name as action, action.description
FROM creature, creature_action, action
WHERE creature.id = creature_action.creature_id
  AND action.id = creature_action.action_id
ORDER BY creature.name;
