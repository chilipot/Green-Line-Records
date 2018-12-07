use green_line_records;

insert into project (title, type, status)
values ('Atlas Lab single', 'Single', 'Completed'),
       ('3-song EP by Du Vide', 'EP', 'Completed'),
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
       ('Take Care', 'Single', 'Completed'),
       ('Able Days EP', 'EP', 'Completed'),
       ('the seams', 'EP', 'Completed'),
       ('Your Book', 'Single', 'Completed'),
       ('Flamingo Club single', 'Single', 'Completed'),
       ('Systematic single', 'Single', 'Cancelled'),
       ('Mandy Kessler single', 'Single', 'Cancelled'),
       ('Trevor Dering single', 'Single', 'Cancelled'),
       ('Hurt Nobody by Tashawn Taylor', 'Single', 'Cancelled'),
       ('Sugar', 'Single', 'Completed'),
       ('a tale from tomorrow', 'Single', 'Completed'),
       ('Old Enough', 'Single', 'Completed'),
       ('Give It Up', 'Single', 'Completed'),
       ('Heart of the Sun', 'Single', 'Completed'),
       ('Cruel Miracle single', 'Single', 'Cancelled'),
       ('Time Out of Mind', 'Single', 'Completed'),
       ('~*Angry 4evr*~', 'Single', 'Completed'),
       ('frog.png', 'Single', 'Completed'),
       ('Till You Run Out of Time', 'Single', 'Completed'),
       ('NU Stage single', 'Single', 'Completed'),
       ('Reckless', 'Single', 'Completed'),
       ('Broken by the Fix', 'Single', 'Completed'),
       ('I Have No Time', 'Single', 'Completed'),
       ('NU Songwriting Club Compilation 2018', 'Album', 'Completed'),
       ('Brother Be Wise', 'Single', 'Completed');
-- TODO: add to include Glass Arrowhead project, rename or delete unnamed projects

insert into project (title, type, status, rep_id)
values ('Cosmic Johnny single', 'Single', 'Completed', find_member_id('Sagar', 'Kumar')),
       ('Twelveyes single', 'Single', 'Confirmed', find_member_id('Ryan', 'Stelmach')),
       ('Maya Lucia EP', 'EP', 'In-Progress', find_member_id('Sagar', 'Kumar')),
       ('Mike Morrissey single', 'Single', 'Confirmed', find_member_id('Lindsay', 'Masterson')),
       ('Leo Son & The Q-tip Bandits single', 'Single', 'In-Progress', find_member_id('Jonathon', 'Prus')),
       ('Brandie Blaze single', 'Single', 'Confirmed', find_member_id('Veronica', 'Bettio')),
       ('Henry Mccal single', 'Single', 'In-Progress', find_member_id('Sebastian', 'De Arestegui')),
       ('D $oundz single', 'Single', 'In-Progress', find_member_id('Aidan', 'Fox')),
       ('Brennan Wedl single', 'Single', 'In-Progress', find_member_id('Jack', 'Kerwin')),
       ('Devvey single', 'Single', 'In-Progress', find_member_id('Melanie', 'Senk')),
       ('Avi Jacob single', 'Single', 'Confirmed', find_member_id('Jonathon', 'Prus'));


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

drop function if exists find_genre_id;
DELIMITER //
create function find_genre_id
  (
    name varchar(50)
  )
  returns int
  BEGIN
    return (select genre_id from genre where genre_name like name limit 1);
  END //
DELIMITER ;

drop function if exists find_engineer_id;
DELIMITER //
create function find_engineer_id
  (
    first varchar(50),
    last  varchar(50)
  )
  returns int
  BEGIN
    return (select engineer_id
            from engineer
                   join club_member using (member_id)
            where firstname like first
              and lastname like last
            limit 1);
  END //
DELIMITER ;

