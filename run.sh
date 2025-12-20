#!/bin/bash

# Electricity Billing System - Run Script
# This script compiles and runs the application

echo "=========================================="
echo "Electricity Billing System"
echo "=========================================="
echo ""

# Check if Maven is installed
if ! command -v mvn &> /dev/null; then
    echo "Error: Maven is not installed or not in PATH"
    echo "Please install Maven: https://maven.apache.org/install.html"
    echo ""
    echo "Alternatively, you can run manually:"
    echo "1. Compile: javac -cp 'rs2xml.jar:mysql-connector-j-8.x.x.jar' src/electricity/billing/system/*.java"
    echo "2. Run: java -cp '.:rs2xml.jar:mysql-connector-j-8.x.x.jar' electricity.billing.system.Splash"
    exit 1
fi

# Check if MySQL is running (optional check)
echo "Checking database configuration..."
if [ -f "src/db.properties" ]; then
    echo "✓ Found db.properties"
else
    echo "⚠ Warning: db.properties not found. Using default database settings."
fi

echo ""
echo "Building project with Maven..."
mvn clean compile

if [ $? -ne 0 ]; then
    echo ""
    echo "Build failed! Please check the errors above."
    exit 1
fi

echo ""
echo "Starting application..."
echo ""
mvn exec:java

