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
                               ('lipson.r@husky.neu.edu', 'Lipson', 'Rachel'),
                               ('mulligan.d@husky.neu.edu', 'Mulligan', 'Dan');


insert into club_member(lastname, firstname) values
                                                    ('Chow', 'Aaron'),
                                                    ('Balint', 'Alexa'),
                                                    ('Tamarin', 'Ben'),
                                                    ('Pelletier', 'Casper'),
                                                    ('Bobowicz', 'Christian'),
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
                                                    ('Hayley', 'Nick'),
                                                    ('Smith', 'Nick');

select *
from club_member;

insert into eboard_member(title, member_id) values
                                                   ('Head of Marketing', 24),
                                                   ('Head of Merchandise and Design', 45),
                                                   ('Head of Recording', 64),
                                                   ('Head of Events', 68),
                                                   ('Head of Video', 10),
                                                   ('Head of Artists and Repertoire', 57),
                                                   ('President', 69),
                                                   ('Vice President', 10),
                                                   ('Head of Operations', 70);

select *
from eboard_member;

# insert into engineer(member_id, `level`) values
#                                                 (47, 'Lead'),
#                                                 (71, 'Lead'),
#                                                 (10, 'Lead'),
#                                                 (41, 'Lead'),
#                                                 (58, 'Lead'),
#                                                 (34, 'Lead'),
#                                                 (15, 'Lead'),
#                                                 (46, 'Lead'),
#                                                 (16, 'Lead'),
#                                                 (2, 'Lead'),
#                                                 (64, 'Lead'),
#                                                 (50, 'Assistant'),
#                                                 (61, 'Assistant'),
#                                                 (89, 'Assistant'),
#                                                 (27, 'Assistant'),
#                                                 (70, 'Assistant'),
#                                                 (20, 'Assistant'),
#                                                 (75, 'EIT'),
#                                                 (77, 'EIT'),
#                                                 (51, 'EIT'),
#                                                 (79, 'EIT'),
#                                                 (14, 'EIT'),
#                                                 (1, 'EIT'),
#                                                 (69, 'EIT'),
#                                                 (33, 'EIT'),
#                                                 (25, 'EIT'),
#                                                 (60, 'EIT'),
#                                                 (36, 'EIT'),
#                                                 (9, 'EIT'),
#                                                 (78, 'EIT'),
#                                                 (31, 'EIT'),
#                                                 (49, 'EIT'),
#                                                 (43, 'EIT'),
#                                                 (29, 'EIT'),
#                                                 (57, 'EIT');































