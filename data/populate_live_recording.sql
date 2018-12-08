USE green_line_records;

DROP function if exists find_live_recording_id;

DELIMITER //

DROP FUNCTION IF EXISTS find_live_recording_id;

create function find_live_recording_id
  (
    show_name_s  varchar(150),
    date_s       DATE,
    start_time_s TIME
  )
  returns int
  BEGIN
    return (select live_recording_id
            from live_recording
            where show_name like show_name_s
              and DATE(date) = date_s
              and TIME(start_time) = start_time_s
            limit 1);
  END //

DELIMITER ;


INSERT INTO live_recording (show_name, date, start_time, end_time, location_id)
VALUES ('Solo Euphonium and NU Wind Ensemble', '2018-10-04', '19:20:00', '20:30:00', 2),
       ('Four Wind Ensembles (Bands of the Beanpot)', '2018-10-28', '15:00:00', '17:30:00', 2),
       ('Recital with Solo flute and Piano, and Solo Flute with NU Wind Ensemble',
        '2018-11-11',
        '16:00:00',
        '18:00:00',
        2),
       ('NU Wind Ensemble', '2018-11-17', '16:00:00', NULL, 2),
       ('NU Concert Band Performance', '2018-11-18', '16:30:00', NULL, 2),
       ('Create Your Own Music Ensemble', '2018-11-26', '18:00:00', NULL, 2),
       ('Jazz Choir and Combo Ensemble, and a Voice Recital', '2018-12-04', '18:00:00', NULL, 2),
       ('Ensemble Concert', '2018-12-06', '18:00:00', NULL, 2),
       ('NU Immerse International Student Program final concert', '2018-12-09', '17:00:00', NULL, 2),
       ('BSO Concert', '2019-01-11', '13:30:00', NULL, 2),
       ('BSO Concert', '2019-04-12', '13:30:00', NULL, 2),
       ('BSO Concert', '2019-03-15', '13:30:00', NULL, 2);
