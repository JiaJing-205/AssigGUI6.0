package domain;

import cart.Cart;
import cart.CartItem;
import da.OrderDA;
import item.Item;
import java.io.Serializable;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Order implements Serializable {

    private String orderID = "";
    private String paymentID = "";
    private String itemID = "";
    private int quantity = 0;
    private double price = 0;
    private String orderDate = "";

    //Added by Yizhe
    private static int orderIDCount = 1;

    public Order() {
    }

    // CREATE USER
    public Order(String orderID, String paymentID, String itemID, int quantity, double price, String orderDate) {
        this.orderID = orderID;
        this.paymentID = paymentID;
        this.itemID = itemID;
        this.quantity = quantity;
        this.price = price;
        this.orderDate = orderDate;
    }

    // GETTER & SETTER
    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(String paymentID) {
        this.paymentID = paymentID;
    }

    public String getItemID() {
        return itemID;
    }

    public void setItemID(String itemID) {
        this.itemID = itemID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public int getOrderIDCount() {
        return orderIDCount;
    }

    public void setOrderIDCount(int orderIDCount) {
        this.orderIDCount = orderIDCount;
    }

    public Order createOrder(CartItem cartItem, String paymentID) {
        String orderID = "";
        Item item = new Item();
        OrderDA orderDA = new OrderDA();
        ResultSet orderRs = orderDA.getRecordResultSet();

        //Auto assign orderID
        int dbOrderCount = 0;

        try {
            while (orderRs.next()) {
                dbOrderCount++;
            }
            orderIDCount = dbOrderCount + 1;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        if (orderIDCount < 10) {
            orderID = "O00" + orderIDCount;
        } else if (orderIDCount < 100) {
            orderID = "O0" + orderIDCount;
        } else {
            orderID = "O" + orderIDCount;
        }

        Order order = new Order();
        order.setOrderID(orderID);
        order.setItemID(cartItem.getID());
        order.setQuantity(cartItem.getQuantity());
        order.setPrice((cartItem.getPrice() * cartItem.getQuantity()));
        order.setOrderDate(LocalDate.now().toString());
        order.setPaymentID(paymentID);
        item.reduceItemStock(order.getItemID(), order.getQuantity());

        //Add order into order database
        orderDA.createRecord(order);
        return order;
    }

    public static void main(String args[]) {
        Order order = new Order();
        Cart cart = new Cart();
        cart = cart.generateCart();

        for (int i = 0; i < cart.getCartItems().size(); i++) {
            order.createOrder(cart.getCartItems().get(i), "P001");
        }
    }

}
