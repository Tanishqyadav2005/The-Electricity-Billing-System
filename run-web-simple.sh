#!/bin/bash

# Simple Web Server Runner
echo "=========================================="
echo "Starting Electricity Billing System Web Server"
echo "=========================================="
echo ""

# Compile if needed
if [ ! -d "target/classes" ]; then
    echo "Compiling..."
    mvn clean compile
fi

# Get classpath
CLASSPATH="target/classes"
for jar in $(find ~/.m2/repository -name "*.jar" 2>/dev/null | grep -E "(mysql|tomcat|servlet)" | head -10); do
    CLASSPATH="$CLASSPATH:$jar"
done

echo "Starting server on http://localhost:8080"
echo "Press Ctrl+C to stop"
echo ""

java -cp "$CLASSPATH" electricity.billing.system.WebServer

