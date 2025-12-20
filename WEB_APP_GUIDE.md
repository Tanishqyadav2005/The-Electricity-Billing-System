# Web Application Guide

## ✅ Web Application is Now Configured!

The web application has been set up and is ready to run.

## 🚀 How to Run the Web Application

### Option 1: Using the Start Script (Recommended)
```bash
./start-web.sh
```

### Option 2: Using Maven
```bash
mvn exec:java -Dexec.mainClass="electricity.billing.system.WebServer" -Dexec.classpathScope=runtime
```

### Option 3: Manual Java Command
```bash
# First compile
mvn clean compile

# Then run (you'll need to build the full classpath)
java -cp "target/classes:$(mvn dependency:build-classpath -q -DincludeScope=runtime)" electricity.billing.system.WebServer
```

## 🌐 Access the Web Application

Once the server starts, open your browser and go to:

**http://localhost:8080/login.jsp**

## 🔐 Login Credentials

The web application uses database authentication. Use these credentials:

**Admin Account:**
- Username: `admin`
- Password: `admin123`

**Customer Account:**
- Username: `demo`
- Password: `demo123`

## 📁 Web Application Structure

```
webapp/
├── WEB-INF/
│   └── web.xml          # Servlet configuration
├── login.jsp            # Login page
├── welcome.jsp          # Welcome page after login
├── bill.jsp             # Bill page
└── success.jsp          # Success page
```

## 🔧 What Was Fixed

1. ✅ **Updated pom.xml** - Changed packaging to `war` and added web dependencies:
   - Servlet API
   - JSP API
   - JSTL
   - Embedded Tomcat

2. ✅ **Fixed web.xml** - Removed duplicates and fixed servlet configuration

3. ✅ **Updated LoginServlet** - Now uses database authentication instead of hardcoded credentials

4. ✅ **Fixed WebServer.java** - Properly configured embedded Tomcat to serve webapp directory

5. ✅ **Created run scripts** - Easy-to-use scripts to start the web server

## 🐛 Troubleshooting

### Server won't start
- Make sure port 8080 is not already in use
- Check that MySQL is running
- Verify compilation: `mvn clean compile`

### 404 errors
- Ensure `webapp/` directory exists
- Check that `webapp/WEB-INF/web.xml` is present
- Verify servlet classes are compiled in `target/classes/servlet/`

### Database connection errors
- Ensure MySQL is running: `brew services list | grep mysql`
- Check `src/db.properties` has correct credentials
- Verify database exists: `mysql -u root -e "SHOW DATABASES LIKE 'Bill_system';"`

### Login not working
- Check database has users: `mysql -u root -e "USE Bill_system; SELECT * FROM Signup;"`
- Verify LoginServlet is compiled correctly
- Check browser console for errors

## 📝 Notes

- The web application runs on embedded Tomcat (no separate Tomcat installation needed)
- Default port is 8080 (can be changed via PORT environment variable)
- The application uses the same database as the Swing GUI application
- Both web and desktop applications can run simultaneously

## 🎯 Next Steps

1. Start the web server using one of the methods above
2. Open http://localhost:8080/login.jsp in your browser
3. Login with admin credentials
4. Explore the web interface!

