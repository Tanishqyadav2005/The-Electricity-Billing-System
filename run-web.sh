#!/bin/bash

# Run Web Application Script
echo "=========================================="
echo "Electricity Billing System - Web Server"
echo "=========================================="
echo ""

# Check if compiled
if [ ! -d "target/classes" ]; then
    echo "Compiling project..."
    mvn clean compile
fi

echo "Starting web server..."
echo ""
echo "Web application will be available at:"
echo "http://localhost:8080"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

java -cp "target/classes:$(mvn dependency:build-classpath -q -DincludeScope=runtime | tail -1)" electricity.billing.system.WebServer

