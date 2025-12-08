# Electricity Billing System Java Project

## Overview
This is a Java-based Electricity Billing System with both Swing GUI and Servlet web modules.

## Features
- User authentication (Admin and Customer)
- Bill calculation and management
- Customer management
- Image upload functionality
- Bill export to TXT

## New Features Added
- ✅ Login module implemented using Servlet + JSP
- ✅ MVC folder structure added
- ✅ Input validation & exception handling added
- ✅ Bill export feature implemented

## Project Structure
- `src/electricity/billing/system/` - Main source code
  - `model/` - Model classes (e.g., calculate_bill.java)
  - `view/` - View classes
  - `controller/` - Controller classes
  - `database/` - Database utility classes (e.g., database.java)
- `servlet-module/` - Web servlet module
  - JSP pages and servlets for web interface
- `out/` - Compiled classes

## Setup
1. Ensure Java and Tomcat are installed.
2. Set up MySQL database with the required tables.
3. Compile and deploy the servlet module on Tomcat.

## Usage
- Run the Swing application for desktop interface.
- Access the web interface via Tomcat for login and bill viewing.
