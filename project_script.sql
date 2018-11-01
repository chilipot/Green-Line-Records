DROP DATABASE IF EXISTS greenlinerecords;
CREATE DATABASE greenlinerecords;

USE greenlinerecords;

-- project -- 
DROP TABLE IF EXISTS project;
CREATE TABLE project (
    project_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    project_name VARCHAR(50) NOT NULL,
    completed TINYINT(1) NOT NULL,
    PRIMARY KEY (project_id)
);


-- genre --
DROP TABLE IF EXISTS genre;
CREATE TABLE genre (
    genre_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    genre_name VARCHAR(50) UNIQUE NOT NULL,
    PRIMARY KEY (genre_id)
);


-- project_has_genre --
DROP TABLE IF EXISTS project_has_genre;
CREATE TABLE project_has_genre (
    project_id INT NULL UNIQUE,
    genre_id INT NOT NULL UNIQUE,
    PRIMARY KEY (project_id , genre_id),
    INDEX fk_Release_has_Genre_Genre1_idx (genre_id ASC),
    INDEX fk_Release_has_Genre_Release_idx (project_id ASC),
    FOREIGN KEY (project_id)
        REFERENCES project (project_id),
    FOREIGN KEY (genre_id)
        REFERENCES genre (genre_id)
);


-- member --
DROP TABLE IF EXISTS club_member;
CREATE TABLE club_member (
    member_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL UNIQUE,
    lastname VARCHAR(50) NOT NULL UNIQUE,
    firstname VARCHAR(50) NOT NULL UNIQUE,
    general_meetings_attended INT NOT NULL DEFAULT 0,
    PRIMARY KEY (member_id)
);


-- ar_rep --
DROP TABLE IF EXISTS ar_rep;
CREATE TABLE ar_rep (
    rep_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    member_id INT NOT NULL UNIQUE,
    PRIMARY KEY (rep_id),
    INDEX fk_AR_Rep_Member1_idx (member_id ASC),
    FOREIGN KEY (member_id)
        REFERENCES club_member (member_id)
);


-- artist --
DROP TABLE IF EXISTS artist;
CREATE TABLE artist (
    artist_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    rep_id INT NOT NULL,
    artist_name VARCHAR(80) NOT NULL,
    PRIMARY KEY (artist_id),
    INDEX fk_Artist_AR_Rep1_idx (rep_id ASC),
    FOREIGN KEY (rep_id)
        REFERENCES ar_rep (rep_id)
);


-- artist_writes_project --
DROP TABLE IF EXISTS artist_writes_project;
CREATE TABLE artist_writes_project (
    project_id INT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (project_id , artist_id),
    INDEX fk_Release_has_Artist_Artist1_idx (artist_id ASC),
    INDEX fk_Release_has_Artist_Release1_idx (project_id ASC),
    FOREIGN KEY (project_id)
        REFERENCES project (project_id),
    FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
);


-- song -- 
DROP TABLE IF EXISTS song;
CREATE TABLE song (
    song_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    song_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (song_id)
);


-- song_has_artist --
DROP TABLE IF EXISTS song_has_artist;
CREATE TABLE song_has_artist (
    song_id INT NULL UNIQUE,
    artist_id INT NOT NULL UNIQUE,
    PRIMARY KEY (song_id , artist_id),
    INDEX fk_Song_has_Artist_Artist1_idx (artist_id ASC),
    INDEX fk_Song_has_Artist_Song1_idx (song_id ASC),
    FOREIGN KEY (song_id)
        REFERENCES song (song_id),
    FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
);


-- project_has_song --
DROP TABLE IF EXISTS project_has_song;
CREATE TABLE project_has_song (
    song_id INT NOT NULL,
    project_id INT NOT NULL,
    PRIMARY KEY (song_id , project_id),
    INDEX fk_Song_has_Release_Release1_idx (project_id ASC),
    INDEX fk_Song_has_Release_Song1_idx (song_id ASC),
    FOREIGN KEY (song_id)
        REFERENCES song (song_id),
    FOREIGN KEY (project_id)
        REFERENCES project (project_id)
);


-- engineer --
DROP TABLE IF EXISTS engineer;
CREATE TABLE engineer (
    engineer_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    member_id INT UNIQUE NOT NULL,
    level ENUM('Assistant', 'Lead', 'EIT') NOT NULL,
    PRIMARY KEY (engineer_id),
    INDEX fk_Engineer_Member1_idx (member_id ASC),
    FOREIGN KEY (member_id)
        REFERENCES club_member (member_id)
);


-- project_has_engineer --
DROP TABLE IF EXISTS project_has_engineer;
CREATE TABLE Project_has_Engineer (
    project_id INT NULL,
    engineer_id INT NOT NULL,
    PRIMARY KEY (project_id , engineer_id),
    INDEX fk_Release_has_Engineer_Engineer1_idx (engineer_id ASC),
    INDEX fk_Release_has_Engineer_Release1_idx (project_id ASC),
    FOREIGN KEY (project_id)
        REFERENCES project (project_id),
    FOREIGN KEY (engineer_id)
        REFERENCES engineer (engineer_id)
);


