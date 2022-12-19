"""
This file contains Python functions used to access MySQL DB programming objects.
"""
import pymysql


##########
# MySQL Server User Login Information
##########


db_username = "root"
db_password = "********"


##########
# Helpers
##########


def connect_to_db():
    """
    Connect to the DB and return the Cursor
    """
    try:
        cnx = pymysql.connect(host='localhost', user=db_username, password=db_password,
                              db='nulabs', charset='utf8mb4',
                              cursorclass=pymysql.cursors.DictCursor, autocommit=True)
    except pymysql.err.OperationalError as e:
        if e.args[0] == 1045:
            print('Invalid credentials')
        else:
            print('Error: %d: %s' % (e.args[0], e.args[1]))
    return cnx


def check_project_in_pi_lab(title: str, username: str) -> bool:
    """
    Validate that the inputted project title is associated with the PI's lab

    :param title: project title
    :param username: username of the PI a given lab
    :returns: True if the project is in the PI lab, False otherwise
    """
    # Connect to SQL database
    cnx = connect_to_db()
    cur = cnx.cursor()
    project_in_pi_lab = None

    try:
        # SQL function get_lab (programming_objects.sql)
        # SQL query: returns the lab name of the lab that the PI is in charge of
        stmt = "select get_lab('{}') as lab_name".format(username)
        cur.execute(stmt)

        # Obtain the first row from the result of the query
        row = cur.fetchone()
        lab_name = row['lab_name']

        # SQL query: finds the lab that a project is associated with
        stmt_project_lab = "select lab_name from project p where p.title = '{}'".format(
            title)
        cur.execute(stmt_project_lab)

        # Obtain the first row from the result of the query
        row_project_lab = cur.fetchone()
        project_lab_name = row_project_lab['lab_name']

        # Determine if search result given the PI is the same as when given the project name
        project_in_pi_lab = (lab_name == project_lab_name)
    except Exception as e:
        print(e)
        project_in_pi_lab = False

    cnx.close()
    return project_in_pi_lab


def check_building_in_admin_college(building_name: str, username: str) -> bool:
    """
    Validate that the inputted building name is associated with the Admin's college

    :param building_name: name of a building
    :param username: username of an admin
    :returns: True if the building is associated with the administrators college, False otherwise
    """
    # Connect to SQL database
    cnx = connect_to_db()
    cur = cnx.cursor()
    building_in_admin_college = None

    try:
        # SQL procedure get_admin_bulding_names (programming_objects.sql) 
        # SQL procedure: gets all buildings associated with the given administrator
        cur.callproc("get_admin_building_names", args=(username,))

        # Obtain all rows in result
        rows = cur.fetchall()
        admin_building_names = [row["building_name"].lower() for row in rows]
        print(admin_building_names)

        # Check if given building name is in the retrieved bulding names
        building_in_admin_college = (
            building_name.lower() in admin_building_names)
    except Exception as e:
        print(e)
        building_in_admin_college = False

    cnx.close()
    return building_in_admin_college


##########
# Student
##########


def student_get_all_labs(lab_number_limit: int = 1000) -> list:
    """
    Return all of the fields of all of the labs for a student to view when they log in

    :param lab_number_limit: number of labs a student with like to see
    :returns: information on the given number of labs 
    """
    # Connect to SQL database
    cnx = connect_to_db()
    cur = cnx.cursor()

    # SQL query: returns the given number of labs
    stmt = "select * from lab limit {}".format(lab_number_limit)
    cur.execute(stmt)
    rows = cur.fetchall()

    cnx.close()
    return rows


