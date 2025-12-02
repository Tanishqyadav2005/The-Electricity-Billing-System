<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bill View - Electricity Billing System</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f0f0f0; }
        .container { max-width: 600px; margin: 50px auto; padding: 20px; background: white; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        .bill-info { margin: 20px 0; }
        .bill-info div { margin: 10px 0; }
        .logout { text-align: right; margin-bottom: 20px; }
        .logout a { color: #4CAF50; text-decoration: none; }
        .upload-link { text-align: center; margin-top: 20px; }
        .upload-link a { color: #4CAF50; text-decoration: none; }
    </style>
</head>
<body>
    <div class="container">
        <div class="logout">
            <a href="login.jsp">Logout</a>
        </div>
        <h2>Latest Bill Information</h2>
        <div class="bill-info">
            <div><strong>Meter No:</strong> <%= session.getAttribute("meterNo") %></div>
            <div><strong>Month:</strong> <%= request.getAttribute("month") %></div>
            <div><strong>Units Consumed:</strong> <%= request.getAttribute("units") %></div>
            <div><strong>Total Amount:</strong> $<%= request.getAttribute("amount") %></div>
        </div>
        <div class="upload-link">
            <a href="uploadImage.jsp">Upload Profile Image</a>
        </div>
    </div>
</body>
</html>
