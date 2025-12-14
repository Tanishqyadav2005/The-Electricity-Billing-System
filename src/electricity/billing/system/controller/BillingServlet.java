package controller;

import service.BillingService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        BillingService service = new BillingService();
        double amount = service.generateBill(req);

        req.setAttribute("amount", amount);
        req.getRequestDispatcher("bill.jsp").forward(req, res);
    }
}
