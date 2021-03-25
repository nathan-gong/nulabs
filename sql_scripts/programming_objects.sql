USE nulabs;

-- STUDENT
delimiter $$
CREATE FUNCTION check_status(lab_name VARCHAR(255))
	RETURNS TINYINT
    DETERMINISTIC
    CONTAINS SQL 
    READS SQL DATA
    
	BEGIN
	DECLARE recruiting TINYINT;
	SELECT recruiting_status FROM lab l WHERE l.lab_name = lab_name INTO recruiting;
	RETURN recruiting;
	END $$
delimiter ;

delimiter $$
CREATE PROCEDURE add_student(IN username VARCHAR(255), IN first_name varchar(255), IN last_name VARCHAR(255), IN degree_level VARCHAR(64), IN lab_name VARCHAR(255))
BEGIN
INSERT INTO lab_member values (username, first_name, last_name, degree_level, lab_name);
END $$
delimiter ;

-- LOGIN
delimiter $$
CREATE PROCEDURE pi_users()    
	BEGIN
	SELECT username FROM pi;
	END $$
delimiter ;

delimiter $$
CREATE PROCEDURE admin_users()    
	BEGIN
	SELECT username FROM administrator;
	END $$
delimiter ;

delimiter $$
CREATE FUNCTION get_lab(username VARCHAR(255))
	RETURNS VARCHAR(255)
    DETERMINISTIC
    CONTAINS SQL 
    READS SQL DATA
    
    BEGIN 
		DECLARE pi_lab VARCHAR(255);
        SELECT lab_name FROM pi p WHERE p.username = username INTO pi_lab;
        RETURN pi_lab;
    END $$ 
delimiter;

delimiter $$
CREATE PROCEDURE pi_lab_info(IN username VARCHAR(255))
	BEGIN
		DECLARE pi_lab VARCHAR(255);
		SELECT get_lab(username) INTO pi_lab;
        
        SELECT * FROM lab l WHERE l.lab_name = pi_lab;
	END $$
delimiter ;



delimiter $$
CREATE FUNCTION get_college(username VARCHAR(255))
	RETURNS VARCHAR(16)
    DETERMINISTIC
    CONTAINS SQL 
    READS SQL DATA
    
	BEGIN
	DECLARE pi_building VARCHAR(255);
    DECLARE result VARCHAR(16);
	SELECT building_name FROM pi p WHERE p.username = username INTO pi_building;
    SELECT college_name FROM building b WHERE b.college_name = pi_building INTO result;
    RETURN result;
	END $$
delimiter ;

delimiter $$
CREATE PROCEDURE pi_projects(IN username VARCHAR(255))
	BEGIN
		DECLARE pi_lab VARCHAR(255);
		SELECT get_lab(username) INTO pi_lab;
        
        SELECT * FROM project p WHERE p.lab_name = pi_lab;
	END $$
delimiter ;

delimiter $$
CREATE PROCEDURE pi_publication(IN username VARCHAR(255))
	BEGIN
		DECLARE pi_lab VARCHAR(255);
		SELECT get_lab(username) INTO pi_lab;
        SELECT * FROM publication WHERE publication.doi IN (
			SELECT doi FROM results_in WHERE results_in.title IN 
			(SELECT title FROM project p WHERE p.lab_name = pi_lab));
	END $$
delimiter ;

delimiter $$
CREATE PROCEDURE pi_labmember(IN username VARCHAR(255))
	BEGIN
		DECLARE pi_lab VARCHAR(255);
		SELECT get_lab(username) INTO pi_lab;
        
        SELECT * FROM conducts c WHERE c.lab_name = pi_lab;
	END $$
delimiter ;

delimiter $$
CREATE PROCEDURE create_project(IN title VARCHAR(256), IN project_description VARCHAR(3000), IN lab_name VARCHAR(255))
BEGIN
INSERT INTO project VALUES (title, project_description, lab_name);
END $$
delimiter ;

SET @e = "";

delimiter $$
CREATE PROCEDURE update_description(IN title VARCHAR(256), IN project_description VARCHAR(3000))
BEGIN

UPDATE project p
	SET p.project_description = project_description
	WHERE p.title = title; 
END $$
delimiter ;

delimiter $$
CREATE PROCEDURE add_member(IN title VARCHAR(256), IN s_username VARCHAR(255), IN pi_username VARCHAR(255))
BEGIN
	DECLARE pi_lab VARCHAR(255);
		SELECT get_lab(pi_username) INTO pi_lab;
	INSERT INTO conducts VALUES (s_username, title, pi_lab);
    UPDATE lab_member m
    SET m.lab_name = pi_lab
    WHERE m.username = s_username;
END $$
delimiter ;

delimiter $$
CREATE PROCEDURE delete_member(IN title VARCHAR(256), IN s_username VARCHAR(255), IN pi_username VARCHAR(255))
BEGIN
	DECLARE pi_lab VARCHAR(255);
		SELECT get_lab(pi_username) INTO pi_lab;
	DELETE FROM conducts c
    WHERE c.username = s_username AND 
    c.title = title;
END $$
delimiter ;

delimiter $$
CREATE PROCEDURE add_publication_to_project(IN doi VARCHAR(256), IN title VARCHAR(256), 
IN publish_date INT, IN journal VARCHAR(1000), IN project_title VARCHAR(256))

BEGIN
	INSERT INTO publication VALUES (doi, title, publish_date, journal);
	INSERT INTO results_in VALUES (project_title, doi);
END $$
delimiter ;

delimiter $$
CREATE PROCEDURE delete_project(IN project_title VARCHAR(256))
BEGIN
	DELETE FROM project WHERE project.title = project_title;
END $$
delimiter ;

delimiter $$
CREATE TRIGGER deleted_project AFTER DELETE ON project 
FOR EACH ROW
BEGIN

DELETE FROM conducts WHERE conduct.title = OLD.title;
DELETE FROM results_in WHERE results_in.title = OLD.title;

END $$
delimiter ;

