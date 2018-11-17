use green_line_records;

show tables;

insert into club_member (email, lastname, firstname)
values ('bollu.a@husky.neu.edu', 'Bollu', 'Akhil'),
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
       ('mulligan.d@husky.neu.edu', 'Mulligan', 'Dan'),
       ('lambrecht.w@husky.neu.edu', 'Lambrecht', 'Walker');


insert into club_member (lastname, firstname)
values ('Chow', 'Aaron'),
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
       ('Smith', 'Nick'),
       ('Espinoza', 'Esteban'),
       ('Econ', 'Mike'),
       ('Webb', 'Spencer'),
       ('Seki', 'Maia'),
       ('Busse', 'Ryan'),
       ('Miller', 'Chris'),
       ('Teitler', 'Alex'),
       ('Horchani', 'Mohamed'),
       ('Carroll', 'Christina'),
       ('Gao', 'Vivienne'),
       ('Modugno', 'Connor'),
       ('Leach', 'Denzil'),
       ('Ambat', 'Jeewan'),
       ('Hamoudi', 'Hussain'),
       ('Baumgartel', 'Sam'),
       ('Marino', 'Dante'),
       ('Travis', 'Micah'),
       ('Garvey', 'Joshua'),
       ('Gridley', 'Henry'),
       ('Pelletier', 'Cassidy'),
       ('Dwyer', 'Emmett'),
       ('Kaffine', 'Nick'),
       ('McCrosson', 'Kyle'),
       ('Xu', 'Olivia'),
       ('Orent', 'Michael'),
       ('Mendez', 'Kevin'),
       ('Salkovitz', 'Dillon'),
       ('Houle', 'Michelle'),
       ('Lafyatis', 'Joey'),
       ('Lewis', 'Carson'),
       ('McCarthy', 'Emily'),
       ('Bernstein', 'Josh'),
       ('Poulios', 'Jake'),
       ('Calli', 'John'),
       ('Berman', 'Arabella'),
       ('Wenglikowski', 'Hunter'),
       ('Hipara', 'Pavan'),
       ('Harrold', 'Ben'),
       ('Newman-Boulle', 'Alia'),
       ('Raponi', 'Bella'),
       ('Harper', 'Nicholas'),
       ('Barden', 'James'),
       ('Fletch', 'Mina'),
       ('Espada', 'Lucas'),
       ('Lowicki', 'Hannah'),
       ('Karikas', 'Elias'),
       ('Doucette', 'Adam'),
       ('Zimiroski', 'Jared'),
       ('Aber', 'Simon'),
       ('Carol', 'Christina'),
       ('Theobalds', 'Kathryn'),
       ('Newbury', 'Nathan'),
       ('Hansen', 'Erika'),
       ('Henry', 'Austin'),
       ('Finn', 'Ethan'),
       ('Clune', 'Will'),
       ('Samson', 'Jacob'),
       ('Birch', 'Spencer'),
       ('De Arestegui', 'Sebastian'),
       ('Bettio', 'Veronica'),
       ('Fox', 'Aidan'),
       ('Kerwin', 'Jack');


select *
from club_member;

DELIMITER //

-- NOTE: if there are multiple members with the same full name, this function cannot distinguish them --
create function find_member_id
  (
    first_name varchar(50),
    last_name  varchar(50)
  )
  returns int
  BEGIN
    return (select member_id
            from club_member
            where firstname like first_name
              and lastname like last_name
            limit 1);
  END //

DELIMITER ;

insert into eboard_member (title, member_id)
values ('Head of Marketing', find_member_id('Gianna', 'Barletta')),
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

