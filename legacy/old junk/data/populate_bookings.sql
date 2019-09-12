use green_line_records;

drop function if exists find_artist_id;
DELIMITER //
create function find_artist_id
  (
    a_name varchar(50)
  )
  returns int
  BEGIN
    return (select artist_id from artist where artist_name like concat('%', a_name, '%') limit 1);
  END //
DELIMITER ;

drop function if exists find_event_id;
DELIMITER //
create function find_event_id
  (
    name varchar(200)
  )
  returns int
  BEGIN
    return (select event_id from `event` where title like name limit 1);
  END //
DELIMITER ;


insert into booking(event_id, artist_id)
values (find_event_id('Green Line Records Presents: Kilo Kish, Salt Cathedral, & Atlas
    Lab'), find_artist_id('Atlas Lab')),
       (find_event_id('Green Line Presents...A Boston Showcase'), find_artist_id('The Televibes')),
       (find_event_id('Green Line Presents: Porches, eskimeaux & Brittle Brian'), find_artist_id('Brittle Brian')),
       (find_event_id('Green Line Presents: Girlpool, Teen Suicide & Ricecrackers'), find_artist_id('The RiceCrackers')),
       (find_event_id('CUP and Green Line Present: Pinegrove/Mothers/Maggie Whitlock'), find_artist_id('Maggie Whitlock')),
       (find_event_id('HELL NIGHT JAMS ft. dust from 1000 yrs//Billy Baldwin//Bedbug'), find_artist_id('Bedbug')),
       (find_event_id('Green Line Presents: Grouper, Japanese Breakfast (solo) & Bedbug'), find_artist_id('Bedbug')),
       (find_event_id('Maya Lucia / Orson & The Rosebuds / Kalah Karloff'), find_artist_id('Maya Lucia')),
       (find_event_id('Hop Along // Free Cake for Every Creature // Maggie Rosenberg'), find_artist_id('Maggie Rosenberg')),
       (find_event_id('Edge Petal Burn, Daisybones, Nick Owen & Jack Kerwin'), find_artist_id('Daisybones')),
       (find_event_id('Green Line Presents: Anamanaguchi, Crying & (T-T)b'), find_artist_id('(T-T)b'));
