# nulabs

CS3200 Database Design Final Project. _Northeastern University Spring 2021_

### Instructions

To run this application on your local machine, please complete the following steps:
1. Connect to a MySQL server (such as by using the __MySQL Workbench__)
2. Run the scripts in the *sql_scripts/* directory in the following order
    1. *create_schema.sql*
    2. *insert_data.sql*
    3. *programming_objects.sql*
3. Ensure that you have all of the necessary [dependencies](#dependencies) installed
4. Under the "MySQL Server User Login Information" within *app/functions.py*, modify the ```db_username``` and ```db_password``` variables to match your personal MySQL username and password
5. Execute the *app/main.py* script and navigate to the provided local host server address within your web browser of choice


### Dependencies

###### Front-end

    - Bootstrap

###### Back-end

    - Attrs
    - Flask
    - Pandas
    - PyMySQL