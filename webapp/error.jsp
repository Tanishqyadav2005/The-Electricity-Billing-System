<!DOCTYPE html>
<html>
<head>
    <title>Error - Electricity Billing System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .error-container {
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            text-align: center;
            max-width: 500px;
        }
        h1 {
            color: #e74c3c;
            margin-bottom: 20px;
        }
        .error-code {
            font-size: 72px;
            color: #e74c3c;
            margin: 20px 0;
        }
        .error-message {
            color: #555;
            margin: 20px 0;
            line-height: 1.6;
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
    <div class="error-container">
        <div class="error-code">
            <%
                String errorCode = request.getParameter("code");
                if (errorCode != null) {
                    out.print(errorCode);
                } else {
                    out.print("!");
                }
            %>
        </div>
        <h1>Oops! Something went wrong</h1>
        <p class="error-message">
            <%
                String message = request.getParameter("message");
                String error = (String) request.getAttribute("error");
                
                if (error != null) {
                    out.print(error);
                } else if (message != null) {
                    out.print(message);
                } else {
                    out.print("An unexpected error occurred. Please try again later.");
                }
            %>
        </p>
        <a href="login.jsp" class="btn">Go to Login</a>
        <a href="welcome.jsp" class="btn" style="margin-left: 10px;">Go to Home</a>
    </div>
</body>
</html>

