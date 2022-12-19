'''
This file contains code that renders the HTML pages of the NULabs 
website and handles web routing. 
'''

from functions import *
from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)
app.secret_key = "super-duper secret key"


@app.route('/')
def index():
    """
    Render the index.html page.
    """

    return render_template("index.html")


@app.route('/pi')
def pi():
    """
    Renders the HTML page for a specific PI. 
    """
    lab, college, project, publication, members = pi_get_lab_info(pi_username)
    return render_template("pi.html", username=pi_username, lab=lab, college=college, project=project,
                           publication=publication, members=members)


@app.route('/admin')
def admin():
    """
    Renders the HTML page for a specific administrator. 
    """
    data, college_name = admin_get_lab_info(admin_username)
    return render_template("admin.html", data=data, username=admin_username, college_name=college_name)

@app.route('/login', methods=['GET', 'POST'])
def login():
    """
    Renders the HTML login page that redirects the user based on their type. 
    """
    error = None

    if request.method == 'POST':
        # Determine if the user is a PI
        if pi_check_valid_username(request.form['username']):
            global pi_username
            pi_username = request.form['username']
            return redirect(url_for('pi'))
        # Determine if the user is an administrator
        elif admin_check_valid_username(request.form['username']):
            global admin_username
            admin_username = request.form['username']
            return redirect(url_for('admin'))
        else:
            error = 'Invalid username. Please try again!'
    # Render login page
    return render_template("login.html", error=error)


@app.route('/student', methods=['GET', 'POST'])
def student():
    """
    Renders the student.html page that asks for information needed to apply to work in a lab. 
    """
    message = None

    if request.method == 'POST':
        # Obtain a students username, first and last name, degree level and lab name they'd like to apply to 
        student_info = [request.form['username'], request.form['first_name'],
                        request.form['last_name'], request.form['degree_level'], request.form['lab_name']]
        message = student_apply_to_lab(*student_info)

    data = student_get_all_labs()
    return render_template("student.html", message=message, data=data)


@app.route('/pi/create_project', methods=['GET', 'POST'])
def PI_create_project():
    """
    Renders the pi_create_project.html page which allows a PI to add another project 
    under their lab group.
    """
    message = None

    if request.method == 'POST':
        # Obtain the title and description of the project to be added
        project_info = [request.form['title'], request.form['project_description'],
                        pi_username]
        message = pi_create_project(*project_info)

    return render_template("pi_create_project.html", message=message)


@app.route('/pi/update_project', methods=['GET', 'POST'])
def PI_update_project_description():
    """
    Renders the pi_update_description.html page which allows a PI to update a project 
    under their lab group.
    """
    message = None

    if request.method == 'POST':
        # Obtain project name and new project description to be updated
        project_info = [request.form['title'], request.form['project_description'],
                        pi_username]
        message = pi_update_project_description(*project_info)

    return render_template("pi_update_project_description.html", message=message)


@app.route('/pi/add_member', methods=['GET', 'POST'])
def PI_add_lab_member():
    """
    Renders the pi_add_lab_member.html page which allows a PI to add another lab 
    member in their lab group.
    """
    message = None

    if request.method == 'POST':
        # Obtain the title and username of the person to be added
        lab_member_info = [request.form['title'], request.form['s_username'],
                           pi_username]
        message = pi_add_lab_member(*lab_member_info)

    return render_template("pi_add_lab_member.html", message=message)


@app.route('/pi/delete_member', methods=['GET', 'POST'])
def PI_delete_lab_member():
    """
    Renders the pi_delete_lab_member.html page which allows a PI to delete a lab 
    member in their lab group.
    """
    message = None

    if request.method == 'POST':
        # Obtain the title and username of the lab member to be deleted
        lab_member_info = [request.form['title'], request.form['s_username'],
                           pi_username]
        message = pi_delete_lab_member(*lab_member_info)

    return render_template("pi_delete_lab_member.html", message=message)


@app.route('/pi/publish_project', methods=['GET', 'POST'])
def PI_publish_project():
    """
    Renders the pi_publish_project.html page which allows a PI to add a project to
    their published projects.
    """
    
    message = None

    if request.method == 'POST':
        # Obtain the DOI, publication title, publish date, journal and project title of the 
        # project to be published.
        publication_info = [request.form['doi'], request.form['publication_title'],
                            request.form['publish_date'], request.form['journal'],
                            request.form['project_title'], pi_username]
        message = pi_publish_project(*publication_info)

    return render_template("pi_publish_project.html", message=message)


@app.route('/pi/delete_project', methods=['GET', 'POST'])
def PI_delete_project():
    """
    Renders the pi_delete_project.html page which allows a PI to delete a project 
    from their lab.
    """
    message = None

    if request.method == 'POST':
        # Obtain the title of the project to be deleted
        project_info = [request.form['project_title'], pi_username]
        message = pi_delete_project(*project_info)

    return render_template("pi_delete_project.html", message=message)


@app.route('/admin/create_lab', methods=['GET', 'POST'])
def ADMIN_create_lab():
    """
    Renders the admin_create_lab.html page which allows an administrator to add a 
    lab to their department.
    """
    message = None

    if request.method == 'POST':
        # Obtain the name, description, website, recruiting status, department and bulding name
        # of the lab to be added
        lab_info = [request.form['lab_name'], request.form['lab_description'],
                    request.form['website'], request.form['recruiting_status'],
                    request.form['department'], request.form['building_name'], admin_username]
        message = admin_create_lab(*lab_info)

    return render_template("admin_create_lab.html", message=message)


@app.route('/admin/update_building', methods=['GET', 'POST'])
def ADMIN_update_building_street():
    """
    Renders the admin_create_lab.html page which allows an administrator to update a 
    building in their department.
    """
    message = None

    if request.method == 'POST':
        # Obtain the name and street of the building to be updated
        building_info = [request.form['building_name'],
                         request.form['street'], admin_username]
        message = admin_update_building_street(*building_info)

    return render_template("admin_update_building_street.html", message=message)


@app.route('/admin/create_building', methods=['GET', 'POST'])
def ADMIN_create_building():
    """
    Renders the admin_create_building.html page which allows an administrator to add a 
    building in their department.
    """
    message = None

    if request.method == 'POST':
        # Obtain the name and street of the building to be added
        building_info = [request.form['building_name'],
                         request.form['street'], admin_username]
        message = admin_create_building(*building_info)

    return render_template("admin_create_building.html", message=message)

# Run the app
if __name__ == "__main__":
    app.run(debug=True)
