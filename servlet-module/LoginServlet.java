import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");

        try {
            Connection conn = DBUtil.getConnection();
            String query = "SELECT * FROM Signup WHERE username = ? AND password = ? AND usertype = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, userType);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String meterNo = rs.getString("meter_no");
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("userType", userType);
                session.setAttribute("meterNo", meterNo);

                if ("Admin".equals(userType)) {
                    response.sendRedirect("customerList.jsp");
                } else {
                    response.sendRedirect("billView.jsp");
                }
            } else {
                request.setAttribute("error", "Invalid login credentials");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
