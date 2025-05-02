package cart;

import item.Item;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<CartItem> cartItems;
    private String userId;

    public Cart() {
    }

    public Cart(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public void addToCart(CartItem cartItem) {
        //Loop through cart database
        CartDa cartDa = new CartDa();
        ResultSet cartRs = cartDa.retrieveRecord();
        Item item = new Item();

        //Check if item exist in cart
        boolean itemFound = false;
        try {
            while (cartRs.next()) {
                if (cartRs.getString("ITEMID").equals(cartItem.getID()) && cartRs.getString("USER_ID").equals(cartItem.getUserId())) {
                    int newQuantity = cartRs.getInt("QUANTITY") + cartItem.getQuantity();
                    cartItem.setQuantity(newQuantity);
                    cartDa.updateRecord(cartItem);
                    itemFound = true;
                }
            }
            if (itemFound == false) {
                cartDa.addRecord(cartItem);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public Cart generateCart() {
        //Get item details from cart database
        CartDa cartDa = new CartDa();
        ResultSet cartRs = cartDa.retrieveRecord();
        List<CartItem> cartItems = new ArrayList<CartItem>();
        CartItem cartItem;

        //Loop through cart database
        try {
            while (cartRs.next()) {
                cartItem = new CartItem();
                cartItem.setID(cartRs.getString("ITEMID"));
                cartItem.setName(cartRs.getString("ITEMNAME"));
                cartItem.setCategory(cartRs.getString("ITEMCATEGORY"));
                cartItem.setPrice(cartRs.getDouble("ITEMPRICE"));
                cartItem.setQuantity(cartRs.getInt("QUANTITY"));
                cartItem.setUserId(cartRs.getString("USER_ID"));
                cartItems.add(cartItem);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        //Add item list into cart
        Cart cart = new Cart(cartItems);
        return cart;
    }

    public void deleteCartItem(String itemId, String userId) {
        CartDa cartDa = new CartDa();
        ResultSet cartRs = cartDa.retrieveRecord();
        Item item = new Item();

        //Prevent null or empty value in database
        if (userId == null || userId.equals("")) {
            userId = "Guest";
        }

        try {
            while (cartRs.next()) {
                if (cartRs.getString("ITEMID").equals(itemId) && cartRs.getString("USER_ID").equals(userId)) {
                    cartDa.deleteRecord(itemId, userId);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateCartItem(int quantity, String itemId, String userId) {
        CartDa cartDa = new CartDa();
        CartItem cartItem = new CartItem();
        ResultSet cartRs = cartDa.retrieveRecord();
        Item item = new Item();

        //Prevent null or empty value in database
        if (userId == null || userId.equals("")) {
            userId = "Guest";
        }

        try {
            if (quantity > 0) {
                while (cartRs.next()) {
                    if (cartRs.getString("ITEMID").equals(itemId) && cartRs.getString("USER_ID").equals(userId)) {
                        cartItem.setID(cartRs.getString("ITEMID"));
                        cartItem.setName(cartRs.getString("ITEMNAME"));
                        cartItem.setCategory(cartRs.getString("ITEMCATEGORY"));
                        cartItem.setPrice(cartRs.getDouble("ITEMPRICE"));
                        cartItem.setQuantity(quantity);
                        cartItem.setUserId(userId);

                    }
                }
            }
            cartDa.updateRecord(cartItem);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    public void deleteAllCartItem() {
        CartDa cartDa = new CartDa();
        cartDa.deleteAllRecord();
    }

    public static void main(String args[]) {
        CartDa cartDa = new CartDa();
        ResultSet cartRs = cartDa.retrieveRecord();
        try {
            while (cartRs.next()) {
                System.out.println(cartRs.getString("USER_ID"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }
}
