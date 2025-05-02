package item;

import java.io.Serializable;
import java.sql.ResultSet;

public class Item implements Serializable {
    private String itemID;
    private String itemName;
    private String itemCategory;
    private double itemPrice;
    private int stock;

    public Item() {
    }

    public Item(String itemID) {
        this.itemID = itemID;
    }

    public Item(String itemID, String itemName, String itemCategory, double itemPrice, int stock) {
        this.itemID = itemID;
        this.itemName = itemName;
        this.itemCategory = itemCategory;
        this.itemPrice = itemPrice;
        this.stock = stock;
    }

    public String getID() {
        return itemID;
    }

    public void setID(String itemID) {
        this.itemID = itemID;
    }

    public String getName() {
        return itemName;
    }

    public void setName(String itemName) {
        this.itemName = itemName;
    }

    public String getCategory() {
        return itemCategory;
    }

    public void setCategory(String itemCategory) {
        this.itemCategory = itemCategory;
    }

    public double getPrice() {
        return itemPrice;
    }

    public void setPrice(double itemPrice) {
        this.itemPrice = itemPrice;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
    //Added by Yizhe
    public int retrieveStockFromRecord(String itemId) {
        ItemDA itemDa;
        ResultSet itemRs;
        int itemStock = 0;
        try {
            itemDa = new ItemDA();
            itemRs = itemDa.retrieveRecord();
            
            //Loop through database to find match item
            while (itemRs.next()) {
                if (itemRs.getString("ITEMID").equals(itemId)) {
                    itemStock = itemRs.getInt("STOCK");
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return itemStock;
    }
    
    //Added by Yizhe
    public void reduceItemStock(String itemId, int itemQuantity) {
        Item item = new Item();
        int oldStock = item.retrieveStockFromRecord(itemId);
        int newStock = oldStock - itemQuantity;
        
        //Update database
        ItemDA itemDa;
        ResultSet itemRs;
        try {
            itemDa = new ItemDA();
            itemRs = itemDa.retrieveRecord();
            while (itemRs.next()) {
                if (itemRs.getString("ITEMID").equals(itemId)) {
                    item.setID(itemId);
                    item.setName(itemRs.getString("ITEMNAME"));
                    item.setCategory(itemRs.getString("ITEMCATEGORY"));
                    item.setPrice(itemRs.getDouble("ITEMPRICE"));
                    item.setStock(newStock);
                }
            }
            itemDa.editRecord(item);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void revertStock(String itemId, int itemQuantity) {
        Item item = new Item();
        int oldStock = item.retrieveStockFromRecord(itemId);
        int newStock = oldStock + itemQuantity;
        
        //Update database
        ItemDA itemDa;
        ResultSet itemRs;
        try {
            itemDa = new ItemDA();
            itemRs = itemDa.retrieveRecord();
            while (itemRs.next()) {
                if (itemRs.getString("ITEMID").equals(itemId)) {
                    item.setID(itemId);
                    item.setName(itemRs.getString("ITEMNAME"));
                    item.setCategory(itemRs.getString("ITEMCATEGORY"));
                    item.setPrice(itemRs.getDouble("ITEMPRICE"));
                    item.setStock(newStock);
                }
            }
            itemDa.editRecord(item);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public String toString() {
        return String.format("%s %s %s %.2f %d", itemID, itemName, itemCategory, itemPrice, stock);
    }
    
    public static void main(String args[]) {
        Item item = new Item();
    }
}
