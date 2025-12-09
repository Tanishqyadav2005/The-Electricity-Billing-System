<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
<center>
    <h2>Electricity Billing System - Login</h2>

    <form action="LoginServlet" method="post">
        <input type="text" name="username" placeholder="Enter Username" required><br><br>
        <input type="password" name="password" placeholder="Enter Password" required><br><br>
        <button type="submit">Login</button>
    </form>

    <%
        String error = request.getParameter("error");
        if ("1".equals(error)) {
    %>
        <p style="color:red;">Invalid Login Credentials!</p>
    <%
        }
    %>
</center>
</body>
</html>
