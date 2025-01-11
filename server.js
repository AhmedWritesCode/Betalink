import express from 'express';
import pool from './db.js';
import cors from 'cors';

const app = express();
const port = 3000;

// Middleware to parse JSON bodies
app.use(express.json());

// Enable CORS
app.use(cors());

// Endpoint to fetch categories
app.get('/api/categories', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM categories');
    res.json(rows);
  } catch (error) {
    console.error('Error fetching categories:', error);
    res.status(500).json({ error: 'Failed to fetch categories' });
  }
});

// Endpoint to add a category
app.post('/api/categories', async (req, res) => {
  const { name } = req.body; // Get the category name from the request body
  if (!name) {
    return res.status(400).json({ error: 'Category name is required' });
  }

  try {
    // Insert the new category into the database
    const [result] = await pool.query('INSERT INTO categories (name) VALUES (?)', [name]);
    res.status(201).json({ id: result.insertId, name }); // Return the newly created category
  } catch (error) {
    console.error('Error adding category:', error);
    res.status(500).json({ error: 'Failed to add category' });
  }
});

// Endpoint to delete a category
app.delete('/api/categories/:id', async (req, res) => {
  const { id } = req.params; // Get the category ID from the URL parameters
  if (!id) {
    return res.status(400).json({ error: 'Category ID is required' });
  }

  try {
    // Delete the category from the database
    await pool.query('DELETE FROM categories WHERE id = ?', [id]);
    res.status(204).send(); // Return a success response with no content
  } catch (error) {
    console.error('Error deleting category:', error);
    res.status(500).json({ error: 'Failed to delete category' });
  }
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});