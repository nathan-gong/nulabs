# nulabs

CS3200 Database Design Final Project. _Northeastern University Spring 2021_

### Instructions

To run this application on your local machine, please complete the following steps:
1. Connect to a MySQL server (such as by using the __MySQL Workbench__)
2. Run the scripts in the *sql_scripts/* directory in the following order (this will be a dump eventually)
    1. *create_schema.sql*
    2. *insert_data.sql*
    3. *programming_objects.sql*
3. Ensure that you have all of the necessary [dependencies](#dependencies) installed as needed
4. Under the "MySQL Server User Login Information" section within *app/functions.py*, modify the ```db_username``` and ```db_password``` variables to match your personal MySQL username and password
5. Execute the *app/main.py* script and navigate to the provided local host server address within your web browser of choice

#### Notes:
- If you are logged in and refresh the webpage or stop the execution of *app/main.py*, you will need to log back in.
- If you make any changes to the codebase while the application is running, you will need to refresh the webpage and/or rerun *app/main.py* in order for those changes to take place.

### Dependencies

###### Machine Specifications

    - Computer running Python 3.7.x+
    - Text or code editor
    - Web browser

###### Front-end

    - Bootstrap

###### Back-end

    - Flask
    - Pandas
    - PyMySQL