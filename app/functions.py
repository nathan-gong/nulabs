"""
Python functions used to access MySQL DB programming objects
"""

##########
# Helpers
##########


def format_result_set(rows) -> str:
    """
    Return the formatted result set of a query
    """
    result = ""

    column_names = list(rows[0].keys())
    num_columns = len(column_names)
    fields_list = [list(row.values()) for row in rows]

    format_pattern = "{:<30} \t "
    format_string = format_pattern * num_columns

    header = format_string.format(*column_names) + "\n"
    line = ("_" * 40 * num_columns) + "\n"
    result += header + line

    for fields in fields_list:
        truncated_fields = []
        for field in fields:
            if isinstance(field, str):
                truncated_fields.append(field[:30])
            elif isinstance(field, int):
                truncated_fields.append(("YES" if field == 1 else "NO"))
        result += format_string.format(*truncated_fields) + "\n"
    return result


def check_project_in_pi_lab(cur, title, username) -> bool:
    """
    Validate that the inputted project title is associated with the PI's lab
    """
    stmt = "select get_lab('{}')".format(username)
    cur.execute(stmt)
    row = cur.fetchone()
    lab_name = row['lab_name']

    stmt_project_lab = "select lab_name from project p where p.title = '{}'".format(
        title)
    cur.execute(stmt_project_lab)
    row_project_lab = cur.fetchone()
    project_lab_name = row_project_lab['lab_name']
    return lab_name == project_lab_name


def get_building_names(cur) -> list:
    """
    Get all building names at Northeastern
    """
    stmt = "select building_name from building"
    cur.execute(stmt)
    rows = cur.fetchall()
    building_names = [row["building_name"].lower() for row in rows]
    return building_names


def check_building_in_admin_college(cur, building_name, username) -> bool:
    """
    Validate that the inputted building name is associated with the Admin's college
    """
    cur.callproc("get_admin_building_names", args=(username,))
    rows = cur.fetchall()
    admin_building_names = [row["building_name"].lower() for row in rows]
    return building_name in admin_building_names

##########
# Student
##########


def student_get_all_labs(cur, lab_number_limit) -> str:
    """
    Return all of the fields of all of the labs for a student to view when they log in
    """
    stmt = "select * from lab limit {}".format(lab_number_limit)
    cur.execute(stmt)
    rows = cur.fetchall()

    result = format_result_set(rows)
    return result


def student_apply_to_lab(cur, username, first_name, last_name, degree_level, lab_name) -> str:
    """
    Add a student to the desired lab if the lab is recruiting
    """
    result = ""

    stmt = "select recruiting_status from lab where lab.lab_name = '{}'".format(
        lab_name)
    cur.execute(stmt)
    row = cur.fetchone()

    if row['recruiting_status'] == 0:
        result = "{} is not currently recruiting :(".format(lab_name)
    else:
        cur.callproc("add_student", args=(
            username, first_name, last_name, degree_level, lab_name))
        result = "{} was successfully added to {}!".format(username, lab_name)
    return result


##########
# PI
##########


def pi_check_valid_username(cur, username) -> bool:
    """
    Check if the inputted username is a valid PI username
    """
    stmt = "select username from pi"
    cur.execute(stmt)
    rows = cur.fetchall()
    names = [row["username"].lower() for row in rows]
    return username.lower() in names


def pi_get_lab_info(cur, username) -> str:
    """
    Return the information related to a PI's lab and associated college, 
    projects, publications, and lab members
    """
    result = ""

    stmt_lab = "select * from lab l where l.lab_name = get_lab('{}')".format(
        username)
    cur.execute(stmt_lab)
    rows_lab = cur.fetchall()
    result += format_result_set(rows_lab)

    stmt_college = "select get_college('{}')".format(username)
    cur.execute(stmt_college)
    rows_college = cur.fetchall()
    result += format_result_set(rows_college)

    for procedure in ("pi_projects", "pi_publication", "pi_labmember"):
        cur.callproc(procedure, args=(username,))
        rows = cur.fetchall()
        result += format_result_set(rows)
    return result


def pi_create_project(cur, title, project_description, username) -> None:
    """
    Create a new project associated with a PI's lab
    """
    stmt = "select get_lab('{}')".format(username)
    cur.execute(stmt)
    row = cur.fetchone()
    lab_name = row['lab_name']

    cur.callproc("create_project", args=(title, project_description, lab_name))


