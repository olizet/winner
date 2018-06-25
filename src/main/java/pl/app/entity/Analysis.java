package pl.app.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="analysis")
public class Analysis {
    @Id
    @GeneratedValue
    private Long id;
    private String title;
    private String fixture;
    @NotBlank
    @NotNull
    private String result;
    @ManyToOne
    private User owner;
    @Column(columnDefinition = "TEXT")
    private String description;
    @OneToMany(mappedBy = "analysis",cascade = CascadeType.ALL)
    private List<Comment> comments = new ArrayList<>();
    private Double rating;
    private Date created = new Date();
    @DecimalMax("500.0") @DecimalMin("0.0")
    private Double odds;

    public Double getOdds() {
        return odds;
    }

    public void setOdds(Double odds) {
        this.odds = odds;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFixture() {
        return fixture;
    }

    public void setFixture(String fixture) {
        this.fixture = fixture;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
    }
}
