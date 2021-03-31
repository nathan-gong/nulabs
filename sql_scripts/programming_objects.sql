# Programming objects

USE nulabs;

-- STUDENT

delimiter $$
CREATE PROCEDURE add_student(IN username VARCHAR(255), IN first_name varchar(255), IN last_name VARCHAR(255), IN degree_level VARCHAR(64), IN lab_name VARCHAR(255))
BEGIN
INSERT INTO lab_member values (username, first_name, last_name, degree_level, lab_name);
END $$
delimiter ;

-- PI

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
CREATE FUNCTION get_college(username VARCHAR(255))
	RETURNS VARCHAR(16)
    DETERMINISTIC
    CONTAINS SQL 
    READS SQL DATA
    
	BEGIN
	DECLARE pi_building VARCHAR(255);
    DECLARE result VARCHAR(16);
    DECLARE pi_lab VARCHAR(255);
	SELECT get_lab(username) INTO pi_lab;
    SELECT building_name FROM lab l WHERE l.lab_name = pi_lab INTO pi_building;
    SELECT college_name FROM building b WHERE b.building_name = pi_building INTO result;
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
	DELETE FROM project p WHERE p.title = project_title;
END $$
delimiter ;

delimiter $$
CREATE TRIGGER deleted_project AFTER DELETE ON project 
FOR EACH ROW
BEGIN

DELETE FROM conducts WHERE conducts.title = OLD.title;
DELETE FROM results_in WHERE results_in.title = OLD.title;

END $$
delimiter ;

-- ADMIN

delimiter $$
CREATE PROCEDURE get_labs(IN username VARCHAR(255))
	BEGIN
	DECLARE admin_college VARCHAR(255);
    
	SELECT college_name FROM administrator a WHERE a.username = username INTO admin_college;
	SELECT l.* FROM building b JOIN lab l ON b.building_name = l.building_name WHERE b.college_name = admin_college order by l.lab_name;

	END $$
delimiter ;

delimiter $$
CREATE PROCEDURE get_building_names()
	BEGIN
    SELECT building_name from building;
    END $$
delimiter ;

delimiter $$
CREATE PROCEDURE get_admin_building_names(IN username VARCHAR(255))
	BEGIN
    DECLARE admin_college VARCHAR(255);
    
	SELECT college_name FROM administrator a WHERE a.username = username INTO admin_college;
    SELECT building_name FROM building b WHERE b.college_name = admin_college;
    END $$
delimiter ;

delimiter $$
CREATE PROCEDURE create_lab(IN lab_name VARCHAR(255), IN lab_description VARCHAR(3000), IN website VARCHAR(1000), 
IN recruiting_status TINYINT, IN department VARCHAR(255), IN building_name VARCHAR(255))
	BEGIN
	INSERT INTO lab VALUES (lab_name, lab_description, website, recruiting_status, department, building_name);
	END $$
delimiter ;

delimiter $$
CREATE PROCEDURE update_lab_building_street(IN building_name VARCHAR(255), IN street VARCHAR(255))
	BEGIN
	UPDATE building b
    SET b.street = street 
    WHERE b.building_name = building_name;
	END $$
delimiter ;

delimiter $$
CREATE PROCEDURE create_lab_building(IN building_name VARCHAR(255), IN street VARCHAR(255), IN username VARCHAR(255))
	BEGIN
    DECLARE admin_college VARCHAR(255);
	
    SELECT college_name FROM administrator a WHERE a.username = username INTO admin_college;
    
    INSERT INTO building values (building_name, street, admin_college);
	END $$
delimiter ;
