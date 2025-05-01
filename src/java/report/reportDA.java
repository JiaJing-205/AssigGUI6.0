package report;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.*;

public class reportDA {

    private String host = "jdbc:derby://localhost:1527/Assignment";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "payment";
    private Connection conn;
    private PreparedStatement stmt;

    public reportDA() throws Exception {
        createConnection();
    }


    private void createConnection() throws Exception {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(host, user, password);
        } catch (ClassNotFoundException | SQLException ex) {
          //  JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
          throw ex;
        }
    }
        
    public List<Report> getTotalItemsSoldByMonth(int month) throws SQLException {
        String query = "SELECT i.itemID, i.itemName, i.itemPrice, i.itemCategory, SUM(o.quantity) AS total_sold, (SUM(o.quantity) * i.itemPrice) AS total_sales " +
            "FROM Item i " +
            "INNER JOIN OrderInfo o ON i.itemID = o.itemID " +
            "INNER JOIN Payment p ON o.paymentID = p.paymentID " +
            "WHERE MONTH(p.paymentDate) = ? " +
            "GROUP BY i.itemID, i.itemName, i.itemPrice, i.itemCategory";

        List<Report> reportList = new ArrayList<>();
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, month);

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String itemID = rs.getString("itemID");
            String itemName = rs.getString("itemName");
            String itemCategory = rs.getString("itemCategory");
            double itemPrice = rs.getDouble("itemPrice");
            int totalSold = rs.getInt("total_sold");
            double totalSales = rs.getDouble("total_sales");

            reportList.add(new Report(itemID, itemName, itemCategory, itemPrice, totalSold, totalSales));
        }
        return reportList;
    }
        public List<Report> getTotalItemsSold() throws SQLException {
        String query = "SELECT i.itemID, i.itemName, i.itemPrice, i.itemCategory, SUM(o.quantity) AS total_sold, (SUM(o.quantity) * i.itemPrice) AS total_sales " +
            "FROM Item i " +
            "INNER JOIN OrderInfo o ON i.itemID = o.itemID " +
            "INNER JOIN Payment p ON o.paymentID = p.paymentID " +
            "GROUP BY i.itemID, i.itemName, i.itemPrice, i.itemCategory";

        List<Report> reportList = new ArrayList<>();
        stmt = conn.prepareStatement(query);

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String itemID = rs.getString("itemID");
            String itemName = rs.getString("itemName");
            String itemCategory = rs.getString("itemCategory");
            double itemPrice = rs.getDouble("itemPrice");
            int totalSold = rs.getInt("total_sold");
            double totalSales = rs.getDouble("total_sales");

            reportList.add(new Report(itemID, itemName, itemCategory, itemPrice, totalSold, totalSales));
        }
        return reportList;
    }
        
    public List<Report> getTop3ItemByMonth(int month) throws SQLException {
        String query = "SELECT i.itemID, i.itemName, i.itemPrice, i.itemCategory, SUM(o.quantity) AS total_sold, (SUM(o.quantity) * i.itemPrice) AS total_sales " +
            "FROM Item i " +
            "INNER JOIN OrderInfo o ON i.itemID = o.itemID " +
            "INNER JOIN Payment p ON o.paymentID = p.paymentID " +
            "WHERE MONTH(p.paymentDate) = ? " +
            "GROUP BY i.itemID, i.itemName, i.itemPrice, i.itemCategory " +
            "FETCH FIRST 3 ROWS ONLY";

        List<Report> reportList = new ArrayList<>();
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, month);

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String itemID = rs.getString("itemID");
            String itemName = rs.getString("itemName");
            String itemCategory = rs.getString("itemCategory");
            double itemPrice = rs.getDouble("itemPrice");
            int totalSold = rs.getInt("total_sold");
            double totalSales = rs.getDouble("total_sales");

            reportList.add(new Report(itemID, itemName, itemCategory, itemPrice, totalSold, totalSales));
        }
        return reportList;
    }
    public List<Report> getTop3Item() throws SQLException {
        String query = "SELECT i.itemID, i.itemName, i.itemPrice, i.itemCategory, SUM(o.quantity) AS total_sold, (SUM(o.quantity) * i.itemPrice) AS total_sales " +
            "FROM Item i " +
            "INNER JOIN OrderInfo o ON i.itemID = o.itemID " +
            "INNER JOIN Payment p ON o.paymentID = p.paymentID " +
            //"WHERE Payment(p.paymentStatus) = 'paid' " +
            "GROUP BY i.itemID, i.itemName, i.itemPrice, i.itemCategory " +
            "FETCH FIRST 3 ROWS ONLY";

        List<Report> reportList = new ArrayList<>();
        stmt = conn.prepareStatement(query);

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String itemID = rs.getString("itemID");
            String itemName = rs.getString("itemName");
            String itemCategory = rs.getString("itemCategory");
            double itemPrice = rs.getDouble("itemPrice");
            int totalSold = rs.getInt("total_sold");
            double totalSales = rs.getDouble("total_sales");

            reportList.add(new Report(itemID, itemName, itemCategory, itemPrice, totalSold, totalSales));
        }
        return reportList;
    }
    
     public List<Report> getLast3ItemByMonth(int month) throws SQLException {
        String query = "SELECT i.itemID, i.itemName, i.itemPrice, i.itemCategory, SUM(o.quantity) AS total_sold, (SUM(o.quantity) * i.itemPrice) AS total_sales " +
            "FROM Item i " +
            "INNER JOIN OrderInfo o ON i.itemID = o.itemID " +
            "INNER JOIN Payment p ON o.paymentID = p.paymentID " +
            "WHERE MONTH(p.paymentDate) = ? " +
            "GROUP BY i.itemID, i.itemName, i.itemPrice, i.itemCategory " +
            "FETCH FIRST 3 ROWS ONLY";

        List<Report> reportList = new ArrayList<>();
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, month);

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String itemID = rs.getString("itemID");
            String itemName = rs.getString("itemName");
            String itemCategory = rs.getString("itemCategory");
            double itemPrice = rs.getDouble("itemPrice");
            int totalSold = rs.getInt("total_sold");
            double totalSales = rs.getDouble("total_sales");

            reportList.add(new Report(itemID, itemName, itemCategory, itemPrice, totalSold, totalSales));
        }
        return reportList;
    }

     public List<Report> getLast3Item() throws SQLException {
        String query = "SELECT i.itemID, i.itemName, i.itemPrice, i.itemCategory, SUM(o.quantity) AS total_sold, (SUM(o.quantity) * i.itemPrice) AS total_sales " +
            "FROM Item i " +
            "INNER JOIN OrderInfo o ON i.itemID = o.itemID " +
            "INNER JOIN Payment p ON o.paymentID = p.paymentID " +
            "GROUP BY i.itemID, i.itemName, i.itemPrice, i.itemCategory " +
            "FETCH FIRST 3 ROWS ONLY";

        List<Report> reportList = new ArrayList<>();
        stmt = conn.prepareStatement(query);

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String itemID = rs.getString("itemID");
            String itemName = rs.getString("itemName");
            String itemCategory = rs.getString("itemCategory");
            double itemPrice = rs.getDouble("itemPrice");
            int totalSold = rs.getInt("total_sold");
            double totalSales = rs.getDouble("total_sales");

            reportList.add(new Report(itemID, itemName, itemCategory, itemPrice, totalSold, totalSales));
        }
        return reportList;
    }

    public List<Report> getCategoryByMonth(int month) throws SQLException {
        String query = "SELECT i.itemCategory, SUM(o.quantity) AS total_sold, SUM(o.quantity * i.itemPrice) AS total_sales " +
            "FROM Item i " +
            "INNER JOIN OrderInfo o ON i.itemID = o.itemID " +
            "INNER JOIN Payment p ON o.paymentID = p.paymentID " +
            "WHERE MONTH(p.paymentDate) = ? " +
            "GROUP BY i.itemCategory";

        List<Report> reportList = new ArrayList<>();
        stmt = conn.prepareStatement(query);
        stmt.setInt(1, month);

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String category = rs.getString("itemCategory");
            int totalSold = rs.getInt("total_sold");
            double totalSales = rs.getDouble("total_sales");
            reportList.add(new Report(category, totalSold, totalSales));
        }
        return reportList;
    }
          
    public List<Report> getCategory() throws SQLException {
        String query = "SELECT i.itemCategory, SUM(o.quantity) AS total_sold, SUM(o.quantity * i.itemPrice) AS total_sales " +
            "FROM Item i " +
            "INNER JOIN OrderInfo o ON i.itemID = o.itemID " +
            "INNER JOIN Payment p ON o.paymentID = p.paymentID " +
            "GROUP BY i.itemCategory";

        List<Report> reportList = new ArrayList<>();
        stmt = conn.prepareStatement(query);

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            String category = rs.getString("itemCategory");
            int totalSold = rs.getInt("total_sold");
            double totalSales = rs.getDouble("total_sales");
            reportList.add(new Report(category, totalSold, totalSales));
        }
        return reportList;
    }
        
    public static void main(String[] args) throws Exception {
        reportDA da = new reportDA();
               
    }
}
