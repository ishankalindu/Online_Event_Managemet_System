package event.Notification;

public class Notification {
    private int id;
    private String type;
    private String description;
    private String imagePath;

    public Notification(int id, String type, String description, String imagePath) {
        this.id = id;
        this.type = type;
        this.description = description;
        this.imagePath = imagePath;
    }

    public int getId() {
        return id;
    }

    public String getType() {
        return type;
    }

    public String getDescription() {
        return description;
    }

    public String getImagePath() {
        return imagePath;
    }

    // Setters for update functionality
    public void setType(String type) {
        this.type = type;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}
