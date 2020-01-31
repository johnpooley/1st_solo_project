DROP TABLE artists;
DROP TABLE exhibitions;

CREATE TABLE artists
(
  id SERIAL primary key,
  name VARCHAR(255),
  date_of_birth VARCHAR(255),
  alive BOOLEAN
)

CREATE TABLE exhibitions
(
  id SERIAL primary key,
name VARCHAR(255),
 info VARCHAR(255),
  active BOOLEAN,
)
