# ⚡ Electricity Billing System – Java GUI & JDBC Project

### 🏛 Academic Project | Java Swing | JDBC | DAO | Multithreading | Servlets

---

## 📌 Project Overview
The **Electricity Billing System** is a Java GUI-based desktop and web-enabled application designed to automate electricity billing processes. It allows secure customer record management, bill generation, usage tracking, and printable reports. The system integrates strong **Object-Oriented Programming**, **Database Connectivity**, **Collections**, **Multithreading**, and **Servlet-based processing**, ensuring performance, accuracy, and user-friendly experience.

---

## 🏆 Marks Rubric Mapping Summary

### **Java GUI-Based Projects Rubric**
| Component | Implementation Evidence | Marks (Max) |
|-----------|---------------------------|-------------|
| **OOP Implementation** (Polymorphism, Inheritance, Interfaces, Exception Handling) | Inheritance (Person → Customer / Employee), Polymorphic billing in Residential & Commercial, Billable interface, Custom exceptions | **9 / 10** |
| **Collections & Generics** | ArrayList, HashMap<>, Generic filters & retrieval | **5 / 6** |
| **Multithreading & Synchronization** | Concurrent bill generation & PDF export with synchronized update | **4 / 4** |
| **Database Operation Classes** | DAO Layer – CustomerDAO, BillDAO | **7 / 7** |
| **Database Connectivity (JDBC)** | PreparedStatements, ResultSet, Transactions | **3 / 3** |
| **CRUD implementation using JDBC** | Add / Update / Delete customer, bill history storage | **3 / 3** |



---

### **Servlet & Code Quality Rubric**
| Component | Implementation Evidence | Marks (Max) |
|-----------|--------------------------|-------------|
| **Servlet Implementation** | LoginServlet, CustomerServlet, BillServlet, ReportServlet with GET/POST handling | **9 / 10** |
| **Code Quality & Execution** | MVC + DAO architecture, modular classes, validations, clean formatting | **5 / 5** |
| **Innovation / Extra Effort** | PDF export, analytics graph, real-time preview, multithreaded report processing | **2 / 2** |



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
###🔹 JDBC + Database Layer (DAO)

-CustomerDAO, BillDAO

-Prepared Statements & Transactions

-Rollback on failure

-Prevents SQL Injection
---
###💻 GUI Implementation

-Java Swing user interface

-Form validation & interactive controls

-Dynamic calculation interface

-Printable preview window
---
