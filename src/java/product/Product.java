package product;
import javax.swing.*;
import java.awt.*;
import java.util.*;

public class Product {

    private String productID;
    private String productName;
    private int quantity;
    private static int totalProductCount;

    public Product() throws QuantityOutOfRangeException {

        try {
            if (totalProductCount < 10) {
                productID = "P00" + totalProductCount;
            } else if (totalProductCount >= 10) {
                productID = "P0" + totalProductCount;
            } else if (totalProductCount >= 100) {
                productID = "P" + totalProductCount;
            } else {
                throw new QuantityOutOfRangeException("Quantity out of range");
            }
        } catch (QuantityOutOfRangeException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }

        productName = new String();
        quantity = 0;
        totalProductCount++;
    }

    public String getProductName() {
        return this.productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
