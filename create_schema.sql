DROP DATABASE IF EXISTS green_line_records;
CREATE DATABASE green_line_records;

USE green_line_records;

/** TODO:
engineer project assignment
dept membership
add more releases
a&r member
booking
play count CURRENTLY ALL NULL
drop attendance
need to get info from other department heads about dept members

 */

-- project --
DROP TABLE IF EXISTS project;
CREATE TABLE project (
  project_id INT                                                                                   NOT NULL UNIQUE AUTO_INCREMENT,
  title      VARCHAR(100)                                                                          NOT NULL,
  type       ENUM ('Single', 'EP', 'Album', 'Video', 'Other')                                      NOT NULL,
  status     ENUM ('Unconfirmed', 'Confirmed', 'In-Progress', 'Completed', 'On Hold', 'Cancelled') NOT NULL,
  PRIMARY KEY (project_id)
);

-- genre --
DROP TABLE IF EXISTS genre;
CREATE TABLE genre (
  genre_id   INT                NOT NULL UNIQUE AUTO_INCREMENT,
  genre_name VARCHAR(50) UNIQUE NOT NULL,
  PRIMARY KEY (genre_id)
);

-- genre_of_project --
DROP TABLE IF EXISTS genre_of_project;
CREATE TABLE genre_of_project (
  project_id INT NOT NULL,
  genre_id   INT NOT NULL,
  PRIMARY KEY (project_id, genre_id),
  FOREIGN KEY (project_id)
  REFERENCES project (project_id),
  FOREIGN KEY (genre_id)
  REFERENCES genre (genre_id)
);

-- member --
DROP TABLE IF EXISTS club_member;
CREATE TABLE club_member (
  member_id INT         NOT NULL UNIQUE AUTO_INCREMENT,
  email     VARCHAR(50) NULL UNIQUE,
  lastname  VARCHAR(50) NOT NULL,
  firstname VARCHAR(50) NOT NULL,
  PRIMARY KEY (member_id)
);

-- ar_member --
DROP TABLE IF EXISTS ar_member;
CREATE TABLE ar_member (
  ar_member_id   INT NOT NULL UNIQUE AUTO_INCREMENT,
  club_member_id INT NOT NULL UNIQUE,
  PRIMARY KEY (ar_member_id),
  INDEX ar_member_club_member (club_member_id ASC),
  FOREIGN KEY (club_member_id)
  REFERENCES club_member (member_id)
);

-- artist --
DROP TABLE IF EXISTS artist;
CREATE TABLE artist (
  artist_id   INT         NOT NULL UNIQUE AUTO_INCREMENT,
  rep_id      INT         NULL,
  artist_name VARCHAR(80) NOT NULL,
  PRIMARY KEY (artist_id),
  INDEX artist (rep_id ASC),
  FOREIGN KEY (rep_id)
  REFERENCES ar_member (ar_member_id)
);

-- artist_writes_project --
DROP TABLE IF EXISTS artist_writes_project;
CREATE TABLE artist_writes_project (
  project_id INT NOT NULL,
  artist_id  INT NOT NULL,
  PRIMARY KEY (project_id, artist_id),
  INDEX artist_writes_project_artist_idx (artist_id ASC),
  INDEX artist_writes_project_project_idx (project_id ASC),
  FOREIGN KEY (project_id)
  REFERENCES project (project_id),
  FOREIGN KEY (artist_id)
  REFERENCES artist (artist_id)
);

-- engineer --
DROP TABLE IF EXISTS engineer;
CREATE TABLE engineer (
  engineer_id INT                               NOT NULL UNIQUE AUTO_INCREMENT,
  member_id   INT UNIQUE                        NOT NULL,
  level       ENUM ('Assistant', 'Lead', 'EIT') NOT NULL,
  PRIMARY KEY (engineer_id),
  INDEX engineer_club_member_idx (member_id ASC),
  FOREIGN KEY (member_id)
  REFERENCES club_member (member_id)
);

-- project_assignment --
DROP TABLE IF EXISTS project_assignment;
CREATE TABLE project_assignment (
  project_id  INT NOT NULL,
  engineer_id INT NOT NULL,
  PRIMARY KEY (project_id, engineer_id),
  INDEX project_assignment_engineer_idx (engineer_id ASC),
  INDEX project_assignment_project_idx (project_id ASC),
  FOREIGN KEY (project_id)
  REFERENCES project (project_id),
  FOREIGN KEY (engineer_id)
  REFERENCES engineer (engineer_id)
);

-- location --
DROP TABLE IF EXISTS location;
CREATE TABLE location (
  location_id   INT         NOT NULL UNIQUE AUTO_INCREMENT,
  location_name varchar(75) NOT NULL UNIQUE,
  PRIMARY KEY (location_id),
  INDEX location_idx (location_id ASC),
  INDEX location_name_idx (location_name ASC)
);

