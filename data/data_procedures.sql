drop procedure if exists get_project_data;
DELIMITER //
CREATE PROCEDURE get_project_data()
  BEGIN
    select project_id,
           title,
           type,
           status,
           group_concat(distinct genre_name)                             as 'genres',
           concat(ar.firstname, ' ', ar.lastname)                        as 'project_manager',
           group_concat(distinct concat(m.firstname, ' ', m.lastname))   as 'campaign_managers',
           group_concat(distinct concat(em.firstname, ' ', em.lastname)) as 'engineers'
    from project p
           left join club_member ar on (p.rep_id = ar.member_id)
           left join marketing_assignment ma using (project_id)
           left join club_member m on (ma.campaign_manager_id = m.member_id)
           left join recording_assignment using (project_id)
           left join engineer e using (engineer_id)
           left join club_member em on (e.member_id = em.member_id)
           left join genre_of_project using (project_id)
           left join genre using (genre_id)
    group by project_id
    order by project_manager desc, campaign_managers desc, genres desc, engineers desc;
  END //
DELIMITER ;

drop procedure if exists get_project_data_id;
DELIMITER //
CREATE PROCEDURE get_project_data_id(id int)
  BEGIN
    select project_id,
           title,
           type,
           status,
           group_concat(distinct genre_name)                             as 'genres',
           concat(ar.firstname, ' ', ar.lastname)                        as 'project_manager',
           group_concat(distinct concat(m.firstname, ' ', m.lastname))   as 'campaign_managers',
           group_concat(distinct concat(em.firstname, ' ', em.lastname)) as 'engineers'
    from project p
           left join club_member ar on (p.rep_id = ar.member_id)
           left join marketing_assignment ma using (project_id)
           left join club_member m on (ma.campaign_manager_id = m.member_id)
           left join recording_assignment using (project_id)
           left join engineer e using (engineer_id)
           left join club_member em on (e.member_id = em.member_id)
           left join genre_of_project using (project_id)
           left join genre using (genre_id)
    where project_id = id
    group by project_id
    order by project_manager desc, campaign_managers desc, genres desc, engineers desc;
  END //
DELIMITER ;

drop procedure if exists get_project_data_name;
DELIMITER //
CREATE PROCEDURE get_project_data_name(name varchar(80))
  BEGIN
    select project_id,
           title,
           type,
           status,
           group_concat(distinct genre_name)                             as 'genres',
           concat(ar.firstname, ' ', ar.lastname)                        as 'project_manager',
           group_concat(distinct concat(m.firstname, ' ', m.lastname))   as 'campaign_managers',
           group_concat(distinct concat(em.firstname, ' ', em.lastname)) as 'engineers'
    from project p
           left join club_member ar on (p.rep_id = ar.member_id)
           left join marketing_assignment ma using (project_id)
           left join club_member m on (ma.campaign_manager_id = m.member_id)
           left join recording_assignment using (project_id)
           left join engineer e using (engineer_id)
           left join club_member em on (e.member_id = em.member_id)
           left join genre_of_project using (project_id)
           left join genre using (genre_id)
    where title like name
    group by project_id
    order by project_manager desc, campaign_managers desc, genres desc, engineers desc
    limit 1;
  END //
DELIMITER ;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

drop procedure if exists get_release_data;
DELIMITER //
CREATE PROCEDURE get_release_data()
  BEGIN
    select release_id, title, release_date, group_concat(distinct url) as 'links'
    from `release`
           join project using (project_id)
           left join link using (release_id)
    group by release_id;
  END //
DELIMITER ;

drop procedure if exists get_release_data_id;
DELIMITER //
CREATE PROCEDURE get_release_data_id(id int)
  BEGIN
    select release_id, title, release_date, group_concat(distinct url) as 'links'
    from `release`
           join project using (project_id)
           left join link using (release_id)
     where release_id = id
    group by release_id;
  END //
DELIMITER ;

drop procedure if exists get_release_data_name;
DELIMITER //
CREATE PROCEDURE get_release_data_name(name varchar(80))
  BEGIN
    select release_id, title, release_date, group_concat(distinct url) as 'links'
    from `release`
           join project using (project_id)
           left join link using (release_id)
      where title like name
    group by release_id;
  END //
DELIMITER ;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

drop procedure if exists get_event_data;
DELIMITER //
CREATE PROCEDURE get_event_data()
  BEGIN
    select event_id, date, title, description, turnout, group_concat(distinct artist_name) as 'booked_GLR_artists'
    from event
           left join booking using (event_id)
           left join artist using (artist_id)
    group by event_id;
  END //
DELIMITER ;

drop procedure if exists get_event_data_id;
DELIMITER //
CREATE PROCEDURE get_event_data_id(id int)
  BEGIN
    select event_id, date, title, description, turnout, group_concat(distinct artist_name) as 'booked_GLR_artists'
    from event
           left join booking using (event_id)
           left join artist using (artist_id)
    where event_id = id
    group by event_id;
  END //
DELIMITER ;

