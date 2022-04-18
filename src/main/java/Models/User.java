package Models;

public class User {
    private Integer id;
    private String username;
    private String email;
    private String password;
    private String img;

    public User(){}

    public User(Integer id, String username, String email, String password, String img) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.img = img;
    }

    public User(String username, String email, String password) {
        this.username = username;
        this.email = email;
        setPassword(password);
    }

    public long getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
