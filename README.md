# NULabs

CS3200 Database Design Final Project. _Northeastern University Spring 2021_

<p float="left">
    <img src="https://user-images.githubusercontent.com/52764831/113491729-d68a5400-94a0-11eb-8bfa-6df7422232f0.jpg" width="400" height="300">
    <img src="https://user-images.githubusercontent.com/52764831/113491737-e6099d00-94a0-11eb-87cf-4f3c2c230b0c.jpg" width="400" height="300">
    <img src="https://user-images.githubusercontent.com/52764831/113491748-f457b900-94a0-11eb-81cf-f960276975a6.jpg" width="400" height="300">
    <img src="https://user-images.githubusercontent.com/52764831/113491752-fb7ec700-94a0-11eb-82eb-936cac1ecad2.jpg" width="400" height="300">
</p>

### Instructions

To run this application on your local machine, please complete the following steps:
1. Connect to a MySQL server (such as by using the __MySQL Workbench__).
2. Import the *sql_scripts/nulabs.sql* SQL dump file into a MySQL database.
3. Ensure that you have all of the necessary [dependencies](#dependencies) installed as needed.
4. Under the "MySQL Server User Login Information" section within *app/functions.py*, modify the ```db_username``` and ```db_password``` variables to match your personal MySQL username and password.
5. Execute the *app/main.py* script and navigate to the provided local host server address within your web browser of choice.

#### Notes:
- If you are logged in and refresh the webpage or stop the execution of *app/main.py*, you will need to log back in.
- If you make any changes to the codebase while the application is running, you will need to refresh the webpage and/or rerun *app/main.py* in order for those changes to come into effect.

### Dependencies

###### Machine Specifications

    - Computer running Python 3.7.x+
    - MySQL DBMS
    - Text or code editor
    - Web browser

###### Front-end

    - Bootstrap

###### Back-end

    - Flask
    - Pandas
    - PyMySQL