truncate genre_of_project;
insert into genre_of_project (project_id, genre_id)
values (find_project_id('Broken by the Fix'), find_genre_id('Electronic')),
       (find_project_id('Broken by the Fix'), find_genre_id('Rock')),
       (find_project_id('Reckless'), find_genre_id('Rock')),
       (find_project_id('Reckless'), find_genre_id('Country')),
       (find_project_id('frog.png'), find_genre_id('Indie')),
       (find_project_id('frog.png'), find_genre_id('Rock')),
       (find_project_id('frog.png'), find_genre_id('Punk')),
       (find_project_id('NU Songwriting Club Compilation 2018'), find_genre_id('Singer-songwriter')),
       (find_project_id('Time Out of Mind'), find_genre_id('Progressive Rock')),
       (find_project_id('Give It Up'), find_genre_id('Funk')),
       (find_project_id('I Have No Time'), find_genre_id('Lo-fi')),
       (find_project_id('I Have No Time'), find_genre_id('Ambient')),
       (find_project_id('~*Angry 4evr*~'), find_genre_id('Singer-songwriter')),
       (find_project_id('Till You Run Out of Time'), find_genre_id('Rock')),
       (find_project_id('Heart of the Sun'), find_genre_id('Rock')),
       (find_project_id('Heart of the Sun'), find_genre_id('Folk')),
       (find_project_id('Old Enough'), find_genre_id('Indie')),
       (find_project_id('Old Enough'), find_genre_id('Rock')),
       (find_project_id('a tale from tomorrow'), find_genre_id('Electronic')),
       (find_project_id('a tale from tomorrow'), find_genre_id('Hip-hop')),
       (find_project_id('Sugar'), find_genre_id('Folk')),
       (find_project_id('Your Book'), find_genre_id('Rock')),
       (find_project_id('the seams'), find_genre_id('Singer-songwriter')),
       (find_project_id('Able Days EP'), find_genre_id('Alternative')),
       (find_project_id('Able Days EP'), find_genre_id('Indie')),
       (find_project_id('Able Days EP'), find_genre_id('Rock')),
       (find_project_id('Take Care'), find_genre_id('Rock')),
       (find_project_id('Take Care'), find_genre_id('Punk')),
       (find_project_id('Brother Be Wise'), find_genre_id('R&B')),
       (find_project_id('Brother Be Wise'), find_genre_id('Funk')),
       (find_project_id('Brother Be Wise'), find_genre_id('Soul'));

truncate artist_writes_project;
insert into artist_writes_project (project_id, artist_id)
values (find_project_id('Broken by the Fix'), find_artist_id('ColorGrave')),
       (find_project_id('Reckless'), find_artist_id('Julie Cira & The Wake')),
       (find_project_id('frog.png'), find_artist_id('daisybones')),
       (find_project_id('NU Songwriting Club Compilation 2018'), find_artist_id('NU Songwriting Club')),
       (find_project_id('Time Out of Mind'), find_artist_id('Yookeroo')),
       (find_project_id('Give It Up'), find_artist_id('John E Funk & The Skunks')),
       (find_project_id('I Have No Time'), find_artist_id('James Burke')),
       (find_project_id('~*Angry 4evr*~'), find_artist_id('Maggie Rosenberg')),
       (find_project_id('Till You Run Out of Time'), find_artist_id('Groundlift')),
       (find_project_id('Heart of the Sun'), find_artist_id('Kid Wolf')),
       (find_project_id('Old Enough'), find_artist_id('The Water Cycle')),
       (find_project_id('a tale from tomorrow'), find_artist_id('Sweeps')),
       (find_project_id('Sugar'), find_artist_id('Gentle Temper')),
       (find_project_id('Your Book'), find_artist_id('Red Mill')),
       (find_project_id('the seams'), find_artist_id('Maggie Whitlock')),
       (find_project_id('Able Days EP'), find_artist_id('Able Days')),
       (find_project_id('Take Care'), find_artist_id('Mint Green')),
       (find_project_id('Brother Be Wise'), find_artist_id('Harry Jay Smith and The Bling'));



