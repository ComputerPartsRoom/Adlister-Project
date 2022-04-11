package Models;

public class Post {
    private long id;
    private long user_id;
    private String title;
    private String content;
    private Integer price;
    private long cat_id;
    private String img;

    public Post(){}


    public Post(long id, long user_id, String title, String content, Integer price, long cat_id, String img) {
        this.id = id;
        this.user_id = user_id;
        this.title = title;
        this.content = content;
        this.price = price;
        this.cat_id = cat_id;
        this.img = img;
    }


// Getters and Setters
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public long getCat_id() {
        return cat_id;
    }

    public void setCat_id(long cat_id) {
        this.cat_id = cat_id;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }
}