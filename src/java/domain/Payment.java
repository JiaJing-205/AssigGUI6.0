package domain;

import cart.Cart;
import da.OrderDA;
import da.PaymentDA;
import java.io.Serializable;
import java.sql.Date;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Payment implements Serializable {

    private String paymentID = "";
    private String userID = "";
    private double totalPrice = 0;
    private String paymentMethod = "";
    private String paymentStatus = "";
    private String paymentDate = "";
    private List<Order> orders;

    //Added by Yizhe
    private static int paymentIDCount = 1;

    public Payment() {

        this.userID = "";
        this.totalPrice = 0.0;
    }

    // CREATE USER
    public Payment(String paymentID, String userID, double totalPrice, String paymentMethod, String paymentStatus, String paymentDate) {
        this.paymentID = paymentID;
        this.userID = userID;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.paymentDate = paymentDate;
        this.orders = new ArrayList<>(); // Initialize orders list
    }

    // GETTER & SETTER
    public String getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(String paymentID) {
        this.paymentID = paymentID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public static int getPaymentIDCount() {
        return paymentIDCount;
    }

    public static void setPaymentIDCount(int paymentIDCount) {
        Payment.paymentIDCount = paymentIDCount;
    }

    public Payment initializePayment() {
        String paymentID = "";
        PaymentDA paymentDA = new PaymentDA();
        ResultSet paymentRs = paymentDA.getRecordResultSet();

        //Auto assign paymentID
        int dbPaymentCount = 0;

        try {
            while (paymentRs.next()) {
                dbPaymentCount++;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        //Initialize count
        if (dbPaymentCount != 0) {
            paymentIDCount = dbPaymentCount;
        }
        
        if (paymentIDCount < 10) {
            paymentID = "P00" + paymentIDCount;
        } else if (paymentIDCount < 100) {
            paymentID = "P0" + paymentIDCount;
        } else {
            paymentID = "P" + paymentIDCount;
        }
        paymentIDCount++;

        Payment payment = new Payment();
        payment.setPaymentID(paymentID);

        return payment;
    }

    public void finalizePayment(String paymentID, List<Order> orders, String userId) {
        double totalPrice = 0.0;
        String paymentMethod = null;
        String paymentStatus = "Pending";
        String paymentDate = null;
        
        if (userId == null || userId.equals("")) {
            userId = "Guest";
        }
        
        //Loop through order list and get total price
        for (int i = 0; i < orders.size(); i++) {
            totalPrice += orders.get(i).getPrice();
        }

        Payment payment = new Payment();
        payment.setPaymentID(paymentID);
        payment.setOrders(orders);
        payment.setTotalPrice(totalPrice);
        payment.setPaymentMethod(paymentMethod);
        payment.setPaymentStatus(paymentStatus);
        payment.setPaymentDate(paymentDate);
        payment.setUserID(userId);

        //Add payment record into database
        PaymentDA paymentDA = new PaymentDA();
        paymentDA.createRecord(payment);
    }
    
    public static void main(String args[]) {
        Order order = new Order();
        OrderDA orderDA = new OrderDA();
        List<Order> orderList = new ArrayList<>();
        
        order = orderDA.retrieveRecord("O001");
        
        orderList.add(order);
        
        Payment payment1 = new Payment();
        payment1 = payment1.initializePayment();
        //payment1.finalizePayment(payment1.getPaymentID(), orderList);
    }
}
