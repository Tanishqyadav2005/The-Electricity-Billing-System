<!DOCTYPE html>
<html>
<head>
    <title>Welcome - Electricity Billing System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        h2 {
            color: #333;
            margin-bottom: 10px;
        }
        .user-info {
            background: #f5f5f5;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .menu-item {
            background: #667eea;
            color: white;
            padding: 20px;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            transition: transform 0.3s, background 0.3s;
        }
        .menu-item:hover {
            transform: translateY(-5px);
            background: #5568d3;
        }
        .btn-logout {
            display: inline-block;
            padding: 10px 20px;
            background: #e74c3c;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }
        .btn-logout:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome to Electricity Billing System</h2>
        <h3 style="color: #667eea;">Login Successful! ✅</h3>
        
        <div class="user-info">
            <%
                String username = (String) session.getAttribute("username");
                String userType = (String) session.getAttribute("usertype");
                String meterNo = (String) session.getAttribute("meter_no");
                
                if (username != null) {
                    out.println("<p><strong>Username:</strong> " + username + "</p>");
                }
                if (userType != null) {
                    out.println("<p><strong>User Type:</strong> " + userType + "</p>");
                }
                if (meterNo != null) {
                    out.println("<p><strong>Meter Number:</strong> " + meterNo + "</p>");
                }
            %>
        </div>
        
        <div class="menu">
            <a href="bill.jsp" class="menu-item">
                <h3>💰 Generate Bill</h3>
                <p>Calculate and generate electricity bills</p>
            </a>
            <a href="success.jsp" class="menu-item">
                <h3>👥 Manage Customers</h3>
                <p>Add or delete customers</p>
            </a>
            <a href="login.jsp" class="menu-item">
                <h3>🔐 Account</h3>
                <p>Manage your account settings</p>
            </a>
        </div>
        
        <a href="login.jsp" class="btn-logout">Logout</a>
    </div>
</body>
</html>

