const express = require('express');
const mysql = require('mysql2/promise');
const bodyParser = require('body-parser');
const app = express();
const PORT = 3000;

app.use(bodyParser.urlencoded({ extended: false }));
app.use(express.static('public')); 

// configure your pool
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'Bleechmaster3000',
  database: 'UniversityDB',
});

app.post('/login', async (req, res) => {
  const { indexNumber, role } = req.body;
  
  const studentId = parseInt(indexNumber);

  try {
    let query;

    query = 'SELECT * FROM Students WHERE StudentID = ?';

    const [ rows ] = await pool.execute(query, [studentId]);

    if (rows.length === 1) {
      //res.status(401).send('Successful login');
      res.redirect('../html/results.html');
    } else {
      res.status(401).send('Invalid credentials');  // or render a message
    }

  } catch (err) {
    console.error(err);
    res.status(500).send('Server error');
  }
});

app.listen(PORT, () => {
  console.log(`Server listening on http://localhost:${PORT}`);
});