-- recording_session --
DROP TABLE IF EXISTS recording_session;
CREATE TABLE recording_session (
    recording_session_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    project_id INT NOT NULL,
    date DATETIME NOT NULL,
    PRIMARY KEY (recording_session_id , project_id),
    INDEX fk_Recording_Session_Release1_idx (project_id ASC),
    FOREIGN KEY (project_id)
        REFERENCES project (project_id)
);


-- engineer_has_recording --
DROP TABLE IF EXISTS engineer_has_recording_session;
CREATE TABLE engineer_has_recording_session (
    engineer_id INT NOT NULL,
    recording_session_id INT NULL,
    PRIMARY KEY (engineer_id , recording_session_id),
    INDEX fk_Engineer_has_Recording_Session_Recording_Session1_idx (recording_session_id ASC),
    INDEX fk_Engineer_has_Recording_Session_Engineer1_idx (engineer_id ASC),
    FOREIGN KEY (engineer_id)
        REFERENCES engineer (engineer_id),
    FOREIGN KEY (recording_session_id)
        REFERENCES recording_session (recording_session_id)
);


-- live_session --
DROP TABLE IF EXISTS live_session;
CREATE TABLE live_session (
    live_session_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    date DATETIME NOT NULL,
    PRIMARY KEY (live_session_id)
);


-- event --
DROP TABLE IF EXISTS event;
CREATE TABLE event (
    event_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    date DATETIME NOT NULL,
    description VARCHAR(700) NULL,
    turnout ENUM('Low', 'Medium', 'High') NULL,
    PRIMARY KEY (event_id)
);


-- event_has_artist --
DROP TABLE IF EXISTS event_has_artist;
CREATE TABLE event_has_artist (
    event_id INT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY (event_id , artist_id),
    INDEX fk_Event_has_Artist_Artist1_idx (artist_id ASC),
    INDEX fk_Event_has_Artist_Event1_idx (event_id ASC),
    FOREIGN KEY (event_id)
        REFERENCES event (event_id),
    FOREIGN KEY (artist_id)
        REFERENCES artist (artist_id)
);


-- live_session_has_engineer --
DROP TABLE IF EXISTS live_session_has_engineer;
CREATE TABLE live_session_has_engineer (
    live_session_id INT NULL,
    engineer_id INT NULL,
    PRIMARY KEY (live_session_id , engineer_id),
    INDEX fk_Live_Session_has_Engineer_Engineer1_idx (engineer_id ASC),
    INDEX fk_Live_Session_has_Engineer_Live_Session1_idx (live_session_id ASC),
    FOREIGN KEY (live_session_id)
        REFERENCES live_session (live_session_id),
    FOREIGN KEY (engineer_id)
        REFERENCES engineer (engineer_id)
);


-- release --
DROP TABLE IF EXISTS `release`;
CREATE TABLE `release` (
    release_id INT NOT NULL AUTO_INCREMENT,
    project_id INT NOT NULL,
    plays INT NOT NULL DEFAULT 0,
    release_date DATE NOT NULL,
    PRIMARY KEY (release_id),
    INDEX fk_Release_Project1_idx (project_id ASC),
    FOREIGN KEY (project_id)
        REFERENCES project (project_id)
);


-- department --
DROP TABLE IF EXISTS department;
CREATE TABLE department (
    department_id INT NOT NULL,
    dept_head_id INT NOT NULL,
    title VARCHAR(30) NULL,
    PRIMARY KEY (department_id , dept_head_id),
    INDEX fk_Department_Member1_idx (dept_head_id ASC),
    FOREIGN KEY (dept_head_id)
        REFERENCES club_member (member_id)
);


-- department_has_member --
DROP TABLE IF EXISTS department_has_member;
CREATE TABLE department_has_member (
    member_id INT NOT NULL,
    department_id INT NOT NULL,
    dept_meetings_attended INT NOT NULL DEFAULT 0,
    PRIMARY KEY (member_id , department_id),
    INDEX fk_MemberDepartment_Department1_idx (department_id ASC),
    INDEX fk_MemberDepartment_Member1_idx (member_id ASC),
    FOREIGN KEY (member_id)
        REFERENCES club_member (member_id),
    FOREIGN KEY (department_id)
        REFERENCES department (department_id)
);


-- eboard_member --
DROP TABLE IF EXISTS eboard_member;
CREATE TABLE eboard_member (
    title VARCHAR(30) NOT NULL,
    member_id INT NOT NULL,
    eboard_id INT NOT NULL UNIQUE AUTO_INCREMENT,
    INDEX fk_EBoard_Member_Member1_idx (member_id ASC),
    PRIMARY KEY (eboard_id),
    FOREIGN KEY (member_id)
        REFERENCES club_member (member_id)
);


-- link --
DROP TABLE IF EXISTS link;
CREATE TABLE link (
    type ENUM('Bandcamp', 'Soundcloud', 'Spotify', 'Apple Music') NOT NULL,
    url VARCHAR(300) NOT NULL,
    link_id INT NOT NULL AUTO_INCREMENT,
    release_id INT NOT NULL,
    PRIMARY KEY (link_id),
    INDEX fk_Link_Release1_idx (release_id ASC),
    FOREIGN KEY (release_id)
        REFERENCES `release` (release_id)
);

