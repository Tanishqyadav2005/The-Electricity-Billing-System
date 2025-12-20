# Next Steps - Getting the Application Running

## Current Status ✅
- ✅ Java is installed (OpenJDK 25.0.1)
- ✅ Project structure is ready
- ✅ Database configuration file created
- ✅ Maven configuration created (but Maven not installed)

## Option 1: Install Maven (Recommended)

### macOS (using Homebrew):
```bash
brew install maven
```

### Or download manually:
1. Download from: https://maven.apache.org/download.cgi
2. Extract and add to PATH
3. Verify: `mvn -version`

Then run:
```bash
./run.sh
```

## Option 2: Use Simple Compile Script (No Maven)

### Step 1: Download MySQL Connector
Download MySQL Connector/J from:
https://dev.mysql.com/downloads/connector/j/

Place the JAR file in the project root as: `mysql-connector-j-8.x.x.jar`

### Step 2: Setup Database
```bash
mysql -u root -p < setup_database.sql
```

### Step 3: Configure Database
Edit `src/db.properties`:
```properties
db.url=jdbc:mysql://localhost:3306/Bill_system
db.username=root
db.password=YOUR_PASSWORD
```

### Step 4: Compile and Run
```bash
./compile-and-run.sh
```

## Option 3: Use IDE (Easiest)

### IntelliJ IDEA:
1. Open project in IntelliJ IDEA
2. Right-click `pom.xml` → "Add as Maven Project"
3. IntelliJ will download dependencies automatically
4. Right-click `Splash.java` → "Run 'Splash.main()'"

### Eclipse:
1. File → Import → Existing Maven Projects
2. Select project directory
3. Run → Run As → Java Application → Select `Splash`

### NetBeans:
1. File → Open Project
2. Select project directory
3. Right-click project → Run

## Quick Database Setup

If MySQL is installed:
```bash
mysql -u root -p
```

Then paste:
```sql
CREATE DATABASE IF NOT EXISTS Bill_system;
USE Bill_system;
source setup_database.sql;
```

## Default Login Credentials

After database setup, you can login with:

**Admin:**
- Username: `admin`
- Password: `admin123`

**Customer:**
- Username: `demo`
- Password: `demo123`

## Troubleshooting

### "Database Connection Failed"
- Ensure MySQL is running: `mysqladmin -u root -p status`
- Check `src/db.properties` has correct password
- Verify database exists: `mysql -u root -p -e "SHOW DATABASES;"`

### "ClassNotFoundException"
- Ensure all JAR files are in classpath
- Use Maven or IDE to handle dependencies automatically

### "Maven not found"
- Install Maven (see Option 1 above)
- Or use compile-and-run.sh script (Option 2)
- Or use IDE (Option 3)

## What to Do Right Now

1. **Check if MySQL is installed:**
   ```bash
   mysql --version
   ```

2. **If MySQL is installed, setup database:**
   ```bash
   mysql -u root -p < setup_database.sql
   ```

3. **Choose one option:**
   - **Easiest**: Open in IntelliJ IDEA/Eclipse and run
   - **Quick**: Install Maven (`brew install maven`) then `./run.sh`
   - **Manual**: Download MySQL connector, then `./compile-and-run.sh`

