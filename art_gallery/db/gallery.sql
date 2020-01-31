DROP TABLE artworks;
DROP TABLE artists;
DROP TABLE exhibitions;

CREATE TABLE artists
(
  id SERIAL primary key,
  name VARCHAR(255),
  date_of_birth VARCHAR(255),
  alive VARCHAR(255)
);

CREATE TABLE exhibitions
(
  id SERIAL primary key,
name VARCHAR(255),
 info VARCHAR(255),
  active VARCHAR(255)
);

CREATE TABLE artworks
(
  id SERIAL primary key,
  title VARCHAR(255),
  exhibition_id INT references exhibitions(id),
  artist_id INT references artists(id),
  date VARCHAR(255),
  description VARCHAR(255)
);
