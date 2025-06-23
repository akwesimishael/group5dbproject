const express = require('express');
const mysql = require('mysql2/promise');
const bodyParser = require('body-parser');
const app = express();
const PORT = 3000;

app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static('public')); 

// mySQL login details, change this to your local mySQL login details
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'Bleechmaster3000',
  database: 'UniversityDB',
});

// this will query the database to make sure the student exists in the db
app.post('/login', async (req, res) => {
  const { indexNumber, role } = req.body;
  
  const studentId = parseInt(indexNumber);

  try {
    let query;

    query = 'SELECT * FROM Students WHERE StudentID = ?';

    const [ rows ] = await pool.execute(query, [studentId]);

    if (rows.length === 1) {
      res.redirect(`/html/results.html?studentID=${studentId}`);
    } else {
      res.status(401).send('Invalid credentials');
    }

  } catch (err) {
    console.error(err);
    res.status(500).send('Server error');
  }
});

// this will fetch the student data and display it in the UI
app.get('/student/:studentID', async (req, res) => {
    const studentID = req.params.studentID;

    try {
        // Get student info with department name
        const [studentRows] = await pool.execute(
            `SELECT Students.StudentID, Students.StudentName, Departments.DepartmentName
             FROM Students
             JOIN Departments ON Students.DepartmentID = Departments.DepartmentID
             WHERE Students.StudentID = ?`, [studentID]
        );

        // Get student's courses and grades
        const [gradeRows] = await pool.execute(
            `SELECT Courses.CourseID, Courses.CourseName, Registrations.Grade
             FROM Registrations
             JOIN Courses ON Registrations.CourseID = Courses.CourseID
             WHERE Registrations.StudentID = ?`, [studentID]
        );

        if (studentRows.length === 1) {
            res.json({
                student: studentRows[0],   // student info
                results: gradeRows         // course ID, name, grade
            });
        } else {
            res.status(404).json({ error: 'Student not found' });
        }

    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Server error' });
    }
});

app.listen(PORT, () => {
  console.log(`Server listening on http://localhost:${PORT}`);
});