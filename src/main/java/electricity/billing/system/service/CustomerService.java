package service;

import dao.CustomerDAO;
import model.Customer;
import javax.servlet.http.HttpServletRequest;

public class CustomerService {

    CustomerDAO dao = new CustomerDAO();

    public void addCustomer(HttpServletRequest req) {
        Customer c = new Customer();
        c.setName(req.getParameter("name"));
        c.setUnits(Integer.parseInt(req.getParameter("units")));
        dao.insertCustomer(c);
    }

    public void deleteCustomer(HttpServletRequest req) {
        int id = Integer.parseInt(req.getParameter("id"));
        dao.deleteCustomer(id);
    }
}
