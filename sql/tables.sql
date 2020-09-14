--DROP DATABASE progress_tracker;
--CREATE DATABASE progress_tracker;

DROP TABLE if EXISTS users;
DROP TABLE if EXISTS goals;
DROP TABLE if EXISTS backlogs;
DROP TABLE if EXISTS sprints;
DROP TABLE if EXISTS tasks;

CREATE TABLE users (
	id INT NOT NULL PRIMARY KEY auto_increment,
	username VARCHAR(30) NOT NULL,
	lastname VARCHAR(30) NOT NULL,
	firstname VARCHAR(30) NOT NULL,
	email VARCHAR(30) NOT NULL,
	`password` VARCHAR(30) NOT null
);

CREATE TABLE tasks (
	id INT NOT NULL PRIMARY KEY auto_increment,
	task_name VARCHAR(30) NOT NULL,
	story_points INT NOT NULL
);

CREATE TABLE sprints (
	id INT NOT NULL PRIMARY KEY auto_increment,
	duration INT NOT NULL,
	velocity DOUBLE,
	sprint_story_points INT NOT NULL,
	notes VARCHAR(100),
	task_id INT,
	FOREIGN KEY (task_id) REFERENCES tasks(id)
);

CREATE TABLE backlogs (
	id INT NOT NULL PRIMARY KEY auto_increment,
	backlog_name VARCHAR(30) NOT NULL,
	total_story_points INT NOT NULL,
	sprint_id INT,
	FOREIGN KEY (sprint_id) REFERENCES sprints(id)
);

CREATE TABLE goals (
	id INT NOT NULL PRIMARY KEY auto_increment,
	goal_name VARCHAR(30) NOT NULL,
	deadline DATE,
	backlog_id INT,
	user_id INT,
	FOREIGN KEY (backlog_id) REFERENCES backlogs(`id`),
	FOREIGN KEY (user_id) REFERENCES users(`id`)
);