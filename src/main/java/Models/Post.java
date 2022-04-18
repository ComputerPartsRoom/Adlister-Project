package Models;

public class Post {
    private long id;
    private long user_id;
    private String title;
    private String content;
    private Integer price;
    private long cat_id;
    private String img;
    private String name;
    private String username;

    public Post(){}

    public Post(long id){
        this.id = id;
    }


    public Post(long user_id, String title, String content, Integer price, String img, Long cat_id, String username) {
        this.user_id = user_id;
        this.title = title;
        this.content = content;
        this.price = price;
//        this.cat_id = cat_id;
        this.img = img;
        this.cat_id = cat_id;
        this.username =username;

    } //delete or update or pull one constructor [keep the Post.id in there]

//    public Post(long id, long user_id, String title, String content, Integer price, long cat_id, String img, String name) {
//        this.id = id;
//        this.user_id = user_id;
//        this.title = title;
//        this.content = content;
//        this.price = price;
//        this.cat_id = cat_id;
//        this.img = img;
//        this.name = name;
//    } //delete or update or pull one constructor [keep the Post.id in there]

    public Post(long id, long user_id, String title, String content, Integer price, long cat_id, String img, String name, String username) {
        this.id = id;
        this.user_id = user_id;
        this.title = title;
        this.content = content;
        this.price = price;
        this.cat_id = cat_id;
        this.img = img;
        this.name = name;
        this.username = username;
    } //delete or update or pull one constructor [keep the Post.id in there]

    public Post(long user_id, String title, String content, Integer price, long cat_id, String img, String name, String username) {
        this.user_id = user_id;
        this.title = title;
        this.content = content;
        this.price = price;
        this.cat_id = cat_id;
        this.img = img;
        this.name = name;
        this.username = username;
    } //'C' constructor [make a new entity w/o the Post.id]

//    public Post(long id, String title, String content, Integer price, Integer cat_id, String img) {
//        this.id = id;
//        this.title = title;
//        this.content = content;
//        this.price = price;
//        this.cat_id = cat_id;
//        this.img = img;
//    }




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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}