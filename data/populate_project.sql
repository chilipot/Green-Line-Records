use green_line_records;

insert into project (title, type, status)
values ('Mike Morrissey single', 'Single', 'On Hold'),
       ('Leo Son & The Q-tip Bandits single', 'Single', 'In-Progress'),
       ('Henry Mccal single', 'Single', 'In-Progress'),
       ('Devvey single', 'Single', 'Confirmed'),
       ('Brandie Blaze single', 'Single', 'Confirmed'),
       ('Maya Lucia EP', 'EP', 'In-Progress'),
       ('Twelveyes single', 'Single', 'Confirmed'),
       ('D $oundz single', 'Single', 'Confirmed'),
       ('Avi Jacob single', 'Single', 'Confirmed'),
       ('Brennan single', 'Single', 'Confirmed'),
       ('Atlas Lab single', 'Single', 'Completed'),
       ('3 songs by Du Vide', 'EP', 'Completed'),
       ('Maggie Whitlock single', 'Single', 'Completed'),
       ('Grace & The Carnivore EP', 'EP', 'Completed'),
       ('Grey Season single', 'Single', 'Completed'),
       ('Claire Bryant single', 'Single', 'Completed'),
       ('The Chestnuts single', 'Single', 'Completed'),
       ('(T-T)b EP', 'EP', 'Completed'),
       ('The Rooks single', 'Single', 'Completed'),
       ('Venomous Whale album', 'Album', 'Completed'),
       ('Brittle Brian single', 'Single', 'Completed'),
       ('Karman Voh/Charles Perrone single', 'Single', 'Completed'),
       ('Brave Elephant bonus tracks', 'Other', 'Completed'),
       ('Dinoczar album', 'Album', 'Completed'),
       ('Brooke Elowe single', 'Single', 'Completed'),
       ('Kaeli Earle single', 'Single', 'Cancelled'),
       ('Houseguests live studio single', 'Single', 'Completed'),
       ('Atlas Lab unidentified project engineered by Michelle Houle', 'Other', 'Completed'),
       ('Able Days single', 'Single', 'Completed'),
       ('Pet Jail live studio single', 'Single', 'Completed'),
       ('Bedbug single', 'Single', 'Completed'),
       ('Sam Haiman Band single', 'Single', 'Completed'),
       ('Migrant Motel single', 'Single', 'Cancelled'),
       ('Mint Green single', 'Single', 'Completed'),
       ('Able Days EP', 'EP', 'Completed'),
       ('Maggie Whitlock EP', 'EP', 'Completed'),
       ('Red Mill single', 'Single', 'Completed'),
       ('Flamingo Club single', 'Single', 'Completed'),
       ('Systematic single', 'Single', 'Cancelled'),
       ('Mandy Kessler single', 'Single', 'Cancelled'),
       ('Trevor Dering single', 'Single', 'Cancelled'),
       ('Gentle Temper single', 'Single', 'Completed'),
       ('Sweeps single', 'Single', 'Completed'),
       ('The Water Cycle single', 'Single', 'Completed'),
       ('Give It Up', 'Single', 'Completed'),
       ('Kid Wolf single', 'Single', 'Completed'),
       ('Cruel Miracle single', 'Single', 'Cancelled'),
       ('Time Out of Mind', 'Single', 'Completed'),
       ('~*Angry 4evr*~', 'Single', 'Completed'),
       ('frog.png', 'Single', 'Completed'),
       ('Till You Run Out of Time', 'Single', 'Completed'),
       ('NU Stage single', 'Single', 'Completed'),
       ('Reckless', 'Single', 'Completed'),
       ('Cosmic Johnny single', 'Single', 'Completed'),
       ('Broken by the Fix', 'Single', 'Completed'),
       ('I Have No Time', 'Single', 'Completed'),
       ('NU Songwriting Club Compilation 2018', 'Album', 'Completed');

select *
from project;

drop function if exists find_project_id;
DELIMITER //
create function find_project_id
  (
    project_title varchar(100)
  )
  returns int
  BEGIN
    return (select project_id from project where title like project_title limit 1);
  END //
DELIMITER ;

drop function if exists find_artist_id;
DELIMITER //
create function find_artist_id
  (
    name varchar(50)
  )
  returns int
  BEGIN
    return (select artist_id from artist where artist_name like name limit 1);
  END //
DELIMITER ;

drop function if exists find_release_id;
DELIMITER //
create function find_release_id
  (
    release_title varchar(50)
  )
  returns int
  BEGIN
    return (select release_id from `release`
                                     join project using (project_id) where title like release_title limit 1);
  END //
