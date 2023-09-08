-- Scheme Migration #1: Initialize Tables
-- Diagram: doc/lab-1/entity.puml

DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE SEQUENCE seq_kind_id START 1;

CREATE TABLE kind (
    id int PRIMARY KEY DEFAULT nextval('seq_kind_id'),
    name text NOT NULL UNIQUE
);


CREATE SEQUENCE seq_location_id START 1;

CREATE TABLE location (
    id int PRIMARY KEY DEFAULT nextval('seq_location_id'),
    name text NOT NULL UNIQUE
);


CREATE SEQUENCE seq_action_id START 1;

CREATE TABLE action (
    id int PRIMARY KEY DEFAULT nextval('seq_action_id'),
    name text NOT NULL,
    description text NOT NULL
);


CREATE SEQUENCE seq_emotion_id START 1;

CREATE TABLE emotion (
    id int PRIMARY KEY DEFAULT nextval('seq_action_id'),
    name text NOT NULL,
    description text NOT NULL
);


CREATE TYPE gender AS ENUM ('male', 'female', 'unknown');


CREATE SEQUENCE seq_creature_id START 1;

CREATE TABLE creature (
    id int PRIMARY KEY DEFAULT nextval('seq_creature_id'),
    name text NOT NULL,
    gender gender NOT NULL,
    kind_id int NOT NULL references kind(id),
    location_id int NOT NULL references location(id),
    mother_id int references creature(id)
);


CREATE TABLE creature_emotion (
    creature_id int references creature(id),
    emotion_id int references emotion(id)
);

CREATE TABLE creature_action (
    creature_id int references creature(id),
    action_id int references action(id)
);
