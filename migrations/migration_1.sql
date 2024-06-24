USE pandemic;

CREATE TABLE region(
   Region_id int primary key auto_increment,
   Entity varchar(50),
   Code varchar(8)
) SELECT DISTINCT Code, Entity
  FROM infectious_cases;

ALTER TABLE infectious_cases
ADD COLUMN Region_Id int;

UPDATE infectious_cases
SET Region_Id = (SELECT Region_id
                 FROM region
                 WHERE infectious_cases.Entity = region.Entity
                   AND (infectious_cases.Code = region.Code or infectious_cases.Code is null)
                 LIMIT 1)
Where Region_Id is null;

ALTER TABLE infectious_cases
MODIFY COLUMN Region_Id int not null,
ADD CONSTRAINT infectious_cases_region
FOREIGN KEY infectious_cases(Region_Id)
REFERENCES region(Region_Id);

ALTER table infectious_cases
DROP COLUMN Entity,
DROP COLUMN Code;


