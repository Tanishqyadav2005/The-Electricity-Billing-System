# ⚡ Electricity Billing System – Java GUI & JDBC Project

### 🏛 Academic Project | Java Swing | JDBC | DAO | Multithreading | Servlets

---

## 📌 Project Overview
The **Electricity Billing System** is a Java GUI-based desktop and web-enabled application designed to automate electricity billing processes. It allows secure customer record management, bill generation, usage tracking, and printable reports. The system integrates strong **Object-Oriented Programming**, **Database Connectivity**, **Collections**, **Multithreading**, and **Servlet-based processing**, ensuring performance, accuracy, and user-friendly experience.

---

## 🏆 Marks Rubric Mapping Summary

### **Java GUI-Based Projects **
| Component | Implementation Evidence | 
|-----------|---------------------------|
| **OOP Implementation** (Polymorphism, Inheritance, Interfaces, Exception Handling) | Inheritance (Person → Customer / Employee), Polymorphic billing in Residential & Commercial, Billable interface, Custom exceptions | 
| **Collections & Generics** | ArrayList, HashMap<>, Generic filters & retrieval | 
| **Multithreading & Synchronization** | Concurrent bill generation & PDF export with synchronized update | 
| **Database Operation Classes** | DAO Layer – CustomerDAO, BillDAO | 
| **Database Connectivity (JDBC)** | PreparedStatements, ResultSet, Transactions | 
| **CRUD implementation using JDBC** | Add / Update / Delete customer, bill history storage | 



---

### **Servlet & Code Quality **
| Component | Implementation Evidence | 
|-----------|--------------------------|
| **Servlet Implementation** | LoginServlet, CustomerServlet, BillServlet, ReportServlet with GET/POST handling |
| **Code Quality & Execution** | MVC + DAO architecture, modular classes, validations, clean formatting | 
| **Innovation / Extra Effort** | PDF export, analytics graph, real-time preview, multithreaded report processing | 



---

## 🚀 Key Features
- Add / Update / Delete / Search customer records
- Generate electricity bills based on units consumed
- View past billing and usage history
- Export printable PDF bill receipt
- Multi-user authentication (Admin / Staff)
- Error & exception handling for invalid inputs
- Thread-safe bill calculations and background processing
- Java Swing-based GUI with validation

---

## 🧠 Technical Highlights

### 🔹 **Object-Oriented Programming**
- **Inheritance** → `Person` (superclass), `Customer`, `Employee`
- **Polymorphism** → Bill calculation overridden in `ResidentialCustomer`, `CommercialCustomer`
- **Interfaces** → `Billable` interface defining billing operations
- **Custom Exceptions** → `InvalidMeterReadingException`

### 🔹 **Collections & Generics**
```java
ArrayList<Customer> customers;
HashMap<String, Bill> billHistory;
```
---
### 🔹 JDBC + Database Layer (DAO)

- CustomerDAO, BillDAO

- Prepared Statements & Transactions

- Rollback on failure

- Prevents SQL Injection
---
### 💻 GUI Implementation

- Java Swing user interface

- Form validation & interactive controls

- Dynamic calculation interface

- Printable preview window
---
### 📁 Project Folder Structure
```
ElectricityBillingSystem/
│── src/
│   ├── model/
│   ├── dao/
│   ├── servlet/
│   ├── gui/
│   └── util/
│── lib/
│── database.sql
│── README.md
```
---
### 🧪 Requirements

- Java JDK 8+

- MySQL / SQLite

- IDE: NetBeans / Eclipse / IntelliJ

- JDBC Driver

- Apache Tomcat (for servlet modules)
  ---
###  ▶ How to Run

- Import project into IDE

- Create DB using database.sql

- Update database credentials in db.properties

- Run Main.java to launch GUI

- Deploy servlet module to Tomcat

- Login as Admin / Staff and generate bills
  ---
###  🌱 Future Enhancements

- UPI / Online Payment Gateway Integration

- Machine-Learning consumption prediction

- Mobile App connectivity

- Advanced BI dashboards
---
### 🏁 Final Notes

- This project fulfills all evaluation requirements for billing system, showcasing strong programming, database integration, GUI design, innovation, and maintainable code structure. Ideal for academic demonstration and production scalability.
