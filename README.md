⚡ Electricity Billing System – Java Desktop Application

A Java-based desktop application designed to manage electricity billing operations including customer information, bill generation, and payment tracking. It features a user-friendly GUI, JDBC database connectivity, and efficient data handling.

📚 Overview

The Electricity Billing System provides an intuitive interface for managing:

Customer records

Electricity bill generation

Payments and dues

User authentication

GUI-based data visualization

The system is built using Java Swing, OOP concepts, JDBC, and multithreading to ensure a responsive and efficient user experience.

🚀 Key Features
👥 Customer Management

Add, update, and view customer details

Organized storage in a relational database

💡 Billing System

Automatically calculate bills based on units

View previous billing records

Manage meter-based billing information

💳 Payment Tracking

Record payments

Maintain monthly deposit records

Track dues and pending bills

🖥️ User-Friendly GUI

Built using Java Swing components

Smooth interface for all operations

Clean and intuitive navigation

💽 JDBC Connectivity

The application uses JDBC (Java Database Connectivity) to communicate with a relational database.
It stores:

Customer details

Billing data

Payment records

External libraries used:

mysql-connector.jar → JDBC driver

rs2xml.jar → Converts JDBC ResultSet to JTable

🧵 Multithreading

To improve performance and user experience, the system uses multithreading for tasks like:

Displaying the splash screen

Loading data in the background

Avoiding UI freezing during operations

This ensures that the application remains smooth and responsive.
```
📂 Project Structure
Electricity-Billing-System-Java-Project/
├── src/
│   └── electricity/billing/system/
│       ├── Login.java
│       ├── Signup.java
│       ├── Splash.java
│       ├── calculate_bill.java
│       ├── customer_details.java
│       └── ... (other Java classes)
├── out/                    # Compiled .class files
├── icon/                   # GUI images & icons
├── rs2xml.jar              # JTable ResultSet conversion library
├── mysql-connector.jar     # JDBC driver (add manually)
├── README.md
└── .gitignore
```
🛠️ Requirements

JDK 8 or higher

MySQL (or any JDBC-supported DB)

Java IDE (IntelliJ IDEA, Eclipse, NetBeans, VS Code)

External libraries:

mysql-connector.jar

rs2xml.jar

▶️ How to Run

Clone the repository

git clone https://github.com/Tanishqyadav2005/The-Electricity-Billing-System


Open project in your Java IDE

Add required external libraries

mysql-connector.jar

rs2xml.jar

Configure your database settings inside the database connection class.

Run the application
Start from:

Splash.java or

Login.java

🤝 Contributions

Contributions, issues, and feature requests are welcome!
Feel free to open a pull request.

📜 License

This project is open-source and free to use for learning and development.
