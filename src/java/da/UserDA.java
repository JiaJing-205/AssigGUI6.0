package da;
 
 import da.UserDA;
 import domain.User;
 import java.sql.*;
 import java.util.ArrayList;
 import java.util.List;
 import javax.swing.*;
 
 public class UserDA {
 
     private String host = "jdbc:derby://localhost:1527/Assignment";
     private String user = "nbuser";
     private String password = "nbuser";
     private String tableName = "Users";
     private Connection conn;
     private PreparedStatement stmt;
 
     public UserDA() {
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
     public void createRecord(User user) {
         try {
             String insertSQL = "INSERT INTO " + tableName + " VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
             stmt = conn.prepareStatement(insertSQL);
             stmt.setString(1, user.getId());
             stmt.setString(2, user.getName());
             stmt.setString(3, user.getEmail());
             stmt.setString(4, user.getPhone());
             stmt.setString(5, user.getHbd());
             stmt.setString(6, user.getPwd());
             stmt.setString(7, String.valueOf(user.getPermission()));
             stmt.setString(8, String.valueOf(user.getFailCount()));
             stmt.setString(9, String.valueOf(user.getBlock()));
             stmt.setString(10, String.valueOf(user.getToken()));
             stmt.setString(11, String.valueOf(user.getTokenDate()));
             stmt.setString(12, String.valueOf(user.getCreateDate()));
         } catch (SQLException ex) {
 
         }
     }
 
     public User retrieveRecord(String id) {
         String queryStr = "SELECT * FROM " + tableName + " WHERE USER_ID = ?";
         User user = null;
         try {
             stmt = conn.prepareStatement(queryStr);
             stmt.setString(1, id);
             ResultSet rs = stmt.executeQuery();
 
             if (rs.next()) {

             user = new User(
                rs.getString("user_id"), 
               rs.getString("user_name"),
              rs.getString("user_email"),
              rs.getString("user_phone"),
                rs.getString("user_hbd"),
                rs.getString("user_pwd"),
           rs.getString("user_permission"),
           rs.getInt("user_fail_count"),
              rs.getBoolean("user_block"),
              rs.getString("user_pwd_reset_token"),
           rs.getString("user_token_expiration_date"),
          rs.getString("create_date"));
             }
             return user;
         } catch (SQLException ex) {
             return user = new User();
         }
         
     }
 
     public void updateProfileRecord(User user) {
         try {
             String insertSQL = "UPDATE " + tableName + " SET USER_NAME=?, USER_EMAIL=?, USER_PHONE=?, USER_HBD=?, USER_PWD=?, USER_PERMISSION=?, USER_FAIL_COUNT=?, USER_BLOCK=?, USER_PWD_RESET_TOKEN=?, USER_TOKEN_EXPIRATION_DATE=? WHERE USER_ID=?";
             stmt = conn.prepareStatement(insertSQL);
             stmt.setString(1, user.getName());
             stmt.setString(2, user.getEmail());
             stmt.setString(3, user.getPhone());
             stmt.setString(4, user.getHbd());
             stmt.setString(5, user.getPwd());
             stmt.setString(6, String.valueOf(user.getPermission()));
             stmt.setString(7, String.valueOf(user.getFailCount()));
             stmt.setString(8, String.valueOf(user.getBlock()));
             stmt.setString(9, String.valueOf(user.getToken()));
             stmt.setString(10, String.valueOf(user.getTokenDate()));
             stmt.setString(12, user.getId());
 
             stmt.executeUpdate();
         } catch (SQLException ex) {
 
         }
     }
 
     public void deleteProfileRecord(String id) {
         try {
             String insertSQL = "DELETE FROM " + tableName + " WHERE USER_ID=?";
             stmt = conn.prepareStatement(insertSQL);
             stmt.setString(1, id);
             stmt.executeUpdate();
         } catch (SQLException ex) {
 
         }
     }
 
     //Search
     public boolean searchId(String id) {
         String queryStr = "SELECT 1 FROM " + tableName + " WHERE USER_ID = ?";
         try {
             stmt = conn.prepareStatement(queryStr);
             stmt.setString(1, id);
             ResultSet rs = stmt.executeQuery();
 
             return rs.next();
         } catch (SQLException ex) {
             return false;
         }
     }
     public boolean searchPhone(String phone) {
         String queryStr = "SELECT 1 FROM " + tableName + " WHERE USER_PHONE = ?";
         try {
             stmt = conn.prepareStatement(queryStr);
             stmt.setString(1, phone);
             ResultSet rs = stmt.executeQuery();
 
             return rs.next();
         } catch (SQLException ex) {
             return false;
         }
     }
     public boolean searchEmail(String email) {
         String queryStr = "SELECT 1 FROM " + tableName + " WHERE USER_EMAIL = ?";
         try {
             stmt = conn.prepareStatement(queryStr);
             stmt.setString(1, email);
             ResultSet rs = stmt.executeQuery();
 
             return rs.next();
         } catch (SQLException ex) {
             return false;
         }
     }
     public User retrieveRecordEmail(String email) {
         String queryStr = "SELECT * FROM " + tableName + " WHERE USER_EMAIL = ?";
         User user = null;
         try {
             stmt = conn.prepareStatement(queryStr);
             stmt.setString(1, email);
             ResultSet rs = stmt.executeQuery();
 
             if (rs.next()) {
                 user = new User(rs.getString("user_id"), rs.getString("user_name"),
                         rs.getString("user_email"),
                         rs.getString("user_phone"),
                         rs.getString("user_hbd"),
                         rs.getString("user_pwd"),
                         rs.getString("user_permission"),
                         rs.getInt("user_fail_count"),
                         rs.getBoolean("block"),
                         rs.getString("user_pwd_reset_token"),
                         rs.getString("user_token_expiration_date"),
                         rs.getString("create_date"));
             }
         } catch (SQLException ex) {
             return user = new User();
         }
         return user;
     }
 
     //Aaron
     public List<User> getAllUserRecord() throws SQLException {
         User user = null;
         String queryStr = "SELECT * FROM " + tableName + " WHERE user_permission = ''";
         List<User> userList = new ArrayList<>();
 
         try {
             stmt = conn.prepareStatement(queryStr);
             ResultSet rs = stmt.executeQuery();
 
         while (rs.next()) {
             user = new User(
                rs.getString("user_id"), 
               rs.getString("user_name"),
              rs.getString("user_email"),
              rs.getString("user_phone"),
                rs.getString("user_hbd"),
                rs.getString("user_pwd"),
           rs.getString("user_permission"),
           rs.getInt("user_fail_count"),
              rs.getBoolean("user_block"),
              rs.getString("user_pwd_reset_token"),
           rs.getString("user_token_expiration_date"),
          rs.getString("create_date"));
         }
         userList.add(user);
 
         } catch (SQLException ex) {
             throw ex;
         }
 
         return userList;
     }
 
 public List<User> getAllAdminRecord() throws SQLException {
     String queryStr = "SELECT * FROM " + tableName + " WHERE user_permission = 'admin'";
     List<User> adminList = new ArrayList<>();
 
     try {
         stmt = conn.prepareStatement(queryStr);
         ResultSet rs = stmt.executeQuery();
 
         while (rs.next()) {
             User user = new User(
                 rs.getString("user_id"), 
                 rs.getString("user_name"),
                 rs.getString("user_email"),
                 rs.getString("user_phone"),
                 rs.getString("user_hbd"),
                 rs.getString("user_pwd"),
                 rs.getString("user_permission"),
                 rs.getInt("user_fail_count"),
                 rs.getBoolean("user_block"),
                 rs.getString("user_pwd_reset_token"),
                 rs.getString("user_token_expiration_date"),
                 rs.getString("create_date")
             );
             adminList.add(user);
         }
     } catch (SQLException ex) {
         throw ex;
     }
 
     return adminList;
 }
 
     public List<User> getAllStaffRecord() throws SQLException {
         User user = null;
         String queryStr = "SELECT * FROM "+ tableName+" WHERE user_permission = 'staff'";
         List<User> staffList = new ArrayList<>();
 
         try {
             stmt = conn.prepareStatement(queryStr);
             ResultSet rs = stmt.executeQuery();
 
         while (rs.next()) {
             user = new User(
                rs.getString("user_id"), 
               rs.getString("user_name"),
              rs.getString("user_email"),
              rs.getString("user_phone"),
                rs.getString("user_hbd"),
                rs.getString("user_pwd"),
           rs.getString("user_permission"),
           rs.getInt("user_fail_count"),
              rs.getBoolean("user_block"),
              rs.getString("user_pwd_reset_token"),
           rs.getString("user_token_expiration_date"),
          rs.getString("create_date"));
         }
         staffList.add(user);
         } catch (SQLException ex) {
             throw ex;
         }
 
         return staffList;
     }
 
     public void updateOwnUser(User user) {
         try {
             String insertSQL = "UPDATE " + tableName + " SET USER_NAME=?, USER_EMAIL=?, USER_PHONE=?, USER_HBD=?, USER_PWD=?, USER_PERMISSION=? WHERE USER_ID=?";
             stmt = conn.prepareStatement(insertSQL);
             stmt.setString(1, user.getName());
             stmt.setString(2, user.getEmail());
             stmt.setString(3, user.getPhone());
             stmt.setString(4, user.getHbd());
             stmt.setString(5, user.getPwd());
             stmt.setString(7, user.getId());
 
             stmt.executeUpdate();
         } catch (SQLException ex) {
 
         }
     }
 
     public void updateUser(User user) {
         try {
             String insertSQL = "UPDATE " + tableName + " SET USER_NAME=?, USER_EMAIL=?, USER_PHONE=?, USER_HBD=?, USER_PWD=?, USER_PERMISSION=? WHERE USER_ID=?";
             stmt = conn.prepareStatement(insertSQL);
             stmt.setString(1, user.getName());
             stmt.setString(2, user.getEmail());
             stmt.setString(3, user.getPhone());
             stmt.setString(4, user.getHbd());
             stmt.setString(5, user.getPwd());
             stmt.setString(6, String.valueOf(user.getPermission()));
             stmt.setString(7, user.getId());
 
             stmt.executeUpdate();
         } catch (SQLException ex) {
 
         }
     }
 
     public void editUser(User user) {
         try {
             String insertSQL = "UPDATE " + tableName + " SET USER_NAME=?, USER_EMAIL=?, USER_PHONE=?, USER_HBD=?, USER_PWD=?, USER_PERMISSION=?, USER_FAIL_COUNT=?, USER_BLOCK=?, USER_PWD_RESET_TOKEN=?, USER_TOKEN_EXPIRATION_DATE=? WHERE USER_ID=?";
             stmt = conn.prepareStatement(insertSQL);
             stmt.setString(1, user.getName());
             stmt.setString(2, user.getEmail());
             stmt.setString(3, user.getPhone());
             stmt.setString(4, user.getHbd());
             stmt.setString(5, user.getPwd());
             stmt.setString(6, String.valueOf(user.getPermission()));
             stmt.setString(7, String.valueOf(user.getFailCount()));
             stmt.setString(8, String.valueOf(user.getBlock()));
             stmt.setString(9, String.valueOf(user.getToken()));
             stmt.setString(10, String.valueOf(user.getTokenDate()));
             stmt.setString(12, user.getId());
 
             stmt.executeUpdate();
         } catch (SQLException ex) {
 
         }
     }
 
 
 }