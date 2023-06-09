-- 1
CREATE TABLE mountains(
	id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50)
);

CREATE TABLE peaks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50),
    mountain_id INT,
    CONSTRAINT fk_peaks_mountain_id_mountains_id FOREIGN KEY (mountain_id)
        REFERENCES mountains (id)
);


-- 2
SELECT 
    v.driver_id,
    v.vehicle_type,
    CONCAT(c.first_name, ' ', c.last_name) AS 'driver_name'
FROM
    vehicles AS v
        JOIN
    campers AS c ON c.id = v.driver_id;


-- 3
SELECT 
    r.starting_point AS 'route_starting_point',
    r.end_point AS 'route_ending_point',
    r.leader_id,
    CONCAT(c.first_name, ' ', c.last_name) AS 'leader_name'
FROM
    routes AS r
		JOIN
    campers AS c ON c.id = r.leader_id;


-- 4
CREATE TABLE mountains(
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE peaks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    mountain_id INT,
    CONSTRAINT fk_peaks_mountain_id__mountains_id FOREIGN KEY (mountain_id)
        REFERENCES mountains (id)
        ON DELETE CASCADE
);


-- 5
CREATE TABLE clients(
	id INT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(100)
);

CREATE TABLE projects(
	id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    project_lead_id INT,
    CONSTRAINT fk_projects_client_id__client_id
    FOREIGN KEY (client_id)
    REFERENCES clients(id)
);

CREATE TABLE employees(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    project_id INT,
    CONSTRAINT fk_employees_project_id__projects_id
    FOREIGN KEY (project_id)
    REFERENCES projects(id)
    );
    
ALTER TABLE projects
	ADD CONSTRAINT fk_projects_project_lead_id__employees_id
	FOREIGN KEY (project_lead_id)
    REFERENCES employees(id);