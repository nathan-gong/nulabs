"""
Python functions used to access MySQL DB programming objects
"""
import pymysql


##########
# MySQL Server User Login Information
##########


db_username = "root"
db_password = "Nathangong12"


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


def check_project_in_pi_lab(title, username) -> bool:
    """
    Validate that the inputted project title is associated with the PI's lab
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    project_in_pi_lab = None

    try:
        stmt = "select get_lab('{}') as lab_name".format(username)
        cur.execute(stmt)
        row = cur.fetchone()
        lab_name = row['lab_name']

        stmt_project_lab = "select lab_name from project p where p.title = '{}'".format(
            title)
        cur.execute(stmt_project_lab)
        row_project_lab = cur.fetchone()
        project_lab_name = row_project_lab['lab_name']
        project_in_pi_lab = (lab_name == project_lab_name)
    except Exception as e:
        print(e)
        project_in_pi_lab = False

    cnx.close()
    return project_in_pi_lab


def check_building_in_admin_college(building_name, username) -> bool:
    """
    Validate that the inputted building name is associated with the Admin's college
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    building_in_admin_college = None

    try:
        cur.callproc("get_admin_building_names", args=(username,))
        rows = cur.fetchall()
        admin_building_names = [row["building_name"].lower() for row in rows]
        print(admin_building_names)
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


def student_get_all_labs(lab_number_limit=1000) -> list:
    """
    Return all of the fields of all of the labs for a student to view when they log in
    """
    cnx = connect_to_db()
    cur = cnx.cursor()

    stmt = "select * from lab limit {}".format(lab_number_limit)
    cur.execute(stmt)
    rows = cur.fetchall()

    cnx.close()
    return rows


def student_apply_to_lab(username, first_name, last_name, degree_level, lab_name) -> str:
    """
    Add a student to the desired lab if the lab is recruiting
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""

    try:
        stmt = "select recruiting_status from lab where lab.lab_name = '{}'".format(
            lab_name)
        cur.execute(stmt)
        row = cur.fetchone()

        if row['recruiting_status'] == 0:
            result += "{} is not currently recruiting".format(lab_name)
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


def pi_check_valid_username(username) -> bool:
    """
    Check if the inputted username is a valid PI username
    """
    cnx = connect_to_db()
    cur = cnx.cursor()

    try:
        stmt = "select username from pi"
        cur.execute(stmt)
        rows = cur.fetchall()
        names = [row["username"].lower() for row in rows]
        valid_username = username.lower() in names
    except Exception as e:
        print(e)

    cnx.close()
    return valid_username


def pi_get_lab_info(username) -> tuple:
    """
    Return the information related to a PI's lab and associated college, 
    projects, publications, and lab members
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    cur2 = cnx.cursor()

    try:
        stmt_lab = "select * from lab l where l.lab_name = get_lab('{}')".format(
            username)
        cur.execute(stmt_lab)
        rows_lab = cur.fetchall()

        stmt_college = "select get_college('{}') AS college_name".format(
            username)
        cur2.execute(stmt_college)
        rows_college = cur2.fetchall()

        cur.callproc("pi_projects", args=(username,))
        rows_project = cur.fetchall()

        cur.callproc("pi_publication", args=(username,))
        rows_publication = cur.fetchall()

        cur.callproc("pi_labmember", args=(username,))
        rows_member = cur.fetchall()
    except Exception as e:
        print(e)

    cnx.close()
    return rows_lab, rows_college, rows_project, rows_publication, rows_member


def pi_create_project(title, project_description, username) -> str:
    """
    Create a new project associated with a PI's lab
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""

    try:
        stmt = "select get_lab('{}') as lab_name".format(username)
        cur.execute(stmt)
        row = cur.fetchone()
        lab_name = row['lab_name']

        cur.callproc("create_project", args=(
            title, project_description, lab_name))
        result += "{} was successfully created".format(title)
    except Exception as e:
        print(e)
        result += "{} was not successfully created".format(title)

    cnx.close()
    return result


def pi_update_project_description(title, project_description, username) -> str:
    """
    Update the description of a project associated with a PI's lab
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""
    project_in_lab = check_project_in_pi_lab(title, username)

    try:
        if project_in_lab:
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


def pi_add_lab_member(title, s_username, p_username) -> str:
    """
    Add an existing student to a project in the PI's lab and update the student's lab information
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""
    project_in_lab = check_project_in_pi_lab(title, p_username)

    try:
        if project_in_lab:
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


def pi_delete_lab_member(title, s_username, p_username) -> str:
    """
    Delete an existing student from a project in the PI's lab
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""
    project_in_lab = check_project_in_pi_lab(title, p_username)

    try:
        if project_in_lab:
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


def pi_publish_project(doi, publication_title, publish_date, journal, project_title, username) -> str:
    """
    Add a publication that resulted from a PI's project
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""
    project_in_lab = check_project_in_pi_lab(project_title, username)

    try:
        if project_in_lab:
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


def pi_delete_project(title, username) -> str:
    """
    Delete a project associated with a PI's lab
    Triggers the deletion of the project from all relevant tables
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""
    project_in_lab = check_project_in_pi_lab(title, username)

    try:
        if project_in_lab:
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


def admin_check_valid_username(username) -> bool:
    """
    Check if the inputted username is a valid Admin username
    """
    cnx = connect_to_db()
    cur = cnx.cursor()

    try:
        stmt = "select username from administrator"
        cur.execute(stmt)
        rows = cur.fetchall()
        names = [row["username"].lower() for row in rows]
        valid_username = username.lower() in names
    except Exception as e:
        print(e)

    cnx.close()
    return valid_username


def admin_get_lab_info(username) -> tuple:
    """
    Return the information related to all labs associated with an Admin's college
    """
    cnx = connect_to_db()
    cur = cnx.cursor()

    try:
        cur.callproc("get_labs", args=(username,))
        rows = cur.fetchall()

        stmt = "select college_name from administrator a where a.username = '{}'".format(
            username)
        cur.execute(stmt)
        rows_college = cur.fetchone()
        college = rows_college['college_name']
    except Exception as e:
        print(e)

    cnx.close()
    return rows, college


def admin_create_lab(lab_name, lab_description, website, recruiting_status, department, building_name, username) -> str:
    """
    Create a new lab associated with the Admin's college
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""
    building_in_college = check_building_in_admin_college(
        building_name, username)

    try:
        if building_in_college:
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


def admin_update_building_street(building_name, street, username) -> str:
    """
    Update the address of a lab building associated with an Admin's college
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""
    building_in_college = check_building_in_admin_college(
        building_name, username)

    try:
        if building_in_college:
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


def admin_create_building(building_name, street, username) -> str:
    """
    Create a new lab building associated with the Admin's college
    """
    cnx = connect_to_db()
    cur = cnx.cursor()
    result = ""

    try:
        cur.callproc("create_lab_building", args=(
            building_name, street, username))
        result += "{} was successfully created".format(building_name)
    except Exception as e:
        print(e)
        result += "{} was not successfully created".format(building_name)

    cnx.close()
    return result