def pi_update_project_description(cur, title, project_description, username) -> str:
    """
    Update the description of a project associated with a PI's lab
    """
    result = ""
    project_in_lab = check_project_in_pi_lab(cur, title, username)

    if project_in_lab:
        cur.callproc("update_description", args=(title, project_description))
        result += "Successfully updated description of {}".format(title)
    else:
        result += "{} is not a project associated with your lab".format(title)
    return result


def pi_add_lab_member(cur, title, s_username, p_username) -> str:
    """
    Add an existing student to a project in the PI's lab and update the student's lab information
    """
    result = ""
    project_in_lab = check_project_in_pi_lab(cur, title, p_username)

    if project_in_lab:
        cur.callproc("add_member", args=(title, s_username, p_username))
        result += "Successfully added {} to {}".format(s_username, title)
    else:
        result += "{} is not a project associated with your lab".format(title)
    return result


def pi_delete_lab_member(cur, title, s_username, p_username) -> str:
    """
    Delete an existing student from a project in the PI's lab
    """
    result = ""
    project_in_lab = check_project_in_pi_lab(cur, title, p_username)

    if project_in_lab:
        cur.callproc("delete_member", args=(title, s_username, p_username))
        result += "Successfully removed {} from {}".format(s_username, title)
    else:
        result += "{} is not a project associated with your lab".format(title)
    return result


def pi_publish_project(cur, doi, publication_title, publish_date, journal, project_title, username) -> str:
    """
    Add a publication that resulted from a PI's project
    """
    result = ""
    project_in_lab = check_project_in_pi_lab(cur, project_title, username)

    if project_in_lab:
        cur.callproc("add_publication_to_project", args=(
            doi, publication_title, publish_date, journal, project_title))
        result += "Successfully added {} to {}".format(
            publication_title, project_title)
    else:
        result += "{} is not a project associated with your lab".format(
            project_title)
    return result


def pi_delete_project(cur, title, username) -> str:
    """
    Delete a project associated with a PI's lab
    Triggers the deletion of the project from all relevant tables
    """
    result = ""
    project_in_lab = check_project_in_pi_lab(cur, title, username)

    if project_in_lab:
        cur.callproc("delete_project", args=(title))
        result += "Successfully deleted {}".format(title)
    else:
        result += "{} is not a project associated with your lab".format(title)
    return result


##########
# Admin
##########


def admin_check_valid_username(cur, username) -> bool:
    """
    Check if the inputted username is a valid Admin username
    """
    stmt = "select username from administrator"
    cur.execute(stmt)
    rows = cur.fetchall()
    names = [row["username"].lower() for row in rows]
    return username.lower() in names


def admin_get_lab_info(cur, username) -> str:
    """
    Return the information related to all labs associated with an Admin's college
    """
    result = ""

    cur.callproc("get_labs", args=(username,))
    rows = cur.fetchall()
    result += format_result_set(rows)
    return result


def admin_create_lab(cur, lab_name, lab_description, website, recruiting_status, department, building_name, username) -> str:
    """
    Create a new lab associated with the Admin's college
    """
    result = ""
    building_in_college = check_building_in_admin_college(
        cur, building_name, username)

    if building_in_college:
        cur.callproc("create_lab", args=(lab_name, lab_description,
                     website, recruiting_status, department, building_name))
        result += "Successfully created {}".format(lab_name)
    else:
        result += "{} is not a building associated with your college".format(
            building_name)
    return result


def admin_update_building_street(cur, building_name, street, username) -> str:
    """
    Update the address of a lab building associated with an Admin's college
    """
    result = ""
    building_in_college = check_building_in_admin_college(
        cur, building_name, username)

    if building_in_college:
        cur.callproc("update_lab_building_street",
                     args=(building_name, street))
        result += "Successfully updated {} street to {}".format(
            building_name, street)
    else:
        result += "{} is not a building associated with your college".format(
            building_name)
    return result


def admin_create_building(cur, building_name, street, username) -> None:
    """
    Create a new lab building associated with the Admin's college
    """
    cur.callproc("create_lab_building", args=(building_name, street, username))