insert into `release` (project_id, release_date)
values (find_project_id('Broken by the Fix'), '2018-06-02'),
       (find_project_id('Reckless'), '2018-05-04'),
       (find_project_id('frog.png'), '2018-04-13'),
       (find_project_id('NU Songwriting Club Compilation 2018'), '2018-04-06'),
       (find_project_id('Time Out of Mind'), '2018-03-23'),
       (find_project_id('Give It Up'), '2017-12-08'),
       (find_project_id('I Have No Time'), '2018-04-20'),
       (find_project_id('~*Angry 4evr*~'), '2018-03-31'),
       (find_project_id('Till You Run Out of Time'), '2018-05-04'),
       (find_project_id('Heart of the Sun'), '2017-12-29'),
       (find_project_id('Old Enough'), '2017-12-15'),
       (find_project_id('a tale from tomorrow'), '2017-12-01'),
       (find_project_id('Sugar'), '2017-11-10'),
       (find_project_id('Your Book'), '2017-08-25'),
       (find_project_id('the seams'), '2017-04-28'),
       (find_project_id('Able Days EP'), '2017-04-14'),
       (find_project_id('Take Care'), '2017-04-7'),
       (find_project_id('Brother Be Wise'), '2017-02-03');


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
       ('Spotify', 'https://open.spotify.com/track/3FDtd6SvIsg5Jk7XguQ3pS', find_release_id('I Have No Time')),
       ('Apple Music',
        'https://itunes.apple.com/us/album/i-have-no-time-single/1375123700',
        find_release_id('I Have No Time')),
       ('Tidal', 'https://tidal.com/track/87802225', find_release_id('I Have No Time')),
       ('Pandora',
        'https://www.pandora.com/artist/james-burke/i-have-no-time-single/AL5tvgqrZ7xnVpw',
        find_release_id('I Have No Time')),
       ('Bandcamp',
        'https://maggierosenberg.bandcamp.com/track/angry-4evr-greenline-version',
        find_release_id('~*Angry 4evr*~')),
       ('Bandcamp', 'https://kidwolf.bandcamp.com/album/heart-of-the-sun-single', find_release_id('Heart of the Sun')),
       ('YouTube', 'https://www.youtube.com/watch?v=jVHIXA_uNTw', find_release_id('Old Enough')),
       ('Spotify', 'https://open.spotify.com/track/5azFS5RgqOfDaZcA5oj25Q', find_release_id('Old Enough')),
       ('Bandcamp', 'https://thewatercyclemusic.bandcamp.com/track/old-enough-2', find_release_id('Old Enough')),
       ('YouTube', 'https://www.youtube.com/watch?v=8nOE0I-f7ec', find_release_id('Sugar')),
       ('Bandcamp', 'https://gentletemper.bandcamp.com/track/sugar', find_release_id('Sugar')),
       ('Spotify', 'https://open.spotify.com/track/7HvhELsUJQkORjvUoDTeNz', find_release_id('Sugar')),
       ('Google Play',
        'https://play.google.com/music/preview/Tychqp5u6dlx2nd3o2uy5j6z5lu?play=1&u=0',
        find_release_id('Sugar')),
       ('Bandcamp', 'https://redmill.bandcamp.com/track/your-book-single', find_release_id('Your Book')),
       ('Bandcamp', 'https://maggiewhitlock.bandcamp.com/album/the-seams-ep', find_release_id('the seams')),
       ('Bandcamp', 'https://abledays.bandcamp.com/album/able-days-ep', find_release_id('Able Days EP')),
       ('Bandcamp', 'https://mintgreenma.bandcamp.com/track/take-care', find_release_id('Take Care')),
       ('Spotify', 'https://open.spotify.com/track/64AgLnL40kvuVIGPuFSMC2', find_release_id('Take Care')),
       ('Google Play',
        'https://play.google.com/music/preview/T24kbtzdtwtakk56pt34fslgcey?play=1&u=0',
        find_release_id('Take Care')),
       ('Google Play',
        'https://play.google.com/music/preview/To77xpupliwyucrcnhfzrw32wrm?play=1&u=0',
        find_release_id('Brother Be Wise')),
       ('YouTube', 'https://www.youtube.com/watch?v=tOcgmlVbV6A', find_release_id('Brother Be Wise')),
       ('Amazon Music',
        'https://www.amazon.com/Brother-Wise-Harry-Smith-Bling/dp/B06XDTZNH2',
        find_release_id('Brother Be Wise')),
       ('Bandcamp', 'https://harryjayblings.bandcamp.com/track/brother-be-wise', find_release_id('Brother Be Wise')),
       ('SoundCloud',
        'https://soundcloud.com/sweepsbeats/sweeps-a-tale-from-tomorrow',
        find_release_id('a tale from tomorrow'));


