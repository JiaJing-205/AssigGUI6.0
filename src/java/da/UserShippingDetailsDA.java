package da;

import domain.UserShippingDetails;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserShippingDetailsDA {

    private String host = "jdbc:derby://localhost:1527/Assignment";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "USERSHIPPINGDETAILS";
    private Connection conn;
    private PreparedStatement preparedStmt;

    public void createConnection() {
        try {
            conn = DriverManager.getConnection(host, user, password);
            System.out.println("TRACE: Connection established.");
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public UserShippingDetailsDA() {
        createConnection();
    }

    public UserShippingDetails retrieveRecord(String userId) {
        UserShippingDetails userShippingDetails = new UserShippingDetails();

        try {
            String retrieveStr = "SELECT * FROM " + tableName + " WHERE USERID = ?";
            preparedStmt = conn.prepareStatement(retrieveStr);
            preparedStmt.setString(1, userId);
            ResultSet rs = preparedStmt.executeQuery();
            System.out.println("TRACE: Record retrieved.");

            //Return as a string
            while (rs.next()) {
                if (rs.getString("USERID").equals(userId)) {
                    userShippingDetails.setUserId(userId);
                    userShippingDetails.setAddress(rs.getString("ADDRESS"));
                    userShippingDetails.setZipCode(rs.getString("ZIPCODE"));
                    userShippingDetails.setCity(rs.getString("CITY"));
                    userShippingDetails.setState(rs.getString("STATE"));
                }
            }
            
            return userShippingDetails;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public boolean doesShippingRecordExist(String userId) {
    try {
        String query = "SELECT 1 FROM " + tableName + " WHERE USERID = ?";
        preparedStmt = conn.prepareStatement(query);
        preparedStmt.setString(1, userId);
        ResultSet rs = preparedStmt.executeQuery();

        if (rs.next()) {
            System.out.println("TRACE: Shipping record exists for USERID = " + userId);
            return true;
        } else {
            System.out.println("TRACE: No shipping record found for USERID = " + userId);
            return false;
        }

    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return false;
}

    public void createShippingRecord(UserShippingDetails details) {
        try {
            String insertSQL = "INSERT INTO " + tableName + " (USERID, ADDRESS, ZIPCODE, CITY, STATE) VALUES (?, ?, ?, ?, ?)";
            preparedStmt = conn.prepareStatement(insertSQL);
            preparedStmt.setString(1, details.getUserId());
            preparedStmt.setString(2, details.getAddress());
            preparedStmt.setString(3, details.getZipCode());
            preparedStmt.setString(4, details.getCity());
            preparedStmt.setString(5, details.getState());
            preparedStmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateShippingRecord(UserShippingDetails userShippingDetails) {
        try {
            String updateSQL = "UPDATE " + tableName + " SET ADDRESS = ?, ZIPCODE = ?, CITY = ?, STATE = ? WHERE USERID = ?";
            preparedStmt = conn.prepareStatement(updateSQL);
            preparedStmt.setString(1, userShippingDetails.getAddress());
            preparedStmt.setString(2, userShippingDetails.getZipCode());
            preparedStmt.setString(3, userShippingDetails.getCity());
            preparedStmt.setString(4, userShippingDetails.getState());
            preparedStmt.setString(5, userShippingDetails.getUserId());

            int rowsUpdated = preparedStmt.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("TRACE: Shipping record updated successfully.");
            } else {
                System.out.println("TRACE: No shipping record found for update.");
            }
        } catch (SQLException ex) {
            System.out.println("Update Problem");
            ex.printStackTrace();
        }
    }

    public static void main(String args[]) {
        UserShippingDetailsDA da = new UserShippingDetailsDA();
    }
}
