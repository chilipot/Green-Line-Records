show tables;

select * from artist;
select * from artist_writes_project;
select * from assigned_live_recording;
select * from booking;
select * from club_member;
select * from contribution;
select * from department;
select * from department_membership;
select * from eboard_member;
select * from engineer;
select * from event;
select * from genre;
select * from genre_of_project;
select * from link;
select * from live_recording;
select * from location;
select * from marketing_assignment;
select * from project;
select * from recording_assignment;
select * from `release`;



-- TODO: add a column concating all genre names for each release
-- all project info
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
select genre_name as 'genre', avg(plays) as 'average_play_count'
from `release`
       join project using (project_id)
       join genre_of_project using (project_id)
       join genre using (genre_id)
group by genre_name
order by avg(plays) desc
limit 10;

-- most popular engineers?
select concat(firstname, ' ', lastname) as 'lead_engineer', avg(plays) as 'average_play_count'
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
select count(release_id) as 'num_releases', min(release_date) as 'first_release', max(release_date) as 'last_release'
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