DELIMITER ;

insert into artist_writes_project (project_id, artist_id)
values (find_project_id('Broken by the Fix'), find_artist_id('ColorGrave')),
       (find_project_id('Reckless'), find_artist_id('Julie Cira & The Wake')),
       (find_project_id('frog.png'), find_artist_id('daisybones')),
       (find_project_id('NU Songwriting Club Compilation 2018'), find_artist_id('NU Songwriting Club')),
       (find_project_id('Time Out of Mind'), find_artist_id('Yookeroo')),
       (find_project_id('Give It Up'), find_artist_id('John E Funk & The Skunks')),
       (find_project_id('I Have No Time'), find_artist_id('James Burke')),
       (find_project_id('~*Angry 4evr*~'), find_artist_id('Maggie Rosenberg')),
       (find_project_id('Till You Run Out of Time'), find_artist_id('Groundlift'));

insert into `release` (project_id, release_date)
values (find_project_id('Broken by the Fix'), '2018-06-02'),
       (find_project_id('Reckless'), '2018-05-04'),
       (find_project_id('frog.png'), '2018-04-13'),
       (find_project_id('NU Songwriting Club Compilation 2018'), '2018-04-06'),
       (find_project_id('Time Out of Mind'), '2018-03-23'),
       (find_project_id('Give It Up'), '2017-12-08'),
       (find_project_id('I Have No Time'), '2018-04-20'),
       (find_project_id('~*Angry 4evr*~'), '2018-03-31'),
       (find_project_id('Till You Run Out of Time'), '2018-05-04');

insert into link (type, url, release_id)
values ('SoundCloud',
        'https://soundcloud.com/colorgrave/broken-by-the-fix?fbclid=IwAR0NYqqX-U1cwDFRhNS80pNNhpg2bN3fjOI_hYAJ5oIYMDs1-tav67GB0Os',
        find_release_id('Broken by the Fix')),
       ('Bandcamp',
        'https://juliecira.bandcamp.com/track/reckless?fbclid=IwAR38L7o5bvMjVJb6DXn6iVh9D1dznDOp2ipQGta4J3iimarr4j1hdnBVXTI',
        find_release_id('Reckless')),
       ('Bandcamp',
        'https://daisybones.bandcamp.com/track/frog-png?fbclid=IwAR0WQKw6tdJoC0hnB-K2M7gq0WVOl3Iio9iYPtAeA1_AsAazETAvzAdqv6o',
        find_release_id('frog.png')),
       ('Bandcamp',
        'https://greenlinerecordsnu.bandcamp.com/album/nu-songwriting-club-compilation?fbclid=IwAR12mpw13hrqfUB67CH4Cyst5rHhuXMwzvpFoMFBbcnnMh9TXGc9hJTW_QA',
        find_release_id('NU Songwriting Club Compilation 2018')),
       ('Bandcamp',
        'https://yookeroo.bandcamp.com/track/time-out-of-mind?fbclid=IwAR1S7v2iz1QRulgXFS2rdNshf0jsQCwyK1DxsL6mgh_OpWQlMi7BDqNdx9k',
        find_release_id('Time Out of Mind')),
       ('Bandcamp', 'https://johnefunkandtheskunks.bandcamp.com/track/give-it-up', find_release_id('Give It Up')),
       ('Spotify',
        'https://open.spotify.com/track/3WFZULbf7WD0r07D5oXKQM',
        find_release_id('Till You Run Out of Time')),
       ('Spotify',
        'https://open.spotify.com/track/3FDtd6SvIsg5Jk7XguQ3pS',
        find_release_id('I Have No Time')),
       ('Apple Music',
        'https://itunes.apple.com/us/album/i-have-no-time-single/1375123700',
        find_release_id('I Have No Time')),
       ('Tidal',
        'https://tidal.com/track/87802225',
        find_release_id('I Have No Time')),
       ('Pandora',
        'https://www.pandora.com/artist/james-burke/i-have-no-time-single/AL5tvgqrZ7xnVpw',
        find_release_id('I Have No Time')),
       ('Bandcamp',
        'https://maggierosenberg.bandcamp.com/track/angry-4evr-greenline-version',
        find_release_id('~*Angry 4evr*~'));


-- TODO: add GENRE to this query!
select artist_name as 'artist', title, p.type as 'type', status, l.type as 'platform', url
from artist_writes_project
       join project p using (project_id)
       join artist a using (artist_id)
       left join `release` r using (project_id)
       left join link l using (release_id);
