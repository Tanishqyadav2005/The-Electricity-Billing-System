<!DOCTYPE html>
<html>
<head>
    <title>Generate Bill - Electricity Billing System</title>
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
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }
        h2 {
            color: #333;
            margin-bottom: 30px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: 500;
        }
        input[type="number"] {
            width: 100%;
            padding: 12px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        input[type="number"]:focus {
            outline: none;
            border-color: #667eea;
        }
        .btn {
            width: 100%;
            padding: 12px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            font-weight: 600;
        }
        .btn:hover {
            background: #5568d3;
        }
        .bill-result {
            background: #e8f5e9;
            padding: 20px;
            border-radius: 5px;
            margin-top: 20px;
            border-left: 4px solid #4caf50;
        }
        .error-message {
            background: #fee;
            color: #c33;
            padding: 12px;
            border-radius: 5px;
            margin-bottom: 20px;
            border-left: 4px solid #c33;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #667eea;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>💰 Generate Electricity Bill</h2>
        
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="error-message">❌ <%= error %></div>
        <%
            }
        %>
        
        <%
            Boolean success = (Boolean) request.getAttribute("success");
            Double amount = (Double) request.getAttribute("amount");
            Integer units = (Integer) request.getAttribute("units");
            
            if (success != null && success && amount != null) {
        %>
            <div class="bill-result">
                <h3>✅ Bill Generated Successfully!</h3>
                <p><strong>Units Consumed:</strong> <%= units != null ? units : "N/A" %></p>
                <p><strong>Total Amount:</strong> ₹<%= String.format("%.2f", amount) %></p>
            </div>
        <%
            }
        %>
        
        <form action="BillingServlet" method="post">
            <div class="form-group">
                <label for="units">Units Consumed</label>
                <input type="number" id="units" name="units" 
                       placeholder="Enter units consumed" 
                       min="0" 
                       step="1" 
                       required>
            </div>
            
            <button type="submit" class="btn">Generate Bill</button>
        </form>
        
        <a href="welcome.jsp" class="back-link">← Back to Home</a>
    </div>
</body>
</html>
