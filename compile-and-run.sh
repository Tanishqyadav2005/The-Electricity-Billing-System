#!/bin/bash

# Simple compile and run script (without Maven)
# This script compiles and runs the application using javac/java directly

echo "=========================================="
echo "Electricity Billing System - Compile & Run"
echo "=========================================="
echo ""

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check Java
if ! command -v javac &> /dev/null; then
    echo -e "${RED}Error: Java compiler (javac) not found${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Java found${NC}"
java -version
echo ""

# Check for MySQL connector
MYSQL_JAR=""
if [ -f "mysql-connector-j-8.*.jar" ]; then
    MYSQL_JAR=$(ls mysql-connector-j-8.*.jar | head -1)
elif [ -f "lib/mysql-connector-java-*.jar" ]; then
    MYSQL_JAR=$(ls lib/mysql-connector-java-*.jar | head -1)
else
    echo -e "${YELLOW}⚠ MySQL Connector JAR not found${NC}"
    echo "Please download MySQL Connector/J from:"
    echo "https://dev.mysql.com/downloads/connector/j/"
    echo ""
    echo "Place it in the project root directory as: mysql-connector-j-8.x.x.jar"
    echo ""
    read -p "Do you want to continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Check for rs2xml.jar
if [ ! -f "rs2xml.jar" ]; then
    echo -e "${RED}Error: rs2xml.jar not found in project root${NC}"
    exit 1
fi

echo -e "${GREEN}✓ rs2xml.jar found${NC}"

# Build classpath
CLASSPATH="rs2xml.jar"
if [ ! -z "$MYSQL_JAR" ]; then
    CLASSPATH="$CLASSPATH:$MYSQL_JAR"
    echo -e "${GREEN}✓ MySQL Connector found: $MYSQL_JAR${NC}"
fi

echo ""
echo "Creating output directory..."
mkdir -p out

echo ""
echo "Compiling Java files..."
echo ""

# Find all Java files
JAVA_FILES=$(find src -name "*.java")

if [ -z "$JAVA_FILES" ]; then
    echo -e "${RED}Error: No Java files found in src directory${NC}"
    exit 1
fi

# Compile
javac -encoding UTF-8 -d out -cp "$CLASSPATH" $JAVA_FILES 2>&1 | head -20

if [ ${PIPESTATUS[0]} -ne 0 ]; then
    echo ""
    echo -e "${RED}Compilation failed!${NC}"
    echo "Please check the errors above."
    exit 1
fi

echo ""
echo -e "${GREEN}✓ Compilation successful!${NC}"
echo ""

# Copy resources
echo "Copying resources..."
cp -r src/icon out/ 2>/dev/null || true
cp src/db.properties out/ 2>/dev/null || true
cp src/db.properties out/electricity/billing/system/ 2>/dev/null || true

echo ""
echo "Starting application..."
echo ""

# Run
java -cp "out:$CLASSPATH" electricity.billing.system.Splash

