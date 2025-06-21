// server.js
import express from 'express';
import mysql from 'mysql2/promise';
import cors from 'cors';

const app = express();
app.use(cors(), express.json());

//Create a MySQL connection pool
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: 'yourPassword',
  database: 'yourDatabase',
});

// 2) A simple “get all” endpoint
app.get('/api/items', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM items');
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Database error' });
  }
});

// 3) A validation example (e.g. check username exists)
app.post('/api/validate-user', async (req, res) => {
  const { username, password } = req.body;
  try {
    const [rows] = await pool.query(
      'SELECT * FROM users WHERE username = ? AND password = ?',
      [username, password]
    );
    if (rows.length) {
      res.json({ valid: true, user: rows[0] });
    } else {
      res.json({ valid: false });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Validation failed' });
  }
});

// 4) Start the server
const PORT = 3000;
app.listen(PORT, () => console.log(`Server listening on http://localhost:${PORT}`));