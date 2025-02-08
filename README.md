# 🚗 Vehicle List App  

A **Flutter** application with a **Node.js (Express) & PostgreSQL** backend to display a list of vehicles.

---

## 🛠 Technologies Used  

### **Frontend (Client-side)**
- Flutter (Dart)  
- HTTP package (to fetch API data)  

### **Backend (Server-side)**
- Node.js + Express.js  
- PostgreSQL  
- pg package (PostgreSQL client for Node.js)  

---

## 📌 How to Run the Project  

### **1️⃣ Setup Backend (Node.js + PostgreSQL)**  

#### Step 1: Clone the Repository  
```bash
git clone https://github.com/ALisha195/vehicle-list-app.git
cd vehicle-list-app

Step 2: Install Dependencies
npm install

Step 3: Setup PostgreSQL Database
brew services start postgresql  # Start PostgreSQL (Mac)
psql -U postgres
CREATE DATABASE vehicle_db;
\c vehicle_db;

CREATE TABLE vehicles (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    mileage INTEGER NOT NULL,
    year INTEGER NOT NULL
);

INSERT INTO vehicles (name, mileage, year) VALUES
('Honda City', 17, 2019),
('Toyota Corolla', 16, 2015),
('Ford Mustang', 10, 2018),
('Maruti Swift', 20, 2021),
('Hyundai Verna', 14, 2014);

Step 4: Configure .env File
DATABASE_URL=postgresql://postgres:your_password@localhost:5432/vehicle_db
PORT=4000

Step 5: Start the Node.js Server
node server.js

✅ If successful, it will print:
✅ Connected to PostgreSQL  
✅ Server is running on http://localhost:4000  

Step 6: Test API in Browser/Postman
http://localhost:4000/vehicles

2️⃣ Setup Frontend (Flutter App)
Step 1: Install Flutter Dependencies
flutter pub get

Step 2: Update API Endpoint in api_service.dart
const String apiUrl = "http://localhost:4000/vehicles";

Step 3: Run the Flutter App

For macOS Desktop:
flutter run -d macos

For iOS Simulator:
flutter run -d ios

🎯 Expected Output
Your Flutter app should display a list of vehicles retrieved from the PostgreSQL database via the Node.js API.

📸 Screenshots
You can add screenshots by uploading them to GitHub inside the screenshots folder and referencing them in 
README.md like this:

🛠 Troubleshooting
Ensure backend is running:
node server.js

Check PostgreSQL status:
brew services list

Ensure CORS is enabled in server.js:
const cors = require('cors');
app.use(cors());

Check the Flutter console for errors and verify API URL.

✅ Conclusion
This Flutter frontend fetches vehicle data from the Node.js (Express) backend, which retrieves it from a 
PostgreSQL database. 🎯🚀
