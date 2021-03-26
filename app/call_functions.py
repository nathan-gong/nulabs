import pymysql

try:
    cnx = pymysql.connect(host='localhost', user="root",
                          password="Emmyc2001",
                      db='nulabs', charset='utf8mb4',
                          cursorclass=pymysql.cursors.DictCursor)

except pymysql.err.OperationalError as e:
    if e.args[0] == 1045:
        print('Invalid credentials :(')
    else:
        print('Error: %d: %s' % (e.args[0], e.args[1]))


try:
    cur = cnx.cursor()
    stmt_select = "select * from lotr_character order by character_name"

    def get_all_labs():

        stmt_select = "select * from lab LIMIT 10"
        cur.execute(stmt_select)
        rows = cur.fetchall()

        lab_name = 'name'
        description = 'description'
        website = 'website'
        recruiting = 'recruiting?'
        department = 'department'
        building = 'building'

        print("{:<50} \t {:<50} \t {:<30} \t {:<10} \t {:<30} \t {:<10} \t".format(lab_name, description,
                                                                                          website, recruiting,
                                                                                          department, building))
        print("_" * 269)

        for row in rows:
            print("{:<50} \t {:<50} \t {:<30} \t {:<10} \t {:<30} \t {:<10} \t".format(row["lab_name"][:40],
                                                                                        row["lab_description"][:50],
                                                                                        row["website"][8:38],
                                                                                        ("YES" if row["recruiting_status"] == 1 else "NO"),
                                                                                        row["department"],
                                                                                        row["building_name"]))
    #get_all_labs()

    def student_apply(username, first_name, last_name, degree_level, lab_name):
        stmt_select = "select recruiting_status from lab WHERE lab.lab_name = '{}'".format(lab_name)
        cur.execute(stmt_select)
        c = cur.fetchone()

        if c['recruiting_status'] == 0:
            print("this lab not recruiting :(")
        else:
            cur.callproc("add_student", args=(username, first_name, last_name, degree_level, lab_name))
            print("student successfully added")
    #student_apply("chen.emi", "emily", "chen", "undergrad", "Modeling of Biological and Socio-technical Systems "
     #                                                        "(MOBS) Lab")

    def check_pi(username):
        stmt_select = "select username from pi"
        cur.execute(stmt_select)
        names = cur.fetchall()
        c_names = [name["username"].lower() for name in names]
        return username.lower() in c_names;

    def pi_lab_info(username):
        stmt_select = "SELECT * FROM lab l WHERE l.lab_name = get_lab('{}')".format(username)
        cur.execute(stmt_select)
        print('general', cur.fetchall())

        select_college = "SELECT get_college('{}')".format(username)
        cur.execute(select_college)
        print('college', cur.fetchall())

        cur.callproc("pi_projects", args=(username,))
        print(cur.fetchall())

        cur.callproc("pi_publication", args=(username,))
        print(cur.fetchall())

        cur.callproc("pi_labmember", args=(username,))
        print(cur.fetchall())

    pi_lab_info('c.riedl')



except pymysql.Error as e:
    print('Error: %d: %s' % (e.args[0], e.args[1]))

finally:
    cnx.close()





