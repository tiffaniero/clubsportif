CREATE DATABASE IF NOT EXISTS clubsportif;

DROP TABLE IF EXISTS plan;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS coach;
DROP TABLE IF EXISTS user;


CREATE TABLE user(
    id_user         INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstname       VARCHAR(255),
    lastname        VARCHAR(255),
    email           VARCHAR(320),
    password        VARCHAR(60)
);


CREATE TABLE coach(
    id_user             INT PRIMARY KEY,
    picture             VARCHAR(360),
    formation           JSON,
    specialites         JSON,   

    CONSTRAINT FK_coach_user FOREIGN KEY (id_user) REFERENCES user(id_user)
);

CREATE TABLE member(
    id_user             INT PRIMARY KEY,
    emailing            BOOLEAN DEFAULT 0,

    CONSTRAINT FK_member_user FOREIGN KEY (id_user) REFERENCES user(id_user)
);

CREATE TABLE course(
    id_course       INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name            VARCHAR(255),
    duration        VARCHAR(10)
);

CREATE TABLE plan(
   id_member    INT,
   id_coach     INT,
   id_course    INT,
   date_debut   DATETIME,
   date_fin     DATETIME,
   PRIMARY KEY(id_member, id_coach, id_course),
   FOREIGN KEY(id_member) REFERENCES member(id_user),
   FOREIGN KEY(id_coach) REFERENCES coach(id_user),
   FOREIGN KEY(id_course) REFERENCES course(id_course)
);