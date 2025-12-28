package net.proteanit.sql;

import javax.swing.table.DefaultTableModel;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Vector;

public class DbUtils {
    
    public static DefaultTableModel resultSetToTableModel(ResultSet rs) {
        try {
            ResultSetMetaData metaData = rs.getMetaData();
            int numberOfColumns = metaData.getColumnCount();
            
            Vector<String> columnNames = new Vector<String>();
            for (int column = 0; column < numberOfColumns; column++) {
                columnNames.addElement(metaData.getColumnLabel(column + 1));
            }
            
            Vector<Vector<Object>> rows = new Vector<Vector<Object>>();
            while (rs.next()) {
                Vector<Object> newRow = new Vector<Object>();
                for (int i = 1; i <= numberOfColumns; i++) {
                    newRow.addElement(rs.getObject(i));
                }
                rows.addElement(newRow);
            }
            
            return new DefaultTableModel(rows, columnNames) {
                @Override
                public boolean isCellEditable(int row, int column) {
                    return false;
                }
            };
        } catch (SQLException e) {
            e.printStackTrace();
            return new DefaultTableModel();
        }
    }
}

