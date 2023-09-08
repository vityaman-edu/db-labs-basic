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
    ('Slowly trudge away', 'Slowly trudge away');

INSERT INTO emotion (name, description) VALUES
    ('Fear', 'Fear');

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
