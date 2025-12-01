📘 Electricity Billing System – Java Project

A Java-based desktop application designed to manage electricity billing, customer details, and payment records. The system provides a user-friendly interface built using Java Swing and includes essential concepts like JDBC database connectivity and multithreading to ensure smooth performance.

🚀 Features
Customer Management

Add and update customer details

View complete customer profiles

Billing Management

Generate electricity bills

Calculate charges based on units consumed

View previously generated bills

Payment Tracking

Record customer payments

Track pending and completed transactions

User-Friendly GUI

Built using Java Swing

Easy navigation and simple design

Data Management

Uses JDBC connectivity for database operations

Stores customer, billing, and payment records in a relational database
```
Electricity-Billing-System-Java-Project/
├── src/
│   └── electricity/billing/system/
│       ├── Login.java
│       ├── Signup.java
│       ├── Splash.java
│       ├── calculate_bill.java
│       ├── customer_details.java
│       └── ... (other Java classes)
├── out/               # Compiled .class files
├── icon/              # GUI images & icons
├── rs2xml.jar         # JTable ResultSet conversion library
├── mysql-connector.jar# JDBC driver (add manually)
├── README.md
└── .gitignore

```
💽 JDBC Connectivity

The project uses JDBC (Java Database Connectivity) to interact with a MySQL database.

Included in the project:

A dedicated JDBC connection setup

Database tables for customers, bills, and payments

Integration of an external JDBC driver

Use of rs2xml.jar for displaying database results in JTable

Purpose of JDBC in this project:

Connect the application to a database

Insert, update, and fetch customer and billing data

Handle secure and structured data storage

🧵 Multithreading

The project incorporates multithreading to enhance performance and improve user experience.

Multithreading is used for:

Displaying the splash screen smoothly

Loading data in the background without freezing the GUI

Running tasks like bill calculations simultaneously

Keeping the main UI responsive

🛠 Requirements

JDK 8 or higher

MySQL or any JDBC-compatible database

Java IDE (IntelliJ IDEA, Eclipse, NetBeans, etc.)

External libraries:

rs2xml.jar

mysql-connector.jar

▶️ How to Run

Clone the repository

Open the project in your Java IDE

Add the required external libraries

Configure your database connection

Run the application starting from the splash or login screen

🤝 Contribution

Contributions are welcome! Feel free to open issues or submit pull requests.

📜 License

This project is open-source and free to use.
