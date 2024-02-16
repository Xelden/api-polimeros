-- Crear tablas
CREATE TABLE polymers(
    id INT PRIMARY KEY,
    nombre VARCHAR(60),
    abreviatura VARCHAR(5)
);

CREATE TABLE types(
    id INT PRIMARY KEY,
    nombre VARCHAR(60)
);

CREATE TABLE hierarchy_types(
    type_superior_id INT,
    type_inferior_id INT
);

CREATE TABLE polymers_types(
    polymer_id INT,
    type_id INT
);

CREATE TABLE propiedades(
    polymer_id INT PRIMARY KEY,
    densidad                FLOAT,
    cristalinidad           FLOAT,
    punto_de_fusion         FLOAT,
    resistencia_al_creep    FLOAT,
    esfuerzo_a_tension      FLOAT,
    rigidez                 FLOAT,
    dureza                  FLOAT,
    resistencia_impacto     FLOAT,
    transparencia           FLOAT,
    estabilidad_uv          FLOAT,
    resistencia_solventes   FLOAT,
    permeabilidad           FLOAT,
    contraccion             FLOAT,
    resistencia_oxidacion   FLOAT
);

-- Llenar información
INSERT INTO polymers(id, nombre, abreviatura)
VALUES (
    1,  'Polietileno',              'PE'
);

INSERT INTO polymers(id, nombre, abreviatura)
VALUES (
    2,	'Polipropileno',            'PPP'
);

INSERT INTO polymers(id, nombre, abreviatura)
VALUES (
    3,	'Polivinilclorado',         'PPVC'
);

INSERT INTO polymers(id, nombre, abreviatura)
VALUES (
    4,	'Poliesrireno',             'PPS'
);

INSERT INTO polymers(id, nombre, abreviatura)
VALUES (
    5,	'Polietilentereftalato',    'PPET'
);

INSERT INTO polymers(id, nombre, abreviatura)
VALUES (
    6,	'Poliamidas',               'PPA'
);

INSERT INTO polymers(id, nombre, abreviatura)
VALUES (
    7,	'Polioximetilenos',         'PPOM'
);

INSERT INTO polymers(id, nombre, abreviatura)
VALUES (
    8,	'Policarbonato',            'PPC'
);

INSERT INTO polymers(id, nombre, abreviatura)
VALUES (
    9,	'Poliacrilonitrilo',        'PPAN'
);

INSERT INTO polymers(id, nombre, abreviatura)
VALUES (
    10,	'Politetraflouroetileno',   'PPTFE'
);

INSERT INTO types(id, nombre)
VALUES (
    1,  'Comportamiento con la temperatura'
);

INSERT INTO types(id, nombre)
VALUES (
    2,  'Termoplásticos'
);

INSERT INTO types(id, nombre)
VALUES (
    3,  'Plásticos comunes'
);

INSERT INTO types(id, nombre)
VALUES (
    4,  'Plásticos de ingeniería'
);

INSERT INTO hierarchy_types(type_superior_id, type_inferior_id)
VALUES(
    -- Comportamiento con la temperatura
    1, 2
);

INSERT INTO hierarchy_types(type_superior_id, type_inferior_id)
VALUES(
    -- Termoplásticos
    2, 3
);

INSERT INTO hierarchy_types(type_superior_id, type_inferior_id)
VALUES(
    2, 4
);

-- Polietileno
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    1, 1
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    1, 2
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    1, 3
);
-- Polipropileno
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    2, 1
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    2, 2
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    2, 3
);
-- Polivinilclorado
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    3, 1
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    3, 2
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    3, 3
);
-- Poliesrireno
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    4, 1
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    4, 2
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    4, 3
);
-- Polietilentereftalato
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    5, 1
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    5, 2
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    5, 3
);
-- Poliamidas
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    6, 1
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    6, 2
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    6, 4
);
-- Polioximetilenos
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    7, 1
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    7, 2
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    7, 4
);
-- Policarbonato
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    8, 1
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    8, 2
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    8, 4
);
-- Poliacrilonitrilo
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    9, 1
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    9, 2
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    9, 4
);
-- Politetraflouroetileno
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    10, 1
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    10, 2
);
INSERT INTO polymers_types(polymer_id, type_id)
VALUES (
    10, 4
);

