const express = require('express');
const mysql = require('mysql2');

const app = express();
const port = 3000;

const connection = mysql.createConnection({
  host: 'mysqldb', // Change this to the host where your MySQL server is running
  user: 'yahya',
  password: 'yahya',
  database: 'mydb',
});

// Connect to the database
connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL');
});

// Define a route to fetch user data
app.get('/tables', (req, res) => {
  const query = 'SELECT * FROM users';

  connection.query(query, (err, results) => {
    if (err) {
      console.error('Error executing MySQL query:', err);
      res.status(500).json({ error: 'Internal Server Error' });
      return;
    }

    res.json(results);
  });
});

// Start the server
app.listen(port, () => {
  console.log(`DB is showing at http://localhost:${port}/tables`);
});
