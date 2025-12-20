package dao;

import java.sql.*;
import java.time.LocalDate;

public class BillDAO {

    public void saveBill(int units, double amount) {
        String sql = "INSERT INTO bill(units, amount, bill_date) VALUES (?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, units);
            ps.setDouble(2, amount);
            ps.setDate(3, Date.valueOf(LocalDate.now()));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
