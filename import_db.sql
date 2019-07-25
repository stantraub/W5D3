drop table cattoys; 
drop table cats; 
drop table toys; 

CREATE TABLE cats
(
  id SERIAL PRIMARY KEY,
  name VARCHAR(30),
  color VARCHAR(30),
  breed VARCHAR(30)
);

CREATE TABLE toys
(
  id SERIAL PRIMARY KEY,
  price int,
  color VARCHAR(30),
  name VARCHAR(30)
);

CREATE TABLE cattoys
(
  id SERIAL PRIMARY KEY,
  cat_id INT NOT NULL REFERENCES cats(id),
  toy_id INT NOT NULL REFERENCES toys(id)
);

INSERT INTO cats
  (name, color, breed)
VALUES
  ('ben', 'blue', 'shorthair'),
  ('jerry', 'black', 'persian'),
  ('mary', 'purple', 'siamese'),
  ('bobby', 'red', 'sphinx'),
  ('natalie', 'yellow', 'ginger');



INSERT INTO toys
  (price, color, name)
VALUES
  ('5', 'blue', 'ball'),
  ('3', 'green', 'string'),
  ('7', 'purple', 'mouse'),
  ('2', 'yellow', 'squeaky toy'),
  ('8', 'indigo', 'bone');

INSERT INTO cattoys
  (cat_id, toy_id)
VALUES
  (1, 1),
  (1,2),
  (2,4),
  (5,3),
  (4,5);


INSERT INTO cattoys
(cat_id, toy_id)
VALUES
(SELECT toys.name
FROM toys 
JOIN cattoys ON toys.id = cattoys.toy_id 
JOIN cats ON cats.id = cattoys.cat_id 
WHERE cats.name = 'tom';


SELECT toys.name AS toy_name, cats.name AS cat_name
FROM toys 
JOIN cattoys ON toys.id = cattoys.toy_id 
JOIN cats ON cattoys.cat_id = cats.id
WHERE cats.color = 'yellow' 
AND toys.color = 'yellow';

SELECT 