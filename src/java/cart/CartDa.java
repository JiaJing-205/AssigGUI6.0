package cart;

import cart.CartItem;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartDa {

    private Connection conn;
    private PreparedStatement preparedStmt;
    private String host = "jdbc:derby://localhost:1527/Assignment";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "CART";

    private void createConnection() {
        try {
            conn = DriverManager.getConnection(host, user, password);
            System.out.println("TRACE: Connection established.");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public CartDa() {
        createConnection();
    }

    public ResultSet retrieveRecord() {
        try {
            String retrieveStr = "SELECT * FROM " + tableName;
            preparedStmt = conn.prepareStatement(retrieveStr);
            ResultSet rs = preparedStmt.executeQuery();
            System.out.println("TRACE: Records retreved.");
            return rs;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void addRecord(CartItem cartItem) {
        String insertStr = "INSERT INTO " + tableName + " VALUES (?, ?, ?, ?, ?, ?)";
        try {
            preparedStmt = conn.prepareStatement(insertStr);
            preparedStmt.setString(1, cartItem.getID());
            preparedStmt.setString(2, cartItem.getName());
            preparedStmt.setString(3, cartItem.getCategory());
            preparedStmt.setDouble(4, cartItem.getPrice());
            preparedStmt.setInt(5, cartItem.getQuantity());
            preparedStmt.setString(6, cartItem.getUserId());
            preparedStmt.executeUpdate();
            System.out.println("TRACE: Record added.");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateRecord(CartItem cartItem) {
        String updateStr = "UPDATE " + tableName + " SET ITEMNAME = ?, ITEMCATEGORY = ?, ITEMPRICE = ?, QUANTITY = ? WHERE (ITEMID = ?) AND (USER_ID = ?)";
        try {
            preparedStmt = conn.prepareStatement(updateStr);
            preparedStmt.setString(1, cartItem.getName());
            preparedStmt.setString(2, cartItem.getCategory());
            preparedStmt.setDouble(3, cartItem.getPrice());
            preparedStmt.setInt(4, cartItem.getQuantity());
            preparedStmt.setString(5, cartItem.getID());
            preparedStmt.setString(6, cartItem.getUserId());
            preparedStmt.executeUpdate();
            System.out.println("TRACE: Record updated.");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void deleteRecord(String itemId, String userId) {
        String deleteStr = "DELETE FROM " + tableName + " WHERE (ITEMID = ?) AND (USER_ID = ?)";
        try {
            preparedStmt = conn.prepareStatement(deleteStr);
            preparedStmt.setString(1, itemId);
            preparedStmt.setString(2, userId);
            preparedStmt.executeUpdate();
            System.out.println("TRACE: Record deleted.");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void deleteAllRecord() {
        String deleteStr = "DELETE FROM " + tableName;
        try {
            preparedStmt = conn.prepareStatement(deleteStr);
            preparedStmt.executeUpdate();
            System.out.println("TRACE: All record deleted.");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void shutDown() {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
        CartDa cartDa = new CartDa();
        cartDa.deleteAllRecord();
    }
}