drop procedure if exists get_event_data_name;
DELIMITER //
CREATE PROCEDURE get_event_data_name(name varchar(140))
  BEGIN
    select event_id, date, title, description, turnout, group_concat(distinct artist_name) as 'booked_GLR_artists'
    from event
           left join booking using (event_id)
           left join artist using (artist_id)
    where title like name
    group by event_id
    limit 1;
  END //
DELIMITER ;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

drop procedure if exists get_artist_data;
DELIMITER //
CREATE PROCEDURE get_artist_data()
  BEGIN
    select artist_id, artist_name, title as 'project'
    from artist
           left join artist_writes_project using (artist_id)
           left join project using (project_id)
    order by project desc;
  END //
DELIMITER ;

drop procedure if exists get_artist_data_id;
DELIMITER //
CREATE PROCEDURE get_artist_data_id(id int)
  BEGIN
    select artist_id, artist_name, title as 'project'
    from artist
           left join artist_writes_project using (artist_id)
           left join project using (project_id)
    where artist_id = id
    order by project desc;
  END //
DELIMITER ;

drop procedure if exists get_artist_data_name;
DELIMITER //
CREATE PROCEDURE get_artist_data_name(name varchar(60))
  BEGIN
    select artist_id, artist_name, title as 'project'
    from artist
           left join artist_writes_project using (artist_id)
           left join project using (project_id)
    where artist_name like name
    order by project desc
    limit 1;
  END //
DELIMITER ;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

drop procedure if exists get_member_data;
DELIMITER //
CREATE PROCEDURE get_member_data()
  BEGIN
    select member_id, firstname as 'first_name', lastname as 'last_name', email, group_concat(distinct title) as 'departments'
    from club_member
        left join department_membership using (member_id)
        left join department using (department_id)
    group by member_id;
  END //
DELIMITER ;

drop procedure if exists get_member_data_id;
DELIMITER //
CREATE PROCEDURE get_member_data_id(id int)
  BEGIN
    select member_id, firstname as 'first_name', lastname as 'last_name', email, group_concat(distinct title) as 'departments'
    from club_member
        left join department_membership using (member_id)
        left join department using (department_id)
    where member_id = id
    group by member_id;
  END //
DELIMITER ;

drop procedure if exists get_member_data_name;
DELIMITER //
CREATE PROCEDURE get_member_data_name(name varchar(80))
  BEGIN
    select member_id, firstname as 'first_name', lastname as 'last_name', email, group_concat(distinct title) as 'departments'
    from club_member
        left join department_membership using (member_id)
        left join department using (department_id)
    where concat('%', firstname, ' ', lastname, '%') like name
    group by member_id
    limit 1;
  END //
DELIMITER ;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

drop procedure if exists get_live_recording_data;
DELIMITER //
CREATE PROCEDURE get_live_recording_data()
  BEGIN
    select live_recording_id, show_name, date, start_time, end_time, location_name as 'location', group_concat(distinct (concat(firstname, ' ', lastname))) as 'engineers'
    from live_recording
        left join location using (location_id)
    left join assigned_live_recording using (live_recording_id)
    left join engineer using (engineer_id)
    left join club_member using (member_id)
    group by live_recording_id;
  END //
DELIMITER ;

drop procedure if exists get_live_recording_data_id;
DELIMITER //
CREATE PROCEDURE get_live_recording_data_id(id int)
  BEGIN
    select live_recording_id, show_name, date, start_time, end_time, location_name as 'location', group_concat(distinct (concat(firstname, ' ', lastname))) as 'engineers'
    from live_recording
        left join location using (location_id)
    left join assigned_live_recording using (live_recording_id)
    left join engineer using (engineer_id)
    left join club_member using (member_id)
    where live_recording_id = id
    group by live_recording_id;
  END //
DELIMITER ;

drop procedure if exists get_live_recording_data_name;
DELIMITER //
CREATE PROCEDURE get_live_recording_data_name(name varchar(130))
  BEGIN
    select live_recording_id, show_name, date, start_time, end_time, location_name as 'location', group_concat(distinct (concat(firstname, ' ', lastname))) as 'engineers'
    from live_recording
        left join location using (location_id)
    left join assigned_live_recording using (live_recording_id)
    left join engineer using (engineer_id)
    left join club_member using (member_id)
    where show_name like name
    group by live_recording_id
    limit 1;
  END //
DELIMITER ;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

drop procedure if exists get_eboard_data;
DELIMITER //
CREATE PROCEDURE get_eboard_data()
  BEGIN
    select eboard_id, title as 'role', concat(firstname, ' ', lastname) as 'club_member'
    from eboard_member
        join club_member using (member_id);
  END //
DELIMITER ;

drop procedure if exists get_eboard_data_id;
DELIMITER //
CREATE PROCEDURE get_eboard_data_id(id int)
  BEGIN
    select eboard_id, title as 'role', concat(firstname, ' ', lastname) as 'club_member'
    from eboard_member
        join club_member using (member_id)
    where eboard_id = id;
  END //
DELIMITER ;

