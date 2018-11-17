use green_line_records;

show tables;

insert into club_member(email, lastname, firstname) values
                               ('bollu.a@husky.neu.edu', 'Bollu', 'Akhil'),
                               ('pasek.a@husky.neu.edu', 'Pasek', 'Aleksandra'),
                               ('hamner.a@husky.neu.edu', 'Hamner', 'Alexis'),
                               ('brighenti.a@husky.neu.edu', 'Brighenti', 'Mia'),
                               ('burman.ar@husky.neu.edu', 'Burman', 'Arabella'),
                               ('kelly.av@husky.neu.edu', 'Kelly', 'Avery'),
                               ('peters.r@husky.neu.edu', 'Peters', 'Becca'),
                               ('brigidsanepour@husky.neu.edu', 'Sanepour', 'Brigid'),
                               ('krause.b@husky.neu.edu', 'Krause', 'Bryce'),
                               ('marques-neto.c@husky.neu.edu', 'Marques-Neto', 'Cairo'),
                               ('reyes.ca@husky.neu.edu', 'Reyes', 'Candace'),
                               ('rowe.ca@husky.neu.edu', 'Rowe', 'Carly'),
                               ('moralesoyola.c@husky.neu.edu', 'Morales', 'Carolina'),
                               ('stein.c@husky.neu.edu', 'Stein', 'Chuck'),
                               ('dubay.c@husky.neu.edu', 'Dubay', 'Cienna'),
                               ('short.c@husky.neu.edu', 'Short', 'Craig'),
                               ('kitching.d@husky.neu.edu', 'Kitching', 'Delaney'),
                               ('papa.s@husky.neu.edu', 'Papa', 'Dia'),
                               ('olson.el@husky.neu.edu', 'Olson', 'Eli'),
                               ('burke.emily@husky.neu.edu', 'Burke', 'Emily'),
                               ('farman.e@husky.neu.edu', 'Farman', 'Emma'),
                               ('fray.e@husky.neu.edu', 'Fray', 'Erynn'),
                               ('lee.euv@husky.neu.edu', 'Lee', 'Euvin Daniel'),
                               ('barletta.g@husky.neu.edu', 'Barletta', 'Gianna'),
                               ('leo.g@husky.neu.edu', 'Leo', 'Greg'),
                               ('bates.h@husky.neu.edu', 'Bates', 'Hannah'),
                               ('kuhlmann.h@husky.neu.edu', 'Kuhlmann', 'Hayley'),
                               ('dyal.j@husky.neu.edu', 'Dyal', 'Jackson'),
                               ('gomezdiez.j@husky.neu.edu', 'Gomez Diez', 'Jaime'),
                               ('keys.j@husky.neu.edu', 'Keys', 'Jamie'),
                               ('molloy.jo@husky.neu.edu', 'Molloy', 'Joey'),
                               ('prus.j@husky.neu.edu', 'Prus', 'Jonathan'),
                               ('callaghan.j@husky.neu.edu', 'Callaghan', 'Joseph'),
                               ('newmann.j@husky.neu.edu', 'Newmann', 'Joseph'),
                               ('aguam.j@husky.neu.edu', 'Aguam', 'Julia'),
                               ('oldefendt.l@husky.neu.edu', 'Oldefendt', 'Lauren'),
                               ('sanchez.lu@husky.neu.edu', 'Sanchez', 'Luis'),
                               ('li.shico@husky.neu.edu', 'Li', 'Maverick'),
                               ('roberts.ma@husky.neu.edu', 'Roberts', 'Maya'),
                               ('senk.m@husky.neu.edu', 'Senk', 'Melanie'),
                               ('rorech.m@husky.neu.edu', 'Rorech', 'Melissa'),
                               ('rossisantomauro.michael@gmail.com', 'Rossi Santomauro', 'Michael'),
                               ('milesrnaustin@gmail.com', 'Ragan', 'Miles'),
                               ('booth.n@husky.neu.edu', 'Booth', 'Natalie'),
                               ('naval.n@husky.neu.edu', 'Naval', 'Nia'),
                               ('leonard.n@husky.neu.edu', 'Leonard', 'Nick'),
                               ('kouris.p@husky.neu.edu', 'Kouris', 'Paul'),
                               ('koehler.r@husky.neu.edu', 'Koehler', 'Rachel'),
                               ('tate.ra@husky.neu.edu', 'Tate', 'Rayven'),
                               ('steiner.ro@husky.neu.edu', 'Steiner', 'Rob'),
                               ('upadhyayula.r@husky.neu.edu', 'Upadhyayula', 'Rohan'),
                               ('nigam.ru@husky.neu.edu', 'Nigam', 'Ruhani'),
                               ('harrigan.r@husky.neu.edu', 'Harrigan', 'Ryan'),
                               ('megahey.r@husky.neu.edu', 'Megahey', 'Ryan'),
                               ('stelmach.r@husky.neu.edu', 'Stelmach', 'Ryan'),
                               ('goncalves.s@husky.neu.edu', 'Goncalves', 'Sabrina'),
                               ('kumar.sag@husky.neu.edu', 'Kumar', 'Sagar'),
                               ('seth.rosenau@gmail.com', 'Rosenau', 'Seth'),
                               ('botti.s@husky.neu.edu', 'Botti', 'Sofia'),
                               ('hinds.t@husky.neu.edu', 'Hinds', 'Thomas'),
                               ('smith.tri@husky.neu.edu', 'Smith', 'Tristan'),
                               ('king-adas.v@husky.neu.edu', 'King-Adas', 'Viviane Marina'),
                               ('sheinfeld.y@husky.neu.edu', 'Sheinfeld', 'Yael'),
                               ('kerwin.el@husky.neu.edu', 'Kerwin', 'Zac'),
                               ('mega.z@husky.neu.edu', 'Mega', 'Zacharie'),
                               ('zoeweiman922@gmail.com', 'Weiman', 'Zoe'),
                               ('crgreenleaf@gmail.com', 'Greenleaf', 'Casey'),
                               ('osenberg.l@husky.neu.edu', 'Osenberg', 'Luke'),
                               ('kast.w@husky.neu.edu', 'Kast', 'William'),
                               ('lipson.r@husky.neu.edu', 'Lipson', 'Rachel');