-- live_session --
DROP TABLE IF EXISTS live_session;
CREATE TABLE live_session (
  live_session_id INT          NOT NULL UNIQUE AUTO_INCREMENT,
  show_name       VARCHAR(150) NOT NULL,
  date            DATE         NOT NULL,
  start_time      TIME         NOT NULL,
  end_time        TIME         NULL,
  location_id     INT          NOT NULL,
  PRIMARY KEY (live_session_id),
  INDEX live_session_idx (live_session_id ASC),
  INDEX live_session_name_idx (show_name ASC),
  INDEX live_session_date_idx (date DESC),
  FOREIGN KEY (location_id)
  REFERENCES location (location_id)
);

-- event --
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  event_id    INT                            NOT NULL UNIQUE AUTO_INCREMENT,
  date        DATETIME                       NOT NULL,
  title       VARCHAR(100)                   NOT NULL,
  description VARCHAR(700)                   NULL,
  turnout     ENUM ('Low', 'Medium', 'High') NULL,
  PRIMARY KEY (event_id)
);

-- booking --
DROP TABLE IF EXISTS booking;
CREATE TABLE booking (
  event_id  INT NOT NULL,
  artist_id INT NOT NULL,
  PRIMARY KEY (event_id, artist_id),
  INDEX booking_artist_idx (artist_id ASC),
  INDEX booking_event_idx (event_id ASC),
  FOREIGN KEY (event_id)
  REFERENCES `event` (event_id),
  FOREIGN KEY (artist_id)
  REFERENCES artist (artist_id)
);

-- assigned_live_session --
DROP TABLE IF EXISTS assigned_live_session;
CREATE TABLE assigned_live_session (
  live_session_id INT NOT NULL,
  engineer_id     INT NULL,
  INDEX assigned_live_session_engineer_idx (engineer_id ASC),
  INDEX assigned_live_session_live_session_idx (live_session_id ASC),
  FOREIGN KEY (live_session_id)
  REFERENCES live_session (live_session_id),
  FOREIGN KEY (engineer_id)
  REFERENCES engineer (engineer_id)
);

-- release --
DROP TABLE IF EXISTS `release`;
CREATE TABLE `release` (
  release_id   INT  NOT NULL UNIQUE AUTO_INCREMENT,
  project_id   INT  NOT NULL,
  plays        INT  NOT NULL        DEFAULT 0,
  release_date DATE NOT NULL,
  PRIMARY KEY (release_id),
  INDEX release_project_idx (project_id ASC),
  FOREIGN KEY (project_id)
  REFERENCES project (project_id)
);

-- department --
DROP TABLE IF EXISTS department;
CREATE TABLE department (
  department_id INT         NOT NULL UNIQUE AUTO_INCREMENT,
  dept_head_id  INT         NOT NULL,
  title         VARCHAR(30) NULL,
  PRIMARY KEY (department_id, dept_head_id),
  INDEX department_club_member_idx (dept_head_id ASC),
  FOREIGN KEY (dept_head_id)
  REFERENCES club_member (member_id)
);

-- department_membership --
DROP TABLE IF EXISTS department_membership;
CREATE TABLE department_membership (
  member_id     INT NOT NULL,
  department_id INT NOT NULL,
  PRIMARY KEY (member_id, department_id),
  INDEX department_membership_department_idx (department_id ASC),
  INDEX department_membership_club_member_idx (member_id ASC),
  FOREIGN KEY (member_id)
  REFERENCES club_member (member_id),
  FOREIGN KEY (department_id)
  REFERENCES department (department_id)
);

-- eboard_member --
DROP TABLE IF EXISTS eboard_member;
CREATE TABLE eboard_member (
  title     VARCHAR(30) NOT NULL,
  member_id INT         NOT NULL,
  eboard_id INT         NOT NULL UNIQUE AUTO_INCREMENT,
  INDEX eboard_member_club_member_idx (member_id ASC),
  PRIMARY KEY (eboard_id),
  FOREIGN KEY (member_id)
  REFERENCES club_member (member_id)
);

-- link --
DROP TABLE IF EXISTS link;
CREATE TABLE link (
  type       ENUM ('Bandcamp', 'Soundcloud', 'Spotify', 'Apple Music', 'Tidal', 'Pandora', 'YouTube', 'Google Play', 'Amazon Music', 'Other') NOT NULL,
  url        VARCHAR(300)                                                                                                                     NOT NULL,
  link_id    INT                                                                                                                              NOT NULL AUTO_INCREMENT,
  release_id INT                                                                                                                              NOT NULL,
  PRIMARY KEY (link_id),
  INDEX fk_Link_Release1_idx (release_id ASC),
  FOREIGN KEY (release_id)
  REFERENCES `release` (release_id)
);

