use green_line_records;

drop function if exists find_head;
DELIMITER //
create function find_head
  (
    department varchar(50)
  )
  returns int
  BEGIN
    return (select member_id
            from club_member
                   join eboard_member using (member_id)
            where title like concat('%', department)
            limit 1);
  END //
DELIMITER ;

insert into department (title, dept_head_id)
values ('Marketing', find_head('Marketing')),
       ('Artists & Repertoire', find_head('Artists & Repertoire')),
       ('Merchandise & Design', find_head('Merchandise & Design')),
       ('Recording', find_head('Recording')),
       ('Events', find_head('Events')),
       ('Video', find_head('Video'));

insert into department_membership (member_id, department_id)
    (select club_member_id, department_id
     from ar_member join department
     where title like 'Artists & Repertoire');

insert into department_membership (member_id, department_id)
    (select member_id, department_id
     from engineer join department
     where title like 'Recording');

insert into department_membership (member_id, department_id)
values (find_member_id('Shannon', 'Pires'), 1),
       (find_member_id('Elizabeth', 'Markow'), 1),
       (find_member_id('Kathryn', 'Richards'), 1),
       (find_member_id('Euvin', 'Lee'), 1),
       (find_member_id('Kasey', 'Arko'), 1),
       (find_member_id('Darren', 'Lee'), 1),
       (find_member_id('Delaney', 'Eagle'), 1),
       (find_member_id('Cheyenne', 'Dobine'), 1),
       (find_member_id('Aidan', 'Fox'), 1),
       (find_member_id('Kailey', 'Williams'), 3),
       (find_member_id('Colin', 'Thompson'), 3),
       (find_member_id('Zacharie', 'Mega'), 3),
       (find_member_id('Mary', 'Evans'), 3),
       (find_member_id('Alexander', 'Ernst'), 3),
       (find_member_id('Stephanie', 'Jung'), 3),
       (find_member_id('Zoe', 'Weiman'), 3),
       (find_member_id('Alia', 'Newman-Boulle'), 3),
       (find_member_id('Julia', 'Aguam'), 3),
       (find_member_id('Oriana', 'Timsit'), 3),
       (find_member_id('Elias', 'Karikas'), 3),
       (find_member_id('Matt', 'Canary'), 3);