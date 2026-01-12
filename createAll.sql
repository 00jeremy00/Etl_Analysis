CREATE DATABASE IF NOT EXISTS Election;
USE Election;
CREATE TABLE IF NOT EXISTS state (
  state_code CHAR(2) PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS county (
  county_id INT AUTO_INCREMENT PRIMARY KEY,
  state_code CHAR(2) NOT NULL,
  name VARCHAR(100) NOT NULL,
  FOREIGN KEY (state_code) REFERENCES state(state_code)
);

CREATE TABLE IF NOT EXISTS county (
  county_id INT AUTO_INCREMENT PRIMARY KEY,
  state_code CHAR(2) NOT NULL,
  name VARCHAR(100) NOT NULL,
  UNIQUE (state_code, name),
  FOREIGN KEY (state_code) REFERENCES state(state_code)
);