set foreign_key_checks = 0;
truncate recording_assignment;
insert into recording_assignment (project_id, engineer_id, role)
values (find_project_id('Mike Morrissey single'), find_engineer_id('Zac', 'Kerwin'), 'Lead'),
       (find_project_id('Mike Morrissey single'), find_engineer_id('Gabriel', 'Pino'), 'Assistant'),
       (find_project_id('Mike Morrissey single'), find_engineer_id('Ryan', 'Busse'), 'EIT'),
       (find_project_id('Mike Morrissey single'), find_engineer_id('Pavan', 'Hirpara'), 'EIT'),
       (find_project_id('Leo Son & The Q-tip Bandits single'), find_engineer_id('Zac', 'Kerwin'), 'Lead'),
       (find_project_id('Leo Son & The Q-tip Bandits single'), find_engineer_id('Mike', 'Gentile'), 'Assistant');
       (find_project_id('Leo Son & The Q-tip Bandits single'), find_engineer_id('Spencer', 'Birch'), 'Assistant'),
       (find_project_id('Leo Son & The Q-tip Bandits single'), find_engineer_id('Christian', 'Bobowicz'), 'EIT'),
       (find_project_id('Leo Son & The Q-tip Bandits single'), find_engineer_id('Ben', 'Harrold'), 'EIT'),
       (find_project_id('Leo Son & The Q-tip Bandits single'), find_engineer_id('Alex', 'Teitler'), 'EIT'),
       (find_project_id('Henry Mccal single'), find_engineer_id('Zac', 'Kerwin'), 'Lead'),
       (find_project_id('Henry Mccal single'), find_engineer_id('Greg', 'Leo'), 'Assistant'),
       (find_project_id('Henry Mccal single'), find_engineer_id('Spencer', 'Webb'), 'EIT'),
       (find_project_id('Henry Mccal single'), find_engineer_id('Alia', 'Newman-Boulle'), 'EIT'),
       (find_project_id('Henry Mccal single'), find_engineer_id('Bella', 'Raponi'), 'EIT'),
       (find_project_id('Devvey single'), find_engineer_id('Zac', 'Kerwin'), 'Lead'),
       (find_project_id('Devvey single'), find_engineer_id('Gabriel', 'Pino'), 'Assistant'),
       (find_project_id('Devvey single'), find_engineer_id('Hunter', 'Wenglikowski'), 'EIT'),
       (find_project_id('Devvey single'), find_engineer_id('Nicholas', 'Harper'), 'EIT'),
       (find_project_id('Devvey single'), find_engineer_id('James', 'Barden'), 'EIT'),
       (find_project_id('Brandie Blaze single'), find_engineer_id('Zac', 'Kerwin'), 'Lead'),
       (find_project_id('Brandie Blaze single'), find_engineer_id('Connor', 'Modugno'), 'Assistant'),
       (find_project_id('Brandie Blaze single'), find_engineer_id('Mina', 'Fletch'), 'EIT'),
       (find_project_id('Brandie Blaze single'), find_engineer_id('Lucas', 'Espada'), 'EIT'),
       (find_project_id('Brandie Blaze single'), find_engineer_id('Hannah', 'Lowicki'), 'EIT'),
       (find_project_id('Maya Lucia EP'), find_engineer_id('Dan', 'Mulligan'), 'Lead'),
       (find_project_id('Maya Lucia EP'), find_engineer_id('Walker', 'Lambrecht'), 'Assistant'),
       (find_project_id('Maya Lucia EP'), find_engineer_id('Jonathon', 'Prus'), 'EIT'),
       (find_project_id('Maya Lucia EP'), find_engineer_id('Christina', 'Carol'), 'EIT'),
       (find_project_id('Maya Lucia EP'), find_engineer_id('Vivienne', 'Gao'), 'EIT'),
       (find_project_id('Twelveyes single'), find_engineer_id('Dan', 'Mulligan'), 'Lead'),
       (find_project_id('Twelveyes single'), find_engineer_id('Mike', 'Gentile'), 'Assistant'),
       (find_project_id('Twelveyes single'), find_engineer_id('Ryan', 'Busse'), 'EIT'),
       (find_project_id('Twelveyes single'), find_engineer_id('Elias', 'Karikas'), 'EIT'),
       (find_project_id('Twelveyes single'), find_engineer_id('Adam', 'Doucette'), 'EIT'),
       (find_project_id('D $oundz single'), find_engineer_id('Walker', 'Lambrect'), 'Lead'),
       (find_project_id('D $oundz single'), find_engineer_id('Spencer', 'Birch'), 'Assistant'),
       (find_project_id('D $oundz single'), find_engineer_id('Simon', 'Aber'), 'EIT'),
       (find_project_id('D $oundz single'), find_engineer_id('Adam', 'Doucette'), 'EIT'),
       (find_project_id('D $oundz single'), find_engineer_id('Jared', 'Zimiroski'), 'EIT'),
       (find_project_id('Avi Jacob single'), find_engineer_id('Cairo', 'Marques-Neto'), 'Lead'),
       (find_project_id('Avi Jacob single'), find_engineer_id('Vivienne', 'Gao'), 'EIT'),
       (find_project_id('Avi Jacob single'), find_engineer_id('Chuck', 'Stein'), 'EIT'),
       (find_project_id('Avi Jacob single'), find_engineer_id('Christian', 'Bobowicz'), 'EIT'),
       (find_project_id('Brennan Wedl single'), find_engineer_id('Kathryn', 'Theobalds'), 'EIT'),
       (find_project_id('Brennan Wedl single'), find_engineer_id('Isabella', 'Raponi'), 'EIT'),
       (find_project_id('Brennan Wedl single'), find_engineer_id('Jonathon', 'Prus'), 'EIT'),
       (find_project_id('Brennan Wedl single'), find_engineer_id('Chris', 'Miller'), 'Assistant'),
       (find_project_id('Brennan Wedl single'), find_engineer_id('Zac', 'Kerwin'), 'Lead');





