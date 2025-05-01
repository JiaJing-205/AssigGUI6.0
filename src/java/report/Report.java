package report;

public class Report {
    private String itemID;
    private String itemName;
    private int totalQuantity;
    private double itemPrice;
    private double totalSales;
    private String itemCategory;

    // Constructor
    //for everything else
    public Report(String itemID, String itemName, String itemCategory, double itemPrice, int totalQuantity, double totalSales) {
        this.itemID = itemID;
        this.itemName = itemName;
        this.itemCategory = itemCategory;
        this.itemPrice = itemPrice;
        this.totalQuantity = totalQuantity;
        this.totalSales = totalSales;
    }
    //for category report
    public Report(String itemCategory, int totalQuantity, double totalSales) {
        this.itemCategory = itemCategory;
        this.totalQuantity = totalQuantity;
        this.totalSales = totalSales;
    }
    
    // Getters
    public String getItemID() {
        return itemID;
    }

    public String getItemName() {
        return itemName;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }
    
    public double getItemPrice() { 
        return itemPrice; 
    
    }
    public double getTotalSales() {
        return totalSales; 
    }
    
    public String getItemCategory() {
        return itemCategory; 
    }
    
}