CREATE DATABASE IF NOT EXISTS Election;
USE Election;
CREATE TABLE IF NOT EXISTS state (
  state_code CHAR(2) PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS county (
  county_id INT AUTO_INCREMENT PRIMARY KEY,
  state_code CHAR(2) NOT NULL,
  name VARCHAR(50) NOT NULL,
  UNIQUE (state_code, name),
  FOREIGN KEY (state_code) REFERENCES state(state_code)
);

CREATE TABLE IF NOT EXISTS precinct (
	precinct_id INT AUTO_INCREMENT PRIMARY KEY,
    county_id INT NOT NULL,
    precinct_medsl VARCHAR(20),
    precinct_cvr VARCHAR(20),
    UNIQUE (county_id, precinct_medsl, precinct_cvr),
    FOREIGN  KEY (county_id) REFERENCES county(county_id)
);

CREATE TABLE IF NOT EXISTS party (
	party_id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10),
    name  VARCHAR(100),
    UNIQUE (code, name)
);

CREATE TABLE IF NOT EXISTS candidate (
	candidate_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    party_id  INT,
    UNIQUE (name, party_id),
    FOREIGN KEY (party_id) REFERENCES party(party_id)
);

CREATE TABLE IF NOT EXISTS election (
	election_id INT AUTO_INCREMENT PRIMARY KEY,
    year INT NOT NULL,
    election_type VARCHAR(50),
    UNIQUE (year, election_type)
);

CREATE TABLE IF NOT EXISTS contest (
	contest_id INT AUTO_INCREMENT PRIMARY KEY,
    election_ID INT NOT NULL,
    office VARCHAR(100) NOT NULL,
    district VARCHAR(50),
    UNIQUE (election_id, office, district),
    FOREIGN KEY (election_id) REFERENCES election(election_id)
);

CREATE TABLE IF NOT EXISTS vote (
  vote_id INT AUTO_INCREMENT PRIMARY KEY,
  cvr_id INT NOT NULL,
  precinct_id INT NOT NULL,
  contest_id INT NOT NULL,
  candidate_id INT NOT NULL,
  FOREIGN KEY (precinct_id) REFERENCES precinct(precinct_id),
  FOREIGN KEY (contest_id) REFERENCES contest(contest_id),
  FOREIGN KEY (candidate_id) REFERENCES candidate(candidate_id)
);