def student_apply_to_lab(username: str, first_name: str, last_name: str, degree_level: str, lab_name: str) -> str:
    """
    Add a student to the desired lab if the lab is recruiting

    :param username: student's username
    :param first_name: student's first name
    :param last_name: student's last name
    :param degree_level: student's degree level
    :param lab_name: lab the student would like to apply to
    :returns: a string noting the status of the students application
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""

    try:
        # SQL query: returns if the given lab is recruiting
        stmt = "select recruiting_status from lab where lab.lab_name = '{}'".format(
            lab_name)
        cur.execute(stmt)

        # Obtain the first row from the result
        row = cur.fetchone()

        # if recruiting status is 0, the lab is not recruiting
        if row['recruiting_status'] == 0:
            result += "{} is not currently recruiting".format(lab_name)
        
        # if the recruiting status is 1, the lab is and the student will be added
        elif row['recruiting_status'] == 1:
            cur.callproc("add_student", args=(
                username, first_name, last_name, degree_level, lab_name))
            result += "{} was successfully added to {}".format(
                username, lab_name)
        else:
            result += "{} was not successfully added to {}".format(
                username, lab_name)
    except Exception as e:
        print(e)
        result += "{} was not successfully added to {}".format(
            username, lab_name)

    cnx.close()
    return result


##########
# PI
##########


def pi_check_valid_username(username: str) -> bool:
    """
    Check if the inputted username is a valid PI username

    :param username: PI's username
    :returns: True if the given usename is in the SQL database, False otherwise
    """
    # Connect to SQL database
    cnx = connect_to_db()
    cur = cnx.cursor()

    try:
        # SQL query: returns the usernames of all the PIs in the database (in the pi table)
        stmt = "select username from pi"
        cur.execute(stmt)

        # Obtain all the results
        rows = cur.fetchall()
        names = [row["username"].lower() for row in rows]
        valid_username = username.lower() in names
    except Exception as e:
        print(e)

    cnx.close()
    return valid_username


def pi_get_lab_info(username: str) -> tuple:
    """
    Return the information related to a PI's lab and associated college, 
    projects, publications, and lab members

    :param username: PI username
    :returns: information related about the PI's lab
    """
    # Connect to SQL database
    cnx = connect_to_db()
    cur = cnx.cursor()
    cur2 = cnx.cursor()

    try:
        # SQL function get_lab (programming_objects.sql)
        # SQL query: returns information from a specific lab
        stmt_lab = "select * from lab l where l.lab_name = get_lab('{}')".format(
            username)
        cur.execute(stmt_lab)
        rows_lab = cur.fetchall()

        # SQL function get_college (programming_objects.sql)
        # SQL query: returns college that the given PI is working in
        stmt_college = "select get_college('{}') AS college_name".format(
            username)
        cur2.execute(stmt_college)
        rows_college = cur2.fetchall()

        # SQL procedure pi_projects (programming_objects.sql)
        # SQL procedure: returns the projects associated with the given PIs lab 
        cur.callproc("pi_projects", args=(username,))
        rows_project = cur.fetchall()
        
        # SQL procedure (programming_objects.sql)
        # SQL procedure: returns publications associated ith the given PI
        cur.callproc("pi_publication", args=(username,))
        rows_publication = cur.fetchall()

        # SQL procedure (programming_objects.sql)
        # SQL procedure: returns lab members of PI 
        cur.callproc("pi_labmember", args=(username,))
        rows_member = cur.fetchall()
    except Exception as e:
        print(e)

    cnx.close()
    return rows_lab, rows_college, rows_project, rows_publication, rows_member


def pi_create_project(title: str, project_description: str, username: str) -> str:
    """
    Create a new project associated with a PI's lab

    :param title: title of new project
    :param project_description: project description
    :param username: username of PI 
    :returns: a string describing the status of the created project
    """
    # Connect to SQL database
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""

    try:
        # SQL function get_lab (programming_objects.sql)
        # SQL query: returns the lab associated with given PI
        stmt = "select get_lab('{}') as lab_name".format(username)
        cur.execute(stmt)
        row = cur.fetchone()
        lab_name = row['lab_name']

        # SQL procedure create_project (programming_objects.sql)
        # SQL procedure: adds the project to the database
        cur.callproc("create_project", args=(
            title, project_description, lab_name))
        result += "{} was successfully created".format(title)
    except Exception as e:
        print(e)
        result += "{} was not successfully created".format(title)

    cnx.close()
    return result


def pi_update_project_description(title: str, project_description: str, username: str) -> str:
    """
    Update the description of a project associated with a PI's lab

    :param title: project title
    :param project_description: project description
    :param username: PI username
    :returns: string decribing the status of the updated project description
    """
    # Connect to SQL database
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""
    project_in_lab = check_project_in_pi_lab(title, username)

    try:
        if project_in_lab:
            # SQL procedure update_description (programming_objects.sql)
            # SQL procedure: updates the description in the given project
            cur.callproc("update_description", args=(
                title, project_description))
            result += "Successfully updated description of {}".format(title)
        else:
            result += "{} is not a project associated with your lab".format(
                title)
    except Exception as e:
        print(e)
        result += "Did not successfully update description of {}".format(title)

    cnx.close()
    return result


def pi_add_lab_member(title: str, s_username: str, p_username: str) -> str:
    """
    Add an existing student to a project in the PI's lab and update the student's lab information

    :param title: title of lab member
    :param s_username: lab member username
    :param p_username: PI username
    :returns: a string describing the status of the lab member 
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""
    project_in_lab = check_project_in_pi_lab(title, p_username)

    try:
        if project_in_lab:
            # SQL procedure add_member (programming_objects.sql)
            # SQL procedure: adds member to a lab 
            cur.callproc("add_member", args=(title, s_username, p_username))
            result += "Successfully added {} to {}".format(s_username, title)
        else:
            result += "{} is not a project associated with your lab".format(
                title)
    except Exception as e:
        print(e)
        result += "Did not successfully add {} to {}".format(s_username, title)

    cnx.close()
    return result

