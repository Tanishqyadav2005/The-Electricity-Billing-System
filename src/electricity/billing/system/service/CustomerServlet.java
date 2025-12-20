package controller;

import service.CustomerService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // Handle GET request - show customer list or form
        req.getRequestDispatcher("success.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            String action = req.getParameter("action");
            
            if (action == null || action.trim().isEmpty()) {
                req.setAttribute("error", "Action parameter is required");
                req.getRequestDispatcher("error.jsp").forward(req, res);
                return;
            }

            CustomerService service = new CustomerService();

            if ("add".equals(action)) {
                // Validate input
                String name = req.getParameter("name");
                String unitsParam = req.getParameter("units");
                
                if (name == null || name.trim().isEmpty()) {
                    req.setAttribute("error", "Customer name is required");
                    req.getRequestDispatcher("error.jsp").forward(req, res);
                    return;
                }
                
                if (unitsParam == null || unitsParam.trim().isEmpty()) {
                    req.setAttribute("error", "Units is required");
                    req.getRequestDispatcher("error.jsp").forward(req, res);
                    return;
                }
                
                try {
                    int units = Integer.parseInt(unitsParam);
                    if (units < 0) {
                        throw new NumberFormatException();
                    }
                } catch (NumberFormatException e) {
                    req.setAttribute("error", "Invalid units value");
                    req.getRequestDispatcher("error.jsp").forward(req, res);
                    return;
                }
                
                service.addCustomer(req);
                req.setAttribute("success", "Customer added successfully");
            } else if ("delete".equals(action)) {
                String idParam = req.getParameter("id");
                if (idParam == null || idParam.trim().isEmpty()) {
                    req.setAttribute("error", "Customer ID is required");
                    req.getRequestDispatcher("error.jsp").forward(req, res);
                    return;
                }
                
                try {
                    Integer.parseInt(idParam);
                } catch (NumberFormatException e) {
                    req.setAttribute("error", "Invalid customer ID");
                    req.getRequestDispatcher("error.jsp").forward(req, res);
                    return;
                }
                
                service.deleteCustomer(req);
                req.setAttribute("success", "Customer deleted successfully");
            } else {
                req.setAttribute("error", "Invalid action: " + action);
                req.getRequestDispatcher("error.jsp").forward(req, res);
                return;
            }

            req.getRequestDispatcher("success.jsp").forward(req, res);
        } catch (Exception e) {
            System.err.println("Error in CustomerServlet: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("error", "An error occurred: " + e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}
