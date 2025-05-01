package cart;

import item.ItemDA;
import item.Item;
import java.sql.ResultSet;

public class CartItem extends Item {

    private int quantity;
    private String userId;

    public CartItem() {
        super();
        this.quantity = 1;
        this.userId = "";
    }

    public CartItem(String itemID, String itemName, String itemCategory, double itemPrice, int stock, int quantity, String userId) {
        super(itemID, itemName, itemCategory, itemPrice, stock);
        this.quantity = quantity;
        this.userId = userId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public CartItem generateCartItem(String itemId, int quantity, String userId) {
        CartItem cartItem = new CartItem();
        ItemDA itemDa;
        ResultSet itemRs;

        //Retrieve item details from item database
        try {
            itemDa = new ItemDA();
            itemRs = itemDa.retrieveRecord();

            while (itemRs.next()) {
                if (itemRs.getString("ITEMID").equals(itemId)) {
                    cartItem.setID(itemId);
                    cartItem.setName(itemRs.getString("ITEMNAME"));
                    cartItem.setCategory(itemRs.getString("ITEMCATEGORY"));
                    cartItem.setPrice(itemRs.getDouble("ITEMPRICE"));
                    cartItem.setStock(itemRs.getInt("STOCK"));
                    cartItem.setQuantity(quantity);
                    
                    //Prevent null or empty value in database
                    if (userId == null || userId.equals("")) {
                        userId = "Guest";
                    }
                    cartItem.setUserId(userId);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        return cartItem;
    }
    
    public static void main(String args[]) {
        
    }
}
