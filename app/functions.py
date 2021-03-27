"""
Python functions used to access MySQL DB programming objects
"""

##########
# Helpers
##########

def format_result_set(rows):
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

##########
# Student
##########

def student_get_all_labs(cur, lab_number_limit):
    """
    Return all of the fields of all of the labs for a student to view when they log in
    """
    stmt = "select * from lab limit {}".format(lab_number_limit)
    cur.execute(stmt)
    rows = cur.fetchall()

    result = format_result_set(rows)
    return result

def student_apply_to_lab(cur, username, first_name, last_name, degree_level, lab_name):
    """
    Add a student to the desired lab if the lab is recruiting
    """
    result = ""

    stmt = "select recruiting_status from lab where lab.lab_name = '{}'".format(lab_name)
    cur.execute(stmt)
    row = cur.fetchone()

    if row['recruiting_status'] == 0:
        result = "{} is not currently recruiting :(".format(lab_name)
    else:
        cur.callproc("add_student", args=(username, first_name, last_name, degree_level, lab_name))
        result = "{} was successfully added to {}!".format(username, lab_name)
    return result

##########
# PI
##########

def pi_check_valid_username(cur, username):
    """
    Check if the inputted username is a valid PI username
    """
    stmt = "select username from pi"
    cur.execute(stmt)
    rows = cur.fetchall()
    names = [row["username"].lower() for row in rows]
    return username.lower() in names

def pi_get_lab_info(cur, username):
    """
    Return the information related to a PI's lab and associated college, 
    projects, publications, and lab members
    """
    result = ""

    stmt_lab = "select * from lab l where l.lab_name = get_lab('{}')".format(username)
    cur.execute(stmt_lab)
    rows_lab = cur.fetchall()
    result += format_result_set(rows_lab)

    stmt_college = "select get_college('{}')".format(username)
    cur.execute(stmt_college)
    rows_college = cur.fetchall()
    result += format_result_set(rows_college)

    cur.callproc("pi_projects", args=(username,))
    rows_project = cur.fetchall()
    result += format_result_set(rows_project)

    cur.callproc("pi_publication", args=(username,))
    rows_publication = cur.fetchall()
    result += format_result_set(rows_publication)

    cur.callproc("pi_labmember", args=(username,))
    rows_lab_member = cur.fetchall()
    result += format_result_set(rows_lab_member)
    return result