insert into club_member(lastname, firstname) values
                                                    ('Chow', 'Aaron'),
                                                    ('Balint', 'Alexa'),
                                                    ('Tamarin', 'Ben'),
                                                    ('Pelletier', 'Casper'),
                                                    ('Bobowicz', 'Christian'),
                                                    ('Mulligan', 'Dan'),
                                                    ('Benjamin', 'Dell'),
                                                    ('Efrat', 'Elliot'),
                                                    ('Pino', 'Gabriel'),
                                                    ('Dechabot', 'Gabriella'),
                                                    ('Welch', 'Heather'),
                                                    ('Kittenring', 'Katie'),
                                                    ('Busansky', 'Miranda'),
                                                    ('Snow', 'Nell'),
                                                    ('Golkaryeh', 'Omeed'),
                                                    ('Kiorpes', 'Stefanos'),
                                                    ('Joseph', 'Susie'),
                                                    ('Hayley', 'Nick');



select *
from club_member;

drop function if exists find_member_id;
DELIMITER //
-- NOTE: if there are multiple members with the same full name, this function cannot distinguish them --
create function find_member_id
  (
    first_name varchar(50),
    last_name varchar(50)
  )
  returns int
  BEGIN
    return (select member_id
            from club_member
            where firstname like first_name and lastname like last_name
            limit 1);
  END //
DELIMITER ;

insert into eboard_member(title, member_id) values
                                                   ('Head of Marketing', find_member_id('Gianna', 'Barletta')),
                                                   ('Head of Merchandise & Design', find_member_id('Nia', 'Naval')),
                                                   ('Head of Recording', find_member_id('Zac', 'Kerwin')),
                                                   ('Head of Events', find_member_id('Luke', 'Osenberg')),
                                                   ('Head of Video', find_member_id('Cairo', 'Marques-Neto')),
                                                   ('Head of Artists & Repertoire', find_member_id('Sagar', 'Kumar')),
                                                   ('President', find_member_id('William', 'Kast')),
                                                   ('Vice President', find_member_id('Cairo', 'Marques-Neto')),
                                                   ('Operations Manager', find_member_id('Rachel', 'Lipson'));

select *
from eboard_member;











