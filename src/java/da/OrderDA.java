package da;

//import domain.Order;
import domain.Order;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderDA {

    private String host = "jdbc:derby://localhost:1527/Assignment";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "orderinfo";
    private Connection conn;
    private PreparedStatement stmt;

    public OrderDA() {
        createConnection();
    }

    private void createConnection() {
        try {
            conn = DriverManager.getConnection(host, user, password);
            System.out.println("***TRACE: Connection established.");
        } catch (SQLException ex) {
//            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void shutDown() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
//                JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    //CRUD
    public void createRecord(Order order) {
        try {
            String insertSQL = "INSERT INTO " + tableName + " VALUES (?,?,?,?,?,?)";
            stmt = conn.prepareStatement(insertSQL);
            stmt.setString(1, order.getOrderID());
            stmt.setString(2, order.getPaymentID());
            stmt.setString(3, order.getItemID());
            stmt.setInt(4, order.getQuantity());
            stmt.setDouble(5, order.getPrice());
            stmt.setString(6, order.getOrderDate());
            stmt.executeUpdate();
        } catch (SQLException ex) {

        }
    }

    public Order retrieveRecord(String id) {
        String queryStr = "SELECT * FROM " + tableName + " WHERE OrderID = ?";
        Order order = null;
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                order = new Order(
                        rs.getString("orderID"),
                        rs.getString("paymentID"),
                        rs.getString("itemID"),
                        rs.getInt("quantity"),
                        rs.getDouble("price"),
                        rs.getString("orderDate"));
            }
            return order;
        } catch (SQLException ex) {
            return order = new Order();
        }

    }

    //Added by Yizhe
    public ResultSet getRecordResultSet() {
        String getRecordStr = "SELECT * FROM " + tableName;
        ResultSet rs = null;

        try {
            stmt = conn.prepareStatement(getRecordStr);
            rs = stmt.executeQuery();
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return rs;
    }

    public void updateProfileRecord(Order order) {
        try {
            String insertSQL = "UPDATE " + tableName + " SET itemID=?, quantity=?, WHERE orderID=?";
            stmt = conn.prepareStatement(insertSQL);
            stmt.setString(1, order.getItemID());
            stmt.setInt(2, order.getQuantity());
            stmt.setString(3, order.getOrderID());

            stmt.executeUpdate();
        } catch (SQLException ex) {

        }
    }

    public void deleteProfileRecord(Order order) {
        try {
            String insertSQL = "DELETE FROM " + tableName + " WHERE orderID=?";
            stmt = conn.prepareStatement(insertSQL);
            stmt.setString(1, order.getOrderID());
            stmt.executeUpdate();
        } catch (SQLException ex) {

        }
    }
}