insert into engineer (member_id, `level`)
values (find_member_id('Zac', 'Kerwin'), 'Lead'),
       (find_member_id('Cairo', 'Marques-Neto'), 'Lead'),
       (find_member_id('Dan', 'Mulligan'), 'Lead'),
       (find_member_id('Carson', 'Lewis'), 'Lead'),
       (find_member_id('Dillon', 'Salkovitz'), 'Lead'),
       (find_member_id('Emily', 'McCarthy'), 'Lead'),
       (find_member_id('Joey', 'Lafyatis'), 'Lead'),
       (find_member_id('Josh', 'Bernstein'), 'Lead'),
       (find_member_id('Melissa', 'Rorech'), 'Lead'),
       (find_member_id('Michael', 'Orent'), 'Lead'),
       (find_member_id('Seth', 'Rosenau'), 'Lead'),
       (find_member_id('Michelle', 'Houle'), 'Lead'),
       (find_member_id('Paul', 'Kouris'), 'Lead'),
       (find_member_id('Joseph', 'Newmann'), 'Lead'),
       (find_member_id('Cienna', 'Dubay'), 'Lead'),
       (find_member_id('Nick', 'Leonard'), 'Lead'),
       (find_member_id('Craig', 'Short'), 'Lead'),
       (find_member_id('Aleksandra', 'Pasek'), 'Lead'),
       (find_member_id('William', 'Kast'), 'Lead'),
       (find_member_id('Walker', 'Lambrecht'), 'Lead'),
       (find_member_id('Nick', 'Smith'), 'Assistant'),
       (find_member_id('Gabriel', 'Pino'), 'Assistant'),
       (find_member_id('Mike', 'Econ'), 'Assistant'),
       (find_member_id('Spencer', 'Birch'), 'Assistant'),
       (find_member_id('Greg', 'Leo'), 'Assistant'),
       (find_member_id('Connor', 'Modugno'), 'Assistant'),
       (find_member_id('Chris', 'Miller'), 'Assistant'),
       (find_member_id('Micah', 'Travis'), 'Assistant'),
       (find_member_id('Will', 'Clune'), 'Assistant'),
       (find_member_id('Ethan', 'Finn'), 'Assistant'),
       (find_member_id('Jacob', 'Samson'), 'Assistant'),
       (find_member_id('Hussain', 'Hamoudi'), 'Assistant'),
       (find_member_id('Denzil', 'Leach'), 'Assistant'),
       (find_member_id('Rob', 'Steiner'), 'Assistant'),
       (find_member_id('Kevin', 'Mendez'), 'Assistant'),
       (find_member_id('Tristan', 'Smith'), 'Assistant'),
       (find_member_id('Emily', 'Burke'), 'Assistant'),
       (find_member_id('Esteban', 'Espinoza'), 'Assistant'),
       (find_member_id('Hayley', 'Kuhlmann'), 'Assistant'),
       (find_member_id('Rachel', 'Lipson'), 'Assistant'),
       (find_member_id('Thomas', 'Hinds'), 'Assistant'),
       (find_member_id('Sagar', 'Kumar'), 'Assistant'),
       (find_member_id('Jake', 'Poulios'), 'Assistant'),
       (find_member_id('Chuck', 'Stein'), 'EIT'),
       (find_member_id('Ryan', 'Busse'), 'EIT'),
       (find_member_id('Pavan', 'Hipara'), 'EIT'),
       (find_member_id('Christian', 'Bobowicz'), 'EIT'),
       (find_member_id('Ben', 'Harrold'), 'EIT'),
       (find_member_id('Alex', 'Teitler'), 'EIT'),
       (find_member_id('Spencer', 'Webb'), 'EIT'),
       (find_member_id('Alia', 'Newman-Boulle'), 'EIT'),
       (find_member_id('Bella', 'Raponi'), 'EIT'),
       (find_member_id('Hunter', 'Wenglikowski'), 'EIT'),
       (find_member_id('Nicholas', 'Harper'), 'EIT'),
       (find_member_id('James', 'Barden'), 'EIT'),
       (find_member_id('Mina', 'Fletch'), 'EIT'),
       (find_member_id('Lucas', 'Espada'), 'EIT'),
       (find_member_id('Hannah', 'Lowicki'), 'EIT'),
       (find_member_id('Jonathan', 'Prus'), 'EIT'),
       (find_member_id('Christina', 'Carol'), 'EIT'),
       (find_member_id('Vivienne', 'Gao'), 'EIT'),
       (find_member_id('Elias', 'Karikas'), 'EIT'),
       (find_member_id('Adam', 'Doucette'), 'EIT'),
       (find_member_id('Simon', 'Aber'), 'EIT'),
       (find_member_id('Jared', 'Zimiroski'), 'EIT'),
       (find_member_id('Kathryn', 'Theobalds'), 'EIT'),
       (find_member_id('Mohamed', 'Horchani'), 'EIT'),
       (find_member_id('Akhil', 'Bollu'), 'EIT'),
       (find_member_id('Bryce', 'Krause'), 'EIT'),
       (find_member_id('Gabriella', 'Dechabot'), 'EIT'),
       (find_member_id('Dell', 'Benjamin'), 'EIT'),
       (find_member_id('Rayven', 'Tate'), 'EIT'),
       (find_member_id('Lauren', 'Oldefendt'), 'EIT'),
       (find_member_id('Nell', 'Snow'), 'EIT'),
       (find_member_id('Dia', 'Papa'), 'EIT'),
       (find_member_id('John', 'Calli'), 'EIT'),
       (find_member_id('Austin', 'Henry'), 'EIT'),
       (find_member_id('Arabella', 'Berman'), 'EIT'),
       (find_member_id('Eli', 'Olson'), 'EIT'),
       (find_member_id('Joseph', 'Callaghan'), 'EIT'),
       (find_member_id('Maya', 'Roberts'), 'EIT'),
       (find_member_id('Ryan', 'Harrigan'), 'EIT'),
       (find_member_id('Elliot', 'Efrat'), 'EIT'),
       (find_member_id('Candace', 'Reyes'), 'EIT'),
       (find_member_id('Miles', 'Ragan'), 'EIT'),
       (find_member_id('Olivia', 'Xu'), 'EIT'),
       (find_member_id('Jeewan', 'Ambat'), 'EIT'),
       (find_member_id('Dante', 'Marino'), 'EIT'),
       (find_member_id('Joshua', 'Garvey'), 'EIT'),
       (find_member_id('Kyle', 'McCrosson'), 'EIT'),
       (find_member_id('Henry', 'Gridley'), 'EIT'),
       (find_member_id('Erika', 'Hansen'), 'EIT'),
       (find_member_id('Nathan', 'Newbury'), 'EIT'),
       (find_member_id('Cassidy', 'Pelletier'), 'EIT'),
       (find_member_id('Rohan', 'Upadhyayula'), 'EIT'),
       (find_member_id('Nick', 'Kaffine'), 'EIT'),
       (find_member_id('Emmett', 'Dwyer'), 'EIT'),
       (find_member_id('Sam', 'Baumgartel'), 'EIT'),
       (find_member_id('Joey', 'Molloy'), 'EIT');


select *
from engineer;

insert into ar_member(member_id)
values (find_member_id('Sagar', 'Kumar')),
       (find_member_id('Jonathan', 'Prus')),
       (find_member_id('Candace', 'Reyes')),
       (find_member_id('Melanie', 'Senk')),
       (find_member_id('Sebastian', 'De Arestegui')),
       (find_member_id('Ryan', 'Stelmach')),
       (find_member_id('Veronica', 'Bettio')),
       (find_member_id('Aidan', 'Fox')),
       (find_member_id('Jack', 'Kerwin'));















































