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