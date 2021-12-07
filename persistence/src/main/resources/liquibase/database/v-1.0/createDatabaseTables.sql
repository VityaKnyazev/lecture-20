CREATE TABLE IF NOT EXISTS categories (
id SERIAL NOT NULL,
name CHARACTER VARYING(25) NOT NULL,
description CHARACTER VARYING(70) NOT NULL DEFAULT '',

PRIMARY KEY(id),
UNIQUE(name)
);

CREATE TABLE IF NOT EXISTS producers (
id SERIAL NOT NULL,
name CHARACTER VARYING(40) NOT NULL,
postal_code CHARACTER(15) NOT NULL,
country CHARACTER VARYING(30) NOT NULL,
region CHARACTER VARYING(30) NOT NULL,
locality CHARACTER VARYING(40) NOT NULL,
street CHARACTER VARYING(50) DEFAULT '',
building CHARACTER VARYING(25) DEFAULT '',

PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS goods (
id SERIAL NOT NULL,
name CHARACTER VARYING(30) NOT NULL,
sort CHARACTER VARYING(30) NOT NULL,
description CHARACTER VARYING(900) NOT NULL DEFAULT '',
category_id INT NOT NULL,
producer_id INT NOT NULL,

PRIMARY KEY(id),
UNIQUE(name, sort, category_id, producer_id),

CONSTRAINT fk_category
FOREIGN KEY (category_id)
REFERENCES categories (id)
ON DELETE NO ACTION ON UPDATE NO ACTION,

CONSTRAINT fk_producer
FOREIGN KEY (producer_id)
REFERENCES producers (id)
ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TYPE unit_enum as ENUM('кг', 'г', 'т', 'ед', 'шт');

CREATE TABLE IF NOT EXISTS storehouse(
id SERIAL NOT NULL,
good_id INTEGER NOT NULL,
ttn_num VARCHAR(15),
date TIMESTAMPTZ NOT NULL DEFAULT now(),
unit unit_enum DEFAULT 'кг',
quantity INTEGER NOT NULL,
price MONEY NOT NULL,

PRIMARY KEY(id),

CONSTRAINT fk_good
FOREIGN KEY (good_id)
REFERENCES goods (id)
ON DELETE NO ACTION ON UPDATE NO ACTION
);