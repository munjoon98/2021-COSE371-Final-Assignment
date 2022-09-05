import psycopg2
from flask import Flask, render_template, request

app = Flask(__name__)
connect = psycopg2.connect("dbname=flask user=postgres password=bablado6029*")
cur = connect.cursor()


@app.route('/')
def main():
    return render_template("main.html")


@app.route('/print_course', methods=['GET'])
def print_course():
    cur.execute("SELECT * FROM course order by course_id;")
    result = cur.fetchall()
    return render_template("print_course.html", cous=result)


@app.route('/create_student', methods=['POST'])
def create_student():
    try:
        id = request.form["id"]
        name = request.form["name"]
        dept_name = request.form["dept_name"]
        tot_cred = request.form["tot_cred"]

        cur.execute("INSERT INTO student VALUES('{}','{}','{}','{}');".format(id, name, dept_name, tot_cred))
        connect.commit()
        return render_template("main.html")
    except:
        return "create failed"


@app.route('/delete_student', methods=['POST'])
def delete_student():
    try:
        id = request.form["id"]
        cur.execute("DELETE FROM student where ID=('{}');".format(id))
        connect.commit()
        return render_template("main.html")
    except:
        return "delete failed"


@app.route('/update_salary', methods=['GET'])
def update_salary():
    cur.execute("update instructor set salary=salary*1.03;")
    connect.commit()
    return "Update successful"


@app.route('/sum_budget', methods=['GET'])
def sum_budget():
    cur.execute("SELECT SUM(budget) FROM department;")
    result = cur.fetchall()
    return render_template("budget.html", tot=result)


@app.route('/match_take_teach', methods=['GET'])
def match_take_teach():
    cur.execute("select takes.ID,teaches.ID,takes.course_id,takes.sec_id "
                "from takes, teaches "
                "where takes.course_id=teaches.course_id and takes.sec_id=teaches.sec_id;")
    result = cur.fetchall()
    return render_template("match_take_teach.html", qu=result)


@app.route('/match_dept_student', methods=['GET'])
def match_dept_student():
    cur.execute("select ID,name,dept_name,building "
                "from student natural join department;")
    result = cur.fetchall()
    return render_template("match_dept_student.html", pa=result)


@app.route('/highest_salary', methods=['GET'])
def highest_salary():
    cur.execute("select ID,name,salary from instructor where salary "
                ">=all(select salary from instructor);")
    result = cur.fetchall()
    return render_template("highest_salary.html", yu=result)


if __name__ == '__main__':
    app.run()
