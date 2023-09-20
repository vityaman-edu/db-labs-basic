-- Scheme Migration #1: Inserting Testing DatA

INSERT INTO kind (name) VALUES
    ('Dinosaur'),
    ('Mysterious Creature');

INSERT INTO location (name, x, y, z) VALUES
    ('Tree in Jungles', 100, 100, 50),
    ('Somewhere in Jungles', 100, 100, 0);

INSERT INTO action (name, description, speed) VALUES
    ('Terrify', 'To make too painful an impression', 100),
    ('Climbing down', 'Climbing down', 5),
    ('Cackle', 'Shouting, making guffaws', 50),
    ('Push', 'Push', 10),
    ('Slowly trudge away', 'Slowly trudge away', 5),
    ('Sitting', 'Do nothing', 1);

INSERT INTO emotion (name, description, level) VALUES
    ('Fear', 'Fear', 5),
    ('Confidence', 'Confidence', 3),
    ('Love', 'Love', 10);

INSERT INTO creature (name, gender, kind_id, location_id, mother_id, weight)
    SELECT 'Kostyan', 'unknown', kind.id, location.id, NULL, 55
    FROM kind, location
    WHERE kind.name = 'Mysterious Creature'
      AND location.name = 'Tree in Jungles';

INSERT INTO creature (name, gender, kind_id, location_id, mother_id, weight)
    SELECT 'Dino-Mother', 'female', kind.id, location.id, NULL, 500
    FROM kind, location
    WHERE kind.name = 'Dinosaur'
      AND location.name = 'Somewhere in Jungles';

INSERT INTO creature (name, gender, kind_id, location_id, mother_id, weight)
    SELECT 'Dino-Child', 'male', kind.id, location.id, mother.id, 250
    FROM kind, location, creature as mother
    WHERE kind.name = 'Dinosaur'
      AND location.name = 'Somewhere in Jungles'
      AND mother.name = 'Dino-Mother';

INSERT INTO creature_emotion (creature_id, emotion_id)
    SELECT creature.id, emotion.id FROM creature, emotion 
    WHERE creature.name = 'Kostyan'
      AND emotion.name = 'Confidence';

INSERT INTO creature_emotion (creature_id, emotion_id)
    SELECT creature.id, emotion.id FROM creature, emotion 
    WHERE creature.name IN ('Dino-Mother', 'Dino-Child')
      AND emotion.name IN ('Fear', 'Love');

INSERT INTO creature_action (creature_id, action_id)
    SELECT creature.id, action.id FROM creature, action
    WHERE creature.name = 'Kostyan'
      AND action.name IN ('Terrify', 'Climbing down');

INSERT INTO creature_action (creature_id, action_id)
    SELECT creature.id, action.id FROM creature, action
    WHERE creature.name = 'Dino-Mother'
      AND action.name IN ('Cackle', 'Push', 'Slowly trudge away');

INSERT INTO creature_action (creature_id, action_id)
    SELECT creature.id, action.id FROM creature, action
    WHERE creature.name = 'Dino-Child'
      AND action.name IN ('Sitting');

INSERT INTO dream (owner_id, description, difficulty)
  SELECT id, 'To be happy and fall in love with some other creature', 999 
  FROM creature 
  WHERE creature.name = 'Kostyan';

INSERT INTO dream (owner_id, description, difficulty)
  SELECT id, 'To rise up a decent and strong child', 500
  FROM creature 
  WHERE creature.name = 'Dino-Mother';

INSERT INTO dream (owner_id, description, difficulty)
  SELECT id, 'To pass databases course on se.ifmo.ru', 250
  FROM creature 
  WHERE creature.name = 'Dino-Child';
