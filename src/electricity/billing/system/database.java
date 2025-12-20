package electricity.billing.system;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class database {
    Connection connection;
    Statement statement;
    
    database(){
        try {
            // Try to load database configuration from properties file
            Properties props = new Properties();
            InputStream inputStream = getClass().getClassLoader().getResourceAsStream("db.properties");
            
            String url = "jdbc:mysql://localhost:3306/Bill_system";
            String username = "root";
            String password = "";
            
            if (inputStream != null) {
                props.load(inputStream);
                url = props.getProperty("db.url", url);
                username = props.getProperty("db.username", username);
                password = props.getProperty("db.password", "");
            }
            
            // If password is empty, try common defaults or prompt
            if (password == null || password.isEmpty()) {
                // Try common default passwords
                String[] defaultPasswords = {"", "root", "password", "1234"};
                boolean connected = false;
                
                for (String pwd : defaultPasswords) {
                    try {
                        connection = DriverManager.getConnection(url, username, pwd);
                        statement = connection.createStatement();
                        connected = true;
                        break;
                    } catch (SQLException e) {
                        // Try next password
                    }
                }
                
                if (!connected) {
                    throw new SQLException("Could not connect to database. Please check db.properties file.");
                }
            } else {
                connection = DriverManager.getConnection(url, username, password);
                statement = connection.createStatement();
            }
            
            System.out.println("Database connection established successfully!");
            
        } catch (Exception e) {
            System.err.println("Database connection error: " + e.getMessage());
            e.printStackTrace();
            javax.swing.JOptionPane.showMessageDialog(null, 
                "Database Connection Failed!\n\n" +
                "Please ensure:\n" +
                "1. MySQL is running\n" +
                "2. Database 'Bill_system' exists\n" +
                "3. Update db.properties with correct credentials\n\n" +
                "Error: " + e.getMessage(),
                "Database Error",
                javax.swing.JOptionPane.ERROR_MESSAGE);
        }
    }
}


