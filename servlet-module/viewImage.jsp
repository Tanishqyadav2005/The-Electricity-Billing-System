<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Profile Image - Electricity Billing System</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f0f0f0; text-align: center; }
        .container { max-width: 400px; margin: 50px auto; padding: 20px; background: white; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        img { max-width: 200px; max-height: 200px; border-radius: 8px; margin: 20px 0; }
        .back-link { margin-top: 20px; }
        .back-link a { color: #4CAF50; text-decoration: none; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Profile Image</h2>
        <img src="${imgPath}" alt="Profile Image">
        <div class="back-link">
            <a href="billView.jsp">Back to Bill View</a>
        </div>
    </div>
</body>
</html>
