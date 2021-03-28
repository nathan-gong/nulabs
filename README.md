# nulabs

CS3200 Database Design Final Project. _Northeastern University Spring 2021_

### Instructions

To run this application on your local machine, please complete the following steps:
1. Connect to a MySQL server (such as by using the __MySQL Workbench__)
2. Run the scripts in the *sql_scripts/* directory in the following order
    1. *create_schema.sql*
    2. *insert_data.sql*
    3. *programming_objects.sql*
3. Under the "MySQL Server User Login Information" within *app/functions.py*, modify the __db_username__ and __db_password__ variables to match your personal MySQL username and password
4. Execute the *app/main.py* script and navigate to the provided local host server address within your web browser of choice


### Dependencies

###### Front-end

    - Attrs

###### Back-end

    - Bootstrap
    - Flask
    - Pandas
    - PyMySQL