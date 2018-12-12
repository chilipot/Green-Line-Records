use green_line_records;

DROP function if exists find_location_id;

DELIMITER //
create function find_location_id
  (
    location_name_s varchar(100)
  )
  returns int
  BEGIN
    return (select location_id from location where location_name like location_name_s limit 1);
  END //

DELIMITER ;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE location;

SET FOREIGN_KEY_CHECKS = 1;

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
