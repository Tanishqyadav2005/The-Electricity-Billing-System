package controller;

import service.BillingService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // Handle GET request - show bill form or redirect
        req.getRequestDispatcher("bill.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            // Validate input
            String unitsParam = req.getParameter("units");
            if (unitsParam == null || unitsParam.trim().isEmpty()) {
                req.setAttribute("error", "Units cannot be empty");
                req.getRequestDispatcher("bill.jsp").forward(req, res);
                return;
            }

            int units;
            try {
                units = Integer.parseInt(unitsParam);
                if (units < 0) {
                    throw new NumberFormatException();
                }
            } catch (NumberFormatException e) {
                req.setAttribute("error", "Invalid units value. Please enter a positive number.");
                req.getRequestDispatcher("bill.jsp").forward(req, res);
                return;
            }

            BillingService service = new BillingService();
            double amount = service.generateBill(req);

            req.setAttribute("amount", amount);
            req.setAttribute("units", units);
            req.setAttribute("success", true);
            req.getRequestDispatcher("bill.jsp").forward(req, res);
        } catch (Exception e) {
            System.err.println("Error in BillingServlet: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "An error occurred while generating the bill.");
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}
