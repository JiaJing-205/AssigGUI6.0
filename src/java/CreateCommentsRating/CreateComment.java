package CreateCommentsRating;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
<<<<<<< Updated upstream
<<<<<<< Updated upstream
@Table(name = "COMMENTS") // Make sure this matches your actual table name
public class CreateComment implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "USERNAME", nullable = false)
    private String username;

    @Column(name = "COMMENT", columnDefinition = "TEXT")
    private String comment;

    @Column(name = "RATING")
    private int rating;

    @Column(name = "CREATED_AT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;


    public CreateComment() {
        this.createdAt = new Date(); // Auto-set creation time
    }

    public CreateComment(String username, String comment, int rating) {
=======
=======
>>>>>>> Stashed changes
@Table(name = "comments")
public class CreateComment implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false, length = 50)
    private String username;
    
    @Column(nullable = false, length = 1000)
    private String comment;
    
    @Column(nullable = false)
    private short rating;
    
    @Column(name = "created_at", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt = new Date();

    public CreateComment() {
        this.createdAt = new Date();
    }

    public CreateComment(String username, String comment, short rating) {
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
        this.username = username;
        this.comment = comment;
        this.rating = rating;
        this.createdAt = new Date();
    }

    public Long getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
<<<<<<< Updated upstream
<<<<<<< Updated upstream
        this.rating = rating;
=======
        this.rating = (short) rating;
>>>>>>> Stashed changes
=======
        this.rating = (short) rating;
>>>>>>> Stashed changes
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    // toString() for debugging
    @Override
    public String toString() {
        return "CreateComment{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", comment='" + comment + '\'' +
                ", rating=" + rating +
                ", createdAt=" + createdAt +
                '}';
    }
}