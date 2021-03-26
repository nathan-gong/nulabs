import pymysql
'''
from tkinter import *

m=Tk() #where m is the name of the main window object
window = Frame(m, width=200, height=200)
window.wm_title("nulabs")
student_button = Button(window, text='Student', width=25, command=window.destroy).pack()
pi_button = Button(window, text='Principal Investigator', width=25, command=window.destroy).pack()
administrator_button = Button(window, text='Administrator', width=25, command=window.destroy).pack()
window.pack()
window.mainloop()
'''



'''
from tkinter import *

root = Tk() #Makes the window
root.wm_title("NULabs") #Makes the title that will appear in the top left
root.config(background = "#FFFFFF")


def student():
    colorLog.insert(0.0, "student\n")

def pi():
    colorLog.insert(0.0, "pi lab\n")

def admin():
    colorLog.insert(0.0, "admin stuff\n")


#Left Frame and its contents
leftFrame = Frame(root, width=200, height = 600)
leftFrame.grid(row=0, column=0, padx=10, pady=2)

Label(leftFrame, text="Instructions:").grid(row=0, column=0, padx=10, pady=2)

Instruct = Label(leftFrame, text="1\n2\n2\n3\n4\n5\n6\n7\n8\n9\n")
Instruct.grid(row=1, column=0, padx=10, pady=2)

# try:
#     imageEx = PhotoImage(file = 'image.gif')
#     Label(leftFrame, image=imageEx).grid(row=2, column=0, padx=10, pady=2)
# except:
#     print("Image not found")

#Right Frame and its contents
rightFrame = Frame(root, width=200, height = 600)
rightFrame.grid(row=0, column=1, padx=10, pady=2)

circleCanvas = Canvas(rightFrame, width=100, height=100, bg='white')
circleCanvas.grid(row=0, column=0, padx=10, pady=2)

btnFrame = Frame(rightFrame, width=200, height = 200)
btnFrame.grid(row=1, column=0, padx=10, pady=2)

colorLog = Text(rightFrame, width = 30, height = 10, takefocus=0)
colorLog.grid(row=2, column=0, padx=10, pady=2)

redBtn = Button(btnFrame, text="Student", command=student)
redBtn.grid(row=0, column=0, padx=10, pady=2)

yellowBtn = Button(btnFrame, text="Principal Investigator", command=pi)
yellowBtn.grid(row=0, column=1, padx=10, pady=2)

greenBtn = Button(btnFrame, text="Administrator", command=admin)
greenBtn.grid(row=0, column=2, padx=10, pady=2)


root.mainloop()
'''

from tkinter import *

#userName = input("Enter username: ")
#password = input("Enter password: ")

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
    root = Tk()
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

        T = Text(root, height=200, width=200)
        T.pack()

        col_header = "{:<50} \t {:<50} \t {:<30} \t {:<10} \t {:<30} \t {:<10} \t".format(lab_name, description, website, recruiting, department, building)
        line = "_" * 269
        # w = Label(root, text=col_header)
        # w.pack()
        # r = Label(root, text=line)
        # r.pack()
        T.insert(END, col_header)
        # frame1 = Frame(root, width=200, height=600)
        # frame1.grid(row=0, column=0, padx=10, pady=2)
        # Label(frame1, text=lab_name).grid(row=0, column=0, padx=10, pady=2)

        for row in rows:
            info = "{:<50} \t {:<50} \t {:<30} \t {:<10} \t {:<30} \t {:<10} \t".format(row["lab_name"][:40], row["lab_description"][:50], row["website"][8:38],
                                                                   ("YES" if row["recruiting_status"] == 1 else "NO"), row["department"], row["building_name"])
            c = Label(root, text=info, anchor="e", justify=LEFT)
            c.pack()
    get_all_labs()
    root.mainloop()

    # cur.execute(stmt_select)
    #
    # rows = cur.fetchall()
    #
    # for row in rows:
    #     #reference field by name
    #     c_name_var = row["character_name"]
    #     characters.append(c_name_var)
    #     # get specific values
    # cur.close()
    # #print(characters)
    #
    #
    # def format_table():
    #     col1= 'cname'
    #     col2= 'region_name'
    #     col3='title'
    #     col4='ename'
    #     print("{:<10} \t {:<10} \t {:<30} \t {:<10} \t".format(col1, col2, col3, col4))
    #     print("________________________________________________________________________")
    #     for c in cursor.fetchall():
    #         print("{:<10} \t {:<10} \t {:<30} \t {:<10} \t".format(c[col1], c[col2], c[col3], c[col4]))
    #
    # format_table()
except pymysql.Error as e:
    print('Error: %d: %s' % (e.args[0], e.args[1]))

finally:
    cnx.close()