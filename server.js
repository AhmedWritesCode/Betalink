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

// Add this endpoint to server.js (after the existing endpoints)
app.get('/api/resources', async (req, res) => {
  try {
    // Fetch all resources from the resources table
    const [rows] = await pool.query('SELECT * FROM resources');
    res.json(rows); // Send the data as a JSON response
  } catch (error) {
    console.error('Error fetching resources:', error);
    res.status(500).json({ error: 'Failed to fetch resources' });
  }
});

// Add this endpoint to server.js (after the existing endpoints)
app.post('/api/resources', async (req, res) => {
  const { name, category, description, sharedBy, date, resourceLink } = req.body;

  // Validate required fields
  if (!name || !category || !description || !sharedBy || !date || !resourceLink) {
    return res.status(400).json({ error: 'All fields are required' });
  }

  try {
    // Insert the new resource into the database
    const [result] = await pool.query(
      'INSERT INTO resources (name, category, description, sharedBy, date, resourceLink) VALUES (?, ?, ?, ?, ?, ?)',
      [name, category, description, sharedBy, date, resourceLink]
    );

    // Return the newly created resource
    res.status(201).json({
      id: result.insertId,
      name,
      category,
      description,
      sharedBy,
      date,
      resourceLink,
    });
  } catch (error) {
    console.error('Error adding resource:', error);
    res.status(500).json({ error: 'Failed to add resource' });
  }
});

// Endpoint to update a resource
app.put('/api/resources/:id', async (req, res) => {
  const { id } = req.params;
  const { name, category, description, sharedBy, date, resourceLink } = req.body;

  // Validate required fields
  if (!name || !category || !description || !sharedBy || !date || !resourceLink) {
    return res.status(400).json({ error: 'All fields are required' });
  }

  try {
    // Update the resource in the database
    const [result] = await pool.query(
      'UPDATE resources SET name = ?, category = ?, description = ?, sharedBy = ?, date = ?, resourceLink = ? WHERE id = ?',
      [name, category, description, sharedBy, date, resourceLink, id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Resource not found' });
    }

    // Return the updated resource
    res.json({ id, name, category, description, sharedBy, date, resourceLink });
  } catch (error) {
    console.error('Error updating resource:', error);
    res.status(500).json({ error: 'Failed to update resource' });
  }
});

// Endpoint to delete a resource
app.delete('/api/resources/:id', async (req, res) => {
  const { id } = req.params;

  try {
    // Delete the resource from the database
    const [result] = await pool.query('DELETE FROM resources WHERE id = ?', [id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Resource not found' });
    }

    res.status(204).send(); // Success response with no content
  } catch (error) {
    console.error('Error deleting resource:', error);
    res.status(500).json({ error: 'Failed to delete resource' });
  }
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});