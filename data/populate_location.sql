use green_line_records;

SET FOREIGN_KEY_CHECKS=0;

TRUNCATE TABLE location;

SET FOREIGN_KEY_CHECKS=1;

INSERT INTO location (location_name)
VALUES ('Snell Quad'),
       ('Fenway Center'),
       ('Curry Student Center - McCleod Suite'),
       ('Ryder 354'),
       ('West F Basement'),
       ('Curry Student Center - Ballroom'),
       ('The Burren Backroom'),
       ('Phil\'s House'),
       ('Freshman Quad');

