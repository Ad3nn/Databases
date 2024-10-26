INSERT INTO petPet VALUES
    ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ("Whistler", "Gwen", "bird", NULL, "1997-12-09", NULL),
    ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ('Puffball','Diane','hamster','F','1999-03-30',NULL);

INSERT INTO petEvent VALUES
    ("Fluffy", "1995-05-15", "litter", "4 kittens, 3 female, 1 male"),
    ("Buffy", "1993-06-23", "litter", "5 puppies, 2 female, 3 male"),
    ("Buffy", "1994-06-19", "litter", "3 puppies, 3 female"),
    ("Chirpy", "1999-03-21", "vet", "needed beak straightened"),
    ("Slim", "1997-08-03", "vet", "broken rib"),
    ("Slim", "1997-10-04", "vet", "broken tooth"),
    ("Bowser", "1991-10-12", "kennel", NULL),
    ("Fang", "1991-10-12", "kennel", NULL),
    ("Fang", "1998-08-28", "birthday", "Gave him a new chew toy"),
    ("Claws", "1998-03-17","birthday", "Gave him a new flea collar"),
    ("Whistler", "1998-12-09", "birthday", "First birthday");

-- Insert Fluffy's vet visit event
INSERT INTO petEvent (Petname, Eventdate, Eventtype, Remark) 
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics');


-- Insert Hammy's vet visit event and record Hammy's details in petPet if they do not exist
INSERT INTO petPet (Petname, Owner, Species, Gender, Birth) 
VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30');

INSERT INTO petEvent (Petname, Eventdate, Eventtype, Remark) 
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');


-- Update Fluffy to indicate 5 kittens, 2 of which are male
UPDATE peEvent 
SET Remark = 'Had 5 kittens, 2 males'
WHERE Petname = 'Fluffy';


-- Add event for Claws breaking a rib on 1997-08-03
INSERT INTO petEvent (Petname, Eventdate, Eventtype, Remark) 
VALUES ('Claws', '1997-08-03', 'injury', 'broke rib');


-- Update Puffball's death date to reflect passing
UPDATE petPet 
SET Death = '2020-09-01' 
WHERE Petname = 'Puffball';


-- Remove Harold's dog (and all related events) from the database
DELETE FROM petEvent 
WHERE Petname = (SELECT Petname FROM petPet WHERE Owner = 'Harold');

DELETE FROM petPet 
WHERE Owner = 'Harold';