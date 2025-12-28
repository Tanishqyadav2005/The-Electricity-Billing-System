<!DOCTYPE html>
<html>
<head>
    <title>Success - Electricity Billing System</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            max-width: 500px;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            text-align: center;
        }
        .success-icon {
            font-size: 72px;
            color: #4caf50;
            margin-bottom: 20px;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .success-message {
            background: #e8f5e9;
            color: #2e7d32;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
            border-left: 4px solid #4caf50;
        }
        .error-message {
            background: #fee;
            color: #c33;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
            border-left: 4px solid #c33;
        }
        .btn {
            display: inline-block;
            padding: 12px 30px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #5568d3;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            String success = (String) request.getAttribute("success");
            String error = (String) request.getAttribute("error");
            
            if (success != null) {
        %>
            <div class="success-icon">✅</div>
            <h2>Success!</h2>
            <div class="success-message">
                <%= success %>
            </div>
        <%
            } else if (error != null) {
        %>
            <div class="success-icon" style="color: #e74c3c;">❌</div>
            <h2>Error</h2>
            <div class="error-message">
                <%= error %>
            </div>
        <%
            } else {
        %>
            <div class="success-icon">✅</div>
            <h2>Success!</h2>
            <div class="success-message">
                Operation completed successfully!
            </div>
        <%
            }
        %>
        
        <a href="welcome.jsp" class="btn">Go to Home</a>
        <a href="login.jsp" class="btn" style="margin-left: 10px; background: #95a5a6;">Logout</a>
    </div>
</body>
</html>
