import db from './db.js';

(async () => {
  try {
    const [rows] = await db.query('SELECT 1 + 1 AS result');
    console.log('Database connected! Test result:', rows[0].result); // Should log: 2
  } catch (err) {
    console.error('Error connecting to the database:', err.message);
  }
})();
