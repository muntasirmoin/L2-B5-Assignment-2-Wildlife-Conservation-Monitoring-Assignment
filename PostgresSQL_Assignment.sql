CREATE DATABASE conservation_db;

-- create table rangers
CREATE TABLE rangers(
  ranger_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  region TEXT
);

-- create table species

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(150) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
     discovery_date DATE,
     conservation_status VARCHAR(100)
);

-- create table sightings

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT NOT NULL,
    species_id INT NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(100),
    note TEXT,
     FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id),
      FOREIGN KEY (species_id) REFERENCES species(species_id)
);

-- Sample Data Insertion Table rangers
INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');


--Sample Data Insertion Table species
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


--Sample Data Insertion Table sightings
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, note) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00',NULL);

--Problem 1

INSERT INTO rangers (name, region) VALUES
('Derek Fox','Coastal Plains');

--Problem 2

SELECT COUNT(DISTINCT sightings.species_id) AS unique_species_count FROM sightings; 

--Problem 3

SELECT * FROM sightings 
WHERE location like '%Pass%';

--Problem 4

SELECT r.name, COUNT(s.ranger_id) AS total_sightings
FROM rangers r
INNER JOIN sightings s on r.ranger_id = s.ranger_id
GROUP BY r.name
ORDER BY r.name;

--Problem 5

SELECT species.common_name
FROM species
LEFT JOIN sightings on species.species_id = sightings.species_id
WHERE sightings.species_id IS NULL
;

--Problem 6

SELECT species.common_name, si.sighting_time, rangers.name
FROM sightings si
JOIN species on si.species_id = species.species_id
JOIN rangers on si.ranger_id = rangers.ranger_id
ORDER BY si.sighting_time DESC
LIMIT 2;


--Problem 7

UPDATE species 
set conservation_status = 'Historic'
WHERE species.discovery_date < '1800-01-01';

--Problem 8

SELECT sighting_id,
CASE 
    WHEN EXTRACT(HOUR FROM sighting_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sighting_time) BETWEEN 12 AND 17 THEN 'Afternoon'  
    ELSE  'Evening'
END AS time_of_day
FROM sightings;

-- Problem 9
DELETE FROM rangers
WHERE ranger_id NOT IN (SELECT DISTINCT ranger_id FROM sightings)
;