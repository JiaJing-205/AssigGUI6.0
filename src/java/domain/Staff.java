package domain;

import java.util.UUID;

public class Staff {

    private int id;
    private String permission_key;
    private String user_id;

    public Staff() {
        this.id = 0;
        this.permission_key = null;
        this.user_id = null;
    }
    //CREATE RECORD
    public Staff(String user_id) {
        this.id = 0;
        this.permission_key = permission_key_generation();
        this.user_id = user_id;
    }
    // LOAD RECORDS
    public Staff(int id, String permission_key, String user_id) {
        this.id = id;
        this.permission_key = permission_key;
        this.user_id = user_id;
    }
    
    private String permission_key_generation() {
        return UUID.randomUUID().toString();
    }

    //GETTER & SETTER
    public int getId() {
        return id;
    }

    public String getPermission_key() {
        return permission_key;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPermission_key(String permission_key) {
        this.permission_key = permission_key;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
}
