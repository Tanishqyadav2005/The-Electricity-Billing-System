<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer List - Electricity Billing System</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f0f0f0; }
        .container { max-width: 800px; margin: 50px auto; padding: 20px; background: white; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #f2f2f2; }
        .logout { text-align: right; margin-bottom: 20px; }
        .logout a { color: #4CAF50; text-decoration: none; }
    </style>
</head>
<body>
    <div class="container">
        <div class="logout">
            <a href="login.jsp">Logout</a>
        </div>
        <h2>Customer List</h2>
        <table>
            <tr>
                <th>Username</th>
                <th>Meter No</th>
                <th>Name</th>
                <th>Address</th>
            </tr>
            <%
                List<Map<String, String>> customers = (List<Map<String, String>>) request.getAttribute("customers");
                if (customers != null) {
                    for (Map<String, String> customer : customers) {
            %>
            <tr>
                <td><%= customer.get("username") %></td>
                <td><%= customer.get("meter_no") %></td>
                <td><%= customer.get("name") %></td>
                <td><%= customer.get("address") %></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </div>
</body>
</html>
