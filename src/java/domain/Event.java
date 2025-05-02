package domain;

import java.io.Serializable;

public class Event implements Serializable {
    private int eventId;
    private String title;
    private String date;
    private String description;
    private String imageFileName;

    public Event() {
    }

    public Event(int eventId, String title, String date, String description, String imageFileName) {
        this.eventId = eventId;
        this.title = title;
        this.date = date;
        this.description = description;
        this.imageFileName = imageFileName;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageFileName() {
        return imageFileName;
    }

    public void setImageFileName(String imageFileName) {
        this.imageFileName = imageFileName;
    }
}