insert into marketing_assignment (project_id, campaign_manager_id)
values (find_project_id('Cosmic Johnny single'), find_member_id('Sofia', 'Botti')),
       (find_project_id('Twelveyes single'), find_member_id('Gianna', 'Barleta')),
       (find_project_id('Twelveyes single'), find_member_id('Euvin', 'Lee')),
       (find_project_id('Twelveyes single'), find_member_id('Kathryn', 'Richards')),
       (find_project_id('Maya Lucia EP'), find_member_id('Liz', 'Markow')),
       (find_project_id('Maya Lucia EP'), find_member_id('Kasey', 'Arko')),
       (find_project_id('Maya Lucia EP'), find_member_id('Maya', 'Roberts')),
       (find_project_id('Mike Morrissey single'), find_member_id('Liz', 'Markow')),
       (find_project_id('Mike Morrissey single'), find_member_id('Kasey', 'Arko')),
       (find_project_id('Mike Morrissey single'), find_member_id('Maya', 'Roberts')),
       (find_project_id('Leo Son & The Q-tip Bandits single'), find_member_id('Shannon', 'Pires')),
       (find_project_id('Leo Son & The Q-tip Bandits single'), find_member_id('Delaney', 'Eagle')),
       (find_project_id('Leo Son & The Q-tip Bandits single'), find_member_id('Cheyenne', 'Dobine')),
       (find_project_id('Brandie Blaze single'), find_member_id('Gianna', 'Barletta')),
       (find_project_id('Brandie Blaze single'), find_member_id('Darren', 'Lee')),
       (find_project_id('Brandie Blaze single'), find_member_id('Aidan', 'Fox')),
       (find_project_id('Henry Mccal single'), find_member_id('Gianna', 'Barletta')),
       (find_project_id('Henry Mccal single'), find_member_id('Euvin', 'Lee')),
       (find_project_id('Henry Mccal single'), find_member_id('Kathryn', 'Richards')),
       (find_project_id('D $oundz single'), find_member_id('Shannon', 'Pires')),
       (find_project_id('D $oundz single'), find_member_id('Delaney', 'Eagle')),
       (find_project_id('D $oundz single'), find_member_id('Cheyenne', 'Dobine')),
       (find_project_id('Brennan Wedl single'), find_member_id('Liz', 'Markow')),
       (find_project_id('Brennan Wedl single'), find_member_id('Kasey', 'Arko')),
       (find_project_id('Brennan Wedl single'), find_member_id('Maya', 'Roberts')),
       (find_project_id('Devvey single'), find_member_id('Gianna', 'Barletta')),
       (find_project_id('Devvey single'), find_member_id('Euvin', 'Lee')),
       (find_project_id('Devvey single'), find_member_id('Kathryn', 'Richards')),
       (find_project_id('Avi Jacob single'), find_member_id('Liz', 'Markow'));

