CREATE DATABASE assignment2;
--rangers table create
create table rangers (
    reng_id  SERIAL  PRIMARY KEY,
    fname VARCHAR (50),
    resion VARCHAR (30)
);

-- species table create 

CREATE Table species (
    s_id SERIAL PRIMARY KEY ,
    common_name VARCHAR (50) not null,
    scientific_name VARCHAR (50) not NULL,
    discover_date DATE not NULL,
     conservation_status TEXT DEFAULT 'Unknown'
)


-- sightigs table create

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(s_id),
    ranger_id INT REFERENCES rangers(reng_id),
    sighting_time TIMESTAMP NOT NULL,
    location TEXT NOT NULL,
    notes TEXT
);




--  Insert data into rangers 


INSERT INTO rangers (fname,resion) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');







--  Insert data into species


INSERT INTO species (common_name, scientific_name,discover_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');






--  Insert data into sightings



INSERT INTO sightings (species_id, ranger_id, sighting_time, location, notes) VALUES
(1, 1, '2024-05-10 07:45:00', 'Peak Ridge', 'Camera trap image captured'),
(2, 2, '2024-05-12 16:20:00', 'Bankwood Area', 'Juvenile seen'),
(3, 3, '2024-05-15 09:10:00', 'Bamboo Grove East', 'Feeding observed'),
(1, 2, '2024-05-18 18:30:00', 'Snowfall Pass', NULL);


SELECT * from rangers;

select * from species;

select * from sightings;


--Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

insert into rangers(fname , resion) VALUES ('Derek Fox','Coastal Plains');


--Count unique species ever sighted

SELECT count(DISTINCT species_id) as  unique_species_count  FROM sightings;


--Find all sightings where the location includes "Pass".

select * from sightings WHERE location ILIKE '%Pass%';


--List each ranger's name and their total number of sightings


SELECT fname as "name ", count(ranger_id)as total_sightings from rangers join sightings on rangers.reng_id = sightings.ranger_id
  GROUP BY rangers.fname ;



--List species that have never been sighted.

select common_name from species 
    where s_id not in (SELECT species_id from sightings)
 ;


-- Show the most recent 2 sightings.
  
select * from sightings join species on sightings.species_id= species.s_id  ORDER BY sighting_time DESC limit 2;


  -- Update all species discovered before year 1800 to have status 'Historic'.
  UPDATE species set conservation_status ='Historic' where discover_date < '1800-01-01';


--Delete rangers who have never sighted any species
DELETE FROM rangers
WHERE ranger_id NOT IN (
    SELECT DISTINCT ranger_id FROM sightings
);