drop procedure if exists get_eboard_data_name;
DELIMITER //
CREATE PROCEDURE get_eboard_data_name(name varchar(80))
  BEGIN
    select eboard_id, title as 'role', concat(firstname, ' ', lastname) as 'club_member'
    from eboard_member
        join club_member using (member_id)
    where concat(firstname, ' ', lastname) like name
    limit 1;
  END //
DELIMITER ;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

drop procedure if exists get_engineer_data;
DELIMITER //
CREATE PROCEDURE get_engineer_data()
  BEGIN
    select engineer_id, concat(firstname, ' ', lastname) as 'name', level
    from engineer
        join club_member using (member_id);
  END //
DELIMITER ;

drop procedure if exists get_engineer_data_id;
DELIMITER //
CREATE PROCEDURE get_engineer_data_id(id int)
  BEGIN
    select engineer_id, concat(firstname, ' ', lastname) as 'name', level
    from engineer
        join club_member using (member_id)
    where engineer_id = id;
  END //
DELIMITER ;

drop procedure if exists get_engineer_data_name;
DELIMITER //
CREATE PROCEDURE get_engineer_data_name(name varchar(80))
  BEGIN
    select engineer_id, concat(firstname, ' ', lastname) as 'name', level
    from engineer
        join club_member using (member_id)
    where concat(firstname, ' ', lastname) like name
    limit 1;
  END //
DELIMITER ;

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

drop procedure if exists get_contribution_data;
DELIMITER //
CREATE PROCEDURE get_contribution_data()
  BEGIN
    select contribution_id, concat(firstname, ' ', lastname) as 'club_member', date, title as 'department', description
    from contribution
        left join club_member using (member_id)
    left join department using (department_id);
  END //
DELIMITER ;

drop procedure if exists get_contribution_data_id;
DELIMITER //
CREATE PROCEDURE get_contribution_data_id(id int)
  BEGIN
    select contribution_id, concat(firstname, ' ', lastname) as 'club_member', date, title as 'department', description
    from contribution
        left join club_member using (member_id)
    left join department using (department_id)
    where contribution_id = id;
  END //
DELIMITER ;



-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ --

select convert_fk_to_string('contribution', 4);

SHOW CREATE FUNCTION convert_fk_to_string;
SHOW CREATE FUNCTION convert_string_to_pk;



drop function if exists convert_fk_to_string;
DELIMITER //
CREATE FUNCTION convert_fk_to_string(entity varchar(100), id int)
  returns varchar(300)
BEGIN
    return (case
            when entity like 'artist'
              then (select artist_name from artist where artist_id = id)
            when entity like 'project'
              then (select title from project where project_id = id)
            when entity like 'department'
              then (select title from department where department_id = id)
            when entity like 'club_member'
              then (select concat(firstname, ' ', lastname) from club_member where member_id = id)
            when entity like 'release'
              then (select title from project
                                        join `release` using (project_id) where release_id = id)
            when entity like 'link'
              then (select url from link where link_id = id)
            when entity like 'genre'
              then (select genre_name from genre where genre_id = id)
            when entity like 'live_recording'
              then (select show_name from live_recording where live_recording_id = id)
            when entity like 'location'
              then (select location_name from location where location_id = id)
            when entity like 'eboard_member'
              then (select title from eboard_member
                    where eboard_id = id)
            when entity like 'engineer'
              then (select concat(firstname, ' ', lastname)
                    from club_member
                           join engineer using (member_id)
                    where engineer_id = id)
            when entity like 'event'
              then (select title from event where event_id = id)
            when entity like 'contribution'
              then (select description from contribution where contribution_id = id)
            else 'cannot convert the given foreign key'
            end);
  END //

drop function if exists convert_string_to_pk;
DELIMITER //
CREATE FUNCTION convert_string_to_pk(entity varchar(100), string varchar(300))
  returns int
BEGIN
    return (case
            when entity like 'artist'
              then (select artist_id from artist where artist_name like string)
            when entity like 'project'
              then (select project_id from project where title like string)
            when entity like 'department'
              then (select department_id from department where title like string)
            when entity like 'club_member'
              then (select member_id from club_member where concat(firstname, ' ', lastname) like string)
            when entity like 'release'
              then (select release_id from project
                                        join `release` using (project_id) where title like string)
            when entity like 'link'
              then (select link_id from link where url like string)
            when entity like 'genre'
              then (select genre_id from genre where genre_name like string)
            when entity like 'live_recording'
              then (select live_recording_id from live_recording where show_name like string)
            when entity like 'location'
              then (select location_id from location where location_name like string)
            when entity like 'eboard_member'
              then (select eboard_id
                    from eboard_member
                    where title like string)
            when entity like 'engineer'
              then (select engineer_id
                    from club_member
                           join engineer using (member_id)
                    where concat(firstname, ' ', lastname) like string)
            when entity like 'event'
              then (select event_id from event where title like string)
            when entity like 'contribution'
              then (select contribution_id from contribution where description like string)
            else 'cannot convert the given string to primary key'
            end);
  END
