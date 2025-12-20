# 🚀 Quick Start Guide

## ✅ What's Already Done
- ✅ Project is configured and ready
- ✅ Java is installed (OpenJDK 25.0.1)
- ✅ Database configuration file created (`src/db.properties`)
- ✅ Run scripts created
- ✅ Maven configuration ready

## 📋 What You Need to Do Next

### Step 1: Install MySQL (if not installed)

**macOS:**
```bash
# Using Homebrew (recommended)
brew install mysql

# Start MySQL service
brew services start mysql

# Set root password (if needed)
mysql_secure_installation
```

**Or download from:** https://dev.mysql.com/downloads/mysql/

### Step 2: Setup Database

```bash
# Create database and tables
mysql -u root -p < setup_database.sql
```

If prompted for password, enter your MySQL root password.

### Step 3: Configure Database Connection

Edit `src/db.properties`:
```properties
db.url=jdbc:mysql://localhost:3306/Bill_system
db.username=root
db.password=YOUR_MYSQL_ROOT_PASSWORD
```

### Step 4: Choose How to Run

#### Option A: Install Maven (Recommended)
```bash
# Install Maven
brew install maven

# Run the application
./run.sh
```

#### Option B: Use IDE (Easiest)
1. Open project in **IntelliJ IDEA** or **Eclipse**
2. Let IDE handle Maven dependencies automatically
3. Run `Splash.java` as main class

#### Option C: Manual Compile (No Maven)
1. Download MySQL Connector: https://dev.mysql.com/downloads/connector/j/
2. Place JAR in project root: `mysql-connector-j-8.x.x.jar`
3. Run: `./compile-and-run.sh`

## 🎯 Default Login Credentials

After database setup:

**Admin Account:**
- Username: `admin`
- Password: `admin123`
- Type: Admin

**Customer Account:**
- Username: `demo`
- Password: `demo123`
- Type: Customer

## 🔍 Verify Everything Works

1. **Check MySQL:**
   ```bash
   mysql -u root -p -e "SHOW DATABASES;"
   ```

2. **Check Database:**
   ```bash
   mysql -u root -p -e "USE Bill_system; SHOW TABLES;"
   ```

3. **Run Application:**
   - If Maven installed: `./run.sh`
   - If using IDE: Right-click `Splash.java` → Run
   - Manual: `./compile-and-run.sh`

## ⚠️ Common Issues

### "Command not found: mysql"
→ Install MySQL (see Step 1)

### "Command not found: mvn"
→ Install Maven: `brew install maven`
→ Or use IDE instead
→ Or use `./compile-and-run.sh` (requires MySQL connector JAR)

### "Database Connection Failed"
→ Check MySQL is running: `brew services list | grep mysql`
→ Verify password in `src/db.properties`
→ Ensure database exists: `mysql -u root -p -e "SHOW DATABASES LIKE 'Bill_system';"`

## 📞 Need Help?

Check these files:
- `README.md` - Full documentation
- `SETUP.md` - Detailed setup guide
- `NEXT_STEPS.md` - Alternative options

