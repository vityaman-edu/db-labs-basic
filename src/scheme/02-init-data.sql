-- Scheme Migration #1: Inserting Testing DatA

INSERT INTO kind (name) VALUES
    ('Dinosaur'),
    ('Mysterious Creature');

INSERT INTO location (name) VALUES
    ('Tree in Jungles'),
    ('Somewhere in Jungles');

INSERT INTO action (name, description) VALUES
    ('Terrify', 'To make too painful an impression'),
    ('Climbing down', 'Climbing down'),
    ('Cackle', 'Shouting, making guffaws'),
    ('Push', 'Push'),
    ('Slowly trudge away', 'Slowly trudge away'),
    ('Sitting', 'Do nothing');

INSERT INTO emotion (name, description) VALUES
    ('Fear', 'Fear'),
    ('Confidence', 'Confidence'),
    ('Love', 'Love');

INSERT INTO creature (name, gender, kind_id, location_id, mother_id)
    SELECT 'Kostyan', 'unknown', kind.id, location.id, NULL 
    FROM kind, location
    WHERE kind.name = 'Mysterious Creature'
      AND location.name = 'Tree in Jungles';

INSERT INTO creature (name, gender, kind_id, location_id, mother_id)
    SELECT 'Dino-Mother', 'female', kind.id, location.id, NULL 
    FROM kind, location
    WHERE kind.name = 'Dinosaur'
      AND location.name = 'Somewhere in Jungles';

INSERT INTO creature (name, gender, kind_id, location_id, mother_id)
    SELECT 'Dino-Child', 'male', kind.id, location.id, mother.id 
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