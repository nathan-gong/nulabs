from functions import *
from flask import Flask, render_template, request, flash, redirect, url_for

app = Flask(__name__)
app.secret_key = "super-duper secret key"

pi_username = None
admin_username = None

# Render HTML pages

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/pi')
def pi():
    return render_template("pi.html")

# Background processes

@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None

    if request.method == 'POST':
        if pi_check_valid_username(request.form['username']):
            pi_username = request.form['username']
            return redirect(url_for('pi'))
        elif admin_check_valid_username(request.form['username']):
            admin_username = request.form['username']
            return redirect(url_for('index')) # change this 
        else:
            error = 'Invalid username. Please try again!'

    return render_template("login.html", error=error)

@app.route('/student', methods=['GET', 'POST'])
def student():
    message = None

    if request.method == 'POST':
        student_info = [request.form['username'], request.form['first_name'],
                        request.form['last_name'], request.form['degree_level'], request.form['lab_name']]
        message = student_apply_to_lab(*student_info)

    data = student_get_all_labs()
    return render_template("student.html", message=message, data=data)

@app.route('/pi/create_project', methods=['GET', 'POST'])
def PI_create_project():
    message = None

    if request.method == 'POST':
        project_info = [request.form['title'], request.form['project_description'],
                        pi_username]
        message = pi_create_project(*project_info)

    return render_template("pi_create_project.html", message=message)

@app.route('/pi/update_project', methods=['GET', 'POST'])
def PI_update_project_description():
    message = None

    if request.method == 'POST':
        project_info = [request.form['title'], request.form['project_description'],
                        pi_username]
        message = pi_create_project(*project_info)

    return render_template("pi_update_project_description.html", message=message)

@app.route('/pi/add_member', methods=['GET', 'POST'])
def PI_add_lab_member():
    message = None

    if request.method == 'POST':
        lab_member_info = [request.form['title'], request.form['s_username'],
                            pi_username]
        message = pi_add_lab_member(*lab_member_info)

    return render_template("pi_add_lab_member.html", message=message)

@app.route('/pi/delete_member', methods=['GET', 'POST'])
def PI_delete_lab_member():
    message = None

    if request.method == 'POST':
        lab_member_info = [request.form['title'], request.form['s_username'],
                            pi_username]
        message = pi_add_lab_member(*lab_member_info)

    return render_template("pi_delete_lab_member.html", message=message)

@app.route('/pi/publish_project', methods=['GET', 'POST'])
def PI_publish_project():
    message = None

    if request.method == 'POST':
        publication_info = [request.form['doi'], request.form['publication_title'],
                        request.form['publish_date'], request.form['journal'],
                            request.form['project_title'], pi_username]
        message = pi_publish_project(*publication_info)

    return render_template("pi_publish_project.html", message=message)

@app.route('/pi/delete_project', methods=['GET', 'POST'])
def PI_delete_project():
    message = None

    if request.method == 'POST':
        project_info = [request.form['project_title'], pi_username]
        message = pi_delete_project(*project_info)

    return render_template("pi_delete_project.html", message=message)


if __name__ == "__main__":
    app.run(debug=True)
