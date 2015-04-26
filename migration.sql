CREATE DATABASE fivestar;
\c fivestar

CREATE TABLE parties (id SERIAL PRIMARY KEY, name VARCHAR(255), count INTEGER);

CREATE TABLE orders (id SERIAL PRIMARY KEY, party_id INTEGER, food_id INTEGER, paid BOOLEAN, total INTEGER);

CREATE TABLE foods (id SERIAL PRIMARY KEY, cost INTEGER, name VARCHAR(255));