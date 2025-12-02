import java.sql.*;

public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/Bill_system";
    private static final String USER = "root";
    private static final String PASSWORD = "AyushVish";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