-- TODO: add a column concating all genre names for each release
select artist_name as 'artist', title, p.type as 'type', status, l.type as 'platform', url
from artist_writes_project
       join project p using (project_id)
       join artist a using (artist_id)
       left join `release` r using (project_id)
       left join link l using (release_id);

-- how many releases of each genre?
select genre_name, count(release_id) as num_releases
from genre
       left join genre_of_project using (genre_id)
       left join `release` using (project_id)
group by genre_name
order by num_releases desc;

-- genres with most popular releases
select title, group_concat(genre_name) as 'genres', plays
from `release`
       join project using (project_id)
       join genre_of_project using (project_id)
       join genre using (genre_id)
group by title
order by plays desc;

-- most popular genres?
select genre_name as 'genre',
       avg(plays) as 'average_play_count'
from `release`
       join project using (project_id)
       join genre_of_project using (project_id)
       join genre using (genre_id)
group by genre_name
order by avg(plays) desc
limit 10;

-- most popular engineers?
select concat(firstname, ' ', lastname) as 'lead_engineer',
       avg(plays)                       as 'average_play_count'
from `release`
       join project using (project_id)
       join recording_assignment using (project_id)
       join engineer using (engineer_id)
       join club_member using (member_id)
where level = 'Lead'
group by concat(firstname, ' ', lastname)
order by avg(plays) desc
limit 10;

-- most popular releases?
select plays                            as 'play_count',
       artist_name                      as 'artist',
       title                            as 'release',
       group_concat(genre_name)         as 'genres',
       concat(firstname, ' ', lastname) as 'lead_engineer'
from `release`
       join project using (project_id)
       join artist_writes_project using (project_id)
       join artist using (artist_id)
       left join genre_of_project using (project_id)
       left join genre using (genre_id)
       left join recording_assignment using (project_id)
       left join engineer using (engineer_id)
       left join club_member using (member_id)
where level = 'Lead'
group by title
order by plays desc
limit 10;

-- how many projects were released in the Spring 2017 semester?
select count(release_id) as 'num_releases',
       min(release_date) as 'first_release',
       max(release_date) as 'last_release'
from `release`
where release_date >= '2017-01-01'
       and release_date <= '2017-04-31';

-- what projects released in the Fall 2017 semester?
select release_date,
       artist_name                       as 'artist',
       title                             as 'release',
       group_concat(distinct genre_name) as 'genres',
       concat(firstname, ' ', lastname)  as 'lead_engineer',
       group_concat(url)                 as 'links'
from `release`
       join project using (project_id)
       join artist_writes_project using (project_id)
       join artist using (artist_id)
       left join genre_of_project using (project_id)
       left join genre using (genre_id)
       left join recording_assignment using (project_id)
       left join engineer using (engineer_id)
       left join club_member using (member_id)
       left join link using (release_id)
where release_date >= '2017-09-01'
  and release_date <= '2017-12-31'
  and level = 'Lead'
group by title
order by release_date;
