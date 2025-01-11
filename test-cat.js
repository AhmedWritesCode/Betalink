// Import the connection pool from test-db.js
import pool from './db.js';

// Define an async function to fetch and display data from the categories table
async function displayCategories() {
  try {
    // Execute a query to select all rows from the categories table
    const [rows] = await pool.query('SELECT * FROM categories');

    // Log the results to the console
    console.log('Categories Table Data:');
    console.table(rows); // Use console.table for a nicely formatted table output
  } catch (error) {
    // Handle any errors that occur during the query
    console.error('Error fetching data from categories table:', error);
  } finally {
    // Close the connection pool (optional, but recommended for clean shutdown)
    await pool.end();
  }
}

// Call the function to execute the test
displayCategories();