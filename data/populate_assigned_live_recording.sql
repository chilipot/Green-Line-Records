USE green_line_records;


TRUNCATE TABLE assigned_live_recording;
INSERT INTO assigned_live_recording (live_recording_id, engineer_id)
VALUES (find_live_recording_id('Solo Euphonium and NU Wind Ensemble', '2018-10-04', '19:20:00'),
        find_engineer_id('Gabriel', 'Pino')),
       (find_live_recording_id('Solo Euphonium and NU Wind Ensemble', '2018-10-04', '19:20:00'),
        find_engineer_id('Mike', 'Econ')),
       (find_live_recording_id('Solo Euphonium and NU Wind Ensemble', '2018-10-04', '19:20:00'),
        find_engineer_id('Spencer', 'Webb')),
       (find_live_recording_id('Four Wind Ensembles (Bands of the Beanpot)', '2018-10-28', '15:00:00'),
        find_engineer_id('Alex', 'Teitler')),
       (find_live_recording_id('Four Wind Ensembles (Bands of the Beanpot)', '2018-10-28', '15:00:00'),
        find_engineer_id('Chris', 'Miller')),
       (find_live_recording_id('Four Wind Ensembles (Bands of the Beanpot)', '2018-10-28', '15:00:00'),
        find_engineer_id('Connor', 'Modugno')),
       (find_live_recording_id('Four Wind Ensembles (Bands of the Beanpot)', '2018-10-28', '15:00:00'),
        find_engineer_id('Gabriel', 'Pino')),
       (find_live_recording_id('Recital with Solo Flute and Piano, and Solo Flute with NU Wind Ensemble', '2018-11-11',
                             '16:00:00'), find_engineer_id('Christian', 'Bobowicz')),
       (find_live_recording_id('Recital with Solo Flute and Piano, and Solo Flute with NU Wind Ensemble', '2018-11-11',
                             '16:00:00'), find_engineer_id('Mohamed', 'Horchani')),
       (find_live_recording_id('Recital with Solo Flute and Piano, and Solo Flute with NU Wind Ensemble', '2018-11-11',
                             '16:00:00'), find_engineer_id('Christina', 'Carol')),
       (find_live_recording_id('Recital with Solo Flute and Piano, and Solo Flute with NU Wind Ensemble', '2018-11-11',
                             '16:00:00'), find_engineer_id('Vivienne', 'Gao')),
       (find_live_recording_id('NU Wind Ensemble', '2018-11-17', '16:00:00'), find_engineer_id('Esteban', 'Espinoza')),
       (find_live_recording_id('NU Wind Ensemble', '2018-11-17', '16:00:00'), find_engineer_id('Ryan', 'Busse')),
       (find_live_recording_id('NU Concert Band Performance', '2018-11-18', '16:30:00'),
        find_engineer_id('Chris', 'Miller')),
       (find_live_recording_id('NU Concert Band Performance', '2018-11-18', '16:30:00'),
        find_engineer_id('Gabriel', 'Pino')),
       (find_live_recording_id('Create Your Own Music Ensemble', '2018-11-26', '18:00:00'), NULL),
       (find_live_recording_id('Jazz Choir and Combo Ensemble, and a Voice Recital', '2018-12-04', '18:00:00'),
        find_engineer_id('Chris', 'Miller')),
       (find_live_recording_id('Ensemble Concert', '2018-12-06', '18:00:00'), NULL),
       (find_live_recording_id('NU Immerse International Student Program final concert', '2018-12-09', '17:00:00'), NULL),
       (find_live_recording_id('BSO Concert', '2019-01-11', '13:30:00'), NULL),
       (find_live_recording_id('BSO Concert', '2019-03-15', '13:30:00'), NULL),
       (find_live_recording_id('BSO Concert', '2019-04-12', '13:30:00'), NULL);