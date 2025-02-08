require("dotenv").config(); // Load environment variables
const express = require("express");
const cors = require("cors");
const { Pool } = require("pg"); // Import PostgreSQL client

const app = express();
const PORT = process.env.PORT || 4000; // Use environment variable for PORT or default to 4000

// ✅ Setup PostgreSQL Connection
const pool = new Pool({
  user: process.env.DB_USER || "postgres",
  host: process.env.DB_HOST || "localhost",
  database: process.env.DB_NAME || "vehicle_db",
  password: process.env.DB_PASSWORD || "postgres",
  port: process.env.DB_PORT || 5432,
});

// ✅ Middleware
app.use(cors());
app.use(express.json());

// ✅ Root Route (Check if backend is running)
app.get("/", (req, res) => {
  res.send("Hello, your backend is running and connected to PostgreSQL!");
});

// ✅ Fetch Vehicles from PostgreSQL
app.get("/vehicles", async (req, res) => {
  try {
    const result = await pool.query("SELECT * FROM vehicles"); // Query all vehicles
    res.json(result.rows); // Send data as JSON
  } catch (error) {
    console.error("❌ Error fetching vehicles:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
});

// ✅ Start Server
app.listen(PORT, async () => {
  try {
    // Test Database Connection
    await pool.query("SELECT 1");
    console.log("✅ Connected to PostgreSQL");
  } catch (error) {
    console.error("❌ PostgreSQL Connection Error:", error);
  }
  console.log(`✅ Server is running on http://localhost:${PORT}`);
});
