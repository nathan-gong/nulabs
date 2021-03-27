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

import pymysql
from functions import *

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
    
    print(student_get_all_labs(cur, 10))

except pymysql.Error as e:
    print('Error: %d: %s' % (e.args[0], e.args[1]))

finally:
    cnx.close()





