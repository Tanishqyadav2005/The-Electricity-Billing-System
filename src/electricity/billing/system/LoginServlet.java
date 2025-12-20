package servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.Properties;
import java.io.InputStream;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to login page
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Input validation
        if (username == null || username.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            response.sendRedirect("login.jsp?error=2"); // Missing fields
            return;
        }

        // Sanitize input (basic)
        username = username.trim();
        password = password.trim();

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Get database connection from properties file
            Properties props = new Properties();
            InputStream inputStream = getClass().getClassLoader().getResourceAsStream("db.properties");
            
            String url = "jdbc:mysql://localhost:3306/Bill_system";
            String dbUser = "root";
            String dbPassword = "";
            
            if (inputStream != null) {
                props.load(inputStream);
                url = props.getProperty("db.url", url);
                dbUser = props.getProperty("db.username", dbUser);
                dbPassword = props.getProperty("db.password", dbPassword);
            }
            
            connection = DriverManager.getConnection(url, dbUser, dbPassword);
            
            // Use PreparedStatement to prevent SQL injection
            String query = "SELECT * FROM Signup WHERE username = ? AND password = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                String userType = resultSet.getString("usertype");
                String meterNo = resultSet.getString("meter_no");
                
                // Set session attributes
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("usertype", userType);
                session.setAttribute("meter_no", meterNo);
                
                response.sendRedirect("welcome.jsp");
            } else {
                response.sendRedirect("login.jsp?error=1"); // Invalid credentials
            }
            
        } catch (SQLException e) {
            // Log error (in production, use proper logging framework)
            System.err.println("Database error in LoginServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("error.jsp?code=500&message=Database connection error");
        } catch (Exception e) {
            System.err.println("Error in LoginServlet: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("error.jsp?code=500&message=Internal server error");
        } finally {
            // Proper resource cleanup
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.err.println("Error closing database resources: " + e.getMessage());
            }
        }
    }
}

