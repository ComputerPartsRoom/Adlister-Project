package Models;

public class Post {
    private long id;
    private long user_id;
    private String title;
    private String content;
    private long cat_id;

    public Post(long id, long user_id, String title, String content, long cat_id) {
        this.id = id;
        this.user_id = user_id;
        this.title = title;
        this.content = content;
        this.cat_id = cat_id;
    }


//    public Post(long id, long user_id, String title, String content) {
//        this.id = id;
//        this.user_id = user_id;
//        this.title = title;
//        this.content = content;
//    }

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
}