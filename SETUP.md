# Setup Guide - Electricity Billing System

## Quick Setup (5 minutes)

### 1. Install Prerequisites

- **Java JDK 8+**: Download from https://adoptium.net/ or Oracle
- **MySQL**: Download from https://dev.mysql.com/downloads/
- **Maven**: Download from https://maven.apache.org/download.cgi

### 2. Setup Database

```bash
# Start MySQL service first
# Then run:
mysql -u root -p < setup_database.sql
```

This creates:
- Database: `Bill_system`
- Tables: `Signup`, `new_customer`, `meter_info`, `bill`, `tax`
- Demo data with login credentials

### 3. Configure Database Connection

Edit `src/db.properties`:
```properties
db.url=jdbc:mysql://localhost:3306/Bill_system
db.username=root
db.password=YOUR_MYSQL_PASSWORD
```

### 4. Run Application

**Linux/Mac:**
```bash
chmod +x run.sh
./run.sh
```

**Windows:**
```cmd
run.bat
```

**Or with Maven directly:**
```bash
mvn clean compile exec:java
```

## Default Login Credentials

**Admin:**
- Username: `admin`
- Password: `admin123`

**Customer:**
- Username: `demo`
- Password: `demo123`

## Troubleshooting

### "Database Connection Failed"
- Ensure MySQL is running
- Check credentials in `src/db.properties`
- Verify database exists: `mysql -u root -p -e "SHOW DATABASES;"`

### "Maven not found"
- Install Maven and add to PATH
- Or use IDE with built-in Maven support

### "ClassNotFoundException"
- Run `mvn clean compile` first
- Ensure `rs2xml.jar` is in project root

## Project Structure

```
├── src/
│   ├── electricity/billing/system/  # Main application code
│   ├── icon/                        # GUI icons and images
│   └── db.properties                # Database configuration
├── setup_database.sql               # Database setup script
├── rs2xml.jar                       # Required library
├── pom.xml                          # Maven configuration
├── run.sh / run.bat                 # Run scripts
└── README.md                        # Full documentation
```

## Building JAR File

```bash
mvn clean package
java -jar target/electricity-billing-system-1.0.0.jar
```