def pi_delete_lab_member(title: str, s_username: str, p_username: str) -> str:
    """
    Delete an existing student from a project in the PI's lab

    :param title: lab member title
    :param s_username: lab member username
    :param p_username: PI username
    :returns: string describing the status of the lab member
    """
    # Connect to SQL database
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""
    project_in_lab = check_project_in_pi_lab(title, p_username)

    try:
        if project_in_lab:
            # SQL procedure delete_member (programming_objects.sql)
            # SQL procedure: deletes member from the given lab
            cur.callproc("delete_member", args=(title, s_username, p_username))
            result += "Successfully removed {} from {}".format(
                s_username, title)
        else:
            result += "{} is not a project associated with your lab".format(
                title)
    except Exception as e:
        print(e)
        result += "Did not successfully remove {} from {}".format(
            s_username, title)

    cnx.close()
    return result


def pi_publish_project(doi: str, publication_title: str, publish_date: str, journal: str, project_title: str, username: str) -> str:
    """
    Add a publication that resulted from a PI's project

    :param doi: doi of published project
    :param publication_title: title
    :param publish_date: date published
    :param journal: journal the project was published in
    :param username: PI username
    :returns: string describing the status of the project
    """
    # Connect to SQL database
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""
    project_in_lab = check_project_in_pi_lab(project_title, username)

    try:
        if project_in_lab:
            # SQL procedure add_publication_to_project (programming_objects)
            # SQL procedure: adds publication to project
            cur.callproc("add_publication_to_project", args=(
                doi, publication_title, publish_date, journal, project_title))
            result += "Successfully added {} to {}".format(
                publication_title, project_title)
        else:
            result += "{} is not a project associated with your lab".format(
                project_title)
    except Exception as e:
        print(e)
        result += "Did not successfully add {} to {}".format(
            publication_title, project_title)

    cnx.close()
    return result


def pi_delete_project(title: str, username: str) -> str:
    """
    Delete a project associated with a PI's lab
    Triggers the deletion of the project from all relevant tables

    :param title: title of project
    :param username: username of PI
    :returns: string describing the status of the project
    """
    # Connect to SQL database
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""
    project_in_lab = check_project_in_pi_lab(title, username)

    try:
        if project_in_lab:
            # SQL procedure delete_project (programming_objects.sql)
            # SQL procedure: deletes prject from lab and deletes project from relevant tables
            cur.callproc("delete_project", args=(title,))
            result += "Successfully deleted {}".format(title)
        else:
            result += "{} is not a project associated with your lab".format(
                title)
    except Exception as e:
        print(e)
        result += "Did not successfully delete {}".format(title)

    cnx.close()
    return result


