package controller;

import service.CustomerService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        CustomerService service = new CustomerService();

        if ("add".equals(action)) {
            service.addCustomer(req);
        } else if ("delete".equals(action)) {
            service.deleteCustomer(req);
        }

        req.getRequestDispatcher("success.jsp").forward(req, res);
    }
}
