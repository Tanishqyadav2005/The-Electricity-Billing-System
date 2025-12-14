package service;

import dao.BillDAO;
import javax.servlet.http.HttpServletRequest;

public class BillingService {

    BillDAO dao = new BillDAO();

    public double generateBill(HttpServletRequest req) {
        int units = Integer.parseInt(req.getParameter("units"));
        double amount = units * 6.5;
        dao.saveBill(units, amount);
        return amount;
    }
}
