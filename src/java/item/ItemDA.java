package item;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.*;

public class ItemDA {

    private String host = "jdbc:derby://localhost:1527/Assignment";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "Item";
    private Connection conn;
    private PreparedStatement stmt;

    public ItemDA() {
        createConnection();
    }

    private void createConnection() {
        try {
            conn = DriverManager.getConnection(host, user, password);
            System.out.println("*TRACE: Connection established.");
        } catch (SQLException ex) {
//            JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
        }
    }
        
    public void addRecord(Item programme) throws SQLException{
        String insertStr = "INSERT INTO Item VALUES(?, ?, ?, ?, ?)";
        try {
            stmt = conn.prepareStatement(insertStr);
            stmt.setString(1, programme.getID());
            stmt.setString(2, programme.getName());
            stmt.setString(3, programme.getCategory());
            stmt.setString(4, String.valueOf(programme.getPrice()));
            stmt.setString(5, String.valueOf(programme.getStock()));
            stmt.executeUpdate();
        } catch (SQLException ex) {
           JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
           throw ex;
        }
    }

    public Item getRecord(String code)throws SQLException {
        String queryStr = "SELECT * FROM Item WHERE itemID = ?";
        Item programme = null;
        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, code);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                programme = new Item(code, rs.getString("itemName"), rs.getString("itemCategory"), rs.getFloat("itemPrice"), rs.getInt("stock"));
            }
        } catch (SQLException ex) {
           // JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
           throw ex;
        }
        return programme;
    }
    
    public List<Item> getAllRecord() throws SQLException {
        String queryStr = "SELECT * FROM Item";
        List<Item> itemList = new ArrayList<>();

        try {
            stmt = conn.prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Item programme = new Item(
                rs.getString("itemID"),
                rs.getString("itemName"),
                rs.getString("itemCategory"),
                rs.getFloat("itemPrice"),
                rs.getInt("stock")
            );
            itemList.add(programme);
        }

    } catch (SQLException ex) {
        throw ex;
    }
        return itemList;
    }
    
    public List<Item> getRecordSearch(String code) throws SQLException {
        String queryStr = "SELECT * FROM Item WHERE itemID = ?";
        List<Item> itemList = new ArrayList<>();

        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, code);
            ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Item programme = new Item(
                rs.getString("itemID"),
                rs.getString("itemName"),
                rs.getString("itemCategory"),
                rs.getFloat("itemPrice"),
                rs.getInt("stock")
            );
            itemList.add(programme);
        }

    } catch (SQLException ex) {
        throw ex;
    }
        return itemList;
    }
    
     public Item getRecordSearchName(String name) throws SQLException {
        String queryStr = "SELECT * FROM Item WHERE itemName LIKE?";
        Item itemFind = new Item();

        try {
            stmt = conn.prepareStatement(queryStr);
            stmt.setString(1, "%" + name + "%");
            ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Item itemDet = new Item(
                rs.getString("itemID"),
                rs.getString("itemName"),
                rs.getString("itemCategory"),
                rs.getFloat("itemPrice"),
                rs.getInt("stock")
            );
            itemFind = itemDet;
        }

    } catch (SQLException ex) {
        throw ex;
    }
        return itemFind;
    }
        
    public List<Item> getAllRecordStock() throws SQLException {
        String queryStr = "SELECT * FROM Item ORDER BY stock";
        List<Item> itemList = new ArrayList<>();

        try {
            stmt = conn.prepareStatement(queryStr);
            ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Item programme = new Item(
                rs.getString("itemID"),
                rs.getString("itemName"),
                rs.getString("itemCategory"),
                rs.getFloat("itemPrice"),
                rs.getInt("stock")
            );
            itemList.add(programme);
        }

    } catch (SQLException ex) {
        throw ex;
    }  
    return itemList;
    }
        
    public void editRecord(Item programme) throws SQLException {
        try {
            String updateStr = "UPDATE Item SET itemName = ?, itemCategory = ?, itemPrice = ?, stock = ?" + " WHERE itemID = ?";
            stmt = conn.prepareStatement(updateStr);
            stmt.setString(1, programme.getName());
            stmt.setString(2, programme.getCategory());
            stmt.setDouble(3, programme.getPrice());
            stmt.setInt(4, programme.getStock());
            stmt.setString(5, programme.getID());
            stmt.executeUpdate();
        } catch (SQLException ex) {
           //JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
           throw ex;
        }
    }

    public void deleteRecord(String code) throws SQLException{
        try {
            String deleteStr = "DELETE FROM item WHERE itemID = ?";
            stmt = conn.prepareStatement(deleteStr);
            stmt.setString(1, code);
            stmt.executeUpdate();

        } catch (SQLException ex) {
           // JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
           throw ex;
        }
    }

    public ResultSet retrieveRecord() throws SQLException {
        String retrieveStr = "SELECT * FROM Item";
        try {
            stmt = conn.prepareStatement(retrieveStr);
            ResultSet rs = stmt.executeQuery();
            System.out.println("*TRACE: Records retrieved.");
            return rs;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
        
public Item retrieveRecordByID(String itemID) throws SQLException {
    String queryStr = "SELECT * FROM Item WHERE itemID = ?";
    Item item = null;

    try {
        stmt = conn.prepareStatement(queryStr);
        stmt.setString(1, itemID);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            item = new Item(
                rs.getString("itemID"),
                rs.getString("itemName"),
                rs.getString("itemCategory"),
                rs.getDouble("itemPrice"),
                rs.getInt("stock")
            );
        }
    } catch (SQLException ex) {
        throw ex;
    }

    return item;
}
        
    private void shutDown() throws SQLException{
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
              //  JOptionPane.showMessageDialog(null, ex.getMessage(), "ERROR", JOptionPane.ERROR_MESSAGE);
              throw ex;
            }
        }
    }

    public static void main(String[] args) throws Exception {
        ItemDA da = new ItemDA();
    }
}