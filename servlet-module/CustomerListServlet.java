import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;

public class CustomerListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userType = (String) session.getAttribute("userType");

        if (!"Admin".equals(userType)) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Map<String, String>> customers = new ArrayList<>();

        try {
            Connection conn = DBUtil.getConnection();
            String query = "SELECT * FROM Signup WHERE usertype = 'Customer'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Map<String, String> customer = new HashMap<>();
                customer.put("username", rs.getString("username"));
                customer.put("meter_no", rs.getString("meter_no"));
                customer.put("name", rs.getString("name"));
                customer.put("address", rs.getString("address"));
                customers.add(customer);
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("customers", customers);
        request.getRequestDispatcher("customerList.jsp").forward(request, response);
    }
}
