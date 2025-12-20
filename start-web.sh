#!/bin/bash

# Start Web Application
echo "=========================================="
echo "Electricity Billing System - Web Server"
echo "=========================================="
echo ""

# Compile if needed
if [ ! -d "target/classes" ]; then
    echo "Compiling project..."
    mvn clean compile
fi

echo "Starting embedded Tomcat server..."
echo ""
echo "Web application will be available at:"
echo "  http://localhost:8080/login.jsp"
echo ""
echo "Default login credentials:"
echo "  Username: admin"
echo "  Password: admin123"
echo ""
echo "Press Ctrl+C to stop the server"
echo "=========================================="
echo ""

# Use Maven to run with proper classpath
mvn exec:java -Dexec.mainClass="electricity.billing.system.WebServer" -Dexec.classpathScope=runtime

