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

    public static void main(String args[]) {
        UserShippingDetailsDA da = new UserShippingDetailsDA();
    }
}
