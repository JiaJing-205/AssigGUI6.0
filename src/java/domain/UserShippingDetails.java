package domain;

public class UserShippingDetails {
    private String userId;
    private String address;
    private String city;
    private String zipCode;
    private String state;

    public UserShippingDetails() {
    }

    public UserShippingDetails(String userId, String address, String city, String zipCode, String state) {
        this.userId = userId;
        this.address = address;
        this.city = city;
        this.zipCode = zipCode;
        this.state = state;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