##########
# Admin
##########


def admin_check_valid_username(username: str) -> bool:
    """
    Check if the inputted username is a valid Admin username

    :param username: administrator username
    :returns: True if username is valid, False otherwise
    """
    # Connect to SQL database
    cnx = connect_to_db()
    cur = cnx.cursor()

    try:
        # SQL query: returns all usernames from administrator table
        stmt = "select username from administrator"
        cur.execute(stmt)

        # Obtain all results from query
        rows = cur.fetchall()
        names = [row["username"].lower() for row in rows]

        # Check if given admin username in results
        valid_username = username.lower() in names
    except Exception as e:
        print(e)

    cnx.close()
    return valid_username


def admin_get_lab_info(username: str) -> tuple:
    """
    Return the information related to all labs associated with an Admin's college

    :param username: administrator username
    :returns: a tuple of information related to labs working under the admin and their associated college
    """
    # Connect to SQL database
    cnx = connect_to_db()
    cur = cnx.cursor()

    try:
        # SQL procedure get_labs (programming_objects.sql)
        # SQL procedure: gets all labs associated with an administrator
        cur.callproc("get_labs", args=(username,))
        rows = cur.fetchall()

        # SQL query: returns college the administrator is associated with
        stmt = "select college_name from administrator a where a.username = '{}'".format(
            username)
        cur.execute(stmt)
        rows_college = cur.fetchone()
        college = rows_college['college_name']
    except Exception as e:
        print(e)

    cnx.close()
    return rows, college


def admin_create_lab(lab_name: str, lab_description: str, website: str, recruiting_status: int, department: str, building_name: str, username: str) -> str:
    """
    Create a new lab associated with the Admin's college
    
    :param lab_name: name of new lab
    :param lab_description: new lab description
    :param website: new lab website
    :param recruiting_status: recruiting status of new lab
    :param department: department new lab is part of 
    :param building_name: building name of new lab
    :param username: admin username
    :returns: string describing the status of the lab
    """
    # Connect to SQL database
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""
    building_in_college = check_building_in_admin_college(
        building_name, username)

    try:
        if building_in_college:
            # SQL procedure create_lab (programming_objects.sql)
            # SQL procedure: creates lab under administrator
            cur.callproc("create_lab", args=(lab_name, lab_description,
                                             website, recruiting_status, department, building_name))
            result += "Successfully created {}".format(lab_name)
        else:
            result += "{} is not a building associated with your college".format(
                building_name)
    except Exception as e:
        print(e)
        result += "Did not successfully create {}".format(lab_name)

    cnx.close()
    return result


def admin_update_building_street(building_name: str, street: str, username: str) -> str:
    """
    Update the address of a lab building associated with an Admin's college

    :param building_name: building name
    :param street: street name where building is located
    :param username: administrator username
    :returns: string describing the status of the building
    """
    # Connect to SQL database
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""
    building_in_college = check_building_in_admin_college(
        building_name, username)

    try:
        if building_in_college:
            # SQL procedure update_lab_building_street
            # SQL procedure: updates the lab building street name
            cur.callproc("update_lab_building_street",
                         args=(building_name, street))
            result += "Successfully updated {} street to {}".format(
                building_name, street)
        else:
            result += "{} is not a building associated with your college".format(
                building_name)
    except Exception as e:
        print(e)
        result += "Did not successfully update {} street to {}".format(
            building_name, street)

    cnx.close()
    return result


def admin_create_building(building_name: str, street: str, username) -> str:
    """
    Create a new lab building associated with the Admin's college

    :param building_name: building name
    :param street: street name where building is located
    :param username: administrator username
    :returns: string describing status of the building
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""

    try:
        # SQL procedure create_lab_building (programming_objects.sql)
        # SQL procedure: create a lab building in the database
        cur.callproc("create_lab_building", args=(
            building_name, street, username))
        result += "{} was successfully created".format(building_name)
    except Exception as e:
        print(e)
        result += "{} was not successfully created".format(building_name)

    cnx.close()
    return result
