import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class BillServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String meterNo = (String) session.getAttribute("meterNo");
        String userType = (String) session.getAttribute("userType");

        if (meterNo == null || !"Customer".equals(userType)) {
            response.sendRedirect("login.jsp");
            return;
        }

        String export = request.getParameter("export");
        if ("txt".equals(export)) {
            // Export bill to TXT
            try {
                Connection conn = DBUtil.getConnection();
                String query = "SELECT * FROM bill WHERE meter_no = ? ORDER BY month DESC LIMIT 1";
                PreparedStatement stmt = conn.prepareStatement(query);
                stmt.setString(1, meterNo);

                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    String month = rs.getString("month");
                    String units = rs.getString("units");
                    String amount = rs.getString("total_bill");

                    response.setContentType("text/plain");
                    response.setHeader("Content-Disposition", "attachment; filename=\"bill_" + meterNo + "_" + month + ".txt\"");

                    PrintWriter out = response.getWriter();
                    out.println("Electricity Bill");
                    out.println("Meter No: " + meterNo);
                    out.println("Month: " + month);
                    out.println("Units Consumed: " + units);
                    out.println("Total Amount: " + amount);
                    out.close();
                }

                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return;
        }

        try {
            Connection conn = DBUtil.getConnection();
            String query = "SELECT * FROM bill WHERE meter_no = ? ORDER BY month DESC LIMIT 1";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, meterNo);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("month", rs.getString("month"));
                request.setAttribute("units", rs.getString("units"));
                request.setAttribute("amount", rs.getString("total_bill"));
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("billView.jsp").forward(request, response);
    }
}
