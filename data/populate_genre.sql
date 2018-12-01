use green_line_records;


insert into genre (genre_name)
values ('Indie'),
       ('Post-Hardcore'),
       ('Experimental'),
       ('Rock'),
       ('Classical'),
       ('Folk'),
       ('Pop'),
       ('Pop-punk'),
       ('Hardcore'),
       ('Hip-hop'),
       ('Conscious Rap'),
       ('Alternative'),
       ('Country'),
       ('Blues'),
       ('Shoegaze'),
       ('Soul'),
       ('Psychedelic'),
       ('R&B'),
       ('Singer-songwriter'),
       ('Orchestral'),
       ('Ambient'),
       ('Punk'),
       ('Jazz'),
       ('Math-rock'),
       ('Garage-rock'),
       ('Dream-pop'),
       ('Emo'),
       ('Electronic'),
       ('Future-funk'),
       ('Funk'),
       ('Lo-fi'),
       ('EDM'),
       ('Metal'),
       ('Drone'),
       ('Progressive Rock');

drop function if exists find_genre_id;
DELIMITER //
create function find_genre_id
  (
    genre varchar(50)
  )
  returns int
  BEGIN
    return (select genre_id from genre where genre_name like genre limit 1);
  END //
DELIMITER ;
