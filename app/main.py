import pymysql
from functions import *
from flask import Flask, render_template, request, flash, redirect, url_for

app = Flask(__name__)
app.secret_key = "super-duper secret key"

# Render HTML pages

@app.route('/')
def index():
    return render_template("index.html")

@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None

    if request.method == 'POST':
        if pi_check_valid_username(request.form['username']):
            flash("Login successful :P")
            return redirect(url_for('index'))
        else:
            error = 'Invalid username or password. Please try again!'

    return render_template("login.html", error=error)

if __name__ == "__main__":
    app.run(debug=